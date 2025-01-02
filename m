Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4878E77198
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AfD3/LLK/LUQrnl+Av6U5hyJAJW76BVNNfqr9a1lw4=; b=KXZpqhU3MGK2wV
	anQ3143TvNM/EAYyrhnLgoibPvCxykdbHH7cictolAoQlS97eZ1TC0GNXOO0tA6LQ6CdTeEiHB0uc
	xs0s+yINjkB5s9PI3J6b1IuhCUfRauFWDlIk6fsCEA5Mf0MMzOiqV44bOy0Zjrg45tfz8xawttvO+
	YSCA9HMwBVMLRkoFpJa9lHMw/+heXarfi0GG3WNU3GNcPtP88SQcuyRr9ia/EwLNyFzt6UwV2TlLv
	lNQ+7TopEVkqA5JT45OPnH1WTt5K3NFlSH6wpOV6oY2+kDP4QVCM8Te6qytSoVDruGymryojHzJvZ
	zb9sE1TVYqj3pLND4rJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS4m-0000000BQFt-3jFZ;
	Thu, 02 Jan 2025 20:45:52 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS1G-0000000BPdi-2THM
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 20:42:15 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id EE03FB221E12;
	Thu,  2 Jan 2025 21:42:10 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [RFC PATCH v1 1/3] riscv: dts: starfive: jh7110: add timer node
Date: Thu,  2 Jan 2025 12:41:21 -0800
Message-ID: <20250102204137.423081-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102204137.423081-1-e@freeshell.de>
References: <20250102204137.423081-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124214_771764_91025E7A 
X-CRM114-Status: UNSURE (   6.79  )
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

no idea if this does anything useful; not needed for boot

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0d8339357bad..0bc922b3ae8a 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -344,6 +344,15 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells = <0>;
 	};
 
+	timer {
+		compatible = "riscv, timer";
+		interrupts-extended = <&cpu0_intc 5>,
+				      <&cpu1_intc 5>,
+				      <&cpu2_intc 5>,
+				      <&cpu3_intc 5>,
+				      <&cpu4_intc 5>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
