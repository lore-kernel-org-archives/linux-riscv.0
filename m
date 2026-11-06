Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD816606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0nzxHDwh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yoGdAQms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CJqFysHxb6qTEiOPjpo3jmpQk/FRfxpV1YH4k59HMQ0=; b=0nzxHDwhPGJklk6Dr7I/dffn3u
	4UCJ8p5xwnXdFcS174pb3Y6cN/q7xlILcHdjtL0GuZ8FGvfjUO3zGdyURUAaUxzprLu8fhOtXGhFm
	ryT3MW0q7L+4TLtfThXdmlH2d7uP8Syllc9CGq5r/5zI19Fd6j3/N91peNAwdnv3V510408PlK/Ps
	0P2sBu2ghdQqJhqX48j52yEGm0sMbIOK/mxwU89thduUICs5YcU8h+jWAtxQXnqLROXR0P1MEs0lT
	9jnUUVHUD6m1Scvcjdlivd/ruxGc7ZBpRF5IFiNbfOewSEMaYiSMHf9tAko//H8Z5f1RwQMgxKtV/
	GHuiabkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNSP-0000000DBFP-1r79;
	Fri, 06 Nov 2026 17:10:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNSJ-0000000DBCi-12Rj
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 17:10:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6360095e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985021; x=1794589821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=yoGdAQms3HxrX9mUpqVcpPKkC24Z/syKb44ws8h1rOyKi8sGeZFTlIonGcCfqFVJdE
         2aRW5SBrxK+9wFARP5l42PjZNdPWdboCHy/qbJhMZn4GkWV2AvpDkGrBrPdewgBeGxQV
         EUqfRzVWJkgpebVUgV7Q3NkMdOOawPxS3mxkvsUR+4L2ByiPbjSkxp5BH2hNaELK2Mgn
         ousp4ppnD0DQRElsGtFRgxDZTWOI7jFzHdtw96jWhCi1nDPMi7m5zEURyj3WFQBBEC7m
         +fpa13ohQTbJTvIyH9o6T9N08sPLVhjye+02zvz50nifJAOTWkiLXlcqSCE2mV6NqV1J
         rwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985021; x=1794589821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=eciw5s//RSodD+12+OOViLeL5UHJQ2mMh4U096JAlXCairw3BmDhlF+XkuCzTm+eYs
         PyKbNKS5JZIxdjKPygxWStRk02wNQKqTQ7nvJP7MxoiDOUdaqtqWVCOoaK3QPRTFQXQ/
         9OJiXI42xheSP2GkpI4+Wlg++DYCijglLugio4wtALJIU5ZkOvtsJFsqoZiPpZGf1RjL
         dPIeU9hvCaSrhwMm2cnvUm91mWeZIC9xCy9x5QbdxxmyZtLsahXYXkGZCJRUrbl3Us7+
         bbx/r/QvUH+nzQI+AvH4Jk6peCuqRNQ5sP3Q9pP+4VCyl0FPm+GqRxHyK3udJdO8AM0a
         tcJw==
X-Forwarded-Encrypted: i=1; AKwUvBx79XoVe02W+njftfiaNfzLqZNxGcV6jCvmA0y8p0b1pU/YcFOKn3ZyO0RU8cnmfE/cictcP70yzVv5hQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8vdDlclXoNsbPK6UoOsjwj2q7rHEaQRxNMBRnNBVHnYMTI/bMT
	iwXjXHE5S07uq183lQq4QtJz1x7rSvwnXNx+8lgLIwoc8316sKqoqbz8
X-Gm-Gg: AYBFou2SebYgfuKQn/nkM0tkQyrtOVnkmilBv/iwMZ5k/3S5saeaHjXjYm/NYEy1G1O
	4b03q75mKl0NQxrM7a710v9+awkOEiTpm/dGmKvpb1LCcDxVOCY76VJZ8FJIXEUmMMMlBFFRaRz
	BDci2HN14nrwIVdddJpxmETZg4Uz2kENxAnTJRIrGJ9HYsu+9GuncVh4PynHfOmxvvPJl7LMiK7
	6bn0pfOZrsu0/GjQxx2rJtnSaESuUZ3CjAe+kYMWgwnIAPEo8cbYCmyEbeK7lANj+VdhSJdKNK7
	WScz7bkhSO24GCQLxljsHJinJGF9aDvHQfkjwf7cMqBZypM2kHnOd+wvzwHi4IXB4FFcfC2m65m
	BdFxsj4h9lRXWc1VfvDNCoP7Vq07ldBCF6g7Mhf9OkLe4EoR1i+oSj/EfTJJSluAXlKcHq2t1Yt
	ujQZEWCucXSRpDxbJPz1jlmR7OlCFU0/jMIW5KaWnc05PWPKUjgrZh8iv4y7M34Pb1tHzT4kItZ
	ICyXTv275I+cZyr2ragqhoK3JRTVAQrWPxMCGTRyiWbkZWeqDXCfXV45rcHi28vCeLnfFe5xlOL
	eGDos3Ukmx0ureh/FuhebL44tbkRBArc
X-Received: by 2002:a05:600c:64c5:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b6df4f1dfdmr55413875e9.25.1793985021160;
        Fri, 06 Nov 2026 09:10:21 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm238886225e9.12.2026.11.06.09.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:10:20 -0800 (PST)
Date: Fri, 6 Nov 2026 19:10:19 +0200
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Message-ID: <au4J-0GOUuueHLZe@rabbit>
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874idv2bol.fsf@yellow.woof>
X-Mailer: mutt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_091023_334970_33A2E9B0 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > Questions:
> >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
> >     modules to panel-mipi-dbi? The KD233 node would then have no driver.
> >  b) Or should KD233 panel support go into a DRM driver first? I don't have
> >     its init sequence or physical size, or the board...
> >  c) Is removal of all of fbtft already planned?
> >  d) Several other fbtft drivers have drm counterparts. Should I inspect those
> >  to see if removal is needed?
> 
> IIRC the main reason fbtft needs to stay is because it supports parallel
> interface which is missing in the DRM drivers.
> 
> Nam

Thank you for clarifying. However, the fb_ili9341 driver uses only the
SPI interface. Is it alright then to move (or remove) those drivers that only use
SPI interface and have DRM counterparts?

Furthermore, would there be a need to enable parallel interface support
in the DRM subsystem?

Daniel M

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
