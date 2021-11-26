Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntzpkMCxzM8BcJT+V9cTdrpx5nfUW0SpTLn4ZhKI1jE=; b=1Bs9ZVet9leknH
	DIwWaMNwzFISeSwmCzsI5jfwCJGLrab2uoSOgZqXl+qLGHuBIze8bDrc+W3YL1xBF1qnmEkFktX4q
	NO0x34Km0qx6QoQzfv/JN6K3RKjXU6MgxXe2YH+mxIgp1eq5mGNHGwbCf5/et1SD7FS66nr0A9RFP
	DOdyT3uub8a4u269XdNVpM9ifQMKZdMQanfxe/c5Se1jAk0mSK273b1nXxnNYzgoKuUpKpHApr1ym
	WaayyEurIdl1rlbpj57VgMyEl2LNOwgrXvXuJqe5Cs9TxpmaKP4BL2twSPl+2NTdYaZR38BT4qxiF
	ALzdpiZuPijsirgZQ0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfYM-00BNyS-B2; Fri, 26 Nov 2021 18:02:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfXw-00BNd1-LN; Fri, 26 Nov 2021 18:02:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id c32so26151068lfv.4;
 Fri, 26 Nov 2021 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
 b=q2+3D7luLbLFGQf0rLpPcuWTJ51luwk4E0BLwdexAsMfEPwQ+vkLaGFyWTazwTiBO3
 /31kHhpvsxvbKpD6AoRLviAKAyfSlaZuuBZ4G5+V4OQzeOPzvvdnKmespVy/IqSeX7hO
 YTpSNWUfBdkYMm9sefGyGdAIypO41Y86jqoXG+FM5ZKY1SqW/Wp0Kge+e08k/V8NPYuz
 YtC36m0FSAgcE4CC4jRft7WGjfF+hcgDrvOqUW7oFxpYyW5LwR3hKV2jrTJdfRtBiX7E
 qc34DpRilSgV0iEhvXRNTWvVGUy3qFfYDOeUaBdaf+MPIjTcw1RGSJKn81/KWfdsBdx+
 55DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
 b=h/6Xkh3wA1uOQeW0SbardsINHcpoA9CZVr3U060al2id5WKI3Q9qJL9TjoLFVZcTlO
 TbdfGdugOpd8gMReXKzyFEvVNHzSCNhZBw9yqznD0yPiy337ZngGX+Q29KpLgu69KJEE
 QyWbTAUbJ7JkkePVLboIVYP0F8bj9XnJdIJ5IzdvwsoJtZ6AHlQFVkEytGxLpWQAhdWJ
 OG9Hq0aIIZGEVQ5phVVxhS3+b8KIgSQ1H33DLob7Na5gCmyHBAq36HXVuCOCJuCzpDE4
 qe66NYdnu+tEs/IScTLNXEs2uCacHodSFKzyRTKH2E4VF/w/OJXytvfHkSKs2oTRzGTb
 jtMw==
X-Gm-Message-State: AOAM531Xy5wQyXRZFGgb6ZRJKqnrDL4OFBfz09GRrhOfH9xx9UHuTBGN
 S/HPT8lvd6NETCNPu1tUzAU=
X-Google-Smtp-Source: ABdhPJyszCqoy2c22hJd1AwW3euuk/YQIYMf48+wUhpEids7tlSfZnt+31CbA93lLkfEy/WCRFUCww==
X-Received: by 2002:ac2:4423:: with SMTP id w3mr31717979lfl.385.1637949722516; 
 Fri, 26 Nov 2021 10:02:02 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:02 -0800 (PST)
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
Subject: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler() fails
Date: Fri, 26 Nov 2021 21:00:42 +0300
Message-Id: <20211126180101.27818-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100204_763908_6E7F4002 
X-CRM114-Status: GOOD (  13.66  )
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

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e6659ae329f1..f0e7b9c13f6b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
  */
 int unregister_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_unregister(&restart_handler_list, nb);
+	return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
 }
 EXPORT_SYMBOL(unregister_restart_handler);
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
