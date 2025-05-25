Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E65C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2t9V4Hw0Scxyn+GXURi++SlE/m2Y6OO3fE1WFrR15k=; b=IcToigmvThuyft
	yTOf+uryW9VuTT4MkfqOhv4dSuVyNp2R43kBZDBWcBoljDbnK1jJ7eM0InfHdqYy53oaAZGEzqq+e
	+fp4+MJui4v9s6kQxgV2b2j+ddPyo0YX6tYH3hWbAEgG8XyTR/sAOmCxS0aGm0DsCqokZJ/90SiT6
	MvqYb+a7iKUvOmEahpqTlBpgs7X8kOONA8s3KRmFasWiSQHx3mFL7tTk1cHZrwEY29oN6gij2gcoW
	v3VjvqkNxdJiZR0yCut8emENVfiMQqADhtyoPXwwf1+9HbkfmTaZg3CKAijFjkhf1zF/Y2kjSUAED
	ab3zFArBuMMLOcQ2uMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71m-00000006mZC-3moR;
	Sun, 25 May 2025 08:48:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71k-00000006mWv-06r7
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:48:17 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so1621892b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162895; x=1748767695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2YZsv0slXJtEqKbNqOnaTZCtfyqgolmSJZjw1dwQuo=;
        b=DG0AWTR9Ur4ih9Etw3eniqbAvLnVrtVeWSI3jeUOe/LXT4HVeLNFT6Yn7Ad3idD5d3
         q9YXyNEr9TFYTx/pi8M3aPhLQdVjZV61c2nIsKrqM0JSxK1Cyga6UdpTMy8C1GUaaYDC
         IWXaduFc6yKlChvhUAzYPdmhNPqufarWtcwFVVO7pXDvQWHtP1JEe7mcyeQLwvmGRyzi
         UkG1QqE8KjRZq4y6j8MWPbYbfU0RINYLjjFHil8SiUK6u+kxtkHr5F8zpaEioPrBtX0C
         U3wI5zw1qCOaqe1dVp0BRmef2nrd9KgoyWTL+5J0EbKsuzTxuJ4diH3BxIALdfIL438V
         XJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162895; x=1748767695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2YZsv0slXJtEqKbNqOnaTZCtfyqgolmSJZjw1dwQuo=;
        b=ko0sIS8TB48KxFzo5xVmZDTTwA8rRNOC35up5hK4Lj7MvpIzQuPxLNogrcXoAhbmgn
         ljLbskkcKnYXs2LxSJkZ4OttfOhBeChHWQIKz3QslOOp44IPxvh8vQaaiE1hJpJAO9pw
         G+Xz/qUPKkiq+SJZiwlILejyBAHMYnLSlbNlu1Hg5j8DO5IOzry0OyHdlrm4ODzSJ4uW
         wqQXabWR4Mc3s7Juy+bg8TWN5FzvZJfA5vl3dJFNhLqVaqaQRHliBZKdPb1HnjSpeESy
         m9MXaANtDcdsA6mFLpOrdJmUDL/Yksd2esyeBZIqyul7QlqyYEwzAu8iN0u2KaUtBzDE
         FLmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv3bBxMCGnejqrFA8/bCg5isbus4wPYfp7ZZhZvT5zDgRWlaleyuR3rYhkTJtrnYQ9xfHWGeTsKjuxnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPdvLtNpZebzkE33fUuJ6CQmF0UeK3epe2VDF3FcZyl7G+KqF9
	SHckPuQdDXydGBzyJpOjANWfMFWthGmHcp4dPHGdCiF1nSaiMf3yfMugnP+faB/2seg=
X-Gm-Gg: ASbGncssDI3p6TwnNxfEOyk4Uah98NhuoY9f73C2UiDsyfKJKM0c1hYlv5PbtQ8UEvu
	iI0yXKJqIcW9AIyR09ejrzeHtgcdD+ThdLTJPbZYz8Vh+SpnwqRQMdaP65V8/4WiTgb2lnh61aj
	EyYBWqjFmCz+qAbHf5q8DtcmaPwEdEbgZcGOqeQHmxQxm5/HAAQtoMu53toc2DJqaOvRz6VJWfH
	B2nwMYaiSLMXghp11mgmYIxv3w6LjKQvmETXb7RHGePOKc0lBWU6Arp5bXsA2h21WSV08TkBYDE
	6/5og8ly1TSmQKLoz99xhom/2fRJZXCb5fE/Lr5Il/gg951rw9B3z08t3461hn9ty2Fzjr7qYiV
	txEEegvb44Oh9q7Wwn7g=
X-Google-Smtp-Source: AGHT+IHM9LFVogkUZzQcx3ggP9+ZLqKm1aQkkdN9byS7+2CCq/9Ox/zC14iIeSMPjwcZoGra84FVAQ==
X-Received: by 2002:a05:6a21:3406:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-2188b5718cdmr9564106637.5.1748162894921;
        Sun, 25 May 2025 01:48:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:14 -0700 (PDT)
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
Subject: [PATCH v4 06/23] mailbox: Allow controller specific mapping using fwnode
Date: Sun, 25 May 2025 14:16:53 +0530
Message-ID: <20250525084710.1665648-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014816_064055_B1069B23 
X-CRM114-Status: GOOD (  20.14  )
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
 drivers/mailbox/mailbox.c          | 47 +++++++++++++++++-------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0593b4d03685..0100163c0390 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -399,35 +399,49 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
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
+		pr_debug("%s: No owner %s\n", __func__, !dev ? "device" : "fwnode");
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
@@ -446,15 +460,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -492,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -544,8 +551,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
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
