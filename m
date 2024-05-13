Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D459EC25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kewhTAnJ/YNJAW2+kPJnfIGZhPC7PEF42y1Nyt0pM3w=; b=vDaY5ajdsnj5ciA3oCrqAWcun+
	S6+UZwsMr1pHzwBy6oERmdVzKeH0vHw4XRigHkBpxxJCWCM8WOTbxocPP5F3+rD9lOfRP6csy74DN
	n9dXnMHagzQywtNniN7eheGRfHu0mHpsa018kFvgs50cb3/SzWBPEYiiCYvarunMaRLRoJ4xYU8Uu
	j2T0dW4HspPKKmm3wpDD7FyGEtIOI0/fI2jKz/tJItDTUEhNkH6J5KI3dRoyDeCisVjFg9wyZ03TS
	oQq46faUmb18iNLjdbttPm6kYICcTgsKR3Mov6LxXYI8/ocR9HuDujhEnV9oRE1i5TENaJ31la4VM
	it4+qIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZXZ-0000000DjmQ-29c4;
	Mon, 13 May 2024 17:32:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZXW-0000000Djkg-1PDV
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 17:32:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2b4952a1b51so3667675a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 10:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715621560; x=1716226360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFXpqZ06tDuL/9cR0jtY4Xzt7LWkOIEFJ/Br1ZOH9fM=;
        b=ftVbeGcvfLgNRm2dvOXc+WTthj6nQ86A72jHfXO5HBywmPGVRAUZ7WsXDhzY1WLBBB
         EwS9YkSnYI4IqFHKpjeeADxEGn+9+onBuSq1ZLy0g0C9NWu4WFe5Kcuf1YZbQQnILPpU
         LN3mALt9oIcprVhKIV/ql0y6PYRzRPD9VOtXZxAzYJuHWf7wa1x3jfjC9yh4mexP6Z7h
         Z7QHbQZquwwsjVAXIhfs6o0lKKYWo5M2A7rxnzmChMjwm/QXVEkrqU2m0lKJAT0aOBnS
         6uKWJ5g77vtVz7jq4gcBH9xlWVHMV78lNCnEYzm9ie97QxEp9r6MbvUoExRmnKk3+UcC
         WDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715621560; x=1716226360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFXpqZ06tDuL/9cR0jtY4Xzt7LWkOIEFJ/Br1ZOH9fM=;
        b=FggXPi1WhOgE28YEQji0hTl+nqvyZ4tqTgu738SCQE8RWbesjHB92tL2EC7hm8ki3y
         T172ZYIX++PYTIH064CsU2nYUr4cjSaKFXcPm82Ylz9B/yLk6224ds1z9oYADrAMeNGg
         DTMes+dRdel56quLxrK+82AW5/Lc6CXG7bkwHgoPaxM/jB/Pj78ZccebCWam+Ar5WVvi
         NazmAkpQkkyKgHikfiYQnaFjVY55Ns1N11ixcuTMaiu7MfhuQBLkPkPmgInvnGgsfhLb
         rukdInxfP6Bqt2h4/7TsA19iwXPe/O0UpJo7GvGTMnRqZ6VRr24d0v0FWilbzjRaUfJC
         aWag==
X-Forwarded-Encrypted: i=1; AJvYcCWvf1ru4jKkLiGsAK88pO+dQcXmpBOSLWSJwcT7Fl3tqbkaCcdQqymgw5eHQrs/4dED4bwH8hPT6YfubVAwhsh9KNjYmC2pSb4HRTfyAMoN
X-Gm-Message-State: AOJu0YylZIGviPmpilbNP2TMqTZ9j7RsPCNqNgJ853w6BkLAr6FDrHEK
	QMjOpVQXKYrAUokrNpkcaNj+f+8FEaPpkHLe9Zu6Xs5Bdx8VtbcPvr6C14clacI=
X-Google-Smtp-Source: AGHT+IHKmfimNpAoB9AkagGSZYSsR4bthh7r8LX1Nfh54P1zDj04Ez6BdQHy8JDipeCpvu8vEpu4Yw==
X-Received: by 2002:a17:90b:46c3:b0:2a4:b831:5017 with SMTP id 98e67ed59e1d1-2b6ccef66cemr8063931a91.48.1715621560155;
        Mon, 13 May 2024 10:32:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca51e0sm10048832a91.35.2024.05.13.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:32:39 -0700 (PDT)
Date: Mon, 13 May 2024 10:32:35 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 13/29] riscv mmu: write protect and shadow stack
Message-ID: <ZkJOs6ENmDHFsq/U@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-14-debug@rivosinc.com>
 <276fa17b-cd62-433d-b0ec-fa98c65a46ca@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <276fa17b-cd62-433d-b0ec-fa98c65a46ca@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_103242_414727_2CB91C1C 
X-CRM114-Status: GOOD (  16.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 12, 2024 at 06:31:24PM +0200, Alexandre Ghiti wrote:
>On 04/04/2024 01:35, Deepak Gupta wrote:
>>`fork` implements copy on write (COW) by making pages readonly in child
>>and parent both.
>>
>>ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
>>Assumption is that page is readable and on fault copy on write happens.
>>
>>To implement COW on such pages,
>
>
>I guess you mean "shadow stack pages" here.

Yes I meant shadow stack pages. Will fix the message.

>
>
>>  clearing up W bit makes them XWR = 000.
>>This will result in wrong PTE setting which says no perms but V=1 and PFN
>>field pointing to final page. Instead desired behavior is to turn it into
>>a readable page, take an access (load/store) fault on sspush/sspop
>>(shadow stack) and then perform COW on such pages.
>>This way regular reads
>>would still be allowed and not lead to COW maintaining current behavior
>>of COW on non-shadow stack but writeable memory.
>>
>>On the other hand it doesn't interfere with existing COW for read-write
>>memory. Assumption is always that _PAGE_READ must have been set and thus
>>setting _PAGE_READ is harmless.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>index 9b837239d3e8..7a1c2a98d272 100644
>>--- a/arch/riscv/include/asm/pgtable.h
>>+++ b/arch/riscv/include/asm/pgtable.h
>>@@ -398,7 +398,7 @@ static inline int pte_special(pte_t pte)
>>  static inline pte_t pte_wrprotect(pte_t pte)
>>  {
>>-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
>>+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
>>  }
>>  /* static inline pte_t pte_mkread(pte_t pte) */
>>@@ -581,7 +581,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>>  static inline void ptep_set_wrprotect(struct mm_struct *mm,
>>  				      unsigned long address, pte_t *ptep)
>>  {
>>-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
>>+	volatile pte_t read_pte = *ptep;
>>+	/*
>>+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
>>+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
>>+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
>>+	 * but we dont want this wrong configuration to be set in page tables.
>>+	 */
>>+	atomic_long_set((atomic_long_t *)ptep,
>>+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
>>  }
>>  #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
>
>
>Doesn't making the shadow stack page readable allow "normal" loads to 
>access the page? If it does, isn't that an issue (security-wise)?

When shadow stack permissions are there (i.e. R=0, W=1, X=0), then also shadow stack is
readable through "normal" loads. So nothing changes when it converts into a readonly page
from page permissions perspective.

Security-wise it's not a concern because from threat modeling perspective, if attacker had
read-write primitives (via some bug in program) available to read and write address space
of process/task; then they would have availiblity of return addresses on normal stack. It's
the write primitive that is concerning and to be protected against. And that's why shadow stack
is not writeable using "normal" stores.

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
