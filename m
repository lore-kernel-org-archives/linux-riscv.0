Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CFAC001DB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 00:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cE6s19qkBiOxRpv71wvNE6DYjs3u4aQ31jZbOgpJoAI=; b=vIInVitxPbuSYX
	/VRkLyv5Wo1LreCQ/tdwsYJw9MP21iCD6flFMu2z/VONaf++0/KwEC6pwn/gjpKEuLIHaaUsTcsl8
	K2P2pUVbKDsvGnanxLSrXLiVqTu9sAoZaJ8gRtzs6ZzoNs9PIWiIrvLyKoJG1cdZOfoDFDktnm+io
	z13I+2oYGNyhTLwHksSRQtSMBVK1+GLP/AIEPAU9jlUFv+dg18NHu+4Jpa1mH+V/89XbUqgzLkg52
	CI++0z64YeIwSQxU/BWupFhC+27CuPpaHAN4T5zAEHg818Rq1TY2si4YNRGKrjNZtVO0B3nw5ZCNN
	wd3G9hjdaKUqaWV7wUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcnC-00CB6s-0C;
	Sat, 12 Aug 2023 00:47:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcn8-00CB42-2h
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 00:47:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26b2884bec8so666514a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 17:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691801258; x=1692406058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmdmIvNh/weap9MCOBtwxIGhp4oicSDBRHV6ZK3T3dg=;
        b=QALbaU6x4orin16gFjGYFXKD8oGQjIw3f/9c1lDaQisRvcVGSdUeygN4poOY5EaTiT
         vIiSPPBWTXpu1GXMSz64WqbRy+39EBM4uHCRZZgFqrbl5GBBtBvKLBdPzy9yraK88DD2
         AdqZZgngOWqDcDaYszrnQFV+W5Xcx85sxgp/5gHJwelLFYd3TzNm2ekSrY74aRhPpzih
         0xYwwjIm4owYuFouxYnBT5OEQESo0gM7hq4Cxv6R+bHFhSQsuZTAFJpAiX7nimEOpOKC
         wIeV7CTAO2/cxcCFP0C6+xMvxVfKKFNXc0oNnx4ZZqkeEcPI5+9eMmsmjoD9LULyRGWr
         feuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691801258; x=1692406058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmdmIvNh/weap9MCOBtwxIGhp4oicSDBRHV6ZK3T3dg=;
        b=IjQew9Y/ZEeG/DmbZmNmxX5h+21Fub0fHfg0p4XD6cQWiwZBY30ZSPuoK+dr2UcdNl
         j5Oj8WLJeYRBnFvZ9IlWKPwa9B+uzhG+xOupxYWIeW9BqASFT/alWQBREyCV5n7wuL58
         T4/JeIYdKogTHkrxhoM2hbmGUMU+KiTj/mH+zP0H7cO01aGxFmjAzy6N905RsO5AU18q
         5dfCDNNdv9FYvvohddAYb9ATA1+oanRz3sMCVTU4djMzBJeHuK3SnTIGlXp7qV/XvvdM
         3gAwGmZXgzlou573jWYvC5iTBkG8XXn2GahOmE5YZUiRAzsfAVD5lDgh3DlIDji6svaR
         sFog==
X-Gm-Message-State: AOJu0YykOxN8qttG7v9c0g2a8E2ZBNP1EZK+UggSjXrUYyaIJz7W175m
	3ivHlRuHHilzX2fXiNlfHPsYvw==
X-Google-Smtp-Source: AGHT+IESs2XUKo+SiAONsY7RNLNHDIvsAKRSKpimxWRh15azy5U0zARIzqL0fSIXLqJ9NMuoZMuMeQ==
X-Received: by 2002:a17:90b:2350:b0:262:e6d2:2d6 with SMTP id ms16-20020a17090b235000b00262e6d202d6mr3034198pjb.47.1691801258387;
        Fri, 11 Aug 2023 17:47:38 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:5b85:b986:e090:9abc])
        by smtp.gmail.com with ESMTPSA id c11-20020a170902724b00b001b246dcffb7sm4559247pll.300.2023.08.11.17.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 17:47:38 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Fri, 11 Aug 2023 17:47:16 -0700
Subject: [PATCH v3 1/2] dt-bindings: riscv: Add BeagleV Ahead board
 compatibles
MIME-Version: 1.0
Message-Id: <20230811-ahead-dt-v3-v1-1-aef2294bed86@baylibre.com>
References: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
In-Reply-To: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691801256; l=1099;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=3zE3DAtWNRR0RNhye3g4EXsbaTzQt3JjGH1aItoKzE4=;
 b=omtPwIJKWc6olP3mETH19n3OvHpWkCCS9zbRPPpPd2NcvHtbTP4tQ3pYM0vJeQrTFlCGyHUVI
 lqqqwZdSxG9DCjl2nSY1KKXRyn2CO6LwGZ3uF034IbMQi7QOJKAqaBH
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_174742_872343_C8624347 
X-CRM114-Status: UNSURE (   7.90  )
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

Document the compatible strings for the BeagleV Ahead board which uses
the T-Head TH1520 SoC.

Link: https://beagleboard.org/beaglev-ahead
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index e62f6821372e..301912dcd290 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -17,6 +17,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: BeagleV Ahead single board computer
+        items:
+          - const: beagle,beaglev-ahead
+          - const: thead,th1520
       - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
         items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
