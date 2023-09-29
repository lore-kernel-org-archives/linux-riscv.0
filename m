Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94DAE71D5C
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UazUX5vsJ737qSsU3mqMapAsB8xFm6oDOx72zz6frU4=; b=rJkQ3609fkA5Z6MRFusC53CZKr
	6xwNYhheZBJznSLTWjVkdQSAjnEe5PjM2L2z4C+JEi4/eJ62GHe9GXFO0M1p2RniBrN0+NAH/WBk3
	Xue1FP4fIwumJCwVh8qo6O/5r1+Wj+uWthqIDqZjLj9SMyBoZC4XVNzIynEpLWXIUIGSuvj2nSHAB
	YRvwxCpzR6FSn2okNnLprJY+pkezuwoHmSbECXDnd9pJIGnTTaX39OwFBTh7JvGIripuKgz1qbVmO
	UXUt8wbn2lkWh8zXYaPaacAXZzOAqrxNsg0qBp7GgyvpQ/HwQSJrQkuDMPj/zTdm5HGETIKzoQavS
	m+jKQZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKmP-008aUH-2c;
	Fri, 29 Sep 2023 21:12:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKmM-008aQz-0F
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 21:12:07 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c60cf79e3eso116693635ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696021922; x=1696626722; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19scQT+vZguMbMPGvwbswmmwWeMyYkP13y1R8IKgsdo=;
        b=CuRz8kPuvrycuiLFcbGWlyXKkuDZ/IbOe6ZS89vJnpun3yDfvjGe2i0jOxFrqm2TGr
         +zhZVuVwIZD17IC6AYqNShTPcExYS1uhWOUhJ7LlhUMKduar80nAq97XsUJS4I8SN3dq
         A7gSj9GphWi+H5R5rfTdnZVqEnPk1qaEBfyPg6k7UcawUUrDmJ5jRXVyuuK4VTUe+nMp
         vvFAxC6aU94x5JDRGP3DkP82C55vIIr+d7JKDjKTJ1rzzM8rOUYS2YqWunuD8uAYYUzq
         Wwfi1rW9MgEbogi5EKjb65cR9zC71k0zr0htvyOFDldwvm5FReFtnKF10slLWri/3hcV
         QbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021922; x=1696626722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19scQT+vZguMbMPGvwbswmmwWeMyYkP13y1R8IKgsdo=;
        b=vhBmTY5wWc8gg4CSRS/kKBb8UzQ1Xm67rHors+G6hzbIeNHVjTREURIn7Ni7zu9y/u
         rM4YcBrwjBCDEh7xCgY89E4+rmfLFbdfp+e85ANgtZez6Hv9+rIUQYPSL2jhJlNB2D2l
         4gHvdq8cRlfiNefxYqd3MMZYaBdUG/vto0vRen2OWU0jE7CpZTPNZddHuFJvwVLrcKSp
         eYl+hT3qE4fYIqAaIk4cZCopf3kaysjG45GX/tvr/xXt+5B2T2Hutgvdqst6YOQKTGBk
         g3EmQ3oBPcyQT/K3Jow79o7mnSaUjQM5PkRCOEaNZ2cAvHl+ooLu3soFxiQ6nOcjuOY/
         iFaw==
X-Gm-Message-State: AOJu0YwiAW6KGv+rl6+YZg5mXxrxMqJ+9rTheU+WHY2RuBjgPU3/uC13
	APUQBXm3/eMJSdxxvkcI3jTqCtBJrmKUHclrsf8=
X-Google-Smtp-Source: AGHT+IEu8pWqkhn949EN2w2MEEmF4sIQU2CD0ztiPLeuQl+OuKcbvmbHD9LpYfISQSvkmvSO3SxPVHDUipdN2Hi1oC8=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:1c8:b0:1c6:d25:8730 with SMTP
 id e8-20020a17090301c800b001c60d258730mr75155plh.0.1696021921796; Fri, 29 Sep
 2023 14:12:01 -0700 (PDT)
Date: Fri, 29 Sep 2023 21:11:58 +0000
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=samitolvanen@google.com;
 h=from:subject; bh=MSLQAq+u1Gq1vqQPv1L24OvfGxs9lQjVrKINsuZaDko=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFz2bXFheIUWsMCgpXroYNEMEHJSzh7lHXZPhb
 Ah07CUmBI2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRc9mwAKCRBMtfaEi7xW
 7oPqC/9r2/xEbO/XFpLcUfW8kI4zwGyW+1Bc7PLy9I1XUD02QER16SuVa1TjN8rJQPDmOMsvTB5
 T5jEE8zHkuv5iPAUTq/yfdsqgq7Z9o7WUqulun2nOY9Z455ZDOwLvbCIfEXhOthriqRBjm08Kd8
 068lN/FADXcZatUB50UlQahfJo08fLC7oUQ5xDGv0aXR6pnqONVNs/F1FhlysA15ZmM0HVhJePX
 6NcJ3HNNPyvbDbeafLIysEsEirdqqDLbxHXo6W0v7OFcevxKffQom+ZUD8w0SlBJsnrgLSQYfrL
 4SDgYPIT3RgVrVY58SpSU/IrpswNMkcW1oGV+VpuE8vh5HfISvX0Y/jFIK76jIL1xM9gdG/5oKD
 xSBdaJPOnpK9Gcze/0uC08IM5oubP3raIy1qzWvrbWFce1KlRfKgkHLVVNp7KcJmqHe0lhZqoI4 gKx2VGQd8AOM+C9TUeca+0u6bNkxxIvvO6e8Zupt2MkaleKzO1xxv6N14XGwr2/VkIpsg=
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230929211155.3910949-6-samitolvanen@google.com>
Subject: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_141206_120359_41B36847 
X-CRM114-Status: GOOD (  11.43  )
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

ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
potential bits of mmap randomness on the table if we end up enabling
4/5-level paging. Update mmap_rnd_bits_max to take the final address
space size into account. This increases mmap_rnd_bits_max from 24 to
33 with Sv48/57.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0798bd861dcb..ff8d21a6cb2d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -762,6 +762,11 @@ static int __init print_no5lvl(char *p)
 }
 early_param("no5lvl", print_no5lvl);
 
+static void __init set_mmap_rnd_bits_max(void)
+{
+	mmap_rnd_bits_max = MMAP_VA_BITS - PAGE_SHIFT - 3;
+}
+
 /*
  * There is a simple way to determine if 4-level is supported by the
  * underlying hardware: establish 1:1 mapping in 4-level page table mode
@@ -1071,6 +1076,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
 	set_satp_mode(dtb_pa);
+	set_mmap_rnd_bits_max();
 #endif
 
 	/*
-- 
2.42.0.582.g8ccd20d70d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
