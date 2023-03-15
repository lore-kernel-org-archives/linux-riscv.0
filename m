Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF9EC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FpDER7chDTyXGhTL/5aJFPeWNUlJfJX3rN6iyt+EJA=; b=x+8Fdci36fUZ00
	gK9NXrDeuNkl4u4pxiad7iszwRqKGdVq4WX3QSwzxI/SA74DQG+nh89qMsjuT8RHIQTbYMlODVJvH
	sIIyuxldYGp4fsOi/h9ys3LL7l2Fj3hDBIaa31CBkZefRIIn1A/S+1dk42wJb8RiXcc+Her2WfIl9
	0LbAIWj+LtPhBVXbaC76b6Am2oFywd+HznOfPQskvkBAjNPNusub3qoCiw7rhHiQtl/9eNSRCzoby
	9YAdzDEfoqdJNNi57ofDq40mhzmjt9WXy4jgkOOnDHrQtpChRguXjnytQa3Y1TGmIgoJfaSnzIYkO
	NCxVh4z36/DDmLGMBnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSX-00C6p8-0L;
	Wed, 15 Mar 2023 03:05:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSF-00C6i4-3A
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id bj12so1861396pfb.8
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849530;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CSfwyQHlQ4M4jXaSH+LdMi3uBUPZy3NPttk2ev1MeM=;
        b=4mZhqkrZl2MkO6B6mqEDLTirH3SlLVvooXtpQuTuH/xzUmMWO0qlG33s8kcsf8vR+X
         1FoOK2Rk0bJmVb+8FuKG/2Jxjnt0oUDaFG+VqsxM9hrbjvOV2ZarD+HZLutU5YIiAVXL
         IZDZQgKVdEkHiqO2TWB2SNLAlsr0Wiul9s5npuCAjeBOJ5joViCl/33dOtfcuNA0qTKJ
         wI89dyMtuHkmCnCcbUMyMFUQHfyAxxbiJrKXeydYHQhFoxpswgDnmjyFK1K2t7/bFmGC
         dvm2FAw3pTK46SBSowzA4dhLd1uqkTrpZPHWJKiwmyDolqIdJoRm8AiDKGHFgfo1NVtm
         xglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849530;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CSfwyQHlQ4M4jXaSH+LdMi3uBUPZy3NPttk2ev1MeM=;
        b=n1iG6yD7pEO68ERJGmyGAUNRF7nvl/NhVvJH7vPqkWSpV1puBymRYKb+NrPtTWyvF5
         AApUrY9Bct6qcScIEze5u/xQJTC4b/ZFcQ56BmHIK7OESmPvhyQxq3ghyDsVFZYrp9pO
         Dj47LvwwjQ7PFTOIuTVK9dBEMiPKqMHnB7TG2YcoMcYr/RUbGOdUvHaeC8UrWTRFe5jd
         kTk7mdqKotX+6uzxy7sFPS1xXyuwyD4l0RAn+1g7l2jBdJPuk+d5PN5xhvjF3+foSrUx
         B5u0OqHa9xNYWad+8DeHuPz7JgaBATly+7do3vz1lyRkVSHbNZvEqqhR6UjgYRB3osOr
         2FKQ==
X-Gm-Message-State: AO0yUKUDaxsMizo3QRgnNgnTjWlEeltnr+vydPbsNW87k78377Xmsak8
	sqTVsZCqeqnZqYQ5me3aFheP5w==
X-Google-Smtp-Source: AK7set9ZnZdofrFWQ0U8lJyHxwjbzhYXBh8dBYrjkL6TD0h/9D1nJL1aS2SUyiziKQzZO7kTArkNIA==
X-Received: by 2002:a62:18c8:0:b0:622:bdec:d49 with SMTP id 191-20020a6218c8000000b00622bdec0d49mr9133281pfy.11.1678849529904;
        Tue, 14 Mar 2023 20:05:29 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o6-20020a63f146000000b0050376cedb3asm2230300pgk.24.2023.03.14.20.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:29 -0700 (PDT)
Subject: [PATCH v2 4/6] RISC-V: fault: Convert to VM_FAULT_ARCH_* codes
Date: Tue, 14 Mar 2023 20:03:57 -0700
Message-Id: <20230315030359.14162-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315030359.14162-1-palmer@rivosinc.com>
References: <20230315030359.14162-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_200532_025679_FBB12AB7 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

These conflict with VM_FAULT_HINDEX_MASK, so move to some designated
arch-specific values.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 0a8c9afeee22..5b035c0ae782 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -202,8 +202,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
-#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
-#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
+#define VM_FAULT_BADMAP		VM_FAULT_ARCH_0
+#define VM_FAULT_BADACCESS	VM_FAULT_ARCH_1
 
 static vm_fault_t __do_page_fault(struct mm_struct *mm, unsigned long addr,
 				unsigned int mm_flags, struct pt_regs *regs)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
