Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E209606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O0lyoiGI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=i+wnR4Ct;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlCwyOIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1FtfUisKvpQiL1MSlQfIz2dw9XTkMkmO/UCGgimYjg=; b=O0lyoiGIbwrkLN
	3IjdYSLSwhVf4YFedagFbIGtxUkco+HHb9/JCDPxXq27PhgiSSVUvGFg0RCJzGNLlgLpu4RcqqGhO
	Q87QK7aDInsxxmSZaVba/UWCOVdMBSAVZ7ZZUeEYabn3yebk/KvyZyV+vjnyik5Qsfn+Qn+DyBRjT
	Et85zD+oMlUXD9RN2H0oFEI0zA5mbnySh8g48ctd/DIu8jRcDZco3jo2ae5K5G2/KED4OJPgV3X6/
	Ck/2eWs88JNvz5eHA0LxkjNf/J+lTCT+DGrZdgIp2iauqi4y4vwRQLlqj7esCdrbIdiyVrk4GQR+3
	RuIGWfhER6GtlFHqSpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRju-0000000BN2D-1Ut7;
	Wed, 21 Oct 2026 08:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRjt-0000000BN0j-0iMT
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=i+wnR4Ctb2NerXIbmY0MQ3lX44
	fHPCgeIrXNrg/aPnPgqi5K6zP1VRgvYQkJoZwV5pHj+rt8mL5Snv/a877rIMoUNO0nugDpduThHrx
	UUIU4C4eRTraAKnvNQweYnwpwxIMUkEiPlNSspvCeLdJnTrgQFIhLrQZPHqGjio5KjWcY9ejW4Xzu
	ka1y0Hwj42GPYE2CNac3V5SckOMFtW8/Dm2XToTvrbkU8j7htZ4ogO9AXwW6q7Z9SKNgk0pYTIvPQ
	OuvWU4QTLUdsm3hu6A0risDe6wRn44YqA9Z88Yzk4pAMPXuEwXGG6ZPwzgYolbl/ZLcYmXawH/UnC
	kHsxKOQg==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRjp-00000005bCh-33kQ
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 08:32:00 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cd69ca84740so115873a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571516; x=1793176316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=qlCwyOIQ3Robu1X4cChSrN77IdCbbiMMAcq5OPjzFsSax0TXr4efz01evrA4D0+mSF
         6iFMLRrSQ66FbnIgmaxd9vqSfjPogaNtLLLNlTRGEqAxxCUS+ol0yehD3VoIHkosmspy
         bFYMYRjdka91T0JFzf/NW6pm3tWJ3/FHpO/hkkOHk7npj4fHr40UNtIU+a+kgRTlUmKK
         gClS7cvW8zhjHy5iSCoPTUAu8BOpJf7lm/BpS8IFwxeGiHd1NjJug/bUmF+pR/NW7w0B
         vfwQGg/iKIJd96fEuwGIV2nA3gI+4wHMRlLwCbDOEOWWwkRFNmWx8NMKEg1H+mSN1r9C
         k68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571516; x=1793176316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=lVVLicPgEcByw+Ik3MjleNQ9guoHY9Q6r5EIhdrWiwZwHoMHBP3pf/0Wzt2CcuFmBi
         6k8EfozI/DknkgrpQrZsdiU5I5wstsj55Tbsdbu0bjPs3odNDx/hCaB6YMK9jK6rmtJm
         ivIDWreexSSjJPBA+47qfanzfMYRZM9VXEKsakUwwSl8Be89nqAy3A1rt52oRZEkBxOl
         bfO4yut2e4a16irKhSb0KfqMd2ZFcV9NJFDBeXwr6avKQ7gY/uAf5Zgc+0FBMquD5tp4
         uSjkhjsvJDDc5T5/BFMkSXNhy36gKROoS9+/+CDInKu4AoWh25kru2DyryWjKO3Fbqtm
         tTDA==
X-Forwarded-Encrypted: i=1; AKwUvBzJRur92Y7A18tsx6yYvQnKwxZtlBikCg88rh3fccFC53oYr7qvvDgKI6SHPySNYHoCsOTTbs9KmpF3AQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJMhGV66JeqD1tbRuVgVMJ8btR3dy95gewFxSq5ED1d8HoLy05R
	gG/HtwALTFdvMMZFsrp8x2n7Jy5xn8jFp2VTJpzt6NSP0m4x4VY59nPo
X-Gm-Gg: AYBFou1WAZuuNTbXM9bBhXvP2llFe8fhHTsfdfelyZy6gYnFu+SRK5uj89/l9LQ87yi
	lCXSkJFvs1mLscbse1Nn8tktWpRO79UFRtOG8QBmwJgu0urVYm3qgUgS2qZGln4Oxa0O/uf8WPe
	BMBazR0o8B7BKikDMuvyeWKyXcDV5FBSWws7LSTLiiQK3jlNIaA897fNLK95ar+EnwAS420f9ej
	1Q0sdtUxg2vgviN8oX80iaPXeelkHs3u3bU2gIRyTN09UvcUyN5DxtIVe52OqjSCZBTUvfZcG1d
	yzDyJu7dyz1OHGSPS62LxxJGV5mbVYml3kySk+ekF4l+aGzV8vTwqcPpUTSu226FQiRtps06k5O
	GEv5iMdlhqzCTl7B9L41oT7U2jV8kabj2di0XB1+OWTQ44tWoGli6VqzIcoOnSKYLErkFiuzca+
	9D80XEA3v7LFjw8HcwcKqN4ELihDooe6yxIisMXFxJSaS+fE0rdF3R7zizWVrNbfj2FMwrJx/eo
	LJGOr/NadK44Z/vJMtXqt8f9hYGZrAF4GWcpwAbEU/XPr+palfKjG17e339B7p4ywQwKw==
X-Received: by 2002:a05:6a00:21d5:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8a089de73admr1183835b3a.26.1792571515803;
        Wed, 21 Oct 2026 01:31:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:54 -0700 (PDT)
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
Subject: [PATCH v9 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 21 Oct 2026 16:30:09 +0800
Message-ID: <20261021083011.2170525-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093158_038915_5D8A595C 
X-CRM114-Status: GOOD (  12.87  )
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
