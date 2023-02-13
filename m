Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC0C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4fWMzHYE4lcsXL/33AUx9RziglLocG2nKjP403eg20=; b=J8K/q/Ar+kEstb
	dLl0E/4BhlR73Q7i+OE9FS5wP0UJYUqyEKsXrG2fozomuJcYvKYbRfI3lws5mX3kNILzh/4QsE82q
	Z8FWn4zNLeN9XGNkxsFGg/9w4+yVRCFdZ8G/kxi7/DynYzqAibGvSAza47FY+KAxcEJZJV6mNjtyF
	Nrti3A9VodEnfbJXkddRMpdXEFUWxbywk0z5sR4XVDNN47Fh5g3F70qEOTi1/WS2QLx6YAQfUdWHT
	2cRJvDBPTNxcImrjBzzLfSTEARPHalp3OwEvNaF+VUaK4jQ36Ay+18yqxxuAcz+Mv4Tqy9vDXE7Ty
	HCg9yq0GkOX7W+THhJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXBJ-00ETLj-1l; Mon, 13 Feb 2023 11:39:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAz-00ET8k-KI
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 11:39:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso11071013wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 03:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmPXTSwtX+DYJX5iCL8CrL/WLnsVXpfe6dY/lJz+OWU=;
        b=eRN2LY+Mo/1oV6Vs40v9B5lGPUSW2Srg3dIAvZU8vJdoAG6RXMJeN5gBcC/4oq4wpM
         zuyEE4JyME6XZKBm7opmvFLNY0066ISu88ehed3FSquqOL2vFRMKAfpnXI57dDfVVCBi
         2638w5lhYnZ2i3/a0G9WEr9g9peM7fOW2MpSaWYxSPebgN8MU3VMgV5HbNzgP1/JffYz
         +66CzXrv2TiLd+EbCzdL9spMIjKRIAvp+J19DfRPQM3nG8hAuurXy8XwuzjDk7TYIrtq
         /CbhfBpYPI+XhWkTwI3ASE3WM8oOgTaTDweYLMs2/Wti6Ez7nPNAl3zpEDpV2mk6ORIr
         +HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmPXTSwtX+DYJX5iCL8CrL/WLnsVXpfe6dY/lJz+OWU=;
        b=GHGwXmaDp+oX6iBvSZDg1sBhzPm42WzCGuft272EJFxZos5jOXDetBoIRGCXLCHhAq
         WIxkN6mSRxHUPCx1PiNft8i5uElU/TgoPoSziKa/5iin3awKROrPcJpkHnNP1eRXg2xJ
         DTKcRBbG+U+t7FxiNkNs91+7XLJxoL/0M+bzL+wkH8Z+pJ5zae8lWZHNkbp3zMFSUBzk
         o9SYBon7sEmnPuCaxnGx+wCUFwlGmIF/c+Ws6qyeoPOi9YBd7SfhmZSyrHGsRxg0mf81
         8Rqpc4PKE3eeP+QJhLm5vWorR4V9IcSutlVXByeruyfLtxKSOY8xVGYHAPiVZxmp07C/
         yFzg==
X-Gm-Message-State: AO0yUKXHgVBDYl6Q/y2t9VqID3ht9LBNcdAHNv0DgIjtPn35QggIe2iY
	4KFlFWvGj55rmBC6aVQmOtTbzQ==
X-Google-Smtp-Source: AK7set9oL6vwesYJT0DzvExxtj8EGWBKXXUNTUjyCtM1qJs9ZrpKEAZeuywgZnERtvIXqBqczECP0g==
X-Received: by 2002:a05:600c:3197:b0:3dc:5240:53b6 with SMTP id s23-20020a05600c319700b003dc524053b6mr18722033wmp.6.1676288355536;
        Mon, 13 Feb 2023 03:39:15 -0800 (PST)
Received: from localhost.localdomain (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003db06224953sm14578354wmq.41.2023.02.13.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 03:39:15 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: rkanwal@rivosinc.com
Cc: jirislaby@kernel.org,
	pmladek@suse.com,
	senozhatsky@chromium.org,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/1] kernel: Match preferred console first.
Date: Mon, 13 Feb 2023 11:39:12 +0000
Message-Id: <20230213113912.1237943-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_033917_930608_2CEA718F 
X-CRM114-Status: GOOD (  21.66  )
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

For cases where the driver registers the console with the index set to -1
the `try_enable_preferred_console()` doesn't work as expected for multiple
hvc consoles.

