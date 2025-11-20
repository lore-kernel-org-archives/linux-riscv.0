Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9507BCF8854
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLdpF4qHaXBgxFddJvyPUSZ220lxGbTtX0cdmaGP9GY=; b=4mUPhRW2Zc1N+0
	FYrMw/Quzu4bUfR2fYD9Wawfv9RqMUY0zCsTbj5TS/D4jOdlQjyQaG1J3/wC8qm4pAZaAN30eiCQP
	EoJ+Vth/ME9yPLLqx93gF2TWEJQtL2CS1Tke3r0hIpN93ShBWTmP7JdHmwwBTSldzv0MancIldYoW
	0/u8FHrynhnQ8mkq/1sE5gcQxp1D+LiaRkqpsYWkLM9JpKp8ZPY36VEBlkM8F+ogdchT9le2cC+Cf
	wv3fApB1Yb8C9mMyHlN68dciro6jI86reihPFojlOlRGItsEu3iGEvAM/2Bk3/4FXxyhc+LHj/P54
	qr7bmquoLAtzMOZ2Cwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Vc-00000006hoE-2MpX;
	Thu, 20 Nov 2025 13:15:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Vb-00000006hnC-1IRi
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Nov 2025 13:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b8ItwtQPZ+U2wdWw3yshcn6U9M8qjRN1D2faEOjV49M=; b=XIT7M2Ro9oe3LpduIm7sTTR28n
	OLabiGSFs1ZzgoYtpz0nY+QXqjNF3W4BY3uS0A/HbPvi5IkFQiEPJYoTDY4D0OuP7lteV1jdWdUMp
	3UUVIHYUI6VZy0ah/Bbn9vZvXqBnpaDBIPy4hKW/BEIkzLeCYVxEek5DaRi1uH7tkugLk+MxO0T38
	XYUWOMhvqRG0koiF3PZabyRXbVocWORVhPLtmwSTH0fUz+sp0HquDQz+HLRiFfhxcuuTm6AVwDjYi
	9g03G5CN1qwsIPS8lWIal9kQkKAiITAAFeN7mGKkY/4iI8xjxV++Ioy3Ehg+NFggpyg9mhoqtctmS
	yX8jdF6w==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3df-0000000EXhM-0ZW5
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 12:20:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 92595261B4;
	Thu, 20 Nov 2025 14:14:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6_Ke8QVFuIi; Thu, 20 Nov 2025 14:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644483; bh=lPgY6dsHs0ftyRYcHno/kV3MSLoEVVnLwK0wJnu14+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Joj8OKyWxN0/1QgaBGPpAu0q2QfuCtgo4VPqdvmTYVffn3wsn6Lk4kMfX3LjSOUkN
	 RxR+WZqZSrA8tYK6qXsVLQSLVY7dy8VYOVIwHsNmo/ES7vv/qi6hXgLl+IBXDz5Lot
	 MGz5qUBHsaDOdILbGd5gmd7cde0xjbJ5CFseSzRxLnwb23iw7T+yrdmK2J0TwWwbU3
	 HQp5PrM65mKQj2wO5HvGG+mULsDFDbnV0dpy6ViNedywMSjU4IrVWMTt8NHwUrrpRh
	 HfaUChRuhaHQfzePF2QQ7pIDtys0jTZVemjkrs8ezyl3tQB2wiH3XVi2k8908YuzHO
	 8HbUKJVrBSKdw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
Date: Thu, 20 Nov 2025 13:14:10 +0000
Message-ID: <20251120131416.26236-2-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_121956_408637_5C0FA11C 
X-CRM114-Status: UNSURE (   7.33  )
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

Add binding ID for C910 bus clock, which takes CLK_C910 as parent and is
essential for C910 cluster's operation.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 include/dt-bindings/clock/thead,th1520-clk-ap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
index 09a9aa7b3ab1..68b35cc61204 100644
--- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
+++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
@@ -93,6 +93,7 @@
 #define CLK_SRAM3		83
 #define CLK_PLL_GMAC_100M	84
 #define CLK_UART_SCLK		85
+#define CLK_C910_BUS		86
 
 /* VO clocks */
 #define CLK_AXI4_VO_ACLK		0
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
