Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D30CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1FtfUisKvpQiL1MSlQfIz2dw9XTkMkmO/UCGgimYjg=; b=gRs51YgwrGwZda
	ZFQWfCWq69s6Nzvv/nBAzMCMi17GsgZD9TvZW8TPRChGEX11dBA9Nae52qWSvaaj93pmK5ysmy4/b
	fRwm46biQeOKVC+5LSkNexHUc5cdY6vFhRShRdAV3lCbdFPFzC8kNsQMN5FpVdfHNCiRz3Dpr8YYq
	iVcgket41LDthnyrDSjylhAPIEAFGzRQBdpibWO9UlBIarDZhsmQzCT6AcvlXv/wFGv5lfSX3mKE/
	cMQGLNpg499+E0FlcImD+d93x0pHam28d5Zj9XJrVmCkZQ3ziz45gk9FiPZSI19T2asZgJz9Qs+OU
	O+gOL93tNhuHXOC3nIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFw-000000025uX-09yH;
	Fri, 16 Oct 2026 06:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFt-000000025sK-3CtA
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=D8wzhTorlg4F8agI0L19Vfp9LT
	o6XZ4+Jw2DwMUjJ+I2lBU3b2OohHAHZQ/zO2A0G5SIE3J+wu/2rG+2toBK6qv5zO5hNfwU64Tq4vd
	7sF1WzpaXYF8jsgkpVsAfR+uvoPdfG4LPr5aosOUeLKToIa790qG5bxnfMxHjnVnvzFbOyImKiZUF
	WpVTA3AjEJbZBLhU2BJENGDJJB5AuVE7gOT7c8BM43+XbghzIIn8bO/fLL4HoEbCO2qZA/uTlN9PK
	uKL7wG3QqrFOXJC+HDffeWcVg9PrV8OmQ+EkyPRtDfHmMGuOagtqcYNKaNLT85Bi2FnLRyQkloe45
	LgUFRjQw==;
Received: from mail-pz2-x08.google.com ([2607:f8b0:4864:3b::8])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbFq-000000019oG-1rYA
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:24 +0000
Received: by mail-pz2-x08.google.com with SMTP id 41be03b00d2f7-cd613507bd1so462356a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 23:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131441; x=1792736241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=Cjx2NQscwvQbQHj2sCAZMsDA2kMIFvCjTuhiHgWwr86jsbxyXlJnH5r8ExBIHiLNEo
         QtyfDo0jIgW7YWSlWampYMbIMxllSE3weKqkm6AGMnYFqMEAe6Uw+54BHAqLO9VRaEAs
         ba4MoaYr1zpimPASjPn3fYBZj/xm3i4r6xapM1rvQe1RCvb2u80Vu7t6aCBlrVPQcYgF
         //e76eYTzP0vGXX5EqKC4JZU7GZhzqnR9OrgZpNs6mr4DZ0A0YNi4Vl40scwHup0kfD6
         2XfP/rOU3GbWC4nfaJyk0qHgLXVSx8hpkoSkJF3eGgQDaGm2anHX0EEuvHMS/CxrgYJ9
         /QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131441; x=1792736241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=VGIFAFuCVhDpF2jVoPzZkbB1LeLC91eycjLphL3PqtwIWL/a1q/vA2iV4kLDPrTHVW
         4Vquui/tPFnYCr9lY9k84oAifbf7CrDCoHvMEAEiyuOjc672aD/DSg3KTEzMp0Zt8dRW
         HRgblimoWvgErO3K8MgTByqhlqLN2BiSidrSYEDwzr+5w/tZesNgurYorkaRPOm1IUyM
         amtwarCueSF6VXFle+O8Sn2z0d27osP/8fBJcoNIZmAiCmkf87Whg8Ya3IAyA5mRWU06
         QQ5UCcATZiP2n/8h1Ttoy+i2bqGgUOWDm00XbzFLJUDiC2anNpGPUjp/aiYVliqJpqjY
         SY0w==
X-Forwarded-Encrypted: i=1; AKwUvBwwyFb5hyBoSO41AeCpRPGYWTpwFxRefFy5XE2sj5XtFJ2g22B8oimax/0gbbTWh1sQEJc7NWQ2ZjEktA==@lists.infradead.org
X-Gm-Message-State: AFq9FYK6b1igVKQTE6dpVioKzPXx4qDjwqA1JdfRNvKX+9g4jub8exw8
	q8YlfPaclH+D1U1Dl728TNzbUcyXJt1A2wZPn/KHIpGDnA/ZdvdprX0f
X-Gm-Gg: AYBFou30aEld0fEFdS1A4BXKJH7dArKYosFgtRcoFDW8DMpCHCaa75ejA30GULPcjfG
	p7hHPRgpPpXJCHiCnDYWZqtlvym7zwsldyvj9ILIeglmt7zhcNPva9kJN7earK9TEabF7wUSX+0
	CdBRZGfd8irvmc1CWU071t1vHNocuckgfNdOiSuchaISwf9apHee0Lv71x9l+G7J8O9EMlqN+7E
	NqEqalE61/aP9XkanUJAwugTMh9eoGy87dF+rraEIsza5QQv9svY5vlKOWAK+aBHmxzM9XI2yWT
	wBihFZHP+imy3RMlfjkobcKwzM1xzRuX1CKtChYzIOsblI9gRpkTWQohfUpTmzxjnWruZ5X1Mtt
	WLSjs0sDzglc4uq8mF8YrBA/Cn0im7nwXwJY3WYldJoNy1hEIYDxCc5kv9sQehfJ7w4Qk0c5qgM
	sf4Nn8madKwKFH8VnNRp3zfJOeJhpgTlOLfjfcdvxrfro7cSJOG6zyQtxnZ42QhJJaCBthOEsxs
	ldeyR+7ihMW/3wG32jfsA==
X-Received: by 2002:a05:6a21:1f8a:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3e1d04198a7mr7196697637.16.1792131440647;
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
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
Subject: [RESEND PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 14:15:47 +0800
Message-ID: <20261016061549.4181390-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071722_882871_E0A9A74F 
X-CRM114-Status: GOOD (  12.49  )
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
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

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
