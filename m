Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A7C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHoe5KNagYjvSMwd5Sn2bkKbeLXl8DapvRyV1nQvDbY=; b=PfXGFHLmQuJk0Q
	lgCghzCEpHqXqd2zsLIebJA90h0fiaKT/cb7AXl43i+jpdxJgq3DX9qBtio0E7gErvbNbBgfH8LkY
	svqSbLHBOoW0IEY1//X5e9wmGosV+iFn6UCpi35Ow5yaAG5nwNlHBegHJxYuooTSlIhkY1+ckLBYS
	nDcfH3jNbyD2V7a9uyND1DS6l+CE9aP17iGTDSYx6f+W92f9Cp3Q62aCKIj0m9t/wvq6MAmPni0M/
	vjKSU97NaMLmow3IERHrwD12LfmkEemt/evedPU1N1u8mCSXeTdlKdYkN608U8BhtOtR27AiSYPl6
	VFYCkUf31dZvv+f9zphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpkJ-0000000Fagq-0khX;
	Thu, 29 Feb 2024 23:23:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjQ-0000000Fa0b-10pY
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so701515b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248947; x=1709853747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJvv9umwOkXOwc0iOvLk+NQYD7Mm5kACvwQaK1YGZP0=;
        b=IppuWwflR69UMGvB/EuLCzKdSDpSrFMCFnJ1Q1RoB2WRv/sxezyHOkG6ALdIovxYcP
         OZMmattawW6jigP5yoCU8HeyJ/ki4dUAey7Gh3e+sxS1HUD3+W0Bydq632GxXqrmTVG5
         Jdw8Fl8RxullLDdaYnew+gpJF8JEFF+ycumsFIx4RoATQDn7pXSr8ofdsJaaGqaiEGeA
         RvSgEZ3bAs2+6cbheNwC3LqfqtGHbQrmHJVbwWm5GxkvWOsIZP/7opqxEM2vNeMQ0wTm
         b4cEJgJbjS3RBQK6rzNieef5iq/XEu6GtidqApsiN9z61lofPK7yuMP2ngMwrbEscPYj
         mkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248947; x=1709853747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJvv9umwOkXOwc0iOvLk+NQYD7Mm5kACvwQaK1YGZP0=;
        b=qm2Jj4HjYu0f4Xqsg/mwzeMjnhEyjcebaHHB7R6vNSbCZ4oEkQt68/NyQ35I8sqar8
         iP7bq6ZDh/kpsxDDg60mPXcWMxWtG6qiYDpfG5tn5g5StoN3hMGJdokEAaFxHslUkYv6
         LuRt9bKuyP7URrKlL6Y6yRyKYDn08PQBDdxf9dj214BtpzlvX14C7bNKyv2rxx3dcPe3
         eOwr4eu0CbtxxCmfKVpZUFMVDNy/xIoZ7HydIHcoL09nvc3YIrLJS9eh/byGnmnZkld3
         YT3AaoSWx8K9RUiKIm1dje9YVhOpUDsicQ9U8EyOzs0EeDu5q+HqORLE60fZdFokoYuP
         omoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaajGZDYR/0ZeXBl8T6YGUu+ZOlDky3wxnxx11R/QesVYOYdGMDub55vtFuN5v9SHJJAA05KlOL4SNQvcsTjHqURduwDcowpdL6NJQ/Uo3
X-Gm-Message-State: AOJu0Yy9pOpMSC+gdBbDO+hn5tkYGayGpZzIgtQ01mwNOFFopDuTwe0Y
	AW0+fvp5jH9Q7mMzaqNSjYuYNd4g36qCNxWo6+dCJni7vzMGWS0wzRm3seKUiJgeQQ/7kJ5kCfH
	k
X-Google-Smtp-Source: AGHT+IG000bMn11OdL3LH1zGovTy9Qg+UUgYE8CMrW4h6bNv2nzitQBp1dzsEHx4shrcmNE8zaAVpw==
X-Received: by 2002:a05:6a00:27a3:b0:6e5:3dea:bf51 with SMTP id bd35-20020a056a0027a300b006e53deabf51mr562992pfb.7.1709248946831;
        Thu, 29 Feb 2024 15:22:26 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 13/13] riscv: mm: Always use an ASID to flush mm contexts
Date: Thu, 29 Feb 2024 15:21:54 -0800
Message-ID: <20240229232211.161961-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152228_629864_AFA6BC04 
X-CRM114-Status: GOOD (  10.84  )
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

Changes in v5:
 - Leave use_asid_allocator declared in asm/mmu_context.h

Changes in v4:
 - There is now only one copy of __flush_tlb_range()

Changes in v2:
 - Update both copies of __flush_tlb_range()

 arch/riscv/mm/tlbflush.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e194e14e5b2b..5b473588a985 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -108,8 +108,7 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 
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
