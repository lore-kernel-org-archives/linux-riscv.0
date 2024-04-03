Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71233CD128A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcOyJOcGS6DgWgwyJX+9tVZuIl2JlQ0HrkWttRKH9oo=; b=qidDguQYhU38XH
	L52jY73FoLWUy1bJtH4cecYHbYGiKDK9yXD2ZsTLhtlBrnkj0wyboSg0zyeF7BxB3KriTSPX5QIl1
	NubRf+iT6pYxceK1jusFXRMFZODEa5marnceh7CttBzP8zrxpiih4wcM1SxFAf78cQyUYAYvbZuyh
	+E9owMU24dc+JquWyTWMG1I+UB77uStBDAQUR0jBi4aK6oz9Dyt87ntqJqVNr0qNgH7Hc0/prhbmJ
	F04hWSMMgNC3HO9NkAw4SuaTOjebsI55tYTnupc8ZX5jqG1w0S414SW7CNEJtyhEe2TG8Lq4lrsRz
	8QhUTGF1YGJAaQpTPcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBIH-00000000oP1-03zP;
	Thu, 04 Apr 2024 00:49:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFa-00000000aHa-48r6
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=; b=NrGQaf0D4IJGi34bYGcYnfUfTJ
	whqaIQc/ew+f2X7KrJDEFdXYTKzHg1OL0sIQSgpC9j9hVdlVuox8fwkkhhiuRn0F6NbVO3P/MonCX
	DjPVp1RAqcpIlep6N3yGqrHUNZJ/Wnzk+6MHc9DXyL138azTkZ2P8i7hzOODt27gKT83J5UuHgEa6
	CLdM+KBcuF4jqBlW7L9wNMZzpgoTg2fWRGFYL+DHCt0GAIwGsSM/1VudlsV5Y58YqEcZzyTDg/lZb
	OIGnXU048a69iNYoJiqm4vjOVp4uy/f5c0jnXFz1kFaeMqLdZ1OlS6NIjmL6V6p7E0lVnUpkBLvRE
	jMFme9mg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFA-00000004TwM-0XvT
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e2235c630aso2251315ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187724; x=1712792524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=;
        b=hLdrU1Jb8KZlgFCkCLZfDKKNlS7IdOK2WDk3tLqHKi8pPDWM5KbCyc3it4KtHWkKLK
         fsWENRbhSaAcJhlsao8k9yWhnmi1dnvehF+zKSrCwfQHpNHHfF/ziWkrJJKZ/P/TFwNg
         eAbPZLjC+a4GU0T09Iwjp8Z6kfvIrmWuAltLUyRI1L1n2PejnlCEOKkYXohIg32DP+eC
         SJWaNViKkrx+WB2K6RsB++WVEscU94sFj3I1l+wW6B/YpfrQcEX0DuqhI3Ddfy6d3bKy
         z4fn4OTJV0swAMjilsl5NDqES6aM3YAHZfTYGP8rPqPs1k4OiJRXGLEVHkhpmATrH1ow
         9MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187724; x=1712792524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=;
        b=rJfu3Av0mqwpSTCx0CfLyE2cxaW12+sLWPKK+RigyoJjTUIFMENGpie6Ncx8C787do
         ky+v1g1qNGld1/w5IyhIWJIS0NmIek7K3vGJ6NJOYbRabtq2kAY6illL1NpvP2r4RldR
         pwO81A7ov0PMzFOcbvFZCYQJhy7GdMDXku2BpQZmurxWgTrPmPOEa63q6ANKLmd6WaQI
         NNv4X86dFd5kd8aXjETx0jmgCHFs0y3x3kimtWh0KIxti5L41q9MQpE1J50c9Uqyj9hP
         OWrfZng2ztDczyNs+DYLwXDj3G+MyZuWFSPOM5/cKGii9pt+tWdTpDpVCKX6T8t9GUVl
         3ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsBFN647PSBzYlxi4ByIBx9nCZcXjep812ugavkB5VMNZr9E5oLGrYrjcOnp4FQzjTEaxjt12wuqFWjFMubP3smB4hKgWfF1Fkc9GvZjbw
X-Gm-Message-State: AOJu0YzGM8vYvn121oaByDPUV3Brno4T/X7PhVzocQrC5oGmIYWfb/1Q
	Ack/U6igZoKQFWucrDsignzBxXqWrU2MVS0xF6lO1FtLtmQT19dM6sY1KjB8Dks=
X-Google-Smtp-Source: AGHT+IE5OtNNwwi7V8fcgm4SldB7youBAC6PguykSuN4bSQ+2Jz71QrTBvPX9ID197EWuQqic+Bd6Q==
X-Received: by 2002:a17:903:2448:b0:1e2:62c9:6ac7 with SMTP id l8-20020a170903244800b001e262c96ac7mr772428pls.41.1712187724491;
        Wed, 03 Apr 2024 16:42:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:04 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 13/29] riscv mmu: write protect and shadow stack
Date: Wed,  3 Apr 2024 16:35:01 -0700
Message-ID: <20240403234054.2020347-14-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004214_304654_E2218CBC 
X-CRM114-Status: GOOD (  13.24  )
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
