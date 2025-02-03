Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D14CC02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNV404KOgmiMJVxWFtTqJrvz6An5iTbQkJPwc1iOLhw=; b=Qk4BuorkmqRuTi
	XM8ejdsXGBxTWTVCzywuTCbgZVhQE4Q/12oQTeXPLF22VS9sw6JJnLAkB7pWm9aFJwUfX8/QOjp4n
	jzL1TGFjvlYs0x3w8eC5O/zlcDnomm09mSEz0E8jzjXoXj9FhpmQIlLR8UjU049NPrm+paa82boLs
	YdqGY+JUpTeygNsevSfQo+PXcd/LQOIkmcKjlmUTP9wgoKzQzdceqIwSY5fpvL1T565Tt0YmdKDIK
	N0UxSJPYUpR1igjWRz3Gfg1fBX5GPCHsPNzG+wBXRg3uBiCjJzoveP+PDmHch024tf+LY8NGnFo88
	uC6GMf+9VRL9ZjpK0Vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesAC-0000000Eu9h-0vFK;
	Mon, 03 Feb 2025 08:50:40 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesAA-0000000Eu7j-0oAq
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:50:39 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-46788c32a69so54859621cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572637; x=1739177437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEEke79FPqkO/VnndNMxidgQ7SLPxTG5sIoJEJG0Da4=;
        b=O7O7D55nFKxYZGS+W4PjjNr5ITNRCrzfhZQhWkg2VEM/iuEGsIq294tM7t5gK31Csv
         oF7iph9MGSwEz0JxQJk8Ac6u3OnSijmfcLxqKgHjI74erFMj/rRacKrlUTWhbR10+QXs
         u3Q5+nCs+xD6cQl+m8O5Ci7PXPEFSIKaU4j3oeagPwelIIQOSHfFAuGo7xQQM7NqQVtp
         Wfz2Fu3EUEi6yB/uWL/+w9SKDv1R+Xi4tQko7NK9d8pqfZfc3/zHzXNOXZJJJT1VExFX
         14jSPtQrOIAmFve2pVdXf8PdKxY3JYAZM8v5HRBpPQx7sKF58WdyOvYNi2psxJmCr9Mk
         paSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572637; x=1739177437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEEke79FPqkO/VnndNMxidgQ7SLPxTG5sIoJEJG0Da4=;
        b=W/mNAQHgsAAV8BBMgNvBL7WuH4JLufIf7+buexq6zFpSeeSR/2KzVHucDx9YiV1I5V
         phmPTEwH19OCRQGB2jAwKOn+IikhadcroqaBABPvFJLPgGMEz7fPhWs1y0ac7ZIBljpy
         TYWDBXpO47yA7k2l/M6Pauu1Nx5gmbySLw6+RLbL8BRqKLsvv6mhOQLLgNQWchYrAm6N
         /gfDiFqOFDtSyWnszrgwg+6aH9xxo0IMmDMUStSOFkkrORMMiS0HSIaZq6r66X4ROf5S
         ibO3oO8zw7ZHdDzoSUUIM6zGULjg5xM9WhzeyL6naIT0wtMPmhBBvuT3gHB7/4AKzkXc
         eTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaZjfAcNTU6yg7ADqFxAzEMEsXKOpzna727clRB8By3D9XxD+T43S9Hrg9tfzix3Z6aOfllmTv6syuSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7kjK5xZhDSKzhbFgMmjfPd97kgmn/sgR9dzMCiTUCDGf7aaJX
	RZd+fsNevfXTSzbykdrCrBpmeMs8ASCiJWJfHYdsCtOLJrU1jCZD9uB/nctlq40=
X-Gm-Gg: ASbGncuD5jkYYHM2jTSXYvYgeX7C9M/rVYj8v2mMjJVq/Mo38KKQ06hdTgeCE0wcjPA
	qoJ+flHc9OpYx/A+S7VxKAnC1UkS1u8cbsL7V9EyF20iADW3xl3Nb47klbYN5vIN/uG1XOBLbDI
	B4OhFo9+xOJXDDAKdCOiJSwhMlBxjUoJ4IyIkRAUJEYYpgRc4jK4equ6QmChZeSblACq02qwhUT
	2TRDxpLIICA66tIUa2o0xm4iLXe61M/l9KdFt/N3gK96y6vLLxpJnKst7xWUrQ6OiMmMDe3hPrz
	92jsjRoW8uJcoT6Vv+fOQ1xSs1/NohFxDw10BqnojyPpiltS3NlFXgI=
