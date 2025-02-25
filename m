Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9CAC021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 04:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pYGTzURkOwIeoCBVlX6IxUM/GmsOmXlLapOOeKIIJY=; b=3bxtA5vhAXrKcz
	RL0Grcor+CbdAxIZ+j0C6B3fyNzOx3ahsgwG314HOn6taUVfrM/FpxD9/ht7aZXkun7vGpf928s8K
	uhoSx7QtH3810z5PMrBJNDczA3J6oz/tX8BpKgqN5ouKP2hoKWoY0C2PHntSgY7Xq+OMzRbvdqeKr
	hUCvGllVYa4wy/S47tEO5vuGRwU2CWYpPVMW0wFn+JhKdifL2uLzncqDWaXsoHfr8zX5YrmJ2OkNA
	egNypnQ54IBw+nXASHEWApxTR2ekHFseCXQ4r2xFMVpa1g+myN3tfisgrMxMGzsAast0dfDewUNwb
	dqiN8DBCPlpwIVf1j/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmmw8-0000000FyTd-3sKs;
	Tue, 25 Feb 2025 04:52:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlup-0000000Ftxo-1L7U
	for linux-riscv@bombadil.infradead.org;
	Tue, 25 Feb 2025 03:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=; b=k8Zr6+0cpX+MnxKSSN7kaWcNJq
	pW40Rr6tHDgqLPKAht5Yh3IjbvqAISO7t6dswh5arxYSwfAUkXxrL6txdgy6s3aan7y1fxmV4Kx7p
	2MyboJ6m2Z6NcIMUABxQmsrnNLjeHCjty0nWUYdtrdYbDJxXc95vFwhnvjCkoUyYWGi3t0CHha/4b
	kMm+/xPWM4L2kxGQsm9D6s3oixTgoW1d7fn5NmzaTNbGW1ehivHFYVrMXeoF/yWty5ecNWdcZrqGm
	/emRb8uB3PpIzEr/Z1JkvWHSN/5hZrGNc+c8hO+Ds9i49thoTF1AAd0rJj+GCeI0noHoSeFxBaz2m
	Q+Vz3nFA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlue-00000003Hu5-0GAO
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:47:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220f048c038so97440335ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455228; x=1741060028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=;
        b=J3PntTs/xUVENdv7e2YSnXXHfalq2wuT0ENTAgW0+zxVq6jmICrFY/8q5LIDpA6AtK
         EII68QDhRE9qPnghFAwYCY+hzXO2JAr+JedmRFwE7y2TK+3+cH2tKuRI7epDQVuLUhXU
         6re/k/lwXyS/52VqtRC11ho0BwacZpc9szt9jBt3b7KQMhWLF9CDIg0gx1A1RyWDqQP2
         SrzuHFZkeGTee0u6R5eZgD1xKMp1Zg6/kY3CzRr9yp7cwEZ8yLiHK0iGJmVfOzvjDskC
         op8WMQYBi9rZ8bua+iV/kNnBjz7/Vf/ncQ3kPrynxzeM8CoAidGSrpQdSXgL48G4Cf5y
         45pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455228; x=1741060028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=;
        b=xE5UXMp0WhbzWhk5BS6Ih17NelVF/+yb56cTh1rIF1awfufPZXCulgfXc33+n5HRlp
         Fg8JRXWYxnpzozvbnjmG5ua9qel73OVRrQFrqhPA5MfzY1mWzRuZLobojlF7r5/oWStc
         ILO4Ig8G4tpElmq2zOgsL7xrTAYqAmSXVcV0/MSDBIGagNBBlWCib9RItkvFPAFvDlN1
         FYlbfRZEBtvyxBYpDV4D4COpV+d6Ru4jbhaG2Amdk5/h5sRxH7jknI+69BO4geFLZDOD
         sjW0RXKqvg9Mrizz08e0p5mxnaNmgZm9SKd9XyAt7932E0CUW0ikDdfEMrVr9ElKb1E9
         CbvA==
X-Forwarded-Encrypted: i=1; AJvYcCWPOnlWHkt6xj2Srpb+xR7r20eInLrT+/4SP4VVnN5b4Mt6i/hP2I2kAizwJV+cau2vOFRZMTI0dM4QYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnPu93t/CJ6ZDIOZLpC9t+HoPdFqS79Cd6/LLaKYLreqTBEpLp
	BNgE8MS3KboYT2e2cmmnI/1bBzmiL9mnqcRT+6IvRL/LEBdkjRlMpip3Z73iK3I=
X-Gm-Gg: ASbGncvLF+a06dMHCCRBW66HhUY1arpJcdi/TYozqxgCdeeOzF97dya9+CSfoYWkHu3
	iRsQhA5dA0We22YdxntffLTpwly3KZnaUbNuwkNsnEppSThNyF7JXqQhNIvTl+nCMzkTOfsimL5
	+kR5N5rn9x9FXGXJaN4CtoXYFwFjnNn0tr1tiBrRH0aTyIQmBAfD1R8QdfA/6hBAPbb7ZL9A0Ff
	Ww84nKcbEEeVkmtCp7TaBEW7V3v7C560dkfZ845Di7FITAIAyfr2ggCk4P39XrwrMQCvSWkLQpC
	SJ0XeIII4nOvweCGdNJ7LTwlNHzErpqtN9T9JtHeDl1HSfE0cAEE56Tgz8rs+2wUOg==
X-Google-Smtp-Source: AGHT+IHErQlNtWAOdWTcDw4ZwAn3kttLeu4q3Mf0dru9ScBNUcUevexLBEyVDaZ2sKSBMgz3Y5FwbQ==
X-Received: by 2002:a05:6a21:7a44:b0:1ee:cb9c:9dc9 with SMTP id adf61e73a8af0-1f0fc89a091mr2965600637.35.1740455228677;
        Mon, 24 Feb 2025 19:47:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:08 -0800 (PST)
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
Subject: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
Date: Tue, 25 Feb 2025 11:45:55 +0800
Message-Id: <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_034716_263469_70937CF1 
X-CRM114-Status: UNSURE (   9.07  )
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

The x86 has already been converted to use struct ptdesc, so convert it to
use tlb_remove_ptdesc() instead of tlb_remove_table().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/mm/pgtable.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index b1c1f72c1fd1b..f28ddac0f734a 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -45,7 +45,7 @@ early_param("userpte", setup_userpte);
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
 	paravirt_release_pte(page_to_pfn(pte));
-	tlb_remove_table(tlb, page_ptdesc(pte));
+	tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -59,21 +59,21 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	tlb_remove_table(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
 void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	tlb_remove_table(tlb, virt_to_ptdesc(pud));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	tlb_remove_table(tlb, virt_to_ptdesc(p4d));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
