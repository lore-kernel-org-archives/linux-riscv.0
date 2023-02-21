Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0B6C678D5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GTviJq6aghD0/6l0v5E0F/j2/7tHqcegpJXK8ftCXY=; b=XDcSHNpPTZyR2f
	inEheE72Jnp2yy/TlF1fZ9E+PZsdWm13+tsiVuOmwtg5tGUsLlipWTwKBjV39OsqXiHJ+DW94MGVL
	yBYW7CjSNSu1ILJfCBHLagpd+HQf3zb6YlMIrBCAOB4AT0oW+evauRnKN3sKBQ2S+2chXSh0Vvcy8
	+ctbQwe9BuSup0udgSVBTl7gJs1uW6w2vsXeNlD7hblwga0vEc5Wdz5aNmOOzNQGROaYgbA7UvNRr
	/rf6cB/eEWmdITNJJrxwIGMfs0LiJo1HmTZc1aFI2xSXYEOkh0qDAfM1R/6vRx5E6QfxcpbipmUWK
	D8tbZ2TImhjQ/8njqTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ32-009fhS-M7; Tue, 21 Feb 2023 20:15:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0x-009Uqn-LN
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id cy6so15896792edb.5
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ulHjChwX0EpCdPBQp6OD2TjDP7InY37wU45TsSAj1w=;
        b=fsEIbxV5ukSI1Ii/NjFhkJ/3LweIKBi4U2JajtnyXC3kTEKlPyo20bMQxbypslthdU
         GcLh6lUQWvHvifl3PJx6/UW7Oo8rIseP5N9wDkkv2jDtoL6I+2d/ut4bDMHy1IDASlCE
         C5hSzmRmt8h9PUd5jPugCd7PxYELEIzwXZ7uQ02x9EvDNLBGGxbje4Z4BzgNnaTN4G5S
         W5aXoxvUXqTJJXWE+XLVyfdnguccMTOKcLhODuVY0KqNooEaw8Akg3y0M4zrXzoxDsm3
         sua2Y3MHXCjxnDNFdGqFcFOK0fq5KpZOWmtWDncxuS/U43+54R+iUz36Z/lLsGDHKrQH
         EowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ulHjChwX0EpCdPBQp6OD2TjDP7InY37wU45TsSAj1w=;
        b=MFAZe7Mgr8FPJZ4OF5SJORuITyS20kCq6JpFIT+jz6b3svIJ2wOVxD0dIYlTy5BAOK
         +a90BAi6UPw7XC3v3FRUIBCbGUpKeVlo97KNvCmdhkoi7WvcXwwSN9sDxbfSskFtsBci
         Tv/O8E1l7ieM6jS6V1UAHeP1zrwkYYlN92KHN10zzXAAFixkwxROFNuGI4s3SrZxiGLZ
         vdh0m53ZMmz4trijqVHQiGZj36DPSa8lDQ91agIgVpJ8LpO5ETaGBn95dybx8D/MOGaL
         brf9QyGE3BJJZozkxE+HrcrgVAs+1SDxsw+E9/eB7tLflteltlCCn1ZPj9tQfb9P/vo/
         f9Vw==
X-Gm-Message-State: AO0yUKWOI9iWi3pR7X+IuR9fC/nr/FqepfiFjyuHXsk7vq2XqUD/q37v
	be7AaWZGaBHOX9n/V5q4pVS6BqOGDtsOGsdf
X-Google-Smtp-Source: AK7set8vw2LdrJAAIOmnIsmu4hFnIFtPiV1NOx3WyBVbzECys4Flvbc5ISUhv9FDwPB3Qya8y0OJRA==
X-Received: by 2002:a17:906:115a:b0:8b1:7fe8:1c38 with SMTP id i26-20020a170906115a00b008b17fe81c38mr16437226eja.43.1677006562276;
        Tue, 21 Feb 2023 11:09:22 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lf19-20020a170906ae5300b008da6a37de1bsm2130313ejb.10.2023.02.21.11.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:21 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: [PATCH v5 3/8] dt-bindings: riscv: Document cboz-block-size
Date: Tue, 21 Feb 2023 20:09:11 +0100
Message-Id: <20230221190916.572454-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110923_705616_FE3B1DBD 
X-CRM114-Status: UNSURE (   8.68  )
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

The Zicboz operation (cbo.zero) operates on a block-size defined
for the cpu-core. While we already have the riscv,cbom-block-size
property, it only provides the block size for Zicbom operations.
Even though it's likely Zicboz and Zicbom will use the same size,
that's not required by the specification. Create another property
specifically for Zicboz.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 001931d526ec..f24cf9601c6e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -72,6 +72,11 @@ properties:
     description:
       The blocksize in bytes for the Zicbom cache operations.
 
+  riscv,cboz-block-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The blocksize in bytes for the Zicboz cache operations.
+
   riscv,isa:
     description:
       Identifies the specific RISC-V instruction set architecture
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
