Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F7EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GJpyP2lV3lb4TdBush+IiBRmdm1EzS+FIvnER5w7fI=; b=tc+hP7YcTlstlI
	zR7NpBNnAp7PBorvWXB47fegEp1l3hVp0epVS1cm4QEMqTxaZQ9tS5ok9Dwc+4I6r7rgwftavXoRw
	GMOzhJFjNVk4DCAFnBCMi+nPgEKcul7ZTP6gBt3MY8hpBNYe+yNQchflgwi/2yPLVLvKCX0FlOxr0
	XaQ+SEgZuXRZTvqgOgd4DKQg/jwJH3dw/dL0irbhxyskDZoqGUpVPUUo05oWRzncY3gPuAgOg62ug
	9H0LQg2lLr73Pbunrxo99+Qs46ylBqtgOROmkmpWi3NrAq/ll1oTHZx3IZ6uop+wmaIgIhSWEnNGn
	b1rfkw50yBbd2jEqJWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBjZ-003U2x-JI; Mon, 06 Dec 2021 11:00:37 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBjW-003U1m-QM
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 11:00:36 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 67B693F316
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788433;
 bh=LLLQM2eTCRvnVYbUZLcWpcb1BJMpiZdjxDv6AB/KJWI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ObrMo4nvIfpog97Fky/mTIVNTi4ri3K93PgtoMxqEBz6UarL/wnxaVb5Twsrd2XrD
 dgaNd2pRFpEsuqT8eBlWTRRfPbTTkVo6S2J9cL2JZ1qSvXwU0euYYqzbFeF+yIB1Di
 qwlcWRVeFv12hu3DGlx3EZKTPjpHp6qx1yh1NvSXk3FSDsQjYCaOyBtd1ARuBXwe2r
 MLr33cbOx4Vk/bB0T5CGe4FObPDy9q4+X3dEJ7EzLwb+bQIxE9HSN88MfRmfEBA4iW
 J0argwINL8HqcsOZJqcuIGBGE6OYgPMpyGjOT3KEjIdXb15AZVAeGocgqZvq+GXAln
 yqFx4uVkeN2Ew==
Received: by mail-wr1-f70.google.com with SMTP id
 x17-20020a5d6511000000b0019838caab88so1907299wru.6
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 03:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLLQM2eTCRvnVYbUZLcWpcb1BJMpiZdjxDv6AB/KJWI=;
 b=NvpTh1I/xsJ8OxBYMCwwj8u54UUGZ+nMPpXkHwQ/MXJudPR2mLmv/ayelIUyQVsOmx
 xyyeQpJORMVpvDfhY+Y9H5IY3hiBz8IHP/FFlo1gm2fqc8ar4ClEgSTUALaX4Irk2IB2
 15uBgeogk74nL04/N8di1INKqpKmDKX0JWZ4n6HylfEKdroQXb8nFgVx2kjuU/3cp+XQ
 OvSue3m4bPGpSpiOtqa/EjPfk4eYMIVkQhIf1GyIgTOpo3n6qJPkoRzXdf2OaFLfsP2E
 xFO2skh7CwmP38LshlfLSBVQN1JLMSRTMfZl8AF1ipKi4mmXLI50uikLxHTffDM+ay1O
 ElFg==
X-Gm-Message-State: AOAM530k/Uz1LITLdSKvQuS/Kya4MPyky4/6VFSsL7vTTSQvhUS2apP/
 DyWmOHQXEB+G/d0J1BK6NtgU3E9PVJEUYPYDEnL8jBzRAyfzW4TGFGiZ2pAoVaetZwFKRpmFA6M
 WpMOuz/JKQzkt2Els4TRA+p/0jjHCZT2+o4W0HVwHu1PCsg==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr42771088wry.261.1638788433016; 
 Mon, 06 Dec 2021 03:00:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZdYEUZOPlIAH/Cikburq8WbdJN819bb7un7RTFQfzoFZY+ymdSWm8xf6/Muh02DAod5q3Cw==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr42771065wry.261.1638788432820; 
 Mon, 06 Dec 2021 03:00:32 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id g198sm11262997wme.23.2021.12.06.03.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 03:00:32 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 13/13] riscv: Allow user to downgrade to sv39 when hw
 supports sv48 if !KASAN
Date: Mon,  6 Dec 2021 11:46:57 +0100
Message-Id: <20211206104657.433304-14-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_030035_029200_6CAF670A 
X-CRM114-Status: GOOD (  18.64  )
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

This is made possible by using the mmu-type property of the cpu node of
the device tree.

By default, the kernel will boot with 4-level page table if the hw supports
it but it can be interesting for the user to select 3-level page table as
it is less memory consuming and faster since it requires less memory
accesses in case of a TLB miss.

This functionality requires that kasan is disabled since calling the fdt
functions that are kasan instrumented with the MMU off can't work.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 28de6ea0a720..299b5a44f902 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -633,10 +633,38 @@ static void __init disable_pgtable_l4(void)
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
  */
-static __init void set_satp_mode(void)
+static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd;
+#ifndef CONFIG_KASAN
+	/*
+	 * The below fdt functions are kasan instrumented, since at this point
+	 * there is no mapping for the kasan shadow memory, this can't be used
+	 * when kasan is enabled otherwise it traps.
+	 */
+	int cpus_node;
+
+	/* Check if the user asked for sv39 explicitly in the device tree */
+	cpus_node = fdt_path_offset((void *)dtb_pa, "/cpus");
+	if (cpus_node >= 0) {
+		int node;
+
+		fdt_for_each_subnode(node, (void *)dtb_pa, cpus_node) {
+			const char *mmu_type = fdt_getprop((void *)dtb_pa, node,
+					"mmu-type", NULL);
+			if (!mmu_type)
+				continue;
+
+			if (!strcmp(mmu_type, "riscv,sv39")) {
+				disable_pgtable_l4();
+				return;
+			}
+
+			break;
+		}
+	}
+#endif
 
 	set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	create_pgd_mapping(early_pg_dir,
@@ -838,7 +866,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
-	set_satp_mode();
+	set_satp_mode(dtb_pa);
 #endif
 
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
