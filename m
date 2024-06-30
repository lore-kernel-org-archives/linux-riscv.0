Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331B3C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KP0ImtwiKvxUHdDPHndhtGD9dD394LKq+GwlW8xPAhI=; b=Y33J8YVltvYcHX
	ckC0hEG+ZUPah9qQbaMEjiRIoGvuw8oeeuCda0sxtO/urSQw/N5ijuiwRENeCtnKbHA5flLSsKtvA
	dN0zYtVARzEbM2jnZZkpFda/DttzuWmxmfk0IwrB46GqBAdyYzcY0aDZrDVY76ZmMV9dljNi/2Z9T
	3TnZ047EbFmzPAhr/ybq3iJQ+bHuthm97dyrRQ4TDUAUHSAFnWdr4Wf3XBe7olXsSTUE+ELCcC6Lg
	hytcxm4ebb3ZvxOwyUCzQsDRiT/tdXLQ+nbjNLSYGQg/U8ZkXzcHayGb06g2/kD5/USoLfSeTtSZg
	IJfZzz/+r/5tlYqwx9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNsNz-00000000HiT-3e3B;
	Sun, 30 Jun 2024 11:06:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNsNw-00000000Hhu-3UnI
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jun 2024 11:06:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-36733f09305so1156048f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2024 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codasip.com; s=google; t=1719745579; x=1720350379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjW7qbBBooXO2YCGv7moaJ34uYcCR+XgnWB+1lWKJdE=;
        b=FetvBAjD/vctQNCV/+sJafkUwkskB6XQl2bJUYdXGhw+GAHSIbaqeV1xYPUKXfvYMg
         tl+gECeSgS+aOS3hj3PETEDoc2DV9rGJAQVv8OVnazs3a9CqJCHNEBvE+ZQHdE2ywcec
         p8xGbUDiZcY1Pt5W1MR0RJ1tEQObEpz3wj5nV8oXyFWm2PGSCq12haGO+Phrt5bYXIeq
         P6HmoeAjGsqtDv1GzaXdCqiQbtQa3qxiy78YMiLrGHmsZAQ1QFq4j51ADoECv/pzRv0R
         CL+hUglwL7sdfhhCEqwomcMqQgtxeFuhq27B+5I8nndceDjEwxER4iMWXQ6rahZ9GJhs
         wGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719745579; x=1720350379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjW7qbBBooXO2YCGv7moaJ34uYcCR+XgnWB+1lWKJdE=;
        b=vecRA/m4MKwIH8nR45cFWeC6WNeohjpXeJ5tJBogFYGKvKkH8LYS8bshkjEmcc7vaf
         8ZPh9AGouH1ddWJBBSuX98zSs9r1bRSriMEcZX68ifnbSDZNcOMMnCpOzyYiJJ7CePHn
         r+KQgMTiMfVn3bVtaoe2XPhYqdCNpCIKcv2wnzF6HPa1MPq5o3jkWNCVl0EyD0xxjpdo
         M7ZzNbVoH6ylC4uxA3x5XIgSBv6Arqoxk/dCYOq+oA0fxyUknQzkA7YUC4Ttblbcd7zT
         a1MZHrZMlZZbffNt9mR5DZZeRtTNML0V7kODgahGPjyppE5mwy5SA67bE2rqNfTcXmX2
         5+zg==
X-Forwarded-Encrypted: i=1; AJvYcCUWuOFa30RlOIXUoHW6QrEuLjusbST5z7txLouCQ3xD02Z45RVwYDt5OUPx2cmyZp56OU+swndip+oFZyJT7PQA31gHLRzB3MVHO4rMaiBs
X-Gm-Message-State: AOJu0YyG8to+1M99dp2Y5GQcVxeGXSQLyhV8RNRrjChwcitY4QZdyV9w
	p5dktlc0bxXmlgwiasc7w5+LjC+nPs/yjcgIv4cItOUM12njaNNsSjVUvsGhjsk=
X-Google-Smtp-Source: AGHT+IEvGYJuscPCEUzw0BBrWd4sYa5asBO8etIxeRFC+suVG1W50JfPw2PlqeU2vd+9krcjevMglw==
X-Received: by 2002:a05:6000:1e92:b0:366:e8ac:50b2 with SMTP id ffacd0b85a97d-3677569952cmr2084407f8f.7.1719745578699;
        Sun, 30 Jun 2024 04:06:18 -0700 (PDT)
Received: from nb152.user.codasip.com ([2a00:23c6:2008:8201:ed43:a615:7f98:da0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0da004sm7159415f8f.45.2024.06.30.04.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 04:06:18 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@codasip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Stuart Menefy <stuart.menefy@codasip.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Extend sv39 linear mapping max size to 128G
Date: Sun, 30 Jun 2024 12:05:49 +0100
Message-ID: <20240630110550.1731929-1-stuart.menefy@codasip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_040620_905759_DBDA14E0 
X-CRM114-Status: GOOD (  13.51  )
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

The RISCV implementation of KASAN requires that the boundary between
shallow mappings are aligned on an 8G boundary. In this case we need
VMALLOC_START to be 8G aligned. So although we only need to move the
start of the linear mapping down by 4GiB to allow 128GiB to be mapped,
we actually move it down by 8GiB (creating a 4GiB hole between the
linear mapping and KASAN shadow space) to maintain the alignment
requirement.

Signed-off-by: Stuart Menefy <stuart.menefy@codasip.com>
---

Changes since V1:
This is a modified version of the patch posted by Alexandre Ghiti
<alexghiti@rivosinc.com> [1]. That version moved the start of the
liner mapping by 4GiB, but was subsequently found to trigger a problem
in the KASAN code [2]. By moving the start address by 8GiB alignment
requiremenents are maintained.

[1] https://lore.kernel.org/linux-riscv/20240514133614.87813-1-alexghiti@rivosinc.com/
[2] https://lore.kernel.org/linux-riscv/4011b34a-1b86-42c7-aaf6-3bd297149f06@ghiti.fr/

---
 Documentation/arch/riscv/vm-layout.rst | 11 ++++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index e476b4386bd9..077b968dcc81 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -47,11 +47,12 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc6fea00000 | -228    GB | ffffffc6feffffff |    6 MB | fixmap
-   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
-   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
-   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
+   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
+   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
+   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
+   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | direct mapping of all physical memory
+                    |            |                  |         |
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 115ac98b8d72..81d47fbbd927 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
+#define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
