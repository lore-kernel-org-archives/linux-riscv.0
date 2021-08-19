Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3467DC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F101060FE6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F101060FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLpFx+In48MlxeFR20M8t9j7s+OCap36eiezsEou7SI=; b=z0j439xPB+exft
	Eh4rQv/szSHzEgDa/+Lxh3J4Tx+V/XGRLcTVQ726gmrHSQloEvZm5+eCpHe3cB4bJwsgPahot+mvo
	fhilTou1WHHkQ8hJ4HUtlyN0ijYuFU4F7OOoFV8f2RbK+iI49h1PTaRkIN90gB62HGRv2GknLQNXx
	R2af0hZCy5gAVe4FwHeRe7lVFMnI7t73BROpfGJWUV/T7i9GegThEnFkMWUDrvWepXhN4K9zH+9nY
	q2A9+A7vLRHiNgR1eui/aB5/e+IYsubh/cO6/bqYTuQdSuBKykPGyoNBa5M+gacmRQd3SVDT4lKoa
	QwATzprHqe/HbDnKWM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkEe-008qyS-7i; Thu, 19 Aug 2021 15:45:40 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkEQ-008qsb-SX
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 15:45:33 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id ACED540CCC
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629387925;
 bh=8A01Ti4iWFCly0K7Cu7pOp84vfobY1MUZZvBkKJ35Ik=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=pYLYrZUpqwJqpFdhVmug8yPxw9y6G8FR72yA5faNq1VnPSvYDtlrJSsCmnpR7yC+Z
 eII3Pk2/YDga/EaogRD9SrarfudPbiIPGlQyPvVTwyWNHeImp0CuByhfeAO+IhRN2N
 Umt9elLMFlRVxGEf+kxdhEgqoxhU3WBmUSyP3vBQA+7Pepn5H2svU9CvFL91iP2Fu2
 fNKuM4e2h+hJgIqRrtj5KNLAPbHZp58oBRCMVY7LVyXTX4heXZtdqnmuQI4zVId9Qa
 w3C1KPy0D8Vn1Aox2N1iURLcfezl9QQ9AS8/oAoLPGgt1U00P+dqo5zKeC475hyoSD
 CcJGYiLjgaNag==
Received: by mail-ej1-f70.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so2404148ejt.14
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 08:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8A01Ti4iWFCly0K7Cu7pOp84vfobY1MUZZvBkKJ35Ik=;
 b=Fz6LgG/pNdIpZl/F1mV9eg/U2oBWiBlGEMJn7amLj6JEEAOeQS+h3zQmsN45Hl+HYX
 vdBkmzQKLFg3UluepL2bTgvxlZDXw3DuHEQu8A7JtxBnGdGus3S3C1tEXu/0+tTterTc
 1D4MCLJ3qPOP1AjN/Tf5VOx43fIPJcRS+FKCbtPiyqtNomS66ulyvsDzVicOqB5mDE9G
 BzXnEClruRXnYgB2mlbIM1kvkS7eA6JGNwkX7Ip5HiEoiQ9wRI5r4qkU6hVaNxUrGjEN
 ShAaLG/fAxobeh+QeMP7ZgWMgrZjEFENkrEwBqqQszv4J+cBrhCIvIwinj1rplqYtN5R
 QikA==
X-Gm-Message-State: AOAM532DJ1DLZu9f6+vJaFPfP+hKSuz9Rz28tYHrdp6KHGrslCCR7TKI
 M11U+6Ww+LidajGm+7jJ+7J3PM4Sf4hOWEhebDLp+9eZhLwVoPArolPyPufMmWyzD7bpexJpMFs
 bSAf6DsRJ5noIbIHMWWrza6rkDxn/yz+hhdhU534xtJdUFw==
X-Received: by 2002:a17:906:7b53:: with SMTP id
 n19mr16394830ejo.14.1629387925473; 
 Thu, 19 Aug 2021 08:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzop3xk9uOpzYONSS6eh+yJG5Jh6O2SpXAk8eo8bL4yAUYTFJUcq4vRwvvEVjARPWSfETkepw==
X-Received: by 2002:a17:906:7b53:: with SMTP id
 n19mr16394819ejo.14.1629387925347; 
 Thu, 19 Aug 2021 08:45:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f16sm1925373edw.79.2021.08.19.08.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:45:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 6/6] riscv: microchip: mpfs: drop unused pinctrl-names
Date: Thu, 19 Aug 2021 17:44:36 +0200
Message-Id: <20210819154436.117798-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084527_102936_A8AFD085 
X-CRM114-Status: GOOD (  11.70  )
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

pinctrl-names without pinctrl-0 does not have any sense:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c4ccd7e4d3eb..d9f7ee747d0d 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -267,7 +267,6 @@ mmc: mmc@20008000 {
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>;
-			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
 			bus-width = <4>;
 			max-frequency = <200000000>;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
