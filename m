Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40DACA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qgoMSXxzOP9SwDbRVDqFdbPanuPZ1//oYZs2YoajxVs=; b=gJeQQgTTlg2P/K
	khPIhz4ezV+WBjq9ezepTURmozp6be7vf5pafv3i+oIrTgHhKOCsVcGuKY0UC74WBvzcfA6GSOQTz
	3Upj6DowBhDGwgrKBsa2SKpxeYe8w8SRjQX0fhCDvPJHvldjHU/8ISzs02vNJQueiyxFRx9Vu8QUJ
	978HDx947Px6B8jvq+tB0tcnPpOe+bhTaVhWSme5kmsPKk/kmOc0aTdQDR9e4ghhXbEACzPSAo+dN
	exKJ3i9Yx8zeqIAgjAZgJsnr9jZ52PXIqCQLhBoGPUv6Rdp91Akb9b67lH0o09lbMHIKG8Sl3+hOX
	LM/RMLGL/CWA7sXceyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0h-0000000CR5k-1PSO;
	Wed, 10 Sep 2025 07:12:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0d-0000000CQyx-2zCq
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:12:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso1854135e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488370; x=1758093170; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugpSdYBcFcyjlnv74JOlVgnvN1MDgukOMIwUTusiLEc=;
        b=2aHelMILgt0Ez77aKR9cIYTjfwL2qZRVKKM8IiNeEJ5uyUlr7rFdi2UE6uY1qiUQpj
         ZG9IVJBfRwb5vv/p8ldNTI8KABj39b6zm1Ysp9iWYJhk8XNiX4Uzlott355rdPoF8HQ3
         PH0SUVaIwO0hPikF+4q6AQfZIzakU/ERCUiNOR1LRt+PAzpzBG5esOwB1UQR0WIApdb1
         v8t5g42ebXVrQWUAW9cmDOzG5Tw82R1/VX6TITRebo12SyU5HLuXZzV0XJdYhwz4/9hg
         HTr3ckSDWamXk9gbP3RO0mH2FgmkD+YGICGTR3DFh9lBfJnM3KeJoGNNYyb1FP1LA1q/
         dsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488370; x=1758093170;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugpSdYBcFcyjlnv74JOlVgnvN1MDgukOMIwUTusiLEc=;
        b=dfAT8aYTm/5hf/WJuCD0pKV086HInE9Y4tN4nyifR2O3OUliYHwH7vudk8lyDl7hw/
         39EI75RLIYLvLowyPKPUgNZbahMjkddgaKLC1ethMi9C684ubqN4SGYr7Q5FknYR+P5j
         CeIxk4FUy66XN5+638RhYY6y1xHxbv5lIvFmXrQba0kjWVBBKOR3WRMSFe8q21CzJ/Ts
         /eVPqOOKdikR6Lggp3NwmJB9ovV61Gr4kr0aEMuwO2C2mYjvfsbtRDHHcWLMm9H6IBpO
         /NXxEGmundXeEP9KZcj6O25+F4b9csEkK0qVAnZNuEyB8T+L4qOkdwnxZgXmLxk1Rr81
         ilYA==
X-Forwarded-Encrypted: i=1; AJvYcCXzOYDga4JhtBArm+bFRwY7VbRdldG8tbpNZVyDbjoRt+KfGIXBQetgmrGBxRRsN+l4gv/vJm7/cnJQ5A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6mKymsZu7vVyy+97eplLsTbOn6VzKdUmh8WjGsJC0/0OVo9PF
	pXbAas34NgcuXR3Za4hPn4YXQuffWQQ+fYJ+0ehe7MwkFzdClBcOBMlyXl4ANQslLr0=
