Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3EEC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qmi0yNiyJfdpUMG3ffwOiTkmdB5N9FsVlx0Wti1NGEo=; b=vUhnPNTeR4ATaj
	HunT5gW6cn8tNvu0GqoZzfpD5PwYx3B8nlOkL/3ZNJoaxW+++6u938JlNd3HWRKZ8vpXdzowOh+sc
	wZJk87Vt6lnhGMjHq7oIoBkyONP8kzB1iOTbaG0OfYoHZqYiPy+GXLI9SnqIyoU9Vw4Syz387xZtw
	eAdE2+zXrCOOyfyqJp3MzfG0gevqW9bv6q5qhz3+0R5qLfBHoAl/RshOEBShguZ3fQf4PcoE03TyU
	vRYR/2aU1NzRXxwPB4FhVylr4xiNBdU4Yzd9yR3J2dMPt6NEtD+lL05eLlJ6OdGMctx5wbz2fcCmy
	HO5aOIJDWcf7F9ep0RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LPi-00AOKB-2g;
	Thu, 08 Jun 2023 19:35:18 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LPf-00AOHw-17
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:35:16 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-39a523e8209so54833b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252914; x=1688844914;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kr0PEHV5OnE+EEUWt8DnaCebmsfgt0XKMU/SCuO3z3o=;
        b=IGMMSO5mseD7tMe+rRtOIzITR5LLF6gSj6DDkJB5GA4sfv+l0xQcNm+4SRn9cSTA+K
         bzPDoNl4QAtanNBNtw4EO4Jh9TOBqBvtAeMzqVR0kpqSUA/L/bvTchhidEBh3MP4oHsE
         7zzo3x/NewiOg3sZOatxsUi0TcVM8A38QB4oSQfrmI5m9Mp6eOh1v9F27aPIV0BM3Y9m
         jqm85o0LQ0rhNRucFZ0i7HQcaeWJpsz64iPtGPt0XsZOnDRNlY3xajIra5PnrJSK9OoE
         jKjJyQ6PxwcJN3nFoobZxXBieXcQTT3OQ2VZ4F5eEeV/iMRllpjt6DpnkAeaktGC324Y
         dn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252914; x=1688844914;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr0PEHV5OnE+EEUWt8DnaCebmsfgt0XKMU/SCuO3z3o=;
        b=ZQ9g819d6A9EIV4Uc9f+RPiOSuXGCmiZXsEkNj4rBQNtyy768Kvpc+pfrxerK8Bqg8
         1woCtQL2YRDRB451ZCsK979Bz+Fk6ffyY4Yct9TBY6WPOegXpqCTcJqMTNgwbv/zm3dq
         QKIIbbu831ah1eTfRSqgyACCGAlZuI1LLhxQSl089WepS95wU1X2g9BjTPTJhkJJWrr9
         7RsSJI9WK5tD+Zxv0gcDpZbucfVG6hpzv271NPU2n6pg1W5lbpLglEsVOwJQLcfE5aIa
         2baHusEg0CkxP8p4XqwA+mps0glYZldB8liuJvxIPUtpR5lw7O36slthd7rHZkMxWUS/
         V2JQ==
X-Gm-Message-State: AC+VfDxiPPWR3Mmlee0bBmfQ8n4OaXYiZh/gPPSQpXsPZKtPegOtWmEg
	5jzgQqCd+86MRNufcEe+nzi2/A==
X-Google-Smtp-Source: ACHHUZ7gdIjuH/6E76ySqRN8WufhpANLQ+j2jIa26lg+ERfDlrQvd+huECUh9/LluoEXiOqTeuRs9w==
X-Received: by 2002:a05:6808:cd:b0:39a:519c:2a6a with SMTP id t13-20020a05680800cd00b0039a519c2a6amr6836715oic.43.1686252914190;
        Thu, 08 Jun 2023 12:35:14 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g137-20020a0ddd8f000000b0055d8768408dsm108055ywe.105.2023.06.08.12.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:35:13 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:35:09 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 21/23] x86: Allow get_locked_pte() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <b7fa8547-4f28-ec82-9893-1b2eb58e40b4@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_123515_386038_96298828 
X-CRM114-Status: GOOD (  12.40  )
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/x86/kernel/ldt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
index 525876e7b9f4..adc67f98819a 100644
--- a/arch/x86/kernel/ldt.c
+++ b/arch/x86/kernel/ldt.c
@@ -367,8 +367,10 @@ static void unmap_ldt_struct(struct mm_struct *mm, struct ldt_struct *ldt)
 
 		va = (unsigned long)ldt_slot_va(ldt->slot) + offset;
 		ptep = get_locked_pte(mm, va, &ptl);
-		pte_clear(mm, va, ptep);
-		pte_unmap_unlock(ptep, ptl);
+		if (!WARN_ON_ONCE(!ptep)) {
+			pte_clear(mm, va, ptep);
+			pte_unmap_unlock(ptep, ptl);
+		}
 	}
 
 	va = (unsigned long)ldt_slot_va(ldt->slot);
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
