Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED97C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8234761158
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8234761158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2YZvOdOjIYdWskPzUJcL5NXDcbE3w7Pp+zzhNdOV70=; b=zKxw1DGE6gb90S
	SLz2TGXCBkRNFQbP17ZIf33NOIg19Ipig7uOZJ2agEsRw/o9vykf0GMH24V+C6GsBV6oHnjE6tKRK
	JqC8AgxRs/RQFgg/A1J4hOzIZ5+HB1l/byxu4spqRsX1MHeTh+b7wlTpwi6Rq/l3r4ajeW8hWOPNr
	ByJ07lUbUNYIyWTo/UZx4vOUa3SbDCfxWVcRmqyoaRrryKMzex8BD1ezQPAqt78y3FfZtKTYIKqhV
	7y4NpognFEE5EyShHQfGtCT0BBhJw4DfH2Y9zsOeKAwQtmj4mWK7m4c+kU2oiHSCuFQ0vqukaQHVO
	HZyUFnKOFnx91mg9KzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1ew-007JKs-4s; Wed, 08 Sep 2021 17:46:54 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1e8-007Idz-OX
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id q68so3391229pga.9
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ki+aQge6R1sXYo05KVRlyGbundfKO7O/dFJoVBYav6Q=;
 b=Oq1gZ4+wVC97YoorR2afif9hfeSg7/m0u23F1ahqNEGXQCUohIuVLg8xKX3KH+/tlQ
 ivqLBG0XyEMm1tlNeWm6yD7jSj0PUW0WcPnYGejMluZiKd6JA7y7jNLIyqpyrUSts8py
 KPCq+JAg30N7RFBp9Hci0P1Heu+oVKursFUdZpcRcQ709jmZQoNHXhO51NfEO7rymSCJ
 P8XtVa63FaqxQWqoVN4Z/YmAkakDZX6itlvumnmskroOlWG0+0XVMWT4Df4NefypKI4g
 EmDVoPdqHaz68CuhTKkuHow89vBpn1MP66rttvAcc2g0Ia93gSTaa9mOSVYDmEmF4HkJ
 oBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ki+aQge6R1sXYo05KVRlyGbundfKO7O/dFJoVBYav6Q=;
 b=YCy84gQao9hfGQGB35bcdSuKLPG0y8dJPg7Z2/3F95hsOS+/0yWBBrkcYQIieWsqCW
 jzM5UHuBlk+Felmef5J7dEhNXU5NApwbuSXiydxR6GVwmlJYS1TWmP/TXyeQHveW+MIK
 AysDDgvZTGruQhN+WAteaGqU9jtO9Zt+RlVmizuZSAzaRPY4xsRVgoU5k5PURmpWkf9f
 I7pnJpS5ZeKJUMcd2l6f2bR9ZBuc81q4hjJAzwmqvqQSsMNBmAz3YFGIQ/8bTtYvoJb/
 7xl+SmDXyvjhcUDyv9J4CF55mf+lpSwTV/4JIzU4YlGof7jA94skNM2913Z7dUJQM8bZ
 eJSw==
X-Gm-Message-State: AOAM5303Qe2wwPFPBTm96Xm4Dcuif8q0uqhaALTJN5R5VhMAR6Nj+mq2
 3M6dJQVhU7yCTomFO29ZIKFhVpYNJIBRHQ==
X-Google-Smtp-Source: ABdhPJyvhUF6Mldwb0t87e3+bjrkrgDWT7zKLSKTO11BmkWmE0DjNj3xy/FmrEtRBsLE7/CvpT47Ig==
X-Received: by 2002:a62:4e4c:0:b0:405:4360:33f8 with SMTP id
 c73-20020a624e4c000000b00405436033f8mr4939771pfb.56.1631123164061; 
 Wed, 08 Sep 2021 10:46:04 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:46:03 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 18/21] riscv: Fix an illegal instruction exception when
 accessing vlenb without enable vector first
Date: Thu,  9 Sep 2021 01:45:30 +0800
Message-Id: <28a21e13ee57b493c48f70cb27e7a527b21e3b96.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104604_880751_F6E60884 
X-CRM114-Status: GOOD (  10.37  )
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

It triggered an illegal instruction exception when accessing vlenb CSR
without enable vector first. To fix this issue, we should enable vector
before using it and disable vector after using it.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/vector.h        | 2 ++
 arch/riscv/kernel/cpufeature.c         | 3 +++
 arch/riscv/kernel/kernel_mode_vector.c | 6 ++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 5d7f14453f68..ca063c8f47f2 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+void rvv_enable(void);
+void rvv_disable(void);
 void kernel_rvv_begin(void);
 void kernel_rvv_end(void);
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7265d947d981..af984f875f60 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,7 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
 #ifdef CONFIG_VECTOR
+#include <asm/vector.h>
 bool has_vector __read_mostly;
 unsigned long riscv_vsize __read_mostly;
 #endif
@@ -158,7 +159,9 @@ void __init riscv_fill_hwcap(void)
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
