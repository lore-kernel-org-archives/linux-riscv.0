Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4837C83F0C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89OCfY1A1Mz5H+RKsvkGy/QsDcymgoYZbOgrxgq3pYA=; b=VNrHQvePk4eeaD
	EWks3PXimyVpdYIKyzV98UXO+d/MvWSnyFVoFxE4K52d7enDIq8G8bv01hfz/PPrNhzcGuE+HntjC
	xcX3il6ncm4qO7zTbNnmtSptlUjicgFGDhSg7BZK9Cpg/4oKjoNbBrGlhJvhIjNEjWSOi7QvHcGBx
	GIFda+zAYQNV7hCcRIIQr2DjVv5mhnt83Lz1+9oabGAOuR5prb44Bpp6Kshjn2nw2klnS9Qe1SA3J
	54VlbDuMeWwVt46u7RWAUJ3ELGdRftOITSbymHl0tARix92p4T9XqDXuYOM3RfiHcJ8nyXzgKNgTR
	D14mDAwiUNGhuR0gOVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVx-0000000DUtQ-2T6V;
	Fri, 04 Jul 2025 07:07:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaTx-0000000DUO4-3s86
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:05:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-31393526d0dso539916a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612713; x=1752217513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=nd7Gds7DN/XxzMCxlYOTGC4DHvOPF+1E9uVvTlNc7OuRZlKxSm+4FZteiv2D9y06xx
         bWfUXhmw185NuJmWb7pk/H0SYJvk1JkKEu0Z4iqRuS1XDbVkG5s1WH5A/tEicckjcMSC
         It9vbytRL5TZcDNLCEGSnV00PCVwURDFdioD8YU0CkkJUuNH8jIGtbY55izelPqICa/7
         N6SQeBQZkHHWmJDwbI1wjhybwkpWsg+jkHSKrtsjrNs3arzLvLHpfnrJ7/vns6pt4T2D
         QjT573aUrVIgZfRoQ798BpqrJL2jv0Y/aPuhCGAM/v6QyeeeN/jw4MmDFQoT5x5JnwjU
         IAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612713; x=1752217513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=DWUPlnRTlc7A5HfD3odL5K9mRvnmFS6j0i8/VkWHb1z4/hIZWgRW1Wb3xsU/TY+Z7o
         ww5/kDsUAcleSPTwA/22AEaw62f/oMVJm9wrGy6dsvVP6rzMWrpAkbcOAjOyl5lppVwI
         2jXvAMszOjRVvv4/2T7z9F2UITSBYDktFtWOAZcEp1gNDG5E6YM20MiXaLM3TO4naSl0
         wcTpDnT2LZUAiB4q8e0T/7VD7PSDYxA/wn3xErYuUL5XSLaCE5en3m7bNMXWER0t7QJB
         fZvieJ30FRWgD9gRNzZeVo9hvqAOTRlCytDn6/dr4OCcTbzmeh9eEmtnbksJEpufSIPG
         DqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNgiq4LnmQxueDkZI1m2FMK10+fa/AyROowHNHXgWRH9UWfHi6PoRJtmcIoKtV+bH37DoPjpPGODWMFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXB+O+2tgmxs4SHAIGYfErjPT+rX/4Noq2se/oqoXGGT2BzzKd
	/yDOoKNTqsvnXgw/U42tt776hl97Mih7d481JsdmsjEWnN+sYp8jkm0R+6zUVQ+agaE=
X-Gm-Gg: ASbGnctpiHr+LfU54grki8d7HKoSZgG6zGPhSWUEhC6cxNNKr+3/Odk9w2B7FZtS3QG
	IHz6Ltws5w6R+35ursquUE+A7eOCk8ux2d6poD8C3ZrlUPPQRn4YxyUMRGhRUkHtrFSVLzwo97r
	aJweDcBXVvpMJYRq9k6X0NSfxRvDuR02zqb+tkMnehUBrunBls0JfrC5hg55TaRNSCPvYtuxEB2
	sY2ovUt/dPBrOVHOoikjrq/ZfhSDjUxFyMV0NRd0RL5zuUVnTF3TGDmNIrMbi60LhQ+YKKCWTtv
	i1XzsMbnbEndc/WsUjPKL4PhLlgpgY1hLLXsf5PUh7jZmZSkWGQxr9LoUVt2P9cQj6IE4jxGJl0
	5SUKjXmRNjWveGXwGBjdVcVq19ykcr9xtWpD2
X-Google-Smtp-Source: AGHT+IHi9rVu5CdAwKebMT1+NvqjKYD4zSk3DhlfFOzizsRoQJO/I4guA1z3PM0Z8s+uXhbtEpdKbQ==
X-Received: by 2002:a17:90b:180f:b0:315:9cae:bd8 with SMTP id 98e67ed59e1d1-31aac4f05f6mr1880490a91.23.1751612712917;
        Fri, 04 Jul 2025 00:05:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:12 -0700 (PDT)
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
Subject: [PATCH v8 05/24] mailbox: Allow controller specific mapping using fwnode
Date: Fri,  4 Jul 2025 12:33:37 +0530
Message-ID: <20250704070356.1683992-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000513_959589_06031F59 
X-CRM114-Status: GOOD (  22.04  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 65 ++++++++++++++++++------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..2acc6ec229a4 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 #include "mailbox.h"
@@ -383,34 +384,56 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
-	struct device *dev = cl->dev;
+	struct fwnode_reference_args fwspec;
+	struct fwnode_handle *fwnode;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
+	struct device *dev;
+	unsigned int i;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	dev = cl->dev;
+	if (!dev) {
+		pr_debug("No owner device\n");
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	fwnode = dev_fwnode(dev);
+	if (!fwnode) {
+		dev_dbg(dev, "No owner fwnode\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
+						 0, index, &fwspec);
 	if (ret) {
-		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
 		return ERR_PTR(ret);
 	}
 
+	spec.np = to_of_node(fwspec.fwnode);
+	spec.args_count = fwspec.nargs;
+	for (i = 0; i < spec.args_count; i++)
+		spec.args[i] = fwspec.args[i];
+
 	scoped_guard(mutex, &con_mutex) {
 		chan = ERR_PTR(-EPROBE_DEFER);
-		list_for_each_entry(mbox, &mbox_cons, node)
-			if (mbox->dev->of_node == spec.np) {
-				chan = mbox->of_xlate(mbox, &spec);
-				if (!IS_ERR(chan))
-					break;
+		list_for_each_entry(mbox, &mbox_cons, node) {
+			if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
+				if (mbox->fw_xlate) {
+					chan = mbox->fw_xlate(mbox, &fwspec);
+					if (!IS_ERR(chan))
+						break;
+				} else if (mbox->of_xlate) {
+					chan = mbox->of_xlate(mbox, &spec);
+					if (!IS_ERR(chan))
+						break;
+				}
 			}
+		}
 
-		of_node_put(spec.np);
+		fwnode_handle_put(fwspec.fwnode);
 
 		if (IS_ERR(chan))
 			return chan;
@@ -427,15 +450,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -470,9 +486,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbox,
+					     const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -523,8 +538,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	scoped_guard(mutex, &con_mutex)
 		list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ad01c4082358..80a427c7ca29 100644
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
