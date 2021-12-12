Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4715EC43217
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOvKRzcAL+hsAZ7+G/Na5rACnhQJeJjhL+T5njoNQEw=; b=N2XW7R3VxhD/AF
	vx5UlQvmNH35WK33tskW7Lk+9LUammKrHSDynupq5RPeKizZHI08DFxZdSZlrRiyB/uGWo8X++c60
	RDLSjJoDD+IRsf9Q67/TMoLIXXeuzJrFusEeV07FDilstLoYbKzh6kTJ0uInTu0TYntII8SnT8xtZ
	T9lzQcPXtSJzHZrYWEeAwUdwXN3SoBDdoeefTmtrn9ng6UpNHyl/NmNlYbKMgaUHkK0Nldx2i4NnC
	CIE/UGh1/iF3HMFZuPeEeGrRhxdBwpLHMWwDHmAWllqVp+Ysv/ZLY3orEnFDRG+5BhrK1riEuyh7x
	Ah10PdE+TBhmOzd1S7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW0V-007FwX-AK; Sun, 12 Dec 2021 21:03:43 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0S-007FvN-5U
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:41 +0000
Received: by mail-lj1-x22e.google.com with SMTP id i63so21125040lji.3
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYB4TkQOzA3vf/K7WR0AkGT34Ge0Y+0VoaElZGGGZzU=;
 b=YPGRWatSQET2pz+NVqu4ADHfYgaxmP/wWxna6m/lloO4toehydZkLAQeVKfAZnur3U
 ytUl8qCGBZdPLRC2UzNM4AW78JtCd6wM5cGhTywvum741iPm3RcFk7tkhkZidnvbCnJl
 R/4YWy2Kn2XQsZfcdS0OqacDfDDCQ28GjMnqHQTevEBhyfW+vOkmPPci2FrLZRzsEI3D
 rIODFz6+YMOOUk7HX9YcjikZPgA6Qmy3MY8VgfLlwgexSKQyGvZ0zOYmPyq4U9vsPiW2
 gzi0gfD7OcJAbuwERD0Pe26Rs8F2W7VMl8LrFpshwRBhPegOZQws/YUiLfZf5um9S4nw
 C5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYB4TkQOzA3vf/K7WR0AkGT34Ge0Y+0VoaElZGGGZzU=;
 b=RGON70Fhmf9yQ2JxXn/zACRZXOXfTxDlb7acGQqDhPirL+H3ciGTW+TS+pUcqZAl5m
 mwy7L6XfiVIdX6MWNevvNsqmAZnQUBnuvkJvoksqMwAJOqBfBL2x/b5v1YIqkv8jhwZ/
 F4D+jxT/F4CN8fIBIbJaRJEYwz7Z5eg9MhzvCSXSz5Dtybnj1/r2Aemw6YnulCP9P8R9
 wb//HYs7AlgDfpU1Af/VBr0snj2eT+FLM6jeI6SIwSJbgIkSEvSHuv5DXf6aA3zpwTB+
 8qS5v48ksd7Y3qTSTG0LDN0oQNgfAC2evFUHoibV6QCepcDjYtAFQJH1AAgFPUIhabru
 NrjA==
X-Gm-Message-State: AOAM531aXj20mHQw9d8GEI5S6b22tmr7s0lSOQoAXIoGw+Uk6K90+gbR
 dvfBcl0yLRmi6DgvbO7vmhw=
X-Google-Smtp-Source: ABdhPJzJGi8tVTi5bdKFCxEOnO/KtQERR8PihOgq6tSrXYkNCawTEu3K38hiwfey531aaHgxOHQg5Q==
X-Received: by 2002:a2e:874b:: with SMTP id q11mr26014054ljj.194.1639343018442; 
 Sun, 12 Dec 2021 13:03:38 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v5 02/21] notifier: Add
 atomic/blocking_notifier_chain_register_unique_prio()
Date: Mon, 13 Dec 2021 00:02:50 +0300
Message-Id: <20211212210309.9851-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130340_238068_1EF7C492 
X-CRM114-Status: GOOD (  20.13  )
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

Add variant of atomic/blocking_notifier_chain_register() functions that
doesn't allow to register notifier using a duplicated priority. The -EBUSY
error code is returned in this case by the new API functions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 87 +++++++++++++++++++++++++++++++---------
 2 files changed, 73 insertions(+), 19 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index d4717bc0ab85..ccce26197dd2 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -150,6 +150,11 @@ extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
 extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
+extern int atomic_notifier_chain_register_unique_prio(
+		struct atomic_notifier_head *nh, struct notifier_block *nb);
+extern int blocking_notifier_chain_register_unique_prio(
+		struct blocking_notifier_head *nh, struct notifier_block *nb);
+
 extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
 extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