For example with `CONFIG_HVC_RISCV_SBI` and `CONFIG_VIRTIO_CONSOLE` enabled
and cmdline set to "console=hvc0 console=hvc1" where hvc0 being RISCV_SBI
and hvc1 being VIRTIO_CONSOLE (the preferred one as per the preferred
selection logic in `__add_preferred_console`). hvc1 never gets enabled as hvc0
matches first with the driver name "hvc" and index set to -1.

Here is the hvc console structure from hvc_console.c L217.
static struct console hvc_console = {
        .name           = "hvc",
        .write          = hvc_console_print,
        .device         = hvc_console_device,
        .setup          = hvc_console_setup,
        .flags          = CON_PRINTBUFFER,
        .index          = -1,
};

The expected flow is that hvc1 should take precedence but given hvc console has
the index set to -1, the current logic will try to assign the first console that
matches, which is hvc0 and return. Never touching other possible consoles.

This change makes sure the preferred console is checked first and then iterate
the remaining list.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 drivers/tty/hvc/hvc_console.c |  2 +-
 kernel/printk/printk.c        | 78 ++++++++++++++++++++++++-----------
 2 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index a683e21df19c..f05bb92d9419 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -230,7 +230,7 @@ static struct console hvc_console = {
  * -- index will remain -1
  * (2) we are first and the user specified no driver
  * -- index will be set to 0, then we will fail setup.
- * (3)  we are first and the user specified our driver
+ * (3) we are first and the user specified our driver
  * -- index will be set to user specified driver, and we will fail
  * (4) we are after driver, and this initcall will register us
  * -- if the user didn't specify a driver then the console will match
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a5ed2e53547c..3be3ace255a9 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3148,6 +3148,49 @@ static int __init keep_bootcon_setup(char *str)

 early_param("keep_bootcon", keep_bootcon_setup);

+/* Tries to enable newcon console device matching it with passed in
+ * console_cmdline. In case if match fails the function return -EAGAIN
+ * meaning the caller should try with the next console_cmdline.
+ */
+static int __try_enable_console(struct console *newcon,
+				struct console_cmdline *c, bool user_specified,
+				bool preferred)
+{
+	int err;
+
+	if (c->user_specified != user_specified)
+		return -EAGAIN;
+
+	if (!newcon->match ||
+	    newcon->match(newcon, c->name, c->index, c->options) != 0) {
+		/* default matching */
+		BUILD_BUG_ON(sizeof(c->name) != sizeof(newcon->name));
+		if (strcmp(c->name, newcon->name) != 0)
+			return -EAGAIN;
+
+		if (newcon->index >= 0 && newcon->index != c->index)
+			return -EAGAIN;
+
+		if (newcon->index < 0)
+			newcon->index = c->index;
+
+		if (_braille_register_console(newcon, c))
+			return 0;
+
+		if (newcon->setup &&
+		    (err = newcon->setup(newcon, c->options)) != 0)
+			return err;
+
+		newcon->flags |= CON_ENABLED;
+		if (preferred)
+			newcon->flags |= CON_CONSDEV;
+
+		return 0;
+	}
+
+	return -EAGAIN;
+}
+
 /*
  * This is called by register_console() to try to match
  * the newly registered console with any of the ones selected
@@ -3163,34 +3206,23 @@ static int try_enable_preferred_console(struct console *newcon,
 	struct console_cmdline *c;
 	int i, err;

+	/* Try to match preferred console first. */
+	if (preferred_console >= 0) {
+		c = &console_cmdline[preferred_console];
+		err = __try_enable_console(newcon, c, user_specified, true);
+		if (err != EAGAIN)
+			return err;
+	}
+
 	for (i = 0, c = console_cmdline;
 	     i < MAX_CMDLINECONSOLES && c->name[0];
 	     i++, c++) {
-		if (c->user_specified != user_specified)
+		if (i == preferred_console)
 			continue;
-		if (!newcon->match ||
-		    newcon->match(newcon, c->name, c->index, c->options) != 0) {
-			/* default matching */
-			BUILD_BUG_ON(sizeof(c->name) != sizeof(newcon->name));
-			if (strcmp(c->name, newcon->name) != 0)
-				continue;
-			if (newcon->index >= 0 &&
-			    newcon->index != c->index)
-				continue;
-			if (newcon->index < 0)
-				newcon->index = c->index;
-
-			if (_braille_register_console(newcon, c))
-				return 0;

-			if (newcon->setup &&
-			    (err = newcon->setup(newcon, c->options)) != 0)
-				return err;
-		}
-		newcon->flags |= CON_ENABLED;
-		if (i == preferred_console)
-			newcon->flags |= CON_CONSDEV;
-		return 0;
+		err = __try_enable_console(newcon, c, user_specified, false);
+		if (err != EAGAIN)
+			return err;
 	}

 	/*
--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
