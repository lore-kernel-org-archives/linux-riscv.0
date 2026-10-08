Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC434CA600E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXQldPyvHgjONN3pw0HVBvCrSEeF/CuChTmGv+BeWBM=; b=hrUnQ6IMKcjpkX
	1FQjeexW8ohlnoDveuvKO926+hdLri618rQsZQpD04UMyrEKYJnyBP8KlYz7IQ6PMK0RuTdlpmw0u
	CRcBdtvwT6stjVSOuvx9I8IIWNMV5cVM79njUoC3JGIvVrUBhOmemur8sC/Wv4h9VuhU71mDgjNdg
	DXyPl0Yv9I+PNAw5xK/gkPLvmymnIgsOa4QnT6U8Lk+Pa8SMLvBw8Da7JwPKef9dRrGBcqA0SaE5i
	1zY57FDKTGTbtx/a6FEsmpXsD7uNLQgamK54T8mOENMHH2TjlxrpphJszhDGtYm3JAUSWF9ivHHAb
	BPVWMV567X32KOi4Qp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiae-00000003kio-3V34;
	Thu, 08 Oct 2026 07:30:56 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiad-00000003kgt-0Pzt
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso232482a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444654; x=1792049454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=;
        b=c5Os7dl50L1i0BdCnODLvCbXRQ7cyAy11RAijNZhOqsKL1naVvTTO1gw/QSNoHctuU
         OWmUHKoQX9Ni7YE4IS/W9c5ZNmdeMchn/E/Dcq+Lq+hbQn30gAsPxYtQqVu73+5rjGWy
         PoVrj0oOSf5kZQtZxts1S1EkFwoB2EYKanAuPrxZhzFohJz4RgzBQ4zc9rNAijea0/Tq
         MleuTmFuzsr0WXMfvNKd1IgFFgMKwsZhIIo1rZwtR8OUKG6fjgErpmxojTBZiB4tFuS2
         qFHaUSArQoGhr3GI+0eNYH4Ih1MMLmAevtQhJVePLBz+i1owgBrRFXKTSM2jaXBFvAVi
         WG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444654; x=1792049454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=;
        b=HvPsN0ER+wuRlvOcK3MMNKgcTAWr81yZQYGXCE01vHx8xOZAmHrYWt8u3TpIzmEBDl
         GzyxfejAwkH/iZBN7mTKV4IGVtIAsEd8I+NElmZdTQRhb8dfOVGL0HhjR2vLIFPerCON
         IAyJHagaWYWsfYfra8FTUPRo1LXpZruVbu5KcIaMRTuwiJab3c30LjzIAyh8JszgEtYF
         gy9FNCT+4RVzUHeuCdKuWh2z4Kl+bOBwDUHZiaz0OSVshY8yS1/O5moV5SsFkoJMigMv
         2bjlK/CKbiVQVDm8TwFlBucyU3iGjVtQ2PXODRgnw8iYZihJMJproQiBsiTP1SHw3VPO
         A67A==
X-Forwarded-Encrypted: i=1; AKwUvBySiWr77I0avHjioM/TUrCXjYWzRrXSvfbU2dQM27pOwlRCqU6ynihuiaQSDo5uWT8MH/DOEueTN1aiBQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIb8mn1KSd5PjwEK8VznE5Js0PHMx1GK+1/EADCQJyA9eCibP9s
	kJhnGyG1dGIEqEuCbguLJVC4f/AuyoSj67dZVrz0lcJU3MkhSH+Uz8JP27q8D2v5hyE=
X-Gm-Gg: AYBFou0E8RLuiMgiRrof5ohPoGURspj1YtFfcUAG29va485BxYAla6WsUoTwa+sBf9d
	SQCqZhmjNQAZpfwQ4cTp1D8KlOcR/POIeIMPU0OaNdx2+J1LriBjZZGPAf5S2lF+1V6Rps3jddi
	LRdx5SpzzZhTcM3Z8B6JdJlSiilTB4NkdsfgCyIEu8o/mgeP7Ts/RU0C0YQzomNFheypp8uByQG
	BzJwWU7f9GAg5lAPBoG7RPVYrKnCRcgv+bJy0KQW8OlLVIkZZMX3I/keufJvL0FDYQtUaLt+IKc
	AU0d7ZUEUDylOVZMRdq8GacLXd3LLKeaQjJnO2E9uYQUPSNqGWLNzldlM5rJ5DnG41FcD15bMYC
	DzpgEnwx47OU5qhuhUs/I9sKK2kbIoNbon3yJkn7KIeMc4ze9T5gbMTmRoH3pl3kZyzxLAB6Kbx
	c8VLBN5MHLfmLkfAfAiBwAhxv+L/z1tdKPfLgll21aIm+aZYYP8q7ikRoum1/91WYyQvkROYely
	kZwTNiI07GdLTJMC6km
X-Received: by 2002:a17:90b:4a50:b0:39e:6c68:fd92 with SMTP id 98e67ed59e1d1-3aaed9a2992mr859363a91.39.1791444653999;
        Thu, 08 Oct 2026 00:30:53 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Thu,  8 Oct 2026 15:30:20 +0800
Message-ID: <20261008073021.2512665-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003055_143748_4012080B 
X-CRM114-Status: UNSURE (   9.06  )
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

Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
However, free_pud_table() still frees non-reserved PUD tables directly
without decrementing NR_PAGETABLE.

Free PUD tables through the common free_pagetable() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 429a0b015ec1..62077539ee78 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1540,10 +1540,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pagetable(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
