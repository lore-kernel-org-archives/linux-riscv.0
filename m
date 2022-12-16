Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CF2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 18:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BxZIrsk4s5/Kt+EZ97DFTMe7K6b9nHT6kOhhbSGOCSo=; b=sIo
	iIxLPayg56kBprS5UsyCGAfLDcHHFn7RwBbzryuXjnBs2EF30G/CGyQR1GSeA8sls943f+te26Ac3
	C1aAJtu6CdUN8Vl5crr+HXYxpR8lRfNCg9ihr1v0aOCAvBBCB+/efKaEHmhs74+yHKv01qVwtEBhy
	QdfQ7fD8X3+A/2ZZ78qglEAt+9ydzAKJj5v7DxtELgpWSMia0Sei9ECNfUfdRAjbdvPcgwraJETof
	xq3Lrk0Vq+EuQJSsiKjwb3OPx58SIyZzBBXDnPVEMcBWDMhl+4goIhpV+JIIIVrfUWlOIzEz0u77m
	FRWoaoYfExscdMspMAoiiE90CQG4rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Fmv-00HOaL-Fz; Fri, 16 Dec 2022 18:50:29 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Fmt-00HOZB-HD
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 18:50:28 +0000
Received: by mail-pf1-x44a.google.com with SMTP id p17-20020a056a0026d100b005769067d113so1990415pfw.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BjZwbpxLn3gByaRwvryxHTkFqJNY30wsjieUWfidJPs=;
        b=VWqUuN5rbvErYZowCg1/pmfZgfIIFDthapPPmMM20S7mNNliYmfwqee9p9fOJUaxZj
         ucLeFdbB9AC0M2uySkphj4QpW+A4ZTbTqv34xMMUGlGBIlSc+JYY2cxnhPJwxLyXSmzV
         56U4Nhm5hCu8a1QuQUy0C2nY23Cuo+QqeKQGMaw4hiCqzVNn8Sm55eD8pJNyaBrtRr0d
         ZH9VH/fVODDAF/TPIBQS6TRnQzmCnYsWasklGnjkuuYMzELuTp2Ixl93+Qa1gXEsvlYf
         8n+2pYpCRFmz4GkycOJanAVLVNh1oS+s5LhfUrS0fC/mZ3+pljNI1uCtTHq1vIr7H6Qm
         jzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjZwbpxLn3gByaRwvryxHTkFqJNY30wsjieUWfidJPs=;
        b=LgY58XzozLGj1lp9c3eWWClq9mmvj/1e8Z3sRjr31cP10Ukol5yb/xM4ayGH5/MCa6
         GrmZvrO1tRV3OBTec9s0IDBs+m/WGUIPlU2JP9j8jPaxUyiWdxu78Nc8c0BQH0je0jxC
         XeZT+N9B6CTX7voa5FoznDd9bTs6Iwi6b1qBiI2oHIaJLiHzR0hIOdhtTVBosmu/yrDe
         PQwj0VDaFn9EmMwdi8n6btiN6Rn53bYDZpgK57IYb3hHhW1NZ9Jz8dIyYMmarGWA1Pm0
         545SzWxqAVqd7vBNSW0HDDgTr7VhmmSR8cN1kk3EyEt7uJmXy6Bl17y6mSiiTirqGsqI
         9Umw==
X-Gm-Message-State: AFqh2ko4efHyxPm74L2WnexFF+1y+bFMvRYMhVpEu3YXJpKPRdPZZtlV
	eKMy+iUS6f59Q12ITzMZ8py1Sobf0hEGPQ==
X-Google-Smtp-Source: AMrXdXtbTY4wcZoIq66QjNNVaFSRGJXlhFBTm/CgZNQ6XIoYuHltWbT2VVPUyzr6dSnWuzA3EKE98ARxdrpjIw==
X-Received: from abdulras-llvm.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:219b])
 (user=abdulras job=sendgmr) by 2002:a17:90a:9501:b0:219:1d0a:34a6 with SMTP
 id t1-20020a17090a950100b002191d0a34a6mr22237pjo.1.1671216624664; Fri, 16 Dec
 2022 10:50:24 -0800 (PST)
Date: Fri, 16 Dec 2022 18:50:12 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221216185012.2342675-1-abdulras@google.com>
Subject: [PATCH] riscv: avoid enabling vectorized code generation
From: Saleem Abdulrasool <abdulras@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Saleem Abdulrasool <abdulras@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_105027_585592_A4E63BDD 
X-CRM114-Status: UNSURE (   8.76  )
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

The compiler is free to generate vectorized operations for zero'ing
memory.  The kernel does not use the vector unit on RISCV, similar to
architectures such as x86 where we use `-mno-mmx` et al to prevent the
implicit vectorization.  Perform a similar check for
`-mno-implicit-float` to avoid this on RISC-V targets.

Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0d13b597cb55..68433476a96e 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
 # architectures.  It's faster to have GCC emit only aligned accesses.
 KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
 
+# Ensure that we do not vectorize the kernel code when the `v` extension is
+# enabled.  This mirrors the `-mno-mmx` et al on x86.
+KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
+
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
 prepare: stack_protector_prepare
 stack_protector_prepare: prepare0
-- 
2.39.0.314.g84b9a713c41-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
