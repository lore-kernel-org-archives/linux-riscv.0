Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFDFCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8E7w3o+uAR7lAh3CdnHZ4sQqyIOGMugY7knD0aAAZbk=; b=Wucn3ToCh7ZDYD
	YpKk+pz7ygAeBCfGa34Tuyqv9hkkXKUtbUWGuXKTmw3XXynTH2QBLilUQyWRXM+peibb/U+NWGcII
	cqNXUS5P5LpIJmHKP0gsPwNtYGVa/vDVEwoT91/wz5xGpBd+NUObV3BI3w5+Se+fJSXpxQ7xBQI1f
	35QWWPLW8QwiXNTTJEQ1r5JIar04Bn3hE4nKAr5p7Rpg4kJUa9M+rEsPEKlAydkLnEw+qKEUjlbvp
	XWfL5bE+Pr6kYh2S8m3I3iFRnp3hjq/ZUvYQ3osMOj3rJO4P+esdqxMb5fwRjZBEDs+oBVj3fhYXg
	2fh8GP1snqH+apveMT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF13-0000000CRee-06Tv;
	Wed, 10 Sep 2025 07:13:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0s-0000000CRMP-1ig8
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so1443595e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488384; x=1758093184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=16QCSthO9GnBFjZeVlfTa3Ib8EHuNzMTn5CczRxrNnBgylbWF85UnFjiGrXYVk1og9
         Ce4KVbLwlJIGbAnGN+hqDVDk9pkodCyMpyepNVlbQCzV10zCyn9zP9HBZvNzhVkLq+Ci
         5gTUwB7M2ORLosw3+dAR9XuHvUEHuoHoZeRVZU56cCh9gVQn0LYzohJNRXqLpBEWO/4B
         Nfexw5UZJZzZsMdhx+cYhz314BsDZQGy79T7AhNe14n6q7At0TbKPWPd6IrgTE8kHLix
         ck3DP1Kqluj5WJYot6cKDDa7mlEa9WZ5mBuDLfEmJ2RNEQyxYup5SEv20sUwIbnFBkBD
         vTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488384; x=1758093184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=ggsKjzU1Vx/eznv6F135/AfXYuHB/GIfAVUHu6eSFqCf8d9xfbX3Sq+OskVIgGR9YV
         gDpYCiRTDWCdnGwJO5yWahkK74kp5t0e63LJVXmu5RbVDHsTijwZvXScTyCWoIEy8hkp
         r3umppsxQvi3G/3+Hz8VFLMP23qX1DJculdrcO97Xc4Po3ObIqjVYj/QLqj1VrpKVW0m
         CLHqkFnu9cAT7+bf+3xHecKD0R+4jOKLpFaFfvMD9cF5r/nS5y9AokW8xze9Px/v01Uf
         X6GjP7kjDoa4gjAt6rb+SdA8WJd8ipD2EobC0ZQfMpTqTwr51vq/GY/Fv92pwRWgjsfd
         4m4w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9Jdpvac/s3Q3usEFUzYP9eFeyoJxh2/o+mf5omvA/yNMhryUtZF3EggWjaiClhzRCIVdyidya5AoLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5w4SckNPVXYPdA4SkKmWuJ2NFVQYQagzaPIyhwW7YAy6fl3Aa
	5Cf6NvnNTmhgvHAfPEY36F/9IKmGzSaMQP3rnS0FEG8utk0Yt5hXDlTQ2D0AVeekqsc=
