Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2DC7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2anyiiqgR3W+StQQXCX7Dyjsk9u3e9VcigBlKeX9Y4=; b=tUXYLXKROBYklX
	Pz/uYfpCiZ67WD/pEUMLeWke81O428aDRBfWGSHr74n4j2HKpN69zBrnksWd/bw9imjy6+OZ+ncop
	GRO2XGRDYpSRN1PaAQk0OxSmScvWdaqjLqTVhv1TKkg5MNkjnwzo16S387mtDtZkju+Yx21cQgxXS
	So1f+uHGhn8L4HEhdOIMKuu88XXfD+vb6Z/w9nFqWxws+PeOSWxfDFWr82RKW9n08vvsC7U+/krgT
	OIHJJnxneiw2m4h0VLgBlxmAshzCbKU8YmjbvPbf1doVWpUgxX0eLCV0x9jH+7FF5GuLtiZze49ym
	mIEsS1/lLW5JU3yprRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rHF-005dYU-12;
	Wed, 07 Jun 2023 11:24:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rHC-005dVj-1O
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 11:24:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-65242634690so4088859b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 04:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686137067; x=1688729067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaLF8SuXqZ+eem5Z+p2tHoPzcT4Es5+ktuLMhNLEyaQ=;
        b=WCsZ22y+8czgBOQ9DxhWSAUqumehO6PNurNynJB4BmToYu6snCtWQL+exdFzufbLlX
         bvoB8jqEWvGls4utETB1quXhAdc5ateJtVPpVG4Q4BIe4sjEz3iOxrJttLa/Zed52lyX
         8/1RJJw8nfPLIXTmTbjyLBm+goVaPkeavhGj9qTnaJr3G5/hC2Usy66pUFkgIdsprF6B
         yG2k9rXQs/q4qVOPjcxFPmhS2y77EH+DgMcSW1alU7l/U05q8ySYu3r4bmnQyCGJDC2t
         yGUlrc0mC09c4EFcq8rMqJAnUmIh2YhnVaxFWt49+zt5a143SHm+N31hZyAvF8C/BM5R
         +50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686137067; x=1688729067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaLF8SuXqZ+eem5Z+p2tHoPzcT4Es5+ktuLMhNLEyaQ=;
        b=FilxhFyQebHVpxtU7zMCXgcmSugylIieURKAgnpdOkzSdhP/0zSE+vSRxDpvxz0KB7
         JwTrT+IToN+MWYW0/1UnMYvMoBnBrXv/4GMTu7uTIg1+LXenC67Y+vHyW4lkpxW0qLvE
         a2ZgHIU+l2GgPJ9EqgribfA87BaKf9P2HOxVVKy8htpmczpX8KCzSg6vvQJmZmbxBY8m
         YEL0A2YXdA1ryn5x16NgNu7p7xRbgTXWSMBR+UAoZrvVcgV4t1vK1zzvGPapoRco3RE1
         i3sd6MiIlIbdC9+SeHPl3CpH8L0uAWTy7fe4D59wternFdQa0xMOj5Omi3zAUq0O63Gc
         pZWw==
X-Gm-Message-State: AC+VfDwc9jplR8taAitAWDZMY5LTUxCjsnR3OcXIuomkUqr60umB//HB
	NR4PMoUZkcUUN22ZyMQQ29N8ZccfybYL68SHncw=
X-Google-Smtp-Source: ACHHUZ7bgZCFwzNHwgERU+x+RNj4ugM3cQipIuaTgbdgLN9TtiyCfdPlPvQ9Awpx6wOuhAxwXgYNLQ==
X-Received: by 2002:a05:6a21:3706:b0:10e:96b5:45fa with SMTP id yl6-20020a056a21370600b0010e96b545famr1341134pzb.43.1686137067317;
        Wed, 07 Jun 2023 04:24:27 -0700 (PDT)
Received: from kerodi.Dlink ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709026b0a00b001b2069072ccsm6228322plk.18.2023.06.07.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:24:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 -next 1/2] RISC-V: ACPI : Fix for usage of pointers in different address space
Date: Wed,  7 Jun 2023 16:54:16 +0530
Message-Id: <20230607112417.782085-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607112417.782085-1-sunilvl@ventanamicro.com>
References: <20230607112417.782085-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_042430_465158_9AA26A1B 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305201427.I7QhPjNW-lkp@intel.com/
Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
