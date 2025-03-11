Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E449CC28B30
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8OBE1oyKmdPDuZZu+/jqeoapjULb+VBbER0XMbKTGg=; b=c8tKRMGDB/bsYB
	+X418lCCwi1tFOGOQTq5jI3htYx+ACt3q2dg7lsu6A0FryMJAPr6iLJJ4KegHi9xh02undWwk4u7P
	fRWePjvrvJCQBwiGaHe5Ee33feQ1Du2ptT1Vy3AQZisLyjuGmzHgfGJS9SWGtFJlTrFTJKsxV6NVP
	SzAtJ9fcnPxexZArQwQhvINzJylykklUY5zjo5gHmFQuVK/dpXLnVgMNBUg/zptclGGmAT+Z4RtfY
	wNH56+qpEEf3sfXVihi8aG24UkGnyTsaOLlsHH/P1xW022/DCx4I16sZXQ3U06g8REix8XX6HOS82
	gUnURgnCWKFJLh4edaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryvX-00000005gwO-1FL2;
	Tue, 11 Mar 2025 12:41:43 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryfg-00000005d4F-0Muj
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:25:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22580c9ee0aso28341625ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741695918; x=1742300718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+cFskIjc2R+b1eOxd5DFriJfYFabuqe5pHc955ET08=;
        b=XZsphz0HNVz6ry5SCwqwafZMK+MSEGm18EH1sU2qXQZlCRaz/zeE7W1cRrj6va7B5Q
         6DKOfQ5IdxJw7Bq/q/JXiNCdmfPwSFjLek4Zqr5GC2KImYaQZZyql/p7yV1PYqONL9mn
         Jp0+NzuM1G+biErXNEE5yhlVpidHs1ygknV9S5dNwO/c23RMoVBW7O4ky9BzbuJYmRUG
         8Qpv/Z5U1gJqiLVcke9WazZ4z6vXERzeeiyyN8R46DneiEzxUbQotHOZNYaR2GsUtq0P
         /clWP5mm3sTQvddGHZvq3LJzqULcdLhWzZtGYpYBYp2sLuh/yIelQGHOcx1wIV/rPiuK
         W3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695918; x=1742300718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+cFskIjc2R+b1eOxd5DFriJfYFabuqe5pHc955ET08=;
        b=xK8mQUN0dTp5yQ2J+F8cczBIFdScB+23tAcHZFomMuAEXp36ZsHpb4E+8igPT0l0kR
         q31PeQVfIyt1+/VbkIWs4cCDTKwoobhoFxAlF9xkHhOllj+fKc/EcYjvI/K7AAFICDiB
         f9N4soH98eDEFEhETpP3BARhSBkeY6jDwWW7BfnRcoizv5iBZ0df1ED1ic9Nqd99odVO
         mrx8vRAPxZ1wEwdHEIQ6E+uu8CVsBcHdkpo4S4llpihXolL9hRQk0EefUleoXYotqHcE
         M+jb1vnfHhSYvZHSbPSuZ7ziTpziMApa3/eL6iAO+1rWUC6oR+dkm1rokks3bgg8ZWPh
         4MPA==
X-Forwarded-Encrypted: i=1; AJvYcCULp2RMB/MajAm/z38sZ8PyBWg9XP69v94qgwA/ei6+PazUZSFJpf17FwIn2eTOuLFtBTqeoSrmfj1bKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4a9tYQYgV4bvg/F9omwkMeHRHrKBvjcztE7gAxvj25t9qfkD
	Kj8GZw9qbZaWsu2O978vSXpG4WPcGRsDhFOgRdoi04gb+zzzEx4jDRny9wy7Rh+abiJatZD8GmR
	MulI=
X-Gm-Gg: ASbGncvz3x2c0PknOA5Mo3g2cbVEUdtEL/3APOiG361RDs362F5mxP6ursagolFMsGJ
	OT6Ix42pWUKfaNs8kFntyXC0MwIW8VBAQmcxR+y89goMG/tlyp35xSIMO8MycutQI9COWh15pEC
	L/ZWpia+Dv5Fwdteo6Z+77NQ475qxrfKUFtd1x7seegLFHrIBEnF4hwWFNf7lWU/aCr8UUJGDNV
	bzIfN690fnFpqmDbpFEkDFqKPicI1cPtL1xe5tJf9kTkERmrfX2piDScxxAyb7DpIUaGzByV9iq
	z/J3KQmltpEaUmhWwBe4cVxlZCCE/tHlAcdb1N8QK/CC/HrBj1j9UORluAryNA36cxDLPfN1WbH
	RbJV02uIIXXRxtJYXa6L3xpCC0Rw=
X-Google-Smtp-Source: AGHT+IHG1hIfRPGfeBWtZBg6vmzBDsRxutGZo9a7a1tFhmE6ZGkKIhVjEQFMDqp9Q4XTijdI+P3nug==
X-Received: by 2002:a17:903:32c5:b0:224:249f:9734 with SMTP id d9443c01a7336-2242887ecd7mr261999215ad.4.1741695918352;
        Tue, 11 Mar 2025 05:25:18 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450244sm10226621b3a.80.2025.03.11.05.25.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Mar 2025 05:25:18 -0700 (PDT)
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
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 0/4] riscv: iommu: Support Svnapot
Date: Tue, 11 Mar 2025 20:25:06 +0800
Message-Id: <20250311122510.72934-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052520_431072_3EAA16E6 
X-CRM114-Status: UNSURE (   6.92  )
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
