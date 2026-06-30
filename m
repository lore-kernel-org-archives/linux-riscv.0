Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7DC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XW4sxOXx+vVQ2q15s1zMT6QBLiIL751fQtJVKYugKVI=; b=X4TrbHUnKc2sQe
	4dqYW0uHlleqHNXYeD8FiEi7Ay8Ji7Zxy3sD0Ql+OmEHGWWsZAtbtqa2GVw7SO7ELQ9M7mTZ5+5el
	ba8xYZCLlU/DPsEyKKfJSCAH4FA3coFHzD54nB3Dm7XAy9pKWyRkE05NIUYr0qts7BrVPH0iif9jH
	mxDrp64xlKAZz4rM9BpPPGRpx0h8bhq6AyCVKGcOBmfz2u08vtZ205EQ7v8BzwHxWm00f2LsnfkI8
	wGVBtI1aXlI7LehzY9KwUZQyJrsf3vpsPQOuhoIEeiKwxLahUwr8EeyA2F4FvokZhpTwuS8OMuRTN
	ZdQBT5AkNEr9qaGLAaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCj-0000000G9ur-18KU;
	Tue, 30 Jun 2026 07:48:25 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCe-0000000G9pf-3puc
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:23 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso3258721a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805700; x=1783410500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=DkvYhZJ4mla3bTpfZnSeGNvJvIOhJmz0c3SrZotgyibR/5pVc+GzTlTVhjIWanSSjM
         UKMRty4+Y8VIGvpd1Ul7aNea5IiuTcMWeyaIMtkHl50xgXWZHc0e7s63+IDpndeJEQHE
         rEwJtaIZRRdVj32qNUZAxFj0mdbjtbNJKW5OdyOIOZ7/q4M6cih4nKO+sfwoGrFG/2fy
         vYqnqRw2ndKRLHoNv/bO7K8fbdzCzqLBoDq3TUmK8lqaa1G+fEop8Dx7FcpoZnyO4NEN
         5/CuSubvOjxRN6yqe+ASJLhyTkpYCwsX9GuRxlQlMcfLxYVZxxxQPJAZwSuqPI3pVQeN
         5WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805700; x=1783410500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=oHhYxJno+RxB4fRUfUXanF2+TtX6OybZ0EB3mTlOsysfUTdFrd1tXdvsps3vWp/NGb
         psOLhchtARxHynCeIZgxXi7ON3pnZovoyqXdroqpLiFhcdMPtqi2OMFN1thAITNJhbPk
         3BYwp5T+fvgoojMHu1kqnVTyQi5wM1e6m+hgpiS05d/2OH7OvvhwNFOWWB7pgwUEV5va
         VunhZXWaxAf0QWQ3R2e0Mv8Lk+u7M6g35qKfEDVVlgv8ZfBQqErW6i87wKA147MuxrMI
         zJc6Y4hNrgXop+4cdI8yEDoSqHGU559aHRlvDDON7WLgocX/lptWjZ5MeVO/M83EkXb5
         wZjg==
X-Forwarded-Encrypted: i=1; AHgh+RpU+6nM4ukv0qiDlFlIcCgVTO7IiwDypyX898mabnu5wr6FZ12jnpB3XCGfmCaVKYFKO3neKhTNRikNQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGK5908RMm3+dZTIjcf4j467eR86AY4EwlXt0aJDWeS5NrI8Gv
	22ME2dfrbxL8h6mXIsXPxaFM2x6T6t47V+jzljkjPjQWPwryrPa4vTdO
X-Gm-Gg: AfdE7cm2MaY9QINasGbLNz4h55tTAiljUHNKD1F8Evi93PeLXQnE83EERD4QueBNefV
	1Xxtm5jpmla2y6s+qdQmmW8xK1kZdWB2kkNj6Bbaxi21sqCS7piPHBp3HII1lPG96ZNuSo10U9Y
	i/Cr2WwaAp/e1VWqyghVaLjCSxPebTeX5zcVevB71liUvKk4UdaoUzOLUGl58t0DTRxQJQeZ2dj
	B0mqxp4HkPkHDvoLogQgKGQVOm0cWz0JsGMjVAR0bcjXM9AVGuGzLg9fXPNVrvlcNaUHzAU90Rg
	jSUSl/TmD9t8d70AhOM4W7XFVR+oBFAHdMfNubTH2fTEPwhMueQ66EBBJIsxtMhTOU8OQqqso6A
	H1n9Gl65bnzjJjKJiN3QFa2CWv3abrlV8/eixp0eQNCVpynBIPTmwbADGWCDPWO/hsnhZc1KSAs
	rWVG9GI0+eoRMdM2biIFG/X8x/Sw==
X-Received: by 2002:a17:90b:2249:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38052784effmr1969443a91.23.1782805700221;
        Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:19 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 05/10] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 30 Jun 2026 15:47:09 +0800
Message-ID: <20260630074715.4126796-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004821_378011_758BD743 
X-CRM114-Status: GOOD (  12.16  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index f754079a287d..63ff134dadd4 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
