Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208BCEEE273
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1toAlgSUXlgz0JhOmDPo4sGjCvzsUKbQdHtt+8pgTc=; b=FCVey0l+e58oY7
	HuSeGnbU5mVcb/dlQpaH12nJt/4Nf9F4a8o353x1xlvLZfGek+4M1OWHpZpZ9VytF1P7deilm84ZH
	LPgv5Ymfd0NjYlXgPsx6WAVkWfXIfHWEiuTPYy03g+L3z6mljTb2uNtsjnsNMzULiRnIQ0mvnPWl0
	3jrxvdK2iriTH1nyZSyOESUJ4qjFdzQdHRR0Ln+jpWVwBpD7Qh80pqOe+ByndPnKvCKSeg1ndq1A4
	BQalkULmQYXd/Z2ffmetV3gDTzy5Fb3fJcDqhfOeSO/G1g+Xm7/vs5Ktk+YWqSiNrQ+YL/MJBpgxz
	gT+GGVE48XF0r6DnOdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souDH-0000000EaXK-30f4;
	Fri, 13 Sep 2024 00:31:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot4x-0000000ERtk-41sg
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VBBK/J5ZkF8zw3prIEqqwLEmBIMH3Wf5Ldc6S2vu7i8=; b=P355EAGqRT9HTO45BF/jZ9eFJi
	WRMwCXrTPfENnXBT6MmHVQxFRY64TwUBBZAh1giw8YD8qF8SPV4iiZPGi5+pZauF0DDgv4CF2gt7W
	aP/AWEMG5qU8Ur1NdxgELZ9Ri183w8mFi6SaObwsI0FursxJJX6BJ66E6oINdEakM1C/XjBJnl/qq
	FxOXfe5JLABIsSg5Dhemm3bx5mtuiPk9gNLQ7Gmpf3uRKt2n90CmpENaCy8cpY1R2v3O57XsYNfDY
	LNQwtsVvn5SIdUwbSBksb9cIL/HQzknSEs2/jFuD3I7FutFU9+fksFoAYgnw6OSuRHEsRhq8IT3Iy
	ainV72wg==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot4j-00000000Y8b-1rsc
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:18:16 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d88c5d76eeso279640a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183087; x=1726787887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBBK/J5ZkF8zw3prIEqqwLEmBIMH3Wf5Ldc6S2vu7i8=;
        b=Q5lAwjhxmM37lCSGx0Tvq2Cd4Uu3h6Xa7Ip8ARN7E8Y/F4Ywc4Df7x2xKIaasuExwk
         zoXb4cJTstyOQPfDM/Zy/Tpkjy7uz9aDGgO8F0fRiONPHXH1OLpfXaG3BhbIjDehzqza
         Wrg9/Y66eQcBrWUHCYFv+KN5OwDri571Bs1Yi6WlqKIIenFD7KX8iWwH1aKdOZ4Bt8zo
         0a+YS9DTjZDu7YAPNcqSUfeINbFfvlQF1+CoLnM2JpIco5wdymh08SzlpFPwQnc5FPxN
         Bfqyl+UctSceDcJMZ0AjDnbuCVTajx2UmA+ZmFdiCbpYsS+dzVGVKXozD9Yaa45mBCqF
         sdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183087; x=1726787887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBBK/J5ZkF8zw3prIEqqwLEmBIMH3Wf5Ldc6S2vu7i8=;
        b=w96u8JcvLHp07k6AChGMtvfqpMDmHYNzii3XY26WWTceZsMu8rMxVNZ8DZ63c/qMWA
         hPM6G9nx6UqDM2II0cHFeNRENYWftgJ81sTMpsXT+Zwcxtu9VbX9cd2fJxgdhI+6LkSQ
         XmQ1qhjp9tgmUDkYFtAs7KRnhKTMwVvs/xK1Lzb01ILoF4pOutLHmbQlCwXyKlUUnlII
         W7H/VV/z6YZ9vcqk1tnZv/TH6cRGflWfcSsCSS9/kePL7Eowx8gTsob+KKwnV9Wx1VuG
         o0RsHFSjiv+JFXg2Cq7x1rZJ/B5d6M/jXkRCiZbKs+qjwnNKKrlMdZE7M45grr/t9uLx
         7T0A==
X-Forwarded-Encrypted: i=1; AJvYcCXCi1vaXZEPT2nqbSNpt/hd+BD2+SjguK6ljI5qOHCuNIOAaS+4TemF2xsOVUbJm/V1v0lE6OR4HxyIiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YztZnPVb2h4Ce2uOYaBcEC3VSXh957rMWG66oSNqSekpCmnvcif
	hspgjMVtYWfS6EeRN1T5F/OJWrfw54NHJqOD5HlX9NbHRcrTK45xLP9xqF0zlcw=
X-Google-Smtp-Source: AGHT+IE7QT3LPeXx/i7CBXip6JfNZehNxjoWUrudSu14L33B4uvstSRbHxig02g+rV2oP6p01q6aLg==
X-Received: by 2002:a17:90b:1c88:b0:2d8:9a0c:36c0 with SMTP id 98e67ed59e1d1-2dbb9dc0f39mr1065039a91.8.1726183087183;
        Thu, 12 Sep 2024 16:18:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 14/30] riscv mmu: write protect and shadow stack
Date: Thu, 12 Sep 2024 16:16:33 -0700
Message-ID: <20240912231650.3740732-15-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001813_866745_C1F2D223 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 30fd4874e871..3e05fedb871c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -606,7 +606,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
