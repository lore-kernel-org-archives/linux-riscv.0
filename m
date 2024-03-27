Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8457DC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/0aBd0jCMuqrVKN3Fmy1lljujzzw/vR+Mmo9prsuqQ=; b=Rhh7QVU5O0bBXk
	gPtq/QmF8V7Mfe3TgiPOAgGrRVcvyv/mzHHRsK1IIfkxt56iNO5zX+9RzyQ7FNZLxXOyiMT00os4X
	uiVNm3L0x+mWL/ZIbu6Y6mkfgCM7x6Xduwc1bY6GFbgqJTtqW5+AwujiwRHfhmJrUagphxJYIBwrL
	7dLAiz8Wm7X7Ju1d5Yvzyskna9ggbT2J6SXIgG6cYAwCs5SEBx7oD/FS6FLvHl07n6Y3D4WFlmlJh
	1MoEyBFLzuQtSxVW07T965lRBor4LSJyOVa1+MY1c8/4MgZWaTLq1ecPNIZ1Tpz66QBrQvWhjvSC9
	N0sJeNeb/ZtrYDfiG1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMNR-00000007bkk-0F0E;
	Wed, 27 Mar 2024 06:03:09 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFm-00000007SHO-099h
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:51:12 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5a58009fe88so512009eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515063; x=1712119863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DStjBcAn1SHrL/HpDMugRz0dC8r4hdt1hrlyujsEs2s=;
        b=Mjv7BPCmksj3UCvBBEhJNei7Kpbmx+VJbhCb6ot4XO13Awm23VHkEXQ3kA6CnL5jNW
         zM8rXs6jUCNxR8ulwPfFxzvtC5zBzXLdE1/FODhmoaOCObHPTVRUPQ+j9ybghzEeruqb
         LSRbuyTyA8nHe6/h+7WZpEFkAtpBF3yyjUHxDbkI5f0n0Wt7dD+1iQqf+zDORkfgMKEN
         GGinxgXAeSUYBwmw2R9CAKIpvGNtIsolv22wZLVgPnRBb4dFEfARhhnNXbJbMcRXa9xx
         HNujjExkDlWH8OJBJsTBtu8KeickdgTjp0csLM+SF48MehInz+SC2k1MMqk+HrQkiYce
         0SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515063; x=1712119863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DStjBcAn1SHrL/HpDMugRz0dC8r4hdt1hrlyujsEs2s=;
        b=JVcf8WVS8iEysPvBB5WtDGQlg7DCVdUAHUZulF3dZ4FMR97w/bNVtmjoFhbqo5bKeK
         vxK3xFykg+YRUsiS5rOuZzX6KEHVLOg7fvMMQMbLP/bFEmp4thMqsSRRYTGHFy6RblWF
         85bJEB0uXFTv+jFQY28pSYVonFdVGGn6WSB+73DED7B3yhs+3umyGq7LBpZR/rnVzTq2
         /drfDGBUU6y+a6XPBhruIAhclUTo328TPHeleqEg4lqw9bCZSRTzDtvymqqiw1FXLVtX
         +Gni2gMl2He2LCFY04R1ExUZcMcHr3OPJ4v1ufVJwq3vW/Kx9uZWFyxqRh5mQ4pMqDzQ
         0dkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXejvL5DbfO8WsXlWWsxRrby7fIZ5UmfnrGAGukYrE78icYbH0uCXw1XINZ7ojbcKvIFnZPep9OqhQAQaU6jCWN8Z3ZjzghlsXLsGw98/U
X-Gm-Message-State: AOJu0Yycclp8Uf9qEKQmxz2cAbD4iBLMqe6MjwhU0p6vm1Nj0MO2Hl9p
	pFPA35Kzg8aMZjFHOXwT5WkWfGEqjIIrSTEIeo+zg7B9JQeU+kfpbm1sfSxUfVQ=
X-Google-Smtp-Source: AGHT+IElUFan01DMTcKq7mpLuQEXv/M6ZjDhhp1pW7v7cPBwp502ELftTLKlJV+xiDuinHxlNWw0zA==
X-Received: by 2002:a05:6358:520d:b0:17f:1d34:6253 with SMTP id b13-20020a056358520d00b0017f1d346253mr268628rwa.15.1711515063614;
        Tue, 26 Mar 2024 21:51:03 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:51:02 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 13/13] riscv: mm: Always use an ASID to flush mm contexts
Date: Tue, 26 Mar 2024 21:49:54 -0700
Message-ID: <20240327045035.368512-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215110_672752_218BC99B 
X-CRM114-Status: GOOD (  11.35  )
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

Even if multiple ASIDs are not supported, using the single-ASID variant
of the sfence.vma instruction preserves TLB entries for global (kernel)
pages. So it is always more efficient to use the single-ASID code path.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v5)

Changes in v5:
 - Leave use_asid_allocator declared in asm/mmu_context.h

Changes in v4:
 - There is now only one copy of __flush_tlb_range()

Changes in v2:
 - Update both copies of __flush_tlb_range()

 arch/riscv/mm/tlbflush.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 35266dd9a9a2..44e7ed4e194f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -109,8 +109,7 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 
 static inline unsigned long get_mm_asid(struct mm_struct *mm)
 {
-	return static_branch_unlikely(&use_asid_allocator) ?
-			cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
+	return cntx2asid(atomic_long_read(&mm->context.id));
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
