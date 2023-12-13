Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E46EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZ//CbuNT3qodQVA2qsIs5AaFZetXTM1qAxzOhREtY8=; b=3GgVMbGWP4oq01
	5eLgCUBjsErRPK0tjbr3im4ex2az7J5lu5I/AtN47ZDrGIlH6nWAgQCA+UTms38T7h7rvKHv2gP1e
	e0bJ7cOREMUfTnj5hTMQs75+H2wO+uDncQ9N89uD+i+3qh1wAtmuCk/6SmdCFgg2LlktC1vrLTVBb
	KsuG4J44J5GcbTzQ5v0F3KYM7jkR9BUdiaPvRNAsMi6j8mF892I0m2HarIxletssXtY4Sdw1r/ywJ
	/iFVmdDuKwoBNByXn/3UBlCWHCaSAv02neMfEVjJnIrPn20x8qN7qnSj/zbXJ/gWu6FRHBZPIa4N/
	olM2zUn/pQyf+r02XWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPUe-00ErCd-1u;
	Wed, 13 Dec 2023 13:41:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPUb-00ErBX-1T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:41:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c317723a8so59522405e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702474898; x=1703079698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ49MRAnZaoKSqZNsnflibhrI2GDBa//jCKbcK+lB+o=;
        b=v+AZnC3ENdlIYYYIupaPPNuE1g2DBolW7y+KczW49edCEYOKwQEthay5OTJHkg77BU
         wYRtspO6spRZbz05TIb+1ZX5ym82CFzfpKuPLmt78XcZoVXo6mI9arw2pFl6K9dkIueB
         J4vqfwl+g37uSvrJiXSvTr2Geq1ftF/r6kfYxfvz1TRYSGHlvTpeocyrGC67FQcLc5hG
         2NBbGx2umq+k+hVT1QJvnT1IjnsUVeac0iU1iJRzHpb0jF7qJ+rBKY+qsOo5avvHo9FB
         Za82kB+murN88FcO4zXg77UfmKRzasAZaq20nWuTEUtqt/XW6DKKYvajiqFkThlEJAhM
         DY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474898; x=1703079698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ49MRAnZaoKSqZNsnflibhrI2GDBa//jCKbcK+lB+o=;
        b=B8UPuyMsbHTu6lh2oG0Jie3WHa+uphax/QQ+HYrO/dEHPNfWpQNl+qe7o3vYJu7TmM
         pn56tOdCP0n8xUFcdkDDd/mvVJIqRmbuwlCmfQjlnYIz2EFnscQfjbWqcwEzaCi4Fegr
         gOEmkmHipVRrgrZ/bT6LRPUmABPwrm/1tn5q9vzEmI90CHGih83621zxfoIQLcQT2B4f
         z24lhsK4BZFCc1OsUd+IP0fpbxk2ppsKgAhyRbOig2FCvEl2VCSOftY6uMFQPrl2ObdR
         G+zQFFJxDu0W0CUYuiazk94uWu3bcBP5ELwYHIBXOeWGzpknIHPORxpXBbE9QzzSrqhf
         kCCQ==
X-Gm-Message-State: AOJu0YyYHzn+gL/CqoYKUTb5GMJ7+s12D0+yANyQMbxQP9SIiW3rqBOZ
	og2vxBHQoXS/fMQk82M7Sr1LKw==
X-Google-Smtp-Source: AGHT+IFledKSQxkLvWN5/hdYdgtJiVfumPSWSLZ+0cxSIF4oZd6/yqylAtH64M3UQVWfAY1CCImLFA==
X-Received: by 2002:a7b:c4ca:0:b0:40c:386b:9356 with SMTP id g10-20020a7bc4ca000000b0040c386b9356mr3819421wmk.72.1702474897639;
        Wed, 13 Dec 2023 05:41:37 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm23043332wmb.9.2023.12.13.05.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:41:37 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 1/2] riscv: Fix module_alloc() that did not reset the linear mapping permissions
Date: Wed, 13 Dec 2023 14:40:26 +0100
Message-Id: <20231213134027.155327-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213134027.155327-1-alexghiti@rivosinc.com>
References: <20231213134027.155327-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_054141_495024_F5BC388A 
X-CRM114-Status: UNSURE (   8.91  )
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

After unloading a module, we must reset the linear mapping permissions,
see the example below:

Before unloading a module:

0xffffaf809d65d000-0xffffaf809d6dc000    0x000000011d65d000       508K PTE .   ..     ..   D A G . . W R V
0xffffaf809d6dc000-0xffffaf809d6dd000    0x000000011d6dc000         4K PTE .   ..     ..   D A G . . . R V
0xffffaf809d6dd000-0xffffaf809d6e1000    0x000000011d6dd000        16K PTE .   ..     ..   D A G . . W R V
0xffffaf809d6e1000-0xffffaf809d6e7000    0x000000011d6e1000        24K PTE .   ..     ..   D A G . X . R V

After unloading a module:

0xffffaf809d65d000-0xffffaf809d6e1000    0x000000011d65d000       528K PTE .   ..     ..   D A G . . W R V
0xffffaf809d6e1000-0xffffaf809d6e7000    0x000000011d6e1000        24K PTE .   ..     ..   D A G . X W R V

The last mapping is not reset and we end up with WX mappings in the linear
mapping.

So add VM_FLUSH_RESET_PERMS to our module_alloc() definition.

Fixes: 0cff8bff7af8 ("riscv: avoid the PIC offset of static percpu data in module beyond 2G limits")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index aac019ed63b1..862834bb1d64 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -894,7 +894,8 @@ void *module_alloc(unsigned long size)
 {
 	return __vmalloc_node_range(size, 1, MODULES_VADDR,
 				    MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL, 0, NUMA_NO_NODE,
+				    PAGE_KERNEL, VM_FLUSH_RESET_PERMS,
+				    NUMA_NO_NODE,
 				    __builtin_return_address(0));
 }
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
