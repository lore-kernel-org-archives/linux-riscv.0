Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0739CD1292
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEFdcOOErJlNao3AiYcCUHVAmbIIojBio7Vz6wNAYw4=; b=MEXV3invVBOkdf
	EG50q6m07yApQeBd5AK6aDzgimMdp2vWhzLxf9jwaz74QrR6fg6b1suXW5tIUjA4aFAzFk+DUVjc6
	+v5LHutlDMsmJXzSxsqM2zvmYmFuKexVHcpyVueeSnWqHQB+cfrMl/p2U3HLdE2i8Dn6O3AlCW7aQ
	pffK7a2qkNhLI1KVIrE8G5otPBSbZObGjSstCF4DojjM6Ne5DvvvX6ovAt+Fc/SrWVJ+LrgiqTh4y
	YIIY16Zcxm9PIzMTLQgjtmUI6VKeVGGQQZ6KQF2PGsBIlMTth9CBPP8oRKQxJovsftRkTy3ADasMP
	AYVmFC932Jx1e+3QOPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFS-00000000a93-2vCe;
	Wed, 03 Apr 2024 23:42:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAF3-00000000ZhU-2O3N
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e0d82c529fso3642465ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187722; x=1712792522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir+lgmmL0ZmHswiBuJpYbgwfILZ/3vCYSTqJIvKZkPQ=;
        b=BMaybrqHNA+iOcPexx2zE9tvDdMq9Y6QZw2LcqaJYkIAsXKxuGNi3cf3ngOYRMBauN
         tjWzIiCqvSOHR2MQiX9MnIbQmHdeefQub1gjpsFzbXo5kCKLweoA5ziAf+vANvTRhUuJ
         wQqgl6mMLLtIcsEZsbnVe6P7L98hMl0qAJfdxpbqIg45CQl8pGph8iUUxKKjKwJIW8St
         FljWDhffeHN4FD9CDC5SyHG1vyStpA9ekxa1yKUjpPIKTbxebmAuXtbySbV/V1eBxAo8
         O2cShIaswozKqy59EQQ2EeDgn0XpHwIg7h66Enz8rp/VfGnBO2yvi4DsWUbIM9RNOtd3
         62RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187722; x=1712792522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir+lgmmL0ZmHswiBuJpYbgwfILZ/3vCYSTqJIvKZkPQ=;
        b=RgFP9PJExeuD0MVLFetufOksZCpfS5mj0W/7DnwaH0762wJdjZRgWV1cFTlt/0x0PI
         BseNVyA+XqIUBvDVwiq8D+5Xhw6HrP6MIdeZyiOCl6GCr6vgDNzqTlCUJv5U0pF1kM2k
         +PRYCO3O9c+X+Qd2vJ+EGCaaBvEGgIDHfIJmG7NhukQyi1OavpwMpGDtg3DKgddNrenL
         a1oXn8dwUQ0sB5uMCI2v4iGbpjTvW3oZ7WKivIR+mLJnN7/5MBzwUQG3dgwaZHEcYWzH
         CIZGhc39CJSBigVA+GlesQF0rQAx7SuIxb6yZFMxGtnqhL1eTD7+47tRuRQp/UPYEKs4
         SMFg==
X-Forwarded-Encrypted: i=1; AJvYcCVvoEQ4sTzeMuf6GwbDNxgPaYdipRAce9ovQeRqK0/oBZS94IXxA5XEErlki11Zn2A2b1Md5yT4iau2G251+gxQmxXEvRTtPLJ2YSGFMC0t
X-Gm-Message-State: AOJu0YzUAS9aHfzaTKJZ5NdvXcWDlbFkKQsilvuMWxls4bBn4mMQ8nh1
	kp6w9H8xQJ6eyxU2LlOWKa8exHOZ8bm8k+r+S5yMJvJL+So6L4qFwXu8radfppk=
X-Google-Smtp-Source: AGHT+IE44MbJu6BIDOc3JQGIbnw05ABlT/b1420//7Gxn6oIy2GZnOOaOXzQhU0JUqBs5V+YKteclQ==
X-Received: by 2002:a17:903:22ca:b0:1e2:3851:6b6a with SMTP id y10-20020a17090322ca00b001e238516b6amr860088plg.65.1712187721821;
        Wed, 03 Apr 2024 16:42:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:01 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 12/29] riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
Date: Wed,  3 Apr 2024 16:35:00 -0700
Message-ID: <20240403234054.2020347-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164205_915810_A28C28E2 
X-CRM114-Status: UNSURE (   9.54  )
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6362407f1e83..9b837239d3e8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -403,6 +403,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -694,6 +698,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index ef887efcb679..c84ae2e0424d 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -142,3 +142,24 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma_is_shadow_stack(vma->vm_flags))
+		return pte_mkwrite_shstk(pte);
+
+	pte = pte_mkwrite_novma(pte);
+
+	return pte;
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma_is_shadow_stack(vma->vm_flags))
+		return pmd_mkwrite_shstk(pmd);
+
+	pmd = pmd_mkwrite_novma(pmd);
+
+	return pmd;
+}
+
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
