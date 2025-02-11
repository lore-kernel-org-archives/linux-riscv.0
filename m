Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D46C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06gKRRCib8PxARbw33ybhVDjLWJ1BlkY4AAQt5gnj/w=; b=MwKLViHMkntIxG
	3MSzvRoYPR1v5hpNJqcQJz7D6dL8ApedlndQHk2gDrKZrTRYMfJlr8NexjB/7+bYlTCW/yN+rotXc
	jQmKmhcO7BjLr+BHd+pEnE+mLIWz5fpj0B8hpNgF70vY11kXmKA1mKBtlj446PLsYgv9CDZPKfbSK
	IpQJmR2zv9L8leGFiSgPs0mZ4OZJaUGnmJ2EYzlNNpt5P2jmImkxrolp8DzPqs4+ihrz2EvrV0JLE
	NrBpR7ST4H2aSx0fyUdeMaS0G8qZGMUa84KUwZ9VudFkkQ6hQG60EzlBJarewzHkBePbBoa8t+Vi7
	2Mwmodfpt+RTB407UoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thif9-00000002ZRr-27KZ;
	Tue, 11 Feb 2025 05:18:23 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thif6-00000002ZQV-21cd
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:18:21 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-471953acfe8so17710681cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 21:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251099; x=1739855899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s2V4LLRLenQ9wtaSUQMyh5fbdoyu5F7c1yyUPQHBKU=;
        b=dJVj2jUWtPr4TdMobQvHfvjhAMZu8nrGYmTic4EPKXOlPiwBHH1KhZ2OJytOSIPJ2D
         8v7luULAq77V2oTuTbY3I883jRldJUpQDrEH5ATLqhoB9Blr3z7NLDZRM5zduUMvrSRL
         IeLROE8JHjbKF2VFguJqW882yIrjcvAN0y3PbkxCs7n0zDu3bi2X+a1dRYl+K5V44n/Y
         FyB1vhxAH3FFK4CmczWJoe3kITUkg15JvunNTHzL9hJMKxJbN+NXPBH68XW2/OwuQ0xV
         7wRrkUS+2SVoePhv6tw2fEsYVzHt7MwPo1+QZ0n1moZYsnR643I6QmmejDbwnJhri+pQ
         BXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251099; x=1739855899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s2V4LLRLenQ9wtaSUQMyh5fbdoyu5F7c1yyUPQHBKU=;
        b=AGwqJ3IUh/HqDNC0K9wAjroNx0f+3psZJFlbW7aYnyS1cp+avf/8OAzbBhtFzofkI9
         6nQhl4k14m2ze5Ka8pNhzWrlz5oT+qV2N6b321TActjoBXzbXlQFFqSX04mQcENA6lbG
         qHweP3FmHWyFQnviTiUCWo2WrgB+FKB6zN5OyhENnOCsibqelBS1uOOp043IIoR51yOC
         xfBntkgL+CamWpCIjhnxjXEyh5CzABF1W961pf+pajMQVtYMPS8uRWzLkaHrEWheUtQx
         EuC6pGPmpCSm+kaLVX/FLNelsytEmocDIJ64BzDGc5IFUILP25qx/XNBbpXpVz0L85jB
         Q3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYPa3S+btqRP92/yO6VDEw7XvawuXwCgll8HNMzEzHNyKjg7ltbqsIdtkz8mtxjqDjDaImoOcIY4N78w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Y+va82DiAb20M2zFy6P0Z7/3S84/dXSUIzd+XWrDckIHEyMG
	QZ1gHjPhM7tdkIa/ZGl2pn7NHMRPSZppSyDkdlxphrZjp82C6YXd
X-Gm-Gg: ASbGnctzvhGwfzA65Dv8y2bupFz26OcUg8PMH5DFGR71wGJnEETK8L8J3N13arbn6+0
	ubGK5AEGyodjY1MOLGl3rCJ6yaewP0yzB+nnGd6Rd8MxqeBlxuymUlqYNDUK91YZRwzXM0luqRR
	1u6kVyXT8MmyhaTeClTAOfBu0Y/mt6G7D2loflckXjfVO5sYMj+hz7cqf88bLWD/NSUtKOinD65
	4I8MXhLM76oiNy54yQxXPUl4JrO4Jlh6AokTaEpp7y9Qn03XZSYuzz77MZa8rR1Hn8=
X-Google-Smtp-Source: AGHT+IE0sgzXr7Llx/28PfETd7C4C8utcmdG2dOhv87WgE3+DjTtw8JROrCY0pmVhK/cU78FbEvf+g==
X-Received: by 2002:a05:622a:8f13:b0:471:843a:6727 with SMTP id d75a77b69052e-471843a9d9cmr110285951cf.32.1739251098177;
        Mon, 10 Feb 2025 21:18:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471a72c7290sm1536191cf.58.2025.02.10.21.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:17 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/8] pinctrl: sophgo: avoid to modify untouched bit when setting cv1800 pinconf
