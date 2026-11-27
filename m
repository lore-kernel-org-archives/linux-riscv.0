Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DA606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3i4NDXO4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=G/+d2qqE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6z4DySM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lpYSPOkl8tmPSTdqUpFPVO44QLw7Dy7CWIZwOK4D56Y=; b=3i4NDXO43ySs6YkQRoLbPd9NUX
	HaGaTXXqpy5f2G+LH82AhUfUQhnpkPXIj6AqQ2mBfg7zSXAnbHoS8ygtHK2NANkJ4x3JPHo29eC3p
	6h9FxAf1Z6uJeHPyXgjyV8fvGuCjxiJaor+fls3R8Mia40XhDXDUMsQOPs0xf6O7gXR9WT6sBUefH
	OyivyhING/qU0+vzaFlojrF7AR6Zv5qUkBUG7SYOplvIhLdJdGbipn9nD5/8VsLyQlLNbYL7WxPaM
	zkpBWEO5VC0OR6KF4Q7wIBz1wiKRpDIzmlcu74s9oX4kYJQCynFHyGtSADSz+Z1o2M0MQj3LToG5c
	60eMilcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrx2-0000000FMvh-1Crr;
	Fri, 27 Nov 2026 09:09:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrx0-0000000FMub-3PJJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=; b=G/+d2qqELh8wBs6UkoINL2Nw3j
	w3Gg0A9Q0Zyt4udk386KAtLL7QhjN4aKvBMGh+21K6ChR++s3sNRncAZ0mGw3ZgUIJAeW4DyJACT1
	e5kd6GnxKnRT7DAmYHPe0CtWcFjB64dgj1OE9gtl7XX1Iukt1iGCOx6xC5ZAKYv5IizhrwX/JwOO/
	pg8gmfEkFaYnnuGOrxN+mRSWkrpS7xOnmhRMx1X7wrzj0GtsYDj72lTYeSM7b8pKNft/FyC3G9oV3
	8d9MJNdUXTcLTCFzcFCIAYz90Q09R2ezj9mVRaS8TX4iktNUmQoZye9KSJhqx2mvASu6YaxDxmEvM
	eIZyczaw==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwy-00000007UcH-1DUQ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 09:09:01 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so1403138a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770538; x=1796375338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=y6z4DySM5L4QXnUppOf9Wy6MzkYo9/VtzXYBQzpGDu3eAklQNiC7aAXUhXvMfY3u/c
         5558LqxqSQj8RFWY1w+2F0T8ltALZWVvn1AspkuTtU/Cdl2DBJzFj0zFcr0ItH+RX7Xa
         EZZa5HNB550CN6dtsHwwMEhsOuK+0RbsVUfAYlRZPb9qyd0sHCGBrc3ugNr2BMIkZ3+2
         c0ykFpwyVpG/TpbWr45YREw+nU4yiZ8guK7CtRcIvD6egc41pTiyetBNA2hkEZUZr+j5
         NR+H0rWKCSAGWPnYj8ZI4SEzgZlhMPWP6SYujYG8aIdVhCGMoGBZ1A+XHFdYhrlWL4w5
         Ue/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770538; x=1796375338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=Myo2ujLhMvJWCUzoE0RkNQLKlUVp2pzEEx5DpfxT5dMLAKkvgwvV4NVzvPsIS0c5d6
         EzWaI05P6lHXepyvXLhAyNK04vkPD8ye5jU4ZquaV89xs+0t3s3ffmUS06ZapUQou/f0
         t4DVA4Cujh2vUlPwUnxuy4pCcWh3PvZUjARkQXbBVaHyj3dm3BY0ZLYdHrU/2iAgl+tx
         narl5k9p2VM0ykRaaVLZx5x/Bhd/ft39fQrXLpAioc8p4WuKy4W7PLev3hAwmJxISf+L
         1Vt4owaI6YMlsKTeASAk5ZZMjz9OJolH+nmUnUxcTpJu4HPFjivvLZX0/cKMzoK9bKpA
         Ssvw==
X-Forwarded-Encrypted: i=1; AL+hErF94VcSXPFKnvJBQlOCWVC6ifq65ktZn+4Qg9VIpBGApo4jgrAKLiqUomy77/YBcsMa7l3oyMdSJwIflA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9tC2QQeTtcVIbgpxu6uc1VvIz6RRQStCycxNpX543tc2U9UELu
	WgZDB0Y+H1IoL2cEc8R6g/OTaeUAhB80GrpUlfQRKywjDkas4wI5QCHz
X-Gm-Gg: AZFdTZey+6GqtlzamWspdvPRK9ctSKPNPKq5ickTUy/5jxREImAbFw0FCC/AyJJeBaG
	VFUzgMhguNL1eVWMGHGrcnQz9DeN0McrN5ifoJoXMB6W+i4XUIh0JbgR59K+2Zm7by8PKrg2StF
	R6lVMjniL5XbyMW9q4zK5CSZ/lb8oOj5vlh16mgf5qZRHygV0/kAinLkhQKVgl5TcJvnu/24Yz2
	A2nq3TzOJ2Hdytl18EN86YoiD1zO5CU9vAn//pbb5s2HDyGnS5ZfDXyJD1qvvmDKUJ6gNN7E34p
	ogiDcE1l5y+JDPtQwRjaMsddHDqh/gxVMX8ZZygRUcdV8bG3OFwN/TrVurPSxbtKj4QUv390UK6
	klLDVlJlsBRR42jLmmJstb6DoF1o3sJmv4I7o8jvZO2uUTa/8908ucsSsb2MmdLS/xBT1cRTAtE
	bQWIiucR8mjtBAh0sSLscIJoo21miJ07J36BBAanAK3orSdIBZN6vY0nneAaLR9wsP1HhSGMDBw
	8sCMmjMypTnB+4LavnhLFry3tF0XwSSOY+5je2WRSHFNCzae5OZeuaN9/bAFjnR326orL6jJP5R
	hk5GWQviASndjpzMGrvHS7NVfAGKyR/ToaHpnG82RG0=
X-Received: by 2002:a17:90b:3d92:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b41c8dc8a3mr20396792a91.17.1795770538277;
        Fri, 27 Nov 2026 01:08:58 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:57 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 27 Nov 2026 17:07:21 +0800
Message-ID: <20261127090723.741253-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090900_279351_7E82CFC8 
X-CRM114-Status: GOOD (  12.42  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 7a940d1815b6..caac366bcb66 100644
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
index 865d7cd2f0e1..ff92dfb09649 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -555,6 +555,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
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