X-Gm-Gg: ASbGncti567LnWYG0r+3fESFQrnwdDvK7CT9eSfz95k4YJgIHO9blz6MXWQAdyF3gOZ
	cSiCQNz06lzQux6MsLIDf1sA3N7fMPpBPc2jMHpAfZQ1sHXqqmDV+nmO2i/TrE9opKu75Idf8lZ
	gh292wGE9EFxqHMZBIyFaeiyBEgIVjo8kdX3P3fFJ/y0uY75ZkD/ZS1/y8o54lH/NYocr0lFY9S
	j/OTys1k7eaAthT5piKyhzxybyXjDmXshAP0WRBIaK2GtdrpyYZlu9wQKB0s/moDTQGvujX0jr0
	BcFeGVxNWVzKva29c/RqMU3WBF82/PE/JF8REHpUCBLjKcKoZCx4Y3Boy+Svrmenhzkkkhy4/5L
	KJA0WgD6LKZhwBLBWe4GJfGl2Jvk=
X-Google-Smtp-Source: AGHT+IFSdci3CHq8VqUJcbVpnmzo+2lQEmXOuKmC8RRv+wtgm3NDfrNeLIsCyZlc4vVFVDxHItzjfQ==
X-Received: by 2002:a05:600c:c4ab:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-45dddef8c61mr118822845e9.37.1757488383998;
        Wed, 10 Sep 2025 00:13:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:42 +0200
Subject: [PATCH v2 06/15] gpio: xgene-sb: use generic GPIO chip register
 read and write APIs
MIME-Version: 1.0
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-6-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtTDj4oNGwDRR7+qL+H0qpz1nceYdGpGDPH
 ia1yPhYhmCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cltID/9Ctub5VaMhx1Y9F7RnCwKevVF+bxKd+hpiZxi/K5bnOELNFhQC9MrYe3Jo/xgNtSOubP+
 e6d48QqOuSuIV5d++/Pwni9yyHDsRzqCfGPA2sfV/Bab6KBoWxhzDFn7s3lGqcOecV05i8onc8w
 wFCuxdoJ2i+LvKp0salt7xPfvkjgcIgKGzQmTopLYLKahtb4dC4nWif9HBKqL3RiNU2dkpEQiAI
 ippQcDB6/0i6YRrnVZAEtqpMgKaPwyRaKiOa0VdiVA+ZmDw7GrC1p+27jgEkErOCxYboKXTW5Ae
 gKTqLhDKSVO7c8IKGCdbIQxYiJEsGZCrYFuLA0pAogyydqwf/ZrcVP6UgJSOttmdPXlWCEfaWHy
 cLBcQnSi7cTCuPVS9mvSF6h4umNbP3tpRfb6pOfp7l0RY4i9BJsC6WTDRDQ/vHekGy86Kwi6Esq
 IzhKLr3OO4wfaano0EJJ5Gs84UnV4nMnYW9Nts1TM7oIybmuoDUgWV2QyuT4HcBQmTL6/b7FDyw
 82BVH/fdSFI2eKKOB3z+/AkHtl9+TcngTVS3xIAQWvL6HdAmpBuy2zbPJ7GMd0eV+meic7kYxxF
 1/MoGJeiOoVwFVOK5uGV2GtBCFo8xz97rQ3SKuV2hyxM9CExMXw9JCmDOBulmxf8+Vd8Afmotk7
 5UhY14It5j5GHJw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001306_504301_8D5F4573 
X-CRM114-Status: GOOD (  13.21  )
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

The conversion to using the modernized generic GPIO chip API was
incomplete without also converting the direct calls to write/read_reg()
callbacks. Use the provided wrappers from linux/gpio/generic.h.

Fixes: 38d98a822c14 ("gpio: xgene-sb: use new generic GPIO chip API")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..62545e358b6c4b1cab25e1135cb24ccc3e955078 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -63,14 +63,15 @@ struct xgene_gpio_sb {
 static void xgene_gpio_set_bit(struct gpio_chip *gc,
 				void __iomem *reg, u32 gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	u32 data;
 
-	data = gc->read_reg(reg);
+	data = gpio_generic_read_reg(chip, reg);
 	if (val)
 		data |= GPIO_MASK(gpio);
 	else
 		data &= ~GPIO_MASK(gpio);
-	gc->write_reg(reg, data);
+	gpio_generic_write_reg(chip, reg, data);
 }
 
 static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
