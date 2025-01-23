Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41CCC0218B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W+5QmwxMBYpCQVr/wx33y3nLpuziRiJxV5/AF5nx0OE=; b=ZBjebyR9xcci9P
	iZ27J362ARzAyBUXZLfphvloPcY8LoP2Prw4uuVrRodb1969pzV6rRpkIr76w+hQFsRu/shNVGBz0
	9r+RJzIfpHdGsqUVZ845eSHn3EXGbR0yOiWTJEf9M5e1je4ggX7WHv3cukyRtJox9qmMSvh4OtbvS
	PyuYSqp0xAmGta64sggM4wNVdlJvvlAaU1fF5wUaeBcttrj5v2QLwv2ggxoZTgHFYNYFrsesjAmQO
	maduzb/epu+e6wWwfd0CRMKAVR7jGkJjRMHncD7heiH16b1a22Z4sT4HEnOC3rLejWoR7yljcggEg
	g8K7LGVG8qeVcyH+H6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxFz-0000000CW8c-1mgG;
	Thu, 23 Jan 2025 13:28:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxFw-0000000CW6J-0NyO
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 13:28:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21636268e43so18732965ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638899; x=1738243699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=Nd1qLPzLmeotT+GA7VU03xVY/KwyWRkCe6lbDiKtCJiLoqD5fSdkt//X2CQwO4zslw
         3K+UOXvaruQiLq9HBXXn0Fgxb8Kbcw3Km8a2qe3XTPxS7Vxj8RuvMIchkN34qS4B2qau
         Q966UoH95M4fuASnWrbFonMprH8kCzKZuTsZXMHcQcHwMJ4IjfOkEfPfQ4Y6TZ7bjgh6
         1kQpFpDTTUHpB3j4H5siEkhRLQoO8jxN88gLepGiGebPZLeW0/GYA6GL3mfryboXadKN
         w33RLRJgZjoi7JyKmP2iK+z8FQp1Z9uOpN9HIMAnemcVau9ITzcGQW8IYRrz1OBBsRRq
         NbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638899; x=1738243699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=LbUNJTF03itvRHHXjxg3ck5j3P8iijAQHemhhslxrlAWwpX3PRSSQ8i1zbkxXykrVN
         I/YkJWyhuJTtuThv1QNN3ZW/wmYCz9578XY7W0mApHlj4/wZRVb13j+pdRWhOJTGDIbW
         AlTIT0vWvf4v5RZx0UK/+8H96+6eV3KuIFc1uzztF8Fi6sxPDPCagUnh8anKCnSzlGta
         XTc9ngt0zmB+dZ7fh3yu4Ca51z0zBSBiaIHqq20nNaSSplNMwfkdn7ybMjuwOUOBaf0T
         gx90tbnMHus4ZHg20ATSU3fwIjUxuJyHBxcbbIRjaeHcjJ5bmOp3xgFWRjVdjgKVFHqg
         pwtw==
X-Forwarded-Encrypted: i=1; AJvYcCWIlP8+yb91CK7u/rD/mJCRFty8/8LvolKRMDpUW7G+zvydG3x7VR7LBbQ6yJzUTel9qteh9+96S+zJbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJQjqwYNsEum10UI2FuioDOVuSLYS9mwhZ1AjVb/5pHayemp4O
	0xZ//9mBWZaPVQHhFXMBL1E43d5TcwLrL3NuRUCs+pZXYVJhoViLCM+ZZoFUGdU=
X-Gm-Gg: ASbGncuxmyaVLYtpJ2W1GSc0WSQeOypcM2Dj2Rx2hR5mYYbx5vaVZFri/dlFX6CgM+i
	bMb6pMCzGGTeVEdhWsy4jq+Xb4yYS2m059lBqPfHmA5AAkQ3Djmfq5eFLEUQkK78qbDjN1SlbUt
	yiNC5kd5BH0onyK8YN0Obb9QteJOZQkrRti799s1pQdcKcot1iA04TlfbCV+l7qZkG3ol8sxFfw
	pGhq8hepULSkHbzuqoKdV9gt/qQD/kVnC+tMhIlIsHxn/bSFPhcAX214L5YXRkriSb/t/pehMyf
	Md9ksP/9E8oNxRc1nwPcRETCSoX+i9J6IZqEuK7tjLFR
X-Google-Smtp-Source: AGHT+IEganAe939WGDJlfH9nAWVZpA3TvM5SaYn7UYpmBsqsQlG5HSrZSGt5JfnUpmvzTx71ZR7Ekg==
X-Received: by 2002:a17:902:f545:b0:215:6e01:ad19 with SMTP id d9443c01a7336-21c35587f37mr410676135ad.29.1737638898793;
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
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
Subject: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:13 +0800
Message-Id: <cover.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_052824_294370_E69F9ADA 
X-CRM114-Status: GOOD (  10.53  )
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

Note: there will be some overlap between my patch #4 and Rik van Riel's patch #1 [2],
      once his patch is merged into the next branch, I can rebase onto his patch.
      And patch #4 can actually make x86 use tlb_remove_ptdesc(), but due to the
      above situation, I have not done so yet.

This series is based on next-20250122.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/lkml/20250123042447.2259648-2-riel@surriel.com/

Qi Zheng (5):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: unconditionally use tlb_remove_table()
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
 arch/x86/kernel/paravirt.c           | 17 +----------------
 arch/x86/mm/pgtable.c                | 11 -----------
 include/asm-generic/tlb.h            | 12 +++---------
 13 files changed, 22 insertions(+), 83 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
