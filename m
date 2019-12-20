Return-Path: <SRS0=aj0H=2K=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5741DC2D0D2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2019 22:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAF020866
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2019 22:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qxpLT14d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="X/akbPBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAF020866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SxT9S/D7O//cYzKYLsrhvKwwVG4SCgEZz+NAdL3+U5Q=; b=qxpLT14dL6TeUn70oRnTFukcb
	3HaoE4K6X4cF+bUuB7p9JWPhm4DFYULNhFpvBpFs5sXGISkGFSMk3z509d/bL6k+V6kkXlKWPyZPv
	gIW4ABCjCW15iVBLD4OnTCMv2T3/IJO74UHfvw5Ojzus3gLjVFcE1/t1j5/cKQ0kNwJaWRkqoI1zF
	YncLFWK06CB8XnCas0tXul9X8bpbPlopyu3so0FEF7C/9/pfIDW1GZs/EDsODN5tEU6FLo5TtkmfI
	dWi33sn+uAli9Ru3nYXbNpS1nTRaGD/7HjixwBDleDkTTPv/RPyRo5T+lUGXkjK96dRnwi3dyPNzB
	Ia1VAEtwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiQmA-0003YR-Mp; Fri, 20 Dec 2019 22:29:38 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiQm7-0003XY-Fl
 for linux-riscv@lists.infradead.org; Fri, 20 Dec 2019 22:29:36 +0000
Received: by mail-il1-x141.google.com with SMTP id t8so9275948iln.4
 for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2019 14:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxT9S/D7O//cYzKYLsrhvKwwVG4SCgEZz+NAdL3+U5Q=;
 b=X/akbPBWsfdZSp5G+j8P28Aelh08kzfqaYSSeV7+y19Zi1sV/RL/eCdWnV27FHLG2P
 EQRJdTjbSHdcV/ApCLjSWGWjqZvmzYs6dScyi4K4xpQybh/mlAzaWbvhTtb8Ju8a3M++
 qYFouGgxLMhvdLNAM1zSqJpeoY5qcxHAhZuuafFitcFS1pcYJxLy3yfoBN7+IVIjnPAU
 Lo42qgzVk6MKHeoMx/ow0YHO2B+UYq1bf2JWUI9jdIG7IOfnSjZBLEQwE1GpNs8s8IJk
 M+Qn8NlFKu4U+W5/r3EWTzUCZfMmc7HksPCXtYOQWQhp7Ql5z7ZD6Gw/dZBmhwIyPQAm
 L7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxT9S/D7O//cYzKYLsrhvKwwVG4SCgEZz+NAdL3+U5Q=;
 b=Qcc6I4ve7DK6gh6qi0WQxI4Okb01xh0oWEbLY68Bzj99pxiP9hLslAbzfWKwB7BLZU
 SfCp5qaK8JpLyg3Qx3puSPmvBt/oyc17C1QmajuWn/7R+Ep/6JjQn136c3FGfHAQsa1Z
 xogCRNRG9q0TiOnDi/PY7m88nVVn2srq2+bqvP5aRvLMmXLe/T7Ia0MSouOgAV5VpSgh
 G2glzFyZEttK87U02c/4POWF0scFNSq/Ys3utgUWVUUKdX5HL8K4DZj3Pd0p8vUPmQHz
 G2v0ICjreYqB01gQmO3mcgNFM+SLY8QQLOTFah89qXK8UmWJAH9p1ewmtrww2PRaFoYX
 846w==
X-Gm-Message-State: APjAAAXekie//8xaNBKAfsEVhCdEuNFODQHQ7jL1mHSoTPN1p3R0uUTr
 ShPR7DgZDSzBbwClaw6suVGgnWhSG1OgJR0mC9x9aQ==
X-Google-Smtp-Source: APXvYqxLXJqkYvqWBb61uln9iVY4bKA8u4x7YyqWnVhlvxP53ixXA+H6Dubqv63T2mi3IMTN0gxD97MeT3MAXwMVGes=
X-Received: by 2002:a92:afc5:: with SMTP id v66mr13507241ill.123.1576880971835; 
 Fri, 20 Dec 2019 14:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20191217040704.91995-1-olof@lixom.net>
 <alpine.DEB.2.21.9999.1912200302290.3767@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1912200302290.3767@viisi.sifive.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 20 Dec 2019 14:29:20 -0800
Message-ID: <CAOesGMg_VySkckuTfeMWkfcQ6fUBokAQbCGXP9emz9WvtX4fKQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: export flush_icache_all to modules
To: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_142935_528244_85A25C42 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 3:05 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 16 Dec 2019, Olof Johansson wrote:
>
> > This is needed by LKDTM (crash dump test module), it calls
> > flush_icache_range(), which on RISC-V turns into flush_icache_all(). On
> > other architectures, the actual implementation is exported, so follow
> > that precedence and export it here too.
> >
> > Fixes build of CONFIG_LKDTM that fails with:
> > ERROR: "flush_icache_all" [drivers/misc/lkdtm/lkdtm.ko] undefined!
>
> In the past we've resisted doing this; see
>
> https://lore.kernel.org/linux-riscv/20190611134945.GA28532@lst.de/
>
> under the principle that we don't want modules to be able to flush the I$
> directly via this interface.  But maybe, like moving the L2 related code
> out of arch/riscv, we should just do it.

So you are aware that all other architectures that don't have coherent
icache already exports this, right?

Being more puritan on RISC-V buys nothing w.r.t. keeping modules from
doing anything, you'll just end up having to mark a bunch of them
broken on your architecture. :(


-Olof

