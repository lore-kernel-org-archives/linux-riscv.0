Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AEDC53200
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4B83iNod5/HkWPI4jWTK/DGxr58sbetMYNL2a7CAWY=; b=REwYfZvxRpWtAq
	3k7WqoueznQYbXDWDLeRsduEv6/D5Kj8znT/XYdS8jUcSFvEXhkYsPAufZOkn+htvMd6GbMG11ItH
	D1J0Jcdw/dFOGMUFsC6SC65v10tF+gPwBoASBNuKQTdaVkMS3zIe+wCnb/HchtHb39RKsGm9kqxxK
	QBmeY8JvlOsCpgC8X/Unlxs/zuXrB6ht4+xZCXtZGsP11HhR3qcQh0JLB4R1UOXkCHABQ2rYmt+Rn
	03fJa9mfDgAjziOvFrPzwf38Bh64HvwWUOL+JXcxKFRBN5VGzzIHOCWzdgbJnq67h8K2H1JYQU936
	/T4rBa+GmabE5FdQ/feQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLro-0000000DPhP-0Qq3;
	Fri, 20 Feb 2026 08:28:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrm-0000000DPh2-0Sii
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 08:28:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4362507f396so1826072f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 00:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771576080; x=1772180880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5eLGfJrbtVWLlMPc5LreUV+HmegSvmbmdOtuZdLViE=;
        b=ZCCV2sUfuvxXM0rxCLT0JOSoQ4Uha0VU4Pew2J0WHoW+cRs/NQZrNN7OqxEHNm7+Xg
         T6c9MX9bcHtPumNrZLM0DpxtbXaQxL7s+mYODRhaYe485m12ln11Q1IlI/fa49V2D5hk
         rBu3mIHf8qXeVlNsyR6qlU2JMAW5bHYT+dctIjXZbA0tkEsKTvtej8LkqQgOoCYHoe91
         iYJo0yTWeTncAV+86dksCzvtwmJNR/aLMDzzvwJV9NU8ba503/7bNju79egluRjRFhOy
         gNIXudbki7Mebng/25wKR1s2LMpLwvzjvk9KUC3SA8Zo7v7KAx/EWFOH3u/EVgzqRF+K
         zm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576080; x=1772180880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5eLGfJrbtVWLlMPc5LreUV+HmegSvmbmdOtuZdLViE=;
        b=Q6SpMkWkgCiqOU58/cs4EnddCP8gDWaC77wWagrtLSNFg+dTg63pVN9WyNrEOs2n/i
         Vra9mzLZsKaAdn/CAVaYIwU5BgMHVD9NMPMOiWIU7p1UJbW2d2XFnKnI1vqErVO5178l
         /LSmKKp9eDv6JjrsYfYwqis+3GVybBhn3k9baOhJaBFwcOIej8mD4E4VS7/KgSBy/OUm
         a1gTblJ9S4FIYicm8wOMGfskJYZ9+z27NdUUeSA68H4893ag3yUL1L0v9kz0V3zgBX/u
         ZPBRVDzYnkd8g2dqoMXXJqlr+jGQ/Fj/4dwPh6XyiR8JS+U9wBHqaZ282f8DvcI8zO4X
         DxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnzis5XzJWRzk7tqAxSk1tELW0pQU7FBz5MwClOdmIuwOZWUFgWuoTq1l5hOcAhPxX4EObZ3D5Wp18Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGq9OIKpRqvX44Msbgo1ZdYgyhNgIu8RVUM1xse24bjN6iN1vy
	Cy92sOvao+HvL9+w/Hj3+nfmD8rSVt9Ljed8sK6sCk3BN+RZ3RrrTMOq8fdRiLG/628=
X-Gm-Gg: AZuq6aJXlc73E6zxxSCztZJNHZlO7Gre7mVChYRAzBbeLKFjuPvn59vcvQ6tl0pgUOI
	EXKR/L2k4p7LTrKhXwfXrS6R2OnJ3UBs5mmFrT4eVmUOMXSJagj+mjAQwhtU/rsfc7GFTdfnjZ2
	x2vBmuig0u70kdamUP8B4nEkXebMd0pB5wjOTc+tA2Y4Cg+DtVg5nAD8GT3uqlRoyeeK4cxVz3Z
	Dh8Ae5I3cyNjLT2PxfRTkvxltj0z1U2sybsRIFESumfJTInA+IW27W4RibTvXVPVjlcTRSwdMCE
	iKnuvfExYnmqv6a/mrVY9E2u3WdUJm4gSlIfcMlAXANWBSS9qJwYVKA106XJU1ADh+nfm97XWkr
	s09lfwimUaYkvttThtj7SMK80NZ+jtiKGtMBDsxyXldOazw4EDJ5mEwmVMObNKzLu2ujV3DQoSJ
	zO89e8/y1tSKqfHbrKE3BJ
X-Received: by 2002:a05:6000:208a:b0:437:4872:fc83 with SMTP id ffacd0b85a97d-43958e40264mr16112584f8f.33.1771576080263;
        Fri, 20 Feb 2026 00:28:00 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm54717688f8f.13.2026.02.20.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:27:59 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Feb 2026 16:27:06 +0800
Subject: [PATCH 2/5] dt-bindings: interrupt-controller: Add SiFive
 FU740-C000 PLIC
MIME-Version: 1.0
Message-Id: <20260220-fu740-v1-2-c8af54130c58@sifive.com>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
In-Reply-To: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=+TEwwtm2PIIgCWLeUnV15+Q2Dgy5dOcAStHu0XOpeeI=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmBr8cO7VEZscQY0zwzt3wIUXXTtpZ7n9utbAR
 BIceK0tIVCJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZga/AAKCRDSA/2dB3lA
 vacmDACN3HpL09hYqpED9ADdDNvaGs2XPvXqwYYTw4Q8Gi2omOHC6ANk2+p4FIhtZGNWF1DCAXW
 39uj6PCsaAmKbD0AlImrsZehkQstr8ZxWWGSyF/A8lHHiUo72DALiy0f9Le5/Q7lFP1WHxEKJUD
 ZB/tvXmGE1zaH8Xd9zyDy+Y+TtCzTSjsS7TJIDvWWI5ty1XBDwgu74OIl/Oj4mNYXsuLRMQhs+o
 kIFTfsAkwm3m69y8ehbu/866xrxHAwczikLK7CJKOC+yz8Nuh6TiiFxtkhIJhyglChhwP4Omg/R
 mBRwMMWjgrZzJrja9MRKAKqz7McqQ9klazip2tG+OqdK1A+I9ohjvjSDUYv7WHeuTYLppErpejq
 JgjnKzhh5jHNt0eCX8LimCCjkAMKZU17YdierhFwYY2/WHBZIWTT0U66retiUgH7QJLo0AUwCHu
 1jQYUohMD0CTJtilFGYcx7r/3kBgSXpUhuPyuxLFvU2Mks8SEjk3cI+0d6YRBC6L9eR8w=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002802_171099_07F7D586 
X-CRM114-Status: UNSURE (   7.93  )
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

Add the SiFive FU740-C000 PLIC compatible string to the binding
documentation.

This follows the SiFive IP versioning scheme which requires SoC-specific
compatible strings for proper hardware identification, even when the IP
blocks are functionally identical.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887e..351d26ab1956 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -63,6 +63,7 @@ properties:
               - eswin,eic7700-plic
               - microchip,pic64gx-plic
               - sifive,fu540-c000-plic
+              - sifive,fu740-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
