Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BD5C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:03:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 384E360FE6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 384E360FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ShbCpGPQlsDjE9hkwzbZxDkBEA08lLFP0DVMp7HQc4=; b=St+7pLeQ5FxsEx
	vP8o6hn4ms5vVI2+oesWqYPum+uiv1vSG/PizVLyLavzTt3UOwD2wC8YgzxSvAZQL0ae4/UTTguGd
	6DFKThHmkiyyZAP82Fvqjsk7jW2kwEBnORUJcR2DPOTNa3j9BOIcioFpZs/+vF/v9Ik5NdwDKBJqB
	YWhDkfM5/Rjn4BFtnr0y5zY4OB2rVhuBf6vZc9VrKhAYMZTHFw6pwfidhEocflbOkeZb4zzFPKM60
	ZI6dSEkypS//ZOz+7PEdxV8iflmJaFfY/fJXyIgrb3U5XdABvIa9DAkMnvmwl6ZmedT8pCDUuaMqw
	LsWpOLBsynvLPkapffRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlRH-0092N2-GA; Thu, 19 Aug 2021 17:02:47 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO0-0091Ak-Gy
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 16:59:34 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E09B3411CB
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392357;
 bh=odiP8qNzCjQyM5ut6+4pfn5opT3C8BN5X2IXeYZ+uMg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=qUxHeUdfUp1mJk1cY4Q5crjWDI4pI8nrCrlS3qw3oTeJkyKKwUd127M1HStyo4n3F
 GHmKK+HOm1d7wgqSpCyTCvroLyyr7jL7oyTBSAPk6VHye0tjO8x+LZ4DsG5Mh6/p5t
 9ANMCucPAPk5svp9GxU0FenmoYDkGtXTf4cnLxuPuACopclM7BAKDwhvx+JFdkIwr+
 70V+q6lHxWJJXNm45muB1SyLbX+GF+senolPJcaCswbMNPFE6bQlA2f2H39JkbTRrk
 Td+2z77MUYYVXzsnOT/ANl23RVPB0bJ090VdEo4ezQWEEosauUl9n1wOAFxQ+rtFlQ
 Go3UfKf2iqeKg==
Received: by mail-ej1-f71.google.com with SMTP id
 ne21-20020a1709077b95b029057eb61c6fdfso2485415ejc.22
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odiP8qNzCjQyM5ut6+4pfn5opT3C8BN5X2IXeYZ+uMg=;
 b=FzvOfFkWyqHTlqAN8ei3tHI0rRuQClCPZ4OdFvF+QsT6DGEnjDW5bERuwI/My+OrFa
 DT4GmFDoZuKv51PDczFK60koTlXz4Rlo4noGpYz60DauToadz/YjHc8pGDkvQn3qex66
 Yw0TyOWopyDUvEw2Ei+PgxJjmdair6xdtvqZi4dmZ/0nKD1Nz2tlJ4ZZ6BVbwm46nAdE
 awko0/Sa+TIayvRx9cmn8GyKS4VYFGRAhwnFYn2Gyk5SUp5NTKDQEgBRtAmu3i/cCTFd
 fa0zzL011Y2qJAXPPqghw8Y1pK71VuzbJTwTRPyHl0xiffhTiTqYa/lHEQru9FKE2Eiv
 FmQA==
X-Gm-Message-State: AOAM533t37AbBDxboEBoX+yQeZQ+JkfXnH2Xfst+PLzywYJofQdyLG9m
 dQ/PECc3AUu9/VuR9wTT2XZyi5l07iAX8uYUnJvjN5E2sOt5mDJRk6fIFW6o87Idu6PDztq9twI
 F3I1C4C04nW9XHAK2he2OeEuBydfTl2qqKLUD+N/qKLRHyg==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr17338232eds.304.1629392357567; 
 Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9NLI19XYdziHhF/9RoSTCqYZEy4vkbe0t27FhZYRkfyGlpzr7xF3AO+fMykRg6cWcoCzMyA==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr17338204eds.304.1629392357351; 
 Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/5] dt-bindings: mtd: jedec,spi-nor: document issi,is25wp256
Date: Thu, 19 Aug 2021 18:59:04 +0200
Message-Id: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095924_792633_E8DB0C81 
X-CRM114-Status: GOOD (  10.38  )
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

Document bindings for the issi,is25wp256 SPI NOR flash.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..0db64ac7dc33 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -33,6 +33,7 @@ properties:
       - items:
           - enum:
               - issi,is25lp016d
+              - issi,is25wp256
               - micron,mt25qu02g
               - mxicy,mx25r1635f
               - mxicy,mx25u6435f
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
