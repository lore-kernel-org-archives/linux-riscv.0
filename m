Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55488D5E151
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4/KWJ82v8ic1jp9GMhCnZIlnw26JlNgFgh+e7j+Iq4=; b=uQ7YyrK1VvMEvL
	9soFViDVZQkFttVs3+5hbekgvEzcX5fkpk9Fp07eT3LuMlxXGQ0PQ8hb+fk2wNJmgPbyrV2nyYx18
	VfHVgGxesAJHSu8Iypuds7jUhHRqOs5nMTsxK0pCoiM+nrZ5rreHoUGvzbqnIuci2ZPzTCJQNyU1v
	ox0yby8MzC/kFmgSzMT2AN/NWhlm1qAPm5iYrGWBt2w78OO7/KYqo3avhbjpoTlKNaZSNqplBdP2n
	PQK5Vu5tehnMkgZwikL1J4SC1+85c3Tj1VPkJ/thSiDM2GQR0ur3OjUvBSrI+5GooCthho2jdMeJy
	01R9OFCsz5ISs3uw+Q9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBX-00000005GmL-2wxF;
	Tue, 16 Dec 2025 13:33:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBV-00000005GlC-26LM
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:33:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f0f875bc5so60708875ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892029; x=1766496829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+gFWCwRiawMnBncXcTO/PvxprCNgSOeAOdslKE2EFs=;
        b=GxW1BheKiG+zeuNvF7W0/2YBOjuxZ7WXwrtWI2B1JESvopPC6XuDGZrk1XeELjQIEB
         D7s+cNusSMZWnIByvhWbieOn7WwAkc4Pl1BuoXjNoKZ+UvFz4VVUWVVcvG5ZEtKFiyhB
         pva4dJnCT7kyYYQpoTNj/uNRMD+Vbp3tYKFQfr2voZGXqUCJBqRxDjS8gO/SQZRLS1k8
         +MjYz+IgP7K3F58XOCI6ZIDzP0I2RBhWLfD2WvvwnLFA5vZikUD95NO30f5bZjeSeAJi
         rEAXaFLKZZnfGKN6z1Zp7vRBh1aFQ5M/yjvq2YPhCp8plq4zK+RSQ366Vwsc6mbqGDbm
         8efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892029; x=1766496829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+gFWCwRiawMnBncXcTO/PvxprCNgSOeAOdslKE2EFs=;
        b=YbsKC4N0s9Fec7Guy3MBCXaUANP7Bq0i49dnIqDu+M99hyJanhRAk+Hd6tH/LSPyrE
         8VxfN8WxDOH5KC973G/67h4qle0YXVxKKy7XRKATzXivw8JUd8qRrc09P/4fqfCz5gLJ
         P56df9RAjzX0aq2e1W2lrQJHN3Hd3Hs95PPlb8C5bpuz80Z9qYQfYh1ex7X6+zi6e7QG
         Q+U5cuWjtPZGo6ThU0ZucKz16Lhrg0kz/VYqAC8jYAbnCtMTJGhagzOCs9pzdKrA8otQ
         /MX3n3GWSd7PgxOlyUV7ycWeg5uAQelClIOofinL/6q96Ua+axL5vQMuG/kvMnRRrBGv
         IUIg==
X-Forwarded-Encrypted: i=1; AJvYcCX8fC3kyu/dw/wtGFP6aA+8/W2/Aq0vkwT+kQAIBFxuemlrYWwiaOHqk9h+SoqPS0bPYd/aBIu3lsz6VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9JBjd4F025NxfJePhYlBfYEsBWr0zdcpYQ7ukOW/4dN35KsPU
	1CkdNwTen4dP8N0kOjSliO3PkoHQ3iXYuLLh6rnouLRL4iP2T14VRbpFt5Hilb+5iAU=
X-Gm-Gg: AY/fxX4LMdHLfbHpeBhLcnaTlT2+zMmMXnJnGN5uAB8NDrrwsfjX2G7aeIj/daKSwTV
	KeJWQtJ+Bu9DlabWoN+67NKUDHQBDQHquXSA6zjZDBtqNiIY3g32gDCHzvMHtmi9ed1dPz8Ca8z
	oTKoc/gHwEKSNB+AgNw6H0M3JOV20W9WO002Tyik9wEnSn1y8AkoCHBbWKduxBx/1t+6911A/F+
	h0EZRAwLakpZH/pwjHC1P+mbWP/g1eqtrGEXemIOSXDxbG1Gi8Y/ye7/FvU+C34e7ZGdgO3Hn5R
	huUsqFXpksYb30EijQvC5qNlNQMfYEGCvTylG/KmNI9rWUmf8CgvjnjIDfsBgDl+cPTqMu0ecGP
	V7/PRxZ7xPWpDtpCIq810HKnX2Q+4pISp/MNEM5HeBFAZyCzBWfwyLJs1OgWt1UqKiyZJ6Zo0sL
	qXBy6urAmn1w+ugOPyOATBrWkHTIH/TsY=
X-Google-Smtp-Source: AGHT+IH555BYg0W02DfoN/1AYodPyeJqWymKTxAH7DEgGh7AGGSGr1M1vruhKc7CF1NGnjMT2M0bUg==
X-Received: by 2002:a17:903:48b:b0:297:d697:41e with SMTP id d9443c01a7336-29f241515b7mr111102665ad.37.1765892028806;
        Tue, 16 Dec 2025 05:33:48 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:48 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:29 +0800
Subject: [PATCH 5/8] dt-bindings: serial: 8250: add SpacemiT K3 UART
 compatible
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-5-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053349_544924_17B258E4 
X-CRM114-Status: UNSURE (   8.28  )
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

The SpacemiT K3 UART controller is compatible with the Intel XScale UART.
Add K3 UART binding and allow describing it with a fixed clock-frequency
for now.

The clocks and clock-names properties will be made mandatory in a future
patch, once the K3 clock driver and device tree are merged.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 167ddcbd880058b6dcea9ce33bd814ff8ba6b0f6..73851f19330d7f9fc254efcd32b5977feada0b07 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -160,6 +160,7 @@ properties:
           - enum:
               - mrvl,mmp-uart
               - spacemit,k1-uart
+              - spacemit,k3-uart
           - const: intel,xscale-uart
       - items:
           - enum:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
