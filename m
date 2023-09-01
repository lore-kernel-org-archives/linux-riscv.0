Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B3DCA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MSLca4TQ2lxxrie9Ggwgf1NiJOFZtom4qSNvXsOmTA=; b=NwgkMuRxNNjXRu
	cEW8koO1I1KQ7yoY/epuBXk/yKgqgQj7ngp7IQQEV+Gbh3zx/L0KmIEJIj+Hjk7WmR4cDTU/lewjO
	b4PVY8wz517RFFFPnR18o5sF38e6x/Eo2NmEdOTPeJMiOtD253yju4fXdDQ86TbXn7KjEBzP+lWom
	xVWcMCV1F+lX2qzPx9rTCHW5pp7edZYm4L+Ysm0t76JoNdpEpOWxWXRnWJBsZt5smUmhkbF46vpAo
	YFVrxSU97k7S+hUn3Up5LNDdk84mjx5u0cDpGNV7G0l7r/5jDECf1Yf9YkJWFRC3ZftF3QjnlF5jD
	Iouu5CZsv2xFeIBQiFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1wX-00H4Qm-2L;
	Fri, 01 Sep 2023 11:04:01 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1wV-00H4NR-07
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 11:04:00 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bcb89b476bso31579651fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693566236; x=1694171036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duvwdvUou9ovP3x58ccTQUVl1jXo27Ajp0N7Ke2ouSU=;
        b=njMFHshUUfpsGE7MqZLATT23AZs3kKoOsv5dHpMite6shMbOeKdugW+joWafO6VgBk
         jZOvs7pTY/r2aUv9QyltXETCsAiFaV334qIsrpZrbEzuggnUeZjeEpeXZLWXoJGexBeY
         EglC4/UhVUwe+D+6mUN9b1NFaie4T8awrxj9bf9o/m2imSMVAv/SjYqDsrZ5H0P1TxBa
         DlQ+VLfdpMe1wi7ejGwg+ycYOindwJ13KsT3TVsgEQsbdLGkIuticT9wv7404RRRE/VD
         V8NEw9nYKt1hU3mRxfeeS1aqruZIBuCudkVylR5WOruYJ+EKPGOXbDjG8ToP91XYa2GB
         XO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693566236; x=1694171036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duvwdvUou9ovP3x58ccTQUVl1jXo27Ajp0N7Ke2ouSU=;
        b=J5b6L8laySE4ymG+IdiBKoGmQ/Xu/3XZfYFYKeO5tGOlkXZrBUD8u9cKPFD+kKeAdR
         0MehR2oYDx8wCnLPVBuZVRsJ5eTSBcOOpVzMUM20JkBEfu4f9TheOInVDEuL3Z7brCGM
         COPPZC+g+E/JO61m9+dRCdg0F0iVrBK8pGUvwarAcH6Zq1PGq/FWfBfA/BcDrzPhZwso
         poeY8sWugsHLeaVTeW07DCVfJBdiygrEnH6Zc3bkUWg217LHcFaZ+1rNvNJvMjWcHinf
         ue8RSllAn8H9RtlqJMulXgw285GPDEo2fqMKdNOetux2wc601IlHWYE/ylcUwNyu1nXQ
         Xb2A==
X-Gm-Message-State: AOJu0Yw+fUC6Rz7IfvOJMAjUu7xeNY1kDqusKJCro47TMkOXDvYE4SED
	TTL3li4SzNYMjNFM4BIx4ig=
X-Google-Smtp-Source: AGHT+IHt96lX9c0h5UQyEWxF/ahPrbLxtus8+mTps5mtTJvC+wZbk4BlT1Mxbxz0HUpBNBcdRAsH7g==
X-Received: by 2002:a2e:9c06:0:b0:2bc:f739:2eda with SMTP id s6-20020a2e9c06000000b002bcf7392edamr1356891lji.5.1693566235704;
        Fri, 01 Sep 2023 04:03:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c248b00b003fc01495383sm7667847wms.6.2023.09.01.04.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:03:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in ERRATA_ANDES config
Date: Fri,  1 Sep 2023 12:03:20 +0100
Message-Id: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_040359_078426_6F202C00 
X-CRM114-Status: GOOD (  10.84  )
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

Andes errata uses sbi_ecalll() which is only available if RISCV_SBI is
enabled. So add an dependency for RISCV_SBI in ERRATA_ANDES config to
avoid any build failures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/Kconfig.errata | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index bee5d838763b..566bcefeab50 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -2,7 +2,7 @@ menu "CPU errata selection"
 
 config ERRATA_ANDES
 	bool "Andes AX45MP errata"
-	depends on RISCV_ALTERNATIVE
+	depends on RISCV_ALTERNATIVE && RISCV_SBI
 	help
 	  All Andes errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all Andes errata. Please say "Y"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
