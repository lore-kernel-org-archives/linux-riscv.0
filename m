Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8848DCE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFYfZpiCTwTvQ7F12WKadsw9acySkJnPBe6i+lxk+RI=; b=FUAW03k712jjAv
	Vao6vZ8tHTqgSsY0KE9Xadl/xK5BJSC9w534O+1KZfgSDcU9jr/taoYdeK7V4i+UJKLR9hXyMQ7Fv
	md40nL0poY0QydirkzXJCLZ3ExdOVSdFcMYyxW3dqxlyTHR+h74nx/wxmBWyC/fzUXfbuDhHvwRWL
	xNoWcxv8l7mL2wMC441v4cLj8wM8muB0nuxtMZW1Hn6UFg0Ps75TAyZ9E0WKEA3LRJqmNPbnut5Vx
	IA/H4AFjaG9WdDB5EJ8viFCmx8A7+sZICRovZ61Ab5/AGBMLNl9AbUwFs3x5cBxL1s0mvqfriFa1H
	H9Ta8jIJp4PMwK70YshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknRw-00EXm2-0X;
	Mon, 25 Sep 2023 15:24:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknRs-00EXkp-2B
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 15:24:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-692c02adeefso2446294b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695655474; x=1696260274; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quGOepQjvav5a/0LnIG9AkN+Jo2yuE/KP+O7gV9U3Pk=;
        b=XqCGkHxua60c3i3spWVJj9JDE1QpBsxj6I+u5fTXfyminUOTzLVMDtmaYlD3r3hQXB
         5o7HEZynfEPI9l3n5sZSe3s66B6wWrUokyyNWLVJHweY0nMFstQ6EPkkdkQNqi0LYX2o
         dGZmbLGmotQNn9rZIddIQovzJOuOHqspLII2Wq2sPfH9l+f4LkjRBAHDy//++my53bhb
         bUZhAnKI0grYhR3/HiXTWAs7jawYAMUdYvbxRuT+/+yGIpfRuxzM28uh1bcaTXbRMi5g
         +P7RO4+xBtxjGWJjno/bsAgrEgKyUbv+SYubtmOVeRgeK1StP04RTmrbIS21mVEYwFkV
         9+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695655474; x=1696260274;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quGOepQjvav5a/0LnIG9AkN+Jo2yuE/KP+O7gV9U3Pk=;
        b=rlOyzV1BbY5Nj+ceBOYpK4J63Wj/4Zc2WIb14qppz6LjE35Om5aGTx1PjbkhthS7ag
         5WkEFlXqJWkItvlWmCNuVO7oI32A+5AIblUIBHRke88/VG+0pTSiybkLOe8Hb4CSoZJk
         EuSAkztfONHMKdgQDzefIeLqi9TkY7fIeTZWHJDvdhf7FOc1jBvJgZiHtNCCAC/hCo7g
         VVoo+s6hJXPdnoHprgjALXaGJWk37Gk29aYMy3FG8va4aPvM58F/f2Py4O5A9oJxXZhM
         h8NZyQM+vvQEp8r0V95ZQtif47yiP2yq2qQGe272omCqRv3KJxvspaOTRV75h4IRSJUz
         tsPw==
X-Gm-Message-State: AOJu0YwhtEHFuXbBfukwjxpyncvfrXF3KlUs9C1h8meHHWtrCy0LqDpL
	A3ScSsuABqJFywN0sThOqlO799c52YaPtlfitIX20g==
X-Google-Smtp-Source: AGHT+IG5rRO3DnYcceECjuUB+Kb+dF42gZTzi5MsMqmbpXy61qdXxpP3dej/WbvzcVSjCrwfq8n9Bw==
X-Received: by 2002:a05:6a20:1593:b0:14c:a53c:498e with SMTP id h19-20020a056a20159300b0014ca53c498emr6362162pzj.42.1695655473739;
        Mon, 25 Sep 2023 08:24:33 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id v4-20020a63bf04000000b00563826c66eesm6934004pgf.61.2023.09.25.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:24:32 -0700 (PDT)
Subject: [PATCH v3 1/2] RISC-V: Provide pgtable_l5_enabled on rv32
Date: Mon, 25 Sep 2023 08:22:19 -0700
Message-ID: <20230925152409.29057-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925152409.29057-1-palmer@rivosinc.com>
References: <20230925152409.29057-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_082436_715011_190607C4 
X-CRM114-Status: GOOD (  11.16  )
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

A few of the other page table level helpers are defined on rv32, but not
pgtable_l5_enabled.  This adds the definition as a constant and converts
pgtable_l4_enabled to a constant as well.

Link: https://lore.kernel.org/r/20230830044129.11481-2-palmer@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-32.h | 3 +++
 arch/riscv/include/asm/pgtable.h    | 1 -
 arch/riscv/mm/init.c                | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 59ba1fbaf784..00f3369570a8 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -33,4 +33,7 @@
 					  _PAGE_WRITE | _PAGE_EXEC |	\
 					  _PAGE_USER | _PAGE_GLOBAL))
 
+static const __maybe_unused int pgtable_l4_enabled;
+static const __maybe_unused int pgtable_l5_enabled;
+
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b2ba3f79cfe9..e05e5c8f6526 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -914,7 +914,6 @@ extern uintptr_t _dtb_early_pa;
 #define dtb_early_pa	_dtb_early_pa
 #endif /* CONFIG_XIP_KERNEL */
 extern u64 satp_mode;
-extern bool pgtable_l4_enabled;
 
 void paging_init(void);
 void misc_mem_init(void);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0798bd861dcb..eed1758720c9 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -49,10 +49,12 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
+#ifdef CONFIG_64BIT
 bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
+#endif
 
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