Date: Tue, 11 Feb 2025 13:17:49 +0800
Message-ID: <20250211051801.470800-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_211820_520912_3D769296 
X-CRM114-Status: GOOD (  14.14  )
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

When setting pinconf configuration for cv1800 SoC, the driver just writes
the value. It may zero some bits of the pinconf register and cause some
unexpected error. Add a mask to avoid this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 57f2674e75d6..84b4850771ce 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -574,10 +574,10 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 					 struct cv1800_pin *pin,
 					 unsigned long *configs,
 					 unsigned int num_configs,
-					 u32 *value)
+					 u32 *value, u32 *mask)
 {
 	int i;
-	u32 v = 0;
+	u32 v = 0, m = 0;
 	enum cv1800_pin_io_type type;
 	int ret;
 
@@ -596,10 +596,12 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			v &= ~PIN_IO_PULLDOWN;
 			v |= FIELD_PREP(PIN_IO_PULLDOWN, arg);
+			m |= PIN_IO_PULLDOWN;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			v &= ~PIN_IO_PULLUP;
 			v |= FIELD_PREP(PIN_IO_PULLUP, arg);
+			m |= PIN_IO_PULLUP;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 			ret = cv1800_pinctrl_oc2reg(pctrl, pin, arg);
@@ -607,6 +609,7 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 				return ret;
 			v &= ~PIN_IO_DRIVE;
 			v |= FIELD_PREP(PIN_IO_DRIVE, ret);
+			m |= PIN_IO_DRIVE;
 			break;
 		case PIN_CONFIG_INPUT_SCHMITT_UV:
 			ret = cv1800_pinctrl_schmitt2reg(pctrl, pin, arg);
@@ -614,6 +617,7 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 				return ret;
 			v &= ~PIN_IO_SCHMITT;
 			v |= FIELD_PREP(PIN_IO_SCHMITT, ret);
+			m |= PIN_IO_SCHMITT;
 			break;
 		case PIN_CONFIG_POWER_SOURCE:
 			/* Ignore power source as it is always fixed */
@@ -621,10 +625,12 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 		case PIN_CONFIG_SLEW_RATE:
 			v &= ~PIN_IO_OUT_FAST_SLEW;
 			v |= FIELD_PREP(PIN_IO_OUT_FAST_SLEW, arg);
+			m |= PIN_IO_OUT_FAST_SLEW;
 			break;
 		case PIN_CONFIG_BIAS_BUS_HOLD:
 			v &= ~PIN_IO_BUS_HOLD;
 			v |= FIELD_PREP(PIN_IO_BUS_HOLD, arg);
+			m |= PIN_IO_BUS_HOLD;
 			break;
 		default:
 			return -ENOTSUPP;
@@ -632,17 +638,19 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 	}
 
 	*value = v;
+	*mask = m;
 
 	return 0;
 }
 
 static int cv1800_pin_set_config(struct cv1800_pinctrl *pctrl,
 				 unsigned int pin_id,
-				 u32 value)
+				 u32 value, u32 mask)
 {
 	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
 	unsigned long flags;
 	void __iomem *addr;
+	u32 reg;
 
 	if (!pin)
 		return -EINVAL;
@@ -650,7 +658,10 @@ static int cv1800_pin_set_config(struct cv1800_pinctrl *pctrl,
 	addr = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
-	writel(value, addr);
+	reg = readl(addr);
+	reg &= ~mask;
+	reg |= value;
+	writel(reg, addr);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -662,16 +673,17 @@ static int cv1800_pconf_set(struct pinctrl_dev *pctldev,
 {
 	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
-	u32 value;
+	u32 value, mask;
 
 	if (!pin)
 		return -ENODEV;
 
 	if (cv1800_pinconf_compute_config(pctrl, pin,
-					  configs, num_configs, &value))
+					  configs, num_configs,
+					  &value, &mask))
 		return -ENOTSUPP;
 
-	return cv1800_pin_set_config(pctrl, pin_id, value);
+	return cv1800_pin_set_config(pctrl, pin_id, value, mask);
 }
 
 static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
@@ -682,7 +694,7 @@ static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
 	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
 	const struct cv1800_pin_mux_config *pinmuxs;
-	u32 value;
+	u32 value, mask;
 	int i;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
@@ -692,11 +704,12 @@ static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
 	pinmuxs = group->data;
 
 	if (cv1800_pinconf_compute_config(pctrl, pinmuxs[0].pin,
-					  configs, num_configs, &value))
+					  configs, num_configs,
+					  &value, &mask))
 		return -ENOTSUPP;
 
 	for (i = 0; i < group->grp.npins; i++)
-		cv1800_pin_set_config(pctrl, group->grp.pins[i], value);
+		cv1800_pin_set_config(pctrl, group->grp.pins[i], value, mask);
 
 	return 0;
 }
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
