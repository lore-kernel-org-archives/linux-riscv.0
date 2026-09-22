Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D4EC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J16M13G4j8o89P744Q0H/zg9SjiDzQ/uA1zg0rlTH88=; b=rX1JaULr+iXEc2
	foQD3tBRo2k51lHvv0S+9qNMx9OBxU1V5DdW28Y56G1zcp7XZvutGpnrFCeqiuPfj+m135AbgKKbc
	8qq/zIBUw1LvxpZPgcK5TciQNXi7FQ/IdV0MiWSyk+/lRBkOdkZ7z9/aVRyrOqxTIaQBTDBCeQTih
	5zQnDasHSEvf+64Zxig8bxgA6bG+U8s2zw/TtIIdT3xP1yqglJKecjDsmmIqjEY2nUiSym6obI1rX
	ag/Zam+nlP8H6rCdxVeB3P9fEG7t2e+Kw56Ct65J6C8e5+ZyhJyciAZMxFMKdweUaih0JzD3L8pXa
	z7wb/wBMoUmQW836Pesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w72-00000004jKN-1Gzi;
	Tue, 22 Sep 2026 08:44:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w70-00000004jGy-2TXB
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=; b=P16suBol6PRDUXKkHWWtzA0CKY
	/Ln1sOgnfC2jQS51VafirdnudbH70kp8gK6XkH5vfN6VlQUMcEyQJ0IXZHCGoumx58mhGC5FYSHUd
	pJ8WDf9+n7uVqaQZ5a4IPFA9GAbKIfks9yjHhsj6DyQDjP1LswJIpkajaWMLkUHzegH/V8T0lTO5Z
	qPaW3BayuIgoItBmoEM3CSQb4xNDVoApkGKgSnHw9tvLRXfLRHb5mXk9FNCnk2Az8AQc1fHOCMcV4
	5wwePtOGDQ7gdbJQ4ZW1eaXs2JQaMDOCl9vK8mrYk+w4tJhVlgSBTtF8+F22q2j9/qzWrApWmJ7Nr
	6IVVKAEA==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w6x-0000000DHhs-323A
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:25 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so1798364a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066662; x=1790671462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=D2HAiUEUzd7tnzW2uBKe/LKJhmb4Qo/nFe/1xPm61RVkjLKytrePPzCUZoMLEriVlL
         IRApJKLTuBYQoXSanaEJF49RkF8BIGpnoItP+QoewwuZYiLWRQJ4+UYfhMLOkbWquwhd
         VH298OY+RDYPNnXpNAxbBVXlWXmJSE+86z1QuwNGid4OkdYu2tqVINwk/3g8TjSMose4
         kFaIFYxXoFuxq9DOmYxb8GesBGE/Lbc3ujufAQ8ng6YjCJXzFP4HSpSp0xaJ5yuK5lqd
         OHjLu+ArgEsizFkt8OVnsHMMfqyCZLPFVQJOmWrcsLeXYxyPwutB0ThdVyBJRD0LpB9h
         Mrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066662; x=1790671462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=vwY3ZXLcAE+XvhwPzZU/3rkaqX1oB+9yV/pu/vZMbemDYODe4GP5Nj1IKE7edWZYgS
         vhjacEmUATRkqtr7JnbBP743rrX5y03M4S4Ubhi8+PeqKGuDn/e++wBbEni093EGdqvb
         lZnW8N4R/d7XjU7icDQlhan/wjAMbvmSi+OpqOzG+AsNjrMoNn6O787VFQ3bysrjF0T0
         Q+9H7ax8LHng+U2A1EYtW7MrSP58JTM9dpW4lEJQhtshj5vxKaJqxAKuYdx14V8KwDF8
         r2HI21NELE4AAw7L93M0mqS8y4NzAND8R/YjjncXxvVYP8POYTbZ14HJMRz/tFR59m9v
         1e8w==
X-Forwarded-Encrypted: i=1; AKwUvByIJUaPebtLv8P3eqkhccXZx2yuJeYHYGD70SXXJILeVngQJK78rcopu/MaohVHQvwaNaguyO5q018e9Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kp8CYNMSpjFayVMpk4t6rjNMHusVcMZghmRDKE5/o/gy/dPOgz
	ZxJp4AVj2WYW3npS4p71sz2kPWDv+GC9iYxWNoq2Gy/oxxToMP00v1yA
X-Gm-Gg: AYBFou0tgl3H804j/cGuV7wFA1REBfAadqy/BUQLxW3fW4RPensKQ8gN+UrZO9DaEbI
	8KCSLpSZD2dK++3gW23gpYuYejo83CMtp6D3EZ74BmFvjy8uzWQWCMQJqmXwuUpAxU70B8bdrIk
	A746GbWt1JboioHjic6UKq/bg9u5XvqQasNXESpNrN7Nw7fj2K91fGOf3ixUHQ4h6f/jD2qD2gC
	UjkFuliM5qLNf2peojjowVSRdjGTz8HL8lAWpC/hIw+AcX1BCJjo3KupEVt2+GWmetQtRniCsrZ
	fWju8cuIVoKOHMlImL6edyI90ENOcYnfjnAYPV7lXxNVV7GD5DKeSl/65SgSCiEfuWhZxzOIiL9
	DWa9YOKSySKTjRvO5RNpiegvsljhB7y5yj3HGX6c46tdwpfFjFntbuXmCuAXMfXxU4VgiqzSuZ3
	xGVdf2Sg/F19L/G/nU6h9WXYLf9OAJ//xsUFwOFyyxvhW0VLRaysVlPEhm1J4L+V+puChbFbUxn
	LQdXVFI+I4=
X-Received: by 2002:a17:90b:2ccb:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-3a0731e1df7mr452432a91.20.1790066661956;
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 6/9] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 22 Sep 2026 16:42:53 +0800
Message-ID: <20260922084256.1515554-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094423_944015_20F422A2 
X-CRM114-Status: GOOD (  12.58  )
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

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

The dumpable flag is also used to check /memreserve/ entries for overlap
with other dumpable regions.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
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
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
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
