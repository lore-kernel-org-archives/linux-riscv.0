Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9FEEEE273
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvjkvUy+2Q6J7QJffaRyc5KbNQ2ps/8dvaoO157Ew3s=; b=jCgEB3UseV3lSH
	Pd6J4lTCJt+/gpLv0e1EeSEXqQlOHz09PudDUdipRKnamGugw5C+LD768ApU5LxIcreXGzZoMEFev
	HQy9GT75yj2q/kj81OLuYxKJE1st2amxAHFhf+tbz4HAmD4SVbUT4EsmdvFbxy1HUM0NUD4SGeiCS
	1CURzRMOjoa3IMZJtHnHsM/X4ut2RxxedNFk9XxU1aVekAoTJcrNfac76WfDkLLuvahuzzXD9AQ0m
	x6rvkTf5eX5HMljNrWwYRjAxBDmZUBwQS8JA+6GGfChyhHsDIGLY9kpcWHB6Xgw2rU7rGIlGxTIYi
	s+DeGVTNyqWZv8aZiXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot3q-0000000EQs8-18hj;
	Thu, 12 Sep 2024 23:17:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot3n-0000000EQqF-0YNa
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so1123231a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183030; x=1726787830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nw1dKcVSLCCt5un4d6VomXZplHXDD/4tgdiLE024NX8=;
        b=tmfG9S82oIDnPubgrnkO7YkuSSk0Hvh10O4GmpNL73ozyHhO7AVcJ0DgXNRsK9walc
         jJVvJgdI51PjO6ieWN+BatdA5cji1s/jsZpmxX9wZ/NqzdAv+nsfZMPIDAlPmjZgQAQb
         1yqIsXqfsu2uprxVTqAHirgKDb5XI3OHURuNRxtMYvUHVHTiNjU01m4FauF5UG7xiGpY
         TA6wz4mizbn6rkAb6EHX6t6iUaY7hSs6L29siN4O0Zc4VEzLZen4gpAytE/9+3A2Xiay
         wAlS8obRZYYEWdcnXvSYoKUrXQdEWrJOmtUMNE3O/WuCmDUJy9E8LfJmBPAARry/LRWu
         5Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183030; x=1726787830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw1dKcVSLCCt5un4d6VomXZplHXDD/4tgdiLE024NX8=;
        b=VS+/GQBS+XnxGLji2eig9LUs4i1N1Lo9sm8gIWqa8HGUw7HELtEHo0uoqmdRk0cb2J
         in9QTpizJ2qQdT5xaqHAv+UFtriA4RgIiQxJh5sDMZkYniEWX75L1FWkm6ggyZScyIME
         tWDwijdAR3dPFkMojlX6XuVcZi0WVBsRyBImPzqC6dntGPvaKd3mr2rtTDJSqSoDB9CH
         uLqKmEbVVs1CntYmCNSsKF2qSb6NXsWzgAOhLbQ2HWpoNJHUvfHQILMuKLTgk3xdUu/o
         +O7TLH+3Ab9V05/AxI7EykRGc09oMrNhjbk2dDSjdpWYVOG4Rr1U9VYHhuVtT+0ZpF0G
         olSA==
X-Forwarded-Encrypted: i=1; AJvYcCV4yFhwXT2S2I1WnTevUolDG3LcGoZAiLP6mPwyXCT5Cd7UEdi3xWFvVDFiQ4eEwe9cEuXINA3uzBognA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN4EQE9wq9kCfwMDwy21bCGpt42XqRhMBO9dWWG9vNcmw0QcHB
	kyEyV36nUP5kgnpL5pXr5xzyAkRraZX7UOAx1LDNG0lQsCVfIbJPwhsM41He+g8=
X-Google-Smtp-Source: AGHT+IHV0R4LSdRMN0UeGhZXF9FypysCDDOC5LIEh5xrA8oVwZ2edglc2TZ3k8QjvVsKUPvcjGWQgQ==
X-Received: by 2002:a17:90b:17cb:b0:2d8:e7db:9996 with SMTP id 98e67ed59e1d1-2db9ff93f7amr4718623a91.13.1726183029966;
        Thu, 12 Sep 2024 16:17:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:09 -0700 (PDT)
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
Subject: [PATCH v4 01/30] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
Date: Thu, 12 Sep 2024 16:16:20 -0700
Message-ID: <20240912231650.3740732-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161711_206028_21F712A4 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mark Brown <broonie@kernel.org>

Since multiple architectures have support for shadow stacks and we need to
select support for this feature in several places in the generic code
provide a generic config option that the architectures can select.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/x86/Kconfig   | 1 +
 fs/proc/task_mmu.c | 2 +-
 include/linux/mm.h | 2 +-
 mm/Kconfig         | 6 ++++++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 007bab9f2a0e..320e1f411163 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1957,6 +1957,7 @@ config X86_USER_SHADOW_STACK
 	depends on AS_WRUSS
 	depends on X86_64
 	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
 	  Shadow stack protection is a hardware feature that detects function
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 5f171ad7b436..0ea49725f524 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -984,7 +984,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 		[ilog2(VM_UFFD_MINOR)]	= "ui",
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 #ifdef CONFIG_64BIT
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 147073601716..e39796ea17db 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -346,7 +346,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 /*
  * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
  * support core mm.
diff --git a/mm/Kconfig b/mm/Kconfig
index b72e7d040f78..3167be663bca 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1263,6 +1263,12 @@ config IOMMU_MM_DATA
 config EXECMEM
 	bool
 
+config ARCH_HAS_USER_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for userspace shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
