Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C0C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZUEMDzztvalwQQzkBMN/q2Evd01O5F41ZyL1SrLGp08=; b=u/BkSKCE7HMaUh
	J1KPTpNTX4+3VGHxCsJYAtudhU81ftaqZTTfwZcHG3dPScme/fE3Y7jB6+tFVAGWjW7GXLy17ebul
	7lSOb6st+bjpJVNC+RZ0al6yU7k6hxOQ8dJgIfQv7b48p8ROk2zRHkxfCfFSzYXc45rn/3KAvFvfy
	2tfihuk4OpNGVlMAWIJnjn4OzR77meYcAEXekETtghDaMFR3lF126lOZ3UAVKEzR2hHJBmWNGV6tp
	DVEy0riIrWBBjILn0PNIuulK9jXT1EFwoh7shD8plX70e7BdWV5HdWTpe/Ze4gJYgdcB+HooleuLk
	y2PxppamSXhuYKfn/3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psMuy-009bIk-1p;
	Fri, 28 Apr 2023 12:09:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psMuw-009bFT-0x
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 12:09:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f199696149so50413805e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682683774; x=1685275774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8f00XptuJ3vBIkeMg3m5pPyF6yCS6hEBZQCfqkTlaCQ=;
        b=vtRYYyBzLwgzPKD+/TAPmiPYgrpCQvFhoiH7TWKY2TH4KN6cSMUsAeD74S4EEKiBwY
         M8OU9wAlBCjnPXl54GsBRAPBEaobk9PixBizafP5UJQ+lDRfc3sPjTnQcQ2ey8MWit3u
         hQSSTKKYS91gZzC+bJMvnHxIyMiAwRYCzWLWrY/y173aTycm7S+ng3LB6uP705SYbx1E
         yyoe3U1fRpuwy0ykEN3g7lTtMbVG/hlbI2s7g7zucTHQAvkt5wIKP9KxmNorx1N1FV25
         y/RPDeUx/aCa8MU3/+IOGOGenhDHjFFJjDjIJGT0gMVqEnnzjiCYxr7ovwbAiJ+I1oUm
         HwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682683774; x=1685275774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f00XptuJ3vBIkeMg3m5pPyF6yCS6hEBZQCfqkTlaCQ=;
        b=eNH6o682WWgdiil2JamgeUsCzf6G9fWM2aAaFcQdyZP6a2VNdtxKs/1cqpMtIMNcpD
         xgZQoH5VM8iErvo78/UNcsHJd79rZ2j5jByxaS3ObMJ9MxIab9DIJrLE9fqr/AZIVioo
         XwWT6nzJ3q586iH0LXmARC562p9zps7DqS3OVvUhsHVgjDGRz9ngOLhZHj8NaF2PtH00
         EzYwFTTA9f/tCWsGnHam9WrR3zl2ODPp2zSd4/VBrSUsWHWzflNzESWhZdUKOWCp9BIZ
         UgCEvGRAc5LZkg3zv1cmxPoVtugfsQ5CptIz+53egp/Cd1NdkRJVGwD2TTHSjFUIMdxT
         SqWQ==
X-Gm-Message-State: AC+VfDyE48pklP1I2qlZkednQGK8rD1fRXpPDwOzdrZ1qgL0UI58JpQA
	aB8LBXHX+bF530YSwsFB+ffhboJCP7fN35D/a1A=
X-Google-Smtp-Source: ACHHUZ5jIOJ0Vu7n+dpHeXbkHOwpf6iHzOnRRgEmQLZqEfJG857eUY1WUGCFqG84VuUcyF7T68x7Bw==
X-Received: by 2002:a05:600c:2104:b0:3f1:6f44:ff3a with SMTP id u4-20020a05600c210400b003f16f44ff3amr3958884wml.13.1682683774216;
        Fri, 28 Apr 2023 05:09:34 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bcb92000000b003f24f245f57sm15405684wmi.42.2023.04.28.05.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 05:09:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Move .rela.dyn to the init sections
Date: Fri, 28 Apr 2023 14:09:32 +0200
Message-Id: <20230428120932.22735-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_050938_342308_1F9B5111 
X-CRM114-Status: UNSURE (   9.61  )
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

The recent introduction of relocatable kernels prepared the move of
.rela.dyn to the init section, but actually forgot to do so, so do it
here.

Before this patch: "Freeing unused kernel image (initmem) memory: 2592K"
After this patch:  "Freeing unused kernel image (initmem) memory: 6288K"

The difference corresponds to the size of the .rela.dyn section:
"[42] .rela.dyn         RELA             ffffffff8197e798  0127f798
       000000000039c660  0000000000000018   A      47     0     8"

Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move .rela.dyn in init")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 305877d85e96..f03b5697f8e0 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -104,6 +104,12 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
+	.rela.dyn : ALIGN(8) {
+		__rela_dyn_start = .;
+		*(.rela .rela*)
+		__rela_dyn_end = .;
+	}
+
 	__init_data_end = .;
 
 	. = ALIGN(8);
@@ -130,12 +136,6 @@ SECTIONS
 		*(.sdata*)
 	}
 
-	.rela.dyn : ALIGN(8) {
-		__rela_dyn_start = .;
-		*(.rela .rela*)
-		__rela_dyn_end = .;
-	}
-
 	.got : { *(.got*) }
 
 #ifdef CONFIG_RELOCATABLE
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
