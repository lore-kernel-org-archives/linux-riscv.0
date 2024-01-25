Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1996AC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MLiS5w0FKIrmV32ILo2M5m9bxhLteFncrhoYl4UT9s=; b=iun+ncQZodMn+g
	MLSQmh9quiwqvZyeczLwWVvR6hFnLVUVsaGGldrGacRAZ1NgtOTR2eKGjHa8oAtykKfv7+jtQhiu3
	be5QUFtmCcd/6/cpnX3/ZmNvGlG3+GqWMe6DFfUu/Ji9+eqCCj5VkWMWyDx0V4hH1KZgvhFa0kRTW
	3aYZ4hBg1Gk8CJwJk4XRvVc2iPsrtF/crpRtCJ/XjO35IZtsKmfI7ZN8sJuyh5PZmW+GaDzFF4IsT
	YymSM8/DE96NyMqL2m6IJrWs9osNEOGaeMht0u6qRsGvIUgk4viTdF/FV+J6YE9fN2cBUvvlkXBth
	+WSttKJSkvqZy4+6/UGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFL-006lRy-26;
	Thu, 25 Jan 2024 06:29:55 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFG-006lLP-0g
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:51 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6e0af93fdaaso5579732a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164189; x=1706768989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRzF2SZSpJKrBhoESLsApoQWcpLzxI/TelseFUZAskk=;
        b=13mMWHIgyZYclsyrlbh8kf7xaBRzbOSyvc9S4fDJ3mR16O7nqfB6G03clzcXfYaaRY
         03zTVZgbG8jbwy3nkl8jh7pkX/SC3szQbi3IgFLPF8AGd9iPq7lqaUHYL3fLvX/W6klm
         v1LzFF5288bv6Ib+k2AMz6/+JgE9klhm2KKPN6kXBVx73UBwaZkmC7yjB0mgq9zzP0jF
         jB+bYYbwyYwDLVsEfwjKi3ZDj7zYlQvA5gcSqZ6S6vFiayeW0bFaO7sSPv3ZtKw8wQw9
         2JFQ0WXVYWgCF1GbN9MQT2EuP/MIV6c4u+j98zOO7+jY1GH81Bb+tZXGRK84+8WqQWez
         ReLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164189; x=1706768989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRzF2SZSpJKrBhoESLsApoQWcpLzxI/TelseFUZAskk=;
        b=ObrCTXQF3YCk23d+eMYqGKmCxtSswtYnFfxrr4kLxNtliScGSDj9DfXUXXQWhyj1RI
         F5975s05dlRkfNyM3NRu5YHKm2+EMZCJGd6ArZviEPA9a9p94d5YlEzwPQrSG9fmW94M
         d2VVbiRJD1vdV1aMjXI43Iyde6QMJIERAHnbi5KwPbATsMX+J5JNZGoNW63EM2oyS3Ly
         jKuEsh/Ok7IzwuJnJZbdqMNPCPhpXRdVEBFF8n1U7ZrXFgSEfvV3pnpnjfg4Qbdj2h9C
         b00wnLB7CALLDX8fNHCNl7WDahZf1pZHgD8c7SQMiO+DKSQ4ge3ixpkbbqTnw856Sv5n
         6RmQ==
X-Gm-Message-State: AOJu0YzRTq3kaaf69DO46NfHL4Zp5m2cpvErbiwNX6zS+PlTGHW9uCPW
	1dXVQeB8HfpPZM3Q4iwCVFuoKt6I/CS4qKmwUmtPH/9u366EGs55styrlSQuM8I=
X-Google-Smtp-Source: AGHT+IErjNQJ/wKFk47rmBKTBBYuOvQY9ZOcxL+k+OB28eXMUoqPg8zllrGghQsiXCVST38v7+Fe9g==
X-Received: by 2002:aca:181a:0:b0:3bd:cc3b:a894 with SMTP id h26-20020aca181a000000b003bdcc3ba894mr464457oih.93.1706164189075;
        Wed, 24 Jan 2024 22:29:49 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:48 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 14/28] riscv mmu: write protect and shadow stack
Date: Wed, 24 Jan 2024 22:21:39 -0800
Message-ID: <20240125062739.1339782-15-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222950_269461_49BF0C37 
X-CRM114-Status: GOOD (  12.82  )
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

From: Deepak Gupta <debug@rivosinc.com>

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on such pages, clearing up W bit makes them XWR = 000.
This will result in wrong PTE setting which says no perms but V=1 and PFN
field pointing to final page. Instead desired behavior is to turn it into
a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9477108e727d..9802e8d48616 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -398,7 +398,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -594,7 +594,15 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	volatile pte_t read_pte = *ptep;
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
