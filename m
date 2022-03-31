Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B01C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hjM44HeqlEHVqG6Y2mxdefiu5TSfVPak6W0x2eOI4Js=; b=0+OKiJpTwfFrsU
	aoYNL0PY/9mwvZIwtLnrCyfBmbgSibrr/WSyriM6Lw9AlkOLqmMWarnZG2BC9xypBAzayeF7atjBM
	en0lkAkLDQJKXyoGU+SSUlkJv/VsE4cQGVngT/4eYpz3ZhDdUTr9dRY4gDNN4OtTOUSzxGqU20pxs
	ZI8Avf3bRUdyNpdbXXxJ0RFY1FNt3Azy46JVxVz82SzdDsVLpGcNbEzyuKoccHFmupKVjCTogj0wU
	rIR7K0vf2n9E+BQSWUnHixUGFxnz6mKibOVI4WNLitdwPmHCyziR9HbykKPuIbG5W+K9ou7rPIgDj
	c/eo5qsLQl+HnYyIWU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnq8-000ngB-OR; Thu, 31 Mar 2022 05:59:24 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnq5-000nen-CF
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648706361; x=1680242361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ed6hy39Lfvz6DiRAwjZW7mlN2JlqATkwXCFG3WQaKZ4=;
 b=P/5oePiq/UYSoN/Z2coQvpbfcBf6o+xwzOvtMwyh3TOHIUaoeaJLgJdx
 kZTJ3kiDiWbiqmL+prYTXgTYi3JF4AnSXUkCrQmg+PbGeVJDbhXySKNaO
 og7SJHVVmyz9AZGz+cqh/JCf68m3ynqGdoxsBtPTUqM7JeLfP5yIfHyS9
 3H/rTZg9d8frbzFcGr9usL9vEld0IbGCaTEh9AOiFitDr/nbLXQJjA+wL
 wNdqeWgqs8jNeA3wWl6CNELiWIqgISOpVtOOLPBaMwMJufumYpouNhHlX
 0bhb/HDDReqKXInWY7blJgomgie2iKCkm4eESOL8wrf0X3nDTWsmb8nHa w==;
X-IronPort-AV: E=Sophos;i="5.90,224,1643644800"; d="scan'208";a="195587869"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2022 13:59:19 +0800
IronPort-SDR: UdHrr/E9JjUIk0XYHavWYag/3Wik1QQISRjuOC3+mgkERIul0y32ta6jU5CmzxbLKCNnF5n7Os
 YnM6mzAR4kV7Iwo8NmzSNcLD5Ak+mlNyQvDGUSi6CATr40CxsPF8XffTpv2z2OXn70iOoe5mqt
 22VhVBH9iTFGhXt8e95WCH1jYe5yKe8513GNffKanbkeb/m/9kRD/iN+QF0hCBteIsmi98Tg0J
 rhnZyfOW+dh8sr6sosOvG4swh10DzOMw53LXTxEzfGnurbtISpsWHle0Kfj0hJsDRcEHDRdzVz
 bUGBdThmxOrNSalr+fjh+xR8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 22:31:00 -0700
IronPort-SDR: jnK6BOXYkVOHuJne/oR3u0QGOV6F9doy8ZtoAgHIWHiZxFBde1PXe1BckjUBMZOIK4bhyw1xUs
 lqx28K86QcquzmPNI/HqNiZu5vZ8QaO0WKIJxsZn+qmpGuPiXjgjYRJDsFYXdgLDJY7PLjPcD0
 EdGflDeDubRN16iRVdLE9ERgm4c4LSgzmuSgN/QwTa95eU4IyVsbWg9K7VR0WUmvlz269vmNYe
 BUGZ/zaAfLWblZMN2QX50YScWXdfDXQZ8gMIB+osT1IUHKn7DaosEomixt5czBcRBt0Bl/vMZD
 bpg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 22:59:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KTXgV1CQHz1SHwl
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 22:59:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1648706357;
 x=1651298358; bh=Ed6hy39Lfvz6DiRAwjZW7mlN2JlqATkwXCFG3WQaKZ4=; b=
 Yc6W+ITI968wp+sBRBtH1tA9Qv3MkNzmw3y0uyMUjG51xjpSaHjjaHd5UgBCo3rT
 JlB3xy2rRPFpNi+/PAI8FSZyqbama6PdcppoF3COdfl6xA5Jq8+VL8JqSBhBKrjL
 1f5Q+C4F0PY9ZMSUhsPAgkJp1vUmj/tnaEDUI/yHoeEjvApqaxQWvY9VoAENYdMA
 zbhhfW4CGvsTJ5Y648+9fN2y2fs4eIrY6nRA2kColsABLLy7g5JwLrd7MmQp2kso
 q5OO5XH5TYcaGRxt8PirIApFvwGPHQe6ykwn69k4TGyNKba96ftktwtJzIF0c6sF
 kNnKTwlb1uzWMC/giDktkQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id GETX2AyZXH9T for <linux-riscv@lists.infradead.org>;
 Wed, 30 Mar 2022 22:59:17 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KTXgM6MWnz1Rvlx;
 Wed, 30 Mar 2022 22:59:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: atishp@rivosinc.com, anup@brainfault.org, guoren@kernel.org,
 alistair23@gmail.com, linux-kernel@vger.kernel.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3] riscv: Ensure only ASIDLEN is used for sfence.vma
Date: Thu, 31 Mar 2022 15:59:06 +1000
Message-Id: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_225921_554762_FFD4951A 
X-CRM114-Status: GOOD (  18.00  )
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

From: Alistair Francis <alistair.francis@wdc.com>

When we set the value of context.id using __new_context() we set both
the asid and the current_version with this return statement in
__new_context():

    return asid | ver;

This means that when local_flush_tlb_all_asid() is called with the asid
specified from context.id we can write the incorrect value.

We get away with this as hardware ignores the extra bits, as the RISC-V
specification states:

"bits SXLEN-1:ASIDMAX of the value held in rs2 are reserved for future
standard use. Until their use is defined by a standard extension, they
should be zeroed by software and ignored by current implementations."

but it is still a bug and worth addressing as we are incorrectly setting
extra bits.

This patch uses asid_mask when calling sfence.vma to ensure the asid is
always the correct len (ASIDLEN). This is similar to what we do in
arch/riscv/mm/context.c.

Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Use helper function
v2:
 - Pass in pre-masked value

 arch/riscv/include/asm/mmu_context.h | 2 ++
 arch/riscv/mm/context.c              | 5 +++++
 arch/riscv/mm/tlbflush.c             | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 7030837adc1a..94e82c9e17eb 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -16,6 +16,8 @@
 void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	struct task_struct *task);
 
+unsigned long get_mm_asid(struct mm_struct *mm);
+
 #define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..14aec5bacbc1 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -302,6 +302,11 @@ static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
 #endif
 }
 
+unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return atomic_long_read(&mm->context.id) & asid_mask;
+}
+
 void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	struct task_struct *task)
 {
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 37ed760d007c..9c89c4951bee 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -42,7 +42,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 	/* check if the tlbflush needs to be sent to other CPUs */
 	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
 	if (static_branch_unlikely(&use_asid_allocator)) {
-		unsigned long asid = atomic_long_read(&mm->context.id);
+		unsigned long asid = get_mm_asid(mm);
 
 		if (broadcast) {
 			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
