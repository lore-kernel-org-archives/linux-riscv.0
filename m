Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DB4C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvMI76JueeUMM0VaAshdn61Gae367D8SlD1uhuiWZds=; b=CfmLzDHUXZTEg3
	fz3jshtkljr3nngWKNz3sT4LLD1THtHOWZpkrbWYzQNZ8rFi6BRes8r0aOT735Aro0I3jMwhKedHK
	bSErWYabSqG96eY7xtPTJO7rYEMTvB/FkZz6fxe2EVqZwumF+Ybyk4lSByjePeMFEepa3p2k5OTtM
	+iKvH3cK00wY/t3yb15AjGiaX64fNnRQt4Co6uFU9P9DABm/oA8MIGMu9FGt3EWVfKyxfvceIYqjL
	NFl/u36epyiWvof0PPiy8/ND+ZcbExn4nsTyJ5XyRm97aehbrgCdtuX/qYdoL6ZI28RxrAxCXzYdn
	jBbOMGTfLD8ZFec2A6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMV9-00000007sW0-2v9p;
	Tue, 06 Feb 2024 14:32:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMV5-00000007sUT-3Dw6
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 14:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A521BCE1393;
	Tue,  6 Feb 2024 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A905EC433A6;
	Tue,  6 Feb 2024 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707229956;
	bh=et5rRptvkGz54dS+7a+fsl6EJMUrV2qa3AEGOsdAEDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iaD+yq5ZruiFRajM7YMGHPc08vRN62xdbsOlWGbncKdXd9Y0kW5yIoUvSqxvqWU0G
	 DtRmudIUIzt4M1k+hBzo4tebFxyJc2r8HJQXsTfp37p3XHJ8eyfRTEftjVhzf+9bnh
	 C2vT11JrIiqflalCujkazoXl8IoRq4ZniS969b+YDKes9/YWlHm0fzPo0gjzvrolB8
	 jUGR8zIMbBRT8y8AUbywGA5SNVzIaUdIrgQRNNQ1Pwewl5YgI228C/BsvE+O0oLoAJ
	 qhyLVAl12LupY9z8VksULiRIz9LaRu4Iuqm+lHRYnTMsnB9T+4peTzZB8ybhw/+VVJ
	 S/Gu/wBSSCbaQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] MPFS clock fixes required for correct CAN clock modeling
Date: Tue,  6 Feb 2024 14:27:31 +0000
Message-ID: <20240206-cloud-subduing-cb42cc496621@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hnKnUQMm2IjOwpyCk+YzqyIAY3kVJ7l3mv8OoK5FHck=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmHHC/9F6+WlmxxPu61ZmpR1NEDe7K/cHvbRwltUvp2b NtE53vMHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI92pGhl+uiQFJX799K4hb 8n9Vztpd6zgE2KMPBn5Zu7bg9rM1YUkM/x09FapepGZnvi+/ujzZXafzgkfXOXtvnajnIaZxG2Y eYgAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_063240_024387_A8DC9FB5 
X-CRM114-Status: GOOD (  13.45  )
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

On Mon, 22 Jan 2024 12:19:48 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While reviewing a CAN driver internally for MPFS [1], I realised
> that the modeling of the MSSPLL such that only one of its outputs could
> be used was not correct. The CAN controllers on MPFS take 2 input
> clocks - one that is the bus clock, acquired from the main MSSPLL and
> a second clock for the AHB interface to the result of the SoC.
> Currently the binding for the CAN controllers and the represetnation
> of the MSSPLL only allows for one of these clocks.
> Modify the binding and devicetree to expect two clocks and rework the
> main clock controller driver for MPFS such that it is capable of
> providing multiple outputs from the MSSPLL.
> 
> [...]

And this one is applied to riscv-dt-for-next. I don't think sending this
for the -rcs is needed as there's no impact until the CAN driver shows up.

[7/7] riscv: dts: microchip: add missing CAN bus clocks
      https://git.kernel.org/conor/c/6c7353836a91

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
