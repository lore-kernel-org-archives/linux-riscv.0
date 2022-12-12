Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC95FC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqYrhUSjhiVZT9jc7UexhxyuLzNsfje4UWXdL0ZLdyE=; b=uu2FDHAXVAG+qD
	aoo8fZMi3L6QPMsr327pn/OVYDi1noUumKx/8XL3Y4R1bgpnWInM3FBwCRldUEcaL2Fh8vlGK1ws0
	g89RRy3Szo8mHRR0A9EJlUeC+i/P2i4e6RyFH0APDDriqEduD9rUdlzyE6ufQRdrRJDvxjxeF7pLy
	X/HFmVxV22Al0WhRbeLuvzddIGw8qGgPgwYUxya+xoAJN47f+bqm/1EchcN/BxDojvubHdpr8L1Nm
	L9us8HkOayO3UR6GNzdvP0rQBxrsyiisajW3rbZ2kHD7LhdNOZbzEU3hifYhBon8KS9xuIR0adZRh
	csxeGz6YSfkC/xLLeHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dcI-009gIh-IG; Mon, 12 Dec 2022 07:52:50 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dcD-009gBi-Kc
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:52:47 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowAA3PXHC3ZZjcvyeBg--.5294S5;
	Mon, 12 Dec 2022 15:52:42 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 3/3] riscv: mm: support Svnapot in huge vmap
Date: Mon, 12 Dec 2022 15:52:23 +0800
Message-Id: <20221212075223.806705-4-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
References: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3PXHC3ZZjcvyeBg--.5294S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1DZryrWw17KF1xXw4fKrg_yoW5JryDpF
	45Crn7G3yFqryS9rWqyF10van8Xr15uayUJas3JrZ5AwsrJFnxur95Aas0vryUXr95JFy7
	ArZrXFZ3Wwn8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	AKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjfU53kuUUUUU
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwQSDGOWlVPcGQAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_235246_393582_63BBFCE4 
X-CRM114-Status: UNSURE (   7.22  )
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

As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
for Svnapot to support huge vmap about napot size.

It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
can be tested by test_vmalloc with [1] applied, and probe this
module to run fix_size_alloc_test with use_huge true.

[1]https://lore.kernel.org/all/20221212055657.698420-1-panqinglin2020@iscas.ac.cn/

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 48da5371f1e9..58d3e447f191 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -17,6 +17,65 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 	return true;
 }
 
-#endif
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#include <linux/pgtable.h>
 
+#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
+							 u64 pfn, unsigned int max_page_shift)
+{
+	unsigned long map_size = PAGE_SIZE;
+	unsigned long size, order;
+
+	if (!has_svnapot())
+		return map_size;
+
+	for_each_napot_order_rev(order) {
+		if (napot_cont_shift(order) > max_page_shift)
+			continue;
+
+		size = napot_cont_size(order);
+		if (end - addr < size)
+			continue;
+
+		if (!IS_ALIGNED(addr, size))
+			continue;
+
+		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
+			continue;
+
+		map_size = size;
+		break;
+	}
+
+	return map_size;
+}
+
+#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
+static inline int arch_vmap_pte_supported_shift(unsigned long size)
+{
+	int shift = PAGE_SHIFT;
+	unsigned long order;
+
+	if (!has_svnapot())
+		return shift;
+
+	WARN_ON_ONCE(size >= PMD_SIZE);
+
+	for_each_napot_order_rev(order) {
+		if (napot_cont_size(order) > size)
+			continue;
+
+		if (!IS_ALIGNED(size, napot_cont_size(order)))
+			continue;
+
+		shift = napot_cont_shift(order);
+		break;
+	}
+
+	return shift;
+}
+
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
