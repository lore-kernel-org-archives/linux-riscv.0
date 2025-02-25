Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B2AC021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zW1c2VJybEnHIJjyU6NgXs93ls/xxt+XW/ssDLatcDg=; b=t5Czyx2LVuKwIt
	ahLtWYglsVGD+fk5R/BJsCw7WiMZNBnPX2nUbd1pJYgh/9nGVMe//Os093VdbIDbXA6xTpg1FK+mC
	NZvaHHFIWlwVUACgxTdb+EhQopo5KtMxi76t/mkPX1Zp4LkQv2LFpmmKG4hxfz9spTcuV4yb3n8Jt
	ZRQVpeqdvTOamzlCLyNE+WhrbOCLVFflU3BFS5oNTNu0chzbZLEktHOT8yznaiMPgMrUeu4KTcSUl
	UUpHdGQLzXptK7yFz/f4OaJOfruewt/mUHzFj2H/Em9//x9HZnDpMFSDIgwc8RjGbvwzLYx1PeeU6
	SRF2ku7dDTtjhNGsterw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmltr-0000000FtN3-3sdf;
	Tue, 25 Feb 2025 03:46:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlto-0000000FtL6-0GEC
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:46:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-221057b6ac4so98032285ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455179; x=1741059979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28rhiB/GEX2aHidRfZsL1f1ynE4sxX3e1xrVD+t+cg0=;
        b=ib4kereh7XZSWkn56GvXSgdzBH5otbsgbe5YzVDNUamW6GUNQUl98D4eoOfXlaQ1vU
         kF4N80812ChJ1miSLnmDFZkYbK+px6fFEJmUYHkPn+ZjeI3AQ0wr4PM6mxM30cOXWMNA
         ZvDUJRq0jtMMahaAX+xuJeQylnq5Fdcim4/cf9SNfyy9eI297uJCtsYwtlZKU0C9RFBK
         DCp8ieSe3OceFArfDWCLtu9FefES3BCRF5oIrF2FL2cT1lZRGpavT7pWa8geWw2LeB2A
         voGNmZ9jJ1ZCANmylwRxVG1Ma4vnm861t56SyY4UssB9AcBS6/H8MWWzUdMlmcVCA79L
         fOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455179; x=1741059979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28rhiB/GEX2aHidRfZsL1f1ynE4sxX3e1xrVD+t+cg0=;
        b=EEdy+ig1WLiDAronUfRhWJxCPSJJVVyNH7tiu7lvcglZYZYWQP1KMznIQsVzxfQK3d
         aT8108Y6LDrRZvPeO1e/Ds+nl4icGOGAVfbJe3oO2iP/uc6MR1zedjWmAJjVH3WsWIHc
         FNq5Su4Z4vPIe4RA7/qk+U4peQZ74p3mLeTIbE6kZ20zAkN4zwyUFQw1AL6SSPsFjvXd
         MzvhBUeOL86RtNzbfl+W6aEIW6XvzCF/pJgzcVG8UErVsf7qRcChB9n+cB5oCEsYWhCB
         ehNbklsNpfkRLB1vkVM90MXeNAwiN/Q2ESCRGHgYqfNej6bJEw2GNc5JFPR32GmyJzMb
         xgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5l0xvokzhYRWalEgfYRSaNAqvc+gu3LXAqaw1Mtw3Hp5WrOxcmLMwY/Qq4CNEXS3IL7THVc1KOzQ+gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL7HA57zfKEa3D0Xs/NNQkRLuKmFq4uOOVbJERLfd0SzpZzida
	+cNlBB9lMgJC0C4z5AlMvmZ+F+nFZf6zikoI44S7ynyIewiunl/j6zDAPO56d4g=
X-Gm-Gg: ASbGncv0mrOvKm2M0md2BEQQ65vcIM9wmNYATQiWLdwTJGIN3eZ2EpY9+u5h10f2kBs
	wXr+clTYrGRpriuY0ln8leCPw5UjmJkCgtXjkPAIowPslvLh9zcyxbz6pGH8Uf+g32iYCO2Rp/e
	hygFL/1goVseLgrlm7N8pnnGxFYbVNTfX/5a5f7RR5dol8+5pUFjXqmJ7a/JgaXUOZEZPlQaSvI
	mXcuJjGfFlJPsydzqU2oSkoLv4wcJev4GxcI0GpIduNGrAe2azam7qcxUwq5JnJPgE0d91IRsT7
	5dQC5QXDtzslx5rvVSgaB2CFTqoPQ9hj9j7mq5Pvp9w8dTwpRm5CEH0dxJusSynHHQ==
X-Google-Smtp-Source: AGHT+IGCQV+aaAngRw7XrsDoRTV1d2A5MeKYpMO11TDMI4tHHu1SHT60kqvv/nxGByOS3x+4jf7H6Q==
X-Received: by 2002:a17:902:e744:b0:21f:89e5:2715 with SMTP id d9443c01a7336-221a0edd8cbmr248196785ad.19.1740455178926;
        Mon, 24 Feb 2025 19:46:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:18 -0800 (PST)
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
Subject: [PATCH v2 0/6] remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:50 +0800
Message-Id: <cover.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_194624_230246_F81BA384 
X-CRM114-Status: GOOD (  10.27  )
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

Changes in v2:
 - add [PATCH v2 2/6] (Peter Zijlstra)
 - remove [PATCH 4/5] and add [PATCH v2 5/6]
 - rebase onto the next-20250224

Hi all,

As suggested by Peter Zijlstra below [1], this series aims to remove
tlb_remove_page_ptdesc().

: Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
: there should not be a page-table anywhere near here *ever*.
:
: Yes, some architectures use tlb_remove_page() for page-tables too, but
: that is more or less an implementation detail that can be fixed.

After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
to remove the page table pages. In the future, once all architectures using
tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
may be possible to use only tlb_remove_ptdesc().

This series is based on next-20250224.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/

Qi Zheng (6):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct
    ptdesc *
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: convert to use tlb_remove_ptdesc()
  mm: pgtable: remove tlb_remove_page_ptdesc()

 arch/csky/include/asm/pgalloc.h      |  3 +--
 arch/hexagon/include/asm/pgalloc.h   |  3 +--
 arch/loongarch/include/asm/pgalloc.h |  3 +--
 arch/m68k/include/asm/sun3_pgalloc.h |  3 +--
 arch/mips/include/asm/pgalloc.h      |  3 +--
 arch/nios2/include/asm/pgalloc.h     |  9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  |  3 +--
 arch/riscv/include/asm/pgalloc.h     | 26 ++++----------------------
 arch/sh/include/asm/pgalloc.h        |  3 +--
 arch/um/include/asm/pgalloc.h        |  9 +++------
 arch/x86/mm/pgtable.c                |  8 ++++----
 include/asm-generic/tlb.h            | 14 ++++----------
 12 files changed, 26 insertions(+), 61 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
