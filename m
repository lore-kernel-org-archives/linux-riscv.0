Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27267C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF443606A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF443606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUSKN7WY0x+clqkKcae7+enx96CWHZTVi0kFjTtJT+4=; b=3dTesst5W48bEy
	QnjG+ZOTWk24DNaCpDbtn8/UzhEPgHf3fxaTxbBv+0YOd29RM0EXp5xx06h6pegchklZHhwLfJhdG
	c8R7m/5LHmjA7bKQMQFY8x2LHC9KJnS/0e8GyL2p1cgonSYAgf46qFSfoLb0+gs8sDe2Nn8Yj2jeX
	pMOVDGr14Xciso/7kMCRXH63o0Y7EuyHiwqNbV+HTWlxGX/mvUmnmlW1OiT8NrsTNlqhkfGPuxwei
	NIwNfPvX8TGUdUehJo4hYtWk8yewzEmgHdDq9G2FkGvB4aH7N7xxe5TjMbZr/Vsw1OdxW4fl4XL7l
	zKCJCK6oSn4pKcnXnbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKvt-0029nt-LT; Mon, 20 Sep 2021 15:10:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKva-0029ew-0V
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 15:09:55 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BC16640261
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632150592;
 bh=zUv3tXHbbUqWbaVvQkKggzK/iHQTdWabfc1NCBtXKt8=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WUx+n0rTL1ND8eemSxyqF+F6WAqsNjGe6ANMG/wlSCu0rnm4EtFrpF4R58yJG0uMy
 ekB9bU4AIQwysB8Pg0vcjYVlJeqQSQb4M1Sn4BZhzQFZLty1ippUI+N1KUczyEngaV
 q4+Y7pwW+MamAh0PRfOyNjKNbxVIBFEBJzNjhJ8SS57jhjchB8SoagfkszTgecNpFe
 /CTH3akQBCOptJfP4enmXCRSF8hGUJiNUw6jyYoYUNNX2L6LgO4ehap8b/bNNFagnb
 H71nbO8igm4EQ3Qa2xI8Sw+F13roCsROX5YiY79N9sQiRPa/fUGjZt6Q2EIrnJY0K4
 xHmLrS3+xPe1w==
Received: by mail-wr1-f69.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so6349955wrt.21
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 08:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zUv3tXHbbUqWbaVvQkKggzK/iHQTdWabfc1NCBtXKt8=;
 b=NLFEmTtkt55dJ7yO0Rqc1+JY/VqEr8rZypkAcPsJSn244MsqBpLfC8bGLHO9tD52c2
 OdUUXK+dO7ruaLBoJ4vgpZHJnmdq5juOJfNHmQIE2vrGbiIyZ/NXNwtSl8nmVTTwFJYJ
 RFk5PWN/TbeGkBdOsvlU/pKx+lD/YM3FvSB/fUaKopJ/+En+XbDD6X2YT1C4+zNRWmNh
 15CcJoxbP1k39jojwLUvPDBFrCZhzWwlbyXKiPL9tu8A3vcbHsmgjSQa8qhHFupEcAbJ
 5Y/Bn2U8iRT5aFFTn5+FHH6+pZ1OgVkgQBIUqCvQ3pKVu9nIKVvErwCi0nAIT90ihiWQ
 vzRQ==
X-Gm-Message-State: AOAM533IMA0415aq5TKZPnziD5w40h4WWmHeNDZIglbDct6M90mLPAb1
 SSc8C4QlanoyaiyCMmQbtHrFpHjUs4+AEZlalXSVqbx/pkwK9nZ30mpy9h8BmbmOwosxVULKb7+
 wXoRnzbaxVG0XLUK5ZrRw5QANHNQGdL4OMeZh77ZdjVxoJA==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr23908191wmh.125.1632150592342; 
 Mon, 20 Sep 2021 08:09:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4go/KWD2wwvaGed5Gp8/j8w76ab4Sbq/2+KvZVoBShQAqdwysUAi7NfERcQWEBk3pzLlFbw==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr23908169wmh.125.1632150592140; 
 Mon, 20 Sep 2021 08:09:52 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i2sm15803136wrq.78.2021.09.20.08.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:09:41 -0700 (PDT)
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
Subject: [PATCH v3 5/6] riscv: dts: microchip: drop unused pinctrl-names
Date: Mon, 20 Sep 2021 17:08:06 +0200
Message-Id: <20210920150807.164673-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_080954_218956_55597FEE 
X-CRM114-Status: GOOD (  11.46  )
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

---

Changes since v2:
1. Drop some patch garbage from rebase, pointed by Geert.

Changes since v1:
1. Add review.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 83bc14860960..55d86b078c53 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -267,7 +267,6 @@ mmc: mmc@20008000 {
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>;
-			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
 			max-frequency = <200000000>;
 			status = "disabled";
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
