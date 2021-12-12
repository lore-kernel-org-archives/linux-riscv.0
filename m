Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6E0C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jx9QrQbELI2kT1vxv15hQxIT1jvKN/ZRMbDznqFf/4Y=; b=zS3LL+6vGBBO61
	8UxgfF/nlDX5AWCUXj73E41M2DLqvzprfIKBk/jAzZPKZEZcDgPw5UeH/z91GEjXm85o51f8bsTD7
	43BDHqtMOmtuaTkneKjZJSt8ps8jmTtg+mkJ+RGai3pEnOuZqyBiKfk7wpkZPQdNZL60MBYbZ08BE
	bITCqw30Evz8fHflEGwZ+wgWHPxENWhwHI+vMXB7TUZOQHnagWjcGBBUqYC7lDNxpe+mABUtTJ8y+
	gUPlLZK43DpGc5DnO5rXdO8LgPIUw6kLwG3BZMx5TyMz+Ij07JXtSDLnEg+lOCoK8ZSxzj3NIraaM
	MPUVFaHSpmGGreVLHs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW17-007GPB-6f; Sun, 12 Dec 2021 21:04:21 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0k-007G4b-95
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:59 +0000
Received: by mail-lj1-x236.google.com with SMTP id b19so19303568ljr.12
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHhUp08VE2ztEefsMlISnf3ubNnW0z005TmsLrFHcW4=;
 b=M4kpDtgNg/HMIKnHemPbZaAlzhr0ntsevGanXWQ4n3yWnl//f+XQDu5U2Ja/bsZBLw
 ZB7lG6HNkYZjH8rldh7wQZsaGJBaC4h0p4AT21fuNpchnkBJWm9NM9UGwpzaKojZCS7y
 bTuVH9eWn0ocvLyPuLVpNAy1ngP0f11Fg78Z4AEVGIk7G8QbthlbgjrYXuLAU498OxT8
 bgCN/dHbI9hpQ/7EtqeytCSL7rK/H+myVWm8Se1R6C2Q4UDGC7MvllRFkeixGbQendIJ
 yK+CRe2KyF+IJR5cBcrAOj9h551rxSL2ZajWGRFkc4kB3fO9UCnd3vhKtJZ1+yX50+HP
 yKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHhUp08VE2ztEefsMlISnf3ubNnW0z005TmsLrFHcW4=;
 b=DCkWqRYNIbGrW6sN2crNCaNFLA+Jgs3BZeUhohXZVUHf9XC8RQW4yjHwugblD5fIj9
 MFx72ilnuttKy3RGBrzWn4avcd9E/09JO+QdtNj6Wt5Gb/PbJp3N/MnKbDV8SJ7CNfxW
 gHxNdTAYxFIsGTZjbC8nZ2FVVWOlJMV9O3pjabCamMutY3KNbRkBlQVT/oV5CI/BMpFc
 HCuhKZw0UVAYpYic9KobQdEfPqU3AsTZFkNL8veH7jRiQYxQCbhW9L4ddH+3M442qNM3
 vIgq3aR4r4l/RT95J3WAffU5V4uBZpmhwuVLK4xT95vXIy5v4lm5f6v73kBTGb+Jat3B
 +Vhg==
X-Gm-Message-State: AOAM532fRc/1H4939fr/hScsDIUYrq92bzSC1ujnH9IkF1XoenfvtCYF
 uBwg1OyJrontgRvinhTj/LU=
X-Google-Smtp-Source: ABdhPJz8R3Mq1R/xI8IHeAv3OrqV+OEyi8dYUIUI01foRIKaOY1/e4KcpBxYoYjyrD2YWzDb+CaShQ==
X-Received: by 2002:a2e:bf1e:: with SMTP id c30mr19020669ljr.408.1639343036846; 
 Sun, 12 Dec 2021 13:03:56 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:56 -0800 (PST)
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
Subject: [PATCH v5 11/21] powerpc: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:59 +0300
Message-Id: <20211212210309.9851-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130358_355181_AC39A7CA 
X-CRM114-Status: GOOD (  15.39  )
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

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/powerpc/kernel/setup-common.c | 4 +---
 arch/powerpc/xmon/xmon.c           | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index f8da937df918..8158e940db81 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -161,9 +161,7 @@ void machine_restart(char *cmd)
 void machine_power_off(void)
 {
 	machine_shutdown();
-	if (pm_power_off)
-		pm_power_off();
-
+	do_kernel_power_off();
 	smp_send_stop();
 	machine_hang();
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 83100c6524cc..759e167704e6 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1243,8 +1243,7 @@ static void bootcmds(void)
 	} else if (cmd == 'h') {
 		ppc_md.halt();
 	} else if (cmd == 'p') {
-		if (pm_power_off)
-			pm_power_off();
+		do_kernel_power_off();
 	}
 }
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
