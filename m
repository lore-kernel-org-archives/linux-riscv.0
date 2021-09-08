Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BCF16109E
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BCF16109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8e3Xu+HBfLwoo6pPtzKb0GtsiNjgQ7Wu+07OUDDjcGE=; b=xS86GY3zQ6b5s7
	ww0GDqYJYc9gyrC7C74w5/BSlfx/KDqqjdmxP4YLUlM2rEb2EBc6tG4PuaRNb15pctY51k8VciAtI
	4b3r+TgVh4XM+WFVyQpwzyLlUg67qLvgVpLXGoEMnqgpSL6ZFgwabIp0Q4AyRsmj5iY7yzYWSTzLa
	0+2wvaCNAwg+yIe46HY+XWz8T0OJWLsFJ7ozxFdT4l1Tb3tYQAQKtofWLOtwnQYLaeuXu5m37ezhr
	eqjtRFzqukf1iFQ97t1B3acdJqw7ZIdLBcba3bmYqRQsWg62hC0tjToV/pCkertGSW7A/DaKmhcMU
	wMyx4/9FNx/RV5ayvK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1ds-007IQe-RY; Wed, 08 Sep 2021 17:45:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1dn-007IN5-3n
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso1739743pji.4
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PvZSczC6umJopWKeatvFKRPXXAs3l7Ppj7hlaQG6eAc=;
 b=cishkXuBrR46GiBj+REajEuR+a1v2dLe7TJaYTi3FZ6HKb/xcpW5AIQpOtxob8SZrU
 wPQFpA1YcPLvipNJ0d5NsPGoldqRBKm8hzAkEz84k/2Ud7Sdcmp7+6v45csfHE0Me5S/
 AsLQeC8V57RYDKux+fHcJdtkq3Lw4EEF5qvgSrNV1jOLMTh80f0yyct6gsVzDM55NfHi
 nA0E9t/UWj2eV7KXpmvP7cKv5I6WbIaAj5u7t/G+kL7cW6+4J8R0HDTPHeVKxXH6jm6E
 Z8hJ8bpKyYiA68YH+y6ywtsccil+UQsTCI3YL2OJsuc/eXuWQXZgTADcRf28X0EmBpDh
 YMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PvZSczC6umJopWKeatvFKRPXXAs3l7Ppj7hlaQG6eAc=;
 b=jEgZGgS1HD3925Oophb8AnfSsaciy+caksY96qb2Qj+Y75BdWd2+KV2SOQhxIeHRCD
 dvvbSbsaogaRoV1c8seT7dnsILTSpYJziNhS1+zmxEZZHR6RE5F3VlCvYbV+G8foqAHx
 eg5Hxb2OuoadukJLfxmUVDDv8LsKJcWVbFgKkBO94CAIgMg9omBTWIV7q/wH6vtjQkzb
 7k5uToEwElRzLoxqOSitLLrCGBWDwRWmyLyiIRoQE1u7PqxjtPds7GPGhHwkIjJGdMoW
 rYfaHibQ6LIYaUPtia//0Vr0i05dcQ2pXpoSnCuZI4ey0n0TS189B1MuHayMfTuzrdAa
 Cw/g==
X-Gm-Message-State: AOAM5327rliK7qYFBfJSJPjNZHmYADj6Cp3QNJgTlq85ib90d202TsQy
 jGmegaqPQFfjoj1CzGkbcupTxrMcua65Ug==
X-Google-Smtp-Source: ABdhPJycZ3RbxINQfqWEwJw2vOK5xfrivX+O4UklOCv3iAPQwCHociYaajEMNjUB6HV3Oe6TGjwJUA==
X-Received: by 2002:a17:903:1251:b0:13a:1f5e:20da with SMTP id
 u17-20020a170903125100b0013a1f5e20damr4034467plh.75.1631123142217; 
 Wed, 08 Sep 2021 10:45:42 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:42 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 04/21] riscv: Add new csr defines related to vector
 extension
Date: Thu,  9 Sep 2021 01:45:16 +0800
Message-Id: <efa96ff90447f6f49f8cc4496dd08657786bd9a7.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104543_185601_34D8AB3B 
X-CRM114-Status: UNSURE (   8.66  )
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

Follow the riscv vector spec to add new csr numbers.

[guoren@linux.alibaba.com: first porting for new vector related csr]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 87ac65696871..069743102fac 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,6 +24,12 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00000200, UL)
+#define SR_VS_CLEAN     _AC(0x00000400, UL)
+#define SR_VS_DIRTY     _AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
@@ -31,9 +37,9 @@
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 /* SATP flags */
@@ -120,6 +126,12 @@
 #define CSR_MIMPID		0xf13
 #define CSR_MHARTID		0xf14
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
