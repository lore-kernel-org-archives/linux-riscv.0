Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19CAC3527A
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSDFjVORYglT8OT64r9RfQ16ojNaehttF+irdaf7jLM=; b=QSyeHxEqjE8U9a
	DQaOMA9ZZ8bBbptA3VgdnZaJr5fBZP76gTSqtjhKFCrylvu9Pw6v7LggUXkqmmsJ+HTZPBY63BDBv
	9s1M1vRRw6ry+Brrfb8EnDjQ7rvzO1Qr50N5NPMg3x+vT7aVEfPME9IRBPh3mbZ7LpGlsreXw4SM+
	rrEcOqXE7lisfgqqwdWcgP+nKYub3vsaQ+UXq1p96243oFfbaX8955KTYHW3Z0ONwizOhUJmMEbtG
	xSb2IPVXvprGh8iUQ30zRzYUwtXxpNcbPOPggVFdT0SmZrsRQtL0Q08uqQJltsUzGpNsXeXX1hQwG
	hh26b+LPdA7RxLN2Li2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlN-007fZj-Kg; Sun, 30 Jan 2022 23:37:41 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlE-007fTh-EP
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:34 +0000
Received: by mail-lj1-x236.google.com with SMTP id j14so17124489lja.3
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omD9ii6hdmOPOLz0ZrMYTS/dF5Fa75SnRoAvSUBcMXk=;
 b=cQofKfpuj96FPKIuElG4JVB5ebsyCGvTeW5J4j2MH7X0WRLgzbVACf4DTute0QixNl
 XMz7+003bKZlwkXkPIQbN8oTinvwUmojDoYGjYhv7pjY2trTgrMx6mGzRdNnLsY8mkl2
 7WmE4naskN1xx+dSFpiWKWqfRvBmvOtiRbW6rsCNAcLJPNEVLDCe91z6iUu5+BFugaT2
 bIk9Hfq63C50xsIBoY2u595h9M/qG+2YlE2Nn78b7kg2gyK8fxA4P0H2C4WFKliLAVXZ
 7qPk0tNjqYTPF3ucU8/++kKEXP9ZHsFeIbMKK+4hihzAWu5kciFNMvK+pAj6fKNfAPQ5
 xmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omD9ii6hdmOPOLz0ZrMYTS/dF5Fa75SnRoAvSUBcMXk=;
 b=TDe+yHg0zW6SCZLYWKXDY/fGiLroxxHwOLhJ3J8rWFVdCUdsj9CY67ChRhQIy79wLx
 biVKHNgUFtGtqGCQckVqdD0v/L21mRMLHA65B7mgJZKxVvgrgfabOLmzN2GZbl7+ZZwm
 oUaNZAPInwU8DWY5JT19pWHhOVbvOlDUa6UlbzJOP/e6fckfFKvQg2mE64TAI66yI0Aq
 O0/vNvfke0KMYH5dt4haSwSMMCCXVjXD8t27ze01TMCBxpyUT2ocHkSdTzA2hKyvawHP
 yiSPjGIJPNYRbZEaz52tLeESThy6C57WI9PZlnWzO7qvXHxOAhwb085/Qk2Sp8aKgYUQ
 upXA==
X-Gm-Message-State: AOAM531s2ESbelCewHOPrufSWfnF8n5KDnVwG3EDeT8h5YgdjiqsYGBM
 i7Y8WXH9Rb00GS3acXK2OWw=
X-Google-Smtp-Source: ABdhPJzH4GGHER1dd7BkRpS9JCpguXkNuEOfM70GPh5pyei2pr3VhMNQQj2zlKMHcg7OCQ6lFFEolA==
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr12281006ljc.301.1643585850758; 
 Sun, 30 Jan 2022 15:37:30 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:30 -0800 (PST)
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
Subject: [PATCH v6 03/21] reboot: Print error message if restart handler has
 duplicated priority
Date: Mon, 31 Jan 2022 02:37:00 +0300
Message-Id: <20220130233718.21544-4-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153732_505236_4F64A9B5 
X-CRM114-Status: GOOD (  14.30  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
