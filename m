Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00301C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7gb6J1Qn1MRfm4ZqUlL4aVro2h5HAntCzAA+FnK3Ss=; b=AJTmPzveQEmi6c
	AWG54xcRatEM88Xcotl31+R0Zu3mU63WA+SZDz2zVeooHcM7XR2nERyawDX0L/6LVTUNNB3X5/4By
	minNEMtcrVqsbj8hyvI0kSJUy1Eumo/pz825GB1at4BwYBBdJqpzl6RnC6GuXfbATvawT5Ig3eK0m
	yxtlUHRyrlmxA43jDFhPmpYMO5fd1vQAYJ0aO0eHqXNS3nyDpQz9/5HBX1JKOreBoBwYy5tKj92/J
	lxGSI8BJVi6aSsOxv6EZ0Qv/YzIfeilNZM5/4NtD0k/1Hl4VWN91Nxy0YLJ7uCV3MHeLL/KdusEEg
	g8utWEELpNOULd+fOzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4l-00GCai-Bm; Fri, 25 Nov 2022 11:40:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3s-00GCS9-Oc
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:40:05 +0000
Received: by mail-ed1-x534.google.com with SMTP id z18so6004013edb.9
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmzKFonNfqlcEy1Te4vp2ov8Z3P9eAT/hbOKbET5tdY=;
        b=lnsLcSdnA8fVDy3tCT3/7QL8KuPyNmATf8xSrxJgvLsvpLGlThpF1k1fZ8myGNix4h
         F1g33VWauw2Z5jeQtVIi3Pm8bLy1s41jgsbLSiEM789CpBRWJSJcjEB9FFTrxSMtPjSj
         Up37ZUyk2nJImBFUB+F8l7gklSvSzHqP+O6rxxAjvmpe/jDiySIesEBTGT4f6gOVQ6jW
         y49UV1997Bp5nFlVaHnPWU+7z6nV0E1s1rEHbxYZhtoEF1YuxnLKwOQfTXSsv+t0jsAR
         h+ytxM4D5Jt5lKMJ1vLMzkUbBKQSJXQXuTfMXE86377NKAKbsjunJ7awxdc+cAO3bcxY
         uKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmzKFonNfqlcEy1Te4vp2ov8Z3P9eAT/hbOKbET5tdY=;
        b=VprJiq9YXoLAgeY4C9bABoaLGx9L6/RDzAieQUwvzwMnYiKVf9SxVo0SjPF/UW7LRX
         gSRPV82/IL1gHKUpJn77RkWkbu7OmXdzHbydc2qfiLiOR/hESYeAwmX1PaPsVwMHGw4F
         yB1HYNu+kAiokNNkUvWF4dl8ZhGaHgKHeOANYwkMQqoJIfsrnXq0oMc7xJr/RMM6W+75
         qEYgE3QwImbgfDrgfGHSpWErT6NvNtB/1pl2N47QupdwzsXc3oYahVjZr1oRbF6LLHPN
         Pq3Lswa4X1CMZHehQR8eruWr82B08gScect/80yWRciVmLdtw6IpwiTdfmCAXxEuC7am
         DapA==
X-Gm-Message-State: ANoB5pkatqQsdHK4s2TLDIO4r77woF/hqgAppDRSVD+BovYTdV0iDEKE
	D+EkhkdxnPXoWA7t77DhuO6eTCQn3NOetg==
X-Google-Smtp-Source: AA0mqf6ANWWM2izcqEVfnIOe4islVzk7K/EEVogUy2I7cCfpUvEp9o8+fuud+rnYOmYFSsB2LbNtWw==
X-Received: by 2002:a05:6402:360b:b0:468:f365:dca with SMTP id el11-20020a056402360b00b00468f3650dcamr19294896edb.41.1669376402978;
        Fri, 25 Nov 2022 03:40:02 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q10-20020a170906b28a00b007b47748d22fsm1442967ejz.220.2022.11.25.03.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:40:02 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
Date: Fri, 25 Nov 2022 12:39:56 +0100
Message-Id: <20221125113959.35328-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125113959.35328-1-ajones@ventanamicro.com>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034004_818236_1349C916 
X-CRM114-Status: UNSURE (   7.90  )
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

Build __ALTERNATIVE_CFG_2 by adding on to __ALTERNATIVE_CFG rather
than duplicating it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index ec2f3f1b836f..64be770df89a 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -49,14 +49,7 @@
 
 .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2
-886 :
-	.option push
-	.option norvc
-	.option norelax
-	\old_c
-	.option pop
-887 :
-	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
+	__ALTERNATIVE_CFG old_c, new_c_1, vendor_id_1, errata_id_1, enable_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
@@ -116,14 +109,7 @@
 					enable_1,			\
 				   new_c_2, vendor_id_2, errata_id_2,	\
 					enable_2)			\
-	"886 :\n"							\
-	".option push\n"						\
-	".option norvc\n"						\
-	".option norelax\n"						\
-	old_c "\n"							\
-	".option pop\n"							\
-	"887 :\n"							\
-	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
+	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1) \
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
 #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
