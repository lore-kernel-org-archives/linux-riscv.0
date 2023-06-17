Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E257CEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPZETZh9Cl9Mf9oa5g7lsR2jqXsRU3HtOrMQx8aen+M=; b=td/sOwvHExhy3h
	STRN+iXa3hvp+sI4AAaoGf3Ck67cv4Q0gFByiKBi30692JnNMFZUAgxfWh4ek/GlI83iZxi/0chG4
	TgIBkt5w+2CK/lxkRzH1AOIUDzQ/q+cOA5SIwcPBhjqaJKEgr05MgVGLHBxqh4MTIv/U2YwvMpAwP
	1AyAiMRwWQNFEnsVbpDKnH/UHJtH0lgMX4JK9xdcM39JfB6F7y1MFL3SMEFQ9KoxH+cjv0EZRcT+E
	RTYU4XRfDLmotYtocaj0YDOKOinFH4CfKKqmc6hgSYlkuaNCEz2QRKJcwBCsV6CUBzTIiSpQ82nxI
	Q/AVtB9+RPspKxIvovwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAafQ-0046Wt-06;
	Sat, 17 Jun 2023 18:28:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAafN-0046W9-0P
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 18:28:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DB2D61046;
	Sat, 17 Jun 2023 18:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AB9C433C8;
	Sat, 17 Jun 2023 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687026531;
	bh=DIQI2aiPOqmTZwoXiyYS0cVloN0L8cK8fYmkEg4zs9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WbtOZGRdTYByXuA/REJfyXx5w/wO/ggga9iEtYL4FlGhkdYD9IR0H4E6NUxNkrDgR
	 rsaK5RzWLMnjH8LV5S+aG2k/AgWr4lfwxnQL55o1c4dknFXPZraGPHmMJ7wpYq9yXb
	 zqXffiTmgABgNuUuhcwmuMuvrgy3xYLcOTdGuEz6PSPGGDikE88cm8468FONj9cS6r
	 7jsKKW/UVHJC9TWYXdRY1KDOwXbZGte+pjj5G2f4kHlM9bfe6f2r019NTZq0nskG7g
	 50NNMxYoHNcdD4Fgy+9lzAwjcsRKC76/jJZnu9IBQV/E/ThbWCkW7GKY9ScI3B8leq
	 iYuIIgQ5WWf2Q==
From: Conor Dooley <conor@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	arnd@arndb.de
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Date: Sat, 17 Jun 2023 19:20:43 +0100
Message-Id: <20230617-duress-phantom-3da79e33f204@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NHJtQzxObh7bfZ36xoARCKxRiu8T393ZQ6X51ZnJ1sc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCm9PyvZw7o3PF+yaPuySV+rtoq+b54np7xvtYS5OGtYv kZInPnqjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEdSHDP+25u+fVud761HXA d+Oj61H11xLz9h0zNhHkfvaq7Yx1lx8jw8NWnVO1n96aPdoeUvtVzv3yqmP8b0yf+3448oiLy8J RlRsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_112853_237651_E68A3F87 
X-CRM114-Status: GOOD (  12.46  )
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

On Sun, 18 Jun 2023 00:15:21 +0800, Jisheng Zhang wrote:
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> tree files for the core module and the development board.
> 
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/8] dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
      https://git.kernel.org/conor/c/a04cc7391d88
[2/8] dt-bindings: timer: Add T-HEAD TH1520 clint
      https://git.kernel.org/conor/c/413c24b03f4e
[3/8] dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
      https://git.kernel.org/conor/c/89b0186ab532
[4/8] riscv: Add the T-HEAD SoC family Kconfig option
      https://git.kernel.org/conor/c/da47ce003963
[5/8] riscv: dts: add initial T-HEAD TH1520 SoC device tree
      https://git.kernel.org/conor/c/8e396880a864
[6/8] riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
      https://git.kernel.org/conor/c/5af4cb0c42c5
[7/8] MAINTAINERS: add entry for T-HEAD RISC-V SoC
      https://git.kernel.org/conor/c/1203f584fe66
[8/8] riscv: defconfig: enable T-HEAD SoC
      https://git.kernel.org/conor/c/318afa081204

I'll send it to Arnd as a "RISC-V Devicetrees for v6.5 Part 2" once it
has been in linux-next for a day or two.

Going forward, who is going to pick up the patches and send the PRs to
Arnd? I wrote a document that should be in v6.5 about SoC tree
submaintainer stuff that is worth reading:
https://lore.kernel.org/all/20230606-escapable-stuffed-7ca5033e7741@wendy/

I'll do it if nobody else is willing to, but I don't want to be
responsible for applying patches for all the platforms that pop up,
especially for ones that I don't even have the hardware for ;)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
