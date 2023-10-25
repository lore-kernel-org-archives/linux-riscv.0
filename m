Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC1FC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BdHOzqz1aRHAx3/aa/n763vB03mELKw1YhV4N8++bXc=; b=LTpHZA9Rkceu5M
	Gdb7qxQd1Ha8ioo/c68AZsF9fCUr671//3Cm77gcbPOjLDd2nT+DJfJ4ZA3KikkKUYSWtlJDr58RH
	IslPSDVOn8v4WFaF2mc/3ty4fGsn5PSdUbEKbyqwj7Dd1hg/xy76lRfzjM2uDWIhJuLDs2+BlrrrT
	0t4PkTuc7Aamu2x4TFpb+hltJcP19knZ7UNc5fpv2D+LiJsAXe+/VWx1qkPuocP1C4F7/V8OTrdyf
	Wba6MXKIB42udLHHYRP4I6P30kcMXD3Ne0t+Qk28Enj8qWahSKAHB90sIgLb1wDD/Ls7P7fMmvPMU
	sNj4XJPZaHX76xRMaaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3g-00CuU1-0T;
	Wed, 25 Oct 2023 18:56:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3d-00CuRo-0t
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:56:47 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CCEFA3FD3B
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698260199;
	bh=dpC5A+l/P4E3TUZnqSQSiD+h/0pN6MHwAsvozKjAyuE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=gP7AzUNPkSNq+l8ch77TOIkMBwdpiEVv7X8mx/SK7jMD4VxuGaheTiU6w3BnVuIXR
	 mulprZVfHP9ChvmgRaz3SQOxIfUS6wT4OorlGAcOxRK69DDSkiCrLq8nCiUNezvEQY
	 dq66RMJrJs6gPQhvS4TGbX82Ck2s5Bipg9ucvFNdUx6BXTg+pbR9GqHJq5NZPFIlCP
	 8MkMXxr5WkIlPBveAtnKSQQUzoO2TCXChh3UKfCsdK1Ppjekv+Nlk13LCxNRm7FHqz
	 CODHYLrK10IT+xrZFcs34y86weIUpO3GSrl5z4vLO1M5b81xLo/F9/q5/UzmbcnBTm
	 Lo4dhOsFtzv8w==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cdce61dcbso1249991cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260198; x=1698864998;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpC5A+l/P4E3TUZnqSQSiD+h/0pN6MHwAsvozKjAyuE=;
        b=tze/yJ3h/92hHqFdnWlik+mmoxtYyogrS4nI6WKyk5P69Yn2/+TGR4Omc51BLJtokJ
         6X+HItZBZVw/pXvkzWvv5o/cH574qnOg2P0bG5l5JzOnbWsvvWx+J7nU8Z3GEygcsLoZ
         RbNkvQN+Hx1XAt+xQMJEaHkcqcvkkxooD4K+F3ftk7hI76XWCmXGQqoSf+IJ/U/9E0Id
         0mRWr5ufp+p3AqWRbtJb/m/VSKe4eUogwr8IVNhl91m2KpolsWIUK25HuXPdq0LB4dQK
         xsWP6jO9ODiiMvTcQBo8WfaZ+Zl9i5D+U44ZHuyDo8w41GEQNx1Z2K/A09xgUyrkzZAX
         ZrGA==
X-Gm-Message-State: AOJu0Yzx5dG2ti17TdyOSHm8benNY6meh5Wp+ku01f0tVSqtvvo76Lvw
	6UZtofT68bi1tIQ4aR8cP1jCoRDZKLsZAd7lPfXdrwFrWYSiQawAXOJf8wwNY8vmdP2+v6y45mD
	NsxHGEey5oOGQDSksIQf71/D6FPFwcXfWz0bFxZGJ20Vd2rJbGUurh6IFbaCe2em/mD0FpQ==
X-Received: by 2002:a05:622a:1492:b0:41e:3de2:c8ff with SMTP id t18-20020a05622a149200b0041e3de2c8ffmr481496qtx.51.1698260198097;
        Wed, 25 Oct 2023 11:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEODfT6JXWwGmjJQBhTKiW+hVEHvY4WjoEtxUQiB6AZJTG4R8jFdnVJvecEIj+8lVHfkYW9vqesF3eZs9EmsZA=
MIME-Version: 1.0
X-Received: by 2002:a05:622a:1492:b0:41e:3de2:c8ff with SMTP id
 t18-20020a05622a149200b0041e3de2c8ffmr481483qtx.51.1698260197850; Wed, 25 Oct
 2023 11:56:37 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 11:56:37 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 25 Oct 2023 11:56:37 -0700
Message-ID: <CAJM55Z-vw1sbks0KcHOXMzP-6c9NMg+GOndi2pQ7iyWh0=oQiQ@mail.gmail.com>
Subject: [PATCH 1/4] dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_115645_440675_D77D3F2D 
X-CRM114-Status: UNSURE (   8.25  )
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

This cache controller is also used on the StarFive JH7100 SoC.
Unfortunately it needs a quirk to work properly, so add dedicated
compatible string to be able to match it.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
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
