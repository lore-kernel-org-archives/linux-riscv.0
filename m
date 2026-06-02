Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBB9CD6E55
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RdvqVgp9c89RSUQzo4wk63mQ8ALFKMAV0aHaGI5ZbUI=; b=nYIAU+n1//Qy1n
	kQm1QorHIBhBmZWtBi8vdX8+/eGnMWGYuGzayaj5ImlZYDvsj57R6OHScGM5ZUtTcoYfLYD1kSa4b
	Txj31y8beCtWBIt38loVr68NNv6S51eptg6zhMcAPUSbDzwmS/jbqdMrQirIy84bTEW6NkbwffMy1
	ygcZ3Gkutw5KCytOa1fgEtPJHnTdcEJ4Y7lb17N84RbwqhMfL4JzH994XHKhP8Bh5LUOIg0BZFyBO
	zWLCZGGstfouaJsDM4h2rA2UJhGnUNQuHT7iHmfxx4nthF07E2ZxC7A5CryvxzZJuqgszDpOfmRHp
	EAdIxd3ANgQ+Va7jUsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2o8-0000000BDTs-40UH;
	Mon, 01 Jun 2026 13:35:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2o6-0000000BDTY-1BVg
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 13:35:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0aa420401so11603585ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320953; x=1780925753; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbcsOvpeEjozPZH+4z97yjnc522GeGwDhfuuOcja+k0=;
        b=CnFIBlZFCq+G14NSyTIffzxvb8FLjHylyITjlvVEdIgPG0jQaIQ1FlDZHw1WLVqzV0
         sDVX97ctEOMCLu6pNaPV+5Z0ddddw5sJwX2A0KjV8QbdA1uNrDTQZUY80BnBzCKW/s10
         fllT6AICCf87by5xZTR+NBPCx/E/UI29gNZxyum2/4bCkUvrn93MJ5YB6ggzgOqnoi/B
         nqXFYYtlL8c7QeMS4yw7m0nKLleSxUzyhQf5BljWLnt3KOTPY2hboz67Ifhob8keZDf0
         Ea5m6d2G7452o6Voyz+A0CAqhGSQyzP4WLev7zjDs9vKEmcGJTF+qhXiGEjuOtByeLNV
         dRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320953; x=1780925753;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbcsOvpeEjozPZH+4z97yjnc522GeGwDhfuuOcja+k0=;
        b=gAKg6raJJKwCn6RJIbyx/yQFHd1K068e4QU2JQuLkrbfCPHY8pkwzrT1weEynwQdMY
         vGTtM5V03A/ookoX7Mg6sMfSwFD8M9UdRjiLvLt/chVjA90OLdRz3hI+6zIY45Yra453
         HghQprMkW/qDNzo/9X4wMihTvX4OO7PFktSlBlkUAT8P99/WVSO6lVF2xmUnsbM64tYe
         CSjbs36IrfaGQvSFmj3nddkKFlFHQtSajhYj8+9IfJa5lEpudChWxh//uZDH0qaWBBZq
         tJ7yidayArBJXihMaZB8lQ3yxV/Dc/m/9YQcfeiWvXcsEVDJ8aELuF9srJujBg9vR1ji
         MTUw==
X-Forwarded-Encrypted: i=1; AFNElJ/rVOPZfISMGFcIzgPrZlJy3M+FrUr3vYEgFTtO5riN7R4oHG95HqD4Ux3lRUiENHcxczXtYnfamuRnIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmJkFV1wftUIzzEh4Jdq0gfdazc2D73YzTiLTLRqPZlh65pDc
	tukZgwv81TkmN50DGRupBB4F6/S8u0ufbo3d58mi8CEr0RpSVcnJK+0s
X-Gm-Gg: Acq92OF+WVWQTHK/hBkvpEBsPrn12Rdp0BVm6oQLSDiOWEnjVic0uC390FaryF/DA1X
	Hk9pzGu20D7nbADrZBSCaR9IBXJxtsNO3c6Ochxgz5kE7xwPrZNaxKWcentPIPAaIV0J8UiWItn
	0agfqvWGQBYozCd9YhK+v9F7CtWbRMG/HXHaYpItsBITViXTKSqAwdgmLvBbQxOgfecs3YocAuP
	G+sSIC4LO/Sx0htuEHzyyYRS7jvHMaKnrSNUifqpN+mlRe976rWQf2u+goX21+hF8X8FeIoSFOD
	DDrfHcGTu2BBlQElsWeDhekcfA4yCTOH4NqpmFPJR/ethbW30Vu/FrjExCY7MUoo2cFTBBVuKSB
	qoEHjnLBgFYdzht6lDqmnwZ0DM1WLaYA2a3M54YP4os2+gj7hFJFm60aK7j3qjN5LiZhMdcF3Fn
	z0pZj/escDPQ==
X-Received: by 2002:a17:903:244e:b0:2c0:d097:51ba with SMTP id d9443c01a7336-2c0d0975470mr58699645ad.26.1780320953126;
        Mon, 01 Jun 2026 06:35:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm143136885ad.41.2026.06.01.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:35:52 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Mon, 01 Jun 2026 21:35:06 -0400
Subject: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller
 driver
MIME-Version: 1.0
Message-Id: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEkzHmoC/yXMQQrCMBBG4auUWTuQlKYYryIukvRXR2gsmShC6
 d2NdfEW3+atpCgCpVO3UsFbVJ65wR46SveQb2CZmqk3/WhGYzkOrEtImKVygaLyHCTXForyEF3
 w1nnvjo7aYym4ymf/ny9/6ys+kOpvStv2BbDluqCBAAAA
X-Change-ID: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 Alex Elder <elder@riscstar.com>, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=U81JaS+uVsOCq5xH8KHw7CF8Re1+ZOxCZXh7B8IuBNE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiw543Cn5BU3Fq/3y9acfvJ192yRmf3GW2/tSJ72OW1Fz
 ITTgfKrO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAihxYy/C8LDnoeba06o9/Z
 oPDTZB25Fx8us7wqecOn0vRuyyw7n1aGf+p5F5NKPRlOGMhrS3Ra3NO/v6Lg8Xff2LmOy9IDVov
 P4QYA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_063554_349795_E3EF57A8 
X-CRM114-Status: GOOD (  10.19  )
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

The SpacemiT reset controller driver under drivers/reset/spacemit/
(common code plus the K1 and K3 SoC instances) and its reset-ID header
have no dedicated MAINTAINERS entry; today they fall only under the
broad drivers/reset/ entry of the reset subsystem and the N:/K:
catch-all of the RISC-V SpacemiT SoC umbrella.

Add a dedicated entry and list myself as maintainer. I introduced the
drivers/reset/spacemit/ subdirectory, moved and refactored the existing
K1 reset support (originally written by Alex Elder) into it, and wrote
the K3 reset driver. The series that created this directory and these
files is archived at [1].

[1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
I contributed this driver as Guodong Xu <guodong@riscstar.com>;
docular.xu@gmail.com is my current address. A matching .mailmap update
has been submitted at
https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44a..c9d87244c1715 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25119,6 +25119,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT RESET CONTROLLER DRIVER
+M:	Guodong Xu <docular.xu@gmail.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/reset/spacemit/
+F:	include/dt-bindings/reset/spacemit,k3-resets.h
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-b4-spacemit-reset-maintainers-4b5a91599585

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
