Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0DFC021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2hITfLQVlaZnImj2PaiYKtmexoW7rHEZ5NEirWlZWI=; b=gJ1mTV4EW3cS42
	jNJPljdowV+sKVuDDhC5hT8Qlj+YzpLXST0qeBuvIO5GBn1aW1yJQwTEFYLM1wiWb7mu/PYmNWp3s
	jkB58fwEmZA3TchcmvvrUo+k77fNud3OqiIWwWq0rN65lADlpnPdg8jXpcT6xqwz9nIS0BmzQMkXc
	+nmHVZlqn+GagAQvqS40hCYykHl6KzjqQfLlFBtq3NRjoT+HlGaq8QWgy0PW2OKovaPZGi/i4zSFs
	PTFOArnO5KQwqS8ov1+lqYvpIcgx9Dhy9heKDT5LoMpkvhdyusr/kkN82RPHSYUnl9S73nN1S+ljQ
	oCCpMTXAShcwTpLfjahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thifJ-00000002ZZh-2RS6;
	Tue, 11 Feb 2025 05:18:33 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thifG-00000002ZWl-2pG9
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:18:31 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c05bb6dab7so191444085a.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 21:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251109; x=1739855909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poc9ENXqKVPNF8DTj7KzQGMBTyzMXbOSxaH/2APwExQ=;
        b=HHSwOgmF+D2wuFRFSVQDmciGnhp+e+mNUbd+aUu5gZ0oiwPxRq3U1u0Rv6rYXgUfR4
         LxwSzGU57p0E3G/zHBxlRZLv+TPDrgWYDlsVy9L74JRQSJ1zhJ3MH5sCWN3fNxCn/gox
         6fs+IneoJHk/QFNJYZm3TG5p3N10HSabgLBJAYb41tjvHXI00CTgQnej9j1wuZWazduK
         3RnvFgOlsEfAPXau4C0OM/q5+2bw5eacUfZvKoypJwBiA2KVmWhMX8hxrj48DZx8CSld
         ZBk5kSpa3E5zypQovxhUZPki3HsGjEm/xdmonk4GKK35WfovhM+kgaNpc073U2Wr/YwV
         B5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251109; x=1739855909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poc9ENXqKVPNF8DTj7KzQGMBTyzMXbOSxaH/2APwExQ=;
        b=WMwiNWTb0SkyHyrPxVhXMhvDYfZBPvV53VJSWJeIHSydZjdvzzsCB8J6Z34VjNqfXv
         YHg2844YOuDwbllugvyK+Fw4LjXuT7Hbd/d1WbEU8nKhfXjzlOAudD5J25LpilSXHzpg
         q89rMbjJAJIa78muYvXyzEKhpCM5sCw3IfupgNpPYqBRC8g5Fk4nbc1lOEJfuQip+Yvx
         vPs/261EYlpgZxo+lNAmZzrd9BYm9aipZhP72nKCewlgqnXDxQAYzhMjtZY54bRmJJeP
         R2oHpr1vrFUFx8S27zChV0WtawzVW2r4EaTnBL0akD0fsHy6Ss4JAtwjXXnqq+8hsSGe
         xC1g==
X-Forwarded-Encrypted: i=1; AJvYcCVvr2NqrQO31tTNLiYyv3Y0teuYKqIELAVTepygpUdyPk0pQr4CAF+IyIepTFG/VPnnHh0W7Jv8R14v7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YypjRaPp0dxhxMPpTPghocrEYVjvwtAvmjLBH/KX4LIedbCuGM8
	R4gQJa043AQ3v/MEC0G0lExrUfuulwidwK9jwQdGZSZpYRn4wL3t9qFfSQ==
X-Gm-Gg: ASbGncsls6DT83YrY6FnOGKuXXfZ5p64WLrEuYN2iA2RzPKK6EhPxjwxsb6so6FxE7z
	1vM0DOVRItd/4EOsVXR1tj1PaO2Qn6XMM4TmbNK+ZUUcJ4ypCWvhrcBcPBxSTNRYPoBcMvZd46e
	KFdsNnM5FPC90xTywebDWJfTtK9leie8z+MU2V/qbuSVcAWxxEcIWEVhPKMg0k+y4ZnWl2igJ9K
	tjVCYLxeDQ8O+0dylkC1wX6qL1+iXFqxR0/w/inM2dH4Xmk/gH3kAm+n/DTb8aTSDk=
