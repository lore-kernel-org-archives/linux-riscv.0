Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650ADC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gqt6t6NGJMBG7BA828ebIanYzcQvPODIbMd9B0c0TOg=; b=4biUUgbaEcnkcW
	939iPlj/mL8n/3WyWLSlacnyyF9T7RIzEvVeU9Av4JFoX6rsL+XcRq6pgDFZEaxYEzqaqFveANYPr
	9A7QsipX66wu/8H7TRj1/fJIPHEIyWPQnlRsbqkpV3cJrZb11t1hobnwhZMaGmqnTcpDd8kU5uxsU
	olCDmuuXBjWBneNSm3CJldVQsYLIR7QNG5mxtUmOq+eBVbDyXHRWyAXu9/1xBlZJzGpySQ+ZJoSvr
	/XihwegnZ7rcs+mt2BhyOlZTmb0GNRnY6YRq5/a9iL2gmDGk4l1TPS7DKNpTR00tbd2IE4NcxRy1U
	34/CQEjz4Za5y2JwRj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9ed-0083Gy-29;
	Wed, 19 Jul 2023 16:03:55 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9ea-0083FZ-1C
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:03:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-66c729f5618so7050600b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782631; x=1692374631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUA/khHjxICHZBN01T60y0I3A9eNO5NqBInMH8nWLzY=;
        b=HpGsPwBfYBrHzRP6rdT2ewMWfHcp7qGInX1js8vdbQnNO7wxDVuLcSm1reUXMB9q8W
         XCh8KU7ZxGNizbWJBjOv2NnA1P+7Lq83MMm/OaurghZ1TBCLA6xKQnOLPyvBzIEpoHs4
         A6ThW/npR5et4UseZAqL2LGK9AU71BBcyrfycR15mRdZ9oqj3OFMG8GSKWw8n1DjEZkV
         j40bllCcK2m4TadTFn73FlKkSukPp/Iu5JctUpa3UviDkkz0EidePBOpdXF4ANT3aLfR
         yMB04lukVA4GzNMdz6+w0/aqHWRuIEJESSVJ5r5n6BqU6NRcXKJRr9LDgMDYK/wyOnUn
         Ztsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782631; x=1692374631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUA/khHjxICHZBN01T60y0I3A9eNO5NqBInMH8nWLzY=;
        b=SfH2YV0yvSTOxLuqOA4BV0OaYaYaFJJgZ357zSndQrZ9uj04jkzKncv0VIgN2iU1Ym
         a25jRQuwoBlA6b95RspTcODVgk7u37/Mv5wfTT0zRVqELmcQ8/5qej5Vv3j2IrfKkpSR
         aLgBPLB+y3ggLAttmshcxDl51y2dwtSziX1+9zTJZI808N+dvV8jUgmnApaVoRmQ091Z
         XfwnYCYMDiljGYs70Gh8AcU3D2c/UR7zl96Hc8sutZuvnv5f1HvaaHz8RjJ3U3VPUmuv
         HnM8HPtSzUuV5sen5XCe7SA1ddlLtWgCrCb7OI+Lp/0fXggQ6EbtCGXF8kuL2R/pQYeP
         MVJA==
X-Gm-Message-State: ABy/qLafxn7U6Q/jfZDwAsZ/aoaKro7nANZaxEYVyLdIk9gQOg4Ccr+J
	CZFJDcyIRbaSGlTNJ48N88DgtQ==
X-Google-Smtp-Source: APBJJlGwVeW75Y3xPdHZfu6BjERBX3kC8Mhrf3F5NzI+CC/4M1iJsYGVKSklTQB/5kvJi0+9PmUa6g==
X-Received: by 2002:a05:6a00:3a24:b0:668:79d6:34df with SMTP id fj36-20020a056a003a2400b0066879d634dfmr4016429pfb.23.1689782631487;
        Wed, 19 Jul 2023 09:03:51 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:03:51 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v1 1/6] RISC-V: Detect Smstateen extension
Date: Wed, 19 Jul 2023 21:33:11 +0530
Message-Id: <20230719160316.4048022-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719160316.4048022-1-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090352_513378_7CCC0512 
X-CRM114-Status: GOOD (  10.47  )
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
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 4 insertions(+)

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
index bdcf460ea53d..41c3aefcc53f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,6 +301,8 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("smstateen",
+						RISCV_ISA_EXT_SMSTATEEN);
 				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
