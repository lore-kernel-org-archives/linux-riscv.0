Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0493C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wdyy9rWUgHyskfSAqnojRl0gT8z6fc8+sH7R/6svojY=; b=xmyEmpRFw1ysh1
	CeNqUaf0XoUwstCk61rLaYIpBxVSnueDTR2Kps6SsEA7HiPjxnI0xKYiFxLgkr1we71I1t8y1xYgy
	7MUWHNm24inuP6AncbiwDuTdXqa5WPrkan98ozCdg8Hd00NagXU2tIdet+UbGJ2O+49XKK7oAH99g
	3+ZkngP/I9aos6Jn7XATLQfuFS7WUuyTkovmaHXwVbAH3aUqzvhpUxMbMsOqXHR2VXWGU3f1adkpI
	1R509yyNYCyCzEQEEgOcu1iCt7tTNkS9cY8R980Oyqi0H+HdRvAjEJkR0A+bIAKsQdwkEM2tMMHT+
	+tHfoOB9TihKwx2lhftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sKM-0000000G44I-0OSZ;
	Tue, 14 May 2024 13:36:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sKJ-0000000G43g-3bye
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 13:36:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso33307225ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715693778; x=1716298578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELhPDbgArQNQi6ZkTuNkJ3HaLG9b9s1A9lZNaSj8kas=;
        b=oxJN+YRABKuG4BQEo7XFRMGhY23VuOzd66MgigiMuMOr1BnZBm2R4VjMG+9hHdesYs
         LxcpiLnY8q//6TvFJQKgM4FLis9/G2Mg1sEUMlBb3xwUkF3qJD7htgsaMLBQBt8+BhOy
         OHVWiCeRaPn7KYzN/5f4OrpAKCTAY5nVh6Egr24g9AynSo2j2yVKGVvjae8cH83wFtkW
         NEo4GqeqajX05bOgGSnsqp1gN0bkYQy9IzMpJkk2Gi8BOAnb2S5aapylzBZoIxc7cZZC
         qBTigpSY3mMFCbz2/fJs61tWgswFXsNwqHWrmUHJgyTY5G1W5IIiqvsiUsXsh+sQPNz8
         lxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693778; x=1716298578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELhPDbgArQNQi6ZkTuNkJ3HaLG9b9s1A9lZNaSj8kas=;
        b=ItnInA0dGA9PynmkJYifGvRHOdJIwUkYX3KeWNaasxmVDQht7tap9TcLvfnaW7voHN
         Q1g4WwTYoWZp9ln6DGNwZyu+qWVsyl6EtJbpcFbAEZSe5Fnb5pXnEZ3JoSPDrIwXsc2E
         xucHdNNjmjuBgNXiiU4roEfEoaKb6uMLvKl/WYNiDGwB3Bi4Ut+d49NAzOutyhTiXikk
         NEc26YWb7rGhQDw804+OJecUvUlOvDMlWf7EmYCgbxymjj9/DaO6UuNpiZxbOcTdCrRB
         hL2H0b5R2Hr0HYFGChrccrEAQNvzWXPXmSeZ1xhC5OZegJZnt8O7W75pwQ9YGiB4WU2n
         PG8g==
X-Forwarded-Encrypted: i=1; AJvYcCWv1O46xRLnawuIYh8bxpl8M+Wmr/ADQZFU1rlw7EmMa2ta7rZKVUVuYgKJQEq+QqDw3IgwidpVSF4qOp5FpPokeKamn3wAx8THOOoLsrHM
X-Gm-Message-State: AOJu0YxK4L4Uh5iWMUIWkL2oWxNxDUZtxs8copR8zDf5F6UrgMrI/bA7
	0dbukGOAugzuiYbjvnyblru0hv10yMP1IgIqht6POrlKIaM9P4aaurosnfQtaj8=
X-Google-Smtp-Source: AGHT+IHfPx0KBY4rytS7KmSuQawsfE1ZSfpv7vPPScV5D9GsMRlZ30zNYZI5mhzzvMLWaliGYlVCAg==
X-Received: by 2002:a17:902:e5c2:b0:1eb:2fb3:f9fd with SMTP id d9443c01a7336-1ef43c0cecbmr165256165ad.14.1715693778566;
        Tue, 14 May 2024 06:36:18 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([50.204.89.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13699dsm97908565ad.239.2024.05.14.06.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 06:36:17 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Extend sv39 linear mapping max size to 128G
Date: Tue, 14 May 2024 15:36:14 +0200
Message-Id: <20240514133614.87813-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_063619_923705_FFE22BBE 
X-CRM114-Status: GOOD (  11.20  )
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

This harmonizes all virtual addressing modes which can now all map
(PGDIR_SIZE * PTRS_PER_PGD) / 4 of physical memory.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index e476b4386bd9..f37812863991 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -47,11 +47,11 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc6fea00000 | -228    GB | ffffffc6feffffff |    6 MB | fixmap
-   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
-   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
-   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
+   ffffffc5fea00000 | -232    GB | ffffffc5feffffff |    6 MB | fixmap
+   ffffffc5ff000000 | -232    GB | ffffffc5ffffffff |   16 MB | PCI io
+   ffffffc600000000 | -232    GB | ffffffc6ffffffff |    4 GB | vmemmap
+   ffffffc700000000 | -228    GB | ffffffd6ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd700000000 | -164    GB | fffffff6ffffffff |  128 GB | direct mapping of all physical memory
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 115ac98b8d72..727ed7887cab 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
+#define PAGE_OFFSET_L3		_AC(0xffffffd700000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
