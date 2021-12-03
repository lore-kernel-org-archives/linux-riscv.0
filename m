Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3C7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/AYuHQf/uRWnVib8M3ZWW5yIYkZG0XziCc9+hhA/Pg=; b=IBldoDKeYW5Uxb
	XY4sOyP0M1eGzWQGPODBZKqgDOtYLPprYIoDLVjy2lNKx4GH3wnpqK3TPMbpoIaW02qpK8hnGkmKh
	0VLyoWIe3QPGuCpWKVXcs/+OEIfE+ICqhZ+Xex+ilIpaTslQr1nglJ0CT5p3b90cWh0heRjomRSPL
	j/B/8FMhy2ToOh843TIrq9gZrbGQjxYhABU/OB8jT+7PLolaVh6bGC6Bzd8WaeDXD23OUOga0Mvb4
	jIPmykZyP+54arLAulAU8f1GYhSSImmozZQdUBcQR36OZPeJ1QIIbCxA8qKPltDwctDlemKCACDxL
	zTAnMA/JqVNtF8gOE7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0zI-00EMPs-HI; Fri, 03 Dec 2021 05:20:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0yi-00EM6p-0r; Fri, 03 Dec 2021 05:19:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DBA5B825C1;
 Fri,  3 Dec 2021 05:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F68C53FD0;
 Fri,  3 Dec 2021 05:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508760;
 bh=B71rQ+fNXM16LM47OdH86wRkLVWIAb35br+fzuzSHJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZCbjVkSOnULAfcIFVLS25gQ3yFkJtv6i85o1SvTuCcq8KEA1X7cddy5R12NLvSL/J
 Rq73NTTJvkYyTHkvqW4VRm01m+5JXgVK+jvIHnyYPTXSVfOBETzujMNGTdXNiWCLOS
 VUUcAqi7oA0ZPLV4342e1tEPJT229ZQFOO52RH6rVr5VDsymeHl0ebD2m3Ez+QtNJG
 y9XfLElDn5VhSNwKCNZLqY8B7RNUCdt2v41N1AhbX2ejkzqLhBhrh5fnOC7ifhYVZj
 EBpypc8QsAjBuXJdOYAPnyIJ/2rXojJ4b6Hdho5Gma+5H9s7cjH+TVuj6a0WrvZJDT
 mSvbuFtAPRpAQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: [RFC PATCH 2/5] riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE)
 instead of #ifdef
Date: Fri,  3 Dec 2021 13:11:54 +0800
Message-Id: <20211203051157.2160-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203051157.2160-1-jszhang@kernel.org>
References: <20211203051157.2160-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211924_212621_523CD940 
X-CRM114-Status: GOOD (  15.22  )
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
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the
code and increase compile coverage.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index aeae7d6b2fee..704e2463e976 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -755,7 +755,6 @@ static inline void setup_vm_final(void)
 }
 #endif /* CONFIG_MMU */
 
-#ifdef CONFIG_KEXEC_CORE
 /*
  * reserve_crashkernel() - reserves memory for crash kernel
  *
@@ -772,6 +771,8 @@ static void __init reserve_crashkernel(void)
 
 	int ret = 0;
 
+	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+		return;
 	/*
 	 * Don't reserve a region for a crash kernel on a crash kernel
 	 * since it doesn't make much sense and we have limited memory
@@ -812,7 +813,6 @@ static void __init reserve_crashkernel(void)
 	crashk_res.start = crash_base;
 	crashk_res.end = crash_base + crash_size - 1;
 }
-#endif /* CONFIG_KEXEC_CORE */
 
 void __init paging_init(void)
 {
@@ -826,9 +826,7 @@ void __init misc_mem_init(void)
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
