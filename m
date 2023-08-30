Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B64C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVK1puxobkwy/T4E+p+Zc/DAOGbbAUKdOL+sEBAt54E=; b=pr2tU6DLmdy3TS
	SRFHJIsbXuQHCpqOl1fRQVWPQNhx5vO4wYw/hW6lanY/8ShiuLaieUqQdEkXd7QRotjgEGmBQMCT5
	jIuIoVpirqskYYgOvbg8wXfTpkmADFDV4Pq81beMOAAUAb+2Kt9qhzB2PF/St/N3/taPVR1BGtwrA
	c9R/UBCZM2rnVIPGk594onQ3e1PGJIQV46nG0ssGMnw1t+TzYgeHJUU4sP2tqhDo3vcijcHVzh9Yc
	mtlt/+YEuphGdoUHRl/DPXng8ZMrjGmgt6XeoHAxqnif+dpjPrF32O+x5ZOhARohir1lP1VfY4K/F
	JRFhcrOXfqjvSB8DrSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRps-00E8hJ-1H;
	Wed, 30 Aug 2023 20:30:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpj-00E8c6-3A
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:30:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 52230CE1F15;
	Wed, 30 Aug 2023 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89475C433C8;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693427428;
	bh=eaCfLnmA3JpQc8qy3IH4/JNwVM/ECKPd09zxvvRnje4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r51f7mGIpgqDbBddHpKMqNotvCSAJsKBMa7QJPxcbOGiQvbKxAWe7Rj3T13B3mR4b
	 a8Gkzgru/hUJJgRQzw2ZKbWjTseJ3EJiBf/Lh1/R44DOkLSXVXyjyTZAqfqZfs7Bwg
	 ybM6vRUHMljQNkPbejOGv+qBKM5PaBnDHlON6F3mJ30Ttb85R53vVLcSX5B1E1e9Wq
	 t+oxO7qygLjXyqrW2cqqLpQLjfBEwCYsd2L1iFkleihOFw0YsCOrhifMJPWycRexWh
	 aChSNgRxV1CARDxi7v+P1Do35l1v8gdU5JT6Rnsni9HQRhJimmFgkLRKXxekQ9Pg8S
	 6q5J/QMo6TS/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D7A7E26D49;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v12 0/6] Add non-coherent DMA support for AX45MP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169342742844.1913.17058276691232129949.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 20:30:28 +0000
References: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de,
 conor.dooley@microchip.com, geert+renesas@glider.be, guoren@kernel.org,
 ajones@ventanamicro.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samuel@sholland.org, hch@infradead.org,
 emil.renner.berthing@canonical.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_133036_204234_24313B8E 
X-CRM114-Status: UNSURE (   9.38  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 18 Aug 2023 14:57:17 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> non-coherent DMA support for AX45MP
> ====================================
> 
> [...]

Here is the summary with links:
  - [v12,1/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
    https://git.kernel.org/riscv/c/93e0e2419b65
  - [v12,2/6] riscv: errata: Add Andes alternative ports
    https://git.kernel.org/riscv/c/f2863f30d1b0
  - [v12,3/6] riscv: mm: dma-noncoherent: nonstandard cache operations support
    https://git.kernel.org/riscv/c/30bc090f40f8
  - [v12,4/6] dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller
    https://git.kernel.org/riscv/c/555dd72bc06e
  - [v12,5/6] cache: Add L2 cache management for Andes AX45MP RISC-V core
    https://git.kernel.org/riscv/c/f508b0175578
  - [v12,6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
    https://git.kernel.org/riscv/c/ed1a8872ff83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
