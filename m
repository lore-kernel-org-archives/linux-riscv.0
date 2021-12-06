Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F5BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzFVDwkteBKX4uWX1SBXYoQjL14KxFYRYTmxTHSpM2c=; b=wfHKpmH+TBelm6
	8EcOzzSICiKECXm262kO3Cnb9S5StZpEpMuJcjFm499Ahrs2RR+Ty36NjxMO9Og4e3+6hSnyWT5xv
	ASSMNALr48KT/f2EzwJwj4bUSiZKY5PFsws/xMuSFpZWg74nJTOsaLw2W0wVBmm3n9h8RU8KfSydg
	+0KXvqBXowDwl+Saw9p9WCH8JNZ1oO+NKKONlexx9DleQgyJU/TI6eK1IIx7k8Pp9bGZcsWOH4h47
	mgxkucqnTTyF8CBmK1QJqUStg1BXFwwAGzfyCwMSnP995HhUMNz0TyiFBMSMOKVSyPF00sTpkCT2p
	AS8nSTQln5vPMBhMhd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGcg-004hP2-JU; Mon, 06 Dec 2021 16:13:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGbf-004giy-I4; Mon, 06 Dec 2021 16:12:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D71C8CE16CC;
 Mon,  6 Dec 2021 16:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F174AC341C1;
 Mon,  6 Dec 2021 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807163;
 bh=4lrA7vab3IqapjTBi4sA+eK+CFU9COhOnI0b6b8qoS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nojnBAoYR0mRHYKp/3KVaGhmt58qmV4P0h9vURAhHbgbEO7zcXe4ur7GDw0rCgOeI
 McNXdDdSpd7iEsatyNZVqw8n5EwyKupKsmZgGDjcje28IpyJbkIlNBsu4SQfKafcF/
 9VqU0GV14BMYQJa5PVfNPtYypBOmxWNoBxg+J80nW19lbsCIyw3EoWPWI0sagLQL8L
 rUmObWt1OLaXrw5qNdQcNyJDMOb8iODS5dY4G+iQRXa4FOwMGmYsyL+dxAH2bhZhup
 nDNjoEuuOyaWpjm6E7SAUhv2zy03XYCk94gpE7HKst3S+kzWWbyvwHbgfSJgO/rcq8
 3br6qYWpR+s8A==
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
Subject: [PATCH v2 3/5] x86/setup: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Date: Tue,  7 Dec 2021 00:05:12 +0800
Message-Id: <20211206160514.2000-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206160514.2000-1-jszhang@kernel.org>
References: <20211206160514.2000-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_081247_781434_D8AB0AB6 
X-CRM114-Status: GOOD (  13.82  )
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
 arch/x86/kernel/setup.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index c410be738ae7..56b738c1ca33 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -390,8 +390,6 @@ static void __init memblock_x86_reserve_range_setup_data(void)
  * --------- Crashkernel reservation ------------------------------
  */
 
-#ifdef CONFIG_KEXEC_CORE
-
 /* 16M alignment for crash kernel regions */
 #define CRASH_ALIGN		SZ_16M
 
@@ -469,6 +467,9 @@ static void __init reserve_crashkernel(void)
 	bool high = false;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+		return;
+
 	total_mem = memblock_phys_mem_size();
 
 	/* crashkernel=XM */
@@ -534,11 +535,6 @@ static void __init reserve_crashkernel(void)
 	crashk_res.end   = crash_base + crash_size - 1;
 	insert_resource(&iomem_resource, &crashk_res);
 }
-#else
-static void __init reserve_crashkernel(void)
-{
-}
-#endif
 
 static struct resource standard_io_resources[] = {
 	{ .name = "dma1", .start = 0x00, .end = 0x1f,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
