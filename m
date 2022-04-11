Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF48C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nO+v4BsO4ZnSYB7HzgIZrgcXYg+O+Rl8wo9XJrETKtM=; b=CfMjcYz96BXwuQ
	c5qhdGr8Z6HEtQRhNDpWjzaCHt0vKbqnjo6u71IHS+fkrRWXGupZbExjVPe/z7jEgNUsdqBP+yy6n
	4wmDhb46Iwtb0vzgmrgX4PkQjtSCjXAEjporNRJLYC7Z0eCKxBtp8PZm7S/hfdOIS7rcd+JdEtSF9
	ZiiIWNWKPipEcDCZBXBiDJj06LGwHxP7DHLiJqj7eZxGTeQM8qeEKpXjSVaW3AXKicPYUjB6zb802
	JSFRVuBcpn02B6aneHtO+gY6/KulRlX0uNNZqo7oiN/E7oQVeYRrfoDBK27Ffj2GmACZtsV18kpb7
	ZMP79aaiEWqcxEYBJMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndupo-009L6t-BC; Mon, 11 Apr 2022 14:16:04 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupj-009L4H-UO
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 14:16:02 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
 by APP-05 (Coremail) with SMTP id zQCowAAnxaUUOFRil9sMAQ--.30543S3;
 Mon, 11 Apr 2022 22:15:51 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 1/4] mm: modify pte format for Svnapot
Date: Mon, 11 Apr 2022 22:15:33 +0800
Message-Id: <20220411141536.2461073-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
References: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnxaUUOFRil9sMAQ--.30543S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAFykXw17Gr48uw18WF45KFg_yoWrWr15pr
 ykCF1vyFW3JF1IkFyIgFZ3WrZ8CrsrWasaqrykurWUXa43J34kX345Gr98Jry8XFWvya43
 G395uF15urZxJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
 z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
 kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
 6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
 0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
 c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
 v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUhdb8UUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_071600_386554_4759AE56 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This patch modifies PTE definition for Svnapot, and creates some functions in
pgtable.h to mark a PTE as napot and check if it is a Svnapot PTE.
Until now, only 64KB napot size is supported in draft spec, so some macros
has only 64KB version.

Yours,
Qinglin

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..b86033f67610 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -343,6 +343,13 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config SVNAPOT
+	bool "Svnapot support"
+	default n
+	help
+	  Select if your CPU supports Svnapot and you want to enable it when
+	  kernel is booting.
+
 endmenu
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index a6b0c89824c2..b37934c60c4d 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -35,6 +35,37 @@
 
 #define _PAGE_PFN_SHIFT 10
 
+#ifdef CONFIG_SVNAPOT
+#define _PAGE_RESERVE_0_SHIFT 54
+#define _PAGE_RESERVE_1_SHIFT 55
+#define _PAGE_RESERVE_2_SHIFT 56
+#define _PAGE_RESERVE_3_SHIFT 57
+#define _PAGE_RESERVE_4_SHIFT 58
+#define _PAGE_RESERVE_5_SHIFT 59
+#define _PAGE_RESERVE_6_SHIFT 60
+#define _PAGE_RESERVE_7_SHIFT 61
+#define _PAGE_RESERVE_8_SHIFT 62
+#define _PAGE_NAPOT_SHIFT 63
+#define _PAGE_RESERVE_0 (1UL << 54)
+#define _PAGE_RESERVE_1 (1UL << 55)
+#define _PAGE_RESERVE_2 (1UL << 56)
+#define _PAGE_RESERVE_3 (1UL << 57)
+#define _PAGE_RESERVE_4 (1UL << 58)
+#define _PAGE_RESERVE_5 (1UL << 59)
+#define _PAGE_RESERVE_6 (1UL << 60)
+#define _PAGE_RESERVE_7 (1UL << 61)
+#define _PAGE_RESERVE_8 (1UL << 62)
+#define _PAGE_PFN_MASK (_PAGE_RESERVE_0 - (1UL << _PAGE_PFN_SHIFT))
+/* now Svnapot only supports 64KB*/
+#define NAPOT_CONT64KB_ORDER 4UL
+#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
+#define NAPOT_CONT64KB_SIZE (1UL << NAPOT_CONT64KB_SHIFT)
+#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1)
+#define NAPOT_64KB_PTE_NUM (1UL << NAPOT_CONT64KB_ORDER)
+#define _PAGE_NAPOT      (1UL << _PAGE_NAPOT_SHIFT)
+#define NAPOT_64KB_MASK (7UL << _PAGE_PFN_SHIFT)
+#endif /*CONFIG_SVNAPOT*/
+
 /* Set of bits to preserve across pte_modify() */
 #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
 					  _PAGE_WRITE | _PAGE_EXEC |	\
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 046b44225623..f72cdb64f427 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -279,11 +279,39 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+#ifdef CONFIG_SVNAPOT
+/* Yields the page frame number (PFN) of a page table entry */
+static inline unsigned long pte_pfn(pte_t pte)
+{
+	unsigned long val  = pte_val(pte);
+	unsigned long is_napot = val >> _PAGE_NAPOT_SHIFT;
+	unsigned long pfn_field = (val & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
+	unsigned long res = (pfn_field - is_napot) & pfn_field;
+	return res;
+}
+
+static inline unsigned long pte_napot(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_NAPOT;
+}
+
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	unsigned long napot_bits = (1UL << (order - 1)) << _PAGE_PFN_SHIFT;
+	unsigned long lower_prot =
+		pte_val(pte) & ((1UL << _PAGE_PFN_SHIFT) - 1UL);
+	unsigned long upper_prot = (pte_val(pte) >> _PAGE_PFN_SHIFT)
+				   << _PAGE_PFN_SHIFT;
+
+	return __pte(upper_prot | napot_bits | lower_prot | _PAGE_NAPOT);
+}
+#else /* CONFIG_SVNAPOT */
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
 	return (pte_val(pte) >> _PAGE_PFN_SHIFT);
 }
+#endif /* CONFIG_SVNAPOT */
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
