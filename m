Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A9C54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpEDhXIF8JMzpBV5mT6dS8lMs7DdOAo958v3Ukr6Co0=; b=wJRRTU/kFCkJeY
	ta23JwvW9LYQycOKEjrYsTsd+MEqPbtBO5inDEhkdQZ4G06UuX8Qal1Y68FBLF+8P0Gw4y/zynv8p
	h4mh5CJaUvAdObpOs35NbVVcFXTCOlIBPv4b2NBtQZBg91pktZABu5hEwyWAqprbO8reox9hZsYfp
	bvDit4/AqeUW1zkOYR7XNO3uCWkTIl8OCkRHnzRJ/p/7sxT6I7xq4tA37MmqFv1px35JQfZZcOUyo
	4nZuHXjZj1khop8NfYHetnTdiM7GxjegBnSnuVGzBqPPes/65wZbm5anehCVWLGjl90Wh6Yyz5knW
	7AhQBWxKe+AGH+WqSKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjk-0000000FaG3-0Zod;
	Thu, 29 Feb 2024 23:22:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjK-0000000FZx4-1JUk
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:24 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e58d259601so911850b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248942; x=1709853742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHMbuRyYmPRZ8L34XsarFB0wBhmLHt6PApeEi+FQBPY=;
        b=Dcz9I2Y8SfIwBajL/i1hdnInmExPwVquCghDviZFtBsU+mQ5/W7V9rN+xNphrV//+x
         uMQanPv2jEundL9a5IOA70D87OgR2sW6zF7KNWOZSigkhE89CaUzjZZR+sAxIDhtxdFB
         xU3PViqhISQSGg44/NOFvbXqEJ5okDmL3JYU0pZMn+8XOsPN0JKiWFViUbavPMNGtJQL
         eTYvtxD/XZLj+4kMmIBz5smDJ84bh9dtvn6+lUP7MzVs+mDYT8MOAdL2B/9v0CWQYjg2
         7ZqU8vU/W1KJZa5FjQSBOZeB+wXUdhWM4gF7wupq8Y8Xjxf9Ln9+wB60M7qfER2ArYFR
         TGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248942; x=1709853742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHMbuRyYmPRZ8L34XsarFB0wBhmLHt6PApeEi+FQBPY=;
        b=a2/l5BwWnwUKaRS2J94uuPrWeL4HdM3pubRrWWQA4dtHXgIKg2SwlrB3eo21/p5kOB
         /I0jqc6V/e3t98ukItxBDDPnlBTSauoAeMbgL1xU6lNyn4nw85SSKm8xshagPIThK+u4
         B6Jwhh2cWhxKpLNtjEIUJ0fc6jHiyVFnQYGat3H2eUUfFUUHreaV178Q3gaJJP+EkRQG
         5d9SXlQqAbntMi/kj11bfw2i5fSzpebPrns+p6V/37xBSGatHsU0YMg4pzV7o8/+7wMT
         +RW4NZDXvGtVF6sUKk1aj4LxW4ajSPI5wl5G26WcIv3AYM0WtyfmP2yLoUO3OMJ9jLDC
         Iatw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ot0D3MBsH+p2LoTndu9YlMWG72MTdDeAaKRo+kFN+3pwIS0Ko2oiGUGtNs5uUVbE8HAciVcEBqfBiZ1BqExEZV7JyY4bl0Bl6LC+HZuM
X-Gm-Message-State: AOJu0YxAvfyE8G4rRyWaoNe6XwC8F+Wr8UYlHN6JHhikLL0OVnLarhbt
	uBvz9EeX7sIMxeJgdk/HImimEVPSL4YoEsRbxC9f/3FNMlIiWQLNukS53VMppLQ=
X-Google-Smtp-Source: AGHT+IE0KT3RuIOZoiwK4WAulPfaiFPRjhF12PREr/S+YlSI1LgFKc32EbVKWDUbhqJfm1349m8bOA==
X-Received: by 2002:a05:6a00:1955:b0:6e4:eb29:357 with SMTP id s21-20020a056a00195500b006e4eb290357mr165166pfk.12.1709248941678;
        Thu, 29 Feb 2024 15:22:21 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:21 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 08/13] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
Date: Thu, 29 Feb 2024 15:21:49 -0800
Message-ID: <20240229232211.161961-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152222_495812_7F190381 
X-CRM114-Status: GOOD (  12.80  )
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

Since implementations affected by SiFive errata CIP-1200 always use the
global variant of the sfence.vma instruction, they only need to execute
the instruction once. The range-based loop only hurts performance.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

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
index 365e0a0e4725..22870f213188 100644
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
