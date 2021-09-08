Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DF4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B996109E
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2B996109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgiTvvXiEKPD7+HvrTcwfiFMnuGCs5K/TYrueRpvepE=; b=gKev66DQIwl/uk
	o8n45L6NcD5f6ubf1nZkai3y7ZdaX9/cg7QEOCjGi0uqgzdJzvRPEEHIlb8QSklTlUxDUJ8Emwmfu
	TSPeffBWkDiQe1cbRrZklq1vQQHVIZvqhKY5IAOp2HeW+1Oh7Jt9F/jnpVfF7112SSg4tlXPAP9Y7
	AHveBS2JZrEKBIaiBBOH0XyFdmmvZrEj5M7a93ymQsrXAFRTUcjhQrlMbB8lgKTbi0k856+rZeg7T
	kadJD+kgPVV2wkbslksbn1V4n2l9n4kiYFUfee1sKjCBQOWlR4vDRL+xhRYKdk8ZrPfLWj81Yfw/x
	Ue1XfmlcJcjwWIRFM7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1dq-007IP8-PA; Wed, 08 Sep 2021 17:45:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1dl-007IMT-HQ
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id t20so2175344pju.5
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YpcZY/wok6Tm8gHdnpmkHhJcSgAyfMAyEx/8/I9XcUs=;
 b=Jx5/Q/au3M6VS8hmE9us8ktN5ulC04/81YZOBI4qPEm9UW9X3f8wTp5j1qS1HVQ+hH
 hbEzYJboXew5CxJvdxMmxmNxfpTPMFyxIPVr6/3+Xta0Q1EaPJTWURxAp9F+/q6MVsiA
 IgdaFnh74IaLkOw71D9T8JtcLpZ8b5GiyuL8DOguAv4f/yjhOcS6vdPhyazEmejesk6t
 vmga/fNX34i8K/rzF0mk0I058wP7dzffvYQwTBvBSMPLRdqYlKlikvoCAYDI1DZ29nhz
 wDjUQPqahcQnUbfLWyR2EGmh7StefB4J0V0wR0w8d3yRELbiwyC3g3yCWCA2hBcB6Q31
 Zwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpcZY/wok6Tm8gHdnpmkHhJcSgAyfMAyEx/8/I9XcUs=;
 b=Ajj3CNGwSddbstPqDG+dVj4jrpgBsYWv63ueANL9tUUlO4Y+zCD2s88WW3YgoCQiMj
 WftQDw7v3jdhMhBKhC9EPcc6FSqxMYJ0PmJ2B4lnyGW7GmmMQBTE3lQFceTxZg2ur1Xj
 HY8KdOa8Q7ZWUg6GO7ZBnUjVFwPCa0Bz1bRz4aGOXJd6AiRKzi8Qj8K1+V4s9Fk64DuO
 qodtAbGvvNUDNfflOGBYub4A3Rak0H3dsqf7XCe+jqLcnK+TbGlvTfe8XsNoIvn54gF3
 7WFjhLaJDdi0rl4lnWgZrrws+BzeCsKvDblm1MGzaqsFiniCmH6d2ImX/aLboSFeEEnn
 uAvg==
X-Gm-Message-State: AOAM532vKA7r37zSrvSSt+nEkZ9/1N/IWVIIRyo8iC1s8iutxbs6L9Cs
 pFzaev/FRdN/UV9ZXIL5byXNVxsuB3A90A==
X-Google-Smtp-Source: ABdhPJwScwgepcfikW8f2UbxgnPEpnsX89Jf1x0kp8szgGwmZ2fb7vGuQPhIeU7a/Nk9s/GoSe9t7A==
X-Received: by 2002:a17:90a:bd02:: with SMTP id
 y2mr5423105pjr.202.1631123140700; 
 Wed, 08 Sep 2021 10:45:40 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:40 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 03/21] riscv: Extending cpufeature.c to detect
 V-extension
Date: Thu,  9 Sep 2021 01:45:15 +0800
Message-Id: <0872babd785206d85216dab64546627d3021f3c1.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104541_627320_99DEB346 
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

From: Guo Ren <ren_guo@c-sky.com>

Current cpufeature.c doesn't support detecting V-extension, because
"rv64" also contain a 'v' letter and we need to skip it.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..7069e55335d0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -73,6 +73,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