X-Google-Smtp-Source: AGHT+IE+IlnE299Q+aB/GfcKf7IAlDPJGgUE1d2TnvZN/4dFlqe7+8HMm41wGojjNhxhbX5xqmUG+Q==
X-Received: by 2002:a05:622a:1356:b0:467:87f4:a29f with SMTP id d75a77b69052e-46fd0bce85dmr283644871cf.45.1738572637284;
        Mon, 03 Feb 2025 00:50:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:50:35 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [RFC PATCH v2 06/17] mailbox: Allow controller specific mapping using fwnode
Date: Mon,  3 Feb 2025 14:18:55 +0530
Message-ID: <20250203084906.681418-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005038_236157_9BCAFAD5 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce optional fw_node() callback which allows a mailbox controller
driver to provide controller specific mapping using fwnode.

The Linux OF framework already implements fwnode operations for the
Linux DD framework so the fw_xlate() callback works fine with device
tree as well.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/mailbox.c          | 44 ++++++++++++++++++------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..447edd212f0f 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -402,20 +402,29 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
+	struct fwnode_reference_args fwspec;
 	struct device *dev = cl->dev;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	if (!dev) {
+		pr_debug("%s: No owner device\n", __func__);
 		return ERR_PTR(-ENODEV);
 	}
 
 	mutex_lock(&con_mutex);
 
-	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
+	if (fwnode_property_get_reference_args(dev->fwnode, "mboxes",
+					       "#mbox-cells", 0, index, &fwspec)) {
+		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		mutex_unlock(&con_mutex);
+		return ERR_PTR(-ENODEV);
+	}
+
+	if (dev->of_node &&
+	    of_parse_phandle_with_args(dev->of_node, "mboxes",
 				       "#mbox-cells", index, &spec)) {
 		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		mutex_unlock(&con_mutex);
@@ -423,14 +432,20 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 	}
 
 	chan = ERR_PTR(-EPROBE_DEFER);
-	list_for_each_entry(mbox, &mbox_cons, node)
-		if (mbox->dev->of_node == spec.np) {
+	list_for_each_entry(mbox, &mbox_cons, node) {
+		if (mbox->fw_xlate && mbox->dev->fwnode == fwspec.fwnode) {
+			chan = mbox->fw_xlate(mbox, &fwspec);
+			if (!IS_ERR(chan))
+				break;
+		} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {
 			chan = mbox->of_xlate(mbox, &spec);
 			if (!IS_ERR(chan))
 				break;
 		}
+	}
 
-	of_node_put(spec.np);
+	if (dev->of_node)
+		of_node_put(spec.np);
 
 	if (IS_ERR(chan)) {
 		mutex_unlock(&con_mutex);
@@ -449,15 +464,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
 struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name)
 {
-	struct device_node *np = cl->dev->of_node;
-	int index;
-
-	if (!np) {
-		dev_err(cl->dev, "%s() currently only supports DT\n", __func__);
-		return ERR_PTR(-EINVAL);
-	}
+	int index = device_property_match_string(cl->dev, "mbox-names", name);
 
-	index = of_property_match_string(np, "mbox-names", name);
 	if (index < 0) {
 		dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
 			__func__, name);
@@ -495,8 +503,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -549,8 +557,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	mutex_lock(&con_mutex);
 	list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..74352c244aba 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -66,6 +66,7 @@ struct mbox_chan_ops {
  *			no interrupt rises. Ignored if 'txdone_irq' is set.
  * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
  *			last TX's status after these many millisecs
+ * @fw_xlate:		Controller driver specific mapping of channel via fwnode
  * @of_xlate:		Controller driver specific mapping of channel via DT
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
@@ -79,6 +80,8 @@ struct mbox_controller {
 	bool txdone_irq;
 	bool txdone_poll;
 	unsigned txpoll_period;
+	struct mbox_chan *(*fw_xlate)(struct mbox_controller *mbox,
+				      const struct fwnode_reference_args *sp);
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
 	/* Internal to API */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
