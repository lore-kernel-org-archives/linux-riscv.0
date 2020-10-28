Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F03C388F7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 08:48:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDD824679
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 08:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u84egzHm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpBtqikV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDD824679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ogKQTmFBxj9XC/mxNH+szT+0tRcHpWeCBKM69rnFBek=; b=u84egzHmvG1QZuxNFwRjeCr6Z
	iBMCE1gOUcBhR2Y+okX8zp2Y7qOmygzXF1qZhnXffhgbbFIh24/gOVP225t7sqJuX2QGQomgFIW5M
	mNq38MoHZW4YFKljXor4GM3d/mNmAKYJbxcgSdu3OcQgmy2l88kB6q20Cww8/xONs3dvsYvs67yvv
	Tdim35SlcWoJnBliZfEA8qQzhU7LClz8XAa2T1nLqD0y72TpRNIst9SjFsFtW3a6v64kxV0HMBXEy
	hrBgnjREGRv/9uuNlZp6lvr6QPeKRaeN62XwGjO9CpfSz+/fvuaSKHHRpWfc20ev/HKHVeudCxnCe
	ryvavc1RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXh8A-0004I2-Na; Wed, 28 Oct 2020 08:48:30 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXh88-0004GQ-3M
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 08:48:28 +0000
Received: by mail-lj1-x244.google.com with SMTP id x16so5195080ljh.2
 for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2020 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2WKLftJJenvkWLbuA7RR3fMOHr3zgEJcb06FkxnP04=;
 b=VpBtqikVjiD1Q2Vn2C2J8hZPK+mk9ZBpZRURrdqmnf3Bi6CKfsAjOt4auMcuEDdZc9
 DwcKfQ+1gPJXSf7R0lzQ5ptXmLQYLxKB+TvtQL65tPbH4JPl8icZ76lcNNSNjxAB6O3Q
 0ETOWpJXcwwg3oPwJhpcl3vGyrDZqQCgOHBpvImh2G1luPZObFhQYJT7yRagBiipSgag
 ZH/XG5epZqGzPz136TkjrqWVdq1ca6qfbASWmNu8IjwXhx5A/2XiNsG1BEN8n6yiX38o
 9mqsrkGlUlWCnxZFkp9PsqdD1cXhUOKHTaSV5Q650Wvej5vskEHrXB07FH9OAO4BaGRC
 a6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2WKLftJJenvkWLbuA7RR3fMOHr3zgEJcb06FkxnP04=;
 b=SxWhggxjAFB3RbuQQEmW4nxgtcwCRNBPyOTHsJQ/et+XaWeLEcqLxXK1Oaifu2IeYn
 3tWCmOaU9GPNd5t6lHk8eNT6UHQy9K/KlHvVIklW9UtuiOWAlIVTEOrtpGA1CHWE18vB
 DMx5k4gwfP7Ir9MEY7/2nEOxHrqodCSrvQd5aD8ZZjCLOr4B0K6L5TmkzGroGhwIhwyx
 mEguofABQrfjiTLm1rrCm3HfkRwxwAqi9EdrNRKLF2YY+JNzYE1qH864mEGojgk6p0s+
 Vm68b8PJsE/2OY9m2Vv7FjrjK20YWoMbtXdm5hEEl1LGkFtum3vXn/LPat9fDRQajwE1
 wXNg==
X-Gm-Message-State: AOAM5311r0Vyf8mZDDmX8Wd1qneHOs8L126aS6PyB9QkzMMSUUFBIbfu
 LRtMFCs4ML8Rse1I49xWitp0oqsLHemmiNQ/UXtvb3Ma1XQ=
X-Google-Smtp-Source: ABdhPJw/VJE3gnHd+Oce/FsAOHP6REsIEw3IDjQXteoErsSpqmIQrderSvGN6JaJzQUbhcG0q42rwwtrNgq1RlAMeTA=
X-Received: by 2002:a2e:5016:: with SMTP id e22mr2955672ljb.301.1603874905141; 
 Wed, 28 Oct 2020 01:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <1e50d459-efc0-e8ba-bff9-21c981d04554@codethink.co.uk>
In-Reply-To: <1e50d459-efc0-e8ba-bff9-21c981d04554@codethink.co.uk>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 28 Oct 2020 08:47:49 +0000
Message-ID: <CAEn-LToxmqnLWPk+B=+yQnxa0b8OiM-u+=+N5W=qE5fQGUdVyQ@mail.gmail.com>
Subject: Re: Linux kernels for Microchip Polarfire Icicle board
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_044828_187442_026DAA51 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 4:59 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> I have been looking at running a new kernel on a Polarfire icicle board.
> I started with the Yocto from Microchip, but was wondering if there is
> any other work around this, public repositories or anyone else working
> on it who wanted to collaborate.
>
> I would particularly like to get PCIe and USB working.

Microchip is working on upstreaming the driver for quite some time
now. The drivers are posted on relative subsystem mailing-lists.

PCIe latest version: https://www.spinics.net/lists/linux-pci/msg100789.html
Clk latest version: https://www.spinics.net/lists/linux-clk/msg52244.html

I believe the rest was not posted for review yet.

>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
