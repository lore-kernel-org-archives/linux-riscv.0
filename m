Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428EC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9ycQVRV4KywF/32vH7zZGnM/tJwtj0rVwvzT4xoRt0=; b=FHL/5tFSPH/kSr
	lPae6SnMVeRd/kg4uUXgxGlHM6AFLtGvUDry/Xnma+95qVqaSahpionSgfoHmxfVY8cqsbFjBxGS/
	/Z9H3HNoUiy5N8WBpGYT9EnMi2wBEhPlb65CL4cX110EsYk+Yy9cohEe4QaHo3KE7aadtIWE8WYXN
	h5mH8X+whbq470p9vkQzlJHZ/kh1aSR4rysjPuhTOwDwt73IbN8xHAsmIgVcPqDsgnrzDhYD8bAFp
	XeQnjqYMa3bFq+6wefl9/iKLVHnJ8nttf2i2G03bUEhKtTeGI+4Ua4Qxcla13uUz+lWom+OwIqgeU
	40uw+E9SYOEguMjM9WcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4j-00GCZp-Dc; Fri, 25 Nov 2022 11:40:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3y-00GCSq-Ep
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:40:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id vp12so8435553ejc.8
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV5LY+KYbZtIwHR9OBDHLg6Er1hmrO5M3v1yt7YuVaE=;
        b=o9NBSLU5WZur5ijb330JEa0cmdAtk8K7vnlqP+z7P5QEoooO5+L2Iv7T03j18B3G51
         ia4AC6pEhqTCy0EbYIgen3BAfg44MnWPBHHqD131+4NsbU/RDXyMlQrCcI6wfenz64M8
         sQkmyq6LOEKS/244ZwlbHgYke7ViDZdVeorFEfYAtg6p099KgwkLlWU+O1eKwqIM/MhI
         9Mrd+CJH0kp0d4a3dp3lRaJHUrj0jSVfy3i5jxoedyHWj+WZelHYAPd4PaOwnWRYrMo5
         EoVFJtKSNIAd9XZtSwdHaUS5kvCbxWKBwgKvn8Gk3QQJEA7xoyId2bB7qGp0WYInRJl+
         nqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nV5LY+KYbZtIwHR9OBDHLg6Er1hmrO5M3v1yt7YuVaE=;
        b=XS2v4pTYdT3Dixy3cr4X/NAqE4kAX4xHu4bqHm1mKKo5ECGdH6hDF2aCSEXSW4QbSA
         zNTxfPykhoqcMxSLM/NI2ZEHAv0asnqNsazzcHTyVIQd8xG5EN29ihx063T/4Tx5awMg
         4ODQ9K8yrz9A9OkXoqfSvXqh9vtcGyNdvzEoWbWrnnfQZSAwY0uMWZzEQd+HdwFBr49y
         2fdn7Hb2xiUHQsSDAixfJDYCmTvKZIXrGz0SxFE2NCSWFTnXGfzBYwiiRV4pxP2J06Kx
         qE8oK71Lk1lh9m1gftLhpM1eucOjESX5ZY4JimSCpdrZgj+R1wsJkQhTz02n0+t4Sh3e
         taBg==
X-Gm-Message-State: ANoB5pnjEjEQTwUuBgKTHiSXXWIa2WylZjvISmy9yoirxuLJmqZzp7tG
	ve7OlkPobQ/ZX+20OhMBdNjJCcqPeNMmTw==
X-Google-Smtp-Source: AA0mqf63XBS8Xs+q8StDcIV6Dct81i6NvBPJjACX3xxlXEPsi3GBq49xKAP3VLlDNlZ+rEsg3NlFkA==
X-Received: by 2002:a17:906:bb06:b0:7ba:708f:2a03 with SMTP id jz6-20020a170906bb0600b007ba708f2a03mr8879003ejb.167.1669376405933;
        Fri, 25 Nov 2022 03:40:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id pk3-20020a170906d7a300b0078d38cda2b1sm1459159ejb.202.2022.11.25.03.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:40:05 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH 3/4] riscv: alternatives: Drop the underscores from the assembly macro names
Date: Fri, 25 Nov 2022 12:39:58 +0100
Message-Id: <20221125113959.35328-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125113959.35328-1-ajones@ventanamicro.com>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034010_510155_D7D8B573 
X-CRM114-Status: GOOD (  10.86  )
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

The underscores aren't needed because there isn't anything already
named without them and the _CFG extension. This is a bit of a cleanup
by itself, but the real motivation is for a coming patch which would
otherwise need to add two more underscores to these macro names,
i.e. ____ALTERNATIVE_CFG, and that'd be gross.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index a5a8a2a3c267..68dc349b0876 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -33,7 +33,7 @@
 	.endif
 .endm
 
-.macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
+.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
 886 :
 	.option push
 	.option norvc
@@ -45,11 +45,11 @@
 .endm
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
-	__ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
+	ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
 
-.macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
-				  new_c_2, vendor_id_2, errata_id_2, enable_2
-	__ALTERNATIVE_CFG old_c, new_c_1, vendor_id_1, errata_id_1, enable_1
+.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				new_c_2, vendor_id_2, errata_id_2, enable_2
+	ALTERNATIVE_CFG old_c, new_c_1, vendor_id_1, errata_id_1, enable_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
@@ -57,9 +57,9 @@
 					CONFIG_k_1,			\
 				  new_c_2, vendor_id_2, errata_id_2,	\
 					CONFIG_k_2)			\
-	__ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
+	ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
 					IS_ENABLED(CONFIG_k_1),		\
-				   new_c_2, vendor_id_2, errata_id_2,	\
+				 new_c_2, vendor_id_2, errata_id_2,	\
 					IS_ENABLED(CONFIG_k_2)
 
 #else /* !__ASSEMBLY__ */
@@ -126,15 +126,15 @@
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
-.macro __ALTERNATIVE_CFG old_c
+.macro ALTERNATIVE_CFG old_c
 	\old_c
 .endm
 
 #define _ALTERNATIVE_CFG(old_c, ...)	\
-	__ALTERNATIVE_CFG old_c
+	ALTERNATIVE_CFG old_c
 
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	__ALTERNATIVE_CFG old_c
+	ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
