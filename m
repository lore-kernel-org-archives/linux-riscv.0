Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605EDC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOwjvgKc9fYA1fxlEjpZk0uGCzzM4NxaOgOuYv2dxOA=; b=vzVbOFpmBum5uM
	n/qZVkckC4I4d9RwxJDX1MG/ZC4lkv9jiQ4lwkkQ/MK9kvx3GM3XZ7j5bdkXW+iwp/ga5lCZ6DOzn
	ieRChhhBSrySQ7hVZDdwjiTpCcGkVFrvuIhDshl6l7nq1ei75vihkN/zxWkRrb9lAeepLZAWI/w2/
	GQ6G8k/8RkvXO5RUSn1GWFRMtyLb0tOJ4mM7gN/d6iHpq75rkMyPGftzrznT+LcSdZQPlKw0YT/CN
	uOfneT+/uM8oAvzX5duRJqNbFT2nsoZYUO0YYDoenSbHnEXgqe9slAwUDCvBAYIxFE3Zf3bckNDrl
	AZfWxYOMc1oWw+WELzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4n-00GCbv-Vd; Fri, 25 Nov 2022 11:41:02 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3v-00GCSh-8Y
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:40:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id i10so9730506ejg.6
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et7jrcUCp46TKBjZ9I47RbmQBloFSNNuzFRXSOjWq2M=;
        b=Era7s6v6ZoORekTq/pfcDVNDTYXpL/GJswUCb2//uNsETOxixHYolthkWSOeK/2U2e
         mDKN89emNebw23uzhauvnFGDK8UvwxNExj+3d5/1CVu+seOn9C7PDJkFIJ9O0e8ZjYwC
         RB8IoCqqvbyei4R/z+/ZLGkjHzioOVFnWGqHHQi8IEAiT+NcognZbma7gxGMBcX8LuxS
         OKU6Kc3O0M7kmwNOv1COB4E3qwkMCdt1e4CwbCeW/kcW2xwhyAaYTsiP8VU9vlj/SZX+
         WTJkNmQLs/UOpeNDWeds4jRirS9tI3mGyfcYlWjzemo4dFyb7Tuwo0N5+32Lh/DFNno8
         L+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=et7jrcUCp46TKBjZ9I47RbmQBloFSNNuzFRXSOjWq2M=;
        b=oTJVrndN6cDKIqe67ixIGRWrGNzueiy7TwUbMpUOm4Z9orLpuomU2zLvmrjZ9q9ovM
         Ln8myxwDwtxDQmq5QtK7ohfkWCsg8m1IeZqREjeDqu3tp3c4FvheewC79nJkl0CNRpIk
         mXdFoxFDCed0NoFZLn1S2zT0oM10HOnJwgZtXGV4pWjvExPAkO732YcCYos+lFEZ/hlO
         bBS9WcnS6uP/KuMcejx/hFGDCM06NlblDLrmS2mvdauwgqlbGz+CWBWZnlzZfUx6yXOd
         FseToVsnktBkGvVj4bKg/Li3oEyMXwIhHLMMKNZ1fmSH9GnK4SWiMVOGDrx3SXGylexk
         BtWg==
X-Gm-Message-State: ANoB5plY8OVH0kN/Osp0Fzol3xrVvrNknzCU3ikhwq0e8T1QMEYtHqNB
	sY88pnKnNzQzrdezOPaULnske+3eOSfBLg==
X-Google-Smtp-Source: AA0mqf5rJeOOSAGT+xS/tYNxs9fWZX5go1DhRPqWSkIBHakNNUV3GU4hnZAdRjMtxNZ2KGtGEkF3QA==
X-Received: by 2002:a17:906:901:b0:7ae:23c:3cb4 with SMTP id i1-20020a170906090100b007ae023c3cb4mr30951887ejd.599.1669376404420;
        Fri, 25 Nov 2022 03:40:04 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b12-20020aa7c6cc000000b0046ab2bd784csm803085eds.64.2022.11.25.03.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:40:04 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH 2/4] riscv: alternatives: Don't name unused macro parameters
Date: Fri, 25 Nov 2022 12:39:57 +0100
Message-Id: <20221125113959.35328-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125113959.35328-1-ajones@ventanamicro.com>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034007_317223_D7DE7755 
X-CRM114-Status: UNSURE (   9.18  )
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

Without CONFIG_RISCV_ALTERNATIVE only the first parameter of the
ALTERNATIVE macros is needed. Use ... for the rest to cut down on
clutter. While there, fix a couple space vs. tab issues.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 64be770df89a..a5a8a2a3c267 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -130,28 +130,22 @@
 	\old_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
+#define _ALTERNATIVE_CFG(old_c, ...)	\
 	__ALTERNATIVE_CFG old_c
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					CONFIG_k_1,			\
-				  new_c_2, vendor_id_2, errata_id_2,	\
-					CONFIG_k_2)			\
-       __ALTERNATIVE_CFG old_c
+#define _ALTERNATIVE_CFG_2(old_c, ...)	\
+	__ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-#define __ALTERNATIVE_CFG(old_c)  \
+#define __ALTERNATIVE_CFG(old_c)	\
 	old_c "\n"
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
+#define _ALTERNATIVE_CFG(old_c, ...)	\
 	__ALTERNATIVE_CFG(old_c)
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					CONFIG_k_1,			\
-				  new_c_2, vendor_id_2, errata_id_2,	\
-					CONFIG_k_2) \
-       __ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG_2(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
 
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
