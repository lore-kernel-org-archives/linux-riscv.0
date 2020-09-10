Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B0AC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF9420855
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="28vQqOQ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OZZuvrCM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CF9420855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvs0xgXDL3ERtwXFb7gib8kX3GnxtvuEDXm38YfXnkU=; b=28vQqOQ7av7qHh3m0nA6QsDOSm
	ySj61cA/WuLhzicP0GmX1JJh4UFV6Fio0jPB6Byw5axxZ8gNWiwiRU/bQRNEom6VZ4EPAAEkGvGtY
	3fw+ZCRqTPLDphvHNQZI9HsT+9H8Sx1ZMJJaY3sHuH6xVJVkfCHpUoPBlFkg3j09/W1yCPNFUyJfq
	pGGP7+0pkEFgMwxo413w5b3UmCvSPBbB3NNE/bOQU9AmZPZXBu+Hi74veON6vwoL7DjQz9A8UGdk3
	hif/z1wSStZ37s/Dzt0xlGO1y7DyAT5AJLFLFPAa3wnrZmXCnZOvSQuISfxe9D5Jj2C8D7/cUZ7no
	JK9Bb7mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhz-0000H3-Ct; Thu, 10 Sep 2020 08:13:31 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhm-00004q-PD
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:21 +0000
Received: by mail-pj1-x1042.google.com with SMTP id a9so2652777pjg.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XVF1RkRlNyjr4ZwKxBdakcqACyTLVz5RhfVby+r/t60=;
 b=OZZuvrCM/fVMSzDsPqGkcs1Ug1kb60GjZWJgGPcxppiDKKwMnzcrRnUsA5dPYnUB/K
 B37Qj9Ch3z+WfZzhg8cj+xYFZVBy6HQrls549qeKzHvptK/I2tXv2z00p7wO6r8m1cau
 TUobCL4MFOFdgMajtXCVjPg5V/F3yGL3ePOTAINZtP/iymisM8ch9Mt3GFQNq9k13x9R
 nGtsL8NJSZiVy6k3FJjFx+EcqLodkh6hRxdtcyxDxdRq2KtS3gmNEQuYUH7/5Q49g7IQ
 3wgiuAcDuA1+1iWh97dCClfXjK7MyE4UVu/lRwBBXUut/Vx3t7oXwO+VLOLCoN3TmJMj
 8cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XVF1RkRlNyjr4ZwKxBdakcqACyTLVz5RhfVby+r/t60=;
 b=YGU1EDyLUI+GXdlRkl8DyheCY95rpSUK2I6YB/YCiTkT061+jOH6dEwbabsc8Q8Wda
 hcJTUH4ycNzm8cVpI+QcgwLsuBVgkFG7PtP7qpm2SlAklAlVLfUUNrWsYn5V/hxV9KQ+
 uc2eZt6j/mP2eYnr5ruBQQXlQYKfXZrPb9DvWRbVwU45zRQwHj1tyDqb/RPetcp3h6Gs
 7oInlFm2aMifVD031kML3fFm8Pm/0ESOLu1U8rkSaQUdYCIjjN6e2z9TGIXkhoBsuFFk
 6RTHF1AqSXZSif8IOk0mZzsIcujTDui6aslbaPUF5RXz1QBa+hX4QL3E0HqmJ9v3/LLr
 lj4A==
X-Gm-Message-State: AOAM530sSdfo9hcRxVwLjokELnqYemeQCjLUXfjzxNnk64KIqkk07wEP
 DDSLX37dag64BFHAXgIWIJdkPW4aXVPDlpl0
X-Google-Smtp-Source: ABdhPJw19dAMc6BvCbvY2jkMxRJgSyngavAZ97Abc7uvsChgqFJWKFt+a0ixzwFgdzHyCRXh1ObWBw==
X-Received: by 2002:a17:902:59d8:b029:d0:89f1:9e2d with SMTP id
 d24-20020a17090259d8b02900d089f19e2dmr4668405plj.9.1599725596763; 
 Thu, 10 Sep 2020 01:13:16 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:13:16 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 19/21] riscv: Fix an illegal instruction exception when
 accessing vlenb without enable vector first
Date: Thu, 10 Sep 2020 16:12:14 +0800
Message-Id: <bb610d92b2cfc510b7deca3b2484598a10d88b5c.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041318_876438_9E21DD3C 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

It triggered an illegal instruction exception when accessing vlenb CSR
without enable vector first. To fix this issue, we should enable vector
before using it and disable vector after using it.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/vector.h        | 2 ++
 arch/riscv/kernel/cpufeature.c         | 3 +++
 arch/riscv/kernel/kernel_mode_vector.c | 6 ++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 3fc8d84e23c6..a99bbda7f4ba 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -10,6 +10,8 @@
 
 #include <linux/types.h>
 
+void rvv_enable(void);
+void rvv_disable(void);
 void kernel_rvv_begin(void);
 void kernel_rvv_end(void);
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4d4f78f6a5db..817980d38603 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,7 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 bool has_fpu __read_mostly;
 #endif
 #ifdef CONFIG_VECTOR
+#include <asm/vector.h>
 bool has_vector __read_mostly;
 unsigned long riscv_vsize __read_mostly;
 #endif
@@ -158,7 +159,9 @@ void riscv_fill_hwcap(void)
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
 		has_vector = true;
 		/* There are 32 vector registers with vlenb length. */
+		rvv_enable();
 		riscv_vsize = csr_read(CSR_VLENB) * 32;
+		rvv_disable();
 	}
 #endif
 }
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index b84618630edf..0d990bd8b8dd 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -71,15 +71,17 @@ static void put_cpu_vector_context(void)
 	preempt_enable();
 }
 
-static void rvv_enable(void)
+void rvv_enable(void)
 {
 	csr_set(CSR_STATUS, SR_VS);
 }
+EXPORT_SYMBOL(rvv_enable);
 
-static void rvv_disable(void)
+void rvv_disable(void)
 {
 	csr_clear(CSR_STATUS, SR_VS);
 }
+EXPORT_SYMBOL(rvv_disable);
 
 static void vector_flush_cpu_state(void)
 {
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
