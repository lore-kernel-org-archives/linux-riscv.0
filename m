Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24716CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+7LUlfDqIcifAR18B3TYajc4eocA8Bey2sh14t+AkA=; b=K1ebzACqGwcbMr
	ELNQUbJj7CPG/GEL+Ymynj8ZG/aiyLcXrtbnBPBbTcvq/Nz9WRCcJqjuh1lO5x7TM+NnZ17rGGi9y
	N/nJckFNLlbJwWMglvvTdSZkH+JtiBkgqFeKvIG3VBfKSdFY2b0u4kcbVrY/E23UaASxkn2tMw9Lt
	YSBCVjFQ2LdcmCRaawONsLXeX873at2LPk8lQal6j4QNhfXFzngN2s8hswIE2wdgCC8jHHXb9PXdy
	5Z+8+GafqO+dVP7NKjJ8SkBXTK3+O3cJErkC0DHxqXICahv4IAcNKzPa1zlbe0FVzCSAORrF/0wA3
	UoLE9xNLuDnFoRjXkhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtJ-00000000wxP-1hQq;
	Tue, 19 May 2026 09:37:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtH-00000000wvz-0kx9
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:37:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 735B44452C;
	Tue, 19 May 2026 09:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE0C2BCC6;
	Tue, 19 May 2026 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183450;
	bh=RFyrFTiNvN7xCwsRMUno2FUHCmve5OC3JrfqhPiTFJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bv/kf4aU8lc5/mevxSccRStEldhW3GXPxrki7RGX8i27r4wSdpwjHfGfyAL9uMRwu
	 yZz7LBn+oBSfUHwgGJg0u4Mk1Ni+A6MrF94XX+wtpZTib3TEs901qzKHyFO7ss0P2k
	 qMNDF0S/hDIwYp91PKssMf7iJT+h9esiphi4swjwqrhbnj/WRzb+jD23IQhQ2EhwYx
	 gjhmYK3TU2goDj75SzDTgmCUUVlTdxMe+HvnWz2r58/+W+xusU6nGBl5+xjLmGHzxu
	 TStjzL4l9uNBe29zdqN46yXqc6MYQ+rfJHSXIllRK/dIHqVrNKjiMp3K0R8C2/v8e5
	 Q72TGYTewNEwA==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 1/4] pinctrl: generic: change signature of pinctrl_generic_to_map() to pass void data
Date: Tue, 19 May 2026 10:37:22 +0100
Message-ID: <20260519-plod-irritable-632bb27b8110@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IKzfFin2jBmcdZM/cVLi/EAoXE7JtVz0kxmyuCS5/1c=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+kHH5N7O3LX9DZ/M5Pdrl+7d+v7Y3VW72A/fTFn2I L55fpbzsY5SFgYxLgZZMUWWxNt9LVLr/7jscO55CzOHlQlkCAMXpwBMpGEmI8M8nu0+Cus8C6+1 iqSX7Z5wLXjGH9Grn+Y2NBW1zdNnyNJi+Kf1MVeX55V96tqAo+XHSqcEXDbVfm6kmZT3+PZkbY2 2r/wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023731_259282_849AFEDA 
X-CRM114-Status: GOOD (  11.34  )
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

From: Conor Dooley <conor.dooley@microchip.com>

In order to make pinctrl_generic_to_map() usable for controllers that
use pinmux, change the functions char array pointer that it passes to
pinctrl_generic_add_group() to a void pointer. In the pinmux case this
property will contain the mux setting as a number rather than as strings
in the pins + functions case.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         | 6 ++----
 drivers/pinctrl/pinctrl-generic.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 9711d16c38b62..b2fb757cc6ecb 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -177,8 +177,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
 			   const char **group_name, unsigned int ngroups,
-			   const char **functions, unsigned int *pins,
-			   unsigned int npins);
+			   void *data, unsigned int *pins, unsigned int npins);
 #else
 static inline int
 pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -194,8 +193,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       struct device_node *np, struct pinctrl_map **maps,
 		       unsigned int *num_maps, unsigned int *num_reserved_maps,
 		       const char **group_name, unsigned int ngroups,
-		       const char **functions, unsigned int *pins,
-		       unsigned int npins)
+		       void *data, unsigned int *pins, unsigned int npins)
 {
 	return -ENOTSUPP;
 }
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index e4cd16ce2bda3..a3faad7911cbf 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -21,8 +21,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
 			   const char **group_names, unsigned int ngroups,
-			   const char **functions, unsigned int *pins,
-			   unsigned int npins)
+			   void *data, unsigned int *pins, unsigned int npins)
 {
 	struct device *dev = pctldev->dev;
 	unsigned int num_configs;
@@ -45,7 +44,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 	if (ret < 0)
 		return ret;
 
-	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
+	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, data);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
 				     group_name, ret);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
