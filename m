Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DFDC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 03:50:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 689D165082
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 03:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 689D165082
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MSrMRCky1Ws0I0CxXLIkbrJGq9mdKdcI3V1G6L5xE5U=; b=JWuD9RSnkjBeXylsm+h/9MFkC
	qqdm+w8Ga8NS33e0Vf9eLbind4T2Xa4yQ+WePwK9S37sIAMyn+x5iZa9WTmSo7dxtZUZbNvlGYBVv
	DOwg3Rly91YUXAme9brG/bx0TaCZc+/lWvQs8tz8Opjzibe83kbQIjEjAI3HfhDcn94P/mS1VV1IH
	3shzoD+BeTC8v/GfDYPFICBX1yd9ReJs85HizuUN0KRa6k4gJtpxbjWuu30MWbdR0UvL/JiP8GPK6
	HIHD4o1M58xX+SZ5jTfcms35HZb/BnfRmtIb8ze8pwPps3qwEx4w2NOfmJ3hbarpDkzXDAY/Q28n5
	UqxH+Gw6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM0jA-00HLvD-9D; Tue, 16 Mar 2021 03:50:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM0j3-00HLue-Aa
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 03:50:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id z5so16325475plg.3
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 20:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e2lFb3NlHRv7hqARNNWsy6IMEcW9PVZ0/ldwfddpDSQ=;
 b=jg51Lw8jX8BJFhOiGXWD0ErK9oIl+rvbVi/MpDdPX8ZBjpsksZ1tWiMOCt7KeUGEIK
 HUbY83E5Ll8FCnwtYHFHg5IAsUrwkdHRQD6ow2bh8BJbuwUHJTdlenKOaO4P7i+CyEuA
 YVQQdp/AMNP+BV6AWOOyLdGDe+cYimWfgOWw0fnLI28oZveAj3TuoYdo1boMZR+6No7G
 m2/GnVGi6H2Jxs8DYPu0MUwWXkVml+SLT9B/Lx8DpCe9D9MkmMXOW1Kp9uGYN2KPDdMY
 R1kbs7b7/uS0w9n2dztm4nCavl7PLGjvPPtfo7OPbcZ6HiTdbQd4yW+Oo1FZidLrfy6M
 bHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e2lFb3NlHRv7hqARNNWsy6IMEcW9PVZ0/ldwfddpDSQ=;
 b=kTZSIgMNs2+4Hg1WIFjpdook4wX6w6Tiu3grzvSFmSEEsndnC32NRtZb/Ru2g0axiV
 oLjJ0PD3eviS0VxRiixzlbH/aYeo3D6pxzD91JTyzbiCS7KQVr5G4vr4kRVMIa0bEHiV
 i3Wl6J38axHQByiH37wv9TFhItYIC08c+MNlNGYWH1Y1kqiFB20S6UBItRL1kxI/9w9Q
 RtP/kbf4VWkLA7JJu4rdYW2m082moSs8bEbbh7XK2/vCBm2QGBE111OzJUC2WBINRqcg
 Lt2ZHhBgJmqBisu1O7gd8O9otY5C9a+iJ6wiBg3cbwtTjEwn6ROqKgiPaivrx63Nnb0a
 vM+Q==
X-Gm-Message-State: AOAM5339BCwixTcUWFsAcAYQR6XqJ70Z+vhx6aB8MWb3SNhdpZ0vcxGn
 lHFUBHRRAEcQtgWNI8xDite+3w==
X-Google-Smtp-Source: ABdhPJyXkQwYpNmJRSj8fa6IZGSK0bVZdkNEbEw3wc7gJTjdHz9Kmavfup39JIG87l9kAONH+xny/Q==
X-Received: by 2002:a17:90a:598e:: with SMTP id
 l14mr2467137pji.187.1615866631767; 
 Mon, 15 Mar 2021 20:50:31 -0700 (PDT)
Received: from localhost.localdomain ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id s19sm14522122pfh.168.2021.03.15.20.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:50:31 -0700 (PDT)
From: Jiuyang Liu <liu@jiuyang.me>
To: 
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>, Jiuyang Liu <liu@jiuyang.me>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Zong Li <zong.li@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Insert SFENCE.VMA in function set_pte_at for RISCV
Date: Tue, 16 Mar 2021 03:46:36 +0000
Message-Id: <20210316034638.16276-1-liu@jiuyang.me>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316015328.13516-1-liu@jiuyang.me>
References: <20210316015328.13516-1-liu@jiuyang.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_035035_123877_D7CD726D 
X-CRM114-Status: GOOD (  14.09  )
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
1. implement get_current_asid to get current program asid.
2. implement local_flush_tlb_asid to flush tlb with asid.

Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
---
 arch/riscv/include/asm/pgtable.h  | 27 +++++++++++++++++++++++++++
 arch/riscv/include/asm/tlbflush.h | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ebf817c1bdf4..5a47c60372c1 100644
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
@@ -358,6 +373,18 @@ static inline void set_pte_at(struct mm_struct *mm,
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
index 394cfbccdcd9..1f9b62b3670b 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -21,6 +21,18 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
 }
+
+static inline unsigned long get_current_asid(void)
+{
+	return (csr_read(CSR_SATP) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
+}
+
+static inline void local_flush_tlb_asid(void)
+{
+	unsigned long asid = get_current_asid();
+	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
+}
+
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #define local_flush_tlb_page(addr)		do { } while (0)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
