Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A9AC38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwhebaynJD/ZpYQjqj/kT15nZ4+lH5b12BHX3qJnI3I=; b=AZh2xcki9d+pBS
	C2E4J5euQpxbILpHoEhKrCAP6L0KjPA12um+FlmhXG3a77GLU+PC5W+l1PLUpQSx6cQneBMcLLnZv
	kUdixOsHOvRqktkNlc/Ty6goFuFaqzhDphtRYBr7HJUGOqOZJzK+T5v0DJHZ9iZYV+KmFT5JZ92q9
	t4BLpYHuxhjDDBjuKruHyBok2tQvrc+aGt20Yh/vEugKn2RqSrEKJOPZ0+JsgQefdaWrkTLGd45e2
	NqE4yqN2qTI3dQT9DzKikrXNaMZSwH5+zdpVj+8amOK+aJMfYuohna0JKo+O0Qv7Bh4cl/8/FCeI/
	B4uKEB7e3K6j7FN+7ehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzS1-000Smj-19; Mon, 23 Jan 2023 16:13:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzH8-000OgS-1c
	for linux-riscv@bombadil.infradead.org; Mon, 23 Jan 2023 16:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=; b=JTOM7PDgKpOSf9pWrw7wo4ZUon
	C7PEOjNc55nP+7KbZpYhXNoNKz0sUadrrWYk/DtJ6XoN9PzQ/PIhlYR7iULLNsIIQ+k8CHxXHeWFH
	UCbf5HRBJchgs5387Bpg34i5dr6S+IX90YH54xDr5NsDZ6l8iq5FUCEkYdS50CziOpF+Z+xs8qVqo
	CxI44wMPK38IfN6l68yCvmf6N8QC+Q/+4BOPwN2BbfeCMKDLaF5s76yyiLGXj5uUzvWUrDJ8tDSy1
	v4C9olOUisiZVoVex94JYu2HFmaiaF2QFZEk9+4xDcdh8PjnGuJz+Lnrbk9XlyA/7Bby2biIFxfb5
	sJafyChQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyVG-001ZBu-28
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jan 2023 15:13:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id y1so6622848wru.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=rI16xsFZkU0eDWMTKFE0Ksxp73pnRnnVBuMI8tFbs3EAC+MtLCqM+X8v/vyycGcC5O
         USAChlzuDrcJtFWE5zuLInbgnGCpGbxV8/dQRqPYk53NiBrGIVppJYgEQ2zfRv7+YKSa
         YgXA+r7Uufexm6x2hExkt/4SgVNyVq8GFmMZhbUftDEvVH7LmMktBcLLpFBqx5/chHt2
         TeE20n5vBOYzlQtPwurLAxPiVEG5XNohtEKAMDt/NqKy4AnRpg/zhqZY49jckFfZ1deg
         CtvZBVIzioBWs9VynvZ2UYazAhmLq1ctmNt+zbnVQ5BlNz377YWULvNPKig7igJrEKyo
         vs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=oz+XzJc/Wcqjb1fPYpc2b36z2W6bkbQHjVzzLmvF88csDKJaGIGu3ufwF0qR7mUA+1
         xRxwo3WL3mHojU599cDayae5hGLZGdFkOhRBN3c83pg7fM6ZgySnqEGBjfZolWoqStg+
         SxXoNfZmuXCFZ/CMX0vy89z2Zc18WyCpWo9OWYG8eVczDxguChFzFIoaC41CpSmOKafd
         lZBxiDyfP4tDiwS1CcOC8ROFbbHG8SHp/tZbyCIimXogrjX4WL+krCwQYAaidBZ8WuET
         S6XeuTmpIP4b4V4WlW0OwBpGrStMXfYwCSSYLIBwbxcZWJMFy/VqNv+aAj+avgrRvkmp
         oERw==
X-Gm-Message-State: AFqh2kpKSNNTyTmD5YlPsIRotv9V9rrrGRxdPScA6apXy6cYrink/c8B
	VKUw8PML61/T/Jx5dwuon6SRXg==
X-Google-Smtp-Source: AMrXdXt0/G7OJJgG09MWKAInBglkrtPYNcF28o6o5Fy6XNeVCLITjCuzgG4Lr6rNnIfwWhChDqTogg==
X-Received: by 2002:a05:6000:3c2:b0:2bd:d45c:3929 with SMTP id b2-20020a05600003c200b002bdd45c3929mr23730627wrg.54.1674486807943;
        Mon, 23 Jan 2023 07:13:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: drop rs485 properties
Date: Mon, 23 Jan 2023 16:12:57 +0100
Message-Id: <20230123151302.368277-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151258_872856_E4E0D00E 
X-CRM114-Status: UNSURE (   8.29  )
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

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 74f75f669e77..b1e81a6451a6 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -64,9 +64,6 @@ properties:
       - const: rx
       - const: tx
 
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-
 required:
   - compatible
   - reg
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
