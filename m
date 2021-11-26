Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435CBC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xwusAITIP+EGEJzOuTB5zkHxi8CgZtdVbpzvaSvhmY=; b=zO5UW4WUssEuDh
	IicACMYHzag8WkTaNSeuCWbpwML3BU/4g0GpLB9Ou1JuKPKnWnurKWCORyw+BcF2aFe8UopXmXViM
	rjXaLm9qVUR1W9YwXsKYMNmTR+X6P1cy9PpZ+suodzhQTF+gToVAybGXmqqsXH85KZrVS2Cuyk2Tr
	Mp6dsckdi5pR4X3litee/VUiknCPwNnQd+TSCObaBaysEZr02P496RZcR8pmT/pTLq2ugt+jZ9iqc
	jtILleC+TcHG6x158NzUDqaGVmVkbq4WWM8Ow8F05R3SzteWzT6o4bG0H9fMFYfcYRfKCHBnxmOA0
	X0Eeht3WoVcm8Pb4g8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfXv-00BNdE-EO; Fri, 26 Nov 2021 18:02:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfXq-00BNZX-2V; Fri, 26 Nov 2021 18:01:59 +0000
Received: by mail-lf1-x131.google.com with SMTP id m27so26044719lfj.12;
 Fri, 26 Nov 2021 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hKe22x9bX8JCg83Zw5KeGH71BwPAfgMBPhF5RAtnzGg=;
 b=b2ZfJiMeqx8AeLNXyztIQbqzNlGBVbhad44TGqM7lHiw/fjxif6gU0gZoYYArSlKqo
 EeAwZj+BCdzu3uIIM/smFVDttYIEyo/Z4cQTphN83yvq86PvnU0W4Ie+2AQfRx3m6El9
 ezh/1hh7/6Ybscv4tcBLpgDBuHeraJRPSdMAVRwkC5F75rh6n2MHscxaOB/rlIJUGpHn
 JYFzCa+B1QR2KMEZvRV/l+C8C5tLmBjWELwgqyH4k7ET0Q1PJi6aubc/gMu03uwbYwz0
 9IzBTEPDl6TbzF28FQAcA3Viml2my3zBgMjGFEkpGjjrauzxX9PSIX9E5Ca5qAHE77RJ
 Cyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKe22x9bX8JCg83Zw5KeGH71BwPAfgMBPhF5RAtnzGg=;
 b=K0+qnGZa4ylj3fq1wxDLwD2D1ZDPjPuBamlVeSi7D2q53QGW0lekrIdzSb8lmeH5au
 sEkGI6BTUWHDiqMbE6toWvqXQ0GeCgsqKlyLt6Sm9csIVVXn3VdUGNv6iSdvQxykjmfN
 Lcjt2fTt/yJnHHWlDkAkRsKjbDdQMw8RIVdnQ//np4M6pUJEDtlRd73TonRmmz+SgagI
 UemmFci2vSr8fa3ywXIvwLgugOdamnGnrc9d8mbStJx+7sVEE6QPBtLyyO5slKlnHMjS
 lsy61+yVjaniBpcIN81JFWDLlNlhQF8QjdbbMDrxPNsSrbrQPGQsis6/SbgCt54CnSTy
 GRzA==
X-Gm-Message-State: AOAM530Plp2LBj3Jp7BFjSCQsk6VgE2akWhmRQRTFn3I7tyYdEZv3UDx
 ztvhe4lpZzDdkrfX0VeAPP4=
X-Google-Smtp-Source: ABdhPJxizgxN6H8utklWV5PP7BDnBAFFswn6Wu2IY4jESwUo2k1vRD/GT6BFqxqb00p7BIY/tAXbNQ==
X-Received: by 2002:a05:6512:3192:: with SMTP id
 i18mr30735000lfe.205.1637949715998; 
 Fri, 26 Nov 2021 10:01:55 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:01:55 -0800 (PST)
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
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
Date: Fri, 26 Nov 2021 21:00:39 +0300
Message-Id: <20211126180101.27818-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100158_147794_D87CBA7B 
X-CRM114-Status: GOOD (  18.32  )
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

Add atomic/blocking_notifier_has_unique_priority() helpers which return
true if given handler has unique priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 69 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 924c9d7c8e73..2c4036f225e1 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 
 bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
 
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *nb);
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *nb);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b20cb7b9b1f0..7a325b742104 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -122,6 +122,19 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
 	return ret;
 }
 
+static int notifier_has_unique_priority(struct notifier_block **nl,
+					struct notifier_block *n)
+{
+	while (*nl && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && *nl != n)
+			return false;
+
+		nl = &((*nl)->next);
+	}
+
+	return true;
+}
+
 /*
  *	Atomic notifier chain routines.  Registration and unregistration
  *	use a spinlock, and call_chain is synchronized by RCU (no locks).
@@ -203,6 +216,30 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
 NOKPROBE_SYMBOL(atomic_notifier_call_chain);
 
+/**
+ *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
+ *	@nh: Pointer to head of the atomic notifier chain
+ *	@n: Entry in notifier chain to check
+ *
+ *	Checks whether there is another notifier in the chain with the same priority.
+ *	Must be called in process context.
+ *
+ *	Returns true if priority is unique, false otherwise.
+ */
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *n)
+{
+	unsigned long flags;
+	bool ret;
+
+	spin_lock_irqsave(&nh->lock, flags);
+	ret = notifier_has_unique_priority(&nh->head, n);
+	spin_unlock_irqrestore(&nh->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
+
 /*
  *	Blocking notifier chain routines.  All access to the chain is
  *	synchronized by an rwsem.
@@ -336,6 +373,38 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
 
+/**
+ *	blocking_notifier_has_unique_priority - Checks whether notifier's priority is unique
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: Entry in notifier chain to check
+ *
+ *	Checks whether there is another notifier in the chain with the same priority.
+ *	Must be called in process context.
+ *
+ *	Returns true if priority is unique, false otherwise.
+ */
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *n)
+{
+	bool ret;
+
+	/*
+	 * This code gets used during boot-up, when task switching is
+	 * not yet working and interrupts must remain disabled. At such
+	 * times we must not call down_read().
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		down_read(&nh->rwsem);
+
+	ret = notifier_has_unique_priority(&nh->head, n);
+
+	if (system_state != SYSTEM_BOOTING)
+		up_read(&nh->rwsem);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_has_unique_priority);
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
