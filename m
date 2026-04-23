Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C693FDEE4D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 23:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeOqSeFtUk5jBqUMFE9lpbeXMf8fqiNq+BKZUImX/rs=; b=oHy/FtHhafxgOw
	p+vD4A2cIhTNxwycx8sluwxzIwgRjR0+UayVVL4IRdqZJ/Cpthp54aLMFKx3otIRIDwETvvIbVTPJ
	BJni7OhfQEMLXD9OMfn0F2RPKteTmPeHivLTJpjszgVGrqUQxmfDduxOhYbZukv2L3y7J8KHPxCDS
	J4ZmGie7VNUJVvjPlxorOJVDw+4ULwRDO3eNR2yq2ybA7m5AXSsW0TA2YQkw6DnJMqS9V7A21YkAd
	R+j5SxQUbTPoUrek6o+1ZjBxLC4mh7QlK6zh0mlC/U7nxJypqkwfJGYXScoFpc8pjqGhT51QvTFsn
	n1DR+WLg2veL7pQ5tCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG35z-0000000COlP-2483;
	Thu, 23 Apr 2026 23:04:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG35x-0000000COkg-1czX
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 23:04:30 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so7711477e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776985467; x=1777590267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tNmFsyAqLll9djiLitvDLt7Sq+VOfMkML8WGxUmnec=;
        b=Yylj4l8ivmn/ElhlLupzF+Y0k9l8LPBSLOnSUM7aFwxL+SN6ibfhe8ST820xdK7JdG
         DEUc5OdXRpkhEalMarlwSSekNfwJ1lHtH8WUbTfV/s6BBGo/NOiPFKaOfNiUYWppXntP
         vKo7oE/7jhHVkRnxqcFc9NqvGGHMwW/kK4iHp1+Kjbzq8j4Awa/kjd80SMW58RVvgdgF
         I9Ql724YTJbfuL45Pf6JqoMFQDFtjaH5lesaShcBuvib3NYUEnC3qGD27k/0sYGG7tGF
         p361q580NKHWzpZvu7QhNpcxYPs7ix9tDF5HobQhfnsNQijGgIA4pjbif2mBDlOLWChT
         Q8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985467; x=1777590267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/tNmFsyAqLll9djiLitvDLt7Sq+VOfMkML8WGxUmnec=;
        b=DfuSRkxlYQutWq72aVRfJX9Gheie9TlNENd2D2Udp/dlTosZlu3WqIF8dKK5zu6Udm
         VlbqX/6YZ+bTStHtvCH9U6rSKAXppOtLj3oWWdVFi73iQRRSC2D8oEelJTCWRifYk8pS
         UY9GYGpn2XYWrd7EHSBJbIVoKxy7GnN4rXCL7Ok+LCw0gx5FOK/hiTE1u1wkeKOSgrd0
         DZ3dw8kWRSoNss79zSc8DLJn96JC02tQVs1XhjZYdQRc0MZykmz/hv//r4h+SgtuWFtR
         ISv8TvoKBk0QbuCLdWmXe+Rw0voRJ1LkailgGQgCtlAX7VM43SP6eEWtQ777sHlN8tGU
         tNdw==
X-Forwarded-Encrypted: i=1; AFNElJ8IHOHQ66NBsjgJ6LHhtV0BZ9cLRgX8c7j7m+KOdD8AxNdMPwY1NMalkpKQOFhnc4fkv2NoxHwZdtyBRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4CfeGDYHEmK8k3hmxww/t0JeCdykHIQhg9/OYuV/MCfxBOlwp
	l2dGSxOXkHaK5ZzKCaAzxBqN+N8jxKmAaAjgU40fvEtIc+RiEuk+0hb6
