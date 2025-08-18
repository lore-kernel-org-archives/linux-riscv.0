Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9C6CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oIAB1/Xe1zeQ08ItUwGNhKrii+boVG0nrm4Jr8C6/Y=; b=EOPGFRiUWiny/U
	QLOd+TntiV/Wjhd86zvNy3sJ9OtRQBecFJ8xivFIZoxk4oVBhsxlTrLc1R+mU6CqZP+uCo8XR7jrn
	wnCSUdPwHmteMyxYfSS4mzWxR0rKPQ6vovFpaijA472KhgR+bkZQ3z5HVId0mBi9VF7yekx7czo4C
	lTCr3A3X25J1DhU9KgiVDsGeUs6F8b4RkIie5ui06RKy0vjq04UETi1QxVy8HKsJUWGf5X7LJq7C3
	yevWrhEel0K3hL1N1XbOKgDd6+tvcwOyW4RUAa855Qyf/M8mKlrhNzXiczmCcPDH4XBq2zEhSX38z
	1DaPuDgOg2BaU9S4qr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08e-00000007d6E-26Jw;
	Mon, 18 Aug 2025 13:43:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyw6-00000007KN0-3EL9
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 12:26:06 +0000
Received: from ofsar (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 84414340DB0;
	Mon, 18 Aug 2025 12:25:54 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Mon, 18 Aug 2025 20:25:36 +0800
Message-ID: <175551987874.16484.811796950493073575.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_052602_827438_C55225A7 
X-CRM114-Status: GOOD (  11.92  )
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


On Wed, 13 Aug 2025 11:22:38 +0200, Hendrik Hamerlinck wrote:
> This patchset adds initial device tree support for the OrangePi RV2 board.
> 
> The OrangePi RV2 [1] is described as using the Ky X1 SoC. Based on research
> and testing, it appears to be identical or very closely related to the
> SpacemiT K1 SoC [2], as suggested by the following:
> 
> - Similar integration in the Banana Pi kernel tree [3], which uses the
>   OrangePi RV2 and identifies it as the SpacemiT K1.
> - Comparison of the device tree code showing a match to the OrangePi RV2
>   Linux tree [4].
> - Locally tested the OrangePi RV2 with the SpacemiT K1 device tree,
>   confirming it boots and operates correctly.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
      https://github.com/spacemit-com/linux/commit/f10512e2c44e6ee3242314d43102acab7340e2d3
[2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
      https://github.com/spacemit-com/linux/commit/bab8dea259100a99e047fd11a48940b229d30031

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
