Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF26DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 02:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vg1kZlJMD/rRn/iIsK/Q7mm2V0XrL5ExIpgpivTA9Gk=; b=0pn2zROFWpeHbq
	87xdz5liJp3T08oVLtlhneca7t2Loxm9IFki8TJVOZyP9Gr/O6nHvxZwGZs+QVIksVnS7SPbxJieJ
	6by+hW4YwgMJsRvdmqQrFzs3M54n/pNM0Y6aCF1bFxY4PEVt8/U53sxDWEVhzZe/yr/0hfk4W9dKb
	RLi58qJdhF/hJF1KG3z3UgTFbmkNtwYs+NGP8/5BiEuhDvPzrHvyTEIaVnOW2tW7m1Utj/K1MWGJM
	8JspHOXhO3HDM1EYNd6HPYUDBcw+tf8ZJItC+L7wzt7V5SwkEppPQW7iGAuADnixNQXYQxEt8nKoV
	jU7pVj51aph+01bPQ1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozU0x-00F5BS-Fg; Mon, 28 Nov 2022 02:36:59 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozU0u-00F59Z-2f
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 02:36:58 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowACnre3FHoRjr0DmAg--.14794S2;
	Mon, 28 Nov 2022 10:36:53 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v1] riscv: mm: call best_map_size many times during linear-mapping
Date: Mon, 28 Nov 2022 10:36:43 +0800
Message-Id: <20221128023643.329091-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnre3FHoRjr0DmAg--.14794S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF15JFWfXr1fGF4xXF48Xrb_yoW8XFyDpr
	4fAF4v9r4rAr4UZFWDAFyUXr15C3Z3Ga47t3yUCa4DuFsrJrnI9r45KFWa9ry5Xrs7Wa1f
	Crs2y3yrua4Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
	YI8I648v4I1lw4CEc2x0rVAKj4xxMxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6E__UUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAw8EDGODbwz0cgABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_183656_506686_E4F99FC0 
X-CRM114-Status: UNSURE (   7.86  )
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

Modify the best_map_size function to give map_size many times instead
of only once, so a memory region can be mapped by both PMD_SIZE and
PAGE_SIZE.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

---
 arch/riscv/mm/init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..1b76d3fe4e26 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -673,10 +673,11 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
 	/* Upgrade to PMD_SIZE mappings whenever possible */
-	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
-		return PAGE_SIZE;
+	base &= PMD_SIZE - 1;
+	if (!base && size >= PMD_SIZE)
+		return PMD_SIZE;
 
-	return PMD_SIZE;
+	return PAGE_SIZE;
 }
 
 #ifdef CONFIG_XIP_KERNEL
@@ -1111,9 +1112,9 @@ static void __init setup_vm_final(void)
 		if (end >= __pa(PAGE_OFFSET) + memory_limit)
 			end = __pa(PAGE_OFFSET) + memory_limit;
 
-		map_size = best_map_size(start, end - start);
 		for (pa = start; pa < end; pa += map_size) {
 			va = (uintptr_t)__va(pa);
+			map_size = best_map_size(pa, end - pa);
 
 			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
 					   pgprot_from_va(va));
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
