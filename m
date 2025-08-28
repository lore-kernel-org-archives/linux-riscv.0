Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3035CCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 19:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IcwtUKq5h5LZCG/kwq6YbvD4UPAt2GbHU0TLqMnsno=; b=UPdTMJr+LbWL84
	vggJf9IYua6wyPrMxu53xTXZYJfY8P7tFnSZcTvuLtfcsCNfTlcZyY/Pv54CmOkXAIHHLE/BYvtIn
	1UQTUhCK1eKxiuZvFM0W2QI/nlCzGrxw/SmRw85cumpZlDoAknT20JlaLt7PgnKhsMe++QqtP++2T
	hm4I7DXJcEp4h9AzEZWGTeK4/4DeoluyoZmaUdNU0LS3sKPzHGU2B22F4ZaGFmDW3oRqdIdDfxsMF
	CD0lpJLu3mee0/aUY8vwAJyUlcoXP3DVAopsf6ewYa0Q5v+wd6jk2bnyjSyi92n2QNYNPR79u/0hX
	JowY/GI7MUrr7xGQMlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhwM-00000002vdr-3r8a;
	Thu, 28 Aug 2025 19:05:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfGq-00000002Dna-2ZD4
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 16:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 984A3440CD;
	Thu, 28 Aug 2025 16:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACB2C4CEEB;
	Thu, 28 Aug 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756397679;
	bh=w1rDoj1PZWDUXnkCbbX4505cj5XQXh3XYYhIua+JY4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kLGzPffijHgVDUxrwLW3/YlgYKmtAS76fai3FmrIUOmJuxBhM1zYVidYHpBrXh6ef
	 nf66HjF46Fv/Xh8SUY8ZcstGj3s4LQ4v5kIfc0KusD3DyhXREn5u0QurksfkVQXqtM
	 1MX81ByN9aG5ex/YkQwwbHKLnEz9GX3rJdv3dl0RArPhx80/1WgVP0oGMU73clpj8o
	 qi0LH+q0s75ukxZRF2WdrHDshUf4S7GynGuvvvNrKRIfvYKKmpbdWbdn0ht2v4uBQO
	 jAGuSC37hAOL9C66ICpMB4W1XomOUfPJ+geY5gjAFRxdS9FQpfKFLiKx8lCjEE3JNW
	 YxFPiczUB4FTA==
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/5] Icicle Kit with prod device and Discovery Kit support
Date: Thu, 28 Aug 2025 17:14:30 +0100
Message-ID: <20250828-aloft-procurer-7316559f2e30@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NYXKvAfMqZtWqo/K3uDK7cV1jaCUvi3zYkj9bk8jQ2M=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBkbGtK/Rp5qVJzftyyi546iJt//vutOe59uSfjIxRfEN O/J8c+eHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIxklGhoV7vk70ujWlv+6C +KF9kSu6T+/eMqXBe9mc8htfu/9p9WUyMlx65dddU8AkMd+603Hzph9LVmQqdjZFdx28qp4YlrF tJgMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_091440_676381_A6EB0629 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 25 Aug 2025 17:19:47 +0100, Valentina Fernandez wrote:
> With the introduction of the Icicle Kit with the production device
> (MPFS250T) to the market, it's necessary to distinguish it from the
> engineering sample (-es) variant. This is because engineering samples
> cannot write to flash from the MSS, as noted in the PolarFire SoC
> FPGA ES errata.
> 
> This series adds a common board DTSI for the Icicle Kit, containing
> hardware shared by both the engineering sample and production
> versions, as well as a DTS for each Icicle Kit variant.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/5] riscv: dts: microchip: add common board dtsi for icicle kit variants
      https://git.kernel.org/conor/c/2a95aaa34dfe
[2/5] dt-bindings: riscv: microchip: document icicle kit with production device
      https://git.kernel.org/conor/c/4b9e63bb6491
[3/5] riscv: dts: microchip: add icicle kit with production device
      https://git.kernel.org/conor/c/1ba401aae7a1
[4/5] dt-bindings: riscv: microchip: document Discovery Kit
      https://git.kernel.org/conor/c/0d880b095a19
[5/5] riscv: dts: microchip: add a device tree for Discovery Kit
      https://git.kernel.org/conor/c/f66eb149b876

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
