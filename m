Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BA4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUBuLVyGvESiCH3m8H604/k+GsgXK5NtQNNaHG8WAWw=; b=tS/FrVxWljt62G
	o8HvRgZP91ai4R/MuLbxANGuVQgN7exd82rP83F7wg+zziXy/yU6KARP4Rog5EyjQ0p27rlbnYQYz
	V/ZI0f5X6dDdgkGzJ7dKL6CBPyugk79FxZmLHFnWQZKDx77tv2s5QMF3VmHRH76O+c+Qipfn19G2k
	12CTOahzZ05dKIVmyS8D59DJOe6WJqVYrJ054eSxQldRFE/WibRI1O7kWu1Eiv7ZXC/lBCb6uvU6f
	rItZSedyLjBYYsKzAi4OLnhVHY93KvcJIokVv25MtUnhCO7TwB0y3iGz71KKND71R/pdyVeNYQ4fP
	C4XB6f0uUWlLMYH/43uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0zg-00EMfx-FD; Fri, 03 Dec 2021 05:20:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0yl-00EM8v-Im; Fri, 03 Dec 2021 05:19:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3AE65B825BE;
 Fri,  3 Dec 2021 05:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A459C53FD3;
 Fri,  3 Dec 2021 05:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508765;
 bh=wV/b0hF7y3zy43Frcbos22daBFox+EfkOXqMxi+aJWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMkaFZ8GXMAQNbOGmHuxHQoTvdk2KZtX181kJkyT1+qqJVFz2rXoy9yU0Gx/NRpGZ
 hxMMSzie86ToVMkXFTuEh51Oc5LCWGtQUAzqr1Z3UoE7It7c4D2MtEdJP9KjNjBfv2
 SVxtubOUKUMje60uOwpOln+WxANdMyeaXurlWODGCX/7SGmn9FiZwznuI7BbaNdBQe
 fTGOTC+xgVzVgHK/hxvlhML2CnsZMUOF64Xlc35T6giVbu+xPTyHJWNBL+gUeObLP6
 r2asA+RbfoKmN/eS4ScAXe9ttlhiOnL3KK/7EBIOSUFtaa+DHeQg3m4/WB1PyoubA7
 U5Zk7U/nNMutA==
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
Subject: [RFC PATCH 3/5] x86/setup: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Date: Fri,  3 Dec 2021 13:11:55 +0800
Message-Id: <20211203051157.2160-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203051157.2160-1-jszhang@kernel.org>
References: <20211203051157.2160-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211927_773856_6FFD1412 
X-CRM114-Status: GOOD (  14.37  )
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
