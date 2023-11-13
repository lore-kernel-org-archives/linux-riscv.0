Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2D4C072AB
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDSLn/H8n9N+hNIpQbttx05avH8H/Ryxy/Ni1Ki4C+I=; b=mJIot6wOuNlGAk
	6OHlSs89T2U9weZAik2OzsxA82b84BIIHnNF6/Lz5K+CTW1clzh/vKS/wRpVKDCvLjE0soJjaOhFi
	Y9a17BIOdfpP1YVW5QAqRj2kbEffV34LsyN6VLFzqrShBmmDbejxBc+NpwufkjwxUAoiH8BijHx3y
	FjqU7SkhO2NVtIUm9Ew/Eq4Pirizwwe+oXxzVTpRu1IbM/mdBMETQNs3FUCkmQRgFfi6/o/EkbfGI
	2kZ2iakC8nP+fLybPFJcQ55RWmoIbpJdOsPXVele3ooRMNhEZJZtQidmRiqiuJnSyuT/gBbKoVkBI
	MGNAw/SEGmOAMaRTIs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LSF-00Cy9D-04;
	Mon, 13 Nov 2023 01:09:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LSC-00Cy7V-0i
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1EB660C03;
	Mon, 13 Nov 2023 01:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E644C433C9;
	Mon, 13 Nov 2023 01:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837767;
	bh=L5ZkrNb3URDoBLVtQbTpXvk5/4TaeCMTB1Cqnnepk28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZyYsLd4xs9jlXvllEtYeTitkoWtKWg8X2W5zxDCxDHCUVMH4qKx+UipUETexTXk2z
	 TayIBz5QsWaigjp+EhQy+HnXdoPDE3iw2NbOp3lH72lFdyBrxQsTaWuDQgbg3g35f3
	 PBD5oHkiWz7PFkI40HvDDQUD/HMzHklTeLAQD+MaCHkGfYCw3R+UWJtQZeJyr9rOZ4
	 6mGSl+aYJdkCGnrP2fEiRPeFmjbIg9BPvsQBxl4CHlIJo86mwST/UqNu9952ffWi3y
	 B/8rfCJvcEFbclweKrcW4QfKO33pQx7kUQbntnsnJS3cgtg2t1BoUyERraYHRoDjmz
	 2wT/8FZdDQmjA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: dts: sophgo: set pinctrl for uart0
Date: Mon, 13 Nov 2023 08:57:02 +0800
Message-Id: <20231113005702.2467-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231113005702.2467-1-jszhang@kernel.org>
References: <20231113005702.2467-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170928_297204_32F286D4 
X-CRM114-Status: UNSURE (   8.77  )
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

Although the mux function is uart by default, add it for
completeness.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 3af9e34b3bc7..cc10688908bc 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -33,6 +33,17 @@ &osc {
 	clock-frequency = <25000000>;
 };
 
+&pinctrl0 {
+	uart0_pins: uart0-pins {
+		pinctrl-single,pins = <
+			0x24 MUX_M0 /* UART0_TX */
+			0x28 MUX_M0 /* UART0_RX */
+		>;
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
