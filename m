Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A8BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tX3+CPNth9TTvhSX83cqKam5NwtlXcvmIwf6GI8C18=; b=rwyNSQBgMKTZxW
	XGdqcHFeuRn8VhkQmgqpykCZOTsGkcf1Ib3DGD47nvcnjnfBH8P6+9S4ef7UA6OOK+a8mFxB4XUi7
	nx6L6GTCCuDl+Rt4dbjoOoWDmdgk0iB30w5S6Y0JILAwhiiB9GZu0mye2DWl7rQVTI4hJoa7ARdyG
	EScnFYEQkfPm1/1PxuhY23iiWQRvCiB2OnZd5+52JIyCs2I3Md8l9df2RV2k1oSHCzyAohDjC1hlP
	rrXy2KY4S7ddPSoe5wfQ2NehEQieUoEKNX/b/682+EgLovWcQoTewSH1b3YDpb3fYh4RIpXjI8Fn3
	T2W2/fOmu4B1lHVRcwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlgm-0000000DPYg-0z02;
	Tue, 14 Jul 2026 22:33:20 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlgj-0000000DPYJ-3RyM
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 22:33:18 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-664c6304683so1514014d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784068396; x=1784673196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YX/e2y6lHS+kDRmAFlX9c4rfDe87oNHdseMQt4gGJI=;
        b=Csf4FQtQ3i+rUR8uKygMVrONRcqyg1F9cWMkj4TJNnLO9+GQrni8wHXF7lWddvm0gq
         8KsynMtCw1hHTW7bsXXQdhASdFdoJcI2FQwq0vBfBYAOaeYjL2x+uoMnHg3/oeW4/RdV
         WFzx9Yl1thoRoduSai/5R3oWtJ/jODCaCg67E5Pp3ZdIGwsD+kysphAZHkHQHBdofVUO
         9m7NgmlD5QauV78aWPOA0wH3i6f82fcH38Qdk7oUmXE/H0ePQ3OIR57p5qSNCz10csXB
         g1AnOyQR+48IsBxgrzLCN5jNzFlNZ7bDt2j/+PFwO3Fd3LN7ILn49WeKUS3pftuaWtjB
         HftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784068396; x=1784673196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YX/e2y6lHS+kDRmAFlX9c4rfDe87oNHdseMQt4gGJI=;
        b=SpkLvykIuQ+R1VTWttL67llcG6oH7lWxC8z/gUcFxFk7+Ho9oPFsTzw2xB7JZq3b7V
         4O5kFVaYH2QLNejqr8rZswMK84zV+MzZcEO7EBa+kuy5zwuPzfMAHgLgig2juhHAEKyN
         HSaInG8ctvzgwfignNSYav/ZMcRkndGwc72v+GdX9NmrMZG+0Yr57Kz1j56pKU3tsfV8
         gl25iZ4juXtMz6wBiN3TlZTlNCXB8KbmwrYmzE2Dp8ile+wftcr77OXec04shpJTJOTD
         bgWJ63ugb1zP+ZvmC01mwOIIjrs2b2ODVhJ938Rmvtlr928yyN1gcXsCYizjQ3mAFv7D
         R7kw==
X-Gm-Message-State: AOJu0YxKna025pTccBKt0n0prCLaG0ZGkibe1wce+zu1OJHDnd8/3i0J
	Q9jkp1Kb4Hb/faNIzpow0JgeX0pmTQ3F7iosaVkaWUQ89VZEOVokNUcPA6MlMHMR
X-Gm-Gg: AfdE7ckl+V149s2KhwhboVwdZIg6LI951p+zuWofDBkmZOHXr5trMScnRTrNf22cHWU
	1rlQeB8h6HMJop/F9PiGvjh69rjVZL7iEXOZuRAkKpdWVh8LhBQQxBHHCiqjDNWQ4EmEZ4HvkA3
	j+xnf7bJMUR4eLSvNiWur6pOpp2oz5vS2tXnFXuvTbnbc7YDgC3ZipaR/ItRlAOtRP9eUwJydgB
	c1cQmzGdoJwE0g4vuZyKKpKzpPspDLpJaSYBqQukVVMWwdwCfmsDzvcvRr/+3paRHNJ+19KJkOn
	P1KJABTAaRypd6MGHRggx83TFdl+EwIC+9rv7MdyCmz9zUTmLdZLWfW3A6jHzymPVhKDmGV5fPH
	rGpBxDD01YYT512YWbbMvvSQukpnO7OFZb0Z84duUepSwZTRDMyDcc0e38zmfxw4lMmyTBrP0Fm
	MkdmV4NYHZDmVcfN9AMrDoDaCRmr1JzM7X8Uza+2HV2kGXDWPuXSActNrPAA3hbu3zygZalcqW7
	yG7
X-Received: by 2002:a05:690c:3603:b0:80c:85e5:873b with SMTP id 00721157ae682-81e9017294dmr119016137b3.57.1784068396137;
        Tue, 14 Jul 2026 15:33:16 -0700 (PDT)
Received: from localhost.localdomain ([107.198.84.185])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf82412sm154677207b3.21.2026.07.14.15.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:33:14 -0700 (PDT)
From: Paul Sherman <shermanpauldylan@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	Paul Sherman <shermanpauldylan@gmail.com>
Subject: [PATCH v2] riscv: smp: set CPU 0 possible in setup_smp()
Date: Tue, 14 Jul 2026 15:33:01 -0700
Message-ID: <20260714223301.5265-1-shermanpauldylan@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_153317_866576_CD5D5D0C 
X-CRM114-Status: UNSURE (   9.74  )
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

setup_smp() calls set_cpu_possible() for CPUs 1..nr_cpu_ids-1 but
never for CPU 0 (the boot CPU). x86 handles this via
init_cpu_possible(cpumask_of(0)); RISC-V has no equivalent.

Without CPU 0 in cpu_possible_mask, rcu_init_one()'s
for_each_possible_cpu() loop skips it, leaving rdp->mynode=NULL.
rcutree_prepare_cpu() then dereferences NULL and hangs.

Exposed on Sophgo SG2042 (64-hart, 4-NUMA) with Linux 7.2-rc3.

Fixes: a4166aec1130 ("riscv: Deduplicate code in setup_smp()")
Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
---
 arch/riscv/kernel/smpboot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f6ef57930b50..8d3a437c0f30 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -171,6 +171,15 @@ void __init setup_smp(void)
 	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++)
 		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
 			set_cpu_possible(cpuid, true);
+
+	/*
+	 * Boot CPU (cpuid=0) is never set possible by the loop above.
+	 * x86 and arm64 call init_cpu_possible(cpumask_of(0)) explicitly;
+	 * RISC-V was missing this. Without it, rcu_init_one()'s
+	 * for_each_possible_cpu loop skips CPU 0, leaving rdp->mynode=NULL,
+	 * causing rcutree_prepare_cpu() to dereference NULL and hang.
+	 */
+	set_cpu_possible(0, true);
 }
 
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
