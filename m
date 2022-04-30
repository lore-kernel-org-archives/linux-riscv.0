Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF00C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAZxy0batwre8VZaq4KO0XccuKEbAZkiH7MF/WmWVog=; b=B91Me7FwepvnDt
	LYJTm61ZbYADBgAAI2yLTgdgdelzCYgWJkxjtilwdo0tW5ALCuYImxl0PLQFrxblFOj+U7huQtoXY
	lZ5RD8jXT4yF3tXTIcSftVZ/KBEqV3MLqi0tcTs85zY4iPm0/OMMSOPLsYX+2LU6UNtOe4sTmTtsR
	FfbXacAgU8YAc8x7YmcPjqDnuvSs5NR1GaTie/yR7V7qrASwt+6CdQS3mfh6JIJhrohgJSoTGufMs
	IIpSg822E8ew5DLg9amcOvsdlSIb9EwUumW15C2kgDDHCKlchfKQez5SrLGyabASuH0W9L7YJFqsV
	sraI7d5GS4dnMV4WGMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuP-00EJUW-SP; Sat, 30 Apr 2022 13:13:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuI-00EJMj-Iu
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:13:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so8431707wmb.4
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYRDXpY3Iw2Mp2L+0vKKbLbTXTTo1snejpw1fL9RgNM=;
 b=U53G3o1zO2TfWVlvRkK8i7XxN1whWKxR20syfYHosot0Pj91VzSi2LEyZqdDh7kfrq
 ESp4RBFRHnhhskiNmRD0FQKf6Rtu9nmKrIFYAqzhmJ8/+4/60Th4hpZyD9Syi36FgMO4
 gROxG2a2Es4t3+lm80t5o+PqPMvWZ0J+jEKDboaBDO8QVWYVmqH7rGMwXwesYGbz9HYf
 Oi5chDxwdMKBkgf+reDZAEeg9+SCarqF6U7DVhUt6lEqCssDu4HlxGgiiJjk/zKAKWeE
 nhIcoJlms6omOF0Z5ScPUvuhmiPG8Lii5VTQC57WigTFac9JUR1kOn6++7lZ4+14BDIW
 zQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYRDXpY3Iw2Mp2L+0vKKbLbTXTTo1snejpw1fL9RgNM=;
 b=Hrn0wOAKyXwqsweKCiYNSKZOFWh+l7OIoiscYCaz2SFafFLofVl0FuC0NytUZ1pCr3
 3Ysx5hPK9nQh9lPvLFnRUvS+6iMan5QrQFcqM9vELoNZPMrnTl2zvQyoHqBdydBor3Sd
 BAk92ow1FPyLyGzlK26ZDEJdzjxxNoz/Ee1x+HBR/f4m0Kmf/GLdpJtN+AXhtqvTpJsm
 ldShlA8mQaCxhZAhHbbYUeUfTUHq7hmGGivkyi68zL/qTDM4q5qkkOQ+0dcnKf+xMQpD
 7vABMK+yo40TMoHY/HK8wpYOOl+4ZI/KmLOGZIoK64KnZwtV1TTNAPdfI/pKKwybBYC/
 NAsw==
X-Gm-Message-State: AOAM532I4SG4Eh52QPZetrvMDJ52gaQcQ7TpHXDD+K0pS2gQcd26C7Ni
 5S3wEnRvZk9Dy6OOySzMdSpmlQ==
X-Google-Smtp-Source: ABdhPJx5TybxW4mPhyRc1B07zUGZnDh+cnuJd20nySqJGiwWmYa+KtUc1qkRi3Adv3YqzZXrvWGq6A==
X-Received: by 2002:a05:600c:19c6:b0:392:926e:5023 with SMTP id
 u6-20020a05600c19c600b00392926e5023mr7558948wmq.110.1651324379745; 
 Sat, 30 Apr 2022 06:12:59 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:12:59 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Date: Sat, 30 Apr 2022 14:09:21 +0100
Message-Id: <20220430130922.3504268-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061306_684798_0F35E00E 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
high-performance DSP and FPGA processor boards and I/O modules.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..1d47a38c2a2e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1197,6 +1197,8 @@ patternProperties:
     description: Summit microelectronics
   "^sunchip,.*":
     description: Shenzhen Sunchip Technology Co., Ltd
+  "^sundance,.*":
+    description: Sundance DSP Inc.
   "^sunplus,.*":
     description: Sunplus Technology Co., Ltd.
   "^SUNW,.*":
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
