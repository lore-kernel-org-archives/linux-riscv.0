Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B9C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcY3OJFQ+JLbL5w3G4CmjxeP+wnC3SZ1aZFlabN7des=; b=HTg/y7n67q7zWU
	Cy0xIuyQdbd5vrPLN97WzxsWcPtbPA6bxX+8NNpnAR+irZYdmXfD+lx4fpaf3tBCpe8y4KGZKDLOA
	sTGNKpcqXUwbM8xR6UQB0l5u78hkiA3N01RR71sl598voG7vbNEg4oEjw0eSvgRoCA/e8xFFGlzzp
	aJ8/8krye1BpU9CRWHZCzJMkDySe1wOR7LcXsNlz2BjseU6YrnfI+7ZqwaVY11TbgBjhcZYmXiAbS
	v4p4sdfqB1E4N9rrYQrV3POIUrSg/v2V9YE5V+kZFWZBfBtNT8DYFgWYGiH7nUqpd21kd/jYhI8Em
	j7E2F2McGJrletQxVZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc8e-0000000ErtT-2jxG;
	Fri, 21 Mar 2025 13:10:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc69-0000000ErID-2Xw6
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 13:07:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so20514625e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 06:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562460; x=1743167260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+81In4ilDZ/dsxug/tXtQcTDxsQusJyemdqH5+0jxZc=;
        b=HgSJ4whBgtjsbkyb9VF0Ecqve6sdntG50GGllaB71WVRz7zei8i3G/Wx2O/ZduE9Gy
         cPtm73OyQUvbi0V4k+6VVPNH026CcKEDwsHIiCPaLYzWLY5CBANdBvTe62QWXZMdJeng
         /nJpWqvB7A31DqHEs9fvHT5WcDouqtZWkwzSvGifw7X10YXri5mx5ncq1g+p2D5jlq5B
         Y8+kokMnn3jkaCBIOGck4A7FfPAivqbM0PY6oVS/VqeQDrUQQ9x68LIqizI76iykg66h
         Lb6FLrd/K4+dojG+ceDCrFUTTyLICFzbKmLejoulVYyohVvrmM1oS2q+pOedt1v1RgcL
         n6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562460; x=1743167260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+81In4ilDZ/dsxug/tXtQcTDxsQusJyemdqH5+0jxZc=;
        b=DM47BvaxLUjGFVNSr+kIJ9Dlorf2vTw6lUbsQxMZFx6W/aIab2DETFnJNZUlY7CloR
         /BF60m1HE0CSRmSItd4dxivvNplz5OA0/D0F8M25argjaWdyi770RHrNvvWJIdUybTun
         OcrWSAlMl4DeOecySYGduC2eHjhTt39tQKcXrJ38WvBErhOZP9BZMQtYdDvgw3sdQs7g
         WExR4XyBMRDS//QI454jIVY/DiGE2XAGjvDi37EjjOtKx3vLOhrB/gLbiIZuJO3KPncP
         JSNIK93ogYyg194NKEs3MAyRCLE2k9fi+iBPs87YjUqTuntmxYzMVd3Dehhv7LyfQQ/v
         0LbA==
X-Forwarded-Encrypted: i=1; AJvYcCUM/rqSEySEg5Zj+bKjXHl3WVDBqu+Zq2SUQYgRYOAuge0PeIxaM0cTQj9FLLNLjs0mPP7B2bi2oPMCNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXcvpaIQjHBi0IGBiF/Sg1wG/1hjEwd/i5OYDG8UoZAbS3FhHD
	UeIuQxO8UPQiY7ZfWHT81py1onc7EHBUd44OArSM84e54x78vpGna+8aHMho7k0=
X-Gm-Gg: ASbGnctp3DeyYW5y3qcTUogTRcwOyCBYV8V9Ka7Gqqy25OshfNT5id6U4FipxwicUDv
	KkN051u8xkK2brcLgEgP2PHHwguwnkfD06Kg0zENKNSZXUhWqhUFFTOohZ2SaTvCQI8ugo/xQaY
	4/olgBteWUbg5lc6WfCZ2vQa1ZWj+YmPF1TrVbvBxLEm9nJjrXNbg8kBGb/uW04nsAjCdVtbyDN
	k+roIXjTQLZQh2H+kfbEOTKybxQ00+ndo6Qzyb46F2OSZosnl3zvlX8wv0X+Q5MlltnelLTjABZ
	2WQQsHV6keuXSmsO3yyRKcMMNe1P2AAmjtrM3BTGwvSt2zkloDn3JZpF3azkWZZSLAMwpg==
X-Google-Smtp-Source: AGHT+IFGcNIQFtkSrVrMaEJyHkzdoC3QT/2GtmdRgmqzsJ6C1xedRKK8otT6Nr1+/A9BoBAqiRGLXw==
X-Received: by 2002:a05:6000:1f86:b0:391:4743:6de4 with SMTP id ffacd0b85a97d-3997f940e28mr2542677f8f.50.1742562459890;
        Fri, 21 Mar 2025 06:07:39 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efd6csm2364857f8f.90.2025.03.21.06.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:07:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 1/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Fri, 21 Mar 2025 14:06:27 +0100
Message-Id: <20250321130635.227011-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_060741_642457_EC3D5589 
X-CRM114-Status: UNSURE (   9.53  )
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

The pte_t pointer is expected to point to the first entry of the NAPOT
mapping so no need to use huge_pte_offset(), similarly to what is done
in arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 375dd96bb4a0..3192ad804279 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -287,7 +287,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -334,7 +333,6 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
