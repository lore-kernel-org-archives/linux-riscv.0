Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsiPL8Bviw/AsZNb0wNF5bEV0An/cBPmwBN+BY/gV04=; b=y4JA/hvJSh8Yv5
	TwXWNrNwEjvLpIVz5FBlG/sT4SHwoTCusILdVgtz1StQsf8ZfFAsdgxU9Mv5DG0an5GJQSRZjmZ1u
	C4HWbN7A2GZVhzNtwLyQ2pBfklJ41iJK93dStTCZ+oxwy392gJbpu++gBduza+vKaKZ8k4J3e8u2l
	8bSof+IGcD22sbbaokUeMuGKgjiD0A9s7r/BzMn0U/unCDJ5KMXlp6Gr8oMxBsEmSpVvhrZDsbyiM
	Nm1ibYdBXFnU34l9/0783j1SPlgPLzEXD0vtlOtRYz8HBV/BrKSoc5R4eM/XuoYmoo4vJrAFfBl0a
	Qs38xqmrzIAI0C8WTfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZg6x-00HXSR-3Z; Wed, 30 Mar 2022 21:44:15 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZg6u-00HXS5-44
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 21:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648676651; x=1680212651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lASKdYMSMbpY3YMCgBI+0wvBvlgBA48ZwyFm07zjWLU=;
 b=DqovvpJ+p26ZDpG+BfB5P1/T6Ier+xDDTYINdtQmvR97M0Z3pNSYM0Cp
 sZr+1YrdqAluR95EmP+hh5H2RcZlBHJM+LkFYYZhYZZZho08MZye57hPG
 gWtG5tz2DrJR3jDfdGcTTNhXN3V6Ar7u6QdwB9Hm7PdsLM8sPTIU+QYv4
 0QSZsTOeKOvFw38m6d+JxUsiY2+rBxoUbbSodMa4Tc76i8D1JOEmzkjiW
 Dr6Yuk3PAb1MZcaEa9rCw6EO4jVqxiE2u9kPWtN0fZWwxiUmPJD1s5Pt6
 SQ34AgI8q50bVPluG7/wF2Pqw34M68dS5CixeEmxyQQT1B0sKPJuQFAzo A==;
X-IronPort-AV: E=Sophos;i="5.90,223,1643644800"; d="scan'208";a="308628800"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2022 05:44:09 +0800
IronPort-SDR: ice4yPLlBgbcaqalwjGJnT7dtnfz1vx28cLW0rJV2G/xY9yGEwk0wCUvCnp8qcnPfUpjP55iSQ
 FoNHUm3IqPOOMOkuRr21XHzOiPfGcAFsyGQxMHFeOwcrDNbFROxyYSeVESSE1USYxPkmOZ6Ylm
 mS7M01l9Q/UgRgRaBf7BMkOaoD8IxF8IGcP69zGGiEgANefOujqegNWOh0eW1fJxfNPjUy3iGC
 0JZIvtK4A7HyeCLUzPdhe821D4pF4AqeN2Lom9kSAvwm+W3nZeTNJpnrEx8HuucmQeaw+rKrbo
 kSrtFh8oHCkOAtJXoWiK9k5j
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 14:14:59 -0700
IronPort-SDR: I1F3MxRqT8I9c97iF1pc+O3bymw9M4ADOB1J8tk1DiFben3v1lXxSONzAKlw+YPdeRXJSD2SYR
 b0A1Mr7GlE4YIVpW4EMjSIB0k/XcfSoOZ73XOL3Z9C043W/sQpyPhjZ3vZWZDe8Pug1Wx7LTgo
 fl808eURGnX4uGvkx5aFQUKDEGuDJPG6f3cfP9uBLAF4bEVGvurglhMNUYmDFysVCWY4M0pZIZ
 jcel5+peBv2bsV8ZmSPyx19huNo/2to5oyGOslt16qaS1mLkuWFqy9dgYgdlSsi5qVQieVbrui
 NHs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 14:44:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KTKh84jvFz1SVp2
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 14:44:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1648676647;
 x=1651268648; bh=lASKdYMSMbpY3YMCgBI+0wvBvlgBA48ZwyFm07zjWLU=; b=
 Gl5NzUDnqI0kjNfdRZ04swsSk5BP+Qbor+W1CKvXHkuYtfMz5Sr2Uc+zXsD8/K5X
 wkNbfhFMHxENsUtDUDTpeXpCaOa3QBVQbiqaRHSgPUAvP6JAdqavNTyVXscDSvT5
 5zo6oyUJqiwR9zE9IykUfEA2JqIWpgyYn3HK/v69kjTJ16CbOL5/ec8/3HnTHkOI
 zlZnN6az9FT48zsbBiwWvInIWgf/e9ZwfAEwP9QkDwhUed9eQAcvIu8PQ/DsEHYk
 4MWwaTTZU9E+R0Zg0O/BpnEBAcGfZZi1g/TYvYk/D9ZzKggBy7OFRv9cA882dlhn
 2gBitXSNdzHk0rW1pmLV0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id zwv4hzGhcB1H for <linux-riscv@lists.infradead.org>;
 Wed, 30 Mar 2022 14:44:07 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KTKh31mLtz1Rvlx;
 Wed, 30 Mar 2022 14:44:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, anup@brainfault.org, atishp@rivosinc.com,
 guoren@kernel.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] riscv: Ensure only ASIDLEN is used for sfence.vma
Date: Thu, 31 Mar 2022 07:43:58 +1000
Message-Id: <20220330214358.3409766-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_144412_270440_C7DF0ED2 
X-CRM114-Status: GOOD (  18.45  )
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
 arch/riscv/mm/context.c  | 2 +-
 arch/riscv/mm/tlbflush.c | 2 +-
 include/linux/mm_types.h | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..4329fe54176b 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -22,7 +22,7 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
-static unsigned long asid_mask;
+unsigned long asid_mask;
 
 static atomic_long_t current_version;
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 37ed760d007c..ef701fa83f36 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -42,7 +42,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 	/* check if the tlbflush needs to be sent to other CPUs */
 	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
 	if (static_branch_unlikely(&use_asid_allocator)) {
-		unsigned long asid = atomic_long_read(&mm->context.id);
+		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
 
 		if (broadcast) {
 			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 8834e38c06a4..5fa7cc0af853 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -666,6 +666,8 @@ struct mm_struct {
 
 extern struct mm_struct init_mm;
 
+extern unsigned long asid_mask;
+
 /* Pointer magic because the dynamic array size confuses some compilers. */
 static inline void mm_init_cpumask(struct mm_struct *mm)
 {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
