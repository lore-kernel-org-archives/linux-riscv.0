Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33408CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yT8mUP7/t4BC7yeQNIQZ+U2FMyL7YvpNs+Q0f+WzVX0=; b=CmEnYv80c5VcGl
	w9xbcYR6OYtci768E9foerBvTlsnE4VhlZhohX5uPdFrKGBORouVSFMuPpXw81csKBj1zW4VVelsT
	IWTIXeFC8a93sfrQCjmbMqkMMNjAY5n5iQ/z1ledJdUE9ohZD/f8eKPVv2vXN7Q/O1hGa+v4ZrlNi
	szthwcYvonh0BvLzvNbn9EmKqR25mIO/0T+v3KGAdA89h8y1ACdIiABS+0+bvwhGYPhjadQTatMMa
	6f8fQe1mg4XwcjaLoz2TlaqXrmJZskBiwPqvPBgzoFl81GrRVwQyUVHBsjuOnA19t2bNxo1oynZsS
	9OVZxQ7SUGU2WrNKYdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCt-00000006R3x-1yxl;
	Mon, 18 Aug 2025 04:10:51 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCq-00000006R2W-37dz
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:10:49 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326e202e0so2834088a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490248; x=1756095048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIg/1GBTKsBFC54o9wzP/NH34EZtppmVu7UpxaXegaQ=;
        b=MbkOcNK6f+5A8AO8VnjQhammCJriRmIMK3GxGwbL9EWd3dNh53I8Yb4qYjSY0xhn1u
         si025PztqY6+QPUsJHkaEQP+/dywhJ02aDlfqGLvHk2mpCkVx/gFr2Q7C2M+hOnZIVKX
         Da5ZKNB1S8gxEUSAyTGkgKW7I6hUZoanpAwc8BzTYuQK4ZDO5siEpfyQXTUkGKX4tkdO
         SHcAyeJb6ha0fkljO1IQVIs9i+lJHrWhH6j2fqAP5SS0R26PXgb4z9vMN6Pwniv7cAJQ
         s6E3DLFj3MPXPR0M1vaz8LlxSt0zU/lr0rttCeSrKs0WKAFDkwcSWIl7YCZyVNQGXser
         H4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490248; x=1756095048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIg/1GBTKsBFC54o9wzP/NH34EZtppmVu7UpxaXegaQ=;
        b=cd0H5RYio9Ovwb3IEWwnUtfsW6lBqVBXV7ebRkoQ+pZKwaBoMuiM3NOqEWy2ze3Jvw
         RUrACMVOp/Wi/9ClLzYL+7WGDYFfa1A5crIbkaaRckljRjImVC+VfuR6KW6g7F/XDeKq
         HWJanj/B1swJw52EM6Pje0wWiA9ktEk7C54E7SMKtQeRv7xYlFki/WeyaCvO+IPRiBG8
         q/MjiqXda8vIaU0zGhfg+qix5U+OkbyxLA+BEros6kJLNrM8L1DrQrTlVcvlBGNdv5rY
         PL8cR7RkDawo/fltGGiiMW3g3g0LGmgXbBTpm9CGSGIJmaCWV26qWNb5vQnME8/LXh/V
         F22A==
X-Forwarded-Encrypted: i=1; AJvYcCVy2OO5zWcjLwqIFdR+q4kX/3VckPMAcLSoNkSr0xAF7ldFNUCxc+2/ca6uV0qW8BY5YPE4mIV9olHeCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVAtMW8l/mULYq1vAuVp0fDi+48B63zrVoTciCElQc57cemAdz
	RJwxJJMX1P7Rg2vk1I10ZYB+g0/KQkcncAqSvlMjT36A8bxn5UeVdyCNMdLOg7epOtQ=
X-Gm-Gg: ASbGnct5ye9pnOXk7RubqI48gwYV/OfBQngyYhqI80tWttaUGownUgfpoQ2FNmfRDZs
	sXfbwtWSnSxkdEtkGrsihMX17jeqq1BFj+kaUAv3lbC285MN69Ze7m3sagpNerzH0O396Vz/uJ6
	uCWBkTrrocn6fL4JsWc0K/EuXRATt2yG0485zBjY25MpYXEFT+JbCH4rTSzHYOQ2DDsF31gbhlk
	/KuQjdQcqovElSum6TLaBdXuLmfs5R7VLSpIDIktmvMby5XvbptARJM/EGSksN+rIi1QBrMF8Wd
	dcF/kstN5yXdvgaSvueByDTiEHVwJHSukXvHi7tBrY+nB41oAGl5Uy1U8QYDaNrRRmy+AzJ4GrS
	nib7NpmUQpI7dx2QSHnR6woUICwAWQAUqc1b5ekMlthZkK2GMw5boGYbrlNe0WJKY
X-Google-Smtp-Source: AGHT+IHJ3B7/FGCREPXx9KMsbgx8NNPqJm1e+gxc7+HhFbA/BztdLkupGr7S+vIlvSPnuVpfBIXkZw==
X-Received: by 2002:a17:90b:1d05:b0:321:38e0:d591 with SMTP id 98e67ed59e1d1-3234dc3b068mr11877319a91.17.1755490247738;
        Sun, 17 Aug 2025 21:10:47 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:10:47 -0700 (PDT)
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
Subject: [PATCH v10 05/24] mailbox: Allow controller specific mapping using fwnode
Date: Mon, 18 Aug 2025 09:39:01 +0530
Message-ID: <20250818040920.272664-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211048_785725_028F4381 
X-CRM114-Status: GOOD (  21.82  )
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

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
