Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85972C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ddkX8DDDzXx7bB32BhWJFlPEXhgD6IsAJohvr0l22Yg=; b=xPt3jtMJsMPfTw
	TiVZpP3GBxlaUG1+HbKX1eJdpEeKWfrKL5TCqibGSapPhHtf+36yV0JBnRGkPfLYOmykF3HnB1ViA
	rccvTkWy/O04XXVMUVpCGDgoqiJu45ewUZbNUxUE39GWRBEA2SkF/QbBPyHQd/kTVfTwLj4SyZC28
	WH1zBHsl5h4zHObo9zCOjNpfNffyxuFnMn0WOPe7HQfQoxblMxRLtl5nsMyXw/A4mGXJO0S882kNp
	fVcVhIYQUkn2PK8+QDB8Y6SDVVRDRZwIFeAW4TjVD3b9tIsFB1B863cNpNdt4CBhA1aPZ5uDzu+6Y
	uVOUK9WMWtbQWMJ5bw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk8Ex-00000007N3p-309t;
	Tue, 12 Mar 2024 19:56:47 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk8Eu-00000007N23-3WVc
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:56:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6b22af648so175411b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710273403; x=1710878203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxEx3iDsM3WrZG2Ndd+J9E+wXDu/hB2Os8/24Q1t3OY=;
        b=miLYY8kewlIwXeuGbTM5Ky0gW0GmKqGzIk39TkAIUSjpH/JKcpec/JVJ0nXMwmc4p2
         Sbyfm/FPjkl1tztNUU3zlwmy+7eDe6Nj6AWDilg3r93ACfF9OL4jHps8APAV+SsyJNqA
         9f6UlN06RIitmxvEiDbQm7ntZEugqg8t+2z6fkomNYg4INAEzfc+FK41I0ePFstCLMCr
         rpyHztK5C5jnL4IniIDX3p9EaRvf/QEiu061XdvLB0HMx7oq1+OVBy2sx/AJfn8aZQPk
         5zWsUbTT61hG9HiH3JO+8BQ5S+E6lUa30+wJHKhFv82OSoqOQ2Y1DKrKXsYPdfcuyDEc
         scDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710273403; x=1710878203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxEx3iDsM3WrZG2Ndd+J9E+wXDu/hB2Os8/24Q1t3OY=;
        b=XJxXROwaoe4Eyme6l4812Zp8nuQMxJ+QCdJJA1mdmvRK+QJrDs4klUcYxVKMORaSLq
         lBC51MOzmg038iCe5bEs1YHdjD4ouBGY+nh0EJxY/aeiycL66n/sMX1TA/KB+aE9pjTM
         GetbtQ3nAzQIIJSnwRHxJrN1+vbZo9rMzTenDBaVRBmbDCuGKJEdpc8XmnuNdMiajVjX
         eIZkEJpiILdLkDnGyIC9QMfftKfKaKWo2/+rj/iyKML4vYBqM3PDatjTQDMiLQ3A4DzR
         UAahhUeVJN6980Z9iKj24m3wqFEuP3f+UDDFWIpu/iOLsx25SHetRUxK77kCvE9y3Awk
         DeVg==
X-Forwarded-Encrypted: i=1; AJvYcCVsmADryABwYl/TNMC/11rEmFP59X2g8dYwSz3HFqJ8C5y/NHQOTmsdr26/HfOj8+QD3QDOa8EMSh6e9mVZ33hsac4s5qqqa55vrHAZnoPQ
X-Gm-Message-State: AOJu0YwpFnZfiKwzPp3BMw9baiBx5dsf6oima6oECZ7m13svbmvbBo9h
	rGs9+icDqjNqKcGzos0UZUcBDl4IGvHj1dfQxkmWDrNI3kuoSEi/yKVXGDBD8HU=
X-Google-Smtp-Source: AGHT+IFpt7ff6HNFHc9Yq78Z63OwKzFZJ801dFotJRAscTaClrr1h/Au36ogZQmQ69SY/YT0n6oNpQ==
X-Received: by 2002:a17:90a:e54f:b0:29b:c49b:eb13 with SMTP id ei15-20020a17090ae54f00b0029bc49beb13mr628731pjb.24.1710273403142;
        Tue, 12 Mar 2024 12:56:43 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id hi23-20020a17090b30d700b0029bed0e75dbsm4708774pjb.17.2024.03.12.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:56:42 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Pavel Machek <pavel@ucw.cz>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] riscv: Do not save the scratch CSR during suspend
Date: Tue, 12 Mar 2024 12:56:38 -0700
Message-ID: <20240312195641.1830521-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_125644_962921_080C816B 
X-CRM114-Status: GOOD (  12.86  )
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

While the processor is executing kernel code, the value of the scratch
CSR is always zero, so there is no need to save the value. Continue to
write the CSR during the resume flow, so we do not rely on firmware to
initialize it.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/suspend.h | 1 -
 arch/riscv/kernel/suspend.c      | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 491296a335d0..6569eefacf38 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -13,7 +13,6 @@ struct suspend_context {
 	/* Saved and restored by low-level functions */
 	struct pt_regs regs;
 	/* Saved and restored by high-level functions */
-	unsigned long scratch;
 	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 299795341e8a..3d306d8a253d 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -14,7 +14,6 @@
 
 void suspend_save_csrs(struct suspend_context *context)
 {
-	context->scratch = csr_read(CSR_SCRATCH);
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
 		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
@@ -37,7 +36,7 @@ void suspend_save_csrs(struct suspend_context *context)
 
 void suspend_restore_csrs(struct suspend_context *context)
 {
-	csr_write(CSR_SCRATCH, context->scratch);
+	csr_write(CSR_SCRATCH, 0);
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
