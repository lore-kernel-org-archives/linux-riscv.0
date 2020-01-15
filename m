Return-Path: <SRS0=2VG0=3E=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8534DC33CB1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2020 07:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD6F2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2020 07:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nGJk24Ee";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XAX/WSax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD6F2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZ9Uv0Axx1RVBpC38D2LeKDBlyYIPhsVK6uMDN/OW7Q=; b=nGJk24EeHNRTRGMUKjPmYbY+G
	zmomRpaPuT8qAoJG6sM2c3uYApmZ2JNN8ETo5GpjiCU6aBDhBEVK62saYwUeXSl+UnkiiVoCBrME5
	JneD7xsITSIHL9GdC/UhIfnzOuh+PsEJvNnqpJZ8nMAL7vH4CuSc0ab7UX1dLnT20kH1Niu/OolUx
	HBnu4+BAi0fm8oY06mdBl0e2pUGLDkfWlmG8jDDNrduMNef2uCaZy68cstJjpMTbOWg2vuH91BWul
	M01kApp+KliT2/iynxFdKdC8VIunsda+8isYqWp8TfLBvOzamzwVF+wGgG01n3ZcDhfihXKsXgfHc
	Y2NRVobSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ircld-0003pB-0C; Wed, 15 Jan 2020 07:07:05 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irclb-0003of-4D
 for linux-riscv@lists.infradead.org; Wed, 15 Jan 2020 07:07:04 +0000
Received: by mail-qk1-x744.google.com with SMTP id t129so14726875qke.10
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2020 23:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ9Uv0Axx1RVBpC38D2LeKDBlyYIPhsVK6uMDN/OW7Q=;
 b=XAX/WSaxzB/941V80oBGBxxMlodBtHbxrvOGlO9DNVG8J+KyGY10lcKAeED5bV2DCe
 34fnSbo4MmMTXhxsOVoO/3B5Wb9+cL7nGgptOOI3w97miT0zfJK/M9L8J6h3aMZ1Fbwl
 D6mBRXLOC3blOnjD3+EqB9k95pgtA3UPznpZmIeg8pNoPpVEVWiPo1F9UBxADi1h+FCL
 aMoeUfg2TKbt91L1Tzk0BcSWfSe6+bFrX1egciZDzgNVYJG5LEJTHS4lH35FxoJZgtet
 5NEwv4J9K0/fN9B65fLguTC9Se+zbFiH6RWOsEm7RlIR8aoiQulq0M6ykkERQUJUHkvq
 s/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ9Uv0Axx1RVBpC38D2LeKDBlyYIPhsVK6uMDN/OW7Q=;
 b=Tpu/ZLgn4P/z2TVwu1llhsmlq+5uqeBQHgH4jW1Z3Kf18q6FZisOSJCGu0MjlciIH5
 xREhQX6uEiSgFoLiOTMCrCstOQnUYc/nPEHhUrjcJNvEmJbxFJSSD+6hWph2jXamCniR
 M0gYF4o31N8kf9zAxF+my2k/mAkFbyYMaRl+CqTNO0nFqm+PiflYRFsj2IyngxqYDmt7
 LHfvnStL++AQ36HC8kXAAnB6o9yjvPuDHBqYVUZ7I5wexrmre3LK444TLopZH88mM0ne
 tERHnaarvVsn778OMFkv+WqVFmeJTCwpcROSupFS8vqYnXWi7FSlnSBsTZKeWEeSx02o
 DABQ==
X-Gm-Message-State: APjAAAVAm+Kiuc4VbILzSDgO7nwJGGZGEpaN2ZPocfIEX8mHedxgz5GT
 M1UnPpwXJ78FdXWGzAoS0YM5WuPUHD4GookTHCPyzA==
X-Google-Smtp-Source: APXvYqw/Zownjc6NkgO5O3t4IrOukQsUL9/HApOvE0AT9GibAiPkx2vP0IpC0VfPLNP3pPuE2XgD4eB9VY9GIdwmv90=
X-Received: by 2002:ae9:eb56:: with SMTP id b83mr25434351qkg.123.1579072021933; 
 Tue, 14 Jan 2020 23:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20200109031516.29639-1-greentime.hu@sifive.com>
 <alpine.DEB.2.21.9999.2001091126480.135239@viisi.sifive.com>
 <alpine.DEB.2.21.9999.2001121011100.160130@viisi.sifive.com>
 <CAHCEehKchrwd7TTmSrhtEPeCmkrYrx7TX_c6ogpCpSkCKnBQoQ@mail.gmail.com>
 <alpine.DEB.2.21.9999.2001141449500.21279@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.2001141449500.21279@viisi.sifive.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Wed, 15 Jan 2020 15:06:51 +0800
Message-ID: <CAHCEeh+utXxqF65rtvRJXq6cPDjCcwpAeUaiD1pSpGGMFXRT9Q@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: make sure the cores stay looping in
 .Lsecondary_park
To: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_230703_182266_49003E71 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Andreas Schwab <schwab@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Gt <green.hu@gmail.com>,
 Anup Patel <anup@brainfault.org>, greentime@kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 6:55 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Hi Greentime,
>
> On Tue, 14 Jan 2020, Greentime Hu wrote:
>
> > I think it is because the sections are too far for bqeu to jump and
> > the config I used just small enough for it to jump so I didn't see
> > this bug. Sorry about that.
>
> No problem.
>
> > I tried this fix to boot in Unleashed board.
> >
> >  #ifdef CONFIG_SMP
> >         li t0, CONFIG_NR_CPUS
> > -       bgeu a0, t0, .Lsecondary_park
> > +       blt a0, t0, .Lgood_cores
> > +       tail .Lsecondary_park
> > +.Lgood_cores:
> >  #endif
>
> Looks reasonable to me.  Care to update and repost the patch?

Yes, Paul. I have sent the v4 patch.
It is tested in Unleashed board.

