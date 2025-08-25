Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432FCA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 22:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoS7l7u32OCej3dUXm89CZeD8eTkv7/TD0OlexovlGk=; b=tq1qquag0z/nZi
	5I3Xzq9PKgYSwkPAxjMO81F18SIApS+z7FeJ5Fo2dsgziYNLV4BAcBfOAZb69duCr3QttHGCVUnwt
	1MgeD/FLtS7w3wy4ueTDY4I62VqiCzLja5MCi3pmHn+vtTJLWbpTF172fSzC/Sm2EpY5KhXFmqFc3
	gnOHzo4mXmwjh7Heu2I44k1llEJoGTuLwHQUhihi2Eco21qzPqABPcQ9d02U88jV7YjbDuDei2ibv
	DUE0QOAXLmI/KaaOBjZTr3Wr90/Kz1XpGEGftPtIBxxvTn0zfPEz4jV7szg3RbIIfo8uEa2OyT4QC
	B8C0d6VMtkoxSwrm626w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfJr-00000009tF9-1Ynx;
	Mon, 25 Aug 2025 22:05:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfJp-00000009tDh-0pUV
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 22:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BB0D60240;
	Mon, 25 Aug 2025 22:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3303EC4CEED;
	Mon, 25 Aug 2025 22:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756159536;
	bh=9YkXdwlB5GBjp7h+4WxzI00sHRdEZGGpDcn2QNLkTvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ot/zAgHS5LlhOJdqyYklnsyF6dAc2C0UdY9bxCJ3bHtKyvDXvrN6yD0Qupmz0JmGd
	 /bewWPPDAIMoBqzA111jbQEjYRgalWlvUkE1uFQRWlML60FLf7THi0hmnI7UTQ57N2
	 Y4UDFdlY8kBgqkJf7iXZ7Knt0/9HBJDovHITZRWEaPfnnOGeqVlhRZ4XtEQ2CBw6Cq
	 yPD4wEaJ+vqS7EtI2zXH+NMT8V2U8kmoMV/aVTc86xvBOm8qWGMWauUVLhBt/Z58Yh
	 VbiEy64l3UVLLJcq07ztjmYfVdlBu7FcGRnt2lAjI0uLZRJ7WtqYyeKxAZF579xRYj
	 qFkFhvUh6DcSA==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v5 0/2] clk: spacemit: fix sspax_clk
Date: Tue, 26 Aug 2025 06:05:28 +0800
Message-ID: <175615931445.19771.17415403956670708422.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
References: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
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

From: Yixun Lan <dlan@gentoo.org>


On Mon, 11 Aug 2025 21:40:32 +0800, Troy Mitchell wrote:
> In the SpacemiT public document, when the FNCLKSEL field of
> the APBC_SSPAX_CLK_RST register is 7 (3'b111),
> which is a reserved value. And BIT3 of the same register is
> a reserved bit.
> 
> But the documentation is incorrect. In reality, the value 7 (3'b111)
> of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
> selected as the parent clock. Similarly, bit 3 is not reserved either.
> When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
> enabled as the parent clock.
> 
> [...]

Thanks, Applied to SpacemiT's SoC tree at "k1/clk-for-6.18" branch

[1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      https://github.com/spacemit-com/linux/commit/7d50d9bf1cd00d6bab0abf3b01d5d261aa6a2b04
[2/2] clk: spacemit: fix sspax_clk
      https://github.com/spacemit-com/linux/commit/c536e00d58dc8db3e1e430a8e6830bc22d2a38e3

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
