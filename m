Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62DDC71131
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOS4kcw59E2adnsVplQJsoldeHjBgnxqtCUPUWEmlHw=; b=hQP7GbM4dVOXaw
	2ioIiGZF+sVFwshFG2dP8in9rGNzLiU6A1+tSYQgjMDskYm1MrwELJe0msJsd8I1PhcGYmYAKx7L3
	VohxfVjAPQBBpDeMIUJ7YOinFb9Ke19VMeJGZgB44LdaE0iLbeoNjNxoztYvmp5olhEq/+QWyZdMd
	Yfi9e9ULxJD0+RB+mLmqnmzEFItRIVqHd+LF081EShRx2n8wZWwVprKY9euuSbH/cSuSaby6mfR25
	ErdU04QJVboSuSXYmsg4GfpDJkIkqZu/VmZrXPHuPtTR/Sd9q+VYbYXNw4u+xP0eBVLPcjtVLX7Pp
	4wYJpQ29zYm9PxD/+adA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0lU-00000007GpZ-3i4R;
	Tue, 10 Jun 2025 15:19:52 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyU0-00000006qb0-05Qx
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:53:42 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250610125338euoutp02dfe7e29e711796e9d5d9e280c16d653b~Hr5FK9LF42423124231euoutp02f
	for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 12:53:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250610125338euoutp02dfe7e29e711796e9d5d9e280c16d653b~Hr5FK9LF42423124231euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749560018;
	bh=tb9Nm7oCBfF8pKU9GqtVQRGVuCwKCYbxFHqowy9m/jM=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=clUIV76dl5UfTlFGzMX5zmGymOdPybEfb/LDHZ3K9+6hAx750wCnORyDENGxvi1VR
	 VUiqO2k2VPrHM/Ag3M8ek9z03opG/6HDn48M0L9H4mjX0r8pwkfAAheE+iXdL8Jd+l
	 6hV2p1fO6gH+gbaWW08pe1i73IiLcfNsgxBNIHQ4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125337eucas1p199f9e3199e73f1a92462f39e611f07fe~Hr5EApVaM0876108761eucas1p16;
	Tue, 10 Jun 2025 12:53:37 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125336eusmtip1090c51bf4f6eb899745cb3e8c08a627d~Hr5Cy3fPm0193101931eusmtip1B;
	Tue, 10 Jun 2025 12:53:36 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 10 Jun 2025 14:52:53 +0200
Subject: [PATCH v2 5/7] riscv: dts: thead: Add PWM controller node
MIME-Version: 1.0
Message-Id: <20250610-rust-next-pwm-working-fan-for-sending-v2-5-753e2955f110@samsung.com>
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,  Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>,  Marek Szyprowski <m.szyprowski@samsung.com>,  Benno
	Lossin <lossin@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250610125337eucas1p199f9e3199e73f1a92462f39e611f07fe
X-Msg-Generator: CA
X-RootMTR: 20250610125337eucas1p199f9e3199e73f1a92462f39e611f07fe
X-EPHeader: CA
X-CMS-RootMailID: 20250610125337eucas1p199f9e3199e73f1a92462f39e611f07fe
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125337eucas1p199f9e3199e73f1a92462f39e611f07fe@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_055340_342734_0D3F271E 
X-CRM114-Status: UNSURE (   8.36  )
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

Add the Device Tree node for the T-HEAD TH1520 SoC's PWM controller.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..26996422e1efe5d2dde68819c2cec1c3fa782a23 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -490,6 +490,13 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		pwm: pwm@ffec01c000 {
+			compatible = "thead,th1520-pwm";
+			reg = <0xff 0xec01c000 0x0 0x4000>;
+			clocks = <&clk CLK_PWM>;
+			#pwm-cells = <3>;
+		};
+
 		clk: clock-controller@ffef010000 {
 			compatible = "thead,th1520-clk-ap";
 			reg = <0xff 0xef010000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
