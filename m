Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F15C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zaHP9Bau7BAGYhzc16c7WbWKOMR+O24wt1GqH19Q1oA=; b=HMqkHDHaOjBrAo
	Zpw8j3R/jiW8Ws85VcVwBmvSObQwKl+ao7sAsZEY5j82BdeevK/WVuxzIMOdC6so+Orf9G2sACGDY
	ebr89zvcI0bfdHsEi0KvcIJRpJTPFWBwWhVAwk9mZNz7Ox5ZVQ09m4gB+48PouqTCKZR/HpzWpF0b
	/+CVBsHZRXwcHQBq6NEJ1cI6cH1P+hs7OqwZLhJpfPEwvyTqNgdSMOW5ZuTf4EaPFJ7Y/k09Rhi9v
	ed26xr9TRS9opFugnolZ3ZhEToAmWQLb6/54V/Cwb0pAT7LAKgMJDMNgPvF+Q/BYS+IhTxZeK4GZj
	HJ0ZJ+FfzcPARsNWkMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4f-00GCXW-Uf; Fri, 25 Nov 2022 11:40:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3s-00GCRo-Ho
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:40:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id x2so6052736edd.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp2xqNOOmz2IKHj5/PkOamF8/3RcllKyZSdfWgLEUNg=;
        b=ig+P6ZICfpheTHEufDYfV98bCWbKafsB+cdCjRVKvy8CeJxx9viszCMyFpEByv4DSt
         AOpE29enYfPvIZrSG0jIKLUI0lkq7dLEUaBSYyTHSV/rAPs8o0YT90xmyKPAk6DFmx+m
         hPkVBKaD6Ee51soHEsGFUPGl7+aAtQt7FZr9zCQ886hT9gvy5PU9QZnN6pnMLsLv29CV
         VYfP03yQhDmRIBUhbPBUpj9i8bP+z/6H9NnMk4tYmSh7WCjNgcRYcivh99loj8GQcoXB
         ZAHOvCtTH2f0oXXt1sp749G7DcNJxSAl5lSEhAM9SEpxYKY+RXBnz0JxiG+X5dYnsx8O
         h2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp2xqNOOmz2IKHj5/PkOamF8/3RcllKyZSdfWgLEUNg=;
        b=5fqOUGL77MF90dsFFW2/v++ZGX6EkbkJFAzp/VU0sF4eBh4LAec4A3v5N5IRGpZCSU
         HX6yV5UN2eYfRIPZMPJK1Nj2xbQbYPcVygcYNcef7DDVeGxq+wu17TMJa8GjXYYEUy1X
         WoxZSZGECITmvIFH0XXkqNlkwrJlGrJr6yH3ql4vydKLk9h0wdpDQEpn6QNtM8zbYQaH
         JO5nJbFgbn1Z1ZvkOLIrdmivcu+7MeU7SNHiQ1eMxj3dmXM0Wd1RX715JFTmggG0Py9n
         jrjfqmtCjEm1NWSqRZ+BEQYL0B+HDQAMfGmys7zOdcSR7mYK2+V49tK4CHWmsWnY2h+y
         lNyQ==
X-Gm-Message-State: ANoB5plb8JPG4sdp8cThESE5ixPXw360XYX8J/7xnxMkFv4sPGAv88m7
	hPWKPe+4eI75M5GkgWf3dOZZQ/SV3XLt3Q==
X-Google-Smtp-Source: AA0mqf6oOzGaYkiD8kH4VmBCH2iEarXnf6qtdQviqSM1+AXTh2LJ53s2x1v27+He9DVfIk4intI2RA==
X-Received: by 2002:a05:6402:158f:b0:469:acc:1c1b with SMTP id c15-20020a056402158f00b004690acc1c1bmr30838462edv.228.1669376401433;
        Fri, 25 Nov 2022 03:40:01 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bc21-20020a056402205500b004615e1bbaf4sm1674044edb.87.2022.11.25.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:40:00 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH 0/4] riscv: alternative-macros.h cleanups
Date: Fri, 25 Nov 2022 12:39:55 +0100
Message-Id: <20221125113959.35328-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034004_617514_B3747B20 
X-CRM114-Status: GOOD (  11.08  )
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

This series is a collection of cleanups for alternative-macros.h with
the main motivation being that adding new ALTERNATIVE_3, ALTERNATIVE_4,
... will be possible without lots of bloat. For example, adding
ALTERNATIVE_3 should look something like the diff below and
ALTERNATIVE_4 the same. This has really only been compile tested, as
not all alternatives are used when quickly booting over QEMU, which
I also did.

Thanks,
drew

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index a6c4f8ed41d3..0f92ec1a28e7 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,17 @@
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				new_c_2, vendor_id_2, errata_id_2, enable_2,	\
+				new_c_3, vendor_id_3, errata_id_3, enable_3
+	ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				 new_c_2, vendor_id_2, errata_id_2, enable_2
+	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
+.endm
+
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
+#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
 
 #else /* !__ASSEMBLY__ */
 
@@ -98,6 +107,13 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2,	\
+				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
+
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
@@ -108,6 +124,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1,	errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3,	errata_id_3, CONFIG_k_3)		\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),	\
+				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
+
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
@@ -121,6 +144,9 @@
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
 	ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c)	\
@@ -132,6 +158,9 @@
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
 	__ALTERNATIVE_CFG(old_c)
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
@@ -163,4 +192,11 @@
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
 
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
+
 #endif


Andrew Jones (4):
  riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
  riscv: alternatives: Don't name unused macro parameters
  riscv: alternatives: Drop the underscores from the assembly macro
    names
  riscv: Don't duplicate _ALTERNATIVE_CFG* macros

 arch/riscv/include/asm/alternative-macros.h | 99 +++++++--------------
 1 file changed, 30 insertions(+), 69 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
