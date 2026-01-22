Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F29C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHAnp16451NB0qTVzH6IXd1R+yB7GhwSQ4zDK6u8NGU=; b=I/rULBNdpFbMe3
	+vgObbtUhI5iow5sbUPWkvUdzABzLF9YxqpUBTnqQKV89mX5WOh9NUOMc8g3XFK7yoxflucEzR/+n
	n2tfYO3W6NQat3mMIyIEoUSf2PZGQZiMQYugttCCGq8YzK1JVJU/Reaq6mA9l5W4MvVv/v+6FO2Tx
	KicIkP2yV6DhxeffjuMLGfg2wHkKNtF5EALP06aHGCuSSy6DyCBMIwVA2W+koUhB9/ajnvWl57iVS
	nI3B9W5ewBe04Z0ZnwdDn9CKOAvGJA4iQdNp4qnOqsJH0u0GKqrUxAoAtiyaPFMePcLOiWxfvbVMH
	hj+vbRVy49QRUsslmxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9J-00000006Xgp-0MlV;
	Thu, 22 Jan 2026 07:30:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9H-00000006XgA-1MqN
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:30:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a07fac8aa1so5560305ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067034; x=1769671834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELBSBXcYpRPoISeGMPMPpa1xgXhu62fyafslk8/Rm5o=;
        b=bPCi1vU2FQWhWccqudTOGCYfuiJLEeXD8dYhiiry35dDnhmi7xam7WgoTGU8covAPK
         Jzy06BJL5KlhEvpFEQESaYqdUCX7UGDdyzz4W7GtkY0iQw9x0RsIlveI8D6CO7lDhxk6
         8N1Rkf2Jt6nT3ihU8xCR1I43rfrInpZ+yDY2gPWOzxQnaJ/TnOZ3GgiVfeUYWGxh2Bbf
         VFLmroaHUi0ZUwgnlidD9vShnDP+fRhwQ5EXljAeun596rqNhcnp41EtN7k7zBrZaYDY
         pKr4Ia1PQWcZp1fDqamGAl62wOBsR0swiwiBtD2qlkBgXXBSPgmux5j+MoUi0AV0KoKL
         nFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067034; x=1769671834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELBSBXcYpRPoISeGMPMPpa1xgXhu62fyafslk8/Rm5o=;
        b=NXjARw1EdGEZb5vFohYOiuzYsuMSyJzbvRQx2gpskk/7KhTKYalnvZ0FoTjypXiLn+
         kxgaQfcDVcGE0E6UF/7wb5SVNq7LtWPrJ2EscmyInF+pWbIunwN0S35fFHo7spNwWphB
         3XHLA3dkxa24WvFHvo/5YWfqFvu7Xkh2AxVERsIWASYUpbM6v2AXi0azxR9LMGOPD53D
         a03vQBEHKD0y+/0ocisZQP8fsvAvGwmlF1ZMZ5TdC6Gr3f8VU7c6GuKpY+7fB8LuhhTH
         dku82ykc9KO7XacNp7Ukdf/Ro/ywMCbJGM775rCqmzwGVx7wXKfO2mlBjI8b+Os0va7t
         3smA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSn0ms6nqgnTTtZ6ePhjbwtjdZMUZIg2xZnQIkHsGXUIqeIwslhCjsa0CHTv1IBiCfaWSBBTUNjWOmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfBLomo5GXnu/nPnh+17nL0+MI2w0eiTRwNu7L4Vg71zdfGvK2
	26N7sRtipfYuB6nq1hNbQwKUzHT6cXUQ7p/c6IB2jjUZMeJOnjNAU12lRIOEH6banZ0=
X-Gm-Gg: AZuq6aJIf7SbX19NjT6okY0xRAmrhF6vgqIGbciPcky0Zr62cClJ5gR7o/E1f672Mmu
	QfI2XuV0mUUK5rnWTSOWpyzKoBuaEfbgylpPoiSuEqVhh9y4Uiw1rUyqrtgLQbIZRgwpv/FFoyl
	owWuJ/7Sn+QwIZj4qMik8ZawefTi+t6guiCRIqQtFDIbNlmxpLe0LJ5YKkggxsFNzkqIw7JAY0o
	HUsPU78QbDsYFShjTB0zOx24ZaIQ/NbaQgUfLOpfB7fa9gK7XpLPY+u3xWOb8V51kDEGd29M8M2
	Ka6aXo8JU1muO+HQdu9sZS38NcWjX8/7M2tpm1Nr7M7W49lnFl8F9sAXE09NIRQSFknNuMqMBGx
	8sYhGVDu5FF31k5z/O7albMjhXfMe0LCJKibaERPiqRpttDrD/pdDQqJpw0fo6bQMWxJaTbodso
	6qPkSXUdKf94GXfPFy64Ecyp2JxO3c2jk=
X-Received: by 2002:a17:903:2391:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a76b059dfemr61934475ad.40.1769067034080;
        Wed, 21 Jan 2026 23:30:34 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:33 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:44 +0800
Subject: [PATCH 3/4] regulator: spacemit-p1: Update supply names
MIME-Version: 1.0
Message-Id: <20260122-spacemit-p1-v1-3-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233035_379754_F455FB56 
X-CRM114-Status: GOOD (  10.82  )
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

Update supply names to match the P1 PMIC's actual hardware pinout where
each buck has an individual VIN pin (vin1-vin6) and LDO groups have
dedicated input pins (aldoin, dldoin1, dldoin2).

The supply is a board design decision and should not be hardcoded to any
existing power source. This allows boards to specify their actual power
tree topology in devicetree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2b585ba01a93d0ce163c33e14c8022a506bdce11..57e6e00a73fa416fd6e557eb5bcada7dc69df444 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
-#define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+#define P1_DLDO1_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+
+#define P1_DLDO2_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),
@@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
 	P1_ALDO_DESC(3),
 	P1_ALDO_DESC(4),
 
-	P1_DLDO_DESC(1),
-	P1_DLDO_DESC(2),
-	P1_DLDO_DESC(3),
-	P1_DLDO_DESC(4),
-	P1_DLDO_DESC(5),
-	P1_DLDO_DESC(6),
-	P1_DLDO_DESC(7),
+	P1_DLDO1_DESC(1),
+	P1_DLDO1_DESC(2),
+	P1_DLDO1_DESC(3),
+	P1_DLDO1_DESC(4),
+	P1_DLDO2_DESC(5),
+	P1_DLDO2_DESC(6),
+	P1_DLDO2_DESC(7),
 };
 
 static int p1_regulator_probe(struct platform_device *pdev)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
