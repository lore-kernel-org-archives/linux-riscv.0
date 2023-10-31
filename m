Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68798C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VN3ia+vwY0Bv1Al20TiQf6pzukgneBeN6GjG7xS8Vs=; b=Ku4X8P2wWYlJpF
	iTeAVCkVHRezpym/S8Q7B6NNX8xLo26zxV7QPdDEZkXTQkszQg15MZM6WnEjz98ab+s/acR8o0SSr
	1dqSUb/4snBfNqZm9XIzGqsKwMPXKvtRy4JQ1JCdeHBXzHhDF0vzg00vPuvcCSBvkZKLLSRb9tUlF
	zLfuIRy+blj6bxGMZxECwuCPIvTecSjLXCsqIBDiN65IG9qSeRoxou+VqOnygjuK8vhw3iBpm769o
	6ZJTR6vWwrhFWOZu1D/Xzb3thhXAhscZZiV0x2FKLn47pNHqBDCNLh7RsawCSREEJX0gUQGJhqlIl
	yib5XFOixPGnOimZ4C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpWD-005PTq-24;
	Tue, 31 Oct 2023 14:14:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpW9-005PSV-3A
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:14:55 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B2A140634
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698761689;
	bh=K+d8FOi611qgqDiSGAqowSPHYlSjp+mGUPNXtAF6OWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=AslqdevZh2AwyK0JiADdPN/Y7eJah2oZZQ4UDKHs67LMDkQf6s/hGZqyin+5DspAA
	 D+umLVrXc50Wcx8VtT4gOAwDr925dV/6nVK3MSoqAysBGvB3pPgxKgjDy0onuCY3iH
	 9RnHJOmIS9EuHcExxQygr/55CFgr4MwV+ECK53LOoJGsyB+J2R67KLKwzTS/u8gW5m
	 Kg6UZL3cbsiqRrMK6gcM4OpHsi0QWs20nraCifkysqJvEvZ2w+7tSxpQxg78LG3fWj
	 N9C3ALzszTxVcDRQyLosjy20C8tKcNXhJNEptw2zU9IB1cJg0Expg1i7t0hTRuM4R4
	 j3hup5ve+3RrQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9c7f0a33afbso396969266b.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761689; x=1699366489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+d8FOi611qgqDiSGAqowSPHYlSjp+mGUPNXtAF6OWs=;
        b=VAxUirZaDyg63grSIZx8qP5R0dKPnhQHqq5dLpQ6SgNQSQc+h5aAdvzgojEmflvmQ4
         AjeRku6MA4gWTRv/G1M0gXHfNkgTiORFVSc8JpBFRiLvQQKyD0Rl01RmB7JTfqhyIfdt
         mIbqmpH0cwXdqWObVyuvmS1mrEkoH/C3Wuu1IKMeh1bDulhcae64zhghlT2bwhgt8xMS
         fpic7nxmQGMKFQNxuf8eiZ94azRzSXln+03HFBn836dzAgU97CpQOaipteWxZTgfHUxI
         ptpP/4G6DLI/k9eaMNTdqD8ibPTyWUpQpxeJ37EniFcN7D5CXIdqxeYuFLKyqFx39bFN
         czCA==
X-Gm-Message-State: AOJu0YyYf0xUvc7yZbExNablSvXyW+jRDFvMS0CdxP2MdapEzd7s6AKQ
	8ODFXg5fPr/ZNc4KlTxvI3CxzLyYo7KvYT5MHTAx3sL0Aown7rpjZ6Xk2GfmecIMj5PvcIh+xH3
	ZVAjVRoo3UmlBCH64vQT0XTz4WWaxx21UjdEbVRM+pKejyNPam+9uKA==
X-Received: by 2002:a17:906:ee8c:b0:9bd:dfaa:3f3 with SMTP id wt12-20020a170906ee8c00b009bddfaa03f3mr11080304ejb.7.1698761688983;
        Tue, 31 Oct 2023 07:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkm4eTftMYL/pLkJ6rc17J8JPzS7UGZtP1W0Jm3fINC348oTDOAtfZqM1Xw64GNQBGyCSGeA==
X-Received: by 2002:a17:906:ee8c:b0:9bd:dfaa:3f3 with SMTP id wt12-20020a170906ee8c00b009bddfaa03f3mr11080294ejb.7.1698761688788;
        Tue, 31 Oct 2023 07:14:48 -0700 (PDT)
Received: from stitch.. ([2a02:aa7:4003:190e:bd47:7b6e:876:4bdc])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709061b4500b009d23e00a90esm1037395ejg.24.2023.10.31.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 07:14:48 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
Date: Tue, 31 Oct 2023 15:14:43 +0100
Message-Id: <20231031141444.53426-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
References: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_071454_561291_4362314E 
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
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This cache controller is also used on the StarFive JH7100 SoC.
Unfortunately it needs a quirk to work properly, so add dedicated
compatible string to be able to match it.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 8a6a78e1a7ab..7e8cebe21584 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -38,7 +38,9 @@ properties:
               - sifive,fu740-c000-ccache
           - const: cache
       - items:
-          - const: starfive,jh7110-ccache
+          - enum:
+              - starfive,jh7100-ccache
+              - starfive,jh7110-ccache
           - const: sifive,ccache0
           - const: cache
       - items:
@@ -88,6 +90,7 @@ allOf:
           contains:
             enum:
               - sifive,fu740-c000-ccache
+              - starfive,jh7100-ccache
               - starfive,jh7110-ccache
               - microchip,mpfs-ccache
 
@@ -111,6 +114,7 @@ allOf:
           contains:
             enum:
               - sifive,fu740-c000-ccache
+              - starfive,jh7100-ccache
               - starfive,jh7110-ccache
 
     then:
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
