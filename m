Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A486C47255
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pI9soNogU80XiyZbUwuLGYcabKkKxZNfXSAT7E6OUo=; b=qPkfK6jMfBFMrI
	zV8ZeicX+2Z+4raf+trWES/Fd6bXBbMowCCFooiJImsM+UJNkDwvjt6ZrCBsrmETJCJC6mVakXziF
	lXvwhOjF9Lfy+ei/5tMUkaNIUTeO4IRXPmLX5P060aHCA2IiKd9zUMK+n5IRm/dRrLXkJi9Q8G3si
	vxwW0e5CW7DAyyuvpzxTQ5+r43Ax5fOAqfB42CSj3qyOfHjF82WS0+nPwcQLNggintwl7miX76/3F
	Ka5eX/pimn0nSYxhksRjf//d0fyGhAYbHAz1ek0djdXFrguF6sQ1w/KHC7xvnvlm4JBLKzmBM5ABy
	z8RDz0mHUFOmdSs90HzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpa-0098Ve-3D;
	Tue, 02 Jan 2024 22:01:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpV-0098RL-0y
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:47 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cdfa676fa3so5020530a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232904; x=1704837704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tIOva8KFaIwh3i+98q+ysPtJyT8vpZl2kFy86xHGzc=;
        b=dwkeTbwtiguGYVFXDVPu9wXqcEp1q+C2cYPW5HFjclsgF95hH9DpDLtjo/TH1Qq/cb
         r+3hIvpaa9pipvMGBQsM+LK0u9ZSQ9SOr97fQ1gRFNQlEssk6aZi+1PLdjhaHfvGxxL8
         RGdvIRDxbK5pFaO2tIIXA6lrg7lGfLAMqVaN+a3xoQZhf9K72r6bTqBt0s/+8VmmFzIl
         sGzPqQHf20pjUGYdGVRpovozTkf0Ih45PaY3a5syEFPFdf3dL+eyJ+WR1mlJ+cI0X7Ht
         1yhI/0Jmko9XalsmN1t0j9hrCT81kr1IMEtt2Tq2/g9Yv9SOqO6YWkBE6bSQ49VxHZov
         +Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232904; x=1704837704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tIOva8KFaIwh3i+98q+ysPtJyT8vpZl2kFy86xHGzc=;
        b=ExXfWqkZDlWEFWNgByBxRN9ISc+rMMSoGA3XlBU2IVYjZjoYFAAXHPYjPWxLHySu3X
         GERAOv5qFPQY6iEbb1OYW4s5y4RL5VblAZm0GEU/GGIh6ypqsOD9PRcMIGBZw9+ZjCh3
         l2Or2d7Xpnl3a+MTDNrbkS1hOU3JMq9hNRNmK/8foL1y3J41wY2A5vobGa3s4/2IqOTp
         S5tAshCfZtiBsgNw69F5At7L5xPHML6oYrenYfl0Hu4oc/9iH+3qBJIk0v09Hl8Z+z3s
         yXfbUpS9otm9DJqNH+2KffxiCRlBynTKs17kwXyQafvpixyGWBuZ8BKjjuxEB7Svtjid
         xfLw==
X-Gm-Message-State: AOJu0YyRNIXZs4B4IrwUieD1gF5NcBROFCPsxQuryXFnEs/wLs19MnWY
	0JrNmFvWnywlRjsGcCa1i/sWLcpfmUvFsg==
X-Google-Smtp-Source: AGHT+IERqoXqHCzKpOJ5RqmrnOEOyFJpME6yqKz2yoKuSVbxPLF5GZg8UdvpqpiYsRMOZbO3DMheoA==
X-Received: by 2002:a17:90a:d90b:b0:28c:300d:d858 with SMTP id c11-20020a17090ad90b00b0028c300dd858mr127429pjv.20.1704232904383;
        Tue, 02 Jan 2024 14:01:44 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:44 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 07/12] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
Date: Tue,  2 Jan 2024 14:00:44 -0800
Message-ID: <20240102220134.3229156-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140145_380556_9D2AE95C 
X-CRM114-Status: GOOD (  13.52  )
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
index 002c4c2620f3..d9913590f82e 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -58,6 +58,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
+
+extern unsigned long tlb_flush_all_threshold;
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 292d7cf3c4f6..76b24d4ed4ab 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
