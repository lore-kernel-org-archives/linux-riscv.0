Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A847CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spYWpVkCdBIRmvOsmcETKgeLACdWjZS4TuwdILuFQkk=; b=J5PXXWr+Ibj9Us
	nCKeKKffSskeGDJ9a1VLwLp6QywqMqeDzW4Gwb1diCtiy0Xer+jzXL6+dxJZCF14rH1epFq5cjg8D
	eeOvts7atpzd8q6z9GDM6GfH+pqLJNYGbXwZnLH2MUv3j6ROOBMacYJx+Qp0yyFAyvCchHJCTPpdx
	bxuubc28BR+lG0nvKm2bgiMyqoPHB67AvchyHMIvx3Z4HStEmysLFBkrKQTWipA7227dcPzCMlc2i
	tV6pgqgwlAt0cfsDScRe6WVYNz/hjTQJZClPl4tczpBC2z5Twvlg/0O4d8wQvKEkWA1jL67KSa9qA
	U/iWmKHKjRYuQM8Da9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqnu-0021yq-04;
	Wed, 20 Sep 2023 06:35:18 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqnr-0021xc-1m
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:35:16 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3ade101217bso1434445b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191713; x=1695796513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJKym/P7NcQpPeyWI/De6RmfTQNyyp1oM7Xyf6Kr9tg=;
        b=LfKbzja2d/arEuB1bJKHYIOdcm8pZkUDXhvF2D1JljN2DuVDPx0JREIVJmCMlqSiF/
         XKDTI2POsu9O2gdcm5a+6+Dw9oc9YtzpUwTfNJ2Ir9ehmUN6w6xIPCJV7W5/lDxIDG8P
         CP/tRMQ/bnHsgzu5qcUpzhHGJriSV8H8VlN3xyTWmxoh4l2QJp/v2S/4RxlS0TGjGxtp
         eC1x87ZwEwrls6xmnGDwwzS4CIbI5Jr8yC6ioTGdkJ5Aybc0aj4uuiC/dzesMmumXtcG
         J6iUeYJhK0KfL22k0939Jk4oYf3ca/H4y/4yvf4szVDeRvlq6EgnLaaHGjrsEuU4wpuN
         IbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191713; x=1695796513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJKym/P7NcQpPeyWI/De6RmfTQNyyp1oM7Xyf6Kr9tg=;
        b=FI6GQObNt95QQD1t8bZpcfDJ8iyJHHQdeSotGzYkZVmh/txE+kiiV1oODqin/HApJS
         brdNOKFzOFVjgtYQXyIURBJ0uTrJs5wqiD2DqvlBKji3ryASpOCWaAZ/JEcVsU0i8FYy
         mSwD5o3Jk9Zvj/W22w1XNHssPTVzLdr8NiKwuhzkGOqwMFEcD6xCTkggAZiNTLZ9kDyK
         0JceRjD+Mvoki/vV5g9sZb+XnCgSYikCITjnwA5gzufGS78pMHryc2pP/pyrmu/mr8h4
         +v6dXxZ9SSq7Wof7VuYAMGhmxlg4/Dprd+68CaMa3oj74x0Ny2mo6uQ8YLkUZkKB4ckG
         ufvg==
X-Gm-Message-State: AOJu0YyGkcpADsEe+M1hBJb3W0mo8e9UclQLkWW5QFdlwMA3oTORGLL+
	fd4HlqsvWm27rsKHBjiV5uE=
X-Google-Smtp-Source: AGHT+IFcCvZ7DH/DLj4tiOetrouvt4X4bFb6UmU1YoBl42O/swqeXpXlzf7XZf26OrcDRxE4zkol4Q==
X-Received: by 2002:a05:6870:fb8d:b0:1be:f46d:a26c with SMTP id kv13-20020a056870fb8d00b001bef46da26cmr1796917oab.27.1695191713449;
        Tue, 19 Sep 2023 23:35:13 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ci11-20020a056871c48b00b001d53c57b55asm6746735oac.57.2023.09.19.23.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:35:13 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 01/11] riscv: Add SOPHGO SOC family Kconfig support
Date: Wed, 20 Sep 2023 14:34:44 +0800
Message-Id: <2c6db3d2db0d27d4b2b8364e0c03be3da292101e.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233515_592636_EB818327 
X-CRM114-Status: UNSURE (   9.60  )
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

The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
cores.

Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6833d01e2e70..d4df7b5d0f16 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,6 +22,11 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
