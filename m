Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B567EC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8OBE1oyKmdPDuZZu+/jqeoapjULb+VBbER0XMbKTGg=; b=OosEJU/P3UMZ+J
	lavpEofAP/T7oibYl82f3NQbG6tZjGnT7za7ejynC1avT/Iix2NrSG5cSwz72YRqYjAwWNgbbQUg4
	CG/zv9aplBpZop9an136u8etug8MDp4iH+QZKjsnD78tRmueYJSTlVRTj+KxC5y5Bni1PsPe/i08A
	4NayvB5EjYqFmdwb3bRgJGyq4gMUgmD3DN3LePn8C98eapSTk3US13MFX4eEHX9jRLFxreXrmYqCM
	oka9Wq1fU7ckGasjiBdavdMDh1D4ZxM337JNdnG3uxrk+WgLMvqE7K07CdDuUe7e7BhGeSs8w4Ibl
	Xh3YKjWPeG0gTOOexXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEZ-00000004bUi-3bhh;
	Tue, 18 Mar 2025 04:07:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7E-00000004acT-0TwY
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:59:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224171d6826so51290315ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742270380; x=1742875180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+cFskIjc2R+b1eOxd5DFriJfYFabuqe5pHc955ET08=;
        b=N+7iGtHZQNfvpsUe/EnS19ZD/TKLDZn80deXCaojD3VsyJoffk3P0S1Y5AJRUdwtip
         mDudLSyMHfQwjqaJslhdHcgHFpcCP7xIWjeRmDUVDdpBCh+OeZ+F/saRxowFDQzGcba5
         b56RdlkDrzwwqsOKe1WTlkNtgQ89PzarmMOPDlO/yM8q7OxvDjWCvZENJrrECmaCBTKQ
         MXuUEWvvJbaO0JEHbQC+zlxNwy/kOD+umna5I5gr8HNPn/YfBH0YB6PwakdAMCyeUVqu
         E/1tWA3C6wQ43d3IrdwI4TASLcXWu6Lnn0yxTTK1R9Jiah5lDR/nV8VYwUccM6/TbxhS
         W/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270380; x=1742875180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+cFskIjc2R+b1eOxd5DFriJfYFabuqe5pHc955ET08=;
        b=blP9YORrUcQoy0H0B+fw6f1d6KlxtSVyGCaUvOM8jnfBEI6PwLzMYqwWPXeA/fb+KT
         f0HQPQkQGfWaID6KKQxK9riZOO8m/SCJz8HK0y8egCjCcA60p7X0w7tzO+spEfzXwLIr
         kUXo/g1wsbL6jrrNKiA31HUsze/HfSSz/bt1g4pk6PvvtD4PdsT0A+ixQ6fxaQ7lGHa/
         faIZe2Pxrdrg7agvA3WTDx27/aAKq+zREBLTIRJrNHO3NSNKUqLGjGNIwPS6OcpLyR10
         06vilGztTHrVhlvb1Gju1QWF/adpEmugmExn/gv85oqBTI9CQ7VNRo0joI7dxFNoka0k
         Vvgw==
X-Forwarded-Encrypted: i=1; AJvYcCV4dt0Z3TiLqOq3aNoj3hEjYQ24OWODEAHCLyukFMcqcyfEfW6uVtagxPqfEDxF2m3R+mRNSCB4DyS40Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbuOwtKa7Yp7WdlhesyoZUcwZcEDtdZhoTerzni6gUClNgAjt
	3VWQqLkfNISHghfcjIB7K+lwo5/EGudMTxhwCMiwOLKZyW+ZQ/04h5Eb9zUakzWIbZor9FnSUso
	caYI=
X-Gm-Gg: ASbGncsn9wL/rsAgh/41AGWsYJeRkSjpA+rUiIenaoSHp9FQMmo9itT++PeMfuAGzLs
	f1dI4tqT1xaYzcgOzl5VCDqLfmpiedodJ6QKAQulpoIH+AnM5Pe1cWjTMgIWscWT0gEErKybd9W
	329qr2pZhTFe9dV8N96Kk8q42PiOLu5LYPeMSqLh/cbaqCnGey7kVK3Aj6Kf23YqwsBU0S7AJP1
	zIHcmjCogNDFZ6JeyH5DDUblhJUSd+ttdSvbNk+C3kTNXaD19BSYVs6mRjD+JpeDaNWWCz0F1sc
	rdvlqSaq+1JNm2rxTiQAzCqTummhEqNV+uKzes+RCSy5CIvpURLggbfLSwqLhUS66GiVaLGulbM
	uR1MM46h/Js994D5+pKeGurREF6o=
X-Google-Smtp-Source: AGHT+IEk0ixM7+/HF7HnljxT7v/b8tGkEF42+OaIkk6MZsjKmh92Ti0vM9eEJawaci+e/TCODhf3qw==
X-Received: by 2002:a17:902:ecc3:b0:224:283f:a9ef with SMTP id d9443c01a7336-225e0a62bc8mr145428385ad.6.1742270380177;
        Mon, 17 Mar 2025 20:59:40 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4b30sm83720135ad.235.2025.03.17.20.59.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Mar 2025 20:59:38 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: akpm@linux-foundation.org,
	jhubbard@nvidia.com,
	kirill.shutemov@linux.intel.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND v2 0/4] riscv: iommu: Support Svnapot
Date: Tue, 18 Mar 2025 11:59:26 +0800
Message-Id: <20250318035930.11855-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_205944_155035_6A689B84 
X-CRM114-Status: UNSURE (   6.54  )
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

According to the RISC-V IOMMU hardware spec, the IOMMU implementation
has the same translation process as MMU and supports Svnapot standard
extension as well. These patches add support for Svnapot in the IOMMU
driver to make 64K also an available page size during DMA mapping.

Changes in V2:
1. Supply more details about huge pte issue in follow_page_pte().
2. Fix some style problems.

Xu Lu (4):
  mm/gup: Add huge pte handling logic in follow_page_pte()
  iommu/riscv: Use pte_t to represent page table entry
  iommu/riscv: Introduce IOMMU page table lock
  iommu/riscv: Add support for Svnapot

 arch/riscv/include/asm/pgtable.h |   6 +
 drivers/iommu/riscv/iommu.c      | 258 +++++++++++++++++++++++++------
 include/linux/pgtable.h          |   8 +
 mm/gup.c                         |  17 +-
 4 files changed, 233 insertions(+), 56 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
