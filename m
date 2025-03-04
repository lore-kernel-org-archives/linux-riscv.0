Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D1C282D6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Wyclocg4J64W5VSOoH2dDpUtzVEE1vok/3XQFOILAo=; b=UkpZRCYlSW2k80
	2lK0NmpY5fmZT/LQ8RKQSa/O7TeQ/LRRq0kRP/N6y187bcPC3jasTNoIYrjZwzpun66iBH0BCME/l
	++Lmff+1Mn1sE1W5TeevR4/LmfbNGrVLiWl7qe7tSWgXysei521HYMwNeKmaSo93jgPdt2JhhsKRG
	10vqYEukGWcyxosH4vP5lD1Q1tv+AzAmebQQeeXb5LkqWffpJd8CxQD4zLLpLjAyA98EetgkRf+kT
	iZq2sgAxERUSYcBYuyBjMTLPKF9OIdrK9dqsrddcB0GQrl3MERA/h6uss+7TH9X11/mcbJXz075Bn
	sJqtLrOAuj2226xiCjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUSR-00000005H1y-23Ni;
	Tue, 04 Mar 2025 15:45:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTw8-0000000594i-14VU
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 15:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D15375C5C93;
	Tue,  4 Mar 2025 15:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22280C4CEE5;
	Tue,  4 Mar 2025 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741101119;
	bh=4SIBqmrS42kkSMxCMQFChof+F0bMN3x2UOvDWptOUsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1RldajXPHDVDaV8FrXpmlawZekNo7rfjLrH+iZk48PdTNBRRGoGXlRiD1dMOmiOK
	 hdPWou5HpOvcLRH93nIoXnoYhrybdWjGDoYCEY6KjmM4THfuQMoeypD3sNZR50pLw3
	 hoDsuVH5UnLQ8II5S35z2YdM3BZzZT84eDNImYf/MQIiBXd4SuOtjuJda3Jn3pHocW
	 KaBXHJ0twf+ut9bhI+4tIH7Pfpsi4iTEx4VCI6WIuCQ8FpFOOiJSKVwWSaB2APzLFK
	 oTX5LqnYHQ8rSsOU8Rljk4c76OrwGylKiU8s1/2pdz4l2fXAEK1tjyxpkrT64br/a/
	 8THTVDr84zQXw==
Date: Tue, 4 Mar 2025 09:11:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-spi@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>, sophgo@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: add SG2044 SPI NOR controller
 driver
Message-ID: <174110111660.2625891.8370014258934747237.robh@kernel.org>
References: <20250304083548.10101-1-looong.bin@gmail.com>
 <20250304083548.10101-2-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304083548.10101-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071200_346527_AD85BD51 
X-CRM114-Status: UNSURE (   8.20  )
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


On Tue, 04 Mar 2025 16:35:42 +0800, Longbin Li wrote:
> Add SPI NOR driver for SG2044, including read, write operations.
> 
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> ---
>  .../bindings/spi/spi-sg2044-nor.yaml          | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
