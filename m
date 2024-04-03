Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF4CD1299
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OgDs5sFYYduNjQSvzMw3EZEU7VlKrURw1WSoxRX0q4=; b=Iws03udgwhHCGc
	lwIg/V4RivbWdiCN+5Sa34zJ/A3A3bQxXJWOf0Or5iFRz4O3QJbztYiG/drk8rnMmfajDuDdFmn6e
	zoYQLYTh9rZ4VcpcPUpZy1lQCLdl4FAWF2eYSQfwRrmypcDRMR4IpJomGKZilOcVgAqWfRbU0Ycor
	lE/yYMsrfxdLQFRZGqvM2hwIt4KZEwLy+mvQB57+NI08HiRz3Jjrt0yljEZcRsK61pVcizy9GYb1i
	ZXxYvwRdiq1xgwLoWzrajB1stYaSae4b0W71aHsxTqXWKrFy4jfZ/DKeleroVLi1+aW9Okf+d5KTG
	EKG9CYuZ1xN56RCg0WeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFA-00000000Zqa-1d8A;
	Wed, 03 Apr 2024 23:42:12 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEt-00000000ZYp-2k4V
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:58 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso341271a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187714; x=1712792514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54i5AOpZ8eaoGeKx2/tq2pnpvo0kkfTAlmLvvQQ7IdM=;
        b=FDbYWvHijEQCm5NF5sE2maPbsdQgltrC1HlbF7Lv1/1DAKCqCtjqvtAJ8WLDKtS925
         irabJbHX+3/muLCLphfzkpN+Ii//9bGrDZUcz3n+tfuVjzZuSTesxb2E8Tk45aHf/eX2
         kOJRHeWDD2tfGU5IjYQXZV70UcCQfLKoBW2ZAOc0dDqEYqqjPqAOvdTlV4y8v/yVjNp7
         w8S7FdtQfQKUXTvsnQITwDqUfF8hQkGSgIX+zKhN4fPZDIsZbC7sK7QexcO0VUwJupnC
         zVacSRzurNaguI0LUMThSWo4/8XgGOQCnLA0nMJq16wrraIOVIH/EdLtd+cVhQ+TenWH
         iBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187714; x=1712792514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54i5AOpZ8eaoGeKx2/tq2pnpvo0kkfTAlmLvvQQ7IdM=;
        b=tMkh1s/0L2nSrtOnm+cRK+V8anMfBJHUwN10XVflAIGUSSTx+jikm93dxmnFvXceeR
         qCfASqBg0GMmKCPrq+nL4XYP3Of8N/5+EFaxDBw5/3tsBGITORPwsQfyqiBImh7t+dw3
         gFVlq51Tvm+BJZsJbNOcEBWbaELNCZLk++9jCIaq8cTgL3ZQgyBcc2mTYsUK8IC/hH+S
         sb8AKQIW6lF0GNJJl/7fBYIc1fOikOVWQZePcu8C++t5xOmKuPgjtJSYpPECpdp3leOE
         qKAx+hl2QOmnUX9oEcISZYDdLSmTNVCCpwF0e+Ks+6dXB9IP3D/EQDnF4Ib1oG3eVsOu
         ckRg==
X-Forwarded-Encrypted: i=1; AJvYcCXQwYlIQZaDgGzWHbi2G6Myiyk3nQdQeYXspDkg4BsB64Q7KZvwgkjM+1DTHY/ayUgT4DdJnOJHL2BNRQTrjehHWlslLrYD+/kgUfEoQYh6
X-Gm-Message-State: AOJu0YwtM5hvNuKgGB72tIp0Vtzzl6TysGyIp0NuU+cS0PVXaOocDAGs
	DIqUyJDraVb8u5ehvjAXuXS9BoRbKrQ4Wq0nP9ICTN1poLdJSOCHtWpCQ2KMd54=
X-Google-Smtp-Source: AGHT+IG6GlC+ZgzT+vgM3OEvECwnyeJlz7W2zSZ3hW3riRhMkNJ5fFd9UMQXlTdOrd5KXzyMbVV4Yg==
X-Received: by 2002:a17:902:f085:b0:1e2:a5b2:ee0f with SMTP id p5-20020a170902f08500b001e2a5b2ee0fmr628269pla.24.1712187714025;
        Wed, 03 Apr 2024 16:41:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:53 -0700 (PDT)
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
	jhubbard@nvidia.com,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3 09/29] mm: abstract shadow stack vma behind `vma_is_shadow_stack`
Date: Wed,  3 Apr 2024 16:34:57 -0700
Message-ID: <20240403234054.2020347-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164155_982093_F9D0F8D9 
X-CRM114-Status: GOOD (  13.19  )
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

VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow stack VMA.

This patch changes checks of VM_SHADOW_STACK flag in generic code to call
to a function `vma_is_shadow_stack` which will return true if its a
shadow stack vma and default stub (when support doesnt exist) returns false.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Suggested-by: Mike Rapoport <rppt@kernel.org>
---
 include/linux/mm.h | 13 ++++++++++++-
 mm/gup.c           |  5 +++--
 mm/internal.h      |  2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 64109f6c70f5..9952937be659 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -363,8 +363,19 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
+
+static inline bool vma_is_shadow_stack(vm_flags_t vm_flags)
+{
+	return false;
+}
+#else
+static inline bool vma_is_shadow_stack(vm_flags_t vm_flags)
+{
+	return (vm_flags & VM_SHADOW_STACK);
+}
 #endif
 
+
 #if defined(CONFIG_X86)
 # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
 #elif defined(CONFIG_PPC)
@@ -3473,7 +3484,7 @@ static inline unsigned long stack_guard_start_gap(struct vm_area_struct *vma)
 		return stack_guard_gap;
 
 	/* See reasoning around the VM_SHADOW_STACK definition */
-	if (vma->vm_flags & VM_SHADOW_STACK)
+	if (vma->vm_flags && vma_is_shadow_stack(vma->vm_flags))
 		return PAGE_SIZE;
 
 	return 0;
diff --git a/mm/gup.c b/mm/gup.c
index df83182ec72d..a7a02eb0a6b3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1053,7 +1053,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 		    !writable_file_mapping_allowed(vma, gup_flags))
 			return -EFAULT;
 
-		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
+		if (!(vm_flags & VM_WRITE) || vma_is_shadow_stack(vm_flags)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;
 			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
@@ -1071,7 +1071,8 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 			if (!is_cow_mapping(vm_flags))
 				return -EFAULT;
 		}
-	} else if (!(vm_flags & VM_READ)) {
+	} else if (!(vm_flags & VM_READ) && !vma_is_shadow_stack(vm_flags)) {
+	/* reads allowed if its shadow stack vma */
 		if (!(gup_flags & FOLL_FORCE))
 			return -EFAULT;
 		/*
diff --git a/mm/internal.h b/mm/internal.h
index f309a010d50f..5035b5a58df0 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -572,7 +572,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
  */
 static inline bool is_stack_mapping(vm_flags_t flags)
 {
-	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
+	return ((flags & VM_STACK) == VM_STACK) || vma_is_shadow_stack(flags);
 }
 
 /*
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
