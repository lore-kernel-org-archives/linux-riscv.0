Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D26C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 08:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751AD2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 08:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRwvshgD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDx1gCEX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751AD2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=65bUJOq3yIXi0+8uVBqmTrbR5fbL0avKT+3xsTDksbQ=; b=XRw
	vshgDhAWnUxGYRUj5efVayAcj/0hMHhH1nHI2JnAmnwOqd39Qj7g7Y8wI5YA+HuKKy716fbGGdwi4
	c3hKbG+Q7np+Ezmm0k8iD7+rTh7BIzbNwP1vpwOkU9MyUAEvU8yvh8r/PERzt2dp73K/uS1MjM/pT
	13cZzVXVfNoj0Yq5OmE4GJIuN21/+5VmADFS65zG6r2DV0jV+q1iiO6msRdICYvpz+qdhyzCCrXb6
	0KwbL35DRegC7KeLpkKc9hHWCxsquc9zCrREESqYSlaDh+SkZnaT8aNyjNfiiqgq/3DGDNSaZ4oLU
	mp6u8wjiXV2BWSEJ7r3OctP3/sdvV4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSdyK-0001Hf-3f; Mon, 20 May 2019 08:48:40 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSdyG-0001HK-OZ
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 08:48:38 +0000
Received: by mail-pg1-x541.google.com with SMTP id j26so6466242pgl.5
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1Kso84SkTkupRChP8154ljK2kuS/JHFmzU6FU5s8j9g=;
 b=JDx1gCEXhT3VKTIVqoAa24q9fF+quu9opnTV6mfjVlAe5Pz3AqGGRqhYB8IQsoAdke
 9fLRab8XsQTu/6POYvGIlkCmDGY63w1xO8PCYFlOx8ubVDscTLgVis/Qh7HeAsygX90V
 8UL8s+15FUr+KbTLerYz/bcak+GSzYUEYVCnzb44SPmlp++YgjKSk9IaHxJVn3tbG+TY
 EJs4Tzfs54oa+aHDC+rfFY6FDGk2iDfMtTLSdRWB7tVziYtrSQ1h3FEtUw1i+oQwd8L8
 oMG5oaEdyM9p9cQQreEd2gquUyMQJMFTohygQGeiVlhEQzEheofgO+ZGTuig+d2NP9QQ
 t9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1Kso84SkTkupRChP8154ljK2kuS/JHFmzU6FU5s8j9g=;
 b=gGhZeVrmq9h6Ax4b/IDxa8vPKKURNSjgwUFQx9C4dgVtTaNCIe7ECzcQangbSftnsf
 AwXP9usTcG3KJ+vaJ379oKSJ7Ux1RxwWeW4CxJdUyY2dtW7or2kN9qtBeqlg52PoDO0x
 HfIRbN4p/1zvr0tC1uReeDLzxHbbvSofANXuUcZ60BH68yKK6Cm91wunIdHPF1gWV5jr
 C1Geqgf0vg5BzecK1Qdc5tRwwqlfPYhnBJHHFgCLLmitvYylFjn2symZE2LEGzPAs+iL
 GwbMyfVFJfjDk6+js/TYlLXkTTMq1CiPvPR9UFdG59plslKEbvhEAnAXnT03ecDgzG7E
 inFQ==
X-Gm-Message-State: APjAAAUl5jv4xu9hm9wH1ERMCzHpdgRK/x/ZYAAu+JrwHYt95tHFrM69
 UyTtGNcfIInkc1CF08xbfe6Mj2cQ0GBSLFpBh34lFzyq
X-Google-Smtp-Source: APXvYqxW2DtcsfVEayupBuQekUyz6NsQsd7PfpjXf4Z7Iqfy+/x6qfcHWV6N1RqYM5+UuBIbw9i4xh2pCTNAPeKCQzc=
X-Received: by 2002:a63:117:: with SMTP id 23mr73244586pgb.34.1558342115787;
 Mon, 20 May 2019 01:48:35 -0700 (PDT)
MIME-Version: 1.0
From: JaeJoon Jung <rgbi3307@gmail.com>
Date: Mon, 20 May 2019 17:48:24 +0900
Message-ID: <CAHOvCC7EtFcYQDAQoenP7RdwW-4FQEex4FG5jLR2W0m+Q8t__Q@mail.gmail.com>
Subject: [PATCH] riscv: using page table index in setup_vm()
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_014836_795895_7C51EDB4 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: JaeJoon Jung <rgbi3307@gmail.com>

The page table index macro are defined already in pgtable.h as below:
///arch/riscv/include/asm/pgtable.h
#define pgd_index(addr)     (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
#define pte_index(addr)     (((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
///arch/riscv/include/asm/pgtable-64.h
#define pmd_index(addr)     (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))

But, In the arch/riscv/mm/init.c,
I found that it does not use above macro in setup_vm().
I wat to use this macro in setup_vm() as below:


Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: linux-riscv@lists.infradead.org


diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bc7b77e34d09..785954b776ac 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c

 asmlinkage void __init setup_vm(void)
 {
        extern char _start;
@@ -223,13 +190,13 @@ asmlinkage void __init setup_vm(void)
        BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);

 #ifndef __PAGETABLE_PMD_FOLDED
-       trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+       trampoline_pg_dir[pgd_index(PAGE_OFFSET)] =
                pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
                        __pgprot(_PAGE_TABLE));
        trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);

        for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-               size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+               size_t o = pgd_index(PAGE_OFFSET) + i;

                swapper_pg_dir[o] =
                        pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
@@ -238,24 +205,23 @@ asmlinkage void __init setup_vm(void)
        for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
                swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);

-       swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+       swapper_pg_dir[pgd_index(FIXADDR_START)] =
                pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
                                __pgprot(_PAGE_TABLE));
-       fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
+       fixmap_pmd[pmd_index(FIXADDR_START)] =
                pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
                                __pgprot(_PAGE_TABLE));
 #else
-       trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+       trampoline_pg_dir[pgd_index(PAGE_OFFSET)] =
                pfn_pgd(PFN_DOWN(pa), prot);

        for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-               size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+               size_t o = pgd_index(PAGE_OFFSET) + i;

                swapper_pg_dir[o] =
                        pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
        }
-
-       swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+       swapper_pg_dir[pgd_index(FIXADDR_START)] =
                pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
                                __pgprot(_PAGE_TABLE));
 #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
