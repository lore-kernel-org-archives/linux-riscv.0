Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A67BC432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2487760FE6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2487760FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9p2p8dF5z0rw8v+hRudhTn5fKQrZ8XlSV+TvPFSFa0o=; b=Q6E7JY4QXJ27kt
	xt1ri7fcG0ZXXRdOAGlaJKir3sbJjfoUvsC8BqNCol+4A7qvB6PCtrfyeOvLrZB6qtJbio1Xb5d8s
	ClT1+5eE/JPO36RoF1wjpz15c/vvysE2dsn4dG6CTCMTI1gmNBa74+ZliHJInjRrX26wSXzWyonU2
	+tuFEvr0x4zkfgQ1/SyIw7drE8ffz+uu+WS1aMInltdG9rKN5WUPHZsmndJZ/8iR2ez82+kjuJUiX
	K2vEkAn+N8Kg770Kq/X7G37bIhUlkVbYBPnsGDotLUlviNsD22/EuIdOAWK+knewPn8ttbxRFtEDF
	bsynzvcFLHFVVRGUxu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkEW-008qun-7E; Thu, 19 Aug 2021 15:45:32 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkEP-008qqP-3r
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 15:45:29 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id CAF8340CCB
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629387915;
 bh=oQMiOvmPhv/1z2rOKVbJqGE7XkhSX2/8Th51kVa/d5I=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=htBWlaaLdGvz0lxlml1X0CluvdqZon2zJK2DEszSZd8usVuPWLphcSYUz5nULn6Cr
 caG/2Bd58qi+51NOO307um2X+C+uN21A5UN+/GNGUkW8gtUAaHvp4BVIU+YIPUX4Mh
 Qj74/I5o9DBiw0b2l94eCK/Q3KKFJfuNgE2Pk6K+V5G4++on7CcD75VhiibpeJdNeC
 dhv2+PfEZBDFP8yO/Ps5rzDH7lhkX/CJoobeJLNnJd3UJPwqrhmjRfJmr9jsj8pb7w
 lASn3N9Ek2seiAJU3cei78cBUw0tXuglKgS/jeeOABDwu6Yr5lTUPvG7Rx+rwpnpnV
 BC5wQUbcvCBoQ==
Received: by mail-ed1-f69.google.com with SMTP id
 di3-20020a056402318300b003bebf0828a2so3048948edb.8
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 08:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQMiOvmPhv/1z2rOKVbJqGE7XkhSX2/8Th51kVa/d5I=;
 b=sPdtQGdG6xfmNYXYe9LzPeiNSxWvUlUSU6YofqSNvDmnw0C8s2x3vT1HZX9KNXZ9jp
 2c2wDaEpPg83pzbj1LjYbAWp4dVECSZNQmxNEIxAPZY3b2WX66qJmIZDVZDH07hsfV3q
 NuM5W47AUKY4OWWSofngb4B5mYNgXgA0IiawHVZYmd4AK1vzmrJvn4BXIdzXrVoCov+5
 OZxH9LcJa4RL3AGuxG8F/cJbG+PGGseQWIUY2Lysgp4mB38fhjshvqfHxwB8lmOthOpg
 KvMyqq6LHY53pdguhijdgUbfpuS6F7gg54YxjWEfsyUl7uRhPxfAx9j78ph5iHFsw85J
 upJg==
X-Gm-Message-State: AOAM532kqwUldjtzmwfL640oljSjqE8MW8Zb/ozdVPuLzaXRa//bE48h
 ZzisNcf9j0ZtHXaJmzz2uTGSdqE+cgBMvtUQ9rjj5tlsljwRi/8mrJR5/wKgPTAtdx3EhdihkMr
 NwqMbw6msvnNuQy5JR5JOIlOdt3rxb9MotqEEAk+gPnXDww==
X-Received: by 2002:a05:6402:22ab:: with SMTP id
 cx11mr16901477edb.240.1629387915594; 
 Thu, 19 Aug 2021 08:45:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAEWiZz1c1r34QEyTMCWKIodNsdb2JaUuRv2nhyWDs0CmReup5t8cL3kDjjf8lf3M4RXzjlw==
X-Received: by 2002:a05:6402:22ab:: with SMTP id
 cx11mr16901463edb.240.1629387915485; 
 Thu, 19 Aug 2021 08:45:15 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f16sm1925373edw.79.2021.08.19.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:45:15 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: riscv: correct e51 and u54-mc CPU bindings
Date: Thu, 19 Aug 2021 17:44:31 +0200
Message-Id: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084525_340968_B0923C02 
X-CRM114-Status: GOOD (  11.77  )
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

All existing boards with sifive,e51 and sifive,u54-mc use it on top of
sifive,rocket0 compatible:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: cpu@0: compatible: 'oneOf' conditional failed, one must be fixed:
    ['sifive,e51', 'sifive,rocket0', 'riscv'] is too long
    Additional items are not allowed ('riscv' was unexpected)
    Additional items are not allowed ('sifive,rocket0', 'riscv' were unexpected)
    'riscv' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e534f6a7cfa1..aa5fb64d57eb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -31,9 +31,7 @@ properties:
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
-              - sifive,e51
               - sifive,e71
-              - sifive,u54-mc
               - sifive,u74-mc
               - sifive,u54
               - sifive,u74
@@ -41,6 +39,12 @@ properties:
               - sifive,u7
               - canaan,k210
           - const: riscv
+      - items:
+          - enum:
+              - sifive,e51
+              - sifive,u54-mc
+          - const: sifive,rocket0
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
