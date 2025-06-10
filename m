Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ACAC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldmmXL9FmMA87dzShvL6hwjiYf2V1HEuGvvW6lQyDx0=; b=B5jAs8M9m/WWnr
	CDSuwkfUcx/McHeAaORzqXiJGlnRTt/J768ZJFXmmLqKlyiAqYtarq6a1XV3nO3pujGmLqBteJjMz
	Q2oJzHIWNRg3GT/BuBrcANKwJAGVZyH+xaaBpq2Eju+A4u/3LCLmA8hD69UhRJ9oiBy5bII2PEV1o
	TOQ6kYEHCD5oM7wnJ6xdUdprekyucZD/+5ReZoSGB1sFfqdu0+L6QHHEw74UFDMuGBzzBSFPdZ2vn
	zwhumDbI07oDxH13eZMCjXaKCHSICOdnkex84qdIJkFRPPafuss7S+PlTY+BxcVxdiJxHhYW11jwA
	6i/k8eePKPzngzz0vE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzWk-0000000747F-2P8Y;
	Tue, 10 Jun 2025 14:00:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAb-00000006mOk-3B0L
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=; b=NKQIxhd4l3nipg6rIG609xmkrw
	HoE58OowrvOY+TgwtV+PfRg7rUJPIC8y+C4wghJfusxg7N4jdhSO0ASbHqSXlgUpY4fTVqXYjorWs
	9spTefd5+oGDhZN97BW+a/qprBVJtBo/RNVItdB9xL6KoXOGPW+ZpjrkmPy7ikOhHZv8zKt/Gxm5X
	pQkzwPK7YGDLz1WvXW4UsvCRgc2PPlymW6lxB8vzuhNftQMljbqCYH3NQlxrBSuRW1eNxusIDe0mS
	oLus3aghpggFucnwGN9Be2EIOGj1tcIGR8khho9OJnvg1AK4JpZITwBJ7hbeDWPMM0XFAVFtRkjsa
	vqI50zMQ==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAZ-00000001oZm-2Lre
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so3096933f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558812; x=1750163612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=G20H4P2gSGpZut5mTc4dio5YVBMCYmx8FzSNvmdiUZOzE8wx16FZyzo1iaTp8ylrrD
         +4YvhhGOZUbkEBU1eCJ501HFL2Tog8T2I+8yuKljkn/Urr8UV6lnz/fjUEEXMxvYwl4o
         jfWxoDJ7AuHhtHFTpYz+UMcXAwjcKOJTsdHe9BNJCaK4XzPfY9JD1go7gfflGJoQ9LAT
         erStogpGdbnC7UERK9++Q36gjurjotLx1y8tbOO1EzUORmr3oqUxhlHLHxkiGZNVPu2x
         JfiW6EzZyhuBjfZ53mWl9op+bbAbnmgQ1YL0+8mjNHK1QaLzLEoufzl3cwTHGh9cDMHJ
         C5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558812; x=1750163612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=oNAPduzKX4T4qVhbC6TGzJYZYApGmNlo2iDqdwYkt85H12yMDRHtoZVyoZdmt7RD38
         lagQVGzHqQatiYvjcNN+iA30RdWcT8/6kiRE66yoE5If2wByssfwiR0wr1zrtfcPB5si
         i37fROPKh+XDBZqrhS6gZCdyDGn1R7L4H0qmdvMwssu24JybEESn8or6lsdHN/Su9bRL
         NaUw13F3NCqH24HMgk8dsBNWfDaxiXS0sEIpeIkocU1gCpsyDdFdS4bU5G3qWUrtMGAK
         N/Wm1H4crmwulDQ8MrTHylRP2fyRx+KoGTh607Hf+96y7vOuUI0OzWI/80eauSNQ38Dz
         Oglw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWeCOSiSt8ytwbMRl6eq8vK4pD35Jw3C7JF3qYoaX2GkNd4hKYgAdmwdcYrPAXfh4wTnGYtduFXBO9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9/JbEJcz0MOdMOuK08lP6M49zlCXfo3NZ9/v5rVldLnLoJf7
	+L5wGHHxV0StRw3WMjt0TLLRNjUqyJFl80LdYN2+j1VrOCBYDPrS2l935o9WSwCReh4=
