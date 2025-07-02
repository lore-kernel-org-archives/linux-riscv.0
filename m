Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C11AC83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89OCfY1A1Mz5H+RKsvkGy/QsDcymgoYZbOgrxgq3pYA=; b=MbUejWa4GIlK3j
	Onc6DLXsCvaPshnxYLU9lo0rwXU9w2prG/TsHErdVF6+9CYppLY147mA19fxZ+oSUA1gyAk/SE6bN
	mQBhVp3dbUvaFmi1xysfAx+Rf0cy1SR3TG5z2KiYADT6O2ydZQT8W6K67WWxrksrbQs5nsdea8bfS
	dmKjowVgIn8XJS9lan+2OZVQWf53rxgOOg7tx3T88oSCFTqN52IvoRA0D6YIFDIloULN2LzE4Gm7M
	Nw/xANmKG0W7A5WfogHZouZbAkizUOT3ZZCA8cur0NoucqIWi8ncobYze7PKJayVogtV0e+Q9PeMn
	wP63mOS04M7tIxOqX4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuD-00000007HNr-0wiz;
	Wed, 02 Jul 2025 05:21:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpnx-00000007FqE-1CWW
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:14:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234b9dfb842so36868205ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433284; x=1752038084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=IElAiD7SmiA1ocnxn2P1ZXj6j2aWidI30FXDsuBShgjz4/9obxBBvHvtpAYSMhQXh6
         xenK087tn/ZMze0t4pEzG96KCeaIcrGTI0jlzCuSqjoNYhHRK7VgOXmsk7PuM5JG6Gq8
         ycBiQaqa5PN/tcInUKXh+3G95OWKLW6F6P3eLPFYlfPlhIYGAsvc2Np7XInsME+tMpFr
         4HhNqUuwHaZe0DYs8tI65oKfO5Nmcs652A0oivZ7a/Zupk+/L/P3Q4zB8PVSFu3x2RqX
         PVuA7KVS0guMeGZ/EJJXASY7jMWRavZZZZPwNn5q3NZBLk0UFVOPA5quMc/6H+bgUEwt
         wZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433284; x=1752038084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=pawM+5IGYSwUYwCNvdnFWDpDDdc/3nBx8F7XtWtRuhMurcqD180VrINTB/oilT7yNx
         oDkySWTAEGX6tEKukkNvt/7Ps2u3s8+e0g5SsPjAPnO9fJu3yc/636Chagrkx5cV9GZG
         kqX3xHcWn4vELUlsqkLCMtQJytpbJopaf8WUqNPTgtLytp/656heqWKhxdlXfYxmfp3W
         60q/rv5d5wK+36SwUbdbCrH+IuRLTOC7vNzYN/teF4ztETBTzy18PV4m8YtVz/0jaZf7
         wRbCO0KYidUrQUhkrWZ1EmEy8LHt2HWbFFcysB23Hgqf0gdwlbteay8G+4lraWHn5rjn
         RGbw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/L/LQr01bDdelt4EgxmDrCvpe/MqnitE+7NBxnISqqB36qx0Zoch4urWR2iRnLFcwnf+TrYxF+W3vw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuu8TX1INv7m/+Amuv50usD6PtRtVbBieelUtoo9ovMHJ65N3I
	D3xAcA9jxhTD0+pDCde1T6wgEHZs2sJr+y33ux5ekHQPRvRyOjsYrzuntmZzpMhcrLI=
X-Gm-Gg: ASbGncvlSHQr5RRIb+wjgO7c6spy+eflEYbkEV1GP7KtRLi3NJum+T57/0CaOlTBWN4
	LPRGx4VRN3P8aI3zeucynl6Lt2l8VEvQaucMvgFbZKI4S0ZCQoGzVwDJA3sHqDTtfzQGOuQThtR
	9EfUhQJFs4bjrDccpltC5uwAYHrFuI8wdhjtUxX1a4BXofjLK9vbSiSnym3ky9Fwm9JD3Et/2QX
	m1bYIsWvYmG2Ipq5kpFngrY/RYxlOGlhMAFPSgnWky7WbY+osQfrS0L8NQd/CcIUq8wJUsKta4R
	LtkzAxCJcvtDJUArC/0lMd8KdbzNZ2eO9XL073NmyWWcrSxoMGMPTyx2TynYCXJXrt53JMPt6BE
	a5v0tMTt4yaow8Ux0
X-Google-Smtp-Source: AGHT+IHW6+yjygzJaRYVJbk398vw/ZCnNjzG8uYmd5NcS+WaiG0hLE/XIX5nmwnliNsaVR742l1nrQ==
X-Received: by 2002:a17:903:1a2e:b0:232:59b:58fe with SMTP id d9443c01a7336-23c6e4d6e93mr19975825ad.1.1751433284391;
        Tue, 01 Jul 2025 22:14:44 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:43 -0700 (PDT)
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
Subject: [PATCH v7 05/24] mailbox: Allow controller specific mapping using fwnode
Date: Wed,  2 Jul 2025 10:43:26 +0530
Message-ID: <20250702051345.1460497-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221445_324800_2C75C8F1 
X-CRM114-Status: GOOD (  22.89  )
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
