Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF2BCA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iW9W7XWe8folV5di8g6lLgkz2SC4a8AwMC1Cn5NJxgs=; b=l9ir/tqekTRNTp
	z8uuH5EzoATQWTtMR4kihNAMkG+0u8aPrFXstUMQub/5zJnKmAQRfFgl2E+r6FRbJx9M7tVVqwYJO
	d94FbgrKmDri+foqyXs6E8lNGetopMV/bc/A2SIye/6NkOH+cT0q+2tGMobae1IB/rYErFmqKLoko
	Hw3wrm9agkixQwQMs6Nbs/HeFQrW4wC9RXcHErHT5V0E45AnKSGSwszo3LsSxhB44Bt5NOY0okeBl
	oCRImwJU00ghUKnyuyr/QgI8rDBo0DzBlJPiljSSnjLCOSzhF2Y5Q5aNqJcRp57q9mV/vFiKAq5f0
	uZf0+Cwqu8376ar3+S6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyBb-00000007dzd-3RFO;
	Fri, 12 Sep 2025 07:27:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyBW-00000007duX-1SVf
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 07:27:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso12568655e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662024; x=1758266824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=Yii5ylCYe6+9yzq7KQb/ujF3AgdEV/x/ouOxkH5aPlnZdyV5Apb7/tz8qUZlJeJUg3
         MmO6/327HpjOWDZplC312cR5oDoiggVMAMBYh0fLeBy430VSBhvsDuDf/mOGW30+dg1d
         ItqvEiCJ4pS3EFeaneDiyJahFW4yXOFw80HLf2346noL6OQH1c3ZNBKUA6NHR+FUxTb8
         kQ5cJipZg01GK49YTHCEzATA+mShQh/QNlBHC/0GSRMm+ctwQNpcbGlosGClmOQ0rD19
         l7F1Rp/2ctg/sqHnKz7SNpqa5b17QVlj3D9fu3pNIeNg8jAodTQKTHpQ2oy0EU5/WNpc
         NsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662024; x=1758266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=sGxSsLAE3/IKZOerHloedQPoIv2SWZwHE+0L86BSenijdAI3JhGBTYxQKj4lh07HQh
         wS8VbEOdQBozSoqpx24GkAQrQNK4HDJyNPL3Ey8t5j4c7EfM3NXHC4nZnZvlrEpdaGU9
         nPLZZrxOhPoMED3+gbTaVD8oltK1Xau2GcZdSMaHw5z9nQbdidXVJ6kjbAvuZtHS8pxM
         DOoAPOVQFio3cKRrwHe7SNZtriUB+6UDZ3oJ5Jy4WxtaDp8La6sO5mMr/5WKsxofLWa9
         lme6ylD3kM0tifXBm0YCaP5RZ/Wre2IIWnWQpe+h2C4IINkYjiZHwQaJLmaXflhDOe4D
         tzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK/aDaImpjXGoztgjpBo1ryfU4Dw2nPt9ZDC3A2xneVTUkd1RNgbxXrFLDBuOqRMj+AkbdbQ9SUp9j5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxALOxpqEoUcVScDR9UCIhYMHq8iw1V/JNHF7D9t5wwHn3igyub
	OAsTgLYkNojZ33ZGkd/vsHEnvaiQhUslDPM79wU9d4E77fBmpRV89GO7MWoLqGVMVQ0=
X-Gm-Gg: ASbGncse0aenS7hBoePff/8eRjUi/ALcdMZfiqeHLh344R0YuMjZ2PZasLDjUSvqYTG
	gnU04dGBWsJQ+tpF2HkquCtN6h0WQeTyuo+dYdctg+O9Z9fzD+Eid50fS/4+Hp76RQKbAbWSVEp
	ocJbTBGkL9ajMJPvNdEkoynrefXLGTV0tPu8RDWUPavWYRCLLhThZHyCwlo5ig/p7/q5f9bLGLN
	lu5Da/9gW7z6EcBq4rZB41faUwPFVCWPu2uebHf3EMGqFPURgthqI9dvpLH2YvgsNO2hG5VpUuk
	lMgZSuSLYTqqnFQxao1xfVE1TRYmowxTSp5rFVQJwIoN0x0GXLCjsh8VmEuLI7F8DGBnJ1IhxYq
	JnWQbycfFr0HpvjNdDiqhXwg=
X-Google-Smtp-Source: AGHT+IHnJFZvdCCeCxhMw56xuAjolN8GpBM01BpNCjssGvJ1wLlPBDHBDYHA0TwsVBlYSdL7Ex3cDw==
X-Received: by 2002:a05:600c:8486:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45f211f7aaamr15546025e9.22.1757662024343;
        Fri, 12 Sep 2025 00:27:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its modernized alternative - part 4
Date: Fri, 12 Sep 2025 09:26:56 +0200
Message-ID: <175766186360.9646.5204996164911945151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_002706_430693_9FFA7461 
X-CRM114-Status: GOOD (  14.26  )
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


On Wed, 10 Sep 2025 09:12:36 +0200, Bartosz Golaszewski wrote:
> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
> 
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
> 
> [...]

Let's allow it to cook in next for some time.

[01/15] gpio: loongson1: allow building the module with COMPILE_TEST enabled
        https://git.kernel.org/brgl/linux/c/80d7319c7a2a9865dc730422ec7227bfcc92e6bb
[02/15] gpio: loongson1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/116eadc92b4c47277d660271eac1efd4afd33121
[03/15] gpio: hlwd: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/43dffacf6be98fb31aa7790d693adc29276461f0
[04/15] gpio: ath79: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/551a097118391018ddc4079cbcec6fe4e7d64bc5
[05/15] gpio: ath79: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/e7a3a1be11d7e786924ed7af3b3411def2e46f21
[06/15] gpio: xgene-sb: use generic GPIO chip register read and write APIs
        https://git.kernel.org/brgl/linux/c/36f30f7ffc4b98dbd49deec8599cf810e7006cdf
[07/15] gpio: brcmstb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e8bd2a6a5059043a9f13a0723acd48c1291a55ff
[08/15] gpio: mt7621: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/80fd7e96d669d729d9e01bfa3e2b60ea6b500e20
[09/15] gpio: mt7621: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/2c1f22fa54fcbf8fbd9c03f5d341c73ef36c6d27
[10/15] gpio: menz127: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b24489af4500720d8ad57c55111d90e762133c50
[11/15] gpio: sifive: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/8e1c8ccc1df8b802a7a1b4beadbd8b87fff1c3b3
[12/15] gpio: spacemit-k1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/063411108de622a26b36487a711903443b0e864b
[13/15] gpio: sodaville: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ae9a52990b2cd62e0555adad92d8fe9e431d1bac
[14/15] gpio: mmio: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e43e94fa19cf058c4e465fcdbc2f521123058ea6
[15/15] gpio: move gpio-mmio-specific fields out of struct gpio_chip
        https://git.kernel.org/brgl/linux/c/9b90afa6d613b66ec4e74ae75f9bfa5baf386ecd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
