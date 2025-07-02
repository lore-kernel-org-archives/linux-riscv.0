Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AC3C83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ft1G9VtjBQAh7JQjX5g3EHr8Iim0DB3f9vVQqYZbVsY=; b=hu57aW11UHv2eQ
	wUIkIxkSWgskcsSKPMjZCcZa8l926Ll0iNDKAKTRsK4GuCEN0oCW5WY+OuGy+uTvzd3JBzW2n/JiN
	Ac/vshBJ7vny1S1H3Q5dvwtuREceUp44y1ysGrky6TJRVGWXN4TYHPIFAHs+kbJ2tCGXDqvVlr+iw
	V14f/IkK4Alb5Csa49f0Nk9DgmWY9LfSzHXJSWY+bzR5j3oKM97FC75TdV1JmGnICYQcUIqIfwCZr
	xtjO5ck2fP35jCzqbkoa87BpPIGi8/fTmOxLzU+mZ2nCGXUtDOb4dB4CrVKvYF1yKV/lTdhh0OIvO
	qNJO+/wGClE7LLTN9rQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyoz-00000008ghh-2JK5;
	Wed, 02 Jul 2025 14:52:25 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqe-00000008War-28W1
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:50:06 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250702135003euoutp021c0a5f2cf3ef5c42aa28658fc4c0c916~Oc2nL8v632698626986euoutp02g
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 13:50:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250702135003euoutp021c0a5f2cf3ef5c42aa28658fc4c0c916~Oc2nL8v632698626986euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751464203;
	bh=EDNXQZCXg+li71fh9CrBaFb+lseftTHxvblcVztr9Os=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=lGuywoCXpdSvvedMzupaY2hQHDsFHGbqTxWSmpLR0YsJb2lBlLR60ihSlvZ6uNE0j
	 jbpBtJl6lSe+04vvP3NT5nAgDzJT4eMyqULPGfA9nJOp3djSA2oXnpKgrXm/BWA+I/
	 tP4TH67WsVFfvu8IKw40TClkwpAyxZ4hR1KRqxLw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702135002eucas1p29d0a0393fec6158a3ca158ea09b61cf1~Oc2mlA8a81336413364eucas1p2T;
	Wed,  2 Jul 2025 13:50:02 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702135001eusmtip24b7b2ee6f0620ec9a0a03a35109e9617~Oc2ldF4Hg1490714907eusmtip2Q;
	Wed,  2 Jul 2025 13:50:01 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 02 Jul 2025 15:45:35 +0200
Subject: [PATCH v7 7/8] riscv: dts: thead: Add PWM controller node
MIME-Version: 1.0
Message-Id: <20250702-rust-next-pwm-working-fan-for-sending-v7-7-67ef39ff1d29@samsung.com>
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>,
	Benno Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250702135002eucas1p29d0a0393fec6158a3ca158ea09b61cf1
X-Msg-Generator: CA
X-RootMTR: 20250702135002eucas1p29d0a0393fec6158a3ca158ea09b61cf1
X-EPHeader: CA
X-CMS-RootMailID: 20250702135002eucas1p29d0a0393fec6158a3ca158ea09b61cf1
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
	<CGME20250702135002eucas1p29d0a0393fec6158a3ca158ea09b61cf1@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_065004_804860_0511931C 
X-CRM114-Status: UNSURE (   8.96  )
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
index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..513dc6977b2633503515ad260913156fbe57d92f 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -493,6 +493,13 @@ uart2: serial@ffec010000 {
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
