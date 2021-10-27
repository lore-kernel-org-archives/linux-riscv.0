Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A7CC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA63E610FF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA63E610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vnc+HY5esxFMzbgZJX2wA4JdMFpCTFJPc1oQ2wCyFSE=; b=DG84Qan6hvc4dL
	Rp+T2Lgd05c/1VoJmcVUaVrYYJyLoflDySwRZQFa7OQsBNWZKyzlmGXKXR076pyOlQU5cxMBS3Aem
	r6hFP6hJEjDmfHqTUrbo3F8vz8XB7cDD+XN7NtA6KSdYgOPxje4JlwLbFGmzbqm3l08DKLir0X1/P
	ebFeHedQwXjj5HZQCM32/FJd8HJ26z1Iq3sJa4QLGrnwhyLT6OcgsCsO9Nl2IoNcbPSMGM06n6AfP
	DgMGo9w/FYZcU5xpsLKRlJ7UB2YT33W33Pg7Vrpti9EeQ0MvjQIen0dKkTsMuo6Hzafm6R2GB90H3
	t0SH0395za6IVxCUvqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqJR-006AYt-Ka; Wed, 27 Oct 2021 21:18:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJA-006AIv-23; Wed, 27 Oct 2021 21:18:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bi35so8955688lfb.9;
 Wed, 27 Oct 2021 14:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OzDm5Q6AH2k+PTLkkEFou1ZT7VKkxRv+kE3WUpAOf8=;
 b=UQ/1aCiL3zbAzp7+64ENWMFEP+bdpmbq+KH3NTi7hX2kN+fFVrO8S32QtOPwQfMxxS
 B4dmeXUf/BzuJhhzqG8VnHaUgY25bdcGnTrwxpDILzBPa9fYkIseD/FA90YqGQJP6GXZ
 PaIGof4Fo+LwMmngjVzKDktvBb6N6F/Oq7yFljDHwAcSrBHnke6Ooi6gGMrQtQGLY6gt
 DkEqtfwDzQkavBqxwLa+DWQ8L/Pn42h6a2KO1Y5kAXNNdt6/bA2gpVm767XfMu2cU+ZD
 8088MqymRILm5tETDMubwXrrDQl/PbR2eeFdMLFjmwWobAMprcx5uRuWc88/LBbNkX13
 zK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OzDm5Q6AH2k+PTLkkEFou1ZT7VKkxRv+kE3WUpAOf8=;
 b=sswGHe/tWHp3y8CUbjYaRGEvCP34YFFPG3SJm7Y7PPPEJ6O8QBMQ/7w3Uje4z/4XfP
 5K79ClicmdxK/h4gWZw1BwoD67mbkrYIOSS2b/fBEAWbruzu+RINcckg+hpBrBrdzJT2
 aMa9dxRmuUjmyftatNX4Uz9TuJVbZT4HzzgYTcwWoxwIPBtlSn0tm6dTXx2/x8isy6Yi
 qFc0PXmkn5LTYpAKA5L2y8fUyiooyl/+53GTWUfMk5cSqMZ4VCCOHa/f72AKubjurGFZ
 +UGQo8rMEdGYxN/J1J1fdCwcGc/P6mNtprRyGxGNlUrs1clQhU+pAQwUnFTmMASHEyOx
 QjAQ==
X-Gm-Message-State: AOAM533E5MXwjVV8OkdKaPM66a0HR8ydZQww3OshElq4Ryln7JhfF7zU
 Gtqo3ltpP5px7u4j6YMIvaU=
X-Google-Smtp-Source: ABdhPJyeN/kGQE6WfHsDgri2jvM3EdB0FfWjlbwbrCss0fAIUEYOe9Prwt7QavBIliqBuOmpkw05Og==
X-Received: by 2002:a05:6512:3f04:: with SMTP id
 y4mr128266lfa.180.1635369476308; 
 Wed, 27 Oct 2021 14:17:56 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:56 -0700 (PDT)
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
Subject: [PATCH v2 02/45] notifier: Add blocking_notifier_call_chain_empty()
Date: Thu, 28 Oct 2021 00:16:32 +0300
Message-Id: <20211027211715.12671-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141804_143327_8DC27818 
X-CRM114-Status: GOOD (  13.49  )
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

Add blocking_notifier_call_chain_empty() that returns true if call chain
is empty.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  2 ++
 kernel/notifier.c        | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 4b80a815b666..054271e9cb20 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -173,6 +173,8 @@ int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
 int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
+bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..1f7ba8988b90 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -322,6 +322,20 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
 
+/**
+ *	blocking_notifier_call_chain_empty - Check whether notifier chain is empty
+ *	@nh: Pointer to head of the blocking notifier chain
+ *
+ *	Checks whether notifier chain is empty.
+ *
+ *	Returns true is notifier chain is empty, false otherwise.
+ */
+bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh)
+{
+	return !rcu_access_pointer(nh->head);
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_empty);
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
