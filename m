Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E87C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIhIu0fNV/9ny80zr+KXuvg5Ye+t4quQQCZ9zjKsErk=; b=ayHXJ6i4bgmx5x
	ryOmmUqz0ylGi/+kV/UBJ89tPuaHliq4S2hCDQgiyFZQkz8tFezkSpyAXF3HQKvEkcjha2zPQTRyB
	efE6eVXgqJftg/aZz97159V72RTFVzDf8vJjgGyCZOsnWOlMOhh8RzKC5tOoZf4OMj9lxnusJ2Ys3
	9IFM0T+pr4bLeU0trLOqeOm1S8RDgMmwBBcvjk+qkOqE/lrrmORhQ8vB3+sj2txaEndyios1H5Mgv
	UIRG7jGdR0lSsukn5yWX+ix7G+zz2Lh7ofyHqCeyH5Zb8eDyfRhZi0X59ZYGNUpSzn70ZRP9vaymh
	9bISBwoyu3TSDbmL6Npw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog1r-00000005582-2Q6d;
	Tue, 28 Jul 2026 11:31:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog1q-0000000557w-2VnY
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:31:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F4A541E63;
	Tue, 28 Jul 2026 11:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6ED1F000E9;
	Tue, 28 Jul 2026 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238280;
	bh=/5/caRe3ZcVfEMk0Kh5LSH6IafAiN5eUy+1jfGZrCU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jJgQc7YeAN9KYM4G4ymJIKnpULPieJt8h9uDbLNYDlMW+eriAs3710n6Q67jOqJ44
	 Z+KQ6T2b7TFvyb87eOpj78cVTkVg43rYn2XF4LxyvApsNoIIGsUtA4wF80sMvZ57N+
	 SlR/J2bX19Hcfwtz7HTRRXSl83qS8xabn7AU0e4/SJeluqFO1KmXAyPwjMpbqdS/m4
	 lVjzXNomXLfowUWiE0/murGUaU3h+gSQERbU2LYTDTAbZLLZU3dCs7aTpa6VQHQee0
	 ZgdxkiR3Ha3jaw4zQU5S2Z3RBZXLA7Cylhsct/d+z1KLVoYyOKoAWNQK1wUnZtBISG
	 dI2K4B2/lNjEA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH v3 0/3] spacemit: k1: Add support for Banana Pi BPI-CM6 IO board
Date: Tue, 28 Jul 2026 11:31:11 +0000
Message-ID: <178523813343.622718.11560262898938675370.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
MIME-Version: 1.0
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


On Sun, 12 Jul 2026 12:00:00 +0800, Junhui Liu wrote:
> This adds initial support for the Banana Pi BPI-CM6 IO board. The
> BPI-CM6 is an industrial-grade RISC-V compute module powered by the
> SpacemiT K1 SoC, featuring board-to-board connectors similar to the
> Raspberry Pi CM4 form factor. For evaluation and development, the module
> is paired with a companion IO carrier board.
> 
> During the board bring-up, GPIO45 and GPIO46 were found to be used by
> the BPI-CM6 hardware as Ethernet PHY reset GPIOs, while the common K1
> GMAC pinctrl groups currently mux them as optional GMAC reference clock
> pins. Since the reference clock pins are not required on all K1 boards,
> the second patch separates them into independent pinctrl groups so board
> DTS files can select them only when the signal is actually wired.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=c5b108626dc5f21c34cf5119c6f5e0cd7561daa8
[2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=8270311d70fdf36bc8aab1e52b554e654a8839ff
[3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=46a8c01700ac21e1b83385df00aa0baa5d287b44

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
