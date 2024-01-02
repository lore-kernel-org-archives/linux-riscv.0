Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DC1C47255
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li/VAFYbscj6f9+EV6EJIvnlY67sDrtoWicRX6372nQ=; b=0bO57mWS+oXfcP
	NSMToxdaqyBljJuzUv9qqR3Q9mdCJ0W9k/B+xcXAUTiT1J7+2HF9d7rttPObm/ZCPsHgW3Nw6UBbk
	VhEOg+eL/msSR+umB7JAtxHst+868/efjn+Bg2Hc/GBMSGZI0QpGGpcWoXFefjZt8Sw75PCJQAIcK
	YAilAF4DwEmnRgSLTPJB3nwZ2ifdH2nDmkuhfpEeQD/9V1h1CmvEgEGIx6v5XNPgTXFFrioBr576x
	T0wnvqCIft1r2BMWF/Q635Ujt60dx/9Bcx7NZcALvflpc6kDnj0LM4esvbZl1Tq1CYoRPZB45gOWh
	wipX1x+LXgqoecnkblgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpe-0098YM-01;
	Tue, 02 Jan 2024 22:01:54 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpY-0098U9-2N
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28bc7155755so3952313a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232908; x=1704837708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MROdnZxFJAn7brM6ye/jIKPJcvVCbRqlgsjUSxtP0PY=;
        b=JC/XTboG0Z+lnXJ/9qEPzwgW8aQcfd/HAYL1poXng8s5XiPkM30S6mdCW7FQ4ZHNIw
         ISZ+hYcdutjDSQ5McqQmX1hHwHwxO0OkszCjQW0sFKj0qQ91+xU6eeLvAuWBhFLUTqhw
         SnZ+qE+DAvjZUT2ByFKX5SQS1ZBEw7NNvJBMYueI8FAfAmjDt36p3VhJbwQjwt2jJcqC
         87DfIWJrXigyIC+JKNI/xzue1uU1YqwFVoaSQ7BBERq6BV9AqhR4FYL8BPInyXwrndT6
         tnv6C2i7K1tY15duSq7JkO4N1Dnq3xWc3NNoSG76dFEsvdqCrfBwSwuOaRfh1XegbjDS
         vhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232908; x=1704837708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MROdnZxFJAn7brM6ye/jIKPJcvVCbRqlgsjUSxtP0PY=;
        b=q49Dlxqr9Jt7lN1s2DhiaWSHi7bIJXVwfIyhYe7H6FphxZWdY/2WBGh+T7Br+e0Arc
         q5JMa4fz4Kadong1FoScQvJGfaj15dUDpPLr7lyTeYpKe0tgG55V+DL0GFetmKGy3Tj/
         PkMRANfDo2TsDsy8tyMbY0mIV1pPpf1ZT+VXBBGSaBgbE1xOa2ADZtrwMgjNJSFkok/e
         IkT9xkJc/WeCYwd3vwk4MRmqvCbqB/KrYkfYZtyeOOgt8uYPQcCIa0TWfkOU+zix0YxW
         8WChLKZDQ/LgNcP435YLrbaxqFNNhKpKpvMHrDiGYbRMibBhQ6kP0h1OcYVNg3kkxuVt
         qxXA==
X-Gm-Message-State: AOJu0YzCcLOpgtcIjAiLVceY/OuDoOoast/3w9X/s1vxiAPNksAFUC0C
	gW12WB/iZI/e/VV2Yy/WgFyKGZO9JjFY+g==
X-Google-Smtp-Source: AGHT+IFQ4MdRufOELZ2z13xg7yZ/1JoYbB5tE+2va7NZu/tN1uOevH1SKPh+nsWqBiMa4TjGPndiZg==
X-Received: by 2002:a17:90a:5c82:b0:28c:2e1f:8bf2 with SMTP id r2-20020a17090a5c8200b0028c2e1f8bf2mr4930306pji.84.1704232908323;
        Tue, 02 Jan 2024 14:01:48 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:48 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 11/12] riscv: mm: Preserve global TLB entries when switching contexts
Date: Tue,  2 Jan 2024 14:00:48 -0800
Message-ID: <20240102220134.3229156-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140148_773278_35FF2325 
X-CRM114-Status: GOOD (  14.86  )
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

If the CPU does not support multiple ASIDs, all MM contexts use ASID 0.
In this case, it is still beneficial to flush the TLB by ASID, as the
single-ASID variant of the sfence.vma instruction preserves TLB entries
for global (kernel) pages.

This optimization is recommended by the RISC-V privileged specification:

  If the implementation does not provide ASIDs, or software chooses
  to always use ASID 0, then after every satp write, software should
  execute SFENCE.VMA with rs1=x0. In the common case that no global
  translations have been modified, rs2 should be set to a register
  other than x0 but which contains the value zero, so that global
  translations are not flushed.

It is not possible to apply this optimization when using the ASID
allocator, because that code must flush the TLB for all ASIDs at once
when incrementing the version number.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 43a8bc2d5af4..3ca9b653df7d 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -200,7 +200,7 @@ static void set_mm_noasid(struct mm_struct *mm)
 {
 	/* Switch the page table and blindly nuke entire local TLB */
 	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) | satp_mode);
-	local_flush_tlb_all();
+	local_flush_tlb_all_asid(0);
 }
 
 static inline void set_mm(struct mm_struct *prev,
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
