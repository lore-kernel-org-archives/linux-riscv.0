Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F42DC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfvSeAJZvCyh59vmrHSXLHQb5JQswY4CDaKVZ7jfUGw=; b=bbzvblJwSc/sYO
	/+krRcaUELjb9uJMrcQmhQFCrhSWAMbruq6pm+kXKhCLkxjIc/CFrGUCWtG2hVvo0+cP5b7/cI5G/
	a9DDbgid8C3/hEGfm12qR+wCOomAaRKbhZ4Iev64F1gFr8ICntk2MmDV4zqx97YNIbVFjZ8vnRpHn
	PEbNFc/jOs7yXXKya/2AZ5+MQeGHigHiirzq922I7evTvQGI7La1mTy9l97Kq5mVTKMvxH6/Zof4Y
	VBWkdPo99E4jPoZrj+wrHYUq1Hr5/qy6H9lSlol/xzvtpaVRNmR2u+MfofvN4fRx+tp4ayWAfzYht
	6DutAPztU9JQIJckB7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQf-004aYJ-1w;
	Mon, 24 Jul 2023 14:20:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQc-004aWm-1P
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:20:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b9d80e33fbso24441295ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208449; x=1690813249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA2xKVDlTfhJaNwFbFuXOx8UsiAOIvWBIr+xpGIDHbw=;
        b=Ti7MinIAsiXaxrUK9+vbFPfIJZw9yh5briqdt2G4FzLvgLbKNtQvj8lRk6Jxu8he00
         tBoBQxUgLAyqEDIIrJLWnZOrtgM+Cl+g75CdtJU+eGsUbrQukAb/sk86a7uTl1kF0MEO
         G2HjLVvjJ4e0SC2jgNBt9XREGqtnKUcLW6yaGJqIxJexYb1v1pfQNl57wB5uF+CeSbMu
         ggknQQnG+qS3mLj6ilvvNs8bG+aPFNZlSAYC9srmqEzyd0hCSNFj0GNmAOXxUSBR4jxj
         AfR2fXBRUdRaD/8etMel8v/f/MqsTCt+jEe9YfbN7mNPXPX8sW+pKpAtKAYQo00io3fj
         QWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208449; x=1690813249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA2xKVDlTfhJaNwFbFuXOx8UsiAOIvWBIr+xpGIDHbw=;
        b=P2HvPGtx3S3k7dUVdxk4J7zPRjw/DYkYHrbIpKDXYtytNvCsXYjVc2pbJePrXVEfRD
         kEr1j+xEa4skVSM2mJLpuNMzKkJdQXUKkMg6tFU/xuYfq0W2noQ7MtpZplZRvN9dJeNb
         KESy0c91PabyXb1+4tyD68I9JgWGGs92vZPGfz1FZPp+OB+gWPKIBEm4YP7hvwxsE88/
         t5/fLNeD9e+UragfwcMKNqEYLMczzePxgP5oxyahtjGV1wIS2ktQB2RKhYzoEWuR0KjB
         Ygynr9FV5eAk7krfHbnCj0Binu/mFKEOwNHhSRALWtrcH2JhQlXVejUC7IE5iNAxcpxg
         Z8Tw==
X-Gm-Message-State: ABy/qLZnUEKTWEwyJasowZQ7l6q1XnNT5k9m/jy/mzvXVOZe0jXDAknr
	Wq0dismRLHSG+Hp2f11/+FJqcw==
X-Google-Smtp-Source: APBJJlHPt6y/N05egGPuqcnG8ZCXhgJ+77H629QsBZHfvLDHAUCNTQjZG9Jyiv3v1HjRVo5UAXElsQ==
X-Received: by 2002:a17:902:ea0a:b0:1b3:c7c1:8ded with SMTP id s10-20020a170902ea0a00b001b3c7c18dedmr9467459plg.27.1690208449126;
        Mon, 24 Jul 2023 07:20:49 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:20:48 -0700 (PDT)
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
Subject: [PATCH v3 1/7] RISC-V: Detect Smstateen extension
Date: Mon, 24 Jul 2023 19:50:27 +0530
Message-Id: <20230724142033.306538-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072050_477843_16192926 
X-CRM114-Status: GOOD (  10.28  )
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

Extend the ISA string parsing to detect the Smstateen extension

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..fad1fd1fcd05 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SMSTATEEN		43
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..fb0df651bc48 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -217,6 +217,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a8f66c015229..c3742a765f8b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,6 +301,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("smstateen", RISCV_ISA_EXT_SMSTATEEN);
 				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
