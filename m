Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32021C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bwxpavh6c87uSAWM04Cnfgx1UScCQtSHOAVihVpupnA=; b=1Aha/EG6KTeeRu
	52NRIS/32voLY3l6Cb16GHnMebyDIRhG+3LnvFr7xHCiT6yzTIncwYT5YFFln77FSEuGp3KGTxMmA
	GKlbUUPB9BhAB7WTKOx4yp+sHDBWDi22OWmZ1kC9DEpfIqo4EvsHBdoQeqQaQ+NcTQg9QKR+ehIOu
	gxeh/QoEWLkCL+W/YMOhpv5zpHTPscqbknKY3T1GdAGVolRWKaVbr3rdHmoQNvVvR15+pyCe0wKCv
	hSNKg8Z26/SlZvgngof6IDpniHGyzKbctS0LuLH8vS7WAeFkVlnbD2m+/3LUbvh2pT0UYoMNxLnLq
	nygxCOjQZhIO8ibK3WpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYr-00AsgK-2z;
	Mon, 25 Dec 2023 13:00:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYn-00Asbw-0T
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 13:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E706860C55;
	Mon, 25 Dec 2023 12:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCC1C433C8;
	Mon, 25 Dec 2023 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703509195;
	bh=oQr4wuMlEBWYxpaVbDZM0YUteF5WonWqf5vY5cQvc88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJTNsleJ/F9oBTs4gL7/Zk38ee+5vDE/bYOTwPr0JtYhW4QSxNI2Pn0dqn1l3Z/hP
	 47cT03H9LiKUD/fTnGxtz4G3an6tSqHhnSoORwyb4pl46iA/OAe2J++WBEm5X4ighK
	 icXm6IXo/LkkqAPiHuGRDXNFPAecsDKaeqvEZJmz50J9M/AWIGs0iLYQafmgY9nasl
	 esVXXomXaQc36WywqFMNqKdTX/bNO5zQBmXzDWvuAEaVOtk3LLsrFEyPnVa2zoOu6p
	 xm+TQzhc2GFNjG8Ape4hWPCMo3alw/szyUPCQsLrBFsPX4SWrmotqtPUuX/a8LmbA1
	 v5PU1YhDHV4FQ==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	anup@brainfault.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 11/14] RISC-V: paravirt: pvqspinlock: Add SBI implementation
Date: Mon, 25 Dec 2023 07:58:44 -0500
Message-Id: <20231225125847.2778638-12-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231225125847.2778638-1-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_045957_247961_93826F56 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

From: Guo Ren <guoren@linux.alibaba.com>

Implement pv_kick with SBI guest implementation, and add
SBI_EXT_PVLOCK extension detection. The backend part is
in the KVM pvqspinlock patch.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/sbi.h           | 6 ++++++
 arch/riscv/kernel/qspinlock_paravirt.c | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 8f748d9e1b85..318b3dd92958 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -31,6 +31,7 @@ enum sbi_ext_id {
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
+	SBI_EXT_PVLOCK = 0xAB0401,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -250,6 +251,11 @@ enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
 };
 
+/* kick cpu out of wfi */
+enum sbi_ext_pvlock_fid {
+	SBI_EXT_PVLOCK_KICK_CPU = 0,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index 85ff5a3ec234..7d1b99412222 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -11,6 +11,8 @@
 
 void pv_kick(int cpu)
 {
+	sbi_ecall(SBI_EXT_PVLOCK, SBI_EXT_PVLOCK_KICK_CPU,
+		  cpuid_to_hartid_map(cpu), 0, 0, 0, 0, 0);
 	return;
 }
 
@@ -25,7 +27,7 @@ void pv_wait(u8 *ptr, u8 val)
 	if (READ_ONCE(*ptr) != val)
 		goto out;
 
-	/* wait_for_interrupt(); */
+	wait_for_interrupt();
 out:
 	local_irq_restore(flags);
 }
@@ -49,6 +51,9 @@ void __init pv_qspinlock_init(void)
 	if(sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)
 		return;
 
+	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
+		return;
+
 	pr_info("PV qspinlocks enabled\n");
 	__pv_init_lock_hash();
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
