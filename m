Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F3BCD5BA4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcWE3+75fyXRHKCow7Oe3A4Vw+gEtJz1oRqvl3LsI+U=; b=A88x2f7PrXFJCP
	upK/Pt0b4y5JuuU0rJsmFxYzNcGjoOK8YQuBqXrE9s2wsL8n+VOafsNYdxdVEc7AkVTtZLWZ70p/K
	A5QPa+UnHfRwbM3sqDEo9scshO0Ou4Ar78URoprYn6LIszxjWIYXcaQnYE6pjQ/gPfXVitf5COWTm
	oIoaDoXAowCNzVzoiMq98S5cmdaWjmj+/KEd6i1xkVGNYjpMqzF88H45R1xqhgiz/X9KD2HHxkFHM
	H1s0z5dhKaZ6/r1akljfhuDHf0a+j04EYclnTW7pxyeYYovefBl6GcPPmmp3pxL6xJBYbzedSS9kU
	GOajKssjBXGVyON45tVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtL-00000000wyg-245K;
	Tue, 19 May 2026 09:37:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtJ-00000000wxK-3Gh8
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D59F46020F;
	Tue, 19 May 2026 09:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF393C2BCF5;
	Tue, 19 May 2026 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183452;
	bh=29NbVoajZTtTH3m99IJaWbdrnfsufS249hOJeHdzXU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMFgm7DlWGoa7FcFXbiQRhV9j8RlzxJgmeRJBLRuVhaqBejVJ/8z9J/lMaHtm2QnC
	 R11PoknF+h93yNyjpJQ4ew5cakznV/a2eYDlUsSDo+G2ZmQa1VS9FLa0t9PAqa2/lu
	 S/xwtETlFhe4WXerU3y/7Rd/Eex1xLjXOrl+/00KOMlDMIaENnF6rak2vkWHzqV8zX
	 LF/k5gJr6VU4MWi+MrXbc5BknbfMIebrsNr/zsoNK4pL3SpGLBohmNsfOXxckHiqjC
	 jIRVMoMj7fKrIX+Em8rUG5StGkHrZjOvM+AzGOu8a/2BWFMpLYDRrLsGrjuir8N5AJ
	 1wTPWlwC20qzw==
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
Subject: [PATCH v2 2/4] pinctrl: add new generic groups/function creation function for pinmux
Date: Tue, 19 May 2026 10:37:23 +0100
Message-ID: <20260519-storm-karma-e457ea68904a@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7907; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=m1LZQAbTBJymAR9P4E9u1jLAfhLsJ/LYRIX80WcFFg0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+kGvFH9+Xf4miyuntTJEiMfpaY/eK22BgxrpfT62W fdWxAp1lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIFWYwMr/9bf90voBU99+/q 55On35M77einOqHqud+5hPmZ7LPPv2Fk+GK9/W2AVk1LzvR6dY7sqbsTl944K7BH+qr3TLaoPt1 7HAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Akin to my recently added pinctrl_generic_pins_functions_dt_node_to_map(),
create an analogue that performs the same role of dynamically creating
groups at runtime for controllers using the pinmux property.
The pinmux property is freeform, so this function mandates that the
upper 16 bits contain the pin and the lower 16 bits contains the mux
setting. The group's data pointer is populated with an array of the mux
settings for each pin it contains.

Since the node parsing and subsequent pinctrl core function calls are
practically identical to the pins + functions case, other than which
properties are examined, it makes sense to extract the common code from
pinctrl_generic_pins_function_dt_node_to_map() into a generic function
that takes the case-specific devicetree parsing function as an argument.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         |  14 ++++
 drivers/pinctrl/pinctrl-generic.c | 119 ++++++++++++++++++++++++------
 2 files changed, 112 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index b2fb757cc6ecb..2e40512fed776 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -173,6 +173,11 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 						 struct pinctrl_map **maps,
 						 unsigned int *num_maps);
 
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps);
+
 int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
@@ -188,6 +193,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return -ENOTSUPP;
 }
 
+static inline int
+pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+				      struct device_node *np,
+				      struct pinctrl_map **maps,
+				      unsigned int *num_maps)
+{
+	return -ENOTSUPP;
+}
+
 static inline int
 pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       struct device_node *np, struct pinctrl_map **maps,
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index a3faad7911cbf..9759b0186bcc2 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -119,17 +119,64 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 				      functions, pins, npins);
 }
 
-/*
- * For platforms that do not define groups or functions in the driver, but
- * instead use the devicetree to describe them. This function will, unlike
- * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
- * and functions, create them in addition to parsing pinconf properties and
- * adding mappings.
- */
-int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
-						 struct device_node *np,
-						 struct pinctrl_map **maps,
-						 unsigned int *num_maps)
+static int pinctrl_generic_pinmux_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+						    struct device_node *parent,
+						    struct device_node *np,
+						    struct pinctrl_map **maps,
+						    unsigned int *num_maps,
+						    unsigned int *num_reserved_maps,
+						    const char **group_names,
+						    unsigned int ngroups)
+{
+	struct device *dev = pctldev->dev;
+	unsigned int *pins, *muxes;
+	int npins, ret;
+
+	npins = of_property_count_u32_elems(np, "pinmux");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	muxes = devm_kcalloc(dev, npins, sizeof(*muxes), GFP_KERNEL);
+	if (!muxes)
+		return -ENOMEM;
+
+	for (int i = 0; i < npins; i++) {
+		unsigned int pinmux;
+
+		ret = of_property_read_u32_index(np, "pinmux", i, &pinmux);
+		if (ret)
+			return ret;
+
+		pins[i] = pinmux >> 16;
+		muxes[i] = pinmux & GENMASK(15, 0);
+	}
+
+	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
+				      num_reserved_maps, group_names, ngroups,
+				      muxes, pins, npins);
+}
+
+static int pinctrl_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps,
+					  int (dt_subnode_to_map)(
+						  struct pinctrl_dev *,
+						  struct device_node *,
+						  struct device_node *,
+						  struct pinctrl_map **,
+						  unsigned int *,
+						  unsigned int *,
+						  const char **,
+						  unsigned int))
 {
 	struct device *dev = pctldev->dev;
 	struct device_node *child_np;
@@ -152,11 +199,8 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!group_names)
 		return -ENOMEM;
 
-	ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
-							      maps, num_maps,
-							      &num_reserved_maps,
-							      group_names,
-							      ngroups);
+	ret = dt_subnode_to_map(pctldev, np, np, maps, num_maps,
+				&num_reserved_maps, group_names, ngroups);
 	if (ret) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
@@ -180,11 +224,8 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	ngroups = 0;
 	for_each_available_child_of_node_scoped(np, child_np) {
-		ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, child_np,
-								      maps, num_maps,
-								      &num_reserved_maps,
-								      group_names,
-								      ngroups);
+		ret = dt_subnode_to_map(pctldev, np, child_np, maps, num_maps,
+					&num_reserved_maps, group_names, ngroups);
 		if (ret) {
 			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
@@ -202,4 +243,40 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	return 0;
 }
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ */
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pins_function_dt_subnode_to_map);
+}
 EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ *
+ * It assumes that the upper 16 bits of the pinmux items contain the pin
+ * and the lower 16 the mux setting.
+ */
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pinmux_dt_subnode_to_map);
+};
+EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
