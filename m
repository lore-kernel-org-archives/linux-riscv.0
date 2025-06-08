Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A88C61CE7
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAhEZ1nHKTz6yEmu5PaSoPWalCOWsAEv3pgfjNiTUsM=; b=gUtEN5XhcrRYyM
	RT1V/xgedxyGxtX1AkLzPFyoZXeW/4LCiYYJfmNgYs+dreNqqQQuBy0/IoG30gYxJ/prtGVkN1gsf
	a3j9/L4xfoAV/lzHQ9cQImowaK8IIfrUR2bDztDkroxyUAwjh1xv6l69V6e3Q8P0npsLSXRUFm62e
	zPiF+3GCFYQ1SSWhMiPVRVgTIl/+pfsQz+dtWMeVYEPmSPAEjVWWimU7arxYkm0ZhWo0pQRPtSGsP
	N5ztzdv4CfuqE+xVL4IqMRwWSuPkNyjTUwEbp7GUHEM6Sosx7an/oZ+oDGehbhC7Hh4kO71Yp0sla
	tvmRTLCfEXath/LdejUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMV-000000036Vm-2mKI;
	Sun, 08 Jun 2025 23:23:35 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMT-000000036V8-3qao
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:23:34 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a58ebece05so43586481cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425013; x=1750029813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=fi8MX/TQ7MWNrpUBRf0w2nxqKdU5BI/1Y8JbW2WW0UM9xiIrtZmIMr0r/HNM8bqJQy
         z0L5GA/aIjHwbXB4H74d4vieads2NR7OLVbExt8rf7QIfkALcqA6VnQRJ7V2V+E7A67C
         qVwRveaIQR1R+PxDzDGRbmZvFtF/2nNX6OO8ck88YMKZCor56+05IKKGdN6TDtX+PXAk
         F0IS0RORIQgfjiMsoPIs4OzBPQYxmKiFz8nidg5yRBwhNpS3diXC73QIyCYxnB0i35nX
         xTnNIPUEUi5384SAkUq0ZiLgEmOye7HJiPHAHrq5j9W92UNiomrM3qg+zKv7WghtcmqG
         a1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425013; x=1750029813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=uu+au5B8H4L4OtW+X8TuMWPyVu9hrKrDcYuQ/OBwUyxyFo1UF2E9+E/o8D+cJs65GA
         tnnK1Bcc0QYKvycGNeWEuHi1Fci58C6iSYvrUDu4oYzYev3kAEp23HmPjnnSqs0npXSx
         VQ2jqQYy5WYzfX3y1rb1JYloPRYWGhlWl30h2C4pvuNV/Lqu8WPNFJfn/FSfaFUjlwt6
         1OzgJpixRfHK/ZJhQPe8f7PTUVdS/7P5MfZT7paozULt0Rf+KraWm+xAJHjwAIsIicKH
         XzwtW5SWecQIOHSqUPICJ7ROKhcKqSPKcW/mGEz4oOgiqquAcH8It0M+byUIs3Hoiro8
         0PTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8x1HOSxmx0LChcsL/TbHJcMyB+gAYK0oijES4b8NU2hz95CzXW6UInYex6aMRssJF1F6eM2kywdxT3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRUfSNfcRzDAMkXX90Ebe/3LHZFIq6Hi6fVKI+xGNrbw8Jccgp
	NXKr779yO980e7TDe1HfDFyz9sS8OvXmtRtdHz+3LUUlgh+nmB4k+TOC
X-Gm-Gg: ASbGncsckIEhHCStsOlfmvz5Mzapk5oWsFyE3pye+u6mdF3KVW/qKnvZNoKoIpJcO4J
	bGkGgi8yVYl18uM/ystdndw+RaNyQHBWTU/tv0PdK+tnNeuaYdb+H82RoXRaqAtpkfoiazPemte
	DO2KSTi7VIVeu9zD3dMop7IeIHK8Ja99MW6tKDl8qdy21JplaUQpPMHYHz/TfQQLv5+tWfjtb8z
	rIqxKKLjM5CSCplz45qIIRYKA/RRUHtQqerdxy+4e05IqoLVyX4RC4Ju0j4QkOJB58fQbPKcPkq
	w0kBFYyEJaUydqJziZjcVYD72CFS6q4LAWoFUg==
X-Google-Smtp-Source: AGHT+IF3xphXoXKZTtdXVGAmCrM+vdD5L5L35t04k2N082DOU5EycEu6eHnJomWRNQdN0alz4WHfCA==
X-Received: by 2002:a05:622a:5909:b0:4a5:a5df:d1f9 with SMTP id d75a77b69052e-4a5b9db110fmr208752761cf.43.1749425012955;
        Sun, 08 Jun 2025 16:23:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116b780sm48297791cf.19.2025.06.08.16.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Mon,  9 Jun 2025 07:22:07 +0800
Message-ID: <20250608232214.771855-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162333_956885_52E6E84A 
X-CRM114-Status: UNSURE (   7.68  )
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

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..bd8dfa998939 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -17,6 +17,7 @@ properties:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
       - const: sophgo,sg2042-reset
+      - const: sophgo,cv1800b-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
