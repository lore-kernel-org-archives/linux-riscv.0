Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8FFC10F16
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 21:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoN2hPX+/dyIFm40ls+5h2Z9N0o+/M2GYSKAuzNEffI=; b=1vpa1X84743ejx
	3y0u9kkDRZjD+qJLPq1uKZfcQcOIDLozpjtURz919r13P8WxdytnJ2Ih6r978ukTaskyFXlN6myWm
	mgHvkHlVuhX+T5RpyRErnEu5CYrMXb/GBem2iIeNHFUqqpp5pdtQBnwvjKm2R1dORxMTa5FXkEsKl
	OD9PqlSMW3y/uZDa8PPQQ5GC4R7voceCJTRhlLXxFcHDbhiwq5Ere5qglMNVzg5EoXuqwadBz0bUG
	hbQzMYcXeoJgjVDtU76NS8bjdQVqB3nCRYeiJzxFShsry7IhVGnzTfnWI2FZQoucpzN8Unrxpjb42
	X+Zy8qeldXInyQnaQPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1uvX-00000007xPS-2LdZ;
	Tue, 30 Apr 2024 21:22:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1uvO-00000007xO8-4AFd
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 21:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C4DCCE1178;
	Tue, 30 Apr 2024 21:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB05C2BBFC;
	Tue, 30 Apr 2024 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714512122;
	bh=SA4lSmJZlpSQQBaz8MKF3TBO91TlafTkr2Codb//v3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1fzzgaGOrgBkdnkUVqvvKluWHwt/VQQrJoCcOf0iI/xjQpzGA80ZhNA4QxC95E/0
	 VcNmpNK84bumleutblj8i+7bR81PqsbjQrujk2UZb1QTq+L1qDgHkyOtS+qcnQFsFs
	 msrqqEL2x5xvrCPlZVTTWjGhTxuk+QnPBQYXEhTXFwfKq4SM76QEHRIHSyPJRb07x0
	 zRSS4bYMNWhBU1yuUH5QqDMyhmEsVpGo7642wJADZoTChcyx3rVwH5yQ+aVsH8ZQAi
	 xDbB97wZwJfieEPW/ykl+2P7qYONvF0Uui3OEnOyHu5kb3IgZJ/cfDhmaWyUTJcEmS
	 cObp6xHJM5b/g==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] riscv: dts: starfive: add Milkv Mars board device tree
Date: Tue, 30 Apr 2024 22:20:22 +0100
Message-ID: <20240430-jailbird-stallion-590c4959ce32@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zZkBCon8/K1UdknQ9fZSRya8iFPQEnHbO+SPf4TXRI0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmGCVPzcxibteWtZWYZ7bvU/+dgwkP5+wmqkVsu3lmjo bNt34mqjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyEV5Phn4Hi/DqZV+eYPLp5 OoMdDnz7dO/PSbel5m13gllW7Ph1ZQLD/8yQ3Gezn55x/cYU8K13xWL2r1M/PpU82uq/0Pfc3Kq oVywA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_142210_708140_9A3F609F 
X-CRM114-Status: UNSURE (   7.52  )
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

On Mon, 29 Apr 2024 08:13:09 +0800, Jisheng Zhang wrote:
> The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> The board features:
> 
> - JH7110 SoC
> - 1/2/4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 3x USB 3.0 host port
> - 1x USB 2.0 host port
> - 1x M.2 E-Key
> - 1x eMMC slot
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 1x 1Gbps Ethernet port
> - 1x HDMI port
> - 1x 2-lane DSI and 1x 4-lane DSI
> - 1x 2-lane CSI
> 
> [...]

Applied to riscv-dt-for-next, thanks! I fixed up the nits of Emil's in
the merge commit.

[1/8] riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
      https://git.kernel.org/conor/c/5e7922abddd4
[2/8] dt-bindings: riscv: starfive: add Milkv Mars board
      https://git.kernel.org/conor/c/4c536aa462f1
[3/8] riscv: dts: starfive: visionfive 2: update sound and codec dt node name
      https://git.kernel.org/conor/c/b9a1481f259c
[4/8] riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
      https://git.kernel.org/conor/c/ffddddf4aa8d
[5/8] riscv: dts: starfive: visionfive 2: add tf cd-gpios
      https://git.kernel.org/conor/c/0ffce9d49abd
[6/8] riscv: dts: starfive: visionfive 2: add "disable-wp" for tfcard
      https://git.kernel.org/conor/c/07da6ddf510b
[7/8] riscv: dts: starfive: introduce a common board dtsi for jh7110 based boards
      https://git.kernel.org/conor/c/ac9a37e2d6b6
[8/8] riscv: dts: starfive: add Milkv Mars board device tree
      https://git.kernel.org/conor/c/9276badd9d03

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
