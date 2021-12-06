Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FC4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfLOvpSA3iK/cdLDR+6tg5gbUS6l55+2FKo9uiDAn54=; b=XNSPyIGE/D0Uxt
	soxnQB+uogqItS0tDX7IfmbrcDX8m7HcmgICYZ7naXR/r426ScbMANzrfrnmGp6VhY4AKffa/fmHc
	RbBi4Llwg9rbsJukUHBm4tSDanSRzGrRHYnG5SHNcuIkxHZ+nVU8AtrB0OLZ+yHR7unUwik3uTE/G
	3UIMR1lpt8lQH8F5qA5W3Y4rcBB9aHwc7wcl6Gto8XTZXCPMYKxVhdbkw64SA4jxsQXGkEF5IU1N2
	KTC0s6sKTryh4+j+IRxzsoQK7ItG3zFxjTLs8dHqIoUXXCO/bsaJtRd1cwXiutDUSGXTDc38trq9q
	LoGknXVMRTRsp0zHvtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGeI-004iSa-3g; Mon, 06 Dec 2021 16:15:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGbl-004glv-HC; Mon, 06 Dec 2021 16:12:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 104556136C;
 Mon,  6 Dec 2021 16:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249D9C341C7;
 Mon,  6 Dec 2021 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807172;
 bh=nFeA2Qnp7UpOzQ0dau1zsG4iKPtStOZhLFNfY+mSumQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pAwQXGdBEvOm6ZN3gwfqPK6br2O3B9Ib/1/EbGm9JfzdYM0Ba/zv4exD8jKUbSlOj
 myC78FFF23d1uPKiVsyNgVlbvFf5C4e7woqojZGT1qYOb17gF+hv3GkKEN5fh6RpXp
 CwXon9C1oMNdlNYt6yoaqeBeavXtUnSGJOxnurGSF1z4gK/XzWAgFfO5LWZXM1zC5q
 6PB1n8Kf2Cw7qlzXABWdVA2AssXh6sit9AIqVeJ4yZ0Mz+/dIDI8d9b9YAA+3B+/I/
 96VjJf9+TOWE0ACGGhnxCCfAPmXkM0dXsEVERViO0FykMRTw8JmSMalterEYLocQ1B
 h5pnfFxz4sZRw==
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
 Alexandre ghiti <alex@ghiti.fr>, Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2 5/5] arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of
 #ifdef
Date: Tue,  7 Dec 2021 00:05:14 +0800
Message-Id: <20211206160514.2000-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206160514.2000-1-jszhang@kernel.org>
References: <20211206160514.2000-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_081253_644060_5B46856D 
X-CRM114-Status: GOOD (  12.39  )
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
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 284a80c0b6e1..f9a054a344c0 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -973,7 +973,6 @@ static int __init init_machine_late(void)
 }
 late_initcall(init_machine_late);
 
-#ifdef CONFIG_KEXEC
 /*
  * The crash region must be aligned to 128MB to avoid
  * zImage relocating below the reserved region.
@@ -1001,6 +1000,9 @@ static void __init reserve_crashkernel(void)
 	unsigned long long total_mem;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+		return;
+
 	total_mem = get_total_mem();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base);
@@ -1056,9 +1058,6 @@ static void __init reserve_crashkernel(void)
 		insert_resource(&iomem_resource, &crashk_boot_res);
 	}
 }
-#else
-static inline void reserve_crashkernel(void) {}
-#endif /* CONFIG_KEXEC */
 
 void __init hyp_mode_check(void)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