X-Google-Smtp-Source: AGHT+IEvhcugznmsjseS+tMKWpG9GOC9ZKXh5Uw24qArteD2RjcftIydSimNxYJ6mY71u31jEC4wHw==
X-Received: by 2002:a05:620a:1708:b0:7a8:554:c368 with SMTP id af79cd13be357-7c068f8a167mr333858885a.6.1739251109432;
        Mon, 10 Feb 2025 21:18:29 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c056b42b89sm336559985a.69.2025.02.10.21.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:29 -0800 (PST)
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
Subject: [PATCH v2 4/8] pinctrl: sophgo: introduce generic probe function
Date: Tue, 11 Feb 2025 13:17:52 +0800
Message-ID: <20250211051801.470800-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_211830_718025_A24E0B7D 
X-CRM114-Status: GOOD (  18.46  )
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

Since different series of the Sophgo chip share a common pinctrl data
structure. It is necessary to add a common probe function to alloc
the this data structure. Add pctrl_init callback to allow soc to perform
its own initialization.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      |  5 +-
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      |  5 +-
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 59 ++++---------------
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       |  5 +-
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       |  5 +-
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       |  5 +-
 .../pinctrl/sophgo/pinctrl-sophgo-common.c    | 47 +++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sophgo.h       |  7 +++
 8 files changed, 86 insertions(+), 52 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
