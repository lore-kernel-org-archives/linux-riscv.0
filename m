Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F98C021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 04:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LzG/zA921bsImXODiAOIjQb97zfhLyEp6gLskyyJHw=; b=AXAe3PdIwTqHQ3
	LDf61T3fna/FmmkN9dOzkBcCeZ2KaQ3MWvOTCl2t4TtRL2F6N3udMgNAYL1cSJuussBo+ETYPWVQp
	giSQqHE2pEvJ4DQftpbTtbPfpYKF30sMxizMERCYOLD9Wkb1LW9QIDjhfVxJ5fUbj4nCTgv/t5jRg
	YTxiI6k+JVzGTvj32D7Uj9tmOnRgaHcD4zDJc3+GQnTP9D/1WLlM6rh4mOaKjvizoCHjA+JlWKas7
	nAdNFwcr/deLF25WJLgIfAKSBo0iaFI4LsCSmwIGqF2bCdISbdX2SmpQ/y9kA1kRV4VpWC0pXBCec
	XexNu8pwtb6P5Ubi69fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmmw9-0000000FyU3-3Ffx;
	Tue, 25 Feb 2025 04:52:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmluz-0000000Fu1k-1FMm
	for linux-riscv@bombadil.infradead.org;
	Tue, 25 Feb 2025 03:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=; b=fvKgqXEjWVU+kgzLwExkYCqVua
	VHOHQuDZsPDSNnfPROXtrf1xszDEw0CR0i1kdB4AWHizLhrAl1k2H8cnDEqeoqLkwGXQJYF8ZTDf8
	5SpMg5Qox/fnL2EGktq5s/Zb5sdyAV8JutJLqXEmHEMxSWM/JGTHGiKP7UUZgucpmZ9x3p8aw+7MD
	bT/Ef4F6nnpL/3lvXuoGSh39koEQtc+U4tPdvBou/8zL7s7gpmpBH2V4JYA33YGkkJmowBYKoJqP+
	lvwjfm3HxVeG/JVQbMV0bAobYi6zJW2rXB3FwfqxFzHC0MTeese9FKM9Kgo47MkPijmdS009fYJNy
	hdAABthA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmluj-00000003Hvr-06Gg
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:47:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220dc3831e3so95477855ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455238; x=1741060038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=GgvCjSq4Gc+YxCcULbNUSwIy1K+bzuxO+D+2uNQdFxpG4NU46lBD4LHmwV/k/8Ihvp
         o876JKEM3MDlCQpi0V3b1bEf2/t8z2ad2dLO3SEPSbYwkvQWdmSI84HGfXrUJSxIUWrs
         YK1qu1U8OiKniXuPXefl2L6tzfl8KFA1/Qe/a98Pom2Nsj/KQNjtkYq09jPP0DcNcgC+
         0Af1hhSYw6jEW337/r0bUy//n+NnrWhWBi9KkTmRH/rvPrHiYQErR2R2xHwFiXTS9QkF
         hgckEs4QO1FWSS2lq3kdo9UW24Ju+r8PonvS+r3mDPynVKZccsC+9+waMVpPgL4APbGP
         fIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455238; x=1741060038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=hn9iKrZwUrgq1uli71A82ZVP4bq7O7/6vZAs8ZQygjxp6mYFIbkvhFOfo/o3wuP94Q
         RY/7rv/O5B74kxIAIKiM0+GQY2GOHuVB1Y6KV1PMgfaJcgWGYJx4c9GRAMRgWnIBcmMH
         hGkMUbBiPriZSr+CaHs0emHTPV8ZqKyeaNHwoqQ6qlY9S3J3081kiXYR8WtbuTio6gBa
         drMCFTmQvS13mqnorXLyl1c91aatbqJIT4UpBY8/QUZCP8ZTqK+1/D346WjKy/m858+9
         IEBgAnG9ZMRTdGnpkDBHZqWQXaCYdgfSCn1d5iIhPeTEOhr7NAH4Iq1AFxOxLdb03csW
         h6UA==
X-Forwarded-Encrypted: i=1; AJvYcCWpltEcXYwRjeeMQefhZdzGdo/WCiDTacMHPu3fgctyE1pRgVZt0MGO/A/ILigijQaJq7r8sG3nE6TLQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd0UrfT5unbEBs7tvy37O/fFBOjHyGVVdKPT6TGmVvZ/3oktXG
	tSbEDnSt7zjO4p3c+8+kNIu1ErCI8tdjch/y+svw9C/FmeC75gBeLl5PtgU4gPU=
X-Gm-Gg: ASbGnctd+ejHf4aCPzToZIBUm7+MDsc0mLhvAEf03P2uqIjqSGUiotiIQmAO7b8ea5i
	ZTGdk3YxqDcCbOkqYEoJeXsEsyeWjQHCJQ69EUfu0q40+0lVp8jAvJTD/J72SxZkFXkj1ZOQyOT
	HljwhcCrcTNGwPcp1niCX51eB6f39eGJ86+84PZi/6JOOh6QiIg/lC8RgRMOhEr3g3N/ga7Nx0z
	gWExbn1oSlGhxAUOMP/uK7xihXucBi+dzx31OoQ1cvtazjwp7FN7bY7isgL57L0hHXv7/onq6Yg
	bDNlNBvySQkb7uru/MzzVLaiV1UuMzt2QLT/J8ufpOmymHBGq2jOs0DPa0NGu8iM2w==
X-Google-Smtp-Source: AGHT+IHDwvQZzbKv24vEjKNvLJNI+R1iJ4OqsIlmXN9p1d6u9OWq0+ZfVfD6gOTuv6xGQ3OntwSRRg==
X-Received: by 2002:a05:6a00:6f0e:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73426c62969mr26062579b3a.5.1740455238550;
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 6/6] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:56 +0800
Message-Id: <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_034726_225220_2A746BDE 
X-CRM114-Status: UNSURE (   7.41  )
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

The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
table pages, and now all architectures have been converted to use it to
remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
currently has no users and should not be used for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 18bf499ef8801..dd292c6d3ce88 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -511,12 +511,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 	tlb_remove_table(tlb, pt);
 }
 
-/* Like tlb_remove_ptdesc, but for page-like page directories. */
-static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
-{
-	tlb_remove_page(tlb, ptdesc_page(pt));
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
