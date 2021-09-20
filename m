Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE071C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06B5606A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A06B5606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kul8InCeKXXaDHTev+M53t0Kp1UCli5RYmZkREcPX/0=; b=YR9zg9+bdrcGJe
	4WX5KVeMVg0ZwkzGBtg4GmvPFCn/eW0vhl4OI+zvgljyyJN1HgRQSeeJipjVOtzVo3YsUrLLG+hpE
	tvMZzpgxol8W70pJaMktpT/89osVcHd/xo/J/tppk7sEXfQA9xKdoiWu9N3FeF5Xnr3UYyDHIimdr
	P1mv5kSM6geBxfzAsN/46ep68vsMLrfEbX6H0E5EiJU8ZEiow+MPPOWZaXzthR3QhR+bEurtQ0Ta/
	Bfzp0DTaL97KJK34zIysb/zraoUBKiXbnKbJFGJZBfLzKlaLniU0Q8xosPVp5ahMiAr4Pl4/jvNJW
	wBV7x8oRLNtssTyerlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKum-0029M5-Gw; Mon, 20 Sep 2021 15:09:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKuj-0029LR-UC
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 15:09:03 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C9B23F226
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632150540;
 bh=RrUHW9qWnN4ubyMN56WONJrQMAnYJXVEP7VdjrUGoI4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=AFOM6TcHjSb05N9wnmVVk1u0W60SnXAKhn8eO5V+/9/e2NPCKMg5XylKOafVa9Lz1
 oqR+Xe/BXXVd2ooH7qnLXYTWmzLssyTv3gtDFLFkW9oDxiqQNKkg8Fj+otyeU3XPA6
 NC8T6/pqJ72uQYXFcqckXpY/yHzswwN5pL0UqXzbP+PCUqTjHzuT8AFAeHiTfjLOC6
 5jjcMMS3wVfDCumkBtLpClI3XA2Sk2yZOBGVYUvgmXRzrlyf+CRwanKxIFoWfCZgbC
 4JxwgZCdoQkaKUcBB3ohPQhB7rulMVndO8KmGLRIuuG6NDoUFk3HUB4WDVb8HJKPvy
 GOW0Q7R1plg4Q==
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so6350930wrn.12
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 08:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrUHW9qWnN4ubyMN56WONJrQMAnYJXVEP7VdjrUGoI4=;
 b=hi33I6vaGV2GQQYQ+UApt84AGiDanStfw7PefK8bQqfp5BrcVRoYOWEuKbtrmqCKDg
 6ZzYlN1WHcAAFCh9r9n8bTunpvUO1dTXqJUZ69JlrBSkJfLdMZZIxropvaV1QHPb5Vt0
 PK2v6cyq2uqMQ3gRATqHVLrN/fwXea5ja3HXWsMUflCUmtp0vDZdv6rGbSR+o3kej9US
 Ax9WE6ugLs5MFEjq1HfxfKeOv4O42JiQzCCBP+m7YlknACOOaFiwx6eNLGSvQFpSKDOB
 cO81I+zPa8INhU8BAdfi00dIfpEVdoaccCEhPlyOxCElMNhirYD+Ddm/ecoONTG40JDT
 Q8tQ==
X-Gm-Message-State: AOAM533OeJa4CkJLnxJYQlUJTEa2IzvUvUR9yJvjAgF7CGk0LaWSQkQT
 9PqxdOeb4NPgB27uTBYt7nfptSCNLFlsH0C5Cg0urNYsG3trgTFRutFydDPXhQBSkemz2PqdoGM
 dG+SE4DQ+FEByIJAOZzqFuGfdhxY0Z+14olxUEUHZ7wS5kw==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr23903303wmh.125.1632150540257; 
 Mon, 20 Sep 2021 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9q96BO6SmIHFGad+uos8pAFJ1J9kCDWwhrXRWKfSkT84ucEy7lcgN0Rquc/RlyJ/PH3RBzA==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr23903276wmh.125.1632150540071; 
 Mon, 20 Sep 2021 08:09:00 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i2sm15803136wrq.78.2021.09.20.08.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:08:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/6] dt-bindings: mmc: cdns: document Microchip MPFS
 MMC/SDHCI controller
Date: Mon, 20 Sep 2021 17:08:02 +0200
Message-Id: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_080902_218743_F41286F8 
X-CRM114-Status: UNSURE (   9.36  )
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

The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
without any additional vendor compatible:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

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
