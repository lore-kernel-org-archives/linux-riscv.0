Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C945BC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NoGnCyRHfzq2G+KQ9FAqZo07LReTSmWtypG7xZUCh10=; b=j4js8+mkSI3+vB
	yiEaJlylgSC09w1ItSNfLr/UqO53+bbI4f0o2dU0NMo/v833t9AEhVTWBQmPq95NqAVzJ+ViPM1kE
	B7DNZqz6tjx+DmiR/qKodF7lmT6pBk8RnthhifkyRI2eLnuw/LfTrMh8icdxAoUGTmXa7e8TDzX7k
	Oknan8hjcjTYxyxuTqtQnTUkl8Ktncw2JSBlWREJzM2Kkvml7rZZMRHySDhqJc1si8NNGsUEYSwhS
	913/KaXfLGOSZdM1SEDtFOLMGLHy6iiDbA4eiWFeJyo7vU3m+UV/rARJ+lgxM2RHdDDder7y87SNi
	IKXyYsTkP6puqop+Z3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFcS-002315-JQ; Mon, 06 Jun 2022 16:30:20 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFbx-0022jZ-1l
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 16:29:51 +0000
X-KPN-MessageId: 54269503-e5b5-11ec-8ee3-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 54269503-e5b5-11ec-8ee3-005056992ed3;
	Mon, 06 Jun 2022 18:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=t63OwfhftQBAyL+fD30q+bT1pNxqFcyfuKg2Jivjc+Q=;
	b=NnR5/jMNJy7fKwGLzBDJb+7vKGxpMv6unVQu+wRU6nzH03mDnN54TZX2zuFBwYfIgIZy9JVAnU86A
	 cNYoWSn+98xKLKM1s8yf0m/qTohHXKno0oZDU6xpzQ61gPoH84pLhrQkZlwYZpNV8H1UYiYN3FoLw/
	 FZe6Qpa3GMUp/iGw=
X-KPN-MID: 33|aL9PUIB7qkWLTPrS0P64JdvWC3henaHPZmFqEnNfYTMTLrlXAfey2k1eZRTcV/G
 JqPqfuq/HDP8UfyOKzoEunHjtNzJusZNnGI/gT7ZsFaE=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|A8jqBSxURq+ObuYB9ir+OR6sDf0y1Pyq+KNCzoUeVKU7xfk/lnYhgxDZOP/oTZ8
 NuID5OAQyQIEWmMoElTqImQ==
X-Originating-IP: 80.61.163.207
Received: from copland.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id ddb736f1-e5b5-11ec-961a-005056998788;
	Mon, 06 Jun 2022 18:29:41 +0200 (CEST)
From: Mark Kettenis <kettenis@openbsd.org>
To: kernel@esmil.dk,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mark Kettenis <kettenis@openbsd.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: startfive: currect number of external interrupts
Date: Mon,  6 Jun 2022 18:29:23 +0200
Message-Id: <20220606162924.71418-1-kettenis@openbsd.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_092949_563145_1A23F2B2 
X-CRM114-Status: GOOD (  10.64  )
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

The PLIC integrated on the Vic_U7_Core integrated on the StarFive
JH7100 SoC actually supports 133 external interrupts.  127 of these
are exposed to the outside world; the remainder are used by other
devices that are part of the core-complex such as the L2 cache
controller.  But all 133 interrupts are external interrupts as far
as the PLIC is concerned.  Fixing the property that specifies the
number of external interrupts allows the driver to manage these
additional interrupts, whch is important since the interrupts for
the L2 cache controller are enabled by default.

Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 69f22f9aad9d..f48e232a72a7 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -118,7 +118,7 @@ plic: interrupt-controller@c000000 {
 			interrupt-controller;
 			#address-cells = <0>;
 			#interrupt-cells = <1>;
-			riscv,ndev = <127>;
+			riscv,ndev = <133>;
 		};
 
 		clkgen: clock-controller@11800000 {
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
