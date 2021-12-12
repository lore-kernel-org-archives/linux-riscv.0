Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA4DC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uLpqcKAHfhOv58cV97Kf6BEVELDpdWHsIKfQO/Yvy4=; b=K8+UvFr/VPO95P
	1K93YFHbu/k7JFWWw03b8GsYtKFX/hlTf4TWuWaEr/0zHAoWEO8l7xMcC3uhFmMQjugUp7RG814NQ
	PKebaUSG1FqnDogF7qM6w2nbcZKnyt2LAZ9VN30zxnXRXMTFFIZC8tj2wCwAIlZS52xBHt/BfF5n5
	xpA14BIZAtXMKfbjPwtEjNz5OLZsqHsmhMHJhuIu+DahFsfd+m2+1Ou59MAIOjvANGqhURztBqbOf
	EEuxQ8yv2C18DkKjtvGyM3Z5tY5XKeRFCVRJ1FtdCsQptVbqgzTL0HBI/CqPffv0hbELZEgKa/Txf
	s6rC8vIWGGR3GXdqmj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW0X-007Fxp-9d; Sun, 12 Dec 2021 21:03:45 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0U-007Fw2-T5
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:44 +0000
Received: by mail-lj1-x236.google.com with SMTP id a37so20012449ljq.13
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
 b=qyaqAU+HSKD+HsUBKg5AB4Grj9JsCbr9g/kNEIZtJUYDPkR5w7X3oEBoqbhkveHPA0
 i7WuMCFDqVmy4v4uwmxmKqJQgyKWbZxAuezUxU7vJ7Js6Vv9mGU7AXWM79sgkKDLmhWK
 jFp8UPoUTDTrVPMbjiOZPw0kaHhZEow7vk98bEAvorv4PN2Ae1WrpFauYpbNmt6sURPu
 EHsFzc94IQPacNeM0GpGjXTCkggEJqqfF6pqgsflI/TGqDXRSOm8kaL/erYImjVTvQQe
 TKd1cdir2wKhwb/5hDwmkKqbCAzORiU/FXU4xaDIEAT35buQchr71urUuURu0JjCKmA+
 4E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
 b=ORQhxR5yCKBqRv4uQtwHKNuXrPqUTtpI8tHImtzRDhicdHyh63okTUA41YHi4KaJep
 TSHfAZx3dIzRGJjUjlnStCym6uPtdjG3xZiHW23BbgQ1YjR+FEQGVh9qZUvVWsN84dRq
 q9JhXExRdpnXP2m3EEqL55xULl9tUXgURlaQFkc49uQVtcMHHgmxvHuF9rZZxCr9oaKw
 0zZ7LvSRFzAs62gSw2i9JklGyS7ymuKTCjnOASmECqDC+/nnk7Nc1msv6lx6T+I0CFMM
 HvVBDPJeP1fU0LWRRwOY5ZW4lsqkGZ0QMUYTcrsrDD2zcUTHOWUd41AeRni5mCve7cWS
 f5gw==
X-Gm-Message-State: AOAM533uA1XLjgdwHzI4Obi5NPFDjze46+XL4Xit/RVkgv0IQXAtxUUU
 N80r5tvWeuKKyoj2BBr8u+k=
X-Google-Smtp-Source: ABdhPJzPB5bwYAfFOn1aDytHDcrWq16AdXdyLAU7ztJCQFx3xpkh7jhCINcDSwIbtlftQmSbgta8Pw==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr25528327lji.143.1639343020440; 
 Sun, 12 Dec 2021 13:03:40 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:40 -0800 (PST)
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
Subject: [PATCH v5 03/21] reboot: Print error message if restart handler has
 duplicated priority
Date: Mon, 13 Dec 2021 00:02:51 +0300
Message-Id: <20211212210309.9851-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130342_962460_B10CEAC4 
X-CRM114-Status: GOOD (  13.68  )
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

Add sanity check which ensures that there are no two restart handlers
registered using the same priority. This requirement will become mandatory
once all drivers will be converted to the new API and such errors will be
fixed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..35f0cde641c1 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
+	int ret;
+
+	ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
+	if (ret != -EBUSY)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
+	 *
+	 * This requirement will become mandatory once all drivers
+	 * will be converted to use new sys-off API.
+	 */
+	pr_err("failed to register restart handler using unique priority\n");
+
 	return atomic_notifier_chain_register(&restart_handler_list, nb);
 }
 EXPORT_SYMBOL(register_restart_handler);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
