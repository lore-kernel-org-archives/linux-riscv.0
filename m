Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBF5CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iHxIu81nmKS06kZ5K1uGVQKLkG7IGKd0Bfca4BbpHo=; b=PyXFmj/y+wfQfU
	vmFFxKHNz3+zPUgHFVSuGw8WdUBae4i0jyRrIew1rmvDW8VUFnG4Y0SEJViYJJtMyetLXTf+X5gAl
	n/Ltdg65DLpe48H2/koQPdCEwO2IPxRxEGh8CQftCUvtUh4pKRyrU6MesWW0wS/nBSmgX6TrB0xLW
	iD/cvhHCSXOcvsSwM2CYT6+ZR1KFM7RtWS3CsVfjxhjVPXaBZdVsmWbzjLIOnarQRsFFOUNLfQO1E
	AYh/FNxBlbzh5yBqsyicG9a0yzfPJ5RSyxhKL3yB3OsU8vJXJccUAk3ivWl3+zp2Nrf2IJVdLaXip
	n4GOIHCP7iSZlYR+yDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHx-0000000CVcM-0diQ;
	Mon, 11 May 2026 06:38:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHu-0000000CVbA-26YV
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:38:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so2656999a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481525; x=1779086325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=tNI2eJ5lKRCnUZ0igEKK9PJCNEeSlxmsBxvENgPI8dgqX4NS0nkJdYnt9fUI3Gugjn
         qrDLl2nmi+V2CiHYaPMQJ3qAaOsWEaVAR4RgpYULuf7L2siWCOocZDbyOsX6lfDl2NqC
         GNfJaNJ4vL3phZj2Bf9HO38SstKQ9QgqGsvRDZvEwwI5QnSxQVmprv+G/AjGcdCLG5Ey
         13nXFsOdc02swDJZyRw+2TV5cQa9WVjlC4cA02sVd2iojCn+P9ljEnv2/SH64LnuZTJW
         //2L9a7btRjL++VA4eWuTRF9BCPOP3GTmEpRav5LoSYsZoj/ZyZEqmc/qTymAZyQ8t57
         deHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481525; x=1779086325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=ZA1mVFtDPWlV7ed4GtRFW/vm9meGp3dCwX7m524Y2SE+LGQqs7IU0BuzRaCNW0kGn+
         JT4WC6UofeRSM1sU9v6cdgBXW6lwk7AjVh1MPVEfzu2ZPa46lXxXREnxvTI95cE19C2c
         /uNuxDGYNKDsNcsiEA9ZjuIJtgwlKRC6NHFCViYkt+1oy8M515kOxqCBuG6UXr7TkaxL
         hG2DLV5T2GMad5VPuCZ375YWVv0CR5c806B9/W9kHI4HS/QjhTZxZnufeStxoiLjPBdf
         4fOwideKL+YZ4ouRv8tQISxAWx5Pw8GniIIqJKxfKRl4Tn7BGbI0tC/B/2S2CgzJqXbV
         Ly1g==
X-Forwarded-Encrypted: i=1; AFNElJ9awPShwk0+oLqcQDO+Jp/fFcM1BuiBAJAwc99NtlcfVk9yJnuZ9OnqQ2sxMk/odDt+08jRay3/9lgCVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ZJQr6mDRytWZx2McNa7VsZEkYIiwV0i0A21Bhk/w9JlmcV70
	7ZIUykHmhdC88bByKBDT7nO2Jj2fFhW5HwraFSvfFa6yuxlEoUyEvPCz
X-Gm-Gg: Acq92OFgePfrA5/y+b90Bg7QPiEnyG8+vY3Xszv+BYzcPKmzXjwRs58Y62+24njb+3Z
	kySwqGjdzO2CuHmRASukkfhwoWaUaLeXIUHclSOaPTkdXC16B/bdMTeZjjTIhCQdqqZ34PZUKoO
	9At+4BaHElXlIFDkL8t9KApYC9NOekCAILf+HOGDtDLRDy+q1bd54BIIM/uUXYiQn2WvlxUZ1XV
	6AAjU1vfwZQZX7F2nR62UFh1b+wBGGkujYiUdnYSeEQkm9I9wATTfzicyEeBKMS+sGtJikPUMPO
	0UhknQ/hkUCZArngBipi8IyntaWDjsFYwop57L7oU4Z5xY2GL2M/vWzpaoUYpRwSKoNOQwB45ig
	2Q74qrgEjxM125bm4AfN6k0lUkhyGIVXgwPOatr4hoaQwF48zNHLE20Ey6mGRPrwSLzSad647RX
	dlmIXqGI8Z6jViUmI6Il3Etg1xOos/+svYKg==
X-Received: by 2002:a17:90a:2cc6:b0:365:fd4b:24ef with SMTP id 98e67ed59e1d1-365fd5a6b34mr13110423a91.8.1778481525495;
        Sun, 10 May 2026 23:38:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687a2a8sm6358472a91.15.2026.05.10.23.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
Date: Mon, 11 May 2026 14:38:16 +0800
Message-ID: <20260511063818.463877-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_233846_789894_2E78134C 
X-CRM114-Status: UNSURE (   9.79  )
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

The previous version of the binding change only add compatible
string without adding the fallback compatible, this breaks
backward compatibility. Add the needed fallback compatible to
fix this.

Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 804514732dbe..0a30a455b0ee 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -21,11 +21,12 @@ properties:
       - enum:
           - snps,axi-dma-1.01a
           - intel,kmb-axi-dma
-          - sophgo,cv1800b-axi-dma
           - starfive,jh7110-axi-dma
           - starfive,jh8100-axi-dma
       - items:
-          - const: altr,agilex5-axi-dma
+          - enum:
+              - altr,agilex5-axi-dma
+              - sophgo,cv1800b-axi-dma
           - const: snps,axi-dma-1.01a
 
   reg:
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
