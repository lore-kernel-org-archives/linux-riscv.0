Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5BBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CAA1611CC
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CAA1611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8e3Xu+HBfLwoo6pPtzKb0GtsiNjgQ7Wu+07OUDDjcGE=; b=lu071ldDOC5Du5
	4IL2/s0gwT2LPjLF7SZISAhpeEvv499h9BN8ooNFRf4COnEV4crYbIR2/dnQzcNaijCGD8Re9Hiw6
	mO756ljcfWYHAcqV6pMU8m4UmDNHVSO4G0Q6XThfPKzsISIbcu5YWxHIa3sOA+POhrs5m7GDZUbUf
	orN+ck8TXUZh1vbm08yZLxrC9TgPiM7xthsQvqbaYmUjLj+Zksg4tg/+Z3atQi00OdyNlI6x3vlsn
	dUpSC9PlCbXzEpclifK0+Pd9nJcWuTqR57UK/V/OBCmhG6DDdGsUA4uwuvCg32mpql2YZCXa9LT+G
	joNnfa/QUpDNgu3rd7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNmY-001KR7-5H; Tue, 09 Nov 2021 09:51:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNk7-001JT8-Bq
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id u17so19903444plg.9
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PvZSczC6umJopWKeatvFKRPXXAs3l7Ppj7hlaQG6eAc=;
 b=LQcCH0fzxq5GO9KWLodqCj4YR97Vh05wdeUqjoAQnknd1XkF7dILCo6Xo2qYowiqSO
 gmAhRZQJWXrlTVcLPpjnVWwt4TMHUr5ldhEMBgq1p49pCP0O8chBDBmoOMhc83ProboG
 pIuExYUJRn55PEnFv7Gme3NYaTOa9GMM9/gF9K58CHA2CHdTsfHrXi7uZjRWnuGYCP86
 7pOKMpX840K4AjXMeFT8gspwu+FFPmDPllRgfUQkdmz6PRx8jm1ol7m+IiUZ3+xUUqKh
 2nOqiVSwagP+8zfTApZAJ56jokeFgwRZdWtj8JxNljtWftoRNYtgtgVRUdkekqaqNKVz
 aJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PvZSczC6umJopWKeatvFKRPXXAs3l7Ppj7hlaQG6eAc=;
 b=NSrfx+gVe4Bc+YrRHI57uYtekuyGZ+C5KvNGkbfWRxunN4lb1CeqPBV2F52wcok8/T
 fC+GJolMSfzYQXqAtAttf4OCQD+hjQEasjwgr7nFFeNIsBVAbtAkDz67uV92jlxYkNfM
 9mDTpeWMRqp2deYU6GUeyjIvb8tGRTkMys3+eadCPLHYDoXSZbZr9dNj+gwygX8UPCOr
 YvKOLhkCuIPkj6r1SgXL+UoTIkUZx/1zmu3FPoH+eogWEF2bOQd2tWDAqexgu5HwClWo
 48UkrslSVS1gaCn656saFlj+RFbjb0IbMKUZkb/PRqA04Tn1fIjpKR6jIhh+m6ZlUmBQ
 er3A==
X-Gm-Message-State: AOAM530aA3nVrWag+BXIKy9pT4zRn4gnkQi/7r/98J6lldT5dtp8595O
 d+cSCCWVS3Y20bK301cpO9tgyw==
X-Google-Smtp-Source: ABdhPJyoTIXbZWcpshBd5z+5mEStDbBaicx0t7HFnmYLXGaSSThFwCDNKe9kjbVZ7S3dRqv2vIjP0w==
X-Received: by 2002:a17:90b:180b:: with SMTP id
 lw11mr5896661pjb.108.1636451318438; 
 Tue, 09 Nov 2021 01:48:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:38 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 04/17] riscv: Add new csr defines related to vector
 extension
Date: Tue,  9 Nov 2021 17:48:16 +0800
Message-Id: <6013bd0c309cecf244a151b54ee73c0ebd391663.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014839_449302_735004C7 
X-CRM114-Status: UNSURE (   8.53  )
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
