Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6F606A33B
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvFc50eT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CfLM0GXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wHT4XRm2ex4tk1DGVGhEmQXq+tifoXnp5cyqTQMwedg=; b=OvFc50eTHXZg6Rf8VARA0rOhaT
	Tulc9NG6LWxVHUdERo/YNjGon7uLinBMz7bRAfb1GATEAXaOdl/co7hbKTW5CTugmr9kbzpcb2Osz
	Jso+0f3nEqB+GHc1R8l7yfSQUJw+3zBaUZ2qiYJnEz5XP0R1+Kdsoijk3tAeyEZjoY3Zg1F6AkFF8
	2bxHlZykaY1fdLFoVahkD83SrmAWPy6XL1kgTQbX8GZ+X9vPUWMHflB7QVnsgWUHarCq2oPS1TViT
	pXIvvckMZHxhTerQy2qJWWyf4dl3XTMzfQznEk8ogDXn9aS6J83ee6NThZl/N8YQ6IhJLVw5Yb4HS
	6o1Zj5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVij-0000000EXcn-060r;
	Sun, 01 Nov 2026 13:35:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVih-0000000EXcJ-2tOw
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 13:35:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45C3A43E67;
	Sun,  1 Nov 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793540134;
	b=pAbl6c/aZndqwHIJdSc15zID/OQaKLfSKfit/mKmygZ5xuNzn7oPtSji4tabDCwQ4q6V
	 xOh+0Nva4bs+1HrdKIxsD+2xwtlKrbs+YhyDpv+E03g+P8hc56mOeZyfunSGSAZpQx2HY
	 eR3gmMDM82H5rCIGT+3ymNh+qA8eOKW57mV9966NyW92ooldxbVWjPIwlGGvppLso84yt
	 59rLohiiZdo5Vr25oQjJJgQvKGvKJ+hT1lNbGL7GedEbKPItLblZeL1/frxOL939iKVfi
	 hr3r+LRR9P67Zl8FPNUzvUlaODept3TgHX77xi1fl4Uz+dUHHX9RxVZAQ6Ffyk/wzEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793540134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C29ZPdzaGqojeCc4pTOnEkcylr/H9LFDLqxKZtmXdXE=;
	b=OhBiMOdzu81utvIOuoM9Tk26Yn0IXIgNSdPytZ7qc5hZ+TbkIeYcOeAPnC8LWzxZwghw
	 ZUraArxC7BZIEgghmLq1AzIFmw1abth2cIrgqdb4seiqryyQIPodd5SqeMbTLy1+neD8m
	 4HppZrQgQlRTo4ju55f7wCJLifci34W8FVdG4L+S/r6Zm/Gd85BySGwYehGYef8AihdAI
	 GaG6FeFWNjwL3AbAVVzGmiBOpbK27prSC503XWmwWKw9sJXqdALK8aTSJJTP8qMNhc9IE
	 QGZSPjL8gs6NJyMoTVhZ62nkGqtdOJb4RgbctgnNF6Z2k2jgTyH1DqKmn5LFPP5BjBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EDF81F00919;
	Sun,  1 Nov 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793540134;
	bh=C29ZPdzaGqojeCc4pTOnEkcylr/H9LFDLqxKZtmXdXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CfLM0GXcieb/s+I7z59aOk/mSqeI/h98ypBB+HM4fHPV+bKy4cAGanEfrwi4vfM1C
	 XRZUL0PoOCQKymv3eZ/k0vt6h/3ufKr4gqcI1dx1gNXJDlcVyUF2Hs1ZScPbzz0rES
	 /JIWeNy4nRfrg2Kr4kmu7dkwZvJZiyRv+0Fo1DYj77JRSg9Jk9pS0unvBceEhZKZJo
	 LLpuvqZd5ErMpvdbx1uGoS713tkX+ypHXViXE4YwwCHlyowvfJbhnuJJvNFJBPhClP
	 is7ZVVBHr7Ac5zHBmw85p+Mrh98HL8KMGvw4+ei6XRrjkdruErNSmCQ6bRzNeOE1JM
	 PaEjuW//8DTOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09AFD46184;
	Sun,  1 Nov 2026 13:35:33 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 01 Nov 2026 21:35:32 +0800
Subject: [PATCH 2/2] riscv: dts: sifive: describe the FU740 CLINT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-b4-sifive-fu740-clint-v1-2-b4821199a733@iscas.ac.cn>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793540132; l=1178;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=d3rzZls0cqTFkNEElM3IQdp538zpsQE9ZCcwM3Ar9d8=;
 b=VgwwKAKhpwKkDhsoklPzxpYsv3Qf7+RdkycFXMZtQWxKuA77DcBCy76O1SFhI0XXf0ltxj3fj
 mNcKhzZjk3dDRPE0VKh7UjmR/roJnYpyxmyjyOX9tGpfUOFLwcQH0xA
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

coreboot and U-Boot already describe the FU740 CLINT for OpenSBI,
but Linux's device tree is missing it. Add the node for all five harts.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 6150f3397bff9269767b190d961024a98b367ddc..4dd74c9a033e3ec6b1ff2706a9c0c11824ea4a07 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -179,6 +179,17 @@ soc {
 		#size-cells = <2>;
 		compatible = "simple-bus";
 		ranges;
+
+		clint: timer@2000000 {
+			compatible = "sifive,fu740-c000-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>;
+		};
+
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
 			#address-cells = <0>;

-- 
2.47.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
