Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E78C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnSppqmWu50MIik3xuc3WE8hxOIcgEYeJDQapQL0fEU=; b=M9f8SucH5MrvxC
	OBTgdmOHmE2SuKuwFTbRn8G1iulee4eXOff4Be47gX2IpOVBIktI74qdWuKsoodDXrcOAlbRc2ve3
	tZWRQWAHvdTypCwep8cKwFlDy8szMYjd3cJcZlGhCjdwTlgYE1JG8AE0/4qoZqu4YtFUuoR0dyNhV
	ABpnvZKalftnXYZNaGl+y40nMm6p9L26QAzDQ0w/vsD9WkG6RFagGs6gk4yF8fPqioD5bvQkv9Ee+
	Q2IRgCGAE/AFe71QgiUwtP8eI4C4sE946ZaHvQHNamVbX/ZOR3gawZfk8c8V166jPh7WKz1eKJQp8
	T4l7apBQAD2pV6ijfgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWC-00000005Pf5-3GP0;
	Thu, 06 Aug 2026 09:36:04 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruW8-00000005PZs-1iZz
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:03 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca034c989e2so1034763a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008960; x=1786613760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=Hla95+PRB/DtR20VwiFZ+IK4cGoyUwLht4Em59kjP2LDaq6hcKBOHT2WgSb3X5qp5t
         o+bJcl+gBxNkuYVmVGTaDuBrSVZ97H2FDtz+baEGr34IQ9Pc6DhmPscuP8l9JT9UbVxn
         TfQ3zQjtXe58EBFi4grZPLyNtZ+OaSocywF6oNqfCLkzXGMTH8facwOu7pLlYLRDOcpO
         4a7iEbblaKUACCF10RLJO0M8wThBzPuEFAT1JDLGKtJeIVC0MuRdXY6i1YuYp+u2DMdd
         chz2v2M/tvRNArxVVbezzD/YHOJydzEQqBexUynJIgFAIYvSKcwtdHu82cstjuQVJCb7
         tlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008960; x=1786613760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=KqYlWGqjkK+voPsEvziZFEMPhKkTRxbjXWHTziCtraOC+xTQuhMljoPal66WQ+f4g2
         kpvjD8kYL9Zv7waFFgDrR924mr/QouQbgP1Usx8Tt3vhdlvAekd9mpmfsUHG+cqk0iW+
         MeZQZLCjnv+WVkTS+fdjjLCFMWnnQd/a30NBf2/Z4fkFZ7kXXm32FoDO821Tfmw06IqU
         eE9adsI6nlH/xUXcEvpLNRtbUwAIkclhGZd6EF/86ESagUctL8LitkW7Femk1v7Ni8En
         IcdZVmH0HLrbIS5M6jVgXUnvppOxN8ERX0VlJQ+CTvS7z436owaWKsUGIloNEkbu0Ceq
         tl2w==
X-Forwarded-Encrypted: i=1; AHgh+Rr1W5s8YtTnYRIEO7lFQMy9/mrjw8n/940Yy0/CrTS8Tu7/F5UzWfHFJG1Msn00SWxe3hnWjkpD8oDxMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqim7EKwMgsRxpMQCveQnCoNqQdCLZtAOW6M+9EzD46anxg+lB
	bmx0mQRuxrkIPf67ykxuPptfw83dibKVDiifp8DzeRbvhVCvz4O/4w33
X-Gm-Gg: AR+sD13fqg8GV9U6xB37NadK+Mq42z+vIEu4J6Cs2GA/M7ESWry/2VmtghHKMxhuETn
	vJzuigca5n8aa0ZlF9KPYYveaY/4EioxOx9etBhIaY4ctt8be8lImZYgxPmVKe9AZIhhfQcmwO4
	O931QLDInU5Wr0kXqJB0TADwrR8MSl653t8b1rq1N7X2ZNHXcjV90/bbrzWV4Efyb2ZIVIfdaQR
	dd28yeENpzn1E9nOAzOtN1S+YflbNCcoopF4GyhaeC7vXL2bKAM7KBegWfyTD91BfrfBsfyx56q
	3vwoEw5NafWAhnrTDtBhc3XTET0n+N7CYkTn68in7jIso9Fgo3An9woBH7Kd+LljDbGl7UI42Sj
	UIcP/kBZg0SzCo8yZSMHg9VAnLrMu4UIjaAEwflYEkshKNyiq+xkc36GfWqvTo4qP1HFif1HSSB
	Ac6IGtNh8U95wbJBBbgmrmzSpPiqZVlQ63GBjtG0DRTTukes58AYIzfQoKtA+gAzTEKqSvWDhJj
	Do=
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr14478703b3a.23.1786008959699;
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Thu,  6 Aug 2026 17:35:13 +0800
Message-ID: <20260806093519.2907771-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023600_451971_9B80F785 
X-CRM114-Status: GOOD (  12.26  )
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
