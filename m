Return-Path: <SRS0=0x0g=7R=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF2BC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2020 14:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D695E207D8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2020 14:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKH8qMBj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUeWwMO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D695E207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yEGs+uGYQcALmyiA0Er3xPg8MnszGo+IJxHoGsVxvqc=; b=AKH8qMBjeMP953hQT1pTGylqz
	dKKaufK0a8jUUeycxusvCSE5vHR6YI4XsZJwkHQeFWQhBMEpdJBG6ro0p6vPtkEz1uaYT2kf8I640
	/T2smKCtcaFM4Q0RDc+Udwp6lQvla7jGZKcf668lQDi0tu0o9C761/gC56z0mQ3oieN2eAItuDsFO
	Js+5acstpA2xaqhgQO6vRPT/ALOxFyeCYRZHsBcazQKvdGNZqk+uRncRP2wxfhbornHv+1G/2k4N7
	vZ0BtzKCQc4m0R/SMMJZ5kayuCaHXiyVU8YWLFfCbumSCls++Ok5u932TFuO7u/vL5c/FdCGGbUmX
	G5bgubtpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgqeA-0008K5-A9; Thu, 04 Jun 2020 14:15:06 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgqe7-0007Pm-6C
 for linux-riscv@lists.infradead.org; Thu, 04 Jun 2020 14:15:04 +0000
Received: by mail-lf1-x144.google.com with SMTP id x27so3680632lfg.9
 for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2020 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yEGs+uGYQcALmyiA0Er3xPg8MnszGo+IJxHoGsVxvqc=;
 b=HUeWwMO7ldREzsGnsSLlg/EFqbD1NZ+9v0xWynHiqNY8ZehdiwssTHcIKNO2S5nOaA
 kSdaask+zZrZLIe3QduJFlwJMNiVVYVRTGijiuyNS7Vugg1UcPlD1tLCtZTrDDvISmx3
 IAw6KOoV9dT+4FQ/3Nuk9vroDYOlYseY0r2E16nxoREGVOcIsET+bAuSGdKB7ZXo50Cx
 2DzuQ0TI01gEApEmHVvgX4/qKnlhSdE7oUm9lVyBVLzqZJKSq7YKynlBen+EFCyKMBE9
 DUqbgZmuVxlah+1QFLQ9FcVjNeGAw4x8f+/6a6m/TlgPO08IWBgUJWX/w18aQt61GM8A
 3doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yEGs+uGYQcALmyiA0Er3xPg8MnszGo+IJxHoGsVxvqc=;
 b=jXo70mYEiMLylalxzoo+59o2rXFrLc1k8iXNO8hZP2X7cKcbSNYLS+esVK5dHTVGUy
 18XBFgqQCbGDo5SmImpg3rB6kHw1PvppsT6ZwGVibRUltKYkycjQorE8uq/RFaq3yIm5
 4YRIvUupCjArI3/oEgTRBExDyR6fCWs9typ7DI+5rqZtiBCsGPnk7wUH3hbWgUv1fRbh
 +QYI+zL/TbrSVNTvP4CrjHUYf/ojuo9LwQmhn3nPJfm6m+3ug7horKgR2KmIOrf5wi39
 PQ1OqEuu/hSO9KhAXqjBHuFTr7sGGVX+Pa++dJu5+kivs+bgFkJ7r+h+x1Z7bk51JUe+
 9T4w==
X-Gm-Message-State: AOAM533hcNIyZL10Yvp1XmAYODxWGZsSoEdeVhsezVJSPGYjzjOsIIPK
 oBu5zNCfUQed4wamdYTfBkvPNQRlQJTV3pGh25k=
X-Google-Smtp-Source: ABdhPJw/w28gg0juDGjAFc7iLnuiJpIX+RILrWUNw44fucbJH7BsISIXNyiW6OQYOcQKpooVoi6d2+4S/CCW4mhueVY=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr2664400lfn.21.1591280100710; 
 Thu, 04 Jun 2020 07:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-42b47524-b185-4972-9889-69f824471fa6@palmerdabbelt-glaptop1>
 <87wo5ct376.fsf@igel.home>
In-Reply-To: <87wo5ct376.fsf@igel.home>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 4 Jun 2020 17:14:24 +0300
Message-ID: <CAEn-LTqs76ofSUfrAWqTRNb8uSkYooZyUorx_=ei5rkHEWy3Dg@mail.gmail.com>
Subject: Re: Crashes with CONFIG_SLAB_FREELIST_RANDOM
To: Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_071503_292800_F64AA307 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Cc: Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, May 16, 2020 at 4:33 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Mai 15 2020, Palmer Dabbelt wrote:
>
> > Sorry, I was trying to ask for a full config.
>
> Oops, sorry.  Here's the full config:
>
> https://github.com/SUSE/kernel-source/blob/master/config/riscv64/default

I see you updated the config for 5.7.0 and
CONFIG_SLAB_FREELIST_RANDOM=y is enabled.

Andreas, do you still see the issue with 5.7.0 kernel and
CONFIG_SLAB_FREELIST_RANDOM=y ?

david

>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

