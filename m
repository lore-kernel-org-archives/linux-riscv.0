Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E249C47DDF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pwVO54IcbnonTgqeq+ulT3to0gtJtroxDOyZvtfuKPM=; b=hmyXcm4Hhd8sHN
	CD14lOlu+A4+duo3R9Up+efbQD8A1FfUeVAI/rQOasTxhWfOslKfnsQhdFHUfDVOux+K3CgiXHDP3
	61VG20+v9cnWPaV4R7MyuNIQ0fOPSPgX6uvLsY9zWeK6z+SM+7xR1HYuPFqlcAHtlowhl0E6QocdO
	/jOkhJT7hHEi/Rt2n8z0p0Pmsco5G6qcs6w43vejCDMdef9xKQbjqfJVC6v5xm5YQ6on6USgT/4KW
	wWmsQnriwwpHNQTMQsKI7LL5PNQPU9sk+Ytxfrw7abHBJuodSxO46FUpjKyBPhFa4p05ufGKOxq5B
	CA9/AT523jEN7OAsQfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3tT-00000009O2X-2yxN;
	Sun, 28 Jan 2024 12:04:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3tR-00000009O1K-2lh2
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 12:04:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso31119985e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jan 2024 04:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706443448; x=1707048248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxcAjPK0N066N6P8kFzyYPkzX8zdfJo2IeOhtls9JxI=;
        b=tzuLdee1L+uoFqXNko3iUHe0VoPgagLhFUBaETDkewogO/tt0hWALnD3EqTQqplI82
         IxcyWJngYichKSjdlxr2xb1wARbxZ03PjbxNiwgtXL4il2VSliGnuGi7dVPajwU7dXdN
         wnL+TgQv0x60AAhzoYDXxTUBDmtbZ9hd9Kt9nU78UHxyxlhhvCXJRjGIrAF0QhwxTH01
         FTG6vHrhyfbxuXTrKUvAMJgDZ8KJkviN4UYys+Rgu8PYutCezM1j27uKvdLtXoJDOIJT
         rmS0Ds6KaQnQnsWLYcC5H3QKufhLXpb6Js6Hlgg2FVeqsWH8bYlGtKNb0ZGSpuJ9IC2s
         Q+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706443448; x=1707048248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxcAjPK0N066N6P8kFzyYPkzX8zdfJo2IeOhtls9JxI=;
        b=SYrAW+0RO9BoKIG00Zf2oyCS/3WyjobWT3IAV/rWgpez2qhO0H8PCa+UXOaCOhTapg
         eQ0FUNNn4mJQU4l0JdSKD48PXoi7uQ05RJ9NAEF/0dCuv/OZhyyRPVuQ0T2PsNTdkEHJ
         nD7Z9SgyjVgH/sD11wk76UrZmY2J4qGWFS56iop3AplhemQ6fojhAN41bHvbA6qnmbjz
         6HRTP2x8+54FU0Qk59Kt/UlMO4RpP8wC3Z1UWc1ILO9yQdWMLjsIzQMgy3mM4bVXxgc7
         ALyJCW3TAW8pezq90m2iDa/pxkHcoYt1sSmejUiYwMLkTKuV03XXPHnOX9vuimCyouyn
         N2Nw==
X-Gm-Message-State: AOJu0YxR5aqfY+BRkjLbigfRItknV0PYU80Oqp6T7B6QWnn+aYANYOY1
	Cb3ux8MrkyXSHvn7lhdh8gBk4ek2XjubSrnBZNx2gAmreqY6XhOuzEbLD8UhwOs=
X-Google-Smtp-Source: AGHT+IGp9QOplulvd/Y9t4bqyDTHP2SEbLG4SLRuZKPDPzRKkEqnxw5vDg9O8Y6f+J4FCQikbsMYxA==
X-Received: by 2002:a05:600c:34c4:b0:40e:ee82:18 with SMTP id d4-20020a05600c34c400b0040eee820018mr1937031wmq.14.1706443447739;
        Sun, 28 Jan 2024 04:04:07 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c4f5000b0040eee561e4dsm3859911wmq.41.2024.01.28.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 04:04:07 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Flush the tlb when a page directory is freed
Date: Sun, 28 Jan 2024 13:04:05 +0100
Message-Id: <20240128120405.25876-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_040409_738555_9D3351C4 
X-CRM114-Status: GOOD (  10.12  )
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

The riscv privileged specification mandates to flush the TLB whenever a
page directory is modified, so add that to tlb_flush().

Fixes: c5e9b2c2ae82 ("riscv: Improve tlb_flush()")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/tlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1eb5682b2af6..50b63b5c15bd 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -16,7 +16,7 @@ static void tlb_flush(struct mmu_gather *tlb);
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 #ifdef CONFIG_MMU
-	if (tlb->fullmm || tlb->need_flush_all)
+	if (tlb->fullmm || tlb->need_flush_all || tlb->freed_tables)
 		flush_tlb_mm(tlb->mm);
 	else
 		flush_tlb_mm_range(tlb->mm, tlb->start, tlb->end,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
