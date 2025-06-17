Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B7C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOD5enbzqvkBPNCF8HB5hzlW9pJk9GOGxNTDEvgrXfQ=; b=zf31b/Ak0/OIxL
	LZhL+ylszLSOas+NwcR+WrTPaGTlhXU9cQriqrQKcdqvCXG4YnqQsY9mWAY+zbO10mO4o+vVfni7m
	Shw71aKjU3AHDdAEpKAhNdcCYpO3a0wzUtbLUd4oAoqXCLPOxEa4yXUV8kxQNjupC2qFHIWEEM1QW
	gC/InI85LaiqjqOx0R8aZnT8fPptnukLW56K3ERxhtKoVSeXMZCa76W90pvUwDOpQ9XIiCqBBpfND
	9DceAN05i2hpMOvZy1UKOJEC+foiDrDJjbs4oay1mzA+2+gft53o1/x2lTE0qtFU908V5SggVyYej
	OjMr6EVqqQ1Q3MpPgdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSXt-00000006jZc-2k6z;
	Tue, 17 Jun 2025 09:23:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSOc-00000006htR-3euq
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 09:14:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a35c894313so6160049f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151661; x=1750756461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
        b=fHltgPCC6mJQVHxjBsi9/mPPKxmApVwitdh0ry5EBmzBMssixeCJ0NuSSBlQEVpECK
         O01FMX9gIbvnZrIPK7JTFPDYphlDcxuGY1tnzSp2IoScarwbTJALWfGfiFaJpKW4jmra
         yWQMcisjtgormBweJaBeiiik9bBnOuXg0cDP4YmsZmBaE2IGzpAZPb1LjkXQb/YE8KfI
         WiW1djCni1rvotLDiwsKsTWflhv70eHOtcBYoyMvkaeAAVtviLKr1k5jnjfkN9wuipWU
         5gZPIhEb1tK4O/1KahEUZogjy/a4D7g4H6+wtuepjCljDQvysT4pgaC5OTc+EYCvQfEG
         L21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151661; x=1750756461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
        b=jHeL8OEn+ZlbHp3rWeFRYEjODVcRkepvA9HThZ3c2o7WDngQy4iL3x7UtS3gCBe5FE
         TLQ6e9uAn1DpYIv8aQIKxZQxApI8aV5jZW61e/LdmveFs4fV6fOE6KYu4iWXfhtr6img
         5cc/SVGOaGmpYIRNrMepLc/pP0ssIyXOKZGva+ItQ86LFXt/uxkjrSLUXQn9s3JayGn0
         ZU3io3nqA6fhCGViLRThjzbfwsbwH2VeWoIKTdtE0rXp2TwOHjeX9ca/V0zG7FDgu9XM
         swDVRqxcjAtXyFGcHP8srQYvNkRvYdQ7nGYJDq7QkAPEHzIxilsCmY1n7dxcmqic+pPR
         uEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUnHAidwal1ctMMr3QgqXQOj6JCfyPXxm5/a1ECwJU/yoptLe7XpczixTiMgOuIkmpJOVmScGJiuND0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcMe9+HNbjxo9+gg6ZIWJcM/nZCK0aoDTTu6VRJ71he4g9wbtB
	zUBc7otm47tznJRSwQMRiBoynct5JNfzYXgAfQWWxA1x0+anjAum01/HgDSiLe43Fio=
X-Gm-Gg: ASbGncteOOoaBKgUpf32CCBbIUIQ5c6UfKccKsSMz+rL7maGRS8OD9H0C6oo1QmJZcV
	qV/N/QRw87fwZ71+yJIvV73iHFQrkdWH7hCmTNTcW8rrItdzBBtPjfG18QvySCMdOqdnqQYnhl0
	OfoqYrRnheiPIfN71MzDGbyO9/4KgCZkhHEZ0SzzO361J+1hs/oVRfwXqbH+qA6wYsnRz1JNhSk
	6NTqQmINMC5pCRsxE4vQRPs7PHi+JL9zYS2nYhFRMyqowGP7aIBkRfPSdDa2FV9VmepRfbVDiRY
	cKy+dDofiiCsvr2wuJiNle6ockm62oYwyS0pTTTGIGXx/4m4UQaZbiBztENasl4=
X-Google-Smtp-Source: AGHT+IHJrUzq11FqzFpCalpA8oxq7QOoJUd6doTIPdsMKhwT2j2fIZKoD5gQsAT4CYJMYxX4N6Amdw==
X-Received: by 2002:a05:6000:230e:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a572396df6mr10071598f8f.13.1750151661308;
        Tue, 17 Jun 2025 02:14:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm13280685f8f.26.2025.06.17.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:14:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: convert another round of GPIO drivers to using new line value setters
Date: Tue, 17 Jun 2025 11:14:17 +0200
Message-ID: <175015165197.21779.16487408157196142174.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_021422_918040_346CE147 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 14:33:10 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: mmio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc
[02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d27746181905c256eced857f4b2c051ac44b0b45
[03/12] gpio: moxtet: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b454580cf11b45a9da22821543f1455a6a31c5ee
[04/12] gpio: mpc5200: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/80d42372d9d87626b55516779e935c012cecdae7
[05/12] gpio: mpfs: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3aa3628f8168df9fe154b09b1710d3314b9fa4b7
[06/12] gpio: mpsse: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e63d9fbe9f148b44f2fdc211941f2d4485022549
[07/12] gpio: msc313: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/88a775454a0fe923f3d34d8f30cd1d6b75be0859
[08/12] gpio: nomadik: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/aaec273c7b511a7826df09123a1fd6e4896c1bfd
[09/12] gpio: npcm-sgpio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0e1a8930c941e3a7bea25928b254ece8caa5135d
[10/12] gpio: octeon: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f02614561493da22f24b0e2ec1c2ae0d5b41c68b
[11/12] gpio: omap: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/57065d62e672bce193f186c7b759f928b9a90ca0
[12/12] gpio: palmas: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f3763403a6bbc3a18379fe4c415bda899a111d55

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
