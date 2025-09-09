Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D20CAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxpRn1lkr6/GiHHHQYG/q97Ksj7UaZaDoNaAmQ6FDQA=; b=D37NcWxKW9ccyf
	J2Q5PYbVXUDlEhlhZuzDYTToM6eVjzm7yLn6mazKGPq/agLIeWfdpu7D89z09puzW34oigapBB4D/
	HxhPcOcRIUqoYD8r5nJmp0l8JubNbOpurI2fS9a8AXEvwwS0vFycmrge9EtLIvoRl+xbrSE7tx3Lt
	qdM+vVNA+KsNNLCiVoRtD4+lbqiOwtCxy45+oNHaxiHdAOpdNtwqNB5Bf9HVmBMpsc1ak8lMurZrN
	Uaebr6uT1M8DsxbuFmWt82xb/9DsXyQMNAp7oWfp9hvnnMp73C01y+ddcBBFjbx13OoPby4FtXbsC
	lyncJHH9WeOlsS5Q93LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGN-00000006dAL-1sry;
	Tue, 09 Sep 2025 11:11:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuRz-00000005sS5-3vrJ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso5516025e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409342; x=1758014142; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=3gN64pIU9j4FG/3ghgbTdhqM+1325M83+0T2TUBRut/X8I3t7W6DZbQowS1LGy1qvJ
         T9yUSfNWL3jd9drNTovMh46aXSOPN58ruVTXbnJMeH/hqEeaIFRc2h3MsbEv7SR8fVgz
         7SvZAnRE5W2RXNEu3B0I2RNs/JhEv9FoCS6asfS4ZNbs2z4oTVuhynlIVI6meG4yVhIF
         B2DhRgZ/9iof0oH1kSAPGFFwlJMQlOtVrnRacXr8gVFbeyU5v9fgg17zXrRlqMyiarOK
         9kLB++aiHuOXiNeYHx+5SjutHv0rGd1rEOtflNoxyNhO9OEUtI+jS6odZwsJoT1Nha/V
         tGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409342; x=1758014142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=xFVI/YnyshIPaMIiob6Q3++qj8d052sU8pf27/YBoDq+Z1fGGcDCUIYcX4NTWQfGC1
         axp2cVW0+UdanI8zEpZ0dfRWVFLyRpQAGLfzP2sNX7BLpk2LLZaazj2ookR342jokO9R
         VYKIiFaJTepzIAg642o9nYDmiFJjZA+/NPBFRJO4cLJwT7cjhzSI12wRT4/TLos+SqRk
         yQyMMrvdB69mJ/RbWdW34iNsOz5R4eVKutLCcFGPp+wc73oDx/Y4Fl4fiN+wmvU/c1TQ
         RWX9FhR85zybeJ3ALZyo4ooF3HV8BaeQQjmXcwpq5QPyCeRLFw2Dfza1e+IRs07HB8Wx
         NePw==
X-Forwarded-Encrypted: i=1; AJvYcCWkvagcdfzkMhYhTLXwfv8z8yhKzNZBZHl/pG3C+RTihjwYmDwEyL8RSi5REjQl4keVuVBJV9pCdrPTKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU1Vn538ESO3xu47B3v4JyzWMk9eCG+Sl4bpAy8XGQGTaWxXwG
	hI8h8Rqni32ceZ6wGdszNbn2yyPXHGxuNa7Bx2pc6LYcyGLt6aB9WuCmrZ0FOB748Nc5R8dDEbm
	h8tJE
X-Gm-Gg: ASbGncvkVGTSDS2PbxapBzFtnjK6lKTC6A27NpHHMfXBMNMw4hTrUZAe/gDuI/qwTjY
	a4eNJQliGHqKKjqnILLpDRgDGw3lSO0/Jh7TShg7B2lCo8tNixqpvB3F+Vo8Y2ON4b+yG7+Xpw3
	DgU21+bq6BadKIRuz9hPebJPsy+FI9GoSykn0qut2wy1n0L8FMuXGEwyzYnQMi0FFpCTfGxMZKr
	bGND5ymC3wBlrfft0ENhpj6BSq1dEB/5tct12HGwdmM3vxe4V7yhpyaLqTht/lbGyYiaURPfyvZ
	vM1CwBsAqQWwTejQeGwchfbowE1aqyrGqSjT/P9SBisJxouwvMo7HdIyGO5grrJEUMPn9hliEaD
	yCAObRi8Jkn/kKWDv/w==
X-Google-Smtp-Source: AGHT+IFxM+HICQsKhDaBX2Rk22xBRkSqIHTShzXPmAQzNiNBdQoOhni1m43entJS3MAB8D5d0TZglQ==
X-Received: by 2002:a05:6000:3106:b0:3e6:116a:8fed with SMTP id ffacd0b85a97d-3e64bde97a5mr9793821f8f.45.1757409341378;
        Tue, 09 Sep 2025 02:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
