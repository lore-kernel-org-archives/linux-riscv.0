Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C1FE936FB
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9Y2rUGxOAZtxHJ+MMGGSoENgu37w49QkU5p2vWMcd8=; b=JFFAP4Tzwxd6vE
	H4nxiuDGM2Mr8Egxfjq+W78uihxEorkizOYVZd50yPZGZX1H0CGHBryEPxWE9omn5E5rVKzO7vGuQ
	oHN1GXHXib/3KKaFh8YYLIkMQRTcZetALdRJ5M7v6igofuTsbH7Mc08fRWPNQAD2q/CTvHbs2+EXo
	o6s3sqLJyUU65epyCt5k2rUXBJ004jLovoW8Dj2UsrQdv9BdQZrUNpzxmiTwBXdu6PBWZiiLsG2Zj
	15sZCpqJao8NeI7ZK70v0VQ7l1hMkATN9YihiXuv9H9EjGbcR2u7t9ipoN4X3jRzh1tFn1JW87SxG
	dpI7VF0/3Dfq2a0bsI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp27f-0078ju-1Q;
	Sat, 07 Oct 2023 07:53:15 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp27d-0078ix-1L
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:53:14 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3af8b498d31so2092000b6e.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665191; x=1697269991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPLzD2hkD9MU2klabOh84epBZjDrW7CkWhrvlEFMKtk=;
        b=e7w3S0AhPOpbWNk6BamILAYbQCo8TFD47jk2gTEItFzR2je9PkG3cI+7MliI5NMdkj
         23n1L9SHJ1ZZKHcp9X6z5HpLr9KWyTX3Ov9Qr34XLCk42U+hzAVlkzka0Qqsvj0KGGaX
         lCpBL596mO9FcrWyednQW31PzHtPVpfbkkK9YbgveNNC7aAZNpG6eYVdBQOW9FTR84gB
         wCb+9WHfdQj8vI/xjlDTE8bOEd+nQKSTFZKD8j0pdtZlAGR2SRAnajz3d8gBzX02+erg
         TXjSeRBwYZADTR6VvU0JzjylchSyO+2WOHZfnw6dMPq1cBbuhmIAtfVS02r35e59HAYE
         q0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665191; x=1697269991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPLzD2hkD9MU2klabOh84epBZjDrW7CkWhrvlEFMKtk=;
        b=k739CPEMWgOuymJoBBJneN1OrU7Dq2zqGVo/VqnJ8rlt0g4xkwggyYAnAi/a4LR7/u
         dKAmQ3gFTO2z91cCdIJkmQGk0B3ot71WP3nv/cRAKNf4OrPYPTE/dYSKtWx0OkhdL+np
         HmynTd6ZiqNMphDqbYHgBBPwYk55UXYwGZMrbRIlxR2M4/vmkdcFMEiYe8QXCPDtFNQS
         jqo443LAsOLtnh8LjRk6QaZ6Bwzn10sPwIahR7w/O6ObarckbEb0+6dYW6QxlsW/JFqE
         SGD/vZRFTBEaAAfCwV9CXi2dM4DXp6LUUPxrzzV9SzhoEKv4XR/wHNVzZRpXmQJmDjWg
         lZgQ==
X-Gm-Message-State: AOJu0Yw4fA3vvFhbh4c78inkKkekavr8atlfjqOnXvwmNaQuaIuAqhBj
	CeohTUPcTpNbV1pa3k+A5H4=
X-Google-Smtp-Source: AGHT+IF90SEF/9uAJDyn7auQaHMcJBrhzHwtye3fd7EXka+UYbPfkQHg+Q2+JN9512tghxsVKCg9Ow==
X-Received: by 2002:a05:6808:1309:b0:3ac:f107:52b with SMTP id y9-20020a056808130900b003acf107052bmr13272546oiv.2.1696665191524;
        Sat, 07 Oct 2023 00:53:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id i1-20020a056808030100b003a9a2362f66sm871601oie.16.2023.10.07.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:53:11 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 01/10] riscv: Add SOPHGO SOC family Kconfig support
Date: Sat,  7 Oct 2023 15:53:04 +0800
Message-Id: <15d8e87c4595c30b3b55522de9894b352c2b58e8.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005313_460403_49E8DB01 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
cores.

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6833d01e2e70..d4df7b5d0f16 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,6 +22,11 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