X-Gm-Gg: ASbGnctTUsvYniFRKIshOLCoP1LjSyLDVOCo3SDOFoaQ1/5tWKPkFsntJtkKmZWYCUN
	E0IUhEoXs4IkVYLObb5WGEFW3ejOYsHuWSZkbLbrcsNt1Xm0fDtMDcomgqqpO5jUntnU8Wc52wJ
	hv4i/KrA+folOsEkl+1DSC9ry5ZKrJVvNkMW5mAxkZ79keT+9WNRUAyAm/kHfn0APj1xf+a+8fQ
	4f6/LBBpTxevXB/KhY/4iy+arGnlLKRVmFodQe6onSHa8QcfyUlhq66HyLGh/CBvk0emBHzLZ87
	JGAKeRFp61AJytBeMKptrmQaG5RIFlmw/WjXtCWURstbJLuUBcXIGA==
X-Google-Smtp-Source: AGHT+IEbu/ISHzm391WeAgpZgQpxCQMU7l5sRhpe0Dp2uNZQ9BZI4WIWzmuf7o2/3fpe+9gfV/kFtg==
X-Received: by 2002:a05:6000:40de:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a53189b56fmr12109336f8f.18.1749558812389;
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:19 +0200
Subject: [PATCH 09/12] gpio: npcm-sgpio: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-9-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i/xwhpR2l/6SdoE5H3/TW1iFI1pUsif0v71k7JJeqSc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQx97BIIpnbWW8Jl0scOnlXA7m5aZIgz1E2
 ednyGv/bMaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cq0GEACXL/OUOB5vGKp6qF7twwq2LopBjxJ+a5zMR6wQvdYfBG9QBDMmaPSjuf2kmkUtUbYu7HA
 Z1FBKLRGSyx1X3/aaozewD1qjyFA6BkSTZNtKnHHfFciGdkPfYwzAX9dewnRrjYmGX2RAk9ab4e
 VC9jF4zGQI+ngGuFjOCR9B0GScsixBBssQZWPx/+mzwukpk5PSJhpPvOSlfJzvaG3S7/9LenY3i
 pIK9rDUEeMNityyi7CSMetFo905zRiQvyOHu42Wn4GMCKaJgXg/wVA2eFw3JOFTg1S9deQKieKa
 LE2ed9MQ9rCTGm11TRojU7n44J9uERZp2a3XOuVBWzzyL7woBfFsFkzlB4IGf0whMN72a8zT18k
 wvRyZKhQPTk9EDwIQrqjDA+BhifztuHVUog4jPZq4XzFYBhGmE3SjABwmAdeoJxLCO/vbmNhLPk
 843qnKqNHnzQaryTQggkzqEB+E7vcapL8cNvyCLhIP3Tu7PPt0ucxtKA/gTsjLQ5BCoy7qvv6md
 4ZAH+iSl/g/8OCXIpZ8susfIxxvVBcI+FtWCvNWRFB3GwFz/GVm0eZC4SYWn+8kzCc2tvzN7mHq
 f4OvLY1WFa2WQtksGlajI7JxVWIJlosIN7MPl/2Fh1XVD9Zl+evDL2mc6wIWcMGBUyCJql3EvIK
 KZdOoABhp/23yRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133335_761768_A25F90C8 
X-CRM114-Status: GOOD (  12.17  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-npcm-sgpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index 26057061454348d383129267e8bb0b8c506ea5c1..b3953d1ae8af45f4bce9b799434547cd8770d9df 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -226,7 +226,7 @@ static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
 	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
@@ -242,6 +242,8 @@ static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 		reg &= ~BIT(GPIO_BIT(offset));
 
 	iowrite8(reg, addr);
+
+	return 0;
 }
 
 static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -546,7 +548,7 @@ static int npcm_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_output = npcm_sgpio_dir_out;
 	gpio->chip.get_direction = npcm_sgpio_get_direction;
 	gpio->chip.get = npcm_sgpio_get;
-	gpio->chip.set = npcm_sgpio_set;
+	gpio->chip.set_rv = npcm_sgpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