X-Gm-Gg: AeBDiets1LR+vTIVEwAGxjmyygcu79uBQYmVGEnkF7ldwYDLvB0poHR3/GhdJ7zmDmR
	dptlMlWDJnIJWUpMuDW25Cn9sSQecm7q6uAzveG+FwC51LfGNccvVLdHo34IrvzYCBc+scdLj7R
	RjAQv/yo+o3bivYnJNdvdXv8AdgJb8taORpTxFLy2PUT0RFsOHzhELaGNLwgi/yII/65FFL92Tm
	9spdO0VGrC0oyuRIYeH5WyEvzGTu7MEPZjKPfEWaxERcSP0utF6YOXzFhYeSa6gyuAuYsgPSASM
	bmmB5FCPUXIMtiDSr3Cx7WhXY18aYamF3l8JOokyHO/Mbbod3rvMlcwh5/HkurGKFziCmSzlAst
	hLIlADOq9YUv/3P6AV4tYxY5E3+gKFawpnB3mLv2CQS6p56kKYzD0YZt525xM4vB3Kyl3k4dIhN
	76JsloFLimZGlMBVKHOtnRWfbTqEmyky85bs1yYGzwOIm04qDWaPLRWLHaL3DyAIgDINc=
X-Received: by 2002:a05:6512:118b:b0:5a2:8568:826a with SMTP id 2adb3069b0e04-5a4172eece0mr8485360e87.34.1776985467167;
        Thu, 23 Apr 2026 16:04:27 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm5567888e87.30.2026.04.23.16.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:04:26 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yixun Lan <dlan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
Date: Fri, 24 Apr 2026 02:03:35 +0300
Message-ID: <20260423230338.442497-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260423230338.442497-1-bigunclemax@gmail.com>
References: <20260423230338.442497-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_160429_446128_A81D412A 
X-CRM114-Status: GOOD (  14.35  )
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

From: Maksim Kiselev <bigunclemax@gmail.com>

The __reset_add_reset_gpio_device() function currently expects a GPIO
provider with #gpio-cells=2, which prevents using the GPIO from
controllers with #gpio-cells=3, such as the Allwinner pinctrl and others.

Extend the parsing to support the GPIO phandle with three args,
where:
  args[0]: GPIO bank
  args[1]: GPIO number
  args[2]: GPIO flags

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/reset/core.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 352c2360603b..18fb50ca645f 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -868,7 +868,8 @@ static int reset_add_gpio_aux_device(struct device *parent,
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
 	struct property_entry properties[3] = { };
-	unsigned int offset, of_flags, lflags;
+	unsigned int offset[2], of_flags, lflags;
+	struct software_node_ref_args sw_ref[1];
 	struct reset_gpio_lookup *rgpio_dev;
 	struct device *parent;
 	int id, ret, prop = 0;
@@ -879,7 +880,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * args[1]: GPIO flags
 	 * TODO: Handle other cases.
 	 */
-	if (args->args_count != 2)
+	if (args->args_count != 2 && args->args_count != 3)
 		return -ENOENT;
 
 	/*
@@ -889,8 +890,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	lockdep_assert_not_held(&reset_list_mutex);
 
-	offset = args->args[0];
-	of_flags = args->args[1];
+	offset[0] = args->args[0];
+	if (args->args_count == 2) {
+		of_flags = args->args[1];
+	} else {
+		offset[1] = args->args[1];
+		of_flags = args->args[2];
+	}
 
 	/*
 	 * Later we map GPIO flags between OF and Linux, however not all
@@ -902,7 +908,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	if (of_flags > GPIO_ACTIVE_LOW) {
 		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
-		       of_flags, offset);
+		       of_flags, offset[0]);
 		return -EINVAL;
 	}
 
@@ -923,7 +929,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
 	parent = gpio_device_to_device(gdev);
 	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
-	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
+
+	if (args->args_count == 2)
+		sw_ref[0] = SOFTWARE_NODE_REFERENCE(parent->fwnode, offset[0], lflags);
+	else
+		sw_ref[0] = SOFTWARE_NODE_REFERENCE(parent->fwnode, offset[0], offset[1],
+						    lflags);
+	properties[prop++] = PROPERTY_ENTRY_REF_ARRAY("reset-gpios", sw_ref);
 
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
@@ -1048,10 +1060,11 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 		goto out_unlock;
 	}
 
-	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
-		rstc = ERR_PTR(-EINVAL);
-		goto out_unlock;
-	}
+	if (!(rcdev->dev && fwnode_device_is_compatible(dev_fwnode(rcdev->dev), "reset-gpio")))
+		if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
+			rstc = ERR_PTR(-EINVAL);
+			goto out_unlock;
+		}
 
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
