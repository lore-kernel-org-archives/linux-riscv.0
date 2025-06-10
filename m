Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE625C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtKMigewdC0HyyU3+/c+lIQki2y1rLevcRD2f0yr6ho=; b=d0fGD0F8bceHqX
	h+xhcNu7ZvjiZbtTeV6sa/yqOzcRCB0KgLoatBQt8xWn4xCJlwak/yRsbEcX7+0fcLQf8m4JyqdrQ
	1lO51Uusnxc5iYXw2AtxmCKJmcfoD03dKGv+yLud0zlqSlTjjQ5XjNoknhISYxYS7jO1UlTJl6tOA
	razJPi5cTwIYCIGnG0nZAUbq+7pvboWkhSwd3xJVnQwUAbnboAlDXkjWgLDmLKxIYRTTWIeJ5q6vC
	p+4wtrTRxSyc4aUhGhumqQCXPNi/6ChmgJ/LBFkoXlnYEBr1y70SIgnA8qbKLvR0HkHE9a89SGsJh
	oS4Xf4cZ7pO5rFmna7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0lW-00000007Gqz-21RH;
	Tue, 10 Jun 2025 15:19:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyUR-00000006qjV-3Ciu
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZbpbiGCkq+bc/Hnq9ouJryKcDkGL17+XHPFX3q85en0=; b=ed1Hp4E+B1oPa+Xp2m0anJoAEw
	1pDYDX7P79ouYpaUOPKNk23L1bxLgkrrZdE5AJUxeyaHp/7DVur1szhnvLh49kYTOSWn/dRE+9D25
	vsLJZ92v+eGTt2xsnbyORwg/SjWemg/l3KQN67mf1mz8sqiXQKRoYGIE8Ra8NPLlnbICgFZVTzr4G
	xLIEOOFBh7nNUX9GHkDen+9Bt1/NJ9+qV6jVXCnBsJyswTLZhyV4kEpjYl5FBy4tDROjdIc11cljD
	fKVjblmaC0oQ6YjYdy1ekipRWP2zL7IHiOHLe7Jf9nzs0+ic3PT5eqRjQ+OuNy0YHV68RjFIEPXVy
	nmcEcf5g==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyUJ-00000001pjx-0hWg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:54:07 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250610125339euoutp02c5f3579e24caa3f9ff2fff11636b10b9~Hr5F02Edh2549225492euoutp02u
	for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 12:53:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250610125339euoutp02c5f3579e24caa3f9ff2fff11636b10b9~Hr5F02Edh2549225492euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749560019;
	bh=ZbpbiGCkq+bc/Hnq9ouJryKcDkGL17+XHPFX3q85en0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=cIxLsqOlqL5smjQJhKfE0p2NtQhIqk3inVujlXCUMuuhc0FiluKcwfumEnVHq86I9
	 nCB43Po5eSGrmAcUZfDQ+dGL23bpz0ki0WtDNvwCLfm+Prhwrgp32hZxjX8OzppdED
	 uo8TVd1UG4nKIKt+CiXYEE2M0AzZWCHeiPj4IYcY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250610125338eucas1p2cc606517da2482af0a1cfdfb4b51b1c3~Hr5FQ-k451180711807eucas1p23;
	Tue, 10 Jun 2025 12:53:38 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125337eusmtip1d2797a7d750959ffd87abb5b2651733e~Hr5EFEfLP0363103631eusmtip1R;
	Tue, 10 Jun 2025 12:53:37 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 10 Jun 2025 14:52:54 +0200
Subject: [PATCH v2 6/7] riscv: dts: thead: Add PVT node
MIME-Version: 1.0
Message-Id: <20250610-rust-next-pwm-working-fan-for-sending-v2-6-753e2955f110@samsung.com>
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
X-CMS-MailID: 20250610125338eucas1p2cc606517da2482af0a1cfdfb4b51b1c3
X-Msg-Generator: CA
X-RootMTR: 20250610125338eucas1p2cc606517da2482af0a1cfdfb4b51b1c3
X-EPHeader: CA
X-CMS-RootMailID: 20250610125338eucas1p2cc606517da2482af0a1cfdfb4b51b1c3
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125338eucas1p2cc606517da2482af0a1cfdfb4b51b1c3@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_135401_519661_E23DFEDA 
X-CRM114-Status: UNSURE (   9.04  )
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

Add PVT DT node for thermal sensor.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 26996422e1efe5d2dde68819c2cec1c3fa782a23..bef30780034e06b07aa29b27b0225ea891a4b531 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -669,6 +669,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
 			thead,pad-group = <1>;
 		};
 
+		pvt: pvt@fffff4e000 {
+			compatible = "moortec,mr75203";
+			reg = <0xff 0xfff4e000 0x0 0x80>,
+			      <0xff 0xfff4e080 0x0 0x100>,
+			      <0xff 0xfff4e180 0x0 0x680>,
+			      <0xff 0xfff4e800 0x0 0x600>;
+			reg-names = "common", "ts", "pd", "vm";
+			clocks = <&aonsys_clk>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
