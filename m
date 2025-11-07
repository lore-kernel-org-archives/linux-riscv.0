Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC178CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l/1FXFXrM3zGkhzjaHEjecSLA9HVOzDP9Ch6zlxISg4=; b=z8NaQhaiEQwOw1
	dJbqmEAt72SGO/C/+jjYhs1K7OkhQeGwC1w1SvTLJIgSIaXCXL9d9TIeAdCygKrTxBs1SpcLyEg2h
	OP9NvKNhcX8bZDjmdPkNLXtRl0+EtC/zi8BF3rv9kEH3YtNjf7BKbbbXmx1SSPtR8l0/TNpj+2VCB
	6WHjdjCOa8ylueR73VP7P3uvNbeTXjYxOXVcrJi1yAuZRVvUTXu/YwKbtxTNxNH9IKxaXeBu1TLoM
	Zl2NGfiKHHl6v8HRQIWsvMQHLymQefMGu9uGuwmAuMsjDpIeX3j/zaubYQ8Tug8udh69ERdLqGbop
	/mUVJ74LlGEPdKGSyQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRAR-00000000Tve-0UdZ;
	Fri, 07 Nov 2025 18:26:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRAO-00000000TuR-3aOZ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 18:26:34 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-780fc3b181aso870445b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 10:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762539992; x=1763144792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0k2DDkmTgl9KtJMxVJka+jshTEvze38uwk10/MjPY4=;
        b=a0nlY+1yXa/I9rpovMr8m60LI+xdLH7lr1DFZ0QMWshzVFAGah0DeEHu9C3IxtaIG/
         RuBwbV44ZDLwBIqjn6v2aiZGRkMqKvVnjFHGeQtm2O0f1Wl7VFNNRwEOcXznd3XtZvTb
         z7J3+vr24FAnrMi8kPrqTJeVB2vPstwKgmTl+jUtdGQbhcDnA6lg9WkTcr+NQTQqoWhj
         dz6vtev4DNnCw88OKKlmkqKUHrOKIzHfWsLxZQlDBEx7fDPoxhj/kWi3EwD+jgNZSfc4
         Xc4u/EcJrCfi+6AthggX3ucw7tBUXufc4NuYZsTqVlnvQdlUWCpmO7BSVzoFAO9UV/h0
         PtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762539992; x=1763144792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0k2DDkmTgl9KtJMxVJka+jshTEvze38uwk10/MjPY4=;
        b=l5sKzkIXEaCnu49fhASoWRR7aPdTdY081WwxACWbdDWZhNkKjFfiATHZ3pGfjLqbbk
         5iAGcRiUGw4kiyD4upMfV7vaf1AGKcG+bBOJNN8V/vvVQxqKCI+33I17XCNkox0o7GOx
         kjViQwWcS4yMFYuZft0vFxLR9Hz16ge4XrdA32vDsDuSApyNLZJmkBP+XZO3NEb0l6kj
         gzlJwgxQmjBQuvKQjzvE+xhW1KKb8xlm9+GWojZ62as1eGQXkNcSMykb55jTt2nb4Mii
         mHoqgBm/6Pi1OZD774L4eq22D5r9vN9tp1LIA4snIUGLuNS8/FrK0fBXuaec9+okDn0l
         lL3A==
X-Forwarded-Encrypted: i=1; AJvYcCURqm6RYxTS9tfaCfgkGS1KbSx7P3UP15XrSzj6u4VdYzvTdRiD7eu3Ij1glPJgj5Iw50f5gX24MrYsvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjSayF60c1eLC3KTseajJz1hEZ7pgNk03Z1jS8Gnwu63R54DN2
	RbWifEt9WZV0w0g0AIvqiOiTwCL3hpCc2C1cOt/7KOnxfzOHGHXu4JoU
X-Gm-Gg: ASbGncvX4Ej7k440Uienf0qBk4pku8SGBVjxgzBG5Cu08cVCGtgxqHahmHM6DQvMKxJ
	JdvZHbpAXwtW4si+ilbeAEfq+23fi2ff5LKk45cJPITqBxCCD+fJ7TWBqWQJbbRcs17BDdJrAqm
	3Dk9woUPfv4yp4UoBhrFcCvjmdZDfiaTcmbnqFAhZWQr9sXoUnOohbwrgRH99iMx4AtdaKgpvl4
	JKcxlpZgLx1kGfpWRSR3scaZl5DIYUqWCfDkVk4LkNA38wJQGm1D7agnDeOP8mprSdB1TqDB5Vt
	Ly8qp1pJGEbXp0uke5zVrHOZYmBrc0TvanqkrGPlqQZ1SetHzQJPIpDSrK5u8jKXRnRLXP9mi7r
	Y+op9lmqvknl++pgoY9QPgaOkdTqEslHXaTbb+lvyZLz3L7n1c8qFVRh8g+ya8KJjbIoPDUxtyE
	IU8Kf6nHUdz78cpx6EAkuN7UgKa40pjKinpsf9wJJtGA8=
X-Google-Smtp-Source: AGHT+IHSe2DuTKN+iySHuSuemUDwdpe2NT0TqDwGf3BvYJQXiTrsA2dFXT6+qgpOxZlnSFQ8U5p5gQ==
X-Received: by 2002:a05:6a20:7f9b:b0:34e:eb6a:c76e with SMTP id adf61e73a8af0-353a19e5eb2mr127179637.27.1762539991429;
        Fri, 07 Nov 2025 10:26:31 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7b0c963613esm3709868b3a.1.2025.11.07.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 10:26:30 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH] riscv: Remove __GFP_HIGHMEM masking
Date: Fri,  7 Nov 2025 10:26:20 -0800
Message-ID: <20251107182620.95844-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_102632_892956_B38C2036 
X-CRM114-Status: GOOD (  10.20  )
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

Remove unnecessary __GFP_HIGHMEM masking, which was introduced with
commit 380f2c1ae9d4 ("riscv: convert alloc_{pmd, pte}_late() to use
ptdescs"). GFP_KERNEL doesn't contain __GFP_HIGHMEM.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d85efe74a4b6..addb8a9305be 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -441,7 +441,7 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __meminit alloc_pte_late(uintptr_t va)
 {
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
 	/*
 	 * We do not know which mm the PTE page is associated to at this point.
@@ -526,7 +526,7 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __meminit alloc_pmd_late(uintptr_t va)
 {
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
 	/* See comment in alloc_pte_late() regarding NULL passed the ctor */
 	BUG_ON(!ptdesc || !pagetable_pmd_ctor(NULL, ptdesc));
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