Date: Tue, 09 Sep 2025 11:15:27 +0200
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC/wv2gC/x2MywqAIBBFf0Vm3YCKIfUr0cJqsln4QCOC6N+TN
 od7Fvc8UKkwVRjFA4UurpxiE9UJWA8XPSFvzUFL3ctBGvSZE4bQ8K81xQuzK6fBntRurV6c1Qb
 aPxfa+f7b0/y+HxskalRrAAAA
X-Change-ID: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sVPlOFYsePlUlVyNjlOXy8QPDA01db/Wvcm9y2+eUf8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/Ays28j7tkwm0rJbaeX4j6Qex2lOj/LqMAOK
 1PDzm34psOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wMgAKCRARpy6gFHHX
 ciEyD/4rjlTpLHFFOAETzbM8BZ7x3WlTsL5ofRL45hTWSkD3Bsd0OZjcixkAe0OHW2e3zFw2szF
 KeXpnt2sCS7J2vacxQtg0jH2fWZAf5bZ+OoGUTAieReshYzmxRi1YJFUgIrAX33d2SDzSvQrZvR
 VCG+aKnwtsgLIS3bpQ1AqNCIuxAy4Ry9lCAY3GF9UpNsbYioHxmLpykb53ferurCzD0dP9d2FfA
 qniXI92yE/VlFaWTo+gqGjUntxHg8iOH4ZhmUCDpE+Jd4zHfEBtw+OfWRmZkRnTp79FeNdacHx5
 p6k4r4XWU7dQ7BVOwC7MAvwAE8H7OI0viWBqD/6NVLyk6JNskJqsOwu8e94Ddt2gGDw0ARDpeD+
 I7mJlpyD/qmL48+7obrP2XRtew+5bs1uUUL9Agv17b6I59tLZFIO+8lix4XEyj9/Fg2w8cNkyZY
 c24JWXw0s0j+0JaiJKzZ5d6j7Bt4uYvxV2CCUoJ7bN1qi60NyHcPYrP2AwQ8sZKU1xtPedwTG+O
 KxwLrf9Cweg0/cRvkk6QQ82ss5f+Y7QsEwe7HuuKRKPRU9azoXk5BTPKu4ym9w5yjZDgjO+RreU
 OYdfHdNscHAHrLf43/UNtW2sSEmvItWokNn8tfM/e/oZXWUa6NjPf7lUXt62Wdv9ck60Df/2/bM
 oqEJP5tTEFOaNGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021544_092819_4806CD91 
X-CRM114-Status: GOOD (  11.20  )
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

Here's the final part of the generic GPIO chip conversions. Once all the
existing users are switched to the new API, the final patch in the
series removes bgpio_init(), moves the gpio-mmio fields out of struct
gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
the new situation.

Down the line we could probably improve gpio-mmio.c by using lock guards
and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
something similar but this series is already big as is so I'm leaving
that for the future.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: loongson1: allow building the module with COMPILE_TEST enabled
      gpio: loongson1: use new generic GPIO chip API
      gpio: hlwd: use new generic GPIO chip API
      gpio: ath79: use new generic GPIO chip API
      gpio: ath79: use the generic GPIO chip lock for IRQ handling
      gpio: xgene-sb: use generic GPIO chip register read and write APIs
      gpio: brcmstb: use new generic GPIO chip API
      gpio: mt7621: use new generic GPIO chip API
      gpio: mt7621: use the generic GPIO chip lock for IRQ handling
      gpio: menz127: use new generic GPIO chip API
      gpio: sifive: use new generic GPIO chip API
      gpio: spacemit-k1: use new generic GPIO chip API
      gpio: sodaville: use new generic GPIO chip API
      gpio: mmio: use new generic GPIO chip API
      gpio: move gpio-mmio-specific fields out of struct gpio_chip

 drivers/gpio/Kconfig            |   2 +-
 drivers/gpio/TODO               |   5 -
 drivers/gpio/gpio-ath79.c       |  88 +++++-----
 drivers/gpio/gpio-brcmstb.c     | 112 +++++++------
 drivers/gpio/gpio-hlwd.c        | 105 ++++++------
 drivers/gpio/gpio-loongson1.c   |  40 +++--
 drivers/gpio/gpio-menz127.c     |  31 ++--
 drivers/gpio/gpio-mlxbf2.c      |   2 +-
 drivers/gpio/gpio-mmio.c        | 350 +++++++++++++++++++++-------------------
 drivers/gpio/gpio-mpc8xxx.c     |   5 +-
 drivers/gpio/gpio-mt7621.c      |  80 ++++-----
 drivers/gpio/gpio-sifive.c      |  73 +++++----
 drivers/gpio/gpio-sodaville.c   |  20 ++-
 drivers/gpio/gpio-spacemit-k1.c |  28 +++-
 drivers/gpio/gpio-xgene-sb.c    |   5 +-
 include/linux/gpio/driver.h     |  44 -----
 include/linux/gpio/generic.h    |  67 +++++---
 17 files changed, 548 insertions(+), 509 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
