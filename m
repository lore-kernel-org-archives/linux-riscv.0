Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64EC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UPrZsEjpF4m6pSGdVlMo4d4TBBuPChBYmCWxWNbHDA=; b=KQ77YHUeVSwA0S
	rc0B3phwHRk0UGTG0PjTUNwqtTkdDdLTYhNPzU84HOC0igJwLYNHOSjRV6bZZGl/bjtnT1x07We4M
	9qRCJZ2P1aDnxET91yDa4mPC6IR6f1vSm9nrMPGslHS2qFYdToaheCrDY3q8h8NyGRLv6JyzFcYTo
	51VvRI0J2L6ziTSyP2ThQZjIMMdSsMn5mrBSi8ZPMhto/MxuR85hTNE9E9y+159A9RRbwiQtNLX9Z
	/7JQVt0pXr0Kr1ivoOMpb7QDhPjIOeYHesuIPVEN5afTnzQZGy5fr2OldvPQOarjaGRx8thvJojLJ
	5rRKkRwcsu1ovtlZXr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaeZi-009phI-33;
	Mon, 28 Aug 2023 15:54:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaeZg-009pgq-1A
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 15:54:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAA5264C3E;
	Mon, 28 Aug 2023 15:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EE0C433C8;
	Mon, 28 Aug 2023 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693238083;
	bh=nc0qzwIFscesr+jhjizS1csWKtvqucQhTPIvVv0yCNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqo4dqTkheQ57bIjoRm4EDEsm60flIkLPRlkL4m3arCQtljzotXyyz64EZsdBxw+o
	 AtC8W69czLydxAP4E75Di89rC+iDbI8hiuCOAkBIov3VP0gd5wTHfwjq4iM/iJeZml
	 3axOMEXbMmet1KIaUryeZn8HNmgN3MS6yZcgSXJXyuCoKK4sdm7x7aaIpSNpiAerhK
	 WsDWZ4Dg0hYw+ZMVxITjRMDtJetaJ+7PZN4jAJMz91pOxRnes9ljQj/Hi3Z6IMPFZq
	 co6Ga/F4jk5emwuRBP9QWa3pu3vMPAaU7Iuj71SWZ4mIg+9iUr4NdLrlcdskuYw6FG
	 dDQCZYRk2x9CA==
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>
Subject: Re: [PATCH] riscv: dts: starfive: fix NOR flash reserved-data partition size
Date: Mon, 28 Aug 2023 16:54:01 +0100
Message-Id: <20230828-muskiness-bling-923afe7f74d1@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230826182702.2641743-1-aurelien@aurel32.net>
References: <20230826182702.2641743-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5TpTanjxdc+sswZKM9KD/TG320PDN1crxZS4F/3TNmI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClvDou8Xm/5zcKgds93wfKb7zNi9WU2mWbsOrH3wtn3/ FzXLxk+6ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEnBIZGT4Hc4T1nBOO9jM1 m/OUZ/K84jh9wfzHnTq+P2xDlCKSzjEyzGlq8Hjonmy55PyvLbFujQcnbcvn+Z+qE7OHo+/QFtk ZTAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_085444_444726_F77CD7E1 
X-CRM114-Status: GOOD (  11.71  )
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

On Sat, 26 Aug 2023 20:27:02 +0200, Aurelien Jarno wrote:
> The Starfive VisionFive 2 has a 16MiB NOR flash, while the reserved-data
> partition is declared starting at address 0x600000 with a size of
> 0x1000000. This causes the kernel to output the following warning:
> 
> [   22.156589] mtd: partition "reserved-data" extends beyond the end of device "13010000.spi.0" -- size truncated to 0xa00000
> 
> It seems to be a confusion between the size of the partition and the end
> address. Fix that by specifying the right size.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: fix NOR flash reserved-data partition size
      https://git.kernel.org/conor/c/602afaaa6ef9

(I may end up rebasing after -rc1, so this hash isn't stable)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
