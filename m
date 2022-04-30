Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2FDC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAIp5ZKDpu8g4N3FFYvh/kWEfUjszvL9h0cGefZZpgk=; b=uLwcYzP7kMf2nb
	XblZtUJskg2EO7qntrZFCojpwn+Kc9tSNI9E7B9stDAsOqpUxxZnHqkdRSYyK2druP7wC6TTKNriB
	DylQY/c8ufdOH8aOftrBQsq2u5hzTlQdo8MtSIEDiTGlMvTBQe/cAuDIO+LBFPMANCxsN6M9Q4+iS
	yTqpvmYHmCt6xQp+l4yUrCwnjgKOqtgLHThBFUxjkWhlotgqORg/bdZ0u5U0PjKx8ifTgXVROIVEF
	3w+TxGgwr6cBigbBfqWztZ9dUOJplfLvWnc6r4SVWXciGRW5/onj5U7ExXk4+Lqf16VIzXIk7pBk+
	yxyZNd89qR5/tf28d1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuO-00EJTF-0i; Sat, 30 Apr 2022 13:13:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuH-00EJN2-MG
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:13:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id p189so5984105wmp.3
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Ldjvg75trqwAdnOnSC1cbShnEwGZkL07QizR47KBI0=;
 b=3Q+LcRPAJonoG2Ba2IxaBDslynUXIxTEvrqhBNEZ6i7dnqdnblFID6Zx9ksmZECEzN
 6lgj+D8WLHntXq2O9lJEtYI+n4tZCtCLw/Yv1Qqp6Vl5gvjfZ72Ik5yrqvbiOljGS9b7
 Udt4fiet896JrQqswR/A3qdJwJYLFKwdVag0aQO/Wkqitfepz+snW3V1c7k7csLx2kQb
 cARJOxDJn7s6/G9pqRpmJRbzI2DB3YcTz5VVyJggtk5+BbPeWjIbK+VaSaY+yOTXauUL
 UuebwGCM8gPg1UZp4G/s+86pJzcs4PH0Vad9UZOQWHXL+m35eqzIke3O+K7trCfvqj8p
 XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Ldjvg75trqwAdnOnSC1cbShnEwGZkL07QizR47KBI0=;
 b=dUj99IbZhMCfwJJSxWIX9207i3SbL1GTvAZVIHWSVpQqT88XEqUGXAaGBHSluDM8E5
 3iM/SngdLqkR649RTnLyx+bZ36jChSUPWBjpREnb3rkl2Q+y7taPXQyozNcTQbea4gPA
 GtFVavLAshFsmPYc8Hb3TJxLuFhAlfpNpQ21jTmW4b3KsBYf7VrwTIiupCBRr6ZJmT5O
 4+QnTAKpMJnO1zvH8AwGYZafY/ViU/6xVeZpe248R/OGD5seoXfpVCRr2N4yFlr83PqE
 k7rIlJM5yzA6GD4UwsGlwx0CY0NVFmkj6uzHoA+n/FuVigIHeqh9uAXWFDBal/hLGtAx
 RpNw==
X-Gm-Message-State: AOAM5325pNxQm+9dVuHtc1Q7OsyjLU2X35Ugvje/sZO0dyYwbdyOF/JD
 Uysm4JwTyfiKyxXNhOh4Nbp4RQ==
X-Google-Smtp-Source: ABdhPJwCuW2uPEbg66rIDyyS+5v2XYGjunNR1Scwt3xYvOnicye2eTMHVsC/c2tFquBud2iD8rYJ9g==
X-Received: by 2002:a05:600c:198f:b0:392:9120:c6ee with SMTP id
 t15-20020a05600c198f00b003929120c6eemr7704932wmq.18.1651324380909; 
 Sat, 30 Apr 2022 06:13:00 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:13:00 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 7/8] dt-bindings: riscv: microchip: add polarberry
 compatible string
Date: Sat, 30 Apr 2022 14:09:22 +0100
Message-Id: <20220430130922.3504268-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061305_793187_C22E8B85 
X-CRM114-Status: UNSURE (   8.52  )
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

Add a binding for the Sundance Polarberry board.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index c9d8fcc7a69e..7f9296991a56 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - microchip,mpfs-icicle-kit
+              - sundance,polarberry
           - const: microchip,mpfs
       - items:
           - const: microchip,mpfs-icicle-reference-rtlv2203
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