X-Gm-Gg: ASbGncs3OK3GlQvYdFwbE9ad/QmQkhTC65/RwETFsc9McKjQkMN48IZ/qhKdz3iSG8t
	JAKAZcqYG8cTUIwFyxHwFLegX5EEEd+nuzzvQ261Udjy+2APbWoyvRtovzA0p+oxp1sFavm/Va3
	QwpGxpV3i7R/yscEA1p3Wbr9IhbuiISK3fpKzh12Ce1+5PbpM2ULfd4mKRWiGthGFFnpMq0yjqw
	oZv743pxDtULKca45xBipAxTKOZnLLH2xL8LvQzZewh9UAa2DMwmQTzNYbw8+bpPbWNZijiRu1+
	zUX0rIEv4GnF47lcETM2GubnFte3eJZMjL+ufRi1ZqyG/SEoW5b3CSMw965/Y8LE1je6dGyu/tB
	25iygygU//R1kqEB3RoghcsN7dxo=
X-Google-Smtp-Source: AGHT+IHrrMN+ADtOuKlQi9RGiDHXiREsYsKqapnsUjtggDFlAyfpxz5vaWXqjzCbBFJZxAe5DLXNtA==
X-Received: by 2002:a05:600c:354f:b0:45c:b61a:b1bd with SMTP id 5b1f17b1804b1-45dde220a2emr136724665e9.18.1757488369362;
        Wed, 10 Sep 2025 00:12:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
Date: Wed, 10 Sep 2025 09:12:36 +0200
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOQkwWgC/32NQQqDMBBFryKz7pQ4RoJd9R7iItWoAzWRiYQW8
 e5NhW67Gf778N/sEJ2wi3ArdhCXOHLwGehSQD9bPznkITOQolo1SuO0csBlyedMffAJVyubxtq
 VozH0sIY05P0qbuTX6W67zDPHLcj7fJXKb/uzNn+sqUSFzWioGvqqJm3vT/ZWwjXIBN1xHB/PY
 dBnwwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JyAo5aV+iTeMsqYjeANCAWBW2BQHi04qwTbY+uTHwDo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsfveREK3RfOJAEIf0cSogVExhpgipmMQB5
 UgOmXH9YSSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 cjQRD/951b9jN+lUGU25q/53L+OqAp7X8jNaGL7UM5d73EDzwETM5aeZAWTLO6xSYgnBu4XrJfA
 KyTKV/h9kNYKSZwJKhbKqP7ryv/4pgxffVYB5cbhaP8L/YqXqsLPHJQn5NXMkyoTBko2GZabHBE
 gE/FBE7+4FiIIKMd5CdwDAX0k1sRXnBep9TfjkhVfNamCcGFdcA+Ud3Vd6p5jNPp0bDt6Qb/M/7
 CbqQnyIOli8R6vRIlA/1FnwXH7VyBVPdfj6PSx01TVf8jq5ilDfdKopcPepNNMqzA3iu/4kAMbT
 5pA5jJJxpwMHrpelV6b0GJqAdTWeyqvev1CAeBih5gniwCQzokIPxQjLTq54+LboVWEEwH8mln2
 CskVygblEQHxAMHc+yodrd5UPletfslt0qEz3JUWLVMx1KKp864HX6StNfWnE1quJA5r3JDyojk
 jODmFFGWRG44nc4qSeH2+oDQT0NBQyZF0UVxmQswipM+TDkr1pfYsvhhc22u8ePrXKUWqpoeUXM
 YKPM2XqW1orlSHHg73NptBhhRlKXZsRJgSuqYk83GlpnFFBWC957OnU7bz4CgwvWZC1hFzj84i4
 5NiJNHhBjT5ZCbmkkv4R8jrCnl7rvqhK7KT3XcI2ptR5NBSXeSDG6pEqutZ0Uw2pJ066vq0xJXI
 rKKKTzEqGg5AWqw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001252_089382_8861C335 
X-CRM114-Status: GOOD (  11.78  )
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

Tested in qemu on vexpress-a9.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Use a more common syntax for compound literals
- Link to v1: https://lore.kernel.org/r/20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org

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
