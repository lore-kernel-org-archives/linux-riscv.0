Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355E9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0272061158
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0272061158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBrho7XHrSJ8So5SUOVHRcyweS/+wjXYSE4ST8lHJXc=; b=fmi+oy6j7UXOZo
	GQ47lJx1i4cR3rQEbSGaFV7RoWjnXvY/3dZpSYZvB7dIdAh5S3jbKTNhYBZ1AavIVfJMyG1WO4xaI
	ZYXb0+ksTLOWzwcEYzgX2HczdN+QAHqTY8ghUDFxX/6JIcFvMd8LNC9luZnIW856FsXN0rggyKrxS
	hAdE9QjKBbAKDCqTOzcb91e3hoMs2Nqa1zi1XLoLlZVu1wa9tBJ4tdVkjOilk8Vz/pzAJvh50Lla4
	Jriplq4tFsBcNSqJN/CU1YUCibP4eG4UUI1zyC/fzgFXMAaH9zJT71rDSp1o3xad/sw/Oy3h96GMG
	KJ1qU+Rpytxr9Gs0y1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1eT-007IwZ-71; Wed, 08 Sep 2021 17:46:25 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1e2-007IYJ-Be
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id l11so1776092plk.6
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dHmKNReYOY7Wne1mHOCbaVArJVjT8YTojOEreYW01tU=;
 b=mhffb2sxFFqraGBxX6A7vwy6ZV0rlDStInb42S5Feh6ZWjd6WU8M7vwVtfEN8oJ5Hc
 txPRtcVNjrUhJ28UltBlb5cqxXPeyG8pob9pLF7ws1X+hnMZcCRxmm0HlspFTkyl8JsW
 rmbPthyg4kOSec09TXFHQgCOVEBkV7K8jmoiaORbtCQxf751kpRL6lfUeqqAWqgPKy2n
 +RFNypAKNd2vxNkS+CPSOemX6s9vltbOEfLsYAdhgi0BUAu/c6fmL00/Wn/4dy9oSDbS
 8IimZeTLEBSCPfek81p4WUN97+DkASg0FwJu3A6oSvDfodXyQ2Dj+mUPJ3cPTbmYkJSo
 a3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dHmKNReYOY7Wne1mHOCbaVArJVjT8YTojOEreYW01tU=;
 b=xPFWVjipZgh0CAtrluQDgBrPLMhb5CTgXfa98kYanrLAl1Gdk/2EiUdVPsIHo83Xra
 dI+sTR1bioEjHKYh24GQdsvMqbNqjQalEN0mxeFIlYyCH39QbJpN4ji4gLPmUTNR/MLY
 OlCpRmWqMPEKWtmLhVrS3DjY/ROmMJX9Sd6RPOcMjuuCegwynXoJz24VaicR123eEP6S
 nR1gO+zzWg7ugQS/vFxSmQvNZL4G5BQoDqKOb1qCy0gZ2wJur1HMA7eXtCk7hQDL+1KU
 wK/1bspaxDUWKzPiUOQAGE8zcv6hkqthbr9DgWGM+DC25s98eYBpDXQA/oLtJRJuE+ta
 Rfug==
X-Gm-Message-State: AOAM533451Uc4JgzSWVuXEz2OSVpThwBnhL9oHrd4mnYf5ZhyW/IlS26
 jHXsCxEATTtMDOxM7Z9T9xN0v+Gt2YUnxw==
X-Google-Smtp-Source: ABdhPJwDyMUrSgiFUYqmOehVYqsKKgOtaFO5zRpVdI9VavSDwPShfDCO9ywvf6Iagr11iezOjyS88g==
X-Received: by 2002:a17:90a:bd81:: with SMTP id
 z1mr5363737pjr.207.1631123157743; 
 Wed, 08 Sep 2021 10:45:57 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:57 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 14/21] riscv: Use CSR_STATUS to replace sstatus in
 vector.S
Date: Thu,  9 Sep 2021 01:45:26 +0800
Message-Id: <ee930020bbd2a52064e4c51cf3b476a24d670cc5.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104558_420061_54743618 
X-CRM114-Status: UNSURE (   7.76  )
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

It should use the same logic here in both m-mode and s-mode.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/vector.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
index 4c880b1c32aa..4f0c5a166e4e 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -32,7 +32,7 @@
 
 ENTRY(__vstate_save)
 	li      status, SR_VS
-	csrs    sstatus, status
+	csrs    CSR_STATUS, status
 
 	csrr    x_vstart, CSR_VSTART
 	csrr    x_vtype, CSR_VTYPE
@@ -53,13 +53,13 @@ ENTRY(__vstate_save)
 	REG_S   x_vl, RISCV_V_STATE_VL(vstatep)
 	REG_S   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
 
-	csrc	sstatus, status
+	csrc	CSR_STATUS, status
 	ret
 ENDPROC(__vstate_save)
 
 ENTRY(__vstate_restore)
 	li      status, SR_VS
-	csrs    sstatus, status
+	csrs    CSR_STATUS, status
 
 	li      m_one, -1
 	vsetvli incr, m_one, e8, m8
@@ -79,6 +79,6 @@ ENTRY(__vstate_restore)
 	csrw    CSR_VSTART, x_vstart
 	csrw    CSR_VCSR, x_vcsr
 
-	csrc	sstatus, status
+	csrc	CSR_STATUS, status
 	ret
 ENDPROC(__vstate_restore)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
