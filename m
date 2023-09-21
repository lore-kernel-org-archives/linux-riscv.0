Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A7E70703
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltg3TeMhdz9/WFipw/HOle/4ZHW4f07NX7IFb+d3zX8=; b=KiSLCCkX+0w/SG
	WpphUV1lCRSBXBJZeWyyi0qoiVqCahhUGdP/+b9fyPU5xYe/XuJ1t5u50+U4PK2kIZqW+6KXrRFex
	fX2FLZ8sEgu8y6Fwl4TxhD1uos2zkPESgBmgRU52PqjvhGXQoWHftLAcHsqlohGYpzW6I2aFlDh5C
	aA8+98Yd9HDc2BY9jUOMHQJaG/a0zwh6jvyeilkLD9ltRE8RUkH6sb0hPEDz4146rf8pickFc/RmH
	7t0tt3LYDtmizm1iIG4q7ja7NW+f8Ad315g3QvfTzguiBSi7OVBrMaBzfmRSwsSwz8kvXU4xIfGga
	iz1noJ/joalbR9oiCpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGRX-005eLQ-1B;
	Thu, 21 Sep 2023 09:57:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGRU-005eIz-1C
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:57:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B1A99CE21A5;
	Thu, 21 Sep 2023 09:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC456C3278A;
	Thu, 21 Sep 2023 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695290269;
	bh=5KNdnOObsbqqNv0Ck7putqp8mKyk6q4cq2D9IfjObjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEknRldC5k/AUNOd1X06anSHRhq9eYQoMlNQ2QDacbbnqR8cod0Niu7beVKSh0Yyb
	 AHO9Mmf/HxFfuvxQFlIr3O7aum0uC+pH5ysQEcjhN6yAgaN8DEltN8Xk6Z+t3edvr9
	 1LOPp3FKdrEq/nwzOPjIOdgMYkay8Pp9hx6wUzcG4fncTPIPR0zIOAe7FM+lIuMkmb
	 6CvZlfOX0LaHY6YgJOu2CP0D9Wb6C6OFWoz7x79pIKRfQ9yV2plOOF22sBalzDJl87
	 9uwdYTvAS17q2IuFMSVKNvA0DaJL8WLbROPZP3y7cXIc5BMYhUfFiKLiqumic5O2Y3
	 nVrZPZed2mqeQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC v1 4/6] riscv: dts: renesas: convert isa detection to new properties
Date: Thu, 21 Sep 2023 10:57:21 +0100
Message-ID: <20230921095723.26456-5-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921095723.26456-1-conor@kernel.org>
References: <20230921095723.26456-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_025752_581006_966CF945 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Convert the RZ/Five devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 6ec1c6f9a403..10399246dbac 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -24,6 +24,9 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			status = "okay";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			mmu-type = "riscv,sv39";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <0x40>;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
