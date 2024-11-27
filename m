Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC03D3B9BD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 04:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2AumwwAWro0kcBBNlf1mvgoNEYuLthsPUymOQmIulvk=; b=EhkdvYyhtW3a9Z
	rwcNBOcQn2mlOfhxIhsec8oVIjL+PCRKGXQDb7+YvBedc8qWwyazlxKKSq8k7Vyafn6vIpwm/kzbt
	NvZGZQgUsbWR7CwrMlKPJlE8LkcSRZxCztVMuXp7xwdBwYbp10w+Z151Bu24+qkIMKsH8L8EU/zcR
	VY7J3uXqjJ5fpZCOO1ICHPCnPktNxUpcLdvXDrPwsWWGRfpOjTsggiAc8P8306IJUZoMvn6XUk6AQ
	9JsTJzOu05uWm9bPItcZkGjyVBriYJ3/fMaeKrhm9wPmRFIHNN4phkfoo2gy83v9v0DUlOkzL4tmv
	O5IOq3QKGxEPWka2xw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG9WO-0000000CCXc-0IlN;
	Wed, 27 Nov 2024 04:19:24 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG9WE-0000000CCWV-1rDi
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 04:19:22 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4668f208f5fso22761311cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Nov 2024 20:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1732681152; x=1733285952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tt1leaem3mz3QmZC2yXTniNimft1CZJGwpCrG5JBK8=;
        b=Oa6zzq57eKFGPtJjWbZN9mKFZHZbEjOg1cP6xVpmFR6DrhpanN9iFLBRgKd2N8gZWF
         o52VRZeZ+Juea6iqJyTKz3DNVWvEuw37uvAg1II3rDsoiOwSy5+Ay05C8EHJR99yWXKl
         Hz0tnInP3nrGXClhN+JksI/kaIM4dFL31unJQaqw7mtiKRVZerIhB2DTM6lqHB+oIglw
         mtO3cMQQKOrjdo3EHsGmR/f6dX+Qm4guOSF6+4JSwjliTIsVyIEc82nGF52wI4fo0bKZ
         bkP0P1FLnjw2BGotPWKZcVS2byiqJjEb/1FgsTL5mujX6I9rriDFjchm4i7a8Kmf1edx
         XweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732681152; x=1733285952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Tt1leaem3mz3QmZC2yXTniNimft1CZJGwpCrG5JBK8=;
        b=nUUhoIsTdigZCFdsxPQdgGV29R1VMf99uuhG2Htet7NjV59h5M6TBdNsAxpQ0VvM2e
         0Ib+rMhD5vT9lCqXpZz+FjpYFQRCg306hgbn1yvZFkF6fhj8QnxHFT2RVFO6TzcPsMx2
         4KYLp5KsavgzwPjCSz/2ZmqGavHnBBptZdkc+CyIvrGLDFaJ8PmkXKTCqCSXdJ23YFu8
         x4IggbYGacviYH30vodvpePrk3W7TLJz3WpzYyiPR7mh8BQUfD7+Ahu3Tt/l2yu1WuP0
         Q0xlvpbzRAIG8MYj5aFqPRIjEBx+SBJXfSji6TzMJVldpkU18NZBO6/FwgGGQPNMp1Jq
         23kg==
X-Gm-Message-State: AOJu0YzdGqhQib93VpDRhf7R+nEg6ro0bE70RGrJVHCI14gi+aR95XIi
	SNZ42A2AtMPArD1Ba15XwUAEeh3b1gbPx7I9rDOlTjvb8PIHvQ8DPUga8/tMTGE=
X-Gm-Gg: ASbGnct/dJmZpUik0zHj45EeukdCNCn5g1ANrbcre7ZmeGeNLoym+6BIlM+1kWlpLgL
	asbvLAScuPskS31H+6sKntKJ2syMVLFcwP0uM1Vt+4xwgz/odvcgalorVqpPy7qrD5iIOHl159G
	VfEZehhLJBs5OTlhiVuualV0C0Dp4wkGtzVuKS4Y/yE6zyisZ9GQu61aYiL45tvffBM/G3uY/aj
	zOXKS4O46L27sXwi7IpyYC1l5qE/fM6pjlKyVlvkFLVjbWFEdUobRpNPWJs212iXjqnKO/hvUjl
	A6tkD2H0m0E=
X-Google-Smtp-Source: AGHT+IEHTvBwB42AwIqrSvDAbOMDOy0yxARjmSfCWjSbkpjqTy+QnksS68XX9Kua0cTU+H7n63kYmw==
X-Received: by 2002:ac8:7dd1:0:b0:466:b1bc:2026 with SMTP id d75a77b69052e-466b32d949bmr26935351cf.0.1732681151929;
        Tue, 26 Nov 2024 20:19:11 -0800 (PST)
Received: from ird-aus2.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c48fd02sm66570971cf.81.2024.11.26.20.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:19:11 -0800 (PST)
From: Michael Neuling <michaelneuling@tenstorrent.com>
To: anup@brainfault.org
Cc: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mikey@neuling.org,
	atishp@rivosinc.com,
	Michael Neuling <michaelneuling@tenstorrent.com>
Subject: [PATCH v2] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
Date: Wed, 27 Nov 2024 04:18:40 +0000
Message-Id: <20241127041840.419940-1-michaelneuling@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_201920_937956_9CFB1DED 
X-CRM114-Status: UNSURE (   9.38  )
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

This doesn't cause a problem currently as HVIEN isn't used elsewhere
yet. Found by inspection.

Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
v2:
  Added Fixes tag
  Added Reviews
  No code change
---
 arch/riscv/kvm/aia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 2967d305c4..9f3b527596 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -552,7 +552,7 @@ void kvm_riscv_aia_enable(void)
 	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
 	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
 	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
-		csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
+		csr_set(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 }
 
 void kvm_riscv_aia_disable(void)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
