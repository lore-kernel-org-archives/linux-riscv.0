Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97AE92710
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hD2j6JGO2B+Uvs1U3gUYw9mxLdF5jaIOw14hq4kuCHg=; b=Wiz2shRtEMhBO9
	VWb8q9fQJ20ZF6bonIF1PssTHoIPhs7ZU/Wy36LuPoHPkNTB2+b7cM4f53IbRRo6D4pocIBHSO+1v
	EgJ2UCeoSOqFatnAHTg0e07icD3ffpoXlZlKqxcZujihBT9UDJju4NK4OzSva/ENO3Ja8qo/z+Q+U
	i0KiPW4HvWH0YIuCOJISvkXIS5O07c2g+/TkDeCzLLlwJqLbTOaQlQBNM2KM04d7ipJaqVPUk6fQh
	yDUPOuXG8xJRNrmIrV24/X+XjoKGy3SrdL2vss/dogun11iwavFwZbQwvXY0rzX2II5kkiL1o6gWW
	xx3FBR2vGq/4BEZBaHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZa84-00000002ATf-0Ggd;
	Sat, 27 Dec 2025 19:39:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZa81-00000002ASy-1O77
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 19:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 474DC44173;
	Sat, 27 Dec 2025 19:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1827C4CEFB;
	Sat, 27 Dec 2025 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766864344;
	bh=5UfU9wK/UiZIrl88vtYC0Bz1Q47olwIt+/+4hqtNt34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyrU8F5ZzWWmPIpdjmw0aVcqJiF+u/bG5HdWZK6Kkc9E5GwCznMLSEVeqvr6Gtl6S
	 6Kth5oylNBE5owYyN43ACifqVGOUPewH3ozWBjJ4N0Wbgc0sXNiCiI0n3837FvigG8
	 bZozZUjbBV7klvMNJs3XCrheOPKfSAI/KjGhqfkhRKeGRPiBygtf1UsRpSTmcKLnY+
	 O1T4qlWhdyWWZRMK5H/ca4puTDtKoyodzvSNFT36Zym9a2gh6JOnmJA9okL4sFCc2P
	 EZlCDFQ3fh//+eTVHjnECSvUTDXf/cLCgTjZG/1xoyezGMTPliW8FaSAh1YlT85SMx
	 euTe352qzt0Wg==
Date: Sat, 27 Dec 2025 20:38:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <bjbt6gqnqtorlrft2oezr6mxuyywhebdmlnidtqlpf3qputojm@hkdp5a7boozb>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_113905_388144_1A6366F1 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi Troy,

On Fri, Dec 26, 2025 at 11:31:09AM +0800, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: replace i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1

Do we still have RnB and Tested by Aurelien here?

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
