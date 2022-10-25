Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98427C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5yDDM0zN0Kw9sdi7f6U365Y1nneF2p2gklaQDlKnRbo=; b=CrgFoWP3YjDZrN
	FRNIew+fWR5RTYbTCLvY9bKxF3GZ3sIrw+WNR1csQvLp+Bcw+/fgTwevCWJA0sCsGKhh/+H23184c
	lwqUhu700DZx3yh/erPHah5a6RvlV1xHRFFTvaHKpCKRyROVDLw+aWBD67xCIr/8K8J2w8T28VGWw
	AjmMUn6RL6WIUI9MNZGwUJYJhBzVcx7iLa5q+PQLfZGihLf2JmA2CSAspoXxztx7L25O6e1JEij0y
	RMDHl/5kIwChx3cfa0IXmG1V1IvUsN3BX2HJEa/ppQ+G5CL3PDHopHMQns1tnKECmsxjbmeVwhRY7
	AptHr3GMJ3z6c3VtWf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onQ30-0071Qo-7L; Tue, 25 Oct 2022 19:57:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onQ2y-0071Q5-DB
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 19:57:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 674FD61B0F;
	Tue, 25 Oct 2022 19:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A48C433D6;
	Tue, 25 Oct 2022 19:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666727830;
	bh=7XhSIz9hT5MjQIm4thSq4MY9Q3mxA3PJBkbPvWcrm1o=;
	h=From:To:Cc:Subject:Date:From;
	b=UVGraJNMazoS29PboYYzQEVitDlCfJWRSf61bqUBDIUeVG/JsnGEKHD2GL7hSe8E4
	 IW+mejsy9UnLpLMzAJjstzrBnDx1XJuRrU2UCwGURgpk3H14MlU/2Koh20wMBQkQ/u
	 OlLO8H3WhNEgPP5/4jnyJQUqOV0IFlpr3/cEt5aheo+c37ZEzeVfBtjKVq6RB6DERR
	 8q5Wy3DsT1g4fOZl9b8/0qUMyXUIADFCAnZDtp0jfVSrMcWNasQgcfvSfQyIHoGrze
	 R6Xt/kW/cIBDShj3gLollHkBVlLkPCR9wK44lWaWxF9SooLh/brrUKK9Fhjm3iAX/L
	 2r5rrfQ6ukE8Q==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: fix memory node unit address for icicle
Date: Tue, 25 Oct 2022 20:56:44 +0100
Message-Id: <20221025195643.1215890-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_125712_520787_0CFE643F 
X-CRM114-Status: GOOD (  12.15  )
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

Evidently I forgot to update the unit address for the 38-bit cached
memory node when I changed the address in the reg property..
Update it to match.

Fixes: 6c1193301791 ("riscv: dts: microchip: update memory configuration for v2022.10")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index ec7b7c2a3ce2..8ced67c3b00b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -37,7 +37,7 @@ ddrc_cache_lo: memory@80000000 {
 		status = "okay";
 	};
 
-	ddrc_cache_hi: memory@1000000000 {
+	ddrc_cache_hi: memory@1040000000 {
 		device_type = "memory";
 		reg = <0x10 0x40000000 0x0 0x40000000>;
 		status = "okay";
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
