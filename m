Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08AEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jePw1IeMXWzFXW548PYrl4A1ia7wDTu4w8pzaYXLcaY=; b=vGvnWXCkfy9kZK
	fQPKDKayUVtp7perk4sAftcUJE/1NJ3IEzLAFgHYyF1PFJ/Cv5/cbjixlHTpRmAhxvs47eTKYSVdT
	Nhdzb8yzn7xhFGpGxQU8wsZqVUUFNvHfVJXOjE+PRQnfd4dZdEHvrjX7jz/YNb4FgdYOQcfr3HqQE
	dDR5hW8lAMFO5BW8nHwYqGDlB6tiao1osbUF1ayTM06shOJfQ/KxR3y0CRHEFlP/GMC7jzN2/D1jV
	78xzCd/3s/HL4urY74IYeOPFLAnkrCeGyKX8smC49/6h8fW17xnTeezKDmLz2gS1N5OXQdwV/F8UP
	h0Eo8JrBfBqrapX1Cniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGcA-004h0Z-RG; Mon, 06 Dec 2021 16:13:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGbX-004ggd-Jo; Mon, 06 Dec 2021 16:12:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10BBF61366;
 Mon,  6 Dec 2021 16:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13504C341C6;
 Mon,  6 Dec 2021 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807158;
 bh=FbVUfMtlrUmynM5GSIR2jyniuTQu6HS+1BJoIHuyhIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nvQ+cK5HnoWNb/L0NqoY7XfHUz5r4CqrLksxkylnrp990aoQ1ZBiJZcwZfCTs22p0
 nmIFLmqu9cif6hoTjgAwJNvQzvWHGm8RlixRySanrkS0shvhqTERJEqjAPDBzJR4Ko
 n+QHCF+u4Ew5xuWvsF9/cfMNdUCskqH0g6CgyJNxnSV8Oay7d/mxUs7jBT3gAPzLZp
 eOsqjixa9h1hl5MNrSnfkBZPYi0rtfRr1StTEELG6iJ5JaU68Hax8n7i+31/HfxSnj
 BRu2e0iplUwnUBTlqZbtc4FFlFHKzv73g2WfLrYDsjKsvKOOC0VNbn3pD80tGsmUAm
 8TglsEVNIVBEA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: [PATCH v2 2/5] riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE)
 instead of #ifdef
Date: Tue,  7 Dec 2021 00:05:11 +0800
Message-Id: <20211206160514.2000-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206160514.2000-1-jszhang@kernel.org>
References: <20211206160514.2000-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_081239_722622_7CAD5BE2 
X-CRM114-Status: GOOD (  14.57  )
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

Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
and increase compile coverage.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a15640eeb334..84879a5ce818 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -748,7 +748,6 @@ static inline void setup_vm_final(void)
 }
 #endif /* CONFIG_MMU */
 
-#ifdef CONFIG_KEXEC_CORE
 /*
  * reserve_crashkernel() - reserves memory for crash kernel
  *
@@ -765,6 +764,8 @@ static void __init reserve_crashkernel(void)
 
 	int ret = 0;
 
+	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+		return;
 	/*
 	 * Don't reserve a region for a crash kernel on a crash kernel
 	 * since it doesn't make much sense and we have limited memory
@@ -805,7 +806,6 @@ static void __init reserve_crashkernel(void)
 	crashk_res.start = crash_base;
 	crashk_res.end = crash_base + crash_size - 1;
 }
-#endif /* CONFIG_KEXEC_CORE */
 
 void __init paging_init(void)
 {
@@ -819,9 +819,7 @@ void __init misc_mem_init(void)
 	arch_numa_init();
 	sparse_init();
 	zone_sizes_init();
-#ifdef CONFIG_KEXEC_CORE
 	reserve_crashkernel();
-#endif
 	memblock_dump_all();
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
