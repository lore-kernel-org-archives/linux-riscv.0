Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF023CD1292
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTaQepHW9lBatApuCN+FplOesOAzW53d6kpx/EAnQSs=; b=b5mC09CNMsuiNh
	JLcnxlt7Fx4vo4NofLRZL2BxkYXV3VbblcouBY3uqlWS1FEO58duKLRrVzQH5zSylAdQtaO2FwAK8
	3vGpuuu8mV3DYwlQXzHP5SYpWoaC67BGMs8MrTlZm/S1y7pd6XXJma7GQjnAYZJMOMxpW6qqBB6kX
	UdSw4oLqzbfJ/SzcRsAo0j0w8+5OY6YiRDDp9Z443dtifSs7C5rSTLFHEKqepiJeu361QKBhLOFdL
	wgN44udOJbOo/tVn+TYpImcM6qCi20VL5GYn8DGZS1Ejqo6F2+MM1Xi7a8rIDykHy1kBubHPOBwzk
	Mx1ffuk2XuPTtFRRcmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq56w-0000000Gwfx-12Pd;
	Fri, 29 Mar 2024 05:49:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48J-0000000GnaR-2sTe
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fEO9ZqLZNdtWaEHlnNa/VDfM4+2OUD4uT/m4nT0q2gI=; b=CHvztvg87ZzPO1fhqLsqD5iR92
	7UIMOMBS1mXq9R71QruymVfk0JysUWQFdzRpwI7QL/oNShUM84cMO2bLBKbcxPAU/wVbthldJzeuK
	s5M4cbA6W/57d6Lwf63Wk3Odv2kkVo/EKhWUUrrZv7lVygW/7W8UbFUdHh+nnCT47IvXW1xFQvWCU
	EFpjOCqbnwPwSHX/kF3gto4C2zCPmGytngSRSI2je4nLW6ZAYGWHKN9vUYVkSR8bldKHeukKnOOhv
	wVR+5H+CZNAed+4Gliz13qq+ENL6pJ6Ozr2MS8pPyHTqwS95q2p+2XmtkYhGmhH1p1slDKiSVFoeR
	B4Se/NLw==;
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48G-00000001MQ4-138K
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:26 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3bbbc6e51d0so1030841b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687582; x=1712292382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEO9ZqLZNdtWaEHlnNa/VDfM4+2OUD4uT/m4nT0q2gI=;
        b=oa5kIBzxHwZ+UdGbuzO5pAcyuz22b4sHKXm9jJohFvmBNVZ1WcCB1zr4fhXXMK1LLV
         VcEXIjhql5PCukGzJ2iFA3lr1MJg4/aLKZgk9EpLuvaKq5Zt+LXvjVjyXKIuelC9QyE1
         dLdWGuZwf6qLtqtRrSIYGc0mDv9KtbNgrRHa9kB9yWvTjt5TpgWewRyPkiW9/awx8SxK
         c7gecsZL/Clvsc+gBlSSM8L04WfL1GrSE6KmolS4IE4dveZqWUlRA4GCiSLUCjzMSVrn
         veKfjZmfaii7xweA5P1Js06/119q0reG92N+LsbdeHg39bUPpiAd4QLSkj2tCct44M48
         +W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687582; x=1712292382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEO9ZqLZNdtWaEHlnNa/VDfM4+2OUD4uT/m4nT0q2gI=;
        b=kpOkct0TEp2z/LLXVqRbJfkOhBVuMNFsI5VTYGygwkVLJ4/5Gnv6Lks5MWwKKRaVr/
         Phr5o+p4qfNhHavozDk8VcMZbgXNEgiaCLDPWpCp5JtxxF5MhG0jHKsHsx/PTJGClgCI
         Rty6vrDNfZZ3Ja/Mc235T+0pPvrcZrgf08MCNpNHQiRyc79toN+9XvwC+fWJYJp+6okD
         BloJfEFjRXdharxBcXw6S96YhWSZ+1V9t+3lxddV+TeEZuKZEXR13yIiLBeeBoxIjZuv
         Un9rYnfbckU/0GPnMvWl+OYuwhkAWKsbqgEJuWNpB3lrcv5OzoW3aBbj3AtSVLqzZbYt
         oRCw==
X-Forwarded-Encrypted: i=1; AJvYcCXTOLdHdLzq9dFhVr7t8Kcsso1f+bU1uMJEVHh88Y/gCGqaQXbjkAZpoXmi9w7PXX0BSZzkynT88+PHWeN6FS/O5yrDe9YZ86lO5Ev61FSS
X-Gm-Message-State: AOJu0YyXRaFZ3V0bu5D1ZBn6si1wvFcrhQHa3v9Kp0m9ZOISkr4eESrZ
	+BjP1+5gHNNv2gAO6BgglNvNKVEPE4GYEznIEIyngP8oyZPB8dnimKDT8vGEEZg=
X-Google-Smtp-Source: AGHT+IHkNGwGYsa0lxSVV6I7rhUYi4wQsB/IhRzR2mYXyandS5eg+YGt4M7UftNEIAsc9qZb2HdgcA==
X-Received: by 2002:a05:6808:3385:b0:3c3:ebba:2cdc with SMTP id ce5-20020a056808338500b003c3ebba2cdcmr1352197oib.17.1711687582182;
        Thu, 28 Mar 2024 21:46:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:21 -0700 (PDT)
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
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
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
Subject: [PATCH v2 11/27] riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
Date: Thu, 28 Mar 2024 21:44:43 -0700
Message-Id: <20240329044459.3990638-12-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044624_487513_49726E1C 
X-CRM114-Status: UNSURE (   9.73  )
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch. Underlying
arch can have two types of writeable mappings. One that can be written using
regular store instructions. Another one that can only be written using specialized
store instructions (like shadow stack stores). pte_mkwrite can select write PTE
encoding based on VMA range.

On riscv, presence of only VM_WRITE in vma->vm_flags means it's a shadow stack.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>

rebase with a30f0ca0fa31cdb2ac3d24b7b5be9e3ae75f4175

Implementation of pte_mkwrite and pmd_mkwrite on riscv

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
index ef887efcb679..933c5f23ef73 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -142,3 +142,24 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (arch_is_shadow_stack(vma->vm_flags))
+		return pte_mkwrite_shstk(pte);
+
+	pte = pte_mkwrite_novma(pte);
+
+	return pte;
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (arch_is_shadow_stack(vma->vm_flags))
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
