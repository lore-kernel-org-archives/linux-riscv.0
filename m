Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F102C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F3061052
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55F3061052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MbUhvyhgyB7pD5OMAWqHxEHy4JOzY/6qxvovZ0JWjU=; b=Btq6BU1LbPWKhk
	lpokfC4jqGNa4kozIpFfWtOaCUk3Rd4a/2egXPfJnRI8SH8+zA42RvFp/iE0bS67FJeBlxnIgEaQn
	I/8u8/4ec7J1bcgnqhBUWpk3oznXpGS0WtSV99FPgXuJenJ1RH6rwTYsiO2UMsmJDibYX/bmMCW7M
	k9954IqFrE6HWLtbqli9BYHgoII4tMU47O+ZtkleGTdoDFOQM2ROzS8DPriv7vY163DmIHYTr6Cgu
	OGftQq0L0vtQ4850/sF9uiBBlfVvBbyVk+kQrRjFks7SOs8B6JtSLi5bq398Fre3ItCLAI7mg7dZc
	2BntNn2ggvDkzZ6uk9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUq63-002gYs-K3; Mon, 27 Sep 2021 12:51:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUq5y-002gUj-Gd
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 12:51:00 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 88BA2401A9
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632747050;
 bh=jeMIEXiKB7wPBA3ymi6+lgomz3wpzPFtflbOU3+5glo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=wE0XwH8WPXph9KdF2juApvUxO+UdLhcnPvuQqEi9W4T9w8WJZEtdC4iL6OHkt0X0G
 rGQt3rAQ+1qFdsTHSTkaKmILUyFy1w3grGyxCCL12KUCw+BWOkElAalBtSnGkFgRDf
 62BayEZqbQA7laTQUDgtrNJaUTCIXKHlo+g1zcDTL8gU9XEyVZCoEIDtFS1m+fgFS1
 a8EkcCQeuQWv9baGN1MxqKBWKPCEogNfAiBX/0XMaW4Gw2DkpNgPDs9Xzm7BroxQth
 pMsegAmg5UI6B0jg1tjruXLw8FMIHcoWlPlLiIY42UHPAaP92kH4RJEAwPB61QxSs0
 5odx2S0nEyJ7A==
Received: by mail-lf1-f70.google.com with SMTP id
 x29-20020ac259dd000000b003f950c726e1so15708140lfn.14
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 05:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeMIEXiKB7wPBA3ymi6+lgomz3wpzPFtflbOU3+5glo=;
 b=P5YUuGgCpK0jg07kYc9l6pMXEP5TAQbduv4u6B099nmdUc+7YpbSUx6s8P7rYKMToM
 x8XbVDD4FMyFSJ+zCOLKa12Eg3J7zfeauhBqNMdFJU2OfuKcrDDeDyhWsb+gmGE3BLHy
 YgCCU1dtiF4nOBbCLNPZaHUv25pZ3pxB8Z9T0Yrr6Io2a63+gQ98z3pVbx+M3I/mpALH
 lu9xDUNuHS8jvknrccaRtbcIBCphNiHQusiSxfgNHF16p0GO6KjK1aKjXibth9nMI666
 biTglO0fHwOJ1zP9ARCZiFIvaRmTbO7IrCOH+8Xi7MiG4rPtiFrws3/ZnG/kiJsO3o2l
 Cj2A==
X-Gm-Message-State: AOAM532CHQLphACfa8IcU/E9+c4nJ+xNyJ+HoBQbDFB6xUosGxnrxJwF
 PZxlw9qUIwejfdDd0I5Tok0ll7ZGvVrsL4cIy8STN+9fHTuEubLioZnPOy8ozo2/gaF6iL51aTU
 iwXTMbDWey67euYDiHYELjNvcKMt0vtreGBbVE3PZXMG8bQ==
X-Received: by 2002:a2e:140d:: with SMTP id u13mr17389337ljd.298.1632747048870; 
 Mon, 27 Sep 2021 05:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4XgRv4NIfqOOqXINjjLOjy/LJUFeE0f5kcR1+muR49/z/9l4mGGfT5izyr31+Z/ahcTOfdA==
X-Received: by 2002:a2e:140d:: with SMTP id u13mr17389319ljd.298.1632747048691; 
 Mon, 27 Sep 2021 05:50:48 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v28sm1592102lfi.22.2021.09.27.05.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:50:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: mmc: cdns: document Microchip MPFS
 MMC/SDHCI controller
Date: Mon, 27 Sep 2021 14:50:39 +0200
Message-Id: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_055058_797292_56495FEB 
X-CRM114-Status: UNSURE (   9.54  )
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

The Microchip PolarFire SoC FPGA DTSI uses Cadence SD/SDIO/eMMC Host
Controller without any additional vendor compatible:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Adjust commit msg.
2. Add tags.

Changes since v2:
1. Document vendor compatible instead of dropping it.
---
 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
index af7442f73881..4207fed62dfe 100644
--- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - microchip,mpfs-sd4hc
           - socionext,uniphier-sd4hc
       - const: cdns,sd4hc
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
