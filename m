Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C98C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6957B60F41
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6957B60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H1OVKJl4sbzZdPVHVZ5MrxQ/431sJXX87WfjZ2UPJ4A=; b=ETEuu80+lvPP1k
	P+12Kz5ALUqaAWADxAVKrIfO1GvHkhCti/rGGKovJqZtTvwI/++xB3coAevmuS6hO/50dtrWuj5v7
	LvhIuK/iVsOEdBl8u9q9yb53kipKTq5ySjsuifkvYXyuU+uuWng+0B/wOhmnHK/u1HFkHqq8NSlyk
	N6xule3fPjwiY9trLSvI4t8b4mE6zNRLfaPuoP8UzZw0hSI92eJUcDhIJ2wlssOXNyNglWktZ0MJK
	MwccLUlaOFQJZKQsYh2dGGM2XG5eQBQ3+MfQXidTD09ZPd6YDSjo80IvIA7Jfd/y4T8qj1nz/hPCc
	g89uZpIq3i2pQ8E3Qnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dns-00HLWl-UE; Wed, 28 Jul 2021 07:16:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dnd-00HLWG-R5
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 07:16:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso8651770pjb.1
 for <linux-riscv@lists.infradead.org>; Wed, 28 Jul 2021 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=45WqfKtom6mMVDJZgU9anEiSV/dtOZcbAPcrsmgXp/Q=;
 b=FZlCmZkv/THnI53YoHYbLJNECMIOev++kpzCygpQUSY2TUVFIc97IlMwPUi5+xj9Qm
 fa2dEPpzvDRV5nNoGAb+UALPCBkSbWmH4RoOXiOqkL3yScwzkLg3XWPTTUQ+jPUA4Hd1
 c86UBFviCto/SzCpmh1vROarl2TyygxYBu3z0VhplHR4+kG9fduKGR0Z45W/snWImayl
 D3UlxOQjvm3tTYBjxGaEnY/X9nO0FI/6z/cQeLlyM4Q+qN2LRalIHLb3oiXD/tgjPKPB
 JW9p3orSmxJs50P/HTl5J0gFIdohXRBMS/1mFO8htV9Zqryj76Phe6f1cWG7w9fG8THL
 /Jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=45WqfKtom6mMVDJZgU9anEiSV/dtOZcbAPcrsmgXp/Q=;
 b=ZdoYJFmZtTxJCInWZpWbAvHbF7Jr3oqlFyYWB87QouMtFVHhlQyiBWv3WxX25Aq9/D
 amrIv+aNSC7eUfMVo2RC+5zsQNs3wLdIGAV/TQ3FdsmUH+X9gAAd3If8w6t4FEbE00xG
 PGcjbMi3Qdby86xHsoDtO8SRGBp484xyIJICUMEdlsSoX7GuhsoN6bITFM1uovm/5muk
 hOmaQgYoqvIYoGiYvze/c5GvywitQ4zuugkrRoGJaYyxZirsLHj0bTB+Qy5bdjg2U1bS
 QDN0Zy+wgjK4lzCNP46HQydh+wg0eWV+xnhGimnUYCOYnadXlEvntUGl+q4Fo0TDsq9G
 ydmw==
X-Gm-Message-State: AOAM531qSsOJr/4USOm5132hs1p9RfWEqx74DxBh/R5gRZqVDQlCpt8U
 6kSFDlenusNxgEpkSwLaP3A=
X-Google-Smtp-Source: ABdhPJyC79iiS9JhjYhuuDKNm3YaFUJJiZxLSLj82BY0rnUqJ6UWBXZ9w002CvUgxJx3bvUJeWQ8VQ==
X-Received: by 2002:a63:1913:: with SMTP id z19mr26869690pgl.315.1627456576994; 
 Wed, 28 Jul 2021 00:16:16 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.18])
 by smtp.gmail.com with ESMTPSA id x14sm6421695pfq.143.2021.07.28.00.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 00:16:16 -0700 (PDT)
From: Kenneth Lee <nek.in.cn@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@wdc.com>, Kenneth Lee <liguozhu@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: guohanjun@huawei.com,
	wangzhou1@hisilicon.com
Subject: [PATCH v2] riscv: fix the global name pfn_base confliction error
Date: Wed, 28 Jul 2021 15:15:57 +0800
Message-Id: <20210728071557.400163-1-nek.in.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_001617_921031_314580E1 
X-CRM114-Status: GOOD (  12.92  )
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

From: Kenneth Lee <liguozhu@hisilicon.com>

RISCV uses a global variable pfn_base for page/pfn translation. But this
is a common name and will be used elsewhere. In those cases, the
page-pfn macros which refer to this name will be referred to the
local/input variable instead. (such as in vfio_pin_pages_remote). This
make everything wrong.

This patch changes the name from pfn_base to riscv_pfn_base to fix
this problem

Chagne from V1:
	use riscv_pfn_base instead of riscv_global_pfn_base.

Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
---
 arch/riscv/include/asm/page.h | 4 ++--
 arch/riscv/mm/init.c          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index cca8764aed83..c690e83bde23 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
 #endif
 
 #ifdef CONFIG_MMU
-extern unsigned long pfn_base;
-#define ARCH_PFN_OFFSET		(pfn_base)
+extern unsigned long riscv_pfn_base;
+#define ARCH_PFN_OFFSET		(riscv_pfn_base)
 #else
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a14bf3910eec..788f12bb586b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
 #define pt_ops _pt_ops
 #endif
 
-unsigned long pfn_base __ro_after_init;
-EXPORT_SYMBOL(pfn_base);
+unsigned long riscv_pfn_base __ro_after_init;
+EXPORT_SYMBOL(riscv_pfn_base);
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
@@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 #endif
 
-	pfn_base = PFN_DOWN(kernel_map.phys_addr);
+	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
 
 	/*
 	 * Enforce boot alignment requirements of RV32 and
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
