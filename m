Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE1FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cy25V8ZCtFQHo2FUHqyRnY5cAg/Z2KgithetagYDH1A=; b=aSj2MkTypSrRV4
	CMPGbNF1p2nmp6OwM1MQqbTkGVmOQygouUOC/1TWvK7dZIWiGH9Iw1nUSyVVUETXerlNLhsU5soES
	mDVuTs2jle47ULlAMaRg1cpLy/EY8W2bO39HGMID3fg4gFxBXpSGONheoUtBaS9XxRuZljl/bvuCj
	cdWjHBkTjK3Tsb1s3waPiFpDX/7mVt3F01GCmIuz+6gD0qKoQY/E+7dZFg+9Ca1Uc1tdkpo+Bym2a
	iGYkZSOcNOLNwEh+lx7RMi6wyIQ+KvwtVlXP83w6sAW6H/vwZ5TQ9+03YcWRh1DvlB0o5rZJiOex7
	crKcCCsOJCw3i1m+Ty7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq56t-0000000Gwec-2Lr3;
	Fri, 29 Mar 2024 05:49:03 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq487-0000000GnQA-1gEM
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:18 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c3ca3c3bbaso996177b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687573; x=1712292373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qNedlIktUfQrTR049/Z3OzWmqNS/siPqaKIdhPjXgQ=;
        b=pN1oiJLFAAEYyfbeKnqmBdwEbx37TH9LIiYONCqXHOnuAvPxtujV6U6KWpcnvVF3i/
         DuJtZwwmLYGfjmxryuXNKtAeE0oM77fIxLuA1LXwHCJpUXuCcYcBBlwzW40fS0+Usfn2
         GywoMku2i13tNV39BjFtR68m1qdrOjInEWK++Yk2AFzev5vEfqsqjPbNAaZiZ4ERu+F6
         C2jVP0XejVot0675mtrZcg9spY2wFZsqV43WUIJnvgTjk3FGqdEqvO2vDNSzNJgYqzPT
         xCewNc5c4aa8Ucrea6Huy9nG7+wjXOAuWv/euy7VQttj8MWAR8CGsJaw8O3JHOzAWzJ4
         cTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687573; x=1712292373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qNedlIktUfQrTR049/Z3OzWmqNS/siPqaKIdhPjXgQ=;
        b=AV4Fv4PztblEjhudicUPSNat1ZX32oj5Ujbp29KB3ScykRno6NSb8PNH46kx6TpGEa
         kkwNXMxJpIPH7VqZGJEWZFBHoTfs1Fwexgf7p9hqHgcyERruM0l3WwO4kROqHbzCCgeH
         s9n4pQkvHMlADu7TtabijVtaGt4c/Pe/dUHBjz1fnOKyPLpVzfmbHTWrFe7jgdu5Flqi
         cHMKw5YBdxTWJPoOmI1gRMgoIgONhBcCEDkgm9o/I9BFjMusZ4+U0ipi6Lp1HCtHQPb5
         KArl2O47jbcEvY8kpPk0nnod/3Bm9jIp7JIRFjg3kdWgUaKFuaexE44ltL05ELsgrT84
         E0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnGKvaZA1PACA7plpbM2+nyk03yTGjr9S8UFpFNhV7VZ/ttdPsUBM76RFggYslcgDPMqPCu8fOtI0gWbsd8NtPa3KHL745Ufvy7LNeTHtH
X-Gm-Message-State: AOJu0YxrKBkOR8A5nbBhONNoqfuvt5NFSY1MTjMWdjoyJXTL94+NjKXc
	peKMxtO2+wVF+gOJ0kR6EAFyo/e7peNb8vKMX4DeW9SHExCB8azs0X4++0tGlJ0=
X-Google-Smtp-Source: AGHT+IHTQWx1tR1j7s3+pvyrI5hMSSRXmYpDonpnfYPB/9nbQQQRNm8eLeO96l4IIa6gD4IvOzseMg==
X-Received: by 2002:a05:6808:398c:b0:3c3:d2ca:a4fe with SMTP id gq12-20020a056808398c00b003c3d2caa4femr1622664oib.7.1711687573325;
        Thu, 28 Mar 2024 21:46:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:13 -0700 (PDT)
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
Subject: [PATCH v2 08/27] mm: abstract shadow stack vma behind `arch_is_shadow_stack`
Date: Thu, 28 Mar 2024 21:44:40 -0700
Message-Id: <20240329044459.3990638-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214615_669996_2F4ADA33 
X-CRM114-Status: GOOD (  15.17  )
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

x86 has used VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow
stack VMA. VM_SHADOW_STACK is thus not possible on 32bit. Some arches may
need a way to encode shadow stack on 32bit and 64bit both and they may
encode this information differently in VMAs.

This patch changes checks of VM_SHADOW_STACK flag in generic code to call
to a function `arch_is_shadow_stack` which will return true if arch
supports shadow stack and vma is shadow stack else stub returns false.

There was a suggestion to name it as `vma_is_shadow_stack`. I preferred to
keep `arch` prefix in there because it's each arch specific.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 12 +++++++++++-
 mm/gup.c           |  5 +++--
 mm/internal.h      |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 225af437ecba..9e6a4fbfccac 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,10 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
+{
+	return (vm_flags & VM_SHADOW_STACK);
+}
 #endif
 
 #ifdef CONFIG_RISCV_USER_CFI
@@ -372,6 +376,12 @@ static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
 
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
+
+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
+{
+	return false;
+}
+
 #endif
 
 #if defined(CONFIG_X86)
@@ -3482,7 +3492,7 @@ static inline unsigned long stack_guard_start_gap(struct vm_area_struct *vma)
 		return stack_guard_gap;
 
 	/* See reasoning around the VM_SHADOW_STACK definition */
-	if (vma->vm_flags & VM_SHADOW_STACK)
+	if (vma->vm_flags && arch_is_shadow_stack(vma->vm_flags))
 		return PAGE_SIZE;
 
 	return 0;
diff --git a/mm/gup.c b/mm/gup.c
index df83182ec72d..a96043429b31 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1053,7 +1053,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 		    !writable_file_mapping_allowed(vma, gup_flags))
 			return -EFAULT;
 
-		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
+		if (!(vm_flags & VM_WRITE) || arch_is_shadow_stack(vm_flags)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;
 			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
@@ -1071,7 +1071,8 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 			if (!is_cow_mapping(vm_flags))
 				return -EFAULT;
 		}
-	} else if (!(vm_flags & VM_READ)) {
+	} else if (!(vm_flags & VM_READ) && !arch_is_shadow_stack(vm_flags)) {
+	/* reads allowed if its shadow stack vma */
 		if (!(gup_flags & FOLL_FORCE))
 			return -EFAULT;
 		/*
diff --git a/mm/internal.h b/mm/internal.h
index f309a010d50f..005761d754f6 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -572,7 +572,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
  */
 static inline bool is_stack_mapping(vm_flags_t flags)
 {
-	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
+	return ((flags & VM_STACK) == VM_STACK) || arch_is_shadow_stack(flags);
 }
 
 /*
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
