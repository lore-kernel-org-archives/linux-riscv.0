Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452BCC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iaDs6BJay6zCu/Dd2xNJZP1iNFtJFicAtW4Nd2LJIA=; b=WXDs3lju8gRlYl
	gwOcnjLN3OZIhjtfUtknleXf1lOOH+LxK/rbgTjPIu7srxmnilXtOQyO5nouLvGjuVkOaVPBjKJyS
	Z1cyLckIEqQieqc5W1s/FlKtwYxiPJfRF7kYv437WkDI7KPvL/qEuMzqqH50mXGBv5H6nYER8LOGb
	mtRd3D9qrm5LW3b2OXBjiMzbsOaE9Eh4UKaWxOyjUe4H7yghFjGgazbJu62eaEALvYHLUmGMC4sxD
	45dnUIgsIDIJOMmMbil8Uom/uUPKpRlNw2F6iYTG/kul/DjdZ9biNTYbqfRAMxVykkcu5jy1JIxEJ
	M+JZSAvY+GQ9JdPJTYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnDz-0000000F8E7-0sgf;
	Thu, 29 Feb 2024 20:41:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnDN-0000000F7sB-1HvS
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 20:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B48F56133B;
	Thu, 29 Feb 2024 20:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCEDC433F1;
	Thu, 29 Feb 2024 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709239272;
	bh=lDJ/WcAUElCfR9BHJ0p9gKCvoLwlAhMexx0r5bWWcn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D+zI7BpjWt3bAu2rSQ7RpMZvdJy7NEVKnrX+TSI4Y33jGY1jcDc780CPRWXe9Pu1F
	 9Wr5IUX1EnyrbfW/m7ILptwomULiLpAx82alljWVxHW6Q7BsQ1MFg7FRugaP8tOAW8
	 GEh9I7DVwLYo8oA2tR1q+VBbGUMm/jo8ExJUO9L7AItXtGcOR6BrIc0Nu7LucLenqj
	 +kPA/pLF2Na58sEGOKUzoQuLQ1VpuGSpSzZIQZKjHI3lAqx3Y5N/6o18EqKMefjUq1
	 nlfDnYRJbMEp8d14Wcs/oVGavmcxXey5aSdHxfMzBXI9i9E730nPmVUF9JnMibzdqJ
	 FANIzg1suIcDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 3/9] riscv: dts: sifive: add missing #interrupt-cells to pmic
Date: Thu, 29 Feb 2024 15:40:59 -0500
Message-ID: <20240229204107.2861780-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229204107.2861780-1-sashal@kernel.org>
References: <20240229204107.2861780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_124113_653052_23A4AFAA 
X-CRM114-Status: UNSURE (   7.18  )
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

[ Upstream commit ce6b6d1513965f500a05f3facf223fa01fd74920 ]

At W=2 dtc complains:
hifive-unmatched-a00.dts:120.10-238.4: Warning (interrupt_provider): /soc/i2c@10030000/pmic@58: Missing '#interrupt-cells' in interrupt provider

Add the missing property.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index b40990210fb50..3c621f31b5fd2 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -70,6 +70,7 @@ pmic@58 {
 		interrupt-parent = <&gpio>;
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		regulators {
 			vdd_bcore1: bcore1 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
