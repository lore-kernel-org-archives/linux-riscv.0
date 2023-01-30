Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D9EC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFNTae2+s2t2x/FpdZnYgWoKjBNTLVe57TcrHZdQ2YI=; b=OFoKIvzlhkASP/
	AswYza0cftE1wyeSDRl36rd7IP+0DODr+VfK87EYLDp9plfPI8N2d/8o6Sav/DyZDzpWv0Ps1e8dD
	yi+DKTnhRxNh+x5JYRbDjThyppnaYGGp2+jJIkDHEfq1oIPc/2GX/F+G4oCa2J7fyNfrx/z2RURiN
	60wnpaGZ9ULe3gvsQa+hQlmCx7JyRVNDkH62baEM/qN4CRjrHBTfK9DLAQgPyJ037pwUF+P2/mkdr
	XGK6sQFglrfr2BK2R0OAj6ku2gTNl8CZHoNQUzBYKv6YXKhoYWo0MuEBimHPReF8hWcgmk84kNewg
	MlUqB1/xw5U0xlOjd9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqw-003P9z-Rn; Mon, 30 Jan 2023 12:01:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqs-003P6q-FK
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:01:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t7so2468732wrp.5
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 04:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e++vOgbuAWNFQYdWiVuM3Vk2Ua01ISwg9MNr3hKY+MY=;
        b=jk/JOVCL7Ewijf0NpBIQ7xVXeUUP+aG2Ph/WCK3pda8l/66weX/yqVl6ZDCHvbnYAR
         K4z6M41fX6FdZEP8EIXIoj49iiC5O8szXvU818P0MY/0RluxMRnSxQMuV4whN4MmKGUn
         tyJJPXjUK7KBO8ICRVpsnuXxENVpAZS7Ivld2VBA8iNIfEIXCRLBDoH0YHuSerQk60Ep
         P2uaa3UIyR1AR1/ZWFi4uA5EbE++HAQLN9gjL9Wcpus+B15INAhJ4+zQS0Pyxz3B2lDX
         cgKbT3nJnvn+AWnbiM437l4EhftF3q+V/p+6sv9mCud4eUxmzQZVzM8wEu2Lr8UWa/KU
         Zwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e++vOgbuAWNFQYdWiVuM3Vk2Ua01ISwg9MNr3hKY+MY=;
        b=uXXDh6fDq4SVDUyVuSgcllUVoH3CmSyvkOne9wiPYmm5wtvcOnHkse3dIj2lH+b1Lz
         Li40HHZHCEhmQnd4scArs6pYbfIKDUyn3/mn4d1NaSEOJkF03R1c8WsBZzSP9QL39Eo3
         gBvRaz6UIiOUt5mHywjDlsc4379pnPhCQs0jFxK+4p0PFGOS7AjmPTQaKzhCIXbSgPv1
         kU6fxksS//GAuPELq+irTv1AXhCv+7z5T58HqSZ4R7JR39637rL4WRrp2GLmchWOEOhH
         BPhtx3FSzltj7uawGqgfR5XZ2CJ92U7PChd8ZS+VpbhwhbllB8xWewM7opjETb3cq83k
         nJnA==
X-Gm-Message-State: AO0yUKUlFp0uowi6QyhbREh9j5LAElYNbiMI7JSwfIrHpjhNDlf5KaPt
	PlYeljKMLNbeWdew8NpKYS5o5f/+BQeiKEDX
X-Google-Smtp-Source: AK7set8cyZszMHlnpDKH0ww2tBbRZVa8HiguPc+mMxHD1C1lFCyTZEsy3O0hYxR2hHvFRgsp2g5Agg==
X-Received: by 2002:adf:ed50:0:b0:2bf:b571:1f18 with SMTP id u16-20020adfed50000000b002bfb5711f18mr21064361wro.61.1675080093076;
        Mon, 30 Jan 2023 04:01:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a5-20020adfeec5000000b002bfae6b17d2sm11708916wrp.55.2023.01.30.04.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 04:01:32 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: riscv: Document cboz-block-size
Date: Mon, 30 Jan 2023 13:01:24 +0100
Message-Id: <20230130120128.1349464-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040134_529656_7A119ED5 
X-CRM114-Status: UNSURE (   9.12  )
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
that's not specified. Create another property specifically for
Zicboz.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6720764e765..f4ee70f8e1cf 100644
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
