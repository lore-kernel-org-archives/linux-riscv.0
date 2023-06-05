Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA897C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fYOjVO9gcSmdm/i98wGjB/LU/1+rTDKA+1HkkVZH/o=; b=JSEjcOa5LRe484
	ATVyWnABK5gpSotBIueEJUmQei+EfE+u6xPPyGhBmugDlIxaIeDowVbd9loO56Z29Lwil7Dof+hgI
	f4LfsxmAIcIJlDLQBoAk7sWNXIaSvdmDmZweHlLsjNdi7rFjptlQVlq9Oq0+6oevrE00RbLJej7uR
	CJwNFHrA8IDiJZeZdp1ipZQLEsanz4dFL0nKSUT+fqhzGuwfztk4quhwC3KGOFGqu9ZZppxeQbJml
	K0dcrft2UJ/xlVvqBbH7A4xD0gIKQalWFidXpbu1NsL97qyznhrRqK9dEOdlLB8WbufqWXfmXnTJB
	h6h+74dWK6b6CASE2IaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BIs-00FoIq-2r;
	Mon, 05 Jun 2023 14:35:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BIp-00FoGK-1Z
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 14:35:25 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-256a41d3e81so4138905a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685975722; x=1688567722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnPfgIDWBs0YYXdVzHgFIrX5B+53ekGUHMTcfude0cE=;
        b=ffVyNgoosVSs91945n4gFuDiXVzNuQEEPwb9IjnJp4MyeKLTIRZw7Xnsyu0vqoDSPI
         1h0gdfP5D+HMUZjI6u8k40LINt0IXgn/xtnNyvPHrjKSNgKwg16mt/5bxbzXJHDfH4pF
         y1oV1LRu4cc2aOmKc0Xhtw7aXNMHdxNozGFcDads+8HgDeuwEuH28fnOKGAPOShykVoc
         Gesn8FP+iWgXBfrBRYpazhtvc46TbMy1suMh1bE+xq28UM+8iwYJ59NirSXpLYmKW1el
         zrlRuF3C/qgZEaTpEQO9kubKn6IJ/mOnezYYN9qn0zucGdn/qgrVSRHUlAwh4BCoEIYQ
         6c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975722; x=1688567722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnPfgIDWBs0YYXdVzHgFIrX5B+53ekGUHMTcfude0cE=;
        b=NpSWguwfBYxHO/8sdBC+vgac39FQ8nY4uamaSuX7cwwxm2898sxVhO7FUyUY9qZy/D
         W6OaEiSWXtq1e3Ad6XDOHY4kn+CX7pNDYIYaUrlmaKLrVySy3IT8Ud/Hl6bznVfuVb+c
         ISmegwfw2Lf7CJRIqgWly4Y8o/RjwWXdIg/IWBBX91NqvdBAjcZMsmKGnwOP1uVx1JgZ
         0HC6YlRJ7EY7NLyjJc/OiqCjtKIlWuHoTlqFTvt+ooYZNg6Qz/ny2Jw6h3fRZTI/4DvL
         a3kmMXH9v3znxx7Umf0Zf/SUK2mKNdudU/394ypDcXtzhWCyoY3Dr92yfwp9akkOsryr
         4RQQ==
X-Gm-Message-State: AC+VfDysP+Yx+sJP0D5NlFPf2meZqsVEGTlv60QULVzI8OL7kbKbD04Y
	T27F8xpPJrit90LJKsNu6WvJ+bnkqdTvMxO+n7Y=
X-Google-Smtp-Source: ACHHUZ7T/nG/LREifYc0zczolikuIQMgBFpvxe9aToBG/9+TDnjWaZRcSokFABIaKOafGLDmMIPE4g==
X-Received: by 2002:a17:90a:319:b0:259:7ed4:d6cd with SMTP id 25-20020a17090a031900b002597ed4d6cdmr844923pje.5.1685975722231;
        Mon, 05 Jun 2023 07:35:22 -0700 (PDT)
Received: from kerodi.Dlink ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a1fce00b00250334d97dasm8297069pjz.31.2023.06.05.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 07:35:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 -next 1/2] RISC-V: ACPI : Fix for usage of pointers in different address space
Date: Mon,  5 Jun 2023 20:05:11 +0530
Message-Id: <20230605143512.707533-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605143512.707533-1-sunilvl@ventanamicro.com>
References: <20230605143512.707533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_073523_525844_93952F5F 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The arch specific __acpi_map_table can be wrapper around either
early_memremap or early_ioremap. But early_memremap
routine works with normal pointers whereas __acpi_map_table expects
pointers in iomem address space. This causes kernel test bot to fail
while using the sparse tool. Fix the issue by using early_ioremap and
similar fix done for __acpi_unmap_table.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305201427.I7QhPjNW-lkp@intel.com/
---
 arch/riscv/kernel/acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index df5a45a2eb93..5ee03ebab80e 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -204,7 +204,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
 	if (!size)
 		return NULL;
 
-	return early_memremap(phys, size);
+	return early_ioremap(phys, size);
 }
 
 void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
@@ -212,7 +212,7 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	if (!map || !size)
 		return;
 
-	early_memunmap(map, size);
+	early_iounmap(map, size);
 }
 
 void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
