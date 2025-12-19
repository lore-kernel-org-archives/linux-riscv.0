Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8A4D74961
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeVX3v4vmIY6p82Y8uCK0lHT5oq/OPR6tn+1Wg2Vb44=; b=lrFNd0sssmTtyJ
	Oi4hDlIyV8hl7zmS2RPEh0Qh6U8erosUrtnqZdtN621ZjgJf0urnFQhvQvkVzw41Q+L9nhigF58qc
	hSLgLxNLKq2SCmfNAmCO1AG6dP9NFuidHRh3O5anl8ejUBwPXbJ8m1IJxBmX49SHyw10Vvqb9wfib
	b7tAO6CLwVwH9vyt8IOM+l8OtfacUYJ6W9DMXZfzvN9o/Z9PwP/xIVojgBkSo4Hlqc5gdJPCDXmtQ
	ggPyIHPHIBYntv5bku8cZ2lhe9fSptsZVTwwa3goNQheFnU2q5kxIjD1D+zFzh4N/6/qn0rHkqHOH
	yR7xixYC8iye0x3YGncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8R-00000009lnC-45Jb;
	Fri, 19 Dec 2025 07:42:47 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8P-00000009lmf-2uKy
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 07:42:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so1814602b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 23:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130165; x=1766734965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gskLEpYvfTmHkZ8CaNqOvSk3HkUojmzZhMB2CXBxgs=;
        b=eDEJpBqhXM6zI8KImHp6cZIOc0HFicDJeCkX85syctXSWGA7la3WF7jH9VDwJeS2ED
         TY53hfLwzie/1E/KtgEMVWXnmKwXUubIpBLtNzmBInAwmJdWZco7EDOSA4UldNJS4CiL
         VcJwN4pBmrV7BGZ4PN9+uLUrncotjh+1wHuICqmjEJx+Tsjwm6c+Q3g7sCyd6Hwn+XGs
         CXqHllkizfIiAAa1vOAjgEKysDJFCWOk73cQYNrhxsu/k3Ryed+TJyRBpJXa0leMMRag
         frBI3PWI4QHgQcA+K9Ii5llwJLV2W1aHsfKjCz83fRIFFQv+eCBVpcaFxFUBdBYiMj2h
         0ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130165; x=1766734965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gskLEpYvfTmHkZ8CaNqOvSk3HkUojmzZhMB2CXBxgs=;
        b=hQdxdTpQSyZDS3sLHXrspMYRRC+dtsVxHUB62m/jX9hXnp4G+tG/WD1rbKBYCO3j+G
         lfwDoFHtD7QhtUsP2hEqCfcVy9rgITVM30dx+Xn5PrnxuRv7uOW8CGE/Ise8Q0UxrWDU
         HcanVYSzn2QGiElCNdQ5FN1Od5ML0Cjw2J5yeAnUsEiE/c/GmchdM/KcDoZVzUdOgRB3
         D84iGagO8LBKBMUuvP94h1Yyf+KagCP8M4lMZI0rnVPHjnj7ZIHUwHmsWE2J7iHGG385
         9zBEdgCybpfU4iyx1uwYjvlzlL1lj+9KNNTnX0buB5FjLBdWmfzY/bImqmCSom9o0fI+
         BoBA==
X-Forwarded-Encrypted: i=1; AJvYcCWLDRRLQlXg2qjNPjAPNWxNjJrkZenWFyCAJf3OE8RLkpfQbvIOVj56641yskI47wASy1Ri2wPqV3GIvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmUFG+KSMDENMwe/Y1tBvSSyHvr/x/ipmrXxt8R0nSagFCemjt
	LljRrFUTfLnbZaNAVgZZN1ISVrcDhnVS+Ty7SKRB8c0pyDi09Dye0J/M
X-Gm-Gg: AY/fxX7cNpbNa6kuW6En9JOB+ylrGQuFvciVEIaQAWHIE2E23lnLc8z6ePd+l9ALN8D
	Wauyh0vNo0lici3qgruHdfxgTWf0O8ap0TXrRxAUAQ6qk3MsyVQFTd/habery8ZibQykGT+dDbH
	AjyRJDnCiHSofX8yfT9pvwXW3Ir93E2vjzboVJSSzWBcTVC0OZe7vy/Pr1fhjk6MUgF4WSrkeir
	G14emlURN5aL7uz0XozPp3LDzIyfXdywfsF906htXpS8Oo7piRJcnvxUty32zRMaOuPeQZZ5myL
	gQ9alNrTE6Rp1SrIdxt2jBvoPcWXZ4ziXnsaJ1mX9x2qS1rpeTZivUqCubenmXEFgvVqa8QbbWD
	JpXOV8JegwcnHghxwiuCpFxOnsFgj12iG047Ht0dJNrFRJ/syWel8
X-Google-Smtp-Source: AGHT+IH8um1u+/F9IR4mQclrwTJCUs1YBwb7PhDmU+FSfhTQhTdwaDaF9aezKXIjOn8tGRCOsfD+xw==
X-Received: by 2002:a05:6a00:1d27:b0:7e8:450c:61c1 with SMTP id d2e1a72fcca58-7ff66679547mr1708853b3a.49.1766130164675;
        Thu, 18 Dec 2025 23:42:44 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b4234e2sm1512802b3a.27.2025.12.18.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:44 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:21 +0800
Subject: [PATCH v2 2/3] i2c: k1: add reset support
MIME-Version: 1.0
Message-Id: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=1515;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=Ynzt5v58obwnhda42H/gajIJVLz4GWJg6Tg2WmflUX4=;
 b=qMfQlZSVzRGvXZdg3oEioN5Cn5Xm2J1x59daHMj1raOdC0lTKCnZqnLoQeM/xYyg7eq3aQSEi
 yhbHPR9x9ooAJ1+wCoS5U5WsMyorqPVeBT+RjAIOxX0vOoHqgDQp5hl
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234245_740975_8707E6BD 
X-CRM114-Status: GOOD (  12.25  )
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

The K1 I2C controller provides a reset line that needs to be deasserted
before the controller can be accessed.

Add reset support to the driver to ensure the controller starts in the
required state.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..23661c7ddb67 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -534,6 +535,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = pdev->dev.of_node;
 	struct spacemit_i2c_dev *i2c;
+	struct reset_control *rst;
 	int ret;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -578,6 +580,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to acquire deasserted reset\n");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
