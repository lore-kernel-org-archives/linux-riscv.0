Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6636BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 06:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=op8MyIQkWr8z6jrJx1wsQ/l98brkYREfcKQ8rQ8LGAU=; b=P2xCi9LzDP1luT
	HDDTu32UQwRLwqnLlzzo26m/BVdCI1npxWhoJeYzFhO/utlfRlW+NvhJ/hDcOElGcHo1OhAu/Ii16
	PYai0CK9ljzXGUew5E4iWDeFZbjXu4Teo1Bi5MUvSBIhggEVSNGK2oCNaCIMsmiVNwM9Fo24IoHzE
	Ro03JhmMEYTEzjv3Dwt8XTxnEaFXTdmgWCz2sn3ESTVM/+k5SD5BKTwpM8lJBiv70o+xciqiLTVti
	7S3B8B2aTKPjJtCxBPxuUZkhVQPSe6/zP5SQq2/kVJ1HV+j2mgi3f8koV4OCq4oavJl42pKTora/I
	SfnVd8+QpFlDZbmAGdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se7TM-00000005vQn-315Q;
	Wed, 14 Aug 2024 06:27:04 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se7Sw-00000005vJU-0H4r
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 06:26:39 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7095bfd6346so3469362a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 23:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1723616795; x=1724221595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwc1cv5BO+5rtWkwftD9LNj15+/yJ4czUcQ6aWmdEAM=;
        b=cgNZN4gn5xjIcJvu8eVqmHk+umH2odohUOUEYSb5RXKMvVgXrhGKBP0MaKQDyehXrx
         V6s6FGZBQsWJMDrkS8j8YL6e6dBJ61EuazEvuiWvh+rQ8sOZCY+zMYB/Jba6b/JKxeJT
         CTTvJSfXd3gW8eKIU5pF//NP5uHS10rKGmBJ2gmwf3ctx3ETYROZsDFOhKFH1szM03Fq
         7BFlyeLqG+XUFrEBFhR043Gt2Wy45QNikDi8BXfYwnF4A7zGmD6nEWfULT8RyIDzb8UZ
         GIzztL+3iXZTxJEkQ/WmBjiFeQ34KMRy4iA8s3i9sO2+HysKbwBu5NMdHxS945lFPxbe
         Pf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723616795; x=1724221595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwc1cv5BO+5rtWkwftD9LNj15+/yJ4czUcQ6aWmdEAM=;
        b=tOdhPps5M6R4psVGXS9hq77lSPnzhdll9/4XUzgBaANc4Y6HnvcRtVdUsnw2Y5cPKJ
         1BPEDOuZMAqzJB5YyTHam5GuZSj0G2C4RsTDqWa5TLZM6SJxXNsNy1PH6NN0sfXCQScL
         Y3SddJ/ooM66XuH5l0AtdGD+n3U8Pp284mm/JrHW16oUypnq0ibuQotfKDvbVdCrdNR8
         9gy6NJP+STTZz1C4nel0Mr1XL6mD+4C+dS2fqvB+G03QhaoihYBSCE8kKsJ3jqMWoxXn
         dAlqQ9tLHXvT3afcsGnjVaJwElXmjka/b7Cv/NdJB+g520n2AFwTCJu4FNaNRindIDTR
         9qgw==
X-Forwarded-Encrypted: i=1; AJvYcCX88zwWj+F+Ixwulw3ERZfycupmxfsgF5ATFlGhhC0Cs6HLjouLig5PJfZSMkeR0rU8P00R6sJboRAX4FZVmiwtiBLgUmFscKAmpM4VwVSg
X-Gm-Message-State: AOJu0YyewGTeno8sVFt2z2J6U+teIertM8Hyt4J098co6ST4M/pGQaXb
	BtxyNqKjYG7qY+aRh2BGb0WY+RThAlYqYWKGLkeiNZSfJwWQWpG886UFKa0FQ48=
X-Google-Smtp-Source: AGHT+IHhAfduYALo1MbVjnUfBA1qOzcpqiHc4wEVXsHl2UAtIqJNFPxWlDnMgRPWfrE1Cw0gPMFWRA==
X-Received: by 2002:a05:6358:33a3:b0:1aa:c71e:2b4d with SMTP id e5c5f4694b2df-1b1aac478d5mr176058055d.20.1723616795453;
        Tue, 13 Aug 2024 23:26:35 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a55de3sm6667484b3a.139.2024.08.13.23.26.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Aug 2024 23:26:35 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	cuiyunhui@bytedance.com,
	chenjiahao16@huawei.com,
	guoren@kernel.org,
	vishal.moola@gmail.com,
	stuart.menefy@codasip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add a warning when physical memory address overflows
Date: Wed, 14 Aug 2024 14:26:25 +0800
Message-Id: <20240814062625.19794-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_232638_398901_9CA2F123 
X-CRM114-Status: GOOD (  10.00  )
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

The part of physical memory that exceeds the size of the linear mapping
will be discarded. When the system starts up normally, a warning message
will be printed to prevent confusion caused by the mismatch between the
system memory and the actual physical memory.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 52290c9bd04bd..c93164dc51658 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -236,8 +236,12 @@ static void __init setup_bootmem(void)
 	 */
 	if (IS_ENABLED(CONFIG_64BIT)) {
 		max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
-		memblock_cap_memory_range(phys_ram_base,
-					  max_mapped_addr - phys_ram_base);
+		if (memblock_end_of_DRAM() > max_mapped_addr) {
+			memblock_cap_memory_range(phys_ram_base,
+						  max_mapped_addr - phys_ram_base);
+			pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
+				max_mapped_addr);
+		}
 	}
 
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
