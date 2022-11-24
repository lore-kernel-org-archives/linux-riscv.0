Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030CAC352A1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWn79Z6bwLUzslg5NRCzQJKFfVfU/PbNHZJ7koPAguY=; b=NvH0lbygq5WOgP
	vuTTXVpiYvox+1W9Fb833gPu7KN2PoPwHQsB9swK4b2CJv4p9Aunj1rrfRec+vW94LDXnnM3m+zBb
	s7qFdOtJGhm4MpVVPLg+UpJ+61s5xWsrVKkbH0ohpPDZ7KqEt28qbnbu/LUcCYFwlZMxbju6KleNq
	mZZAB33p0ws6Jl6UHLcYLpa2T81HSjvTtIpQtVFl/XXGM6XPFqRrG4ap2YHVl18fmsFviGkO0pPAk
	V4hFGLdVziSe/89NbHWXIWmWXgmYCxe+z0l0ELpVv57Ykdqp2O2nik0TICtxWxh6xUgkZ/M9Mn1mG
	gzyZ8e7WZsSuxNe9pKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFw4-00AQnm-KU; Thu, 24 Nov 2022 17:22:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFvv-00AQfy-Ti
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:22:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1694708wmi.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGTeIsZb6dwV09Jxzafi+tDu+2zt3FcJZOZJD63Nq5c=;
        b=A8LwDLViXjTFC1n697iLKxetZVRA1pt1BHLBlG57fgEUyDIx3T36ft5hVIQ4PWKzmP
         SEWBgibKQyMivuFK3DxZaAUP+1xQfM5MQm5PUNzOwwhy6pinBh7c1A0N00k+eca3HU40
         doCckp/rLWs5W8eYAuB/1QNLKN/T2K5t5LgTEMO5dl+cSkBD6azgc26KjPazGrTu7tBe
         UsuuPUnMpPH8o+flRy/pS+igcqSvnvLnemkQvzO0njGh16HP33hXmD6NolW8/jx5CwlA
         9zZE/8pwDgITjGWh7k23C+uldZMkh2eXjUJ6lumuOfiz8TNIFPPedzTKOpaKWlvQq5nQ
         +MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGTeIsZb6dwV09Jxzafi+tDu+2zt3FcJZOZJD63Nq5c=;
        b=BvBevT0szePF/HnaER/9uIMcTgwYGDC13Z1CUls563Ndqo/gxQwqo/LoZDT6hXrpkW
         LFZ2lzh+9h7wLcAEsHTFIWsiegnsTa/enNCCX2DKk8F/epLGOhP093brz4/VEPQhm74P
         p+EiiLyoMs0PwxZv/c2eEN2t3ukykrgIu4BtTZ02asfi3CHLyYCTuQ9ygicM2oJJ0fK/
         WfHu8R6GFSBtCpBYLJuVBmk48ZPcY7SyEeldPS+ScYEMcJkhDeDfe+BR4gnGluY7qEq+
         PAd+ZKDclC/CScDFIithDFdvg54yanDa9y8Wh07FUALQxVbARLITl2upzLQC1VLyRzXS
         W/2w==
X-Gm-Message-State: ANoB5pklFQ/tsS3XMaXqgKaFSolgSD5SQT72VJW0wWdSkeMCI9danAgu
	RwT4nO3826a0Lpkq8JfQarA=
X-Google-Smtp-Source: AA0mqf4/eGyD9maTGYn7KxarvFxZbqpMMQXISgDYXlp/nDaqQuuYHzBHEsZXJQoOOkcvNv2BBWShUw==
X-Received: by 2002:a05:600c:3108:b0:3cf:8058:43b8 with SMTP id g8-20020a05600c310800b003cf805843b8mr12220757wmo.95.1669310559371;
        Thu, 24 Nov 2022 09:22:39 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:89ee:3f5d:1c99:35d8])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003c64c186206sm2698086wmn.16.2022.11.24.09.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:22:38 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Thu, 24 Nov 2022 17:22:01 +0000
Message-Id: <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_092244_020502_C49F3F5F 
X-CRM114-Status: GOOD (  10.46  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce ALTERNATIVE_3() macro.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/alternative-macros.h | 94 +++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index ec2f3f1b836f..1caf4306b3d6 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -69,6 +69,34 @@
 				   new_c_2, vendor_id_2, errata_id_2,	\
 					IS_ENABLED(CONFIG_k_2)
 
+.macro __ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
+				  new_c_2, vendor_id_2, errata_id_2, enable_2, \
+				  new_c_3, vendor_id_3, errata_id_3, enable_3
+886 :
+	.option push
+	.option norvc
+	.option norelax
+	\old_c
+	.option pop
+887 :
+	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
+	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
+	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
+.endm
+
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2,			\
+				  new_c_3, vendor_id_3, errata_id_3,	\
+					CONFIG_k_3)			\
+	__ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					IS_ENABLED(CONFIG_k_1),		\
+				   new_c_2, vendor_id_2, errata_id_2,	\
+					IS_ENABLED(CONFIG_k_2),		\
+				   new_c_3, vendor_id_3, errata_id_3,	\
+					IS_ENABLED(CONFIG_k_3)
+
 #else /* !__ASSEMBLY__ */
 
 #include <asm/asm.h>
@@ -135,6 +163,36 @@
 				   new_c_2, vendor_id_2, errata_id_2,	\
 					IS_ENABLED(CONFIG_k_2))
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					enable_1,			\
+				   new_c_2, vendor_id_2, errata_id_2,	\
+					enable_2,			\
+				   new_c_3, vendor_id_3, errata_id_3,	\
+					enable_3)			\
+	"886 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
+	".option norelax\n"						\
+	old_c "\n"							\
+	".option pop\n"							\
+	"887 :\n"							\
+	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
+	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
+
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2,			\
+				  new_c_3, vendor_id_3, errata_id_3,	\
+					CONFIG_k_3)			\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					IS_ENABLED(CONFIG_k_1),		\
+				   new_c_2, vendor_id_2, errata_id_2,	\
+					IS_ENABLED(CONFIG_k_2),	\
+				   new_c_3, vendor_id_3, errata_id_3,	\
+					IS_ENABLED(CONFIG_k_3))
+
 #endif /* __ASSEMBLY__ */
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
@@ -153,6 +211,14 @@
 					CONFIG_k_2)			\
        __ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2,			\
+				  new_c_3, vendor_id_3, errata_id_3,	\
+					CONFIG_k_3)			\
+       __ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c)  \
@@ -167,6 +233,14 @@
 					CONFIG_k_2) \
        __ALTERNATIVE_CFG(old_c)
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2,			\
+				  new_c_3, vendor_id_3, errata_id_3,	\
+					CONFIG_k_3) \
+       __ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
@@ -202,4 +276,24 @@
 					new_content_2, vendor_id_2,	\
 					    errata_id_2, CONFIG_k_2)
 
+/*
+ * A vendor wants to replace an old_content, but another vendor has used
+ * ALTERNATIVE_2() to patch its customized content at the same location. In
+ * this case, this vendor can create a new macro ALTERNATIVE_3() based
+ * on the following sample code and then replace ALTERNATIVE_2() with
+ * ALTERNATIVE_3() to append its customized content.
+ */
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1,		\
+					errata_id_1, CONFIG_k_1,	\
+				   new_content_2, vendor_id_2,		\
+					errata_id_2, CONFIG_k_2,	\
+				   new_content_3, vendor_id_3,		\
+					errata_id_3, CONFIG_k_3)	\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1,	\
+					    errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2,	\
+					    errata_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3,	\
+					    errata_id_3, CONFIG_k_3)
+
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
