Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360D3C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IokKgQyOQOWUQ07c3afQ3vE5MIUukbJC8NYOr+5CwSY=; b=yCuP2PnBlUYB7V
	8gCd+YI67Yw4t3hmRKKE3P4ojwPLEKFDvhOYvPFPLq8sl7sBi7epvR7EhO4FPAf1PFESjpwc/SsYE
	FVQxQrlr3valpslzJV20sr8tPLv4HO/yxGMIu7dyNpKgF8WR2rKQ1o39/C4CaLkDsKrfJ5M5L0c7k
	HDCjDMMXJItWsWckTj/pB0KRcXab+55cKBLFqp7xypUyyO4CNuns8JH8jFk4zOW+vCcStOTONmfMg
	jsl7u4bh3vKY0DM3TP3wTduyZkv7hFRVqCe6Przuns83u4DD/GmjeAKX2Il45KZb5L9dI5hDCkvta
	k4nf0akufqt4IjnJKb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLid-00CaBP-6F; Wed, 04 May 2022 20:35:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiW-00Ca68-59
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id k126so1513801wme.2
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m85atXqhp4ztYTPocRCcI1bK28FLuljc1tOQ4ApvLt8=;
 b=BoFO9RgijG3dtSC+Asm1aOZqkvwHfxz+CW4Wm64TPnFa7FGej6gX0ZOMUNTbQ4rrM7
 4KYQ4Bjcvlc1vCOh4bp/BF1yNdOn6tRdeoOBlEjvCCY4j2HeQ/RM4E7egRLnZK2b+xwi
 iSnNJh1hooZHs4gGM1ZdfQKb8gIF12WZ620/hfPU8rGSH0qI+GgLjDpYFglChHVp8NpR
 K95vMSs3fmVUAcnP487exVHKXwKhqiUdaaYuirMivrr4jVN8EpQWRr/BBKM+80QnxVcO
 jhnmE+9BSieIb71caKB+SjXaONf/L3QncYOvQqXgCSiPY5mB66hegKOvMeExGAyIg/qk
 3rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m85atXqhp4ztYTPocRCcI1bK28FLuljc1tOQ4ApvLt8=;
 b=R5777sdtF6TP6UOUWDXVjb5s7Hx5Jbun7KKuupYiDyMH6ShsU/O5wjRlOp4FwMj03Z
 VRqbisPEK+eS5f+NedymGlZ9ogMZqEBzEb/NDtgOSBWzn6EVrr72QZAfWwi8nXKxadQB
 jKeZLWwmddOwoqiML0UJzIcmaqGRVNc6R+QwnPBwjNKMKyhfJfvbnITGI39dTRzkv5eH
 GaquBxKUaMK75baxxNxjhw5z57xWdGsPJ88gbVQVhdSYcfQb7NylrjpnNrRK+1XvJG95
 j9pzEPFKdLVnVJnZzIRMB4hTMWPiIteRsc/oVdTk4o4Xc/2dE59q+JwjR8wZ5axjHmQM
 NoVw==
X-Gm-Message-State: AOAM530eziCh3fSUNocOFMNB1EMMvF749Vid3UevOWPP5QmH02wtv60J
 eK6eIViIi1rSk1ScKJlyZTCRgw==
X-Google-Smtp-Source: ABdhPJxS/9tz7EnYuOE7vwds4NgNRqe9y7xl30EkdPS6ldBVO4rTRSF4cGiHP9guGl9befwAPMej9A==
X-Received: by 2002:a05:600c:35cd:b0:392:8e1a:18b7 with SMTP id
 r13-20020a05600c35cd00b003928e1a18b7mr1105496wmq.112.1651696521258; 
 Wed, 04 May 2022 13:35:21 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 7/8] dt-bindings: riscv: microchip: add polarberry
 compatible string
Date: Wed,  4 May 2022 21:30:51 +0100
Message-Id: <20220504203051.1210355-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133524_231836_9B996165 
X-CRM114-Status: UNSURE (   8.15  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a binding for the Sundance Polarberry board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 822a711df9e9..1aa7336a9672 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - microchip,mpfs-icicle-kit
           - microchip,mpfs-icicle-reference-rtlv2203
+          - sundance,polarberry
       - const: microchip,mpfs
 
 additionalProperties: true
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
