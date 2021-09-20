Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FDDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 14:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D72610CE
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 14:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82D72610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mc4ynR/DSmAoKMdqZ7y4NuZ0K4l+W2ROAtakKHTdzy4=; b=jXfu6dsDB6l0tY
	vOaYAOZlYeYfcT6wA0V95i4u1PHnYPP2TVCp7eCSPzTxZhzldgEeM5i2a4PtoXJVdkFnzIgqYMOf+
	p8/XKFzEonOJADVgsuPZxI/1TsqGowB0u0S2MQGM8YKHEwCjdHgxQJ1I1l8BUBv2Ylxercz/jZYRH
	UtP8FKKkkgAkF3tKkJa9mkR3BYfRhKvwrRF0bUpUY1MIzXUvCi/afgTi3DydCOPt3LyMPbj2CtcrX
	4tEqhQgg/xY4b7g24555x++13GM7n+M7ofl+rpoEVFXdYZpy7AnG4Bd1BlAoUK25Ie00WI0HU663g
	eNje8jjyow9TbKp4ApVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKcR-0022c0-Km; Mon, 20 Sep 2021 14:50:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKcO-0022aK-85
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 14:50:05 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C222A3FE05
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632149400;
 bh=liJ7TqCiRENzp4AeNTdqrwOrt003yN4WGkD8VAmir74=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=VtXGmrVSPU0gNXtuBRXm3WnzkGyN8XsPDN+2QgO1iqUY73aviaO6Oxb7SUjIJFkB2
 CIwvRUNvlwWszVg6GcCaeHAXxfcJD6Plf+NX3qtdf+91LrQ88WKzGf/jKgfrN5+hBJ
 7mcyc6Nzmn8v4DHLlljOoim6EDAcMk7hGX39dSqFmcppXsEcl87LdcGl/Aor0jQyMC
 laXc8M9Z94jLVOcSDvZ/ic34U44SnRsJFsoN513sDEkAIXOh3CQo4QUZi5ZbbTtmDk
 uyWdC9QL2frMFqqFpPY2cv3wvTNTg9S/iAxNbXPRf1bK3C51AAv++mqBbLoNGjYts+
 TYqH4JsOhGOMg==
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1263154wrg.1
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 07:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liJ7TqCiRENzp4AeNTdqrwOrt003yN4WGkD8VAmir74=;
 b=Bmvxe8RKGQgFx85Z2bl4WdAOk4tPyoqbHsDnAhkCM8g9zaTykaXkFx0IGiDekItS0J
 0zEeYenyfrEhNjXbj4SWR6LBqU/vWzeRWguOYhEwL9UDsbBZ+cYuDRVybYb4PPGvW2XD
 JoJqWPICUPBh3Llae5l3z0IMhlQ1+oCfJsbpWFHReYQD2BcG2pIGpZ+K1bMU7Mf20usp
 olYXFCeLy0jZM8aWwyoZ7pnc3k4R7vSdx/I0ECsBW52Hx+eFOBa3ZBmBT30FhQsw5SaD
 YnjWFrFOk1O6Llk1Mon8S7Y+LsvmPujQpXy3Cr/fMw5Byp4b3WpS0RqKoJmRj43kpgEX
 AFCA==
X-Gm-Message-State: AOAM531VgcpmAp5t8E+KqCbT4Ugo29xLWxumxiDR5AC12AtOGjG1c3W6
 XHrEdWwYpFC/pjPEl/BZfremG0oA79Y4fyHoNIXPvcyGWeRR7gQ7K3U1U1NwFJ6wPgJnQI21eky
 ox5tRLeChuTzkw6b7RlqMITTp3q5fQZrFQbmEGh5tK163/g==
X-Received: by 2002:a05:6000:c3:: with SMTP id
 q3mr28794218wrx.361.1632149399914; 
 Mon, 20 Sep 2021 07:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuV1/6C76PaS4ktI3Po8CjUMuAt+4cyKsUSOnJVyV0IOE5VYTpW96BNfhMsoz/jqg1evXxzg==
X-Received: by 2002:a05:6000:c3:: with SMTP id
 q3mr28794197wrx.361.1632149399765; 
 Mon, 20 Sep 2021 07:49:59 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g131sm14752780wme.22.2021.09.20.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:49:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
Date: Mon, 20 Sep 2021 16:49:44 +0200
Message-Id: <20210920144944.162431-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_075004_605078_9E7EDF7A 
X-CRM114-Status: UNSURE (   9.89  )
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

The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
provider so add respective reset-cells property to fix:

  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
    '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/clock/sifive/fu740-prci.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml b/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
index e17143cac316..252085a0cf65 100644
--- a/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
+++ b/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
@@ -42,6 +42,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  "#reset-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -57,4 +60,5 @@ examples:
       reg = <0x10000000 0x1000>;
       clocks = <&hfclk>, <&rtcclk>;
       #clock-cells = <1>;
+      #reset-cells = <1>;
     };
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
