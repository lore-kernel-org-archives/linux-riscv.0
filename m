Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D367C04E69
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwzkJdVXz2cuXsNVqxPq9KW0N9YiqM14iOl+HjUI6kA=; b=dsjqgqDyJ1Mxff
	Jy/ruvERyyXoJ86vAhUAO4PrvI6dQ99dWjk3iJ6RbLuXw1qIMiML8b+XIkdaQ9xOUO9sP8o7DW2+k
	c2MJvSVvMJlTY31ZBrETnmTvzx6kFV8e4ZrNJW9EoMN1QMJWynBMUh6PIYzpQNv9QGQbEqcXx+mNp
	BWtCzBFyfe8NlYsLj1hO5PxItgUAcM95IDye5E/ZgfVyZNBuYjkP5d5vtIAT7w58meRg6HBdOM9oB
	pkrwYmm17QsLQdDs6RIgeNY9vQQZb8Vqp/U13evSumBCNVqWS0hcQrD9ucj7zns3j9rTN4k+9uFgF
	qVpI7ZA7BupKuSnZnRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKtz-004l6M-0b;
	Wed, 16 Aug 2023 18:05:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKtw-004l5m-1V
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 18:05:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C581C6400E;
	Wed, 16 Aug 2023 18:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADBFC433C7;
	Wed, 16 Aug 2023 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692209147;
	bh=G2w7GTgTG5XZ0to/vVqlZUtxf/FFA2ugU3EJGGioMmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifS3Ug1L/U16RiXNRWKS22WhjbLYccpjzxlgMvY1AYK2r3SBob6ei/W4yrXFKOp1z
	 /XCWi6IrhynN11W0S4JKyNNdUdAWpkGkUdtOiFYbBzVyS2zxblhlRk8va7XC2Mzolu
	 LXKP1T1hq7MQAaLYX/+2WzoiSwCpIeXUgpQBwBcSk4RFVqSMdDIowrYISVqJvs65Wy
	 9gBDBU6FOLEPq0nuuIL4pYFP3s6g/UtSIWKmasE8wZxUFnKmQckOHbi9/sNvUmRJ38
	 2YfONuE+DPsK+lO2U53Ka9c+VDjWdljZMTrv+cH4BLGMpSxVE0YboZNEkonqTfTCBp
	 nAu/Ay4AQY4VQ==
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/2] riscv: Add BeagleV Ahead board support
Date: Wed, 16 Aug 2023 19:05:30 +0100
Message-Id: <20230816-embark-share-db89a121eade@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
References: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=738; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5RE+12/CDvB6PvGnDNxjPAxeCAzbOZQ4H91Fuc3Fl7M=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCl3+Z/3ZadY7Ypd+vSsyHm5x0ZHdAqeplveVVYTTr8/u 3fONo64jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwkegXDP+tjFroKtw1dvjCs PrR206olPKtjQ8/8LPbxeXfmU3jSveMM/zOvZGmWuP1Zl73m2fv/+vrPpwccvC/n07k7/HJuhsv Xl7wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_110548_545133_CC60E7C5 
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

On Fri, 11 Aug 2023 17:47:15 -0700, Drew Fustini wrote:
> The BeagleV Ahead single board computer [1] features the T-Head TH1520
> SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> minimal device tree file to support booting to a basic shell [3].
> 
> Changes since v2:
> - Drop the MAINTAINERS patch as it is not important and I want this
>   patch series to make it into the next PR
> - Add Conor's R-b
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] dt-bindings: riscv: Add BeagleV Ahead board compatibles
      https://git.kernel.org/conor/c/d19c10d5b95a
[2/2] riscv: dts: thead: add BeagleV Ahead board device tree
      https://git.kernel.org/conor/c/31ceedee8aa4

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
