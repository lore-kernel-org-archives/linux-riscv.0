Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD30AC8303F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ft1G9VtjBQAh7JQjX5g3EHr8Iim0DB3f9vVQqYZbVsY=; b=X2uw3K6cbwsOAX
	gbQ/RomEqxCFZqzNz+A0T9M5ZY0/UDEPphlz7H9Ahcv++rFvUYEeo//E6rmd5GSrxIe/e3Wpfhxft
	YVu+MG7stgMK5DTkr9yKA6UX6AQ8tiZm1l2zIcJgGx7Y/WekcYC8LUhUct/8KF/Bqekv7e+ETw72A
	fYzudsXynwKv0YDp2QStc+pO1AD3BGxO78ehHIfBTZBItD0D2zIY1Os78RLUvfijxYzMuoqNT+o1o
	A2C22vpQqCuYCzaiz+nXfog6PVTfpOV7+eZ7iGEL8D1FvGb+PAx0r/1TNIG3UHU1WNSTEV1EbJwQw
	TG2j4zCsrG/mQKWAsIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzW-00000006Mwb-1RTZ;
	Tue, 01 Jul 2025 18:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdR1-00000005xrl-0FWj
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Jul 2025 16:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EDNXQZCXg+li71fh9CrBaFb+lseftTHxvblcVztr9Os=; b=IVl7Ypm7ruzpLQPW2M0TcTew15
	mbI8uQRd0R0PMPhQRYrf1emSKuzFTPsy10A0Qx31Fcwg0lAW4DD9jkkqiRPv2bPwmFyuk5Zq4CmYT
	BivqqWdKNp609lA9Fwmd1AzZNx8CDRvE4e+UhNa5Xr+gu7ch/fiHiZdv27s73fWE3uM3FBWgwp+sB
	h03tlO8rA4zx5+6I2rtifD5E+nLOyzNZK5+nJVlTC3OXhy0ezwmlOWY2LJUpyuM6kArAX33fzZ910
	mFsOVX6ohZVylloL+QONCRdKSh4HrWYUUNIyEspZumvsnxkUQYxiSL8jyWZ4ILMLZqZJZl7XtXU3j
	YuANLLhA==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQw-000000077F1-2NRu
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250701160207euoutp011be5c75242336db9fd13f4692fb6860b~OLAo09tTW0483504835euoutp01a
	for <linux-riscv@lists.infradead.org>; Tue,  1 Jul 2025 16:02:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250701160207euoutp011be5c75242336db9fd13f4692fb6860b~OLAo09tTW0483504835euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751385727;
	bh=EDNXQZCXg+li71fh9CrBaFb+lseftTHxvblcVztr9Os=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ui9YSReu1q6mVRq3Yd9Dx3N3qW/SI4HUOzHH4o64bHMLXZ8UV/pHCru0PnXABLsXB
	 4IYxkpHPQVc+C3Iq23BItFjuZVg7JRlZlMT6otDFdM+rypsWk9CAvGI+1O2De+G5Uq
	 NuXf6qykx8k8/QKbDsTb8TJdQgHzM8urzGy5mIlY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160206eucas1p1b4510b4dc09dc7193cac0e51db908784~OLAoVs1tA1059010590eucas1p1B;
	Tue,  1 Jul 2025 16:02:06 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160205eusmtip1c6b68af80f55a9e5dece39ee03782f75~OLAnLQcnF2454624546eusmtip1u;
	Tue,  1 Jul 2025 16:02:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 01 Jul 2025 18:01:44 +0200
Subject: [PATCH v6 7/8] riscv: dts: thead: Add PWM controller node
MIME-Version: 1.0
Message-Id: <20250701-rust-next-pwm-working-fan-for-sending-v6-7-2710932f6f6b@samsung.com>
In-Reply-To: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
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
	Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Benno
	Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250701160206eucas1p1b4510b4dc09dc7193cac0e51db908784
X-Msg-Generator: CA
X-RootMTR: 20250701160206eucas1p1b4510b4dc09dc7193cac0e51db908784
X-EPHeader: CA
X-CMS-RootMailID: 20250701160206eucas1p1b4510b4dc09dc7193cac0e51db908784
References: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
	<CGME20250701160206eucas1p1b4510b4dc09dc7193cac0e51db908784@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_170210_823948_3CAD12ED 
X-CRM114-Status: UNSURE (   8.65  )
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
