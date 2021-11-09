Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00583C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAAA8610A3
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAAA8610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ob4Y2ZGC54bYpkqotwYz1A3DkUhm6PTgui9Xb0K5OaE=; b=zDRAre9E6Ieay7
	4J06a6JqX9zLRSDNxznwjERNvXG1N285/5P+yzAplOP7b1D+88eHOOIUQZYAVhfbfo5Q9hIy0/HO/
	yl7nn4RhAMl4QzOhtSMHaer0coKCMI8NWJfGAZCKRiYJ82ClU8Jafisf0TPHsbTWgW2sG2SzO4tYm
	uj5AQWWv2tZGz+6ALQ3cdgwKJvo6pgr8vt9E9p09l2GO79s8/EhxBDGFw8PON9d1VaQvUjZOKP+f+
	2MVFS6S70Oi16+nWb4S+CHSAQXrJ08MsewUa+qHEK+WgyzbM7yVKI8pm2tDRIeAbxE8763G+Nb/nE
	PiNB1z44pcOLh1rS2tfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNts-001NCj-IC; Tue, 09 Nov 2021 09:58:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkP-001Jbd-1n
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id n8so19936701plf.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vub601s5coaRpp9kU3Eneee7Bzk9CoXcDFYUdh/yUb4=;
 b=JyUcyciFRzzYYp9uPqtgoYeeBxrzb9Sm45qw/bnFYDLaasWSvfZlOT1aItjSuT910p
 IMH9JngmZ6R+RqXECaSEcKJu6kTP05L83/QZnGelZKslpynpOAgZm9GnJMPWlu2Bl/tz
 Hs0FBDFGFkB8ztgQk9inlX67oZOmA+zCCEgolvmOlYtvcymgqhJrUX6dhTwU8YI5DIwW
 P8Ry+AIQWEILx26BZDfFmCJa0r2KhHUQkBqFNVanep/JhPoTf2AoZs7FYOLrGGiKMFs9
 1WIFiga7CLlCwWk2Bk+WeO8qup7mxPP0OSqyifvrUZQpy95E39kWmi9P+F8W5OGsf985
 ORHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vub601s5coaRpp9kU3Eneee7Bzk9CoXcDFYUdh/yUb4=;
 b=OWPpyNo3qzNm8AewmVLTINKldoldm6Lq2wcff8LcuOUD7HUFaarJjq5xwvh4rpzvht
 T2vdXXyUhoYS6PQQFKwXwszGpetyzB4czgVzuq9KGJ9YEKPkcaJGs9VQbL7eGk63Tb6/
 nvXMEbFqy6H/9j+aKrn6W+8aoKKC3e3GJ9+vCFM2d6pzFDSTJFp8T8bH5vLW1CLpwO3f
 Y8vQlFEGgvT8astLy/p5HfXVNUfbg1kEsizLTRdx/loBCcckMrcuiM1Kgs2bwA5I0HWM
 gu6nj+sToO6ltuQPc8sJ1LB4XzzKglyeaF2UsLeaMfY1zxTis6rIu9Auo8YLASAfsTdw
 0X+A==
X-Gm-Message-State: AOAM531rZpxgQAOXzXE+vw/JbDk1PlnjWJUfVYpYiMo0ax4xPjZpAtyr
 O71zU6ys/ATNDj9OzgpN3L/c1g==
X-Google-Smtp-Source: ABdhPJzEcSgen4cPqTPPxdd8RjGLhjnXGs+ZgWDTCKGrccekjAhdSY+7/5ukjNzOST1jTpUdezj9tA==
X-Received: by 2002:a17:902:ec8e:b0:141:da55:6158 with SMTP id
 x14-20020a170902ec8e00b00141da556158mr6011841plg.7.1636451336104; 
 Tue, 09 Nov 2021 01:48:56 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:55 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 16/17] riscv: Fix an illegal instruction exception when
 accessing vlenb without enable vector first
Date: Tue,  9 Nov 2021 17:48:28 +0800
Message-Id: <3c0297d8335e4cac54a4397c880092c1c983e04e.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014857_132836_52275299 
X-CRM114-Status: GOOD (  10.13  )
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
 arch/riscv/kernel/cpufeature.c         | 2 ++
 arch/riscv/kernel/kernel_mode_vector.c | 6 ++++--
 3 files changed, 8 insertions(+), 2 deletions(-)

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
index 8e7557980faf..0139ec20adce 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -159,7 +159,9 @@ void __init riscv_fill_hwcap(void)
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
 		static_branch_enable(&cpu_hwcap_vector);
 		/* There are 32 vector registers with vlenb length. */
+		rvv_enable();
 		riscv_vsize = csr_read(CSR_VLENB) * 32;
+		rvv_disable();
 	}
 #endif
 }
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 8d2e53ea25c1..1ecb6ec5c56d 100644
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
 
 /*
  * kernel_rvv_begin(): obtain the CPU vector registers for use by the calling
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