diff --git a/kernel/notifier.c b/kernel/notifier.c
index e30d24ee88e9..77e5112ff05b 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -20,7 +20,7 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  */
 
 static int notifier_chain_register(struct notifier_block **nl,
-		struct notifier_block *n)
+		struct notifier_block *n, bool unique_priority)
 {
 	while ((*nl) != NULL) {
 		if (unlikely((*nl) == n)) {
@@ -29,6 +29,8 @@ static int notifier_chain_register(struct notifier_block **nl,
 		}
 		if (n->priority > (*nl)->priority)
 			break;
+		if (n->priority == (*nl)->priority && unique_priority)
+			return -EBUSY;
 		nl = &((*nl)->next);
 	}
 	n->next = *nl;
@@ -143,12 +145,35 @@ int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 	int ret;
 
 	spin_lock_irqsave(&nh->lock, flags);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, false);
 	spin_unlock_irqrestore(&nh->lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(atomic_notifier_chain_register);
 
+/**
+ *	atomic_notifier_chain_register_unique_prio - Add notifier to an atomic notifier chain
+ *	@nh: Pointer to head of the atomic notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to an atomic notifier chain if there is no other
+ *	notifier registered using the same priority.
+ *
+ *	Returns zero on success, -EBUSY otherwise.
+ */
+int atomic_notifier_chain_register_unique_prio(struct atomic_notifier_head *nh,
+					       struct notifier_block *n)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&nh->lock, flags);
+	ret = notifier_chain_register(&nh->head, n, true);
+	spin_unlock_irqrestore(&nh->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_chain_register_unique_prio);
+
 /**
  *	atomic_notifier_chain_unregister - Remove notifier from an atomic notifier chain
  *	@nh: Pointer to head of the atomic notifier chain
@@ -208,18 +233,9 @@ NOKPROBE_SYMBOL(atomic_notifier_call_chain);
  *	synchronized by an rwsem.
  */
 
-/**
- *	blocking_notifier_chain_register - Add notifier to a blocking notifier chain
- *	@nh: Pointer to head of the blocking notifier chain
- *	@n: New entry in notifier chain
- *
- *	Adds a notifier to a blocking notifier chain.
- *	Must be called in process context.
- *
- *	Currently always returns zero.
- */
-int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
-		struct notifier_block *n)
+static int __blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+					      struct notifier_block *n,
+					      bool unique_priority)
 {
 	int ret;
 
@@ -229,15 +245,48 @@ int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 	 * such times we must not call down_write().
 	 */
 	if (unlikely(system_state == SYSTEM_BOOTING))
-		return notifier_chain_register(&nh->head, n);
+		return notifier_chain_register(&nh->head, n, unique_priority);
 
 	down_write(&nh->rwsem);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, unique_priority);
 	up_write(&nh->rwsem);
 	return ret;
 }
+
+/**
+ *	blocking_notifier_chain_register - Add notifier to a blocking notifier chain
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to a blocking notifier chain.
+ *	Must be called in process context.
+ *
+ *	Currently always returns zero.
+ */
+int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+		struct notifier_block *n)
+{
+	return __blocking_notifier_chain_register(nh, n, false);
+}
 EXPORT_SYMBOL_GPL(blocking_notifier_chain_register);
 
+/**
+ *	blocking_notifier_chain_register_unique_prio - Add notifier to a blocking notifier chain
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to an blocking notifier chain if there is no other
+ *	notifier registered using the same priority.
+ *
+ *	Returns zero on success, -EBUSY otherwise.
+ */
+int blocking_notifier_chain_register_unique_prio(struct blocking_notifier_head *nh,
+						 struct notifier_block *n)
+{
+	return __blocking_notifier_chain_register(nh, n, true);
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_chain_register_unique_prio);
+
 /**
  *	blocking_notifier_chain_unregister - Remove notifier from a blocking notifier chain
  *	@nh: Pointer to head of the blocking notifier chain
@@ -353,7 +402,7 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
 int raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *n)
 {
-	return notifier_chain_register(&nh->head, n);
+	return notifier_chain_register(&nh->head, n, false);
 }
 EXPORT_SYMBOL_GPL(raw_notifier_chain_register);
 
@@ -432,10 +481,10 @@ int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 	 * such times we must not call mutex_lock().
 	 */
 	if (unlikely(system_state == SYSTEM_BOOTING))
-		return notifier_chain_register(&nh->head, n);
+		return notifier_chain_register(&nh->head, n, false);
 
 	mutex_lock(&nh->mutex);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, false);
 	mutex_unlock(&nh->mutex);
 	return ret;
 }
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
