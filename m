Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2DCEE01E5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qf65T2gEHx2hFGG1jpU3V+hWIbMpagvrXaWiCOzYVQ=; b=KChYKhV9RhekY3
	XJJXXS5GzDaPcawu3Bc9x1saEWTEoMEZFJKF1JgJF/DBAwvHV7SeJXUpcF74JYwVeaWhCYCBQNN2t
	jnD5otxs/vg+3DAXMCNDIuGviGUzsHWqTizKywoYttTBOXDPIuRtQMC6crFtRnGUDbrnLfplk20uZ
	Xz/txjwFgrqhNbe0YAo17T8TbKkEkYiMbjprD78Cnu0tCfEWVgG8DVHWSsaLNeK3qveO9JAhxGooy
	WMH66FpLVDcSPPdTSXV3OBwb46S9DchuWKfLzmsqSg0t7YPoXnRCMGrO3j+3IzfqGMRRpEfFQmBYw
	9kphtO1WTaHtnFt3FwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSvP-006My2-0O;
	Wed, 13 Sep 2023 16:41:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStu-006LR1-2i
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:39:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c337aeefbdso64174335ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623175; x=1695227975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zby5+/epktKP7RzS2B2FPnhW8r4eiR79ZVht5gtpaE=;
        b=SiqpTQGlS0R4crfJv+uXSHCpSsvfo64GBHxoqgVv2Xlj82yo+6/sverwyn8CPaFpko
         hj2lBvTApLYWfiZHTs4RaYs8mbHddEZJOZItqEDC4T98awfZ9pI/lcecXXSRYGH18CD6
         Wlzh9p55cY3mW2pfsUqxQLBJd7NxvbChqZ0CyU2Fxk8EWxl7Ea2GK6AZx+5FyQFwAqvA
         /UKPdf+LeEEpoQqzZFBS132vcG1v3SBzd5/gPH57Jlvf9YM+u8cnnTDViibmH1BHsd20
         386nPBKIduh/TNJSzckaQ6jS1MYixCcoj/fEPxArk7WnpTsLE4jLItHhMOGT7erOaVIT
         YRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623175; x=1695227975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Zby5+/epktKP7RzS2B2FPnhW8r4eiR79ZVht5gtpaE=;
        b=HWDB1a0FPzoM1PusOBjAAgK2BBQIIzNIPg02wP29ULqAOLjhX4coxmQXI/7/TLBSej
         Ye/+XEFbArOcf9PNUdgCi6unxgGqJqlU4OlRVZNeNx8EkBdnqKl1tHngS+E38/YQcF6M
         8TdrgvfuExtPm0SFUmSxqRBaLL7U60d1fcXxtVj2KUrD/M9F4rh7ML+1XgZcFULFxL/l
         9r+SyBEzTNM1Odbj7gPwl7KKz8YmrCNppwFMN7VYvVBOBBJgSvAIXwzRSzxAh4cQ8YFB
         WI63YksmcSjeSlrYso6O798g8+GnH76j9zdSPV2lTpw5nnM+bvA63QSJhw3qGS0R4c5w
         fJuA==
X-Gm-Message-State: AOJu0YypsbJ76xkH8U/O5o7rYoR4bWKoHIwK94m+m0edDWmOYDQPibv/
	YYJ/uO5v8RgwrZHCs6FnjTTy4w==
X-Google-Smtp-Source: AGHT+IE+Du3wPvNeFNAy1mivF0yBnb12TBRANhZ3bSo3f8HVCcVn2kfKLuwT7ptWG0e6c8766ubRJQ==
X-Received: by 2002:a17:902:e883:b0:1bc:203f:3b3c with SMTP id w3-20020a170902e88300b001bc203f3b3cmr4306877plg.24.1694623174896;
        Wed, 13 Sep 2023 09:39:34 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:39:34 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 1/7] RISC-V: Detect Smstateen extension
Date: Wed, 13 Sep 2023 22:08:59 +0530
Message-Id: <20230913163905.480819-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093938_972501_3482825C 
X-CRM114-Status: UNSURE (   9.65  )
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

Extend the ISA string parsing to detect the Smstateen extension. If the
extension is enabled then access to certain 'state' such as AIA CSRs in
VS mode is controlled by *stateen0 registers.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7b58258f6c7..0f520f7d058a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SMSTATEEN		43
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..3755a8c2a9de 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -175,6 +175,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
