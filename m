Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86065D185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0z+BU1QBLcL0TGiTEykIvgzJB7jYDszpVeLL46GBHE=; b=rMowRh7BISnq0D
	5O0AYQOos9rhjKNtjzUBs1az3sUgUIx7hM4NxoWtD/2F31Ncvay2ctaFVlOUK67T0VgckBG119ddF
	kRTu8aGPtoIM8D0FjezKcPfv6pe+phzu8ZD9ShsL3Nkib0k8EVr0aL7bhPj5LDlNXjeFOnOmw7RXq
	YBygRtwHMlpbq2Jv7RDXbCl5Ii+PPSSJfCSRIDHGgp8mP32HUzveHEd3Chs4HwWK+8CZBZ3POa7iA
	14SykXpCeLABblXz2u5aTyRagMQX3fAsGXiVf/jmHV3THF+G9InP3YDKVUQpfz7u6zdZf94yM/RrF
	b6bieu6ZLfqpct9z2B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6Z-0000000GznS-1Ea8;
	Thu, 08 Jan 2026 12:27:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6W-0000000GzlP-0X8F
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:27:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso2307137b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875223; x=1768480023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d/sptKjw5iBNotRNV/yKVZGhFT0qCTjPkOa45oLlSI=;
        b=ybw9XgyYRe65LHk3E4OQXM0LfwRgo45ZGOcOE2v7f10zOS8IoEj8ei+v8SNmWR9yCQ
         v07RH1nf02MFGbclttKlpjnk6r7QOEcXH/5dHh74syBOqEXebyzQnCmvEwO1Bx5UjB+4
         e6jVKLXeHw8uBsXXepSATSwk35eNps+ASVqmx5TvdCSdHEKuKwNJ6G2hDQMq2KAIQB7+
         RamPtMg4xdSGv7GSaIhFc2j/EZQxG3wZfNGV1yb4uWVTm4R65A/vAfeEJUKdgO9UtT0s
         BICu8VO99WAd7+opMswgtRUtH9vNixa2Jk70a3BvDz9qANi3TytISpyh4x3LkD+3ieRd
         oRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875223; x=1768480023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1d/sptKjw5iBNotRNV/yKVZGhFT0qCTjPkOa45oLlSI=;
        b=EsMLfS8bl0VizWT5P54flWaEKSrNm/663G1/9YnH2t+SjUkuXDKJbvMshQgROsizYC
         bg0AM/A8S2ZdPP6OnG31Z18ZnH+HGCAmnGnFtLxRV6pKeeEBzc0YNP9cu/bf95rWu266
         AYvDjoWhyG0XCTden/OlfjN6V+AdMp6FVBI+cZIvGJI50yq4+CkEuakVIlv4KJtYRM87
         75afHf7vS+IsWF6xK85ZycaffcklqFabnxKsmciED3eaM0kaD/tdsgT7lZ9D/NSwHsHb
         k97890lA7ha+Vwj8Easspg4GsAhzLufG0/I4UiRAG0XIDO0B+HFpcc9Ar7BJZLYo9YSA
         XU2g==
X-Forwarded-Encrypted: i=1; AJvYcCXd2MqOOL3PbnRI2xwIcsgxlDacT7aXvZA2SK+k3uaDgzeHGujL84amUPaEwykU15Y2VsqSXS6fPLJahA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf8ByBHdSNfQWuNvlwFg5y2smWe4H6rELgkWAZcfmoJsJaMv2E
	uUtpKa0p/N2k6f5ITDrGCCHywi57aUMTvSMB6r9TJWwDuVmk6FdZhjJ+EZReyIArCsw=
X-Gm-Gg: AY/fxX7pCjR2bNbGxzYCJ60BZDpFzQGZ4RDic93NuESFZSip4zZg5KoPVxfZp6Syaww
	QORHXV9a7kv5QTwU15LPcOwNJnzGj+Ve2/P5bBkCpRO6FF46XQWiKxsHb8iAweDxhobb5QcmsOV
	cKQMiLHEQ7k6vOWZsuqvCrNHXoJV5tUSMGUSlxGw5pN38r0ljAFi62Os6Oi//7y9E7kRJPxvwZN
	K0imd1eJ+YC5fcv2NGT6gHv4tZhcWWZKJb1I5sBAxM0nuUSDcTEReYhXjdWZLjYNPWA+KUmiBdb
	ve9uDFhK18yXSv1OacatgvwQb6LTC9fkV7vcfilq/wuIk/5pSxYXJSoMGf0+c2D9q1+xzAR/8FB
	xN6K6eSqRQdbBaHSx+GsceKCFX4uBwYWlk2D+9aOO8iAlWFslMgAWfXt2BDbxBuV7tyaiZrf/jJ
	rtNClQQyu5Mk8QHt2VRjOmi0oAJ5DDFIE=
X-Google-Smtp-Source: AGHT+IHgvc5T6HyTkZolN8WOySU77yaQYw6IDoxev+S9+8O7C9xiglUnwMN5spw0Ckcph82Zd/Xetw==
X-Received: by 2002:a05:6a00:4503:b0:77f:efd:829b with SMTP id d2e1a72fcca58-81b7ef0b9f2mr5864962b3a.22.1767875223466;
        Thu, 08 Jan 2026 04:27:03 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:56 +0800
Subject: [PATCH v3 05/11] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042704_210878_E21B1F5B 
X-CRM114-Status: UNSURE (   8.53  )
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

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f768cd0cc59be6db02659a43fa31ce..fe62971c9d1f4a7470eabc0e84e8a747f84baf0d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -9,6 +9,7 @@ title: SpacemiT SoC-based boards
 maintainers:
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
+  - Guodong Xu <guodong@riscstar.com>
 
 description:
   SpacemiT SoC-based boards
@@ -26,6 +27,9 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - const: spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
