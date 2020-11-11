Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35F3C4742C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 08:54:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0A320678
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 08:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0zsz1QHt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7+nX1K/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0A320678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pp3SYAjKtWgnZXNBMH+pbMOJ/cxO/T3hwN7I4bNbLmA=; b=0zsz1QHte8AjacuXs4C5lySeE
	68QC8Pi88Ot/9aIEfLHK2yp9MsCK/g1XTHTfZnEeJkgxh9pjiSqWh9lTqDgL9KfTUMBPd59ZlENkh
	Agy0vxl6KYus9bUm/FJ/wwh2Gazz2e7a2/JeL8FNgBR1wwdkkNUMmdY333gMSzEclIN1E4YiTT6A3
	1SKtA/sWa3JoT3Pxzo0Lx/r7mOdnLBdqjjom9OynmbD6GYKEY/fzXtGv4ue8x814BJt9eiwGQp+aj
	PwSqI5rLTykCYOj3VHqWQeGYljx/jyjtuc0aqBVgW+av+3//Dc6+lpVkcuctEKYKZRMGu2IXVMgnd
	76XIacTyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcltm-0002Mv-9T; Wed, 11 Nov 2020 08:54:38 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcltk-0002M8-M7
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 08:54:37 +0000
Received: by mail-lf1-x143.google.com with SMTP id u18so2098294lfd.9
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aD1AfCvZlvWjOPfJpMntzLU6+ypH7NUl69bOZ/Wxqbk=;
 b=s7+nX1K/OJHLO11XMmTdSdA+MQE8moSXpnO9nib5IGF4ObtIqIj+bDP24RgiPQg4zJ
 JSQklC9ZLIebDipupC4wVcr2Yre2xhgXhqJac3EBaQriJsnVTL8tTgmeYoZC6nw0/Nhr
 zTqs6KiSghzwpBXM9YKFkoCS6qJig92khJ7x7Pu/b8mHtmo+vtltnKlu1A4yKz24bB5B
 dRpwSo+LJbckjfCkE7UcbCrJgXgRV4cdSOnOgXDfm5OEVWtTpylqGvYdn/7/kOd+GHL6
 Wg0w6Xf3EA4L6m3Ph7pSvpK2WtcbsGIiSD/0iovJlVvKqHh2diltJIxmGkJ6YEjNds4B
 Dj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aD1AfCvZlvWjOPfJpMntzLU6+ypH7NUl69bOZ/Wxqbk=;
 b=KS3hqQHGCXs0JZyGH/uYg1bJ9V2wCXcz2ibFV/C7LaBf6Pf4n0+VVt3AQZL+DjcsF5
 KkBBRcAL5I8f173vysUEh9e21xTodpmyM4ltbsWzz00jgEiA+dhH2tvmetEh1X7xsayY
 HQeLx020Z6jOa00EwTzWMcYtWfies0ZNj+LoaCcSepfNLO/oSMyzM06NtYw1M+fZaXJh
 lctg/n/vuX24Fx9mmi7O1ZOmrz5+SYM8tpZceDNuO9Kx9jLndhf1chgKdS/hds4IEymh
 FQnLgXh3Rd3k0pjPqCtiYSCI5rGcjOtXCqIojSxI5rbWLiH5G2bKsBl1zuyaFoOulVb1
 c/aw==
X-Gm-Message-State: AOAM530QFMmECr7DXwPOJz4l7F/0UCINKDQwANU6G16+m92kf+Mg6NTj
 CvVLlDLHd6gq9muQ9m7DE/b4/CVrdnByoSRssWTCl76WE1AIXg==
X-Google-Smtp-Source: ABdhPJzSBoQWp9WPLNXo2qnhAfYTqUxCkYyYqcrkPjDDVovOHwT986yuSnhjzGjEskWE8hTdRWErEe1Kl+s2OHZEKwk=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr8747179lfm.333.1605084874837; 
 Wed, 11 Nov 2020 00:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-10-damien.lemoal@wdc.com>
 <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
 <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
In-Reply-To: <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Nov 2020 09:54:24 +0100
Message-ID: <CACRpkdY1sgkhPfb+ci8oXqw0N7Gr+Pr_=3Auh-mH-8yWcOUR=Q@mail.gmail.com>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_035436_733165_286808FA 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 8:00 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> I just realized that I forgot to add a Fixes and CC stable tags. The patch
> should have:
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Cc: stable@vger.kernel.org
>
> Do you want me to resend the patch with the added tags ?

No I just moved the path to the fixes branch and added the tags.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
