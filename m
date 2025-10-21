Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94558CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utFjiBCUsL743TQ1tokmwLYXcdaROFBMvrSrzchLfts=; b=4Lsex7G2qRlBpU
	F2C72O/eLrK7IUBNvAoWeVD79zLNZQQ7m8Fob1vcSom9p26aeWWMNvyd116rpRWeAm7iZ+wAnO6Sg
	f+1aMANIvKI6M1oJX/r/NJbp73HIXZN1LyMGeXAswFWQ08wRN/Cqlq+KdsoU47a6qKJDMRsy6N/tH
	kub5FZHpqJVfQ3Q/DOcErqwx0qIVCiFg8QGlaaoa9227AEtLItQUVep1fPX1Nf0fZCqIwfo+oAaxP
	oQRg9UVXNMn+2DUTd7PRbdbMwHyjs2wGlJzRsSBnA/LgDUl+3NC/GaHGCPe43Fu6zT5vcUQfAsctb
	/gYbb/zlh9xzRkPSTcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCTN-0000000HA1J-0Ey3;
	Tue, 21 Oct 2025 13:32:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCTL-0000000HA0s-31VR
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 13:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD74C6035B;
	Tue, 21 Oct 2025 13:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8D1C4CEF1;
	Tue, 21 Oct 2025 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761053524;
	bh=nyuiyacr165FLqxyWKt1B4gvgh4RzY/Ij1hXstDErIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cil8iBtA/atoolDBeOsa4U9BKo1ptHWOAXfTcEX6czp1OYcyYe3FnYKwM4/oxkR2R
	 dSLthkOzJaOdujRm2PUgDWgMFkOUiQqQ8fK9apV8sf/ae00SHABN2XIlK8MDNk+1bD
	 5lKJ7sIi6pMd0+oMBVfvuhkmGT4oGxIP59P2jD1Q93wbZHx8HjnIDatzhsoJ9EW56z
	 HzXW5VLv0n5Nbat7KvmLT74fqrR33YWgmiCqAePyIc9IiwGxzC6uSilvrN6wmRqNdw
	 ORe2T5RsCIZLmK31YgJiu/AjUlpPY8R5WMQm0bt4JcYjydmzKELDLmHT5OIFkFk+qH
	 8QtMEigusE5Hw==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/9] Redo PolarFire SoC's mailbox/clock devicestrees and related code
Date: Tue, 21 Oct 2025 14:31:29 +0100
Message-ID: <20251021-ranked-attendee-8caed80461b2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zvlQ9UDW5VIJo68sV6XLu9TdJq0uO5RaIpr0pIhrGlg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnfuw06L5at+38rrWfu8afsV76WCMUoX4lrm9jUtfqY2 6uLW7qmd5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAimfoM/z37vjSa3JwhXCId rvtJ63+VqiCLSra9U2mIo0f7hc7wUwz/y9qblsk3b7iqXppjsnVu/Kvo7cukfl9XcrQ9udS7PGw uFwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 13 Oct 2025 18:45:32 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> In v5 the only real change is that I removed the attempt at a common
> implementation of regmap-based divider/gate clocks. The series hasn't
> managed to receive feedback on my approach in 2025, despite sending
> several revisions and bumps, and it is blocking support for both new
> drivers (gpio interrupt support, pinctrl and hwmon off the top of my
> head) and a new platform so I have decided to strip out the attempt at
> making something common in exchange for something that can be merged
> through the clk-microchip tree without relying on feedback from the
> clock maintainers.
> 
> [...]

Applied to riscv-soc-drivers-for-next, because the pinctrl series that
I am working on needs them.

[1/9] dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
      https://git.kernel.org/conor/c/feaa716adc51
[2/9] soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
      https://git.kernel.org/conor/c/5b59e62532fc

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
