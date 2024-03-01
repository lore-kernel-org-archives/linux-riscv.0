Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D9C5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UdlTaMpXNq6y4YEX099V7gz3lgFRIvrO8GzG8rmt/ro=; b=bGJo8GW44YIukt
	zus/GuKBIcLrIyALC7UnE80f3dXPB37DpAgtaV8BM/C7RD4M3INOJLQvd9Muk9Lfpi+DWCsuK4rvp
	+yoIC4EGvx1i3kUrfcHSJKEkRiAUZm29oVIi0pVMvxqdryFOQWcfWOY2M0Pkte9fS+O01TefDYmwA
	KdFG3LKcDgqxr6IJeWVAHDidmNotKXrnrZ6KDGRiJmeldEzsg6lsBt2wYFgqAuYRa5lz2+DcEBdMD
	HWZW5CxJAm/eQ+wuiapBuK3qGN3qyfs/hFAw5a6RUEQd8eDXsM8Y4TBqYDmYbhA+z3GMKFlf2dCS4
	Hu+pqCnZnu93g62VyWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg9L8-00000001rKc-10rC;
	Fri, 01 Mar 2024 20:18:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg9L5-00000001rJe-3aZU
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 20:18:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e58a984ea1so1873182b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 12:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709324319; x=1709929119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LB21/Ow/29CKfiD0k0+EGFc0FZT6nL4Wg3LThQF2Bvw=;
        b=F4za3Lu2Xo7vLR+M6PRGOvObcds5vzl64a6dI3j7k4bpl8Q6F1zo1TS3wVXqFrx6hD
         08P8kcuPkmF+bC1xUnJmlSOwGyCqR/yao5yw3ULlEPv4xzENTtL+MMtJ7VgIu7sdkVmS
         uQd7OMHbcmxS+Go47CLgD7NBFfcffwTJpGcnrWKYnMb0YYhptgvTOauiupnuWjyoQOa2
         5wh4UgHyVAoUckMyzWzyPAjrIW4DhmcLET8JgJ7tN9oFmGej0TnoGOC/5l37i+JZkhrC
         swG7eJv/OUvc09CODm+uyFQewXAf/tVfDhaiv0iw/8OhNhRUcxQD3FtOO3eeO09vzeOS
         PP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709324319; x=1709929119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB21/Ow/29CKfiD0k0+EGFc0FZT6nL4Wg3LThQF2Bvw=;
        b=xBAkv34srR5w0JZyf13shNYzu5CttdjYv3IgFIQP4IEVMLaXpTbr1HD/+ZE/iPbUwO
         /7K11tQIwYfNdB1nqQDWqep5/EkEh0pfz0CVqUZ5LAG+fsVg9kd6/mpNP0TdjH/ABlWh
         TRTXjPTwV6Imcu923v4mh1nnLylK2cXauXHG8IgQiwO2wzLMnX9gdRP/30PxEXogNO5X
         q/sfmQufQlY+CPkSQ4+D9q2ZZpMfDCxwPlF5CJzDcorZMufx++/kT1JX9FppB78ItDDH
         nRw1q7UXkKyR5/RTj6hu4VUXGde1Pc7bIyWwYgZlT2358aRSLiVc+T9xjHRN3aF/Y8aN
         y7RQ==
X-Gm-Message-State: AOJu0YwiLnL9pMuYe9vZNGptBH9h2R/Uzabe95gYDAtW7KsEUTcGsG6L
	jAEAe/HYv4hleX6uAeHEocynqd89JCOIDTUqwFqjXietHmrjXb/oh+EF4dBPO+fbuFR7In0eodj
	E/+rgP4D14QmSP0BbhgZhom45hKoCi/MpAw1zA3VHzj8jiGDSnmXw67+tUvJzQDvLuFAd6V3BCh
	IyYfe4ZUlvgyF1jv4+DckA7Nj4WsDJs9u1Yt9RqbIpKIBk2tJOiU2hD+ju
X-Google-Smtp-Source: AGHT+IExvcW1+DuFlfwWmifCp/Y/jBPrieVmeDTXpbxoxgyVqpNwW9a77bIovFcPZGGfBE38pSzCvQ==
X-Received: by 2002:a05:6a00:27a0:b0:6e4:f49f:bc9 with SMTP id bd32-20020a056a0027a000b006e4f49f0bc9mr3133223pfb.20.1709324318705;
        Fri, 01 Mar 2024 12:18:38 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id p26-20020aa79e9a000000b006e59688b828sm3364071pfq.19.2024.03.01.12.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 12:18:38 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Dylan Jhong <dylan@andestech.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Fix prototype to avoid discarding const
Date: Fri,  1 Mar 2024 12:18:32 -0800
Message-ID: <20240301201837.2826172-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_121839_975648_28B965DA 
X-CRM114-Status: GOOD (  10.24  )
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

__flush_tlb_range() does not modify the provided cpumask, so its cmask
parameter can be pointer-to-const. This avoids the unsafe cast of
cpu_online_mask.

Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/mm/tlbflush.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 893566e004b7..07d743f87b3f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -99,7 +99,7 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
+static void __flush_tlb_range(const struct cpumask *cmask, unsigned long asid,
 			      unsigned long start, unsigned long size,
 			      unsigned long stride)
 {
@@ -200,7 +200,7 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	__flush_tlb_range((struct cpumask *)cpu_online_mask, FLUSH_TLB_NO_ASID,
+	__flush_tlb_range(cpu_online_mask, FLUSH_TLB_NO_ASID,
 			  start, end - start, PAGE_SIZE);
 }
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
