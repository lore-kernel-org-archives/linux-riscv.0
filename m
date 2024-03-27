Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD97AC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndj9Pa4swxTbZX/sMsA9Yk9IZTwZOwfKqB5IycSgCks=; b=wexvIbtrNFYmAp
	T5w6i+o93ZPrJu7EkgqQ80TeBU+ZVjU8wa2HJXVgViDLGvt7g9UwtEahDF/4kH32OrLeD4tClku/+
	gah2FWTeLYBsNOfthQ43j+y9n+PeMyOi3T6gDle35NE3htolFE1b9QLn2tY1Gb/fOlKimI94U4nxv
	+iz6cgHdYjrlUV4bRdIdyIh70fKb8NpWb3/9bdKWuQ6ywbxzslbqDBO5XvIC9l0mqlhMAuinQ+yb+
	jrfrBeeFv5+Gd2Tcf7DgRPveS6wP6kALB9C3bRWiowphUBN/jLts/BfkWQbNqfHxHD/+YG3ARxmp9
	eBpuKfxxSDdjEEhH9cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFl-00000007SLf-23I4;
	Wed, 27 Mar 2024 04:51:10 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFW-00000007S9K-3bBF
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:57 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6e695470280so3200749a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515054; x=1712119854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DMxbhiunBS0lKLURYVBJG3nyObzwUO8ZrXza9ckh2c=;
        b=DuZYa9wn6B7OAYl4LZlptRs5sgKJEINP+E2oLua/pB6Sy8wmkvsmD4KFJN5Grp46JI
         IB2qCFnI6buX2/x94+wAXWaHNV1cCIF1dDZoRpcqwDk8OV3hKK3+JlYxWH5F9rQoYV6t
         GFjyXogA/Wi+SYP1ZCJyYtioV1TgZQWjt8u8+lbEkv9EdIUY0OIO9/wJlksKNKLnffTA
         CkGMezpG6QuZdhIynsaXSNvrHLdufkBXeZD1twz1oldattNntiGCOkO4iDcm2uy4CYAA
         apxyVQHaPSK22R00rUlbiCaIvIOG8Fk6/dR4AvBrbqjZkMjx0dgM6WEdEFHIZJqCAsfW
         d9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515054; x=1712119854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DMxbhiunBS0lKLURYVBJG3nyObzwUO8ZrXza9ckh2c=;
        b=i4UXgCZ7+5QznEq0Oj953AqZUyHBdZ4tPSUDD7P8fAWva7o7WXg+9+vuwp8bZxJVG7
         cTwcyrJS+HrZkt/QVjmBrpJOsLEd4jN9ka4qyThyiE5zGQn66+6Vq7e+YnyL/Q156DUe
         WZ5iOId0PmTXLPcsgUWDFiPlq4goezgI4JGiPeMYNkt9zSl+tPy2AHOhwm/gTDHNV+yP
         7/NBqPYPIsse9UY2XKIgNY1Z7mPjKKixnmQn0yayzBfQKgKgKtu8vezSv9D0kh0uA522
         8Sw82ACKOUV6paj2Q1NvZ82IEAPIROf03foubK/hfyS2H1mmiSFhUKoEXNU7Lz408NIC
         hCRw==
X-Forwarded-Encrypted: i=1; AJvYcCXXAh9ayhq2+mEDujywqXhqnh6femLy96oP4mTwXuZFvxGGcbiD3txb2d84wi/JMO1NLaCBrnxfxn/ar5xUi4rCd8BMitFFpyHvN4U4WEMS
X-Gm-Message-State: AOJu0YzwdjNEZkHv8oD4KhkqS+SLEiB7bGMq2w8JMxiSvfKYV3lhwmlL
	VvcVYSn9EB6sQ6761kunqi+HUKIicRGWMBK4bCyhDpy6RbGfTsI7xfPX6bjClWI=
X-Google-Smtp-Source: AGHT+IEKVJUxYPHGmGQ7jZ/KC0+y46rPbmkW2DQ4LqVeHQ3jmUBdRhZe5PVjdoDThc5iPwQM0jPRUg==
X-Received: by 2002:a9d:61d8:0:b0:6e6:9af5:752b with SMTP id h24-20020a9d61d8000000b006e69af5752bmr1730488otk.0.1711515053696;
        Tue, 26 Mar 2024 21:50:53 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 08/13] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
Date: Tue, 26 Mar 2024 21:49:49 -0700
Message-ID: <20240327045035.368512-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215055_265218_B7CAA052 
X-CRM114-Status: GOOD (  16.05  )
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

Implementations affected by SiFive errata CIP-1200 have a bug which
forces the kernel to always use the global variant of the sfence.vma
instruction. When affected by this errata, do not attempt to flush a
range of addresses; each iteration of the loop would actually flush the
whole TLB instead. Instead, minimize the overall number of sfence.vma
instructions.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v6:
 - Clarify the commit message for patch 8 based on ML discussion

Changes in v4:
 - Only set tlb_flush_all_threshold when CONFIG_MMU=y.

Changes in v3:
 - New patch for v3

 arch/riscv/errata/sifive/errata.c | 5 +++++
 arch/riscv/include/asm/tlbflush.h | 2 ++
 arch/riscv/mm/tlbflush.c          | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 3d9a32d791f7..716cfedad3a2 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -42,6 +42,11 @@ static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long imp
 		return false;
 	if ((impid & 0xffffff) > 0x200630 || impid == 0x1200626)
 		return false;
+
+#ifdef CONFIG_MMU
+	tlb_flush_all_threshold = 0;
+#endif
+
 	return true;
 }
 
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 463b615d7728..8e329721375b 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -66,6 +66,8 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       unsigned long uaddr);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
+
+extern unsigned long tlb_flush_all_threshold;
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index ad7bdcfcc219..18af7b5053af 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -11,7 +11,7 @@
  * Flush entire TLB if number of entries to be flushed is greater
  * than the threshold below.
  */
-static unsigned long tlb_flush_all_threshold __read_mostly = 64;
+unsigned long tlb_flush_all_threshold __read_mostly = 64;
 
 static void local_flush_tlb_range_threshold_asid(unsigned long start,
 						 unsigned long size,
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
