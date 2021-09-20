Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90652C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5776E606A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5776E606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUKUVHBtNYnOqhUKwEluM1Ue/X0/DK4kcAYObRh2pQQ=; b=Pwn5wA1+EsHI5l
	YdwLppdAaeUD3w2Q/lTsrtOeBsI+0rtvE/O11ziSaGyqGIvqGs0OGCwwASw20+DXSshGIh3iYg8bt
	7TSN/PNimHSVfvNAfRlMxsuNVa74ndGvwijiEmW+UZ60hgAgyVWMLx/VgXY9/osTB0ZZcrCy6zL0n
	rqfxCRMjbgMeRYEVqaGqpp724Uk/BL73Q5KwsGpFpBrCo8GpnrwLOMA/zCRAJHVykAD0rbvaw7ZSN
	B00ioT8+iMeyE4aswwENZswnHMOHmipBZsvcfD2d+CRnTaWN9VXdJA5FP/4IK/MBCikk8/72IcaL2
	kjcF/mwHGHVbXQbp8S3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKvw-0029ou-2o; Mon, 20 Sep 2021 15:10:16 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKvl-0029kB-3R
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 15:10:06 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D733240197
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632150603;
 bh=xU11jaLpUDnoKTVDhNl4Nnz5+4KkmeAKnf0UgxOYDK0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jDqtzdfjvI8+2jZzyB54FKMBknPb+GMEs19nyvOP4V4lfloVG9chA9Bh8VbB0KAEb
 UjbYUEsBWnu3NhuprcREA8hkweFl2hhlH2svygQO3AwCHHUMGQLrBtPDAyWeF1F855
 jEKfzyZUTQ/dGKwDK6jPZvZHdePs3uBjBjrpHp7uRz7oS3mjJ99dSohHgAgYfO5RDO
 dZNqFCOBP8VQAMLrCAfWyiS4oPZV7JD8UNtuDp1iLceAByGuNcUksZ7ushXwP0VVSe
 +oOYR1WKzD/G/1AoMYQV7WDS88D8d8MnRrU2CjUb3ON8EMcAfYudqG5LYsUS87JtEe
 /GNj0jUsXPkbA==
Received: by mail-wr1-f71.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso6348095wra.23
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xU11jaLpUDnoKTVDhNl4Nnz5+4KkmeAKnf0UgxOYDK0=;
 b=Jf4HN3X138Yxd0L51axF/Ted9I50XXpGofSwY7oSfcmx6BoVPJdgzWxNO09fioVFBS
 VLEMafI5+L+IeADCpf1+BA10MdCHw36KEK9pZV7vgX9Pj7w0sFT+DH/5XmsO1qA/zLO7
 fqU9jxtOtdGH0W5OVupBkoxanetvB8SxHE/6dDnWKr1T6a3veZIh+96EaIdEuMzjFJS8
 /uKFLzNEqOEFExodN0cTwf9K/rCjmrGM52gXAaMp7sZK3y95dccc1BI1LTXBMFtcDltG
 haYcVRCUjnJXYBp7pLCWv74Gn246yPsvG+RdIYmkMSAIQ81neEOpIdqpzme6rP/d2IQp
 R46Q==
X-Gm-Message-State: AOAM532C6sE8PvnItUvB1usbEjDDbMd6pLylbq0xJ2jIbIppHzdhH/0L
 oEuiQOQhajrlH+iYG1M/+FrbpSPuqIW/Z9Q2B14br0zkTkAMphx8mkUKUqPPexTd1RnFu6DDRSb
 PrctbhFUPQDKglzpZ6YsKjeAMW/5CaxzUYDAyskaCappKBA==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr30067245wrm.49.1632150603565; 
 Mon, 20 Sep 2021 08:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBBPH6zennF6+WXOjRYxYRZdYGj6tYy+clID7FjBpMnrSmFriKiZD1slG3/cFHjNMZVecHAA==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr30067220wrm.49.1632150603368; 
 Mon, 20 Sep 2021 08:10:03 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i2sm15803136wrq.78.2021.09.20.08.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:09:54 -0700 (PDT)
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
Subject: [PATCH v3 6/6] riscv: dts: microchip: use vendor compatible for
 Cadence SD4HC
Date: Mon, 20 Sep 2021 17:08:07 +0200
Message-Id: <20210920150807.164673-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_081005_330118_B98A509A 
X-CRM114-Status: GOOD (  12.72  )
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

Licensed IP blocks should have their own vendor compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 55d86b078c53..7948c4249de5 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -263,7 +263,7 @@ serial3: serial@20104000 {
 		};
 
 		mmc: mmc@20008000 {
-			compatible = "cdns,sd4hc";
+			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
