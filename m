Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E710C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPyTvILHOOYU4VOlZ1wWx9cRoxVrLDTeWUepF6lEwxY=; b=Pe0FZYlJtF0vJ2
	xkTU1sPWq8Qp/E+bpn4XXIFYugODQ7wpsDhQteGdNnYS/ORsMS/FBpi/E6EN7gcEfU2yXwqwPHm96
	v/sYn3umbpnEvKqybERpOz3bdvJxj4QbkMx7IrRHqyHi0RCP9FbkSuCianDW5IqlAsCQCmIaoO41q
	aMQEhm4kj9b6Enu8VDsdw8hq44Ab+MVr9BGqdpQzpjg8vb7rwrxvMrvLdNDNwwwIotKOMfy9aM8sQ
	uHC3ws/MshVpiKdM9smqoBTJSijR1SQ+eAnQjdggqJz82PGmRc8r85fgejuLWzi99S3PWlxngrctP
	fx+BaCaKUYjL7CkSXMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStF3-006lBN-2k;
	Thu, 25 Jan 2024 06:29:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStF2-006lA7-1D
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9N8f26gdn2cRJikP5qLVCVRN7EIk5o+zwHdVnNZOBlE=; b=GAgbillzHwAaEIqigtTn03QoIF
	Z/raE/8aPCCVk72uiC4D6Yaqv+AZxhUBB091FO+M2p6Al7nCejCoJ1u5q1FZJpJtIUlPpuE8Cbtzi
	xJJJ/Tah7SdccQysaCgnu8LJJzG0VFUL4sEQqxEB3s7rKzFWXD2echkSfdQcGf5i6O+P/R0pSqtJo
	YQFafXLryKC1K7KG2cFTs4apPkL2hqrDAjJbo9N6GpnzK4H75CM/O5cvr8tIkrKq3sEj9tzOer15u
	icdS4gSdda7wXHQ7kaxik/e48v7EHHGYO0aAeOlj1onCTGIKTFaZqS6Sw8064NN9xKc54dsTSDTTc
	rEZ9NKBA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStEw-00000004wXy-2gMI
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6db9e52bbccso4043928b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164168; x=1706768968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N8f26gdn2cRJikP5qLVCVRN7EIk5o+zwHdVnNZOBlE=;
        b=UsHJAtuXsoauaXmtyApELgt9F/E8Uk5uHiaq9Y4UVI4i4eM03KTuJ0MGerQZR+SlPp
         G+kh07bJx+9NCNxLWRQOCv5hhfZNpxHMqlqmwU+tJ8v4aeaNI4FGqBHigjDboIej/JX/
         0l3IjPGj3haCLgJD2KW7/R3JnCWXHZ4tb+x17YKZwLHgjrJ7ZiPXGxibJpYMqczSlUot
         vx5oBvUeXC1r1Q74c8drMsvQNbZIc4uxdDZK4YCgliFGFxDP3zO7sqhHmOYto9RVDfw6
         eYuesbqRJ4UB94CtPljhoaSRmkWjxiYNmhcV2BgEXzFJ/aQCt4PWlFzlmUcb+5VytckM
         u5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164168; x=1706768968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N8f26gdn2cRJikP5qLVCVRN7EIk5o+zwHdVnNZOBlE=;
        b=jSQaNuTaRTC90m5dacMVcl9lTqTI0o7lP5+MMOK+ZrmjatFQsr31RLaEknyHoCd1bx
         OVUs44tsw4dhaRNzs3HQreSAm4qkzhEgHxNdvqA6n+xFmZi3n8jmbn4sQSMXnChefQvr
         gMtHOydI8TcSwZGh6r2Zwu6q5T08CHl6bBINbIhX/5I1aBX400hFD0y5ROAurtNVpR40
         oU5hWuSkJHqanHpO3RFALO+ylgg89P1eJC8uuK40UldKtnjJPhQMbzRhTW0hZCEqSVL1
         8d4poMpy2GdlDoHGRcXQ5oNiSTpaBJzXbTICf7ieocv/q431Yv7En3PpKreh2mgwst/l
         nKww==
X-Gm-Message-State: AOJu0YwrkIoCwyhvuuPicKEnuLpvsz/DJeoW+BEiFcAYc2uyoTfQcZM0
	g/d4VDEog0Efr28l6OrcPYEteUSbhfxJOVls7/RYw7/QiK0wCrOSPjFk4uOt44w=
X-Google-Smtp-Source: AGHT+IHrQQhht3UiJlyKEtEWAFFtcgqnTtiAl+0dT+6axrsGaLK/T90q0i7kfWmqNxjWPLmEJD8+XA==
X-Received: by 2002:a05:6a00:3d04:b0:6dd:a004:c195 with SMTP id lo4-20020a056a003d0400b006dda004c195mr250813pfb.60.1706164168419;
        Wed, 24 Jan 2024 22:29:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:28 -0800 (PST)
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
Subject: [RFC PATCH v1 10/28] riscv/mm : Introducing new protection flag "PROT_SHADOWSTACK"
Date: Wed, 24 Jan 2024 22:21:35 -0800
Message-ID: <20240125062739.1339782-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_062931_144634_558F074D 
X-CRM114-Status: GOOD (  15.51  )
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

x86 and arm64 are using VM_SHADOW_STACK (which actually is VM_HIGH_ARCH_5)
vma flag and thus restrict it to 64bit implementation only. RISC-V is choosing
to encode presence of only VM_WRITE in vma flags as shadow stack vma. This allows
32bit RISC-V ecosystem leverage shadow stack as well.
This means that existing users of `do_mmap` who had been using `VM_WRITE` and
expecting read and write permissions will break.
Thus introducing `PROT_SHADOWSTACK` to allow `do_mmap` disambiguate between
read write v/s shadow stack mappings. Thus any kernel driver/module using `do_mmap`
and only passing `VM_WRITE` would still get read-write mappings. Although any user
of `do_mmap` intending to map a shaodw stack should pass `PROT_SHADOWSTACK` to get
a shadow stack mapping.

Although for userspace still want to rely on `map_shadow_stack` and not expose
`PROT_SHADOWSTACK` to userspace and that's why this prot flag is not exposed in uapi
headers.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h | 25 +++++++++++++++++++++++++
 mm/mmap.c                     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 arch/riscv/include/asm/mman.h

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..4902d837e93c
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <uapi/asm/mman.h>
+
+/*
+ * Major architectures (x86, aarch64, riscv) have shadow stack now. x86 and
+ * arm64 choose to use VM_SHADOW_STACK (which actually is VM_HIGH_ARCH_5) vma
+ * flag, however that restrict it to 64bit implementation only. risc-v shadow
+ * stack encodings in page tables is PTE.R=0, PTE.W=1, PTE.D=1 which used to be
+ * reserved until now. risc-v is choosing to encode presence of only VM_WRITE in
+ * vma flags as shadow stack vma. However this means that existing users of mmap
+ * (and do_mmap) who were relying on passing only PROT_WRITE (or VM_WRITE from
+ * kernel driver) but still getting read and write mappings, should still work.
+ * x86 and arm64 followed the direction of a new system call `map_shadow_stack`.
+ * risc-v would like to converge on that so that shadow stacks flows are as much
+ * arch agnostic. Thus a conscious decision to define PROT_XXX definition for
+ * shadow stack here (and not exposed to uapi)
+ */
+#define PROT_SHADOWSTACK	0x40
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/mm/mmap.c b/mm/mmap.c
index 1971bfffcc03..fab2acf21ce9 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -47,6 +47,7 @@
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
 #include <linux/ksm.h>
+#include <linux/processor.h>
 
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
