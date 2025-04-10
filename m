Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE65DC369A6
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWXpZ6xly9dX6TKZyvMWbUxL48r8hz2l5Wgmfx5qryw=; b=a/9qHoXLATWSC5
	aK1uMkKU6jIAx3xX6ym+0EHlxv8zQuvuFj866FpAON5QVFV2kFE0vrdWMgGXdTlP7011cO1XdYlQC
	xkVMVwmN+TKrWWNTQaWU8IxqVdfDmVx3acgJUVBvh0CZlHeCH2gTcm5Zx2NWs16KMNcUqAcMem7Ma
	b7BAlDuWhceElUBOQTV9XjzhJcILg8A5a3ijsMD7Lm3UBL/naUuzr6gpV+4xCUqBr16cSzZwfok5L
	uAUnDuHBRImkbJ6m7DYjvgM8hnzrUfnxJgFDkDuz/RH3EzUIi3xugPq9EzZau9SbBKsbmXXRXTngb
	eX0S0rTKo+Ql5V+7ZKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qHi-0000000AKtO-13xt;
	Thu, 10 Apr 2025 11:41:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2q6O-0000000AIsN-0iOq
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 11:29:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5673055e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744284586; x=1744889386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inreEjGkP2FB86SvKqikRoCXcnYDIYzGtWDBTQYF/sA=;
        b=E/pYSkZi/7Dy+Omn4uRfGWYGhMAaMMILsbGVaAGgtl9xjrF7Q3Q9n1Zo3fNnILB66K
         0M/LLoKhLgAeaXyOmh+x34bmlwgDNO5lw/9qKyWiDVRUBc/h5sXY/0fAXPAb/RsMzu0A
         07j+SL24PwVIVAPKY3GDA96V6EKMbZfpctfXG+/GTv3jEp2L+eqZog3zFAH+rVhkgxM3
         OmP23QK5TYQuU032I74/zDaYVOtY5c878ttXZla6LHsm/ogOPPU8zst1c2IaKT8mXjTu
         v0FQ3+ma2y3mKGnh1yMWGZbhtUTcmcv0jlLEpJsiHxvyv3Oes+GU+0MCKlM2FKi9P9qJ
         jMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284586; x=1744889386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inreEjGkP2FB86SvKqikRoCXcnYDIYzGtWDBTQYF/sA=;
        b=oouWgZdanjxOdKGC6T4smVvivPnfpWF7VtwWEk6rXWAZpuDeLrBjtVidp3CLw2QVzG
         nwH4aadG5C/iCMTOEPRWFxWML0SqXrEv00HXs3NOPo+vjQc64Xe4vWQt0JhvSaaPgVpT
         sqjn+HWpm9vL/ZgfP03wky+6lQ5Ewm7NujnLEm0dRb/ke+ZOtr+Qavk5kCvAvn4hboMF
         4ycIfYmWwgalqKjeVTuGx/oqoi9UAvtiVAPD350IwlidYI1KoAWmETGoH3m5XRszWENK
         n4GD874p2Y23BGi1oyIMT7Y+Hi6HDHIEnTFkZeLCDxlbr9FXfrzGzkuoqJJpLPBRJbUl
         TGvg==
X-Forwarded-Encrypted: i=1; AJvYcCW6spFtU0HAynKEaWMD9J1TWyA9/uRHA5UcXV0jwwoTParKac2NUaJn53VCkSVcrzqdz/5+GwOizQ805g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC2d94eFKiM2wrviNLjz59yzhDKs6NfUCa6z4sppjQygT1hDKV
	E4TJyJCfZmsGw475ugu/1LNqOhjJ/P6J0u2S5BUYhv5nzOki55mLUL3/ZOB3yck=
X-Gm-Gg: ASbGncsDswzCpHd5K7173NlIPM2d8eEbPaRlERfT0UN+60CVOgRrrdKyUtmokAfVoeX
	NxwLOIoHf5X9nrJ1cXq2TQJaVdieHUN/1tSrLEQmsfhoObX3w0hb0J0KGd+uBQ4IAq15gieBI+J
	Isp/OsaH6fa7Kbbiu+S4aAzr0Eq7rfH8/TRvgLsm66zRwohjXbcbOFtOgaXS07lxMcHnfQUJ/Z5
	IOp/mw1x6/w2jVoQC2zlcBGmuc00f+ir8rsk4ZheFlNYQRYPBJamMwHItpPbkURIflp7iBNhvYn
	QvzgcElosZNLSmXc1+dZooGExkJXspWJWuvg54CDxG4=
X-Google-Smtp-Source: AGHT+IGiu0OWEfT2fJWCoTEv1DArNTgNn8X+CE9Dq1sIudD9zQeKyE4/MK4CcE//ivPh7Bmvd/5jzw==
X-Received: by 2002:a05:6000:1863:b0:39c:30d8:f104 with SMTP id ffacd0b85a97d-39d8f36c5femr2027739f8f.6.1744284585872;
        Thu, 10 Apr 2025 04:29:45 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0b09sm4616409f8f.63.2025.04.10.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:29:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:29:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <Z_erp2nLRKzLXuwF@pathway.suse.cz>
References: <20250405145354.492947-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250405145354.492947-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_042948_207682_2DB40E75 
X-CRM114-Status: GOOD (  10.28  )
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

On Sat 2025-04-05 23:53:54, Ryo Takakura wrote:
> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
> The register is also accessed from write() callback.
> 
> If console were printing and startup()/shutdown() callback
> gets called, its access to the register could be overwritten.
> 
> Add port->lock to startup()/shutdown() callbacks to make sure
> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
> write() callback.
> 
> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Cc: stable@vger.kernel.org

I do not have the hardware around so I could not test it.
But the change make sense. It fixes a real race.
And the code looks reasonable:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
