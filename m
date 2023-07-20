Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9014CEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3shaf+XRbexJPCDLX2pX3ZX0EL9Ll1T6L0jROD6i5A=; b=zoXjEkFPwUuH3P
	NyO8SNRuPaM7AJMZGn/Dg1veR6luTD1nGHId0vwV8Zv9zhgZSEIKaGnRiMbEgk+SXdlw1ps5orKIK
	GiRWia+EXnXw4W1eIrQU8mDyjLOZhcIxX8fGuwuNqL83wmwY0ubKLM76hMDG5d8WUFEZMJQ+QibC0
	gDOpZpHzcXEeicdenLyPL0dSCba4Qqq+k5xIIUgvgkZLxeWnCwOZm+gXaKnIN9zPFaeUi5TUdV5ga
	SNATOKngVPDQRjKPfKMgtvoOMjcuGXkisZZbPL3ITh5LjZp8xc5IPLWuVqohlD3TtHoZ6DpnbX+CE
	lW+UxOcKvIt6GJyCeNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWXV-00Bfjg-0j;
	Thu, 20 Jul 2023 16:30:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWXS-00Bfj9-3C
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 16:30:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A01761B8E;
	Thu, 20 Jul 2023 16:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB00EC433CB;
	Thu, 20 Jul 2023 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689870601;
	bh=pSklfHHYcqHyi4RyBg5CJnMHtj0gpqlgmMi2k7ABK6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bx1rRBq7nkBNIq8z7hCBxpjKB12bZ9JefMj6Lu9GRdq35jYv2QR9/PN8wLkVFLYQA
	 N4W8vHJBh43W5Aubz+5/iFxCWioXitG52h3Ep83COBJk1ZnPSgz15tHvKcoxqEdA78
	 XmPWKZAhgH9/hyIaQo2uTnp4w1pYXMS31GyyssbjYX4HnpgNZbv3FIqK5DOQPAmw32
	 AIm7nbnYJNMafpit8o3eyTnRGjSt08Jue/TXUi2GdoWSkh1oLYMPnCK6pwaWTnx60i
	 bfS/HphAUqlcyOJYKMTJOeYCHXbMHzPASRnAh1jHG27tbo+LchhS2Z1HplYfxi4Jc5
	 sKlSy9p/fVdqQ==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	Samin Guo <samin.guo@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
Date: Thu, 20 Jul 2023 17:29:49 +0100
Message-Id: <20230720-cardstock-annoying-27b3b19e980a@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714104521.18751-1-samin.guo@starfivetech.com>
References: <20230714104521.18751-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=759; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dbZGJNQzpf96UgKTgsx7DaoXenliAf7+9rkgIIDEu8A=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCk7E/5ILJl8yHqKiFdT38ele/Qmzv23K2ilcsqWfgctq 6LrG84/7yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEJm5hZHjYl5zcZznn+NaE mxFLBNSatrUfa1672ODINvfMrE1P7ZYzMsybuvV4Tv+hbU6lGVbfyhaHKX1/GO4qYDNz4+RiKxP fblYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_093003_074082_A66B96A1 
X-CRM114-Status: GOOD (  11.31  )
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

On Fri, 14 Jul 2023 18:45:19 +0800, Samin Guo wrote:
> This series adds ethernet nodes for StarFive JH7110 RISC-V SoC,
> and has been tested on StarFive VisionFive-2 v1.2A and v1.3B SBC boards.
> 
> The first patch adds ethernet nodes for jh7110 SoC, the second patch
> adds ethernet nodes for visionfive 2 SBCs.
> 
> This series relies on xingyu's syscon patch[1].
> For more information and support, you can visit RVspace wiki[2].
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: jh7110: Add ethernet device nodes
      https://git.kernel.org/conor/c/1ff166c97972
[2/2] riscv: dts: starfive: visionfive 2: Add configuration of gmac and phy
      https://git.kernel.org/conor/c/b15a73c358d1

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
