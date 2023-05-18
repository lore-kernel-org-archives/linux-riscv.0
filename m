Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C1C7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AtHOqxA/hamg7HccbNEMniDPYL4L92Hyw5st9oITag=; b=j31PZj1DMoBXCP
	fXQNgsWWlEU5REVLvdV4WbEEHwP0WmwoYPxy1O9TrkHLuYaLx4lndbWIKjP6pJoeKovePJT6Q0bHv
	QOz5GFQscW6b21cN2PhBX12wdOk5uGM+d25XlyQzJYwly4+YyyTqXTkZy2GbAHGejUcf4Ri0G/UE8
	dKP0PIFBhdIvVAGo81tJpamyXWGS0ysPdT3sHJN1q2tJ+hmpDqyLqtdzqeSV3jC38k4Pnobcpbsd7
	tNNBNQmkg/1OgQAIimqhROTkDJKwPLMNWgkwPnmzE8ZQb7whqqwSqwgZOYHBXj8cNJmvD02B6nHVX
	h2qHIINIkT+y9gHW1ZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdl-00DJps-0d;
	Thu, 18 May 2023 15:34:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdi-00DJp2-1m
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CA196503E;
	Thu, 18 May 2023 15:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D3FC433A1;
	Thu, 18 May 2023 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424040;
	bh=8o3w2PNumfMmW1nsxUiJwSK+1Wm7LHqx/wBqf4PFRQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUPCod8nmuFnBbgzwj18nPIcjTiXQu7I1k69OCF5REnqW7VzJIiOiHKg/4CwGx5Gz
	 C086refVmixdfnGDGUXEccsOtrGlLURjLOe02aMuDMNmeZdAu999a0k0EeLYb++Ro0
	 Fh4BCqA7yo9rbf0O0INt0BRGWTdqM1bZy7yu0cabzvXog4JDImknRCe5jHnzt4lytZ
	 KanHpnCUPmbfWFXf2hav/+kZ51HIGuOSRDW9HgKAtLzTHU3kxRBUr0AAOvSqlaKk6G
	 wEa2xAdvIdoyYZ3Idna2IhUQVsKogjGrgkGtXx7MWOMVW/7zVvJB75fHeUthntzb4P
	 avLs2VGEGiJaQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 01/10] dt-bindings: vendor-prefixes: add bouffalolab
Date: Thu, 18 May 2023 23:22:35 +0800
Message-Id: <20230518152244.2178-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083402_624637_94C9D169 
X-CRM114-Status: UNSURE (   9.42  )
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

In the following commits, we will support bl808 SoC which is from
Bouffalo Lab Technology (Nanjing) Co., Ltd.

Add bouffalolab vendor prefix binding.

Link: https://en.bouffalolab.com/
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..3566346f2f9e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -200,6 +200,8 @@ patternProperties:
     description: BOE Technology Group Co., Ltd.
   "^bosch,.*":
     description: Bosch Sensortec GmbH
+  "^bouffalolab,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^boundary,.*":
     description: Boundary Devices Inc.
   "^brcm,.*":
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
