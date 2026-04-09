Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E7FE9DE6F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSsqD75KpfOBPtzya4E1qMLsbYaTMPa8QuIy0O3z7zo=; b=LBR+s6uTemkAUY
	AmD7JgfWyXtdvIxT97G3AyEcMsf2dTnPGn4likk6Hla9VAH5Rm9EMjSMYFfKTaxqZG/MIGF+TwV+I
	u4rMWMNQWN8v41zKO7O1zS+grBcw0Ge60BIaa2M18wLVTCvNLOsKDrqPn7ZjKgogmJI4xlxEIcgvU
	gIlPnNx/7dM0IoEbdm8EABY3uJTNA5vI3lABqGQ8/kFSq2JChUQbl26LL0mIlsAglRPDXZFCoWOTI
	djq7t8AALtYVYjDY5BGDV1awsWTXSZo4j/hZXxwsF/td2Epm5Mqgs0PPftyOJhin7OC0Jd0vZXjs+
	BNPf5M2BOxzVdWCcjn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQu-0000000A15R-1ysS;
	Thu, 09 Apr 2026 09:12:16 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQr-0000000A12P-2gQk
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:12:14 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7dbba5076c8so308220a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725932; x=1776330732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr6MPICWE4ldIw4rSWIw16hWgUVZbK29NpUO6VS3GiA=;
        b=C/4/hhQBoX0w6wMuFSwpGq5MlT0csWT0ZKkjmD/kUdnotgoRXNZE5ht8+dy7o7P3WA
         jwIPXlOCxX9d7NjxnlXgcwnGaLweb1OVR8zbKM+74XFDJoXevzU8YKTYZC/4u0wDh65i
         +kYVZbCQu8WHVxiZBec/Iv9D/aHY2LzIgNzL41w7pBDqxXh4RxZnSVVIpHtCpgAsOadx
         DxsjN83AkGctOZuIBSb7a0xw+6xPhiNdABS4fvR5itL6tBoSGdyTqHXPunxyXcq4Z0gx
         TBE1YHI65ovcwHGrChR/PzNM7l2fspqa1N41pqWHywzDGT8Qhl5yVs4tJFf6gQapi3vj
         zuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725932; x=1776330732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr6MPICWE4ldIw4rSWIw16hWgUVZbK29NpUO6VS3GiA=;
        b=Sd/FUmuuc7MHM/lMOmUCsVzvSafc38QeA5kNC8MRV/r/uZ3YxO+QRAlyA0Wwp+9kn9
         W3CKI6Fr+e8CRh2DgdpNpKJugH8vETYiUL7hm9OmevkiLB7KuOIMpE6jN+STuvPiscRK
         kaqx+PNwTKJSCb5AysqYRIpzm+26Vld5sOUYCIUeyC++ppkXcBTCxHincaffzUuMqIiK
         ujah6mjHLHXc0H9cpnwY9+33gGi2fGCnpvWTKe+SU+Cm53aWeMJBoDHRCyBdD2Ju17Dn
         zUiTohtqeHJRlI6Wx31P9+ilBaExFtr/+BFL6ZSup+k3cGVUqSogGPmGbcIwTP4aVvf9
         lCAw==
X-Forwarded-Encrypted: i=1; AJvYcCUYNpq7DPs2JMNsiHgSwCAKkaBI6MNG1HERCmoDOM852xJyG+LsUQtFJuwuMjfNxD+567tLdoOEf+ZTlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4jKbUVB1Jipo4xcqoH8yqcCsbXTunkJh3Dk1aEDonouwxjYhG
	wbz8nOi6+xKvHlF1Sm+NpYmveLI4UrPYQ4cTsHBsh7zn0Z6/IN9C1Irx
X-Gm-Gg: AeBDievXm03YZzI1OdhqqBOEeDMZRDg5mmXnNnoBPppbFeEuNbH6NidMafvP3Hq6FSZ
	y3MAt2GC3Qf/Gvajc/XgGsjXCh59x1xvAlrAm0wMyFHnW8h+5BpHOd6k1OK32cTF4FEwieWbtkO
	hUcKAtB1XdG9ATkYlcY5p3PZ2SBFmceMkkMo3CKyeLA/jrh2DzFtYNqURhaxCh9fVvfOl3YZwKs
	O+1l2IJcKLhRy6brKZf0KlNhksV8FxlmS6XV2TgYFbbO5d69bCJCR/qKt4fCvu2IOOI/gOY1FWr
	JDjUIkIHJ4gtC+n5+kdqsrlP+YOtYnIv+GiWWlHTpcqr8b4ZFa+B7tHHA4vmy5ZHfNIYDmu410F
	f7jAT1UvD5bAVQv6uJng49Eom7aBC8RWqtetKUiVVGJdx9YQEuR3djEKW73SOIn6VlOow8ssve2
	h7YMFixovDbYmFEeY7P9D22kHg55NNQ+v3yA==
X-Received: by 2002:a05:6830:6086:b0:7d7:d2f5:1d61 with SMTP id 46e09a7af769-7dbb73279a0mr15272729a34.4.1775725932508;
        Thu, 09 Apr 2026 02:12:12 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7184e14sm15585364a34.11.2026.04.09.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:11 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Guo Ren <guoren@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Michael Neuling <mikey@neuling.org>
Subject: [PATCH 5/5] riscv: mm: Fix TOCTOU race in remove_pte_mapping
Date: Thu,  9 Apr 2026 09:11:43 +0000
Message-ID: <20260409091143.1348853-6-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091143.1348853-1-mikey@neuling.org>
References: <20260409091143.1348853-1-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_021213_684282_7236BF68 
X-CRM114-Status: GOOD (  13.18  )
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

remove_pte_mapping() reads the PTE via ptep_get() (a READ_ONCE) into a
local variable, but then checks pte_present(*ptep) by dereferencing the
pointer directly, reading the PTE a second time. If another CPU modifies
the PTE between the two reads, pte_present may check a different value
than what was captured, and the subsequent pte_page() could derive the
wrong page to free.

Use the already-captured local pte variable for the pte_present check.

Fixes: c75a74f4ba ("riscv: mm: Add memory hotplugging support")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Cursor:claude-4.6-opus-high-thinking
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 23cc1b81fa..873cc860a1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1562,7 +1562,7 @@ static void __meminit remove_pte_mapping(pte_t *pte_base, unsigned long addr, un
 
 		ptep = pte_base + pte_index(addr);
 		pte = ptep_get(ptep);
-		if (!pte_present(*ptep))
+		if (!pte_present(pte))
 			continue;
 
 		pte_clear(&init_mm, addr, ptep);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
