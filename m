Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8630DCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XXtSBQ8brBjqdAPQJebpNbIIPB3Jk8zB1pG4arQ0txY=; b=3Q6fQ9F6KIaRIF
	CfLd2VMSDOO2KB8CAaxgRIQmdsCQ2rPNfywZiUR2JX0Lr8Rf2V/mhYJnYxxodgjhIQUwDYuAcxREU
	seqzTjmB8hKajhjbVrRGTsQ6TSsoyeehMnO72sU24cMeyZrL74UNQnw0nTN3RBpUOaehOPZGfd/Ui
	+CaNf5W2kC+XyqB3+gKmMlrvILeE9N87NcCc1tzsxlZTPn7kbzuGNn61y+BTG5wTLmBQwTIpuqYZK
	7fMqqOzh8HZ73PWVvTZVaJl5RtqCUwVB39eHxzdqGruImvLcvMihNRjKiIUj6yNKsI3hE04RDTegH
	gaTIKeniaqZAAnS2wORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrpG-000M1o-07;
	Thu, 12 Oct 2023 09:17:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrpC-000Lzt-1g
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 09:17:48 +0000
Date: Thu, 12 Oct 2023 11:17:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697102257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=WrpWweFctaGuqGTjzQmqJPAe/tzvOWQyUllY4p36/sU=;
	b=N6xO3EvIpHA7v2pMnc1xZ2MwWpT+J1hkZqjiu6u6jDDy4w/ba+h2IOG58SkcgyVHY42ZqF
	Si/11M+Owjl5DMiUFIoS3VLk5/0uWbcZ/LOD2Qma+8tHll/rtCO6LZ/Lt0bUG0TsXMndh+
	B+DFNuFI92Ew08DjzQx6YKiTcgZ1jbkLIfYTl+7AhGdWhs1wuk2KWW7uNnlekFQYS0ckC3
	Y/CCXBdd2CC2kab8s+GjFA794Mj1V/Uf/h/fN0QgssbRnHlknNR7yLxF1Hx3plSVU3/QM9
	sa8IUXcIM0URaned6yS74g7zcAd7yAUvUFR1ZHh5fDFiVxVl16TFEZdyROzljQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697102257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=WrpWweFctaGuqGTjzQmqJPAe/tzvOWQyUllY4p36/sU=;
	b=PeyuHQZhK5rfrboNA5NQ+J47gFzCvP+U5By4znwRCkm7RlCsYM5y9TLYwa4VWUXIfRcKpt
	p488rxrcanFZt2Aw==
From: Nam Cao <namcao@linutronix.de>
To: kernel@esmil.dk, conor@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	william.qiu@starfivetech.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: dts: starfive: visionfive 2: correct spi's ss pin
Message-ID: <20231012091729.3fzfDD1I@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021746_716018_B62F5D40 
X-CRM114-Status: UNSURE (   7.76  )
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

The ss pin of spi0 is the same as sck pin. According to the
visionfive 2 documentation, it should be pin 49 instead of 48.

Fixes: 74fb20c8f05d ("riscv: dts: starfive: Add spi node and pins configuration")
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: resend due to email problem

 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 12ebe9792356..2c02358abd71 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -431,7 +431,7 @@ GPOEN_ENABLE,
 		};
 
 		ss-pins {
-			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_FSS,
+			pinmux = <GPIOMUX(49, GPOUT_SYS_SPI0_FSS,
 					      GPOEN_ENABLE,
 					      GPI_SYS_SPI0_FSS)>;
 			bias-disable;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
