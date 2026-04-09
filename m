Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80942E9DE76
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEAFiNJ87pT4Fdt3cd1JlZtFPcOEJPlUBg4QeT8NnyY=; b=dhorrEHfnpKmBI
	0fWM0s/xuyv4bo6Z+gzttxNvjliwTzIwxTlS9dAFcWsqU03IKklAcw+lrJs55H4eUzOOOCo/NVq80
	fBCAys3KJYjQNjAW+puqXmLIaOclYkl2iJvkMKox1pEPSNIAmzuJi+/BS06oy2x/fZ+6IslsrvQ1c
	gWQoEqFjFbIz7jZfY/M4WTtPYuSUrbQfDBrPHk4tF4wgEnGiW1yVMxkJG1oFj1HlfkOH5aOyKFIhn
	Ow70aE1WzPYaw3L/UZb5Q55DpUr1dntmbVJiY2qM9eDBUrRead1aPj4EQOQ3Qoy41bxbif5tzmtJT
	yBiurVFAyMYwBB0XEXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQr-0000000A12f-0lKt;
	Thu, 09 Apr 2026 09:12:13 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQp-0000000A11Q-3Lpm
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:12:12 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7dbd1458a77so486337a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725931; x=1776330731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBV+/zzkdPHLgFysmifTqJCsNQYHfiRTnr5GUqLTC5E=;
        b=ULzrym2XzhgS55hCCqGB6NofnAPV6VQGs/HCI5cIbALNfh6TARE1Wl+gwfFRd0bMp7
         deTegx2WmhgfIIQ7x6kCV21rv/0ttRKduKKlhAGBfmBPEXwK76uAjCR2G6uCJnlFBQjp
         w8IOHH2wY3hM6kJYJJAVGovQ84cuSl4WV4iIr45Bl8fUZBcZR0+WirUVM0Bv6KWSyFhG
         zZlUiKMzXtwCLvK1hCZys+IXxZQEz6Dzr8bbikZlp7rLFfExNGvxK2K/PxA6xxPWRz9r
         KvQbAtdo7VUUJxn0p+BRSL0dMG2z6gd6oIfj8bZKPnwleFwLVGKP42Z1SXvAgaW/dR/p
         KDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725931; x=1776330731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBV+/zzkdPHLgFysmifTqJCsNQYHfiRTnr5GUqLTC5E=;
        b=rAe3jId5PBIcy02mtvuXQJJdW9fd09KuSPGbJbjmOhFq0ytPXP52TkCJvDZ3yw2JRh
         GGB0dnFhpupVlzWRDHtuAmd2htyJcQuGnn9Z5GwUVRYz/1M2jaJvaSQeETZnChI/rDjn
         3NLxFXzg4GbZ7kHXxsQkFJYCZ3WhU+0YIFj0ffpYS2QNk+jN1MeTQA17UX/zdGTWYKzC
         OwqU5H3LPl8XyyJgo0sXL2vDlpON6PFKdC3/U1ChjHpDxNjVDdWPethsDb1wW6Tubi3w
         YwigOAaeTZql+si2sumC4Ud+zh/W/y7ttZ4iMk6qDKT6eGdK8Mwwpl8toToXMyRkhbGm
         SN8w==
X-Forwarded-Encrypted: i=1; AJvYcCXijoctmGqyiHwhGHcTM05QC7K0d5/tP0usKRx2HKlMNmTiQycGZFbVdGJycCv8uj6RnKVQ66c3IjBjBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1GJ8XdDELKaHjGukk8pVi6cTPDHW0obdN+vST1YnSJbPOiHdw
	dXX2+ptnjl8NmeH/O2kh9pZUkA8uNkjcU2MSgteAmgL+aUjjOFvrqN6n
X-Gm-Gg: AeBDiev/sVxYojwOUGKPcuDjtUaLwJToUAuyD7Zazr7gVBrIkdIlF7G47NFG5GswNd6
	VihUCl1pUrzpJ5QDG/Y40oJXKuQ9SwLs039WE2zJx9L7vLY2F+ROAaPqsj858lM9C3O/VJX7HfT
	5vIapste5eqqH43+3zY1IliSjaGcTWBhlmV4uJLAx6H/zW04c7qDheF2RHGQ2ulPgGoN1kjlcvQ
	Yp1U6oUAe7dwsygyJo+9ZWNULTgRCxVrr+Q4w88djsojjF1QKl/fSKLwqWN8Jxl0705J8s3PPHR
	1cyslYanaSorhI7wKNrAILzL0GgxvPBcDPhU8vF4uSzt4iW/yHk6KYUPdb5f24+YHR8uq/TfUWH
	YpIEd3eNWxGCSkz3vAkIzTjgo42G0Y+cILdkxVZfWYEZpWdCFQcti5idKALmpE1OFOPqLrg6SlC
	nXg1dLLxvrNGYo7ETB8rUlC0ieMRDONirKdA==
X-Received: by 2002:a05:6830:2546:b0:7d7:fada:89ca with SMTP id 46e09a7af769-7dbb70cf2aemr15358771a34.15.1775725930696;
        Thu, 09 Apr 2026 02:12:10 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7184e14sm15585364a34.11.2026.04.09.02.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:10 -0700 (PDT)
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
Subject: [PATCH 4/5] riscv: mm: Fix NULL dereferences in napot hugetlb functions
Date: Thu,  9 Apr 2026 09:11:42 +0000
Message-ID: <20260409091143.1348853-5-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091143.1348853-1-mikey@neuling.org>
References: <20260409091143.1348853-1-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_021211_845990_A653E356 
X-CRM114-Status: UNSURE (   9.86  )
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

huge_pte_offset() can return NULL when any level of the page table walk
encounters a non-present entry. Both huge_ptep_set_access_flags() and
huge_ptep_set_wrprotect() re-derive ptep via huge_pte_offset() in the
napot path but use the result without a NULL check, leading to NULL
pointer dereferences in get_clear_contig_flush() and set_pte_at().

Add NULL checks after huge_pte_offset() in both functions.

Fixes: 82a1a1f3bf ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Cursor:claude-4.6-opus-high-thinking
---
 arch/riscv/mm/hugetlbpage.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a6d217112c..7d155341cf 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -288,6 +288,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
 	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
+	if (!ptep)
+		return 0;
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -335,6 +337,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
 	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
+	if (!ptep)
+		return;
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
