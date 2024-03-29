Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9C6CD1290
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcOyJOcGS6DgWgwyJX+9tVZuIl2JlQ0HrkWttRKH9oo=; b=F2L9w3LSezMzjl
	NBOTUMUgEqOiOucu8Fh3M4ehyycHVoTaiEY9Y/XC7MlOUpYfOwjLCMa2iBrli8rUTykz0W75NzZJW
	Laobth/Dfm57fBv5N/FDWfqI73Xjbos07OK2AVaoyv6e5hUufMyPPVICWgNmTRPbCRtXHioaVcyt6
	KwKrCuWtCuWPEP45YSzgI/zPnszgwTBT7OfkHv7F2bRZp3ATenuQxeoABKnP0k+Iu4P/U28ta65/x
	frOVldbU2ICUs1SJ60OgxEw1EYCntBPCuOS3uhDYD5A9NGDUrN9kOhZWgsqgLCxS6l5dKkZwy/xba
	Ewq3WX9tnE1CUncFpfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq56w-0000000GwgE-3qQF;
	Fri, 29 Mar 2024 05:49:06 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48J-0000000GnZp-1ATY
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so1248296b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687585; x=1712292385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=;
        b=dcfHtJ2joMX/QR8asPEXTvyBJVV6wJgbYcP4iGCMeuZ2noQBe3FTVi4p+MS+tNFg3N
         oLzf2jL5xI5WES/1l19rHLO7r6bCBDjbXqSge+G9GN0IjRgrJ+bDrnb1VamZQ27LN+RA
         +eMer0YZpairIpAjmZVt9MeYLX+4UR6qLuSiLNa+mP8LU6ad3wR/blDuu8iG2SXDDf8s
         K+qYpHnK3erLZBv7pPKTEVE7vxJKjO7dDWgNO2cNdXEYW/1KfkQlD4LTDDrbV4NXAZYq
         TL8rW3ElBe38Ra5uTHfD0u+CnJ0vJb488tHbkNDzfcX+evH4yBuoLV4IPzKD+Tqxy8ND
         d7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687585; x=1712292385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=;
        b=wtcymQgHgs2O5UAnulSRq126aekwLnY2Qx5Nsuhs5jMg6tz+Gmq5w6bJ9bwk9LPlrO
         bIUG6AiYPnBTfq75btvavYgZm5rx0Xz596WYDeNr8N2P8zPy2auTQJLsleR6pQ0nRIgi
         NhZLbjmdtPA3Y0Gh4YoXzzvkXgYL4SJbsOJQJLABcF4yph7EAVeC7YGW3HCaNzSfxNbE
         /7LtjW3fc7iLGFJ/3Fkel94glL33l3NaN7NZ4fMzOcdIpytD1RQ17IijK+fWM97UCfDk
         tYPRhdadyMmUy8Z7YZ+KfAbir6cXK01mWEURyXboAdAogbNgqvZBKRhl3O6YWUBzkuO3
         SVyw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ce+rIWdtZlpTMrY0CGbqh3UGkfOHwHH7LeN8BGPu7ADRC9VRSO2p4pGOwCbJGT752obn51lh1SPgUXpryxdcLMmkM9a7E61Rcd0Vuopl
X-Gm-Message-State: AOJu0YyEVYGXZQGSnN5DyZh18MSzUZXO8vkTMgTEE/xfrZ6M2PnDJlzP
	tyQ/NcBnYMOICj5Mze7oUxULrd7CYd+ZhwEtpdNbzZlSn9crN5NbGlvXPwGKc9A=
X-Google-Smtp-Source: AGHT+IGU4KJtKBTHpZlkqt9cg1BlBHp1APuo4lcElwp7mwPxz8+nlm5g5TQdTRKqVuVUt4gfjoQ+Lw==
X-Received: by 2002:a05:6a00:a29:b0:6ea:df49:c8b1 with SMTP id p41-20020a056a000a2900b006eadf49c8b1mr2139229pfh.13.1711687585128;
        Thu, 28 Mar 2024 21:46:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 12/27] riscv mmu: write protect and shadow stack
Date: Thu, 28 Mar 2024 21:44:44 -0700
Message-Id: <20240329044459.3990638-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214628_116684_1514291E 
X-CRM114-Status: GOOD (  13.10  )
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on such pages, clearing up W bit makes them XWR = 000.
This will result in wrong PTE setting which says no perms but V=1 and PFN
field pointing to final page. Instead desired behavior is to turn it into
a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9b837239d3e8..7a1c2a98d272 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -398,7 +398,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -581,7 +581,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	volatile pte_t read_pte = *ptep;
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
