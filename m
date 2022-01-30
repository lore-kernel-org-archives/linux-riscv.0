Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8BDC35271
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chwLEwVDe3S4NmQ15FJFzq42WywB+QgmdUBc2ptBPtQ=; b=ssp3f6pyGwrnuk
	B/xg+kG2PuYKxdbfPHIl79PY/f0xW43/qjeuWdUV2byvTWZo1/thS/VZ5WizN5OSQz6us4J3p9fpy
	P79KYIKdbYtjhOL2ilq5HO0q+0beRGIrHFmwA01A0+4zY1ecUUey7vW0ERTh7fln+WvQSlEnbMZ7t
	bxA9pV0phu9lkV5i2owVJJD6zvr3P2PI62dh3C/13CXDz74PsYEikFzlzlPpgO8UPKRZC0SZNkMEf
	w70V7PVIv81kht9CVw6CrUMvSIrM6SlmXuG0X1IabNWt/orl+pBdGe2fpLLRr4heskz0Eiki6OFaZ
	+iy5KjlccWYUbcwyNqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlL-007fXy-3t; Sun, 30 Jan 2022 23:37:39 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlE-007fTc-6T
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id x23so23418933lfc.0
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6/CD3Yv31GR8y8GlEUTCAOWsPgz1l4zxLQQTTW1e5nA=;
 b=eMhJF7grCwjcHhcO0w6NJcJWCpwGV9U0gCsMg0TGwobGBXDG7Vx/L97nAcGbsxn/0t
 lOUlBHMB48PlUMU15vUurm7j0pvN5BFXkJhFXzQtsg8F+BsiLTVvb3ey/9EANWthyhTT
 we8glm85/CmQP0QZ8+T+Lm4inD6Om2LbGaB9R6csyvcPXIEYpw/bulY/B/lTyYKOPz5Q
 wxGxNLfaFVrUEh4p7rOa6O9dbsq2pKYOYPMchljsZ3p2oxyKvQjmDp8knc5kaAt3dCPj
 bpgTHYROYSaO5OyxFwKNgiQ6VFzTC+FU7O5VMWWPycH5YgdBO3xjR5PNbDcl/bJI2s7Z
 GBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6/CD3Yv31GR8y8GlEUTCAOWsPgz1l4zxLQQTTW1e5nA=;
 b=uX+lC6ZZg4Vqv2Hj9qhNKTweeEdIG0T21gSnnTv1wrA0YXBhoxu8mAYzVQcFs3/riu
 VPn+oidltDPXCt7rDl/nNkXaDUmVMTM+KPIh+fGju1+zSVT7hYPJnQuhfOGSFBkWy4lW
 QAkUDuTWthdOyGGBa5E+kHTiUFE0PuUoGK+06qaSOAp++C+aYftQv0lzCnwQhmkbR/MT
 TnfBQZOeFtkgcMouP9rng0PihYHaYJ2TLnbz0ss0gvfHgnhFms0yy4BY72EYZRRdC7t6
 l/km3w6ViYv5aytjBjizmtYbOHMgV1+C6DQbPBqtTksXPypHzjWEaXnHDEIe9YfXJFk6
 lX8Q==
X-Gm-Message-State: AOAM5338b9eNLZ8WNQAnh7zu1FnPfSmY0Qq+DS0VN8jyZPs+rqv1shti
 ierJjY7GTTRQUPHW4gNaROc=
X-Google-Smtp-Source: ABdhPJx51hnlnQqEq7wZo+FkbVvoWM1PpIEWobaBlkXpSMr/tjqFbuGZX/Rv6DdZhPEAEqmSsBcOEQ==
X-Received: by 2002:a05:6512:38a6:: with SMTP id
 o6mr13194842lft.4.1643585847142; 
 Sun, 30 Jan 2022 15:37:27 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:26 -0800 (PST)
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
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v6 01/21] notifier: Add blocking_notifier_call_chain_is_empty()
Date: Mon, 31 Jan 2022 02:36:58 +0300
Message-Id: <20220130233718.21544-2-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153732_268736_ADB49BB5 
X-CRM114-Status: GOOD (  12.68  )
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

Add blocking_notifier_call_chain_is_empty() that returns true if call
chain is empty.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  2 ++
 kernel/notifier.c        | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..d4717bc0ab85 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -173,6 +173,8 @@ extern int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh
 extern int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
+extern bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index ba005ebf4730..4ed6bda8f127 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -323,6 +323,19 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
 
+/**
+ *	blocking_notifier_call_chain_is_empty - Check whether notifier chain is empty
+ *	@nh: Pointer to head of the blocking notifier chain
+ *
+ *	Checks whether notifier chain is empty.
+ *
+ *	Returns true is notifier chain is empty, false otherwise.
+ */
+bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
+{
+	return !rcu_access_pointer(nh->head);
+}
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
