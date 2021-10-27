Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DEEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B080C610CF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B080C610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQronLoMW3l4BhAtl7R8hMr3d1gKNvxiNjf2/7TR1VY=; b=BrbJfKw6J0vmlV
	WwLGjGcmr0HzhxIjxAfS/PdxB5J35xZHSYY4amWigVCO6ulGootz/KPmiAAhOB9L0Ydvypy64uVp7
	h7KQjJmjRg3qhYIcSzT1ceAjnbkteHykltkZua9Ma188rA4UeGqmceHM72ExvYPwWNDWWaAAT5SFG
	KFvFjb+HQASvS3H2Gi7nBlO3lNErfwwqnOeD32f0/XbNo/uban8l2lFuqJsgZsHtT53n9ZHA0V34t
	d80o0h7uBvIMT7L3Dh7peEpuLqn1WuVjMKWmCnKQiPiJ91k1+O1dgpRWF0OGUQCHpXg/QnuFP5rEV
	cpif/fbVBN/ZWAfg/oBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqJD-006AOj-EH; Wed, 27 Oct 2021 21:18:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJ8-006AIP-TA; Wed, 27 Oct 2021 21:18:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id y26so8912022lfa.11;
 Wed, 27 Oct 2021 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
 b=ZqOcoukrajwjG0ttfhDDamRtFbZgEiaFrpLAXOR7yQBANjFcnFFXOdYomTLQXBItFZ
 6fsN0Gio8AJkokF0BnxXjlaJgq1CP0FdapZULDkVLC880wSvbduG3ij7wOgm65yyZHfb
 /MEYtYvu3WnHHl8p/60KRwD6dDnaqpWEGWZELHlL42ECg0BG3xSUbLaFXBGJ8l5anvCb
 nmVZ+GAgVHAauuOzz3lnhLFItX2Cbpx7VOJRMQdOkh5vDNRTVY6CLlgAa8SfZ45DmHqN
 vHhGZ7nhCEzJCcCT39f5nwGqOjoorbJierMaHF5OrWAM3eykGjghB0x8WQgbnqhmKJ6c
 aKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
 b=IK/xoEi4JaAzoCRwcYbRXj0/OBZTX5HMxwW88WyjfcPi0qrTRVSarkz5Nfa9tThIfH
 FjMvPPI2YXu+Z7/RqyhK47gXS7hxxD6Hv9jBuDKh52eTHI1AGZ4x92Hh4oS7+c/Q3/tD
 zvtPpfFtYVLpY94tRxXAKW4Nok1F7cYeEXUgyupnLe4bOM+S3oU5WOB2VaMD3sNLTJ8A
 bWRqwN+6zpgLT2mmz1Bd+6ZjhbP9e4t63+Ftg8mJteDgDuA+GjcjZyqY5r4GaxCgHVQf
 Ss6ovS/LbnfwayUg5dqfesTvsakjp9wl0wTDTBQxhwe/3fx5bbhFliCNqXtscpd4xQrp
 UnVg==
X-Gm-Message-State: AOAM533GxbrVFjMB0yOx1/rEvCXKMB75sf9AMEL/zBRAOBUL95qilKZY
 nMfkAky4Ef91IpT/9UGEBR4=
X-Google-Smtp-Source: ABdhPJwuKOrqeex0uVzCe5G2iTS4vzkdpHKtiR+d5t3erf2uXeC/mCcisVEMxQQhKVgKCWNS6EmCsw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id
 p16mr80629lft.483.1635369474451; 
 Wed, 27 Oct 2021 14:17:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
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
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH v2 01/45] notifier: Remove extern annotation from function
 prototypes
Date: Thu, 28 Oct 2021 00:16:31 +0300
Message-Id: <20211027211715.12671-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141802_952237_06AF3E9B 
X-CRM114-Status: GOOD (  13.88  )
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

There is no need to annotate function prototypes with 'extern', it makes
code less readable. Remove unnecessary annotations from <notifier.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..4b80a815b666 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -90,7 +90,7 @@ struct srcu_notifier_head {
 	} while (0)
 
 /* srcu_notifier_heads must be cleaned up dynamically */
-extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
+void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 #define srcu_cleanup_notifier_head(name)	\
 		cleanup_srcu_struct(&(name)->srcu);
 
@@ -141,36 +141,36 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 
 #ifdef __KERNEL__
 
-extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
+int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
+int raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
+int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
-extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
+int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
+int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
+int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
+int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
-extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
+int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 		unsigned long val, void *v);
-extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
+int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 		unsigned long val, void *v);
-extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
+int raw_notifier_call_chain(struct raw_notifier_head *nh,
 		unsigned long val, void *v);
-extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
+int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 		unsigned long val, void *v);
 
-extern int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
+int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
-extern int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
+int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
 #define NOTIFY_DONE		0x0000		/* Don't care */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
