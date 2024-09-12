Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B087EEE271
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSfISXcplEOdc0gY1Bm1NvayhVw09GKYEg27PIlkLDw=; b=Y/2GZFfTozbFQV
	YScPLj5D/t8KGtftAssg8Af+48fotIlsTV1P2rhOkEbPw8J7/624NBfYyarR4sgPQtqCqmm6pwoXc
	l8fpCkiTuxkuROvelvktCQgy9gjpLcGjKCApHI80jsA4ErzDUoVwoOALIIZLkNbzu2VXv27m8YO/S
	pFa96H9h+5ID3ewvN76YQuD8Q6TX/blyPc97edb3n+yJr+pkWoDrHjJCRpsD9DAb8Ak/zcnC653gP
	vmuwBWBBcJ1eh7zRFMqhwK13uT3EUfCPcMzs3Zu1FG23yHNlIV4ZaBAEQVbCSxVT5H4udsqDCbCeR
	McwGL3+ODL4f4cl3RngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot3t-0000000EQuO-4Bby;
	Thu, 12 Sep 2024 23:17:18 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot3r-0000000EQsP-2VkG
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:16 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7163489149eso205941a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183034; x=1726787834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=067qKPjJ+n9l6Epc1eYM3Yt2z4Jj28HWHwDjljiSStY=;
        b=kdJMTqmun5hA7d5wTyjSB9ohrG99HddTGedm2F5NssVucmn1mMQ+qjrgrwxAnh19bS
         ccweLNk6QHGGCJ80HU3TEkrrvUaED0hNtfcy7SUm/cs+4+1sEKttuDWTO5Ahf1U8meiQ
         DUugVB15e04VJ5Zb66/uQD1aFHgu5RIh6WQ7IClXeoUedXJjgNIx0uEHutITrL2+rYnx
         zB70XIidW3x/V31VNbKL0WVzcOCAK4ST+a8JSeBGEQg5rUlymxrBCUgefbUi+Q8SoAya
         uTAmF3gMK4oOswevmrpQcpiVRtT3sw+fSBtrEkm8G+sr0adPOBVuP/oHhah3pg4cuWz8
         /pjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183034; x=1726787834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=067qKPjJ+n9l6Epc1eYM3Yt2z4Jj28HWHwDjljiSStY=;
        b=AmAOMBZ8Ny1K0lVDsF+ovh01TtL0ItyuCRK4SlE+pWQnA5R4wBRBiuYeth1PmK1Sj+
         Ik+hrJAoVH8Gn3DCvyu4zB8lOwUGeWMEO6bHZeWi0uA+pVioorLmj91psz5z5r6naPu2
         KUVAhSQhznqaEeFeohjqquWVFHpPEA4FgIALpmklu1feP3j7NlOGE7eHfQ/d0MQrjRgS
         yYqFdogTerRnTtf0cOScagLOL6D3I/v9uiU4o4giKkcGvDrxcuWghF++7ItQX9ZDc+v4
         cGVRjcKrzxbr7avm4DfSO/NVq5Owhs70WD/nvKE+G2XKo2qRj8qLOfRNLz1vTu9uXWHj
         MJdA==
X-Forwarded-Encrypted: i=1; AJvYcCVOkfpq/mUHByOixXQSbVaqnIvTo/zea0O++ooF4xcHNSMpO/xmbnV+v1SIAC4YCBx45DKIV+IQMiVq7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywce/qgPlMRe0VrejLvh0yf5QQ5NKtd8y5Uelcy9/0pbu45G+TR
	Sw5Rpyj0jJVMJ15OKFnOVJEIFAU8ckYkglhaaLpJjOD4vaS4Wo31j/kCyCxiGF0=
X-Google-Smtp-Source: AGHT+IGUPoWnvS5/UyAev2mMCxr4fAbJAZEQ5NXGYl3k4LYiYl5m+yOy9I9Oauh7+qEP1ZcWno2Wvg==
X-Received: by 2002:a17:90a:d489:b0:2d3:cd57:bd3 with SMTP id 98e67ed59e1d1-2dbb9f3a7cemr1099703a91.29.1726183034358;
        Thu, 12 Sep 2024 16:17:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:13 -0700 (PDT)
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
Subject: [PATCH v4 02/30] mm: helper `is_shadow_stack_vma` to check shadow stack vma
Date: Thu, 12 Sep 2024 16:16:21 -0700
Message-ID: <20240912231650.3740732-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161715_686835_263A263A 
X-CRM114-Status: GOOD (  11.88  )
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

VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
stack). In case architecture doesn't implement shadow stack, it's VM_NONE
Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
or not.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 ++++++-
 mm/gup.c           | 2 +-
 mm/internal.h      | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e39796ea17db..f0dc94fb782a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -361,6 +361,11 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
+static inline bool is_shadow_stack_vma(vm_flags_t vm_flags)
+{
+	return !!(vm_flags & VM_SHADOW_STACK);
+}
+
 #if defined(CONFIG_X86)
 # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
 #elif defined(CONFIG_PPC)
@@ -3504,7 +3509,7 @@ static inline unsigned long stack_guard_start_gap(struct vm_area_struct *vma)
 		return stack_guard_gap;
 
 	/* See reasoning around the VM_SHADOW_STACK definition */
-	if (vma->vm_flags & VM_SHADOW_STACK)
+	if (is_shadow_stack_vma(vma->vm_flags))
 		return PAGE_SIZE;
 
 	return 0;
diff --git a/mm/gup.c b/mm/gup.c
index 54d0dc3831fb..2f84a0a80cfe 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1289,7 +1289,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 		    !writable_file_mapping_allowed(vma, gup_flags))
 			return -EFAULT;
 
-		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
+		if (!(vm_flags & VM_WRITE) || is_shadow_stack_vma(vm_flags)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;
 			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
diff --git a/mm/internal.h b/mm/internal.h
index b4d86436565b..f7732c793f3f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -798,7 +798,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
  */
 static inline bool is_stack_mapping(vm_flags_t flags)
 {
-	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
+	return ((flags & VM_STACK) == VM_STACK) || is_shadow_stack_vma(flags);
 }
 
 /*
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
