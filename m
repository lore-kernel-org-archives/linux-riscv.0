Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A098EC4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:45:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027D52068D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcSTgaO1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWZyJCBR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027D52068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TdBNsWyF/MuBlpaY3rcQ54K8Zgk9JApvdXleGEDqh7c=; b=hcSTgaO10jR2pj2LOihHfGsY+
	+WudAtwPG+J2dl30NcOAL4RtiTazDe6bEq/FfX5+ns8b94POt1jm/nIQAWc/HgyLuB7dYEj0ZKFIv
	sCo44KxdggTJ0MC4z/Qbm5aQen+4WrYM/XpJ5y5XVSc3+2s79IFVyMxXRcUhFWl6W6XUU0WiDI+Gv
	5d4jZL1zbT6k2K8bOzdF4gbmoce3W9tn5RtvQRwNyM9YUUqpT037hyU+pUAYxCQJMpJ717rBxQ+ah
	qR21a/XVniIieaJuyDJyoKMDcwZbcOs0dv1iXp/ZI33WjcQ0QBB0zTjH63YCeg4o76CeyKLE4VMm7
	G6dfsTfJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKEw-0003hG-Bo; Mon, 05 Oct 2020 06:44:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKEt-0003gW-S6
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 06:44:53 +0000
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D16D8206C3
 for <linux-riscv@lists.infradead.org>; Mon,  5 Oct 2020 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601880290;
 bh=wsAVEaV1+h1cDZGoNWJx95GIyKoJhBW7f/aAlsRaZi0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VWZyJCBRBFZJ7yhGKmgGKO5/+cSsWPfAi+4+xKmJHc3C5uDqO+fnlPbSw4Srh61+2
 q6GxGi028H8cL13DW/8Rb2RiJN9kpZbaZQRphYoIEV93YDFHoq7tp6kwGeFGrwMZ9+
 8PMtNYN1p5HRv2oiaaG+ZcFRq5tdHtIEOJ0tod6A=
Received: by mail-oi1-f181.google.com with SMTP id m7so7794564oie.0
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 23:44:50 -0700 (PDT)
X-Gm-Message-State: AOAM5335hOWVqaSioTyNX+ypL/ptDVgw0r/WQNctZDrrlILhAbqtANlE
 fq+blkpnadJRtlCyN+3Uwi5jvYKhZ8AD1pbJZ/4=
X-Google-Smtp-Source: ABdhPJyEZCGyj5e57q59leoKnW6YWhhIYyupKGdmMavLkSJgFy4/I0xNh6NzK3ZRa9LfvAyoGzOKA9XsxaxydYUqh/U=
X-Received: by 2002:aca:d845:: with SMTP id p66mr7393683oig.47.1601880290247; 
 Sun, 04 Oct 2020 23:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201005061918.GB1856@infradead.org>
 <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
 <2588700.mWSkj6HvKX@tauon.chronox.de>
In-Reply-To: <2588700.mWSkj6HvKX@tauon.chronox.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 5 Oct 2020 08:44:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFL4gfrK1+zRG9sajTk62yRh3WzBG46KfKD=iM=VQMTAQ@mail.gmail.com>
Message-ID: <CAMj1kXFL4gfrK1+zRG9sajTk62yRh3WzBG46KfKD=iM=VQMTAQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
To: Stephan Mueller <smueller@chronox.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_024452_198092_2A29DA56 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 at 08:40, Stephan Mueller <smueller@chronox.de> wrote:
>
> Am Montag, 5. Oktober 2020, 08:24:46 CEST schrieb Ard Biesheuvel:
>
> Hi Ard,
>
> > If jitterentropy is a special case, we could put a alternate
> > non-'static inline' version of random_get_entropy() in the core
> > kernel, and only export it if JITTER_ENTROPY is built as a module in
> > the first place. But I'd prefer it if jitterentropy switches to an API
> > that is suitable for driver consumption.
>
> Which API do you have in mind? In user space, I use
> clock_gettime(CLOCK_REALTIME) which also considers the clock source.
>

AFAICT, that call is backed by ktime_get_real_ts64(), which is already
being exported to modules.

Could you please check whether that works for your driver?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
