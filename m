Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CCDC54FB3
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMbAVyLMw2af5p5GHCqoS1a/w6Kxz2CgTqd4RW3dvnM=; b=yGsldCVBWPMoNi
	XpRFPlrRL848UOHcgcgLqMbs7IUfGtDUz/a5gHEYCNpAckljYAinoe/DBS2Nr/XsXmG6V7TrFGloy
	gQ6FUwfsQH/Wtw84A80+uYJ2DLEyRanpJfQU+TeHxaIupHineWUU/gcbunvz/spoww6PchYYDv4Bp
	+cwH4VCcFpQfgJwG5Jmoxoqwlg6JXpImEKjwEm5o1hYZ0DfcyGspZCbjZ8G3PzxPhWZaGXVLAgcAN
	4gm1cxdzvSE37iAHHPZo1bgk+OS5Go894YBomzXQsmtmPbE34oLewsJoIdRg+tsGq1o0BFo7+J1aQ
	PqZKEx0OmSQXq0yM7/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIwDP-00000006HBr-0j1g;
	Sat, 24 May 2025 21:15:35 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIwDH-00000006H9D-3aYD
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 21:15:33 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250524211525euoutp018723cb8d0827af5c44bcf375bf19fee9~CkxVokoqP2968329683euoutp01C
	for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 21:15:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250524211525euoutp018723cb8d0827af5c44bcf375bf19fee9~CkxVokoqP2968329683euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748121325;
	bh=2NOPyMWTWiFmeUoJJtW57RkmSgf3zZf1wFf9qv0a94I=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=q1MW/LElhRmQeLtjGtbKEgXxrXQ9cqR5o72ZBRLnZ0aV9e5yDaQd9B3PIKbYMjKfA
	 I24PyLQhNE9eq6ScylTZoS4v1+o5o/BAlQXFZAqLIRet6BjtxGCWUcArs7rDjZ+oFe
	 3uzeS70dYogYU37DKjUULCqflLeJos7r/Jt2KARE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250524211524eucas1p27d56c24a9950a79086f8f4c7d5fa003f~CkxUTZEN02408724087eucas1p2q;
	Sat, 24 May 2025 21:15:24 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250524211522eusmtip2e428d2ec6420649127fc6ba7ffbeb63b~CkxTRe5te0676606766eusmtip2p;
	Sat, 24 May 2025 21:15:22 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 24 May 2025 23:14:58 +0200
Subject: [PATCH RFC 4/6] riscv: dts: thead: Add PWM controller node
MIME-Version: 1.0
Message-Id: <20250524-rust-next-pwm-working-fan-for-sending-v1-4-bdd2d5094ff7@samsung.com>
In-Reply-To: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Benno Lossin
	<benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <drew@pdp7.com>,  Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250524211524eucas1p27d56c24a9950a79086f8f4c7d5fa003f
X-Msg-Generator: CA
X-RootMTR: 20250524211524eucas1p27d56c24a9950a79086f8f4c7d5fa003f
X-EPHeader: CA
X-CMS-RootMailID: 20250524211524eucas1p27d56c24a9950a79086f8f4c7d5fa003f
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<CGME20250524211524eucas1p27d56c24a9950a79086f8f4c7d5fa003f@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_141529_339270_9ED95B50 
X-CRM114-Status: UNSURE (   7.78  )
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
index 527336417765d8470426f2985e1bc22eeafb31aa..f24e12d7259fabcfbdc2dfa966d759db06684ab4 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -482,6 +482,13 @@ uart2: serial@ffec010000 {
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
