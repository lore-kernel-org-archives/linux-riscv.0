Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61572C2D0CD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 11:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juqskeqAoguDZDSfydLaFlxD+cPCIzpx2Yq/QO5u2/Y=; b=M+Ds3Y6c+3utvt
	exmkN7nR9C1rZdMPEqBg78RqRsmfq+D4Ds5TvKSGm3nli9iON/7YIGTgdz66FfZOlQQg0TjgqTzTd
	HTvtsO+E5JZwVjmjr5Fp169iozewbC+9nM50evojs9pprD2+KzPUCLb7gucwxnRaOotwG81aAgEdK
	Dva1VrgdOodJqD0vpTs0ldJ2zHWIfCssZCGeiph75XmfC/+cfoZHeIcAx4pIT4/wCuE3rYpqvwZi+
	yppzikMUc3GVwDiQK9dLGerAW5TLdQqMjVLQ4/caBj2W8SVA6Dz4lJtsNnDhjT+tfv17s7njPo8P0
	iczIsqtomM2ta+In8usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGys0-000000092Am-31Ep;
	Mon, 19 May 2025 11:41:24 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGypf-000000091bX-0PVH
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 11:39:00 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e7b943bcf0cso1180631276.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654738; x=1748259538; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jGbkzJ0eqqimJI7DwVKRZ7T05jAEAZTanGLLnplCIgc=;
        b=TZCNsCUlCVZbTWZ4upuBaOw3MMp5UaePQp63lgKN4Z4W3WSWPP7zsGfEvJ9MHTz8PA
         WsTRa2pnw54H7m9/X/mqIjbTs+zpV6jOhlYzL2D68X+AZ0Nl0Sw2YcFKvMFQGlSjYRuA
         cjgTQDWg+Ss/S72u+XLvTD0zlaolye5wnW08jvbo59YL2UezweT8SlcPUVeqzyYhwZzN
         YJltVA6Fu3ZpvdY2gKRIRmiWe0x+hghJMgk5S+0Y2xgFmwDX43G/QvOvWtLX1xWkh7j9
         VMQwq2KLHDzWC2liS4++62UVp/ktVAFCeSh3SsOXQfgzbOYMGITHp0d2AF8Afyf4nB6x
         nf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654738; x=1748259538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGbkzJ0eqqimJI7DwVKRZ7T05jAEAZTanGLLnplCIgc=;
        b=uVRgK/NRrbQkLh9UTbsmahsyytZw6ew2ffXP/09lKWKe/l5g3N/GChpHv1SFwJcVam
         +bG0cMy19CL9oWJaipYlgJ2q2bGz0J/mmfIQVxLhGcU8xJXIgod82CfwAsnAlStd2PXR
         V/z4fIP5yHfV/SkPT5zTZYIlx+90a28xkZQw0x0IHs7FOQbyzpTY734ug7kfjiobRcKe
         YKBTTdcfHCXMu8PA6Gz0sbHMURKU1SiLYbv+njOS82/rybw0K7YOq28Ytv2Fp+hqCWIh
         wf/eioAEYz1ADuTyqz9wTjBMuV689kyT9twieOSiQCpJgbYKnbzflGMVt7Ut0UfPtVty
         xRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZiV63NUPtM/BF8hvE0t8BJ17DYXA8qTU8J9stJqHmwOn4xOYlJwLWWyEEbsyT8k6mcQjYyxGS/9kqiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5OO13FvQAdSvGRnLKtYocpZ1lJ7WLQV3ScLvGNLwkJs8Invoo
	6F9pBfe9zvTGWYHqJOkbyWhy9AUOgNJd019cIe5zaMJ1SPBfB0VMF/hTIw8s/Q/5EQ4wKd6uo+W
	9KqnziEk0mYMD8M3tK65qmLLgj5eQGC4H59hbruw8pw==
X-Gm-Gg: ASbGnctKBV4FwnI4DCq9Vl/ihKZUwUSlWDSk9zDgloiG0tN1szyV8ghZHBKMQ5DooP+
	xqWGzGlb30ckH3QMrajUEAda3FRRY0R5rDO6OuhecA5Vp+QpqBP7a282e3KRgoJ3ZubJJGYyJN2
	Vs9euDMVSar378l1V9BMMeshfqFEQ8bxo20A==
X-Google-Smtp-Source: AGHT+IGEhk9xvOXamJcUf2c7oYgnHzt7/Q6Jc8A16RlKxL4KhnX0gE0Bk6C5w2N1j0qtNoul2O4nnkYi1A17Lqm3muU=
X-Received: by 2002:a05:6902:1547:b0:e7b:9763:6676 with SMTP id
 3f1490d57ef6-e7b97636a60mr5570580276.17.1747654737919; Mon, 19 May 2025
 04:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org> <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
 <20250512075631-GYA517379@gentoo>
In-Reply-To: <20250512075631-GYA517379@gentoo>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:38:21 +0200
X-Gm-Features: AX0GCFuvP9LYuHS81_oe6T9DU2l0mF54pVYJmbBwMEiyFEMW40gm2OmA7P10SVI
Message-ID: <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_043859_138164_107FF77E 
X-CRM114-Status: GOOD (  16.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 12 May 2025 at 09:56, Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Ulf,
>
> On 09:04 Mon 12 May     , Adrian Hunter wrote:
> > On 09/05/2025 16:22, Yixun Lan wrote:
> > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > SDIO, eMMC support, such as:
> > >
> > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 8bit eMMC5.1, up to HS400
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
>
> If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
> the opportunity to queue for v6.16 as no big changes during these
> two review cycles..
>
> I also know people who would expect to have a full rootfs support,
> and this driver is sufficient to bring eMMC up and will make their
> life of development easy..
>
> But if you have different opinion, then I'm totally fine to delay
> it to next merge window, thanks

I have been busy the last week, apoligize for the delay.

I just posted a few minor comments on an earlier version, I didn't see
v3 sorry. Anyway, should be pretty easy to address those comments. If
you manage to send another version within the next couple of days I
can certainly pick this up for v6.16.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
