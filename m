Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C53BC3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+W698JBevbKnqzDTfGWLcLiVLg4XRg84at30YiPPFg=; b=Kunnz9wLwLmPzG
	LLum08vrc1NdNvOlrIWYYK3wkj11Oomlm518CwJOlL7cGkPlvhICdbLlRgKQw95l/WkGfqpbrPRQa
	kfNjKPEu5BHIQYZFO/qedF+RITeK0LLCS+Bq1j4QMabYBYs5oJP3NsFU0mzyoQ0jNe8tX9I7X8KQE
	oE84lHplTIgc1Daoaesoq3HsZz8P4ozFvqmQWMCoPcB26X76jQrP/KqksmM4s70Lbud/JDpgw6XwP
	BgEPGC6GHuNHpvQGJTdbaCgnz7zd7q9S6l2TLrhcOvTWbcha7TCwhfCOGYtgIHjMw06a+AV/k6k67
	E2XxiPZVLwkeKYf1yQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vK-00000007HX2-06MX;
	Sun, 11 May 2025 13:40:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vH-00000007HVo-2Xng
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22fa414c565so25111265ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970855; x=1747575655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cUhTlBPCx/RyxrDK4rJSeeuJgXjq8E3p5DHEKMIX0g=;
        b=KJ4zwNnXHy1/WcgRyGrx9b6aonqDxm134oaV3OdcZmjyupyZ5MrGBZJ7duM/+dM7Ly
         XwtIVl6/uVneQtpV1bWTv4k//2rOfTz7z4UzEuw+CTm9+yuMYOOS/aUN+f5fZkMoHcV3
         jIH8jpQ1CZ0x1Zy2REtWBjXY5y0vbqqe8Vy7wKXyvHTnxP6NsuUwuWYQLPIDtuR3dt+1
         K/uAfmxDrstirgF1xspwSXTTEOTgjb1cf5sDtt9QxIyoe4eZNMagnfqcKFCObGaE5NhQ
         cfXP5Uq3tm+DDeysKhZ9y1oGNQPkAQYCdwgibUkDULvjFDO9B8jzyKcnyNAYPuSfV/bt
         rq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970855; x=1747575655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cUhTlBPCx/RyxrDK4rJSeeuJgXjq8E3p5DHEKMIX0g=;
        b=sIg1qMygKd+zyEpX7NbsdSv/tPid3miaqTOenjWNnbVwSGCklkGerKG+JNy8QYO+iU
         R3OoIYCIofX1a8HIlovTkUWRrPBcBAM5XilRwulIkOzKf7ImWmosqbcvlh6HavwKl4wu
         yyYhErv086tU+gMDy7T0LAC9hhF+jc5DwlhotszD0BZw36MxLWZhMGcwY7oFhp2PIrVm
         BfZxJTauKL72HHFoJZ8zo/7FOhmOHbLvB4xfPWR/bXnP7HoMA91bbL+g/97qaoeBBovt
         ACbk8VjiWYUTqzLjZQss0oYQhRMfsjUzflr15IeTRHkGRMdrTwpgFVeazW4OX5WJEmDC
         AiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNKQnKfWoXc72efaNwtDNgimcBf4SUdFRN/lPZg/86eF7foHS0dMs88aC/Rrb4riPPBbQ1TLOi5umXZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YznUGnGBeOE1ES7zYWdRlaDkqIySKTy4jmCcbHSdbbtKwKFtNO7
	fRgqJlGt+Id12QCxB7vDVqAcL6Fl9hA4cezPCnfBoMQ8dmTTjIFtVVBtw5nDvsU=
X-Gm-Gg: ASbGncv6m3UM1b5pWMvDU8c2oOqO4x4dy4egx8M61uNQ0YFj197tYCHKGwf5YXGUuxC
	QijTYBKgesF7HUVWA/pHGwxEE5oX4nSkpoo80zTKAH2BH9s7duApiE6OasJKKJynST1RMn+nWLv
	MqfZdx1Ml4QajTFgGA/nN05B4xgRZj/0Jg8B9os4n/UR2DQO/85xz+VVBXV2+aLfiYeK5tsOlFD
	TAOIEb9hVg6dqU+6f/DnErGR+p2BkovwzGV4nHVk5B2MIUSE2IAkf92w2/j/TefMiagc7SvOjmx
	MvI9YQ3mhN7BIR0zxrCFgpkDwye9phNbIvja5FBVLRlzvXKvc7kpdbvtlmzrk16ydylK3av+BQy
	wf5LN5c9O+BVKvQ==
X-Google-Smtp-Source: AGHT+IHDFcgf/Q1YCLdknZTt9nRZWla2DHaCojWqgGJ4RbiVsHVnEoQNqVZO0AbPN3LFSDThkG8o2w==
X-Received: by 2002:a17:902:f54d:b0:223:628c:199 with SMTP id d9443c01a7336-22fc91a8c87mr141296155ad.52.1746970854557;
        Sun, 11 May 2025 06:40:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:53 -0700 (PDT)
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
Subject: [PATCH v3 06/23] mailbox: Allow controller specific mapping using fwnode
Date: Sun, 11 May 2025 19:09:22 +0530
Message-ID: <20250511133939.801777-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064055_648268_351B319F 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 48 +++++++++++++++++-------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0593b4d03685..a7ab1b4450a3 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -399,35 +399,50 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
+	struct fwnode_reference_args fwspec;
 	struct device *dev = cl->dev;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
-	int ret;
+	int i, ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	if (!dev || !dev->fwnode) {
+		pr_debug("%s: No owner device\n", __func__);
+		pr_debug("%s: No owner fwnode\n", __func__);
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	ret = fwnode_property_get_reference_args(dev->fwnode, "mboxes",
+						 "#mbox-cells", 0, index, &fwspec);
 	if (ret) {
 		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		return ERR_PTR(ret);
 	}
 
+	memset(&spec, 0, sizeof(spec));
+	if (dev->of_node) {
+		spec.np = to_of_node(fwspec.fwnode);
+		spec.args_count = fwspec.nargs;
+		for (i = 0; i < spec.args_count; i++)
+			spec.args[i] = fwspec.args[i];
+	}
+
 	mutex_lock(&con_mutex);
 
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
+	fwnode_handle_put(fwspec.fwnode);
 
 	if (IS_ERR(chan)) {
 		mutex_unlock(&con_mutex);
@@ -446,15 +461,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -492,8 +500,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -544,8 +552,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	mutex_lock(&con_mutex);
 	list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 5fb0b65f45a2..b91379922cb3 100644
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
