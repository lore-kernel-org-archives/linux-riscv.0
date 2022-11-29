Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7802C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHXtQ4NwVVtON0ZVS7kZQZax3DlFvF++Ao7omejAcLA=; b=QBnYpiEY3lXVpq
	ukrjWorwC785AdHyp365C4zn7TLtPLMfZB8RaUzWNQbU46H4e+PCMTQgZn8yCmK5ApepI+7HosxdF
	KonCSh2/6oLgU4ILh3pUGRU9VWixU6p48YZowZlHYMEGh3zG6KNXJlbosHIvvlWEJjPoANPwBNRxV
	UMRPG1/IRrv2IqQonIPMF7SsUOw4LPw7DHyFEVh5OldR6Q8SAR+FgGPAwyhP0PdMyKaQrTafFjqBw
	AzkRZlYRiILFC1UtrkCJyIDoILtSBXiJoPCPwwMfUQh9fYz+ZzfEzGsfjydJHvcr8AHduN+gkJGOD
	XdBjNJDOEVD43gDhePEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026l-009XBt-O3; Tue, 29 Nov 2022 15:01:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026a-009X6S-10
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:01:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z20so20119958edc.13
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EMN9nLJtpNP8XdcPCCr5yWeGEoC+YU8jIuBg19r28s=;
        b=PMmj9DH+HHdKIXTMzDGD2sVcHi6w30rM5go+Pky+saIscSNLSXnc8aTIStNePY6lnP
         yn8TfVbfsvYY2L0hIEWiAz24EXMsPIcMPJAeMzXu30RDmJAEQeFG3XH5qujXkukLfyZH
         IJqYcRBM/vU+kkBcpbHWOeKPR/RfYP3p2QdZjIqNSO05v+SHxaAriqscaJa/JevxpD9F
         Ej4dDDDHM178u4XMzTjWNO1QjgQnGwEIf7ioF2uYu4ZYegNv7tdc3tXPIW4aeDCaoWRL
         BXIrv+lPi6sjuT/zNtVPy6unMXpaOR/EThVQdVhAOpq9t+O8jEpFCp5s0t7XmVPWIoh4
         VLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EMN9nLJtpNP8XdcPCCr5yWeGEoC+YU8jIuBg19r28s=;
        b=LCMMTmW60ejNUkcw7ponYxBvEoPEY9tz383OHSs0IwB1E+6tiMLXILKxBEPixl7QLx
         H7WMOj7NH7UEtAHiaw/5xpjQMAXHAe0k6120clMStiWGfm3sL3SqdWLZmw5AtSA42acd
         UW/MMomBWelBkSN4pk5hbbX8XYmoDz7XC3lz1agA5PG9Ra1nuSFQFhW9738jmNYhwdVt
         NlD5H6dcPZP49SSXeOA3UC2mjWfu8kiBTW3IXiGGET3R8hrEP1zJA5oM/6Vi5duWbw5m
         cdhv0yfcePXjuBXKrup1OuYU/kxkuJN0VjaH226FMg+Yn8KKZpgu1xiqn2T2Pn1a64Zu
         JDUg==
X-Gm-Message-State: ANoB5pmbBAI4jDGP+SOPafdQ1MBTlyEaxv861lA2GkUhv9Za7Ywmrxms
	iTfDxErfwesDcC19P+fh1cRQwEGeREJGYw==
X-Google-Smtp-Source: AA0mqf4TW3rK5NGGp1BoXVho97ipVNZsXYB+KA9lsNpttmWkE5jrne7Z1/Pljfn+nMVIt0lRKFw53Q==
X-Received: by 2002:aa7:d417:0:b0:46b:203:f389 with SMTP id z23-20020aa7d417000000b0046b0203f389mr12835222edq.303.1669734060102;
        Tue, 29 Nov 2022 07:01:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id de52-20020a1709069bf400b007ae566edb8bsm6271362ejc.73.2022.11.29.07.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:00:59 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH v2 3/4] riscv: alternatives: Drop the underscores from the assembly macro names
Date: Tue, 29 Nov 2022 16:00:52 +0100
Message-Id: <20221129150053.50464-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070106_323444_C17E6104 
X-CRM114-Status: GOOD (  11.30  )
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
index 7cc2b587c5c4..9ea95331a280 100644
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
-	__ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
+.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				new_c_2, vendor_id_2, errata_id_2, enable_2
+	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
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
