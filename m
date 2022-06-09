Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B244C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZE9qg+DyBg66JV+rw4SV7baajO4YiuhlOe53xJmYQeI=; b=s7uzMkzWQKY5b9
	dp8ROMmYebmQvDVYfZrP9fHQdLgTyiPofhfbPNKfAPwsd007m53N/1pQebgLZpLYm6fOr6qYH6U19
	ktKjUGhqpV/Tjjv7rmHx6u5loK7pnzzILkq9I5MyvewmjzPdsEMvlyTDC1Q6bu1j7EGAh0kJxhXGS
	e7FF34hu9/CERJAYTH/Xur2VmP5ZW8jbHUeoSqhvWhjAar++CEnD1ZW3YMpYinj6yn1U9J0FuPOdJ
	mqy6yw9w1geKACxGwT82XLmND1PresYoqFi2i7ZlEyZU8HoCbMy14mriABl0Ed26thf1829JWdap9
	6hcKg5zDcNh8POQSqlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUZ-00HLNH-GP; Thu, 09 Jun 2022 07:22:07 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUL-00HLDu-L0
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 07:21:55 +0000
Received: by mail-pg1-x52d.google.com with SMTP id c14so21031614pgu.13
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HpuvYWMEMKGTGseyRFaR/SmptE0tu1RotJrhX4BYIKc=;
        b=ajq9/KAuL5WQD0JRjpTfFKSlxV9e/ZMexY4K3Y0Qwy0jlxfQAdfh9iIu7YyuRoh4kX
         pW9uqOZeCvOUFmkqK47DXjLetMSxasUkRL+QKOo6yw3J2oShB8pLtaznQNMYP6xcOLMh
         B7udbCCdxd7fv8RU8Ombl1Ck+MwdSFhFWOQqTGl4FY12U3DdI+F0LBUTLm5Ooppr2lp/
         Cz3XzLPiYvQce0QlGzWA8SgQlzxTPuQolu1p6B/ZRVEXFqwFcJl9kf9ud7sDc0VBiEEu
         zDcn84w6P8O/OjiY25S7rNgliEXsDWHN/gBp4ZOiKuMMnweohljXOq2zCZQ3y7S6tgVy
         ZMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpuvYWMEMKGTGseyRFaR/SmptE0tu1RotJrhX4BYIKc=;
        b=Hu545lyv+etCPQrbwotNLupQDfllDzkFYRlkdDea0sBxwJOn4G3pIqPNFQsrN8RiVG
         UP6A1Kt/10WLQt0jugUITrFDMVIc3jWwqLF9RWVMYkgCR+p4gctUWf1ONwmMYBdiVtNa
         Yu2ZDVwpQLZGMscQkWmwMy0qm0/JEsyjXyKLU/7s968RxY6lk5ttWjfS27xPCYTtuFUz
         Y2iVrqP1J95rH771Tce6z1K+lGCFnpxxS1f+r3HNrVX4TTh18i+wAFVUSWqZ/9BAHjBT
         0Ymw/46NbggJuXyB3tPMMXVB3ARRNZ4HjJ2SpEdZZgo8H8uJNoYGZ5hzps1U5fpJ5qlJ
         NS+g==
X-Gm-Message-State: AOAM532T/jxYbmm4XOsR0MAkagm26bpxabRqUsNMAgcO0eZvXLiPQjwb
	iKsL8jN14K2BnCstIRsIfM2cTQ==
X-Google-Smtp-Source: ABdhPJzPqB69FJX8urSlO+iIlKbbXE28lnDUojQCSIGngr691xKK6mg+RQRSz/1H750gGrEUX3oFpg==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id l11-20020a056a00140b00b004e12cbd30bamr38906169pfu.46.1654759310599;
        Thu, 09 Jun 2022 00:21:50 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id r2-20020a056a00216200b0051bd9981cacsm12952572pff.123.2022.06.09.00.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 00:21:50 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rostedt@goodmis.org,
	mingo@redhat.com,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	zong.li@sifive.com
Subject: [PATCH riscv/for-next 2/4] riscv: export patch_insn_write
Date: Thu,  9 Jun 2022 15:18:31 +0800
Message-Id: <20220609071833.1051941-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220609071833.1051941-1-andy.chiu@sifive.com>
References: <20220609071833.1051941-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_002153_729331_5DC84548 
X-CRM114-Status: UNSURE (   9.84  )
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

So that we may patch code without issuing fence.i

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/riscv/include/asm/patch.h | 1 +
 arch/riscv/kernel/patch.c      | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9a7d7346001e..327e99114d67 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_PATCH_H
 #define _ASM_RISCV_PATCH_H
 
+int patch_insn_write(void *addr, const void *insn, size_t len);
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text(void *addr, u32 insn);
 
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..6f7757ce50dc 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -49,7 +49,7 @@ static void patch_unmap(int fixmap)
 }
 NOKPROBE_SYMBOL(patch_unmap);
 
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	void *waddr = addr;
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
@@ -78,7 +78,7 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 }
 NOKPROBE_SYMBOL(patch_insn_write);
 #else
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	return copy_to_kernel_nofault(addr, insn, len);
 }
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