index ca6fb374ee15..82db60212477 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
@@ -443,6 +443,9 @@ static const struct sophgo_pinctrl_data cv1800b_pindata = {
 	.pdnames	= cv1800b_power_domain_desc,
 	.vddio_ops	= &cv1800b_vddio_cfg_ops,
 	.cfg_ops	= &cv1800_cfg_ops,
+	.pctl_ops	= &cv1800_pctrl_ops,
+	.pmx_ops	= &cv1800_pmx_ops,
+	.pconf_ops	= &cv1800_pconf_ops,
 	.npins		= ARRAY_SIZE(cv1800b_pins),
 	.npds		= ARRAY_SIZE(cv1800b_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
@@ -455,7 +458,7 @@ static const struct of_device_id cv1800b_pinctrl_ids[] = {
 MODULE_DEVICE_TABLE(of, cv1800b_pinctrl_ids);
 
 static struct platform_driver cv1800b_pinctrl_driver = {
-	.probe	= cv1800_pinctrl_probe,
+	.probe	= sophgo_pinctrl_probe,
 	.driver	= {
 		.name			= "cv1800b-pinctrl",
 		.suppress_bind_attrs	= true,
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
index df2c2697a1fd..881a4d7ef589 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
@@ -752,6 +752,9 @@ static const struct sophgo_pinctrl_data cv1812h_pindata = {
 	.pdnames	= cv1812h_power_domain_desc,
 	.vddio_ops	= &cv1812h_vddio_cfg_ops,
 	.cfg_ops	= &cv1800_cfg_ops,
+	.pctl_ops	= &cv1800_pctrl_ops,
+	.pmx_ops	= &cv1800_pmx_ops,
+	.pconf_ops	= &cv1800_pconf_ops,
 	.npins		= ARRAY_SIZE(cv1812h_pins),
 	.npds		= ARRAY_SIZE(cv1812h_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
@@ -764,7 +767,7 @@ static const struct of_device_id cv1812h_pinctrl_ids[] = {
 MODULE_DEVICE_TABLE(of, cv1812h_pinctrl_ids);
 
 static struct platform_driver cv1812h_pinctrl_driver = {
-	.probe	= cv1800_pinctrl_probe,
+	.probe	= sophgo_pinctrl_probe,
 	.driver	= {
 		.name			= "cv1812h-pinctrl",
 		.suppress_bind_attrs	= true,
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 66111110c4b3..c3a2dcf71f2a 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -15,8 +15,6 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -25,7 +23,6 @@
 #include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
 
 #include "../pinctrl-utils.h"
-#include "../pinconf.h"
 #include "../pinmux.h"
 #include "pinctrl-cv18xx.h"
 
@@ -195,7 +192,7 @@ static int cv1800_dt_node_to_map_post(struct device_node *cur,
 	return cv1800_set_power_cfg(pctrl, pin->power_domain, power);
 }
 
-static const struct pinctrl_ops cv1800_pctrl_ops = {
+const struct pinctrl_ops cv1800_pctrl_ops = {
 	.get_groups_count	= pinctrl_generic_get_group_count,
 	.get_group_name		= pinctrl_generic_get_group_name,
 	.get_group_pins		= pinctrl_generic_get_group_pins,
@@ -203,6 +200,7 @@ static const struct pinctrl_ops cv1800_pctrl_ops = {
 	.dt_node_to_map		= sophgo_pctrl_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
+EXPORT_SYMBOL_GPL(cv1800_pctrl_ops);
 
 static void cv1800_set_pinmux_config(struct sophgo_pinctrl *pctrl,
 				     const struct sophgo_pin *sp, u32 config)
@@ -224,13 +222,14 @@ static void cv1800_set_pinmux_config(struct sophgo_pinctrl *pctrl,
 		writel_relaxed(mux2, reg_mux2);
 }
 
-static const struct pinmux_ops cv1800_pmx_ops = {
+const struct pinmux_ops cv1800_pmx_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
 	.set_mux		= sophgo_pmx_set_mux,
 	.strict			= true,
 };
+EXPORT_SYMBOL_GPL(cv1800_pmx_ops);
 
 #define PIN_IO_PULLUP		BIT(2)
 #define PIN_IO_PULLDOWN		BIT(3)
@@ -404,37 +403,25 @@ static int cv1800_set_pinconf_config(struct sophgo_pinctrl *pctrl,
 	return 0;
 }
 
-static const struct pinconf_ops cv1800_pconf_ops = {
+const struct pinconf_ops cv1800_pconf_ops = {
 	.pin_config_get			= cv1800_pconf_get,
 	.pin_config_set			= sophgo_pconf_set,
 	.pin_config_group_set		= sophgo_pconf_group_set,
 	.is_generic			= true,
 };
+EXPORT_SYMBOL_GPL(cv1800_pconf_ops);
 
-int cv1800_pinctrl_probe(struct platform_device *pdev)
+static int cv1800_pinctrl_init(struct platform_device *pdev,
+			       struct sophgo_pinctrl *pctrl)
 {
-	struct device *dev = &pdev->dev;
-	struct sophgo_pinctrl *pctrl;
+	const struct sophgo_pinctrl_data *pctrl_data = pctrl->data;
 	struct cv1800_priv *priv;
-	const struct sophgo_pinctrl_data *pctrl_data;
-	int ret;
 
-	pctrl_data = device_get_match_data(dev);
-	if (!pctrl_data)
-		return -ENODEV;
-
-	if (pctrl_data->npins == 0 || pctrl_data->npds == 0)
-		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
-
-	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
-	if (!pctrl)
-		return -ENOMEM;
-
-	priv = devm_kzalloc(dev, sizeof(struct cv1800_priv), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct cv1800_priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->power_cfg = devm_kcalloc(dev, pctrl_data->npds,
+	priv->power_cfg = devm_kcalloc(&pdev->dev, pctrl_data->npds,
 				       sizeof(u32), GFP_KERNEL);
 	if (!priv->power_cfg)
 		return -ENOMEM;
@@ -447,33 +434,13 @@ int cv1800_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs[1]))
 		return PTR_ERR(priv->regs[1]);
 
-	pctrl->pdesc.name = dev_name(dev);
-	pctrl->pdesc.pins = pctrl_data->pins;
-	pctrl->pdesc.npins = pctrl_data->npins;
-	pctrl->pdesc.pctlops = &cv1800_pctrl_ops;
-	pctrl->pdesc.pmxops = &cv1800_pmx_ops;
-	pctrl->pdesc.confops = &cv1800_pconf_ops;
-	pctrl->pdesc.owner = THIS_MODULE;
-
-	pctrl->data = pctrl_data;
 	pctrl->priv_ctrl = priv;
-	pctrl->dev = dev;
-	raw_spin_lock_init(&pctrl->lock);
-	mutex_init(&pctrl->mutex);
 
-	platform_set_drvdata(pdev, pctrl);
-
-	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
-					     pctrl, &pctrl->pctrl_dev);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "fail to register pinctrl driver\n");
-
-	return pinctrl_enable(pctrl->pctrl_dev);
+	return 0;
 }
-EXPORT_SYMBOL_GPL(cv1800_pinctrl_probe);
 
 const struct sophgo_cfg_ops cv1800_cfg_ops = {
+	.pctrl_init = cv1800_pinctrl_init,
 	.verify_pinmux_config = cv1800_verify_pinmux_config,
 	.verify_pin_group = cv1800_verify_pin_group,
 	.dt_node_to_map_post = cv1800_dt_node_to_map_post,
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 821e554e550b..759c0e604acf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -68,10 +68,11 @@ static inline enum cv1800_pin_io_type cv1800_pin_io_type(const struct cv1800_pin
 	return FIELD_GET(CV1800_PIN_IO_TYPE, pin->pin.flags);
 };
 
+extern const struct pinctrl_ops cv1800_pctrl_ops;
+extern const struct pinmux_ops cv1800_pmx_ops;
+extern const struct pinconf_ops cv1800_pconf_ops;
 extern const struct sophgo_cfg_ops cv1800_cfg_ops;
 
-int cv1800_pinctrl_probe(struct platform_device *pdev);
-
 #define CV1800_FUNC_PIN(_id, _power_domain, _type,			\
 			_mux_area, _mux_offset, _mux_func_max)		\
 	{								\
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2000.c b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
index 9580bd285699..0e303d2fa104 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2000.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
@@ -752,6 +752,9 @@ static const struct sophgo_pinctrl_data sg2000_pindata = {
 	.pdnames	= sg2000_power_domain_desc,
 	.vddio_ops	= &sg2000_vddio_cfg_ops,
 	.cfg_ops	= &cv1800_cfg_ops,
+	.pctl_ops	= &cv1800_pctrl_ops,
+	.pmx_ops	= &cv1800_pmx_ops,
+	.pconf_ops	= &cv1800_pconf_ops,
 	.npins		= ARRAY_SIZE(sg2000_pins),
 	.npds		= ARRAY_SIZE(sg2000_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
@@ -764,7 +767,7 @@ static const struct of_device_id sg2000_pinctrl_ids[] = {
 MODULE_DEVICE_TABLE(of, sg2000_pinctrl_ids);
 
 static struct platform_driver sg2000_pinctrl_driver = {
-	.probe	= cv1800_pinctrl_probe,
+	.probe	= sophgo_pinctrl_probe,
 	.driver	= {
 		.name			= "sg2000-pinctrl",
 		.suppress_bind_attrs	= true,
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2002.c b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
index e3041a8b8ba6..2443fff1bc00 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2002.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
@@ -523,6 +523,9 @@ static const struct sophgo_pinctrl_data sg2002_pindata = {
 	.pdnames	= sg2002_power_domain_desc,
 	.vddio_ops	= &sg2002_vddio_cfg_ops,
 	.cfg_ops	= &cv1800_cfg_ops,
+	.pctl_ops	= &cv1800_pctrl_ops,
+	.pmx_ops	= &cv1800_pmx_ops,
+	.pconf_ops	= &cv1800_pconf_ops,
 	.npins		= ARRAY_SIZE(sg2002_pins),
 	.npds		= ARRAY_SIZE(sg2002_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
@@ -535,7 +538,7 @@ static const struct of_device_id sg2002_pinctrl_ids[] = {
 MODULE_DEVICE_TABLE(of, sg2002_pinctrl_ids);
 
 static struct platform_driver sg2002_pinctrl_driver = {
-	.probe	= cv1800_pinctrl_probe,
+	.probe	= sophgo_pinctrl_probe,
 	.driver	= {
 		.name			= "sg2002-pinctrl",
 		.suppress_bind_attrs	= true,
diff --git a/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c b/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
index 957d84e75643..7f1fd68db19e 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
@@ -400,5 +400,52 @@ int sophgo_pinctrl_reg2schmitt(struct sophgo_pinctrl *pctrl,
 	return map[reg];
 }
 
+int sophgo_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sophgo_pinctrl *pctrl;
+	const struct sophgo_pinctrl_data *pctrl_data;
+	int ret;
+
+	pctrl_data = device_get_match_data(dev);
+	if (!pctrl_data)
+		return -ENODEV;
+
+	if (pctrl_data->npins == 0)
+		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->pdesc.name = dev_name(dev);
+	pctrl->pdesc.pins = pctrl_data->pins;
+	pctrl->pdesc.npins = pctrl_data->npins;
+	pctrl->pdesc.pctlops = pctrl_data->pctl_ops;
+	pctrl->pdesc.pmxops = pctrl_data->pmx_ops;
+	pctrl->pdesc.confops = pctrl_data->pconf_ops;
+	pctrl->pdesc.owner = THIS_MODULE;
+
+	pctrl->data = pctrl_data;
+	pctrl->dev = dev;
+	raw_spin_lock_init(&pctrl->lock);
+	mutex_init(&pctrl->mutex);
+
+	ret = pctrl->data->cfg_ops->pctrl_init(pdev, pctrl);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, pctrl);
+
+	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
+					     pctrl, &pctrl->pctrl_dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "fail to register pinctrl driver\n");
+
+	return pinctrl_enable(pctrl->pctrl_dev);
+}
+EXPORT_SYMBOL_GPL(sophgo_pinctrl_probe);
+
 MODULE_DESCRIPTION("Common pinctrl helper function for the Sophgo SoC");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/sophgo/pinctrl-sophgo.h b/drivers/pinctrl/sophgo/pinctrl-sophgo.h
index f8b094a09f7c..4cd9b5484894 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sophgo.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sophgo.h
@@ -29,6 +29,7 @@ struct sophgo_pin_mux_config {
 /**
  * struct sophgo_cfg_ops - pin configuration operations
  *
+ * @pctrl_init: soc specific init callback
  * @verify_pinmux_config: verify the pinmux config for a pin
  * @verify_pin_group: verify the whole pinmux group
  * @dt_node_to_map_post: post init for the pinmux config map
@@ -37,6 +38,8 @@ struct sophgo_pin_mux_config {
  * @set_pinmux_config: set mux config (the caller holds lock)
  */
 struct sophgo_cfg_ops {
+	int (*pctrl_init)(struct platform_device *pdev,
+			  struct sophgo_pinctrl *pctrl);
 	int (*verify_pinmux_config)(const struct sophgo_pin_mux_config *config);
 	int (*verify_pin_group)(const struct sophgo_pin_mux_config *pinmuxs,
 				unsigned int npins);
@@ -81,6 +84,9 @@ struct sophgo_pinctrl_data {
 	const char				* const *pdnames;
 	const struct sophgo_vddio_cfg_ops	*vddio_ops;
 	const struct sophgo_cfg_ops		*cfg_ops;
+	const struct pinctrl_ops		*pctl_ops;
+	const struct pinmux_ops			*pmx_ops;
+	const struct pinconf_ops		*pconf_ops;
 	u16					npins;
 	u16					npds;
 	u16					pinsize;
@@ -125,5 +131,6 @@ int sophgo_pinctrl_schmitt2reg(struct sophgo_pinctrl *pctrl,
 int sophgo_pinctrl_reg2schmitt(struct sophgo_pinctrl *pctrl,
 			       const struct sophgo_pin *pin,
 			       const u32 *power_cfg, u32 reg);
+int sophgo_pinctrl_probe(struct platform_device *pdev);
 
 #endif /* _PINCTRL_SOPHGO_H */
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
