Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A4CC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 06:24:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C11C64FE8
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 06:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C11C64FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i6lpL1g6PLB1s7mTtKI6ly0NhjVqq4dNE/kDR+Kh5SU=; b=KhvBMMU85NNCqZ0ji7lo9cqchI
	EW5opUp12z5goZtVWttp6OUkMX/TPngwmasNjDNMjPKfODe7kCTOZDtHnRhC/RBtmWuuyB4qDhBo8
	N2KBiSoos3X0zlYXq+DgpSitX1rmlRejKfDkIjpKiAe+ZF3o5/9L2+bCqtG9fHcG0epCzg23EUGAS
	2eP1ud6cY5fSsy/L/6GE2A1FWvmeBekjvDmhzilGlekM/FFPfPYTderjTWVjCLNczi8OUUuGk7Ceh
	mZubEFwvVVEnTJ1ivGqgsfMvi1a5fvDctJCzX4aBPLM8SGRNi6lqbfcbnC/eCSRLL3VRJo6OQN5lG
	9oZ63shQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJsGH-0067mP-K6; Wed, 10 Mar 2021 06:24:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJsFw-0067lm-Ot
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 06:23:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id y67so11408180pfb.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 22:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdObe57su8xWHYEXhsxkrNxyAPh3DbqM32syLxOl1vk=;
 b=NllT/NACDMzFsEk3Hzskh2TZBUFdSBO3iLOfYaXrVQ8Bi8N/F1MRL343M+r02fmowl
 HmVKGM5YA33uWkK09suxlHp6BmenKYSbL8qqQ94tLbIYUWmXVQ/PFzuZPgBVg0wkDutB
 pLDj/8QZ87OBNCKAgWP9fXk6vKcUwuswTDMET+ogV9LIHa6L29LteOIM4xWcs1DHSIJa
 jN9HGGjZNV8lE2gz2+8KZPNcRr5Jb0pT/F2si4wZIAvAFePqM4xebE8FLR5SH0ttCmv9
 VUwojsr8xb5tRi2rtUayc05Wq3A+St9L6zvEQX5vOC+6PFNS2tj53JoTQgi1AYCzB/HD
 9nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdObe57su8xWHYEXhsxkrNxyAPh3DbqM32syLxOl1vk=;
 b=dLaSLbz1kOo/+aKeABLSRTAkWAgcDXdxVnDoUinNEwQdf0nQc8d/k2RSmQFw4cxhJA
 czQl8HrxiYSEM7YM8auuzvw4adIYARdtfm9+NSpbMziaWCvy/w7qJx9WF5GKisraYYXf
 33l3xbTTFHPIUoSDrc39LONEqDhmF9dCcRcbrYluAnKr9bztCpljCOWItOs+Km6s0I9g
 MP0JPCJqN3CnWhBCLwHTDUrQhb7J5bCGEwE/sB22rr5MTjxJbiJP/1T8tNbdZfVioDyF
 izvSY3durYZR09PLZ6GAlNo7cZ/oUQbfaL30XgkiNGYQ+OgIXzbNvvDoOUoV2HqNMEgh
 DQHw==
X-Gm-Message-State: AOAM531ckE3Clo6axtLc+7cAhOyV/IkSJdR01J2aES6Lt1qwQQLb+OE0
 Asz7+wfFFIZoGMJ7+aHaGMbC7GVZYIYf+Vpatt6A1w==
X-Google-Smtp-Source: ABdhPJy8IqbvJ8+yH2KVTgI3FD35hwJPvy7alCO7fbQKvwYfNHQBsbzNtNacjHi/zXD0ZeUFEAhDeQ==
X-Received: by 2002:a05:6a00:16cd:b029:1c9:6f5b:3d8c with SMTP id
 l13-20020a056a0016cdb02901c96f5b3d8cmr1586965pfc.1.1615357413716; 
 Tue, 09 Mar 2021 22:23:33 -0800 (PST)
Received: from localhost.localdomain ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id bb24sm5013795pjb.5.2021.03.09.22.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 22:23:33 -0800 (PST)
From: Jiuyang <liu@jiuyang.me>
To: 
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>, Jiuyang Liu <liu@jiuyang.me>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Insert SFENCE.VMA in function set_pte_at for RISCV
Date: Wed, 10 Mar 2021 06:22:46 +0000
Message-Id: <20210310062250.74583-1-liu@jiuyang.me>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_062343_515579_7BE0D57A 
X-CRM114-Status: GOOD (  14.98  )
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

From: Jiuyang Liu <liu@jiuyang.me>

This patch inserts SFENCE.VMA after modifying PTE based on RISC-V
specification.

arch/riscv/include/asm/pgtable.h:
1. implement pte_user, pte_global and pte_leaf to check correspond
attribute of a pte_t.

2. insert SFENCE.VMA in set_pte_at based on RISC-V Volume 2, Privileged
Spec v. 20190608 page 66 and 67:
If software modifies a non-leaf PTE, it should execute SFENCE.VMA with
rs1=x0. If any PTE along the traversal path had its G bit set, rs2 must
be x0; otherwise, rs2 should be set to the ASID for which the
translation is being modified.
If software modifies a leaf PTE, it should execute SFENCE.VMA with rs1
set to a virtual address within the page. If any PTE along the traversal
path had its G bit set, rs2 must be x0; otherwise, rs2 should be set to
the ASID for which the translation is being modified.

arch/riscv/include/asm/tlbflush.h:
1. implement local_flush_tlb_asid to flush tlb with asid.

Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
---
 arch/riscv/include/asm/pgtable.h  | 28 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/tlbflush.h |  8 ++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ebf817c1bdf4..95f6546ddb5b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -222,6 +222,16 @@ static inline int pte_write(pte_t pte)
 	return pte_val(pte) & _PAGE_WRITE;
 }
 
+static inline int pte_user(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_USER;
+}
+
+static inline int pte_global(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_GLOBAL;
+}
+
 static inline int pte_exec(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_EXEC;
@@ -248,6 +258,11 @@ static inline int pte_special(pte_t pte)
 	return pte_val(pte) & _PAGE_SPECIAL;
 }
 
+static inline int pte_leaf(pte_t pte)
+{
+	return pte_val(pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC);
+}
+
 /* static inline pte_t pte_rdprotect(pte_t pte) */
 
 static inline pte_t pte_wrprotect(pte_t pte)
@@ -358,6 +370,18 @@ static inline void set_pte_at(struct mm_struct *mm,
 		flush_icache_pte(pteval);
 
 	set_pte(ptep, pteval);
+
+	if (pte_present(pteval)) {
+		if (pte_leaf(pteval)) {
+			local_flush_tlb_page(addr);
+		} else {
+			if (pte_global(pteval))
+				local_flush_tlb_all();
+			else
+				local_flush_tlb_asid();
+
+		}
+	}
 }
 
 static inline void pte_clear(struct mm_struct *mm,
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 394cfbccdcd9..4b25f51f163d 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -21,6 +21,14 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
 }
+
+static unsigned long asid;
+static inline void local_flush_tlb_asid(void)
+{
+	asid = csr_read(CSR_SATP) | (SATP_ASID_MASK << SATP_ASID_SHIFT);
+	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
+}
+
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #define local_flush_tlb_page(addr)		do { } while (0)
-- 
2.30.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
