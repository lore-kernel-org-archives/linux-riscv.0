Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC73C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtM71VNYb/N7RfP18VT93fRLHjvbfWSy3Ehcdd3l4ec=; b=2J3qH/7dz1TA7u
	nbbZGjUXedWB5pV9nA+Z/mgsFr6rCLbki6kHKliRzRz0liM9ZbzD1yO9k9IY8HKP1IUBeyscaY4G2
	bsfFiLbSG+hRMZYxdqEGaF2ECSh274P5S/I9UXCZKFk1/uvr/bj2QN30IG/X1Gs14EjPTj8hg4vLq
	4qqEQNWvSQqcztirNBF+sesppgtaVoP4rQ7zPPXTOWQ9KGlhKtTMq6qU5/lUkjAz8a7wtXOCAVui9
	HsCLGI7ajUhPe9g61LkfT8fIuN2JaUnDbH7QWa9qbCXCvdVIgq2kmCN25uUQri2DJdTTqrfSomV8e
	EFC/y4se8pCRHRFLNnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVFM9-002O1Z-8e; Fri, 18 Mar 2022 16:21:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVFM6-002Nxc-0K
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 16:21:35 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E7B93F211
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647620486;
 bh=2W0HN5RRkNZ3VABX+Cwv7ixmrYLder+VG35wSKi/d+A=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nH0HR9aJrCmvmMX5Ho9jW/f4aTPPR+eZiQ1dglYZpsYMpaEThGfjoYpaTN6kGq1fp
 pe7rxJbovYZYqkWNlcdQTCtNBumEklOnhtbbfYZIcZR5aj4uvHlUDxtIHa7TSDvF4L
 Oz7LqoHmYdmJtsHZ7BWWKbGdAhzRuKBnDd+buYLjygMGarfV2VltO4NpfLD9VKbRqa
 nS1ixRVPLs2Z6CNjkFOMQZMT8FClTPjDTE0joOK9RyQCAPoEF8XHKo+jQjfBgm89x8
 q37mYSPaFa/I9kgEfOaxUkXuTvGOKUYFNuNaYRy2go+iLOrVX9eDD+7t62xkUDNn7o
 5Rg9CRFqpNDTA==
Received: by mail-lj1-f197.google.com with SMTP id
 20-20020a05651c009400b002462f08f8d2so3610397ljq.2
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2W0HN5RRkNZ3VABX+Cwv7ixmrYLder+VG35wSKi/d+A=;
 b=eyu4W2o4wrNucBelEj2xAmIo0j9Ek1k9YOktqtHtl4fW71qH+OIqCAUqK1fGJA53w9
 M8xGvlcOu0+PX0dQCDrMUvwnZnM7Odt+vcxf900tm2BnP4quFu6bZfqyqMsMZJATS0ga
 aADRtRFasg36poZqQx9kps9rOQQ6IukZRKOGJAe7dLl/KCHJ5INR2olTIa6GM3ItD1F/
 T3f9WhHiNRGyyqeaURGVAf0SPWG1jGokawIu/uDyhJd7JiZQJq9bpHvFjcP1aEs0Qv15
 LrnQjtpJOrUNzKmLhiNJ+ZTBTIxEfpbW1pi5E8oh8YlD1hvQ8Qi3K5WBYMb3RPe43wgG
 9Gjg==
X-Gm-Message-State: AOAM533mnh27WHktprk8RgIi9aVuKp5kiJ75rLATTL0dC9G4I3lX1v2R
 lel1HzEaM7W/6LokaLaZrx/0iTMUSZzHACfibfyLkpAEyUWc0tkb8+fAyBXe1GFZ2rhhCqid6wF
 s/dLm3x2QTZNH03uMv5QzAV5jejXMLEA+l6T/nbbZXkYR2g==
X-Received: by 2002:ac2:44a5:0:b0:448:27fb:f11b with SMTP id
 c5-20020ac244a5000000b0044827fbf11bmr6761057lfm.72.1647620485593; 
 Fri, 18 Mar 2022 09:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxYnFRtdU22BR20+/ugHHxzULrSzy0BJHNZ4eqdyKUJs4Bzk00wOL775ew90uRhXAX1YOExQ==
X-Received: by 2002:ac2:44a5:0:b0:448:27fb:f11b with SMTP id
 c5-20020ac244a5000000b0044827fbf11bmr6761036lfm.72.1647620485407; 
 Fri, 18 Mar 2022 09:21:25 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h5-20020a197005000000b00448287d1275sm906913lfc.298.2022.03.18.09.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 09:21:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Palmer Debbelt <palmer@sifive.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] riscv: dts: sifive: fu540-c000: align dma node name with
 dtschema
Date: Fri, 18 Mar 2022 17:20:44 +0100
Message-Id: <20220318162044.169350-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
References: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_092134_310157_C66CA6C8 
X-CRM114-Status: GOOD (  11.78  )
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

Fixes dtbs_check warnings like:

  dma@3000000: $nodename:0: 'dma@3000000' does not match '^dma-controller(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 3eef52b1a59b..fd93fdadd28c 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -167,7 +167,7 @@ uart0: serial@10010000 {
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
-		dma: dma@3000000 {
+		dma: dma-controller@3000000 {
 			compatible = "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
