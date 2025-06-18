Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E72C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOS4kcw59E2adnsVplQJsoldeHjBgnxqtCUPUWEmlHw=; b=QpG0BN1uuXrWqz
	/2cFuNcIWJMH6KwbjZdxMQEjSPxLoobX9ptfzSMBDHDPQnKxlM57Rt0hkHchRcj1anzislpp0otv9
	cKGvC3VNhD5ALsX0dg1tFpp/qjSP79dgvH53LjHIu3WNIeEEl3owHc8+oPRq5m2AwuH5H0f1ZqGtc
	o13cGCWa5UG93OIKB2qUqCqTIkKeD1Yi0x7psnPdJ1vsCgX1AP9vc4gbqUowUdP5Q5xYEmMtbV+pi
	06yWV0VZYBlBfL/LJunArVV46N48BkXF/IXjEQQ7U74QMG1nDt0v389RdbQpfarTgvFGQCiUz+NgJ
	d+C7kroheWcO6v5JsW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt61-0000000ALLW-2tCI;
	Wed, 18 Jun 2025 13:44:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtl-0000000A7oG-2RtU
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:28:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618122812euoutp01b8500f3701d8a07ca90cd2eb183d1dae~KItJuMwL63005230052euoutp01h
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 12:28:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618122812euoutp01b8500f3701d8a07ca90cd2eb183d1dae~KItJuMwL63005230052euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750249692;
	bh=tb9Nm7oCBfF8pKU9GqtVQRGVuCwKCYbxFHqowy9m/jM=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=MOxoUbYogp9C3TJEqSz8dPleQ0LMuss1R1JhnkC+pSHI+fF1QxLQHkRaluvzuG3E/
	 L1YmfGTmm5AB7vm0+87Fnnd5K6XJQfFbrINbLyNbl4C+DRaIfUELVCbtZIeOgCz3Ar
	 EpWkuwStd5zP8xWy9dfvwrrhfVtucP592tngBc9E=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250618122810eucas1p1c9b264f565ab1cd47806fd39dd6a2ce6~KItIXlb6o2184521845eucas1p1h;
	Wed, 18 Jun 2025 12:28:10 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618122809eusmtip1e809f24b211b3bb5a542e4cebc3ed49a~KItHPxApJ2265422654eusmtip1Y;
	Wed, 18 Jun 2025 12:28:09 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 14:27:40 +0200
Subject: [PATCH v4 7/9] riscv: dts: thead: Add PWM controller node
MIME-Version: 1.0
Message-Id: <20250618-rust-next-pwm-working-fan-for-sending-v4-7-a6a28f2b6d8a@samsung.com>
In-Reply-To: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
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
X-CMS-MailID: 20250618122810eucas1p1c9b264f565ab1cd47806fd39dd6a2ce6
X-Msg-Generator: CA
X-RootMTR: 20250618122810eucas1p1c9b264f565ab1cd47806fd39dd6a2ce6
X-EPHeader: CA
X-CMS-RootMailID: 20250618122810eucas1p1c9b264f565ab1cd47806fd39dd6a2ce6
References: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
	<CGME20250618122810eucas1p1c9b264f565ab1cd47806fd39dd6a2ce6@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052813_882400_24DD9910 
X-CRM114-Status: UNSURE (   8.60  )
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
