Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CE1CA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2YO2b2FRJSMZ5VieGHqY+YPoAeqf6gdhW9tIvaIvgU=; b=ki6yejVFc8owsA
	xfMn/PFkUgL+Itnmg+u4L3WM11RwL3GETOjfTfAsu82Ef9EQMU48o4BZPtgGxNJPdGNfIop/7mOAJ
	pfeJ3Vq0Me0jsEASTo3Sq2GmdcjWwRJG/nC1zaZ31lJZz7yn8bW2nsLMw+xx3QKEJBgIQ0TttTIs2
	40+B6tHuqdW2Y4R73ouzV5DNptpUqrMSb4L1Ul4iomuOj2VgOGlOqSaKcuJkB5EECUsrx5MRw5ok7
	t2DnZw6wBaU4TmVTQhPNuKFlD/jSnI0jBwjbyM/3O5E+E7QLuVXvNwQM7ijIJY6v59bsAf9Y9/EFp
	9uMWFdDWCZ/+0xuywg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3cF-00000000emN-26XV;
	Tue, 06 Oct 2026 11:45:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3cE-00000000em4-19Ks
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 11:45:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1B944322D;
	Tue,  6 Oct 2026 11:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D0F1F000FF;
	Tue,  6 Oct 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791287149;
	bh=AHb+aEEMDegJdLzwVyM5oFwWM9z38LtHJ12r7De4yxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7kDSKvALCG2R70YxmgV1qFZe78g22cHn9sQQEur/eiWJmqB47/9RuoQ2iEmQNssL
	 DkFOmEGC3zazj0rtHo9cvEGty0ZaXaU7VtmTDT13JKtqyBS//XYMcQMcNePuR/2j/j
	 R/WPqE9g+zduWIWrsfAqFawskuYwXIJwkSKKInihix7UlbXE7O/lRDUNC6EZuo7FjR
	 6U0sA2ed20WJFXBQJcrcU1v2jGh8G5FE40QZkUEQvMCsFCytOWKql62jqNcUjuCTUj
	 ZdF5lAapzfUvssZqTzsKj/whaPo7AZVCDdzhgrfsDeyAFrq/PIRlcjbFBfdsGiyH4f
	 ZSDSZ1D47fenA==
Date: Tue, 6 Oct 2026 11:45:47 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Message-ID: <20261006114547-GKC2079@kernel.org>
References: <20261006100000.548264-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006100000.548264-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 18:00 Tue 06 Oct     , Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
> Assign it to Ethernet, with ethernet1 having a MAC offset of 1.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> Changes in v2:
>   Remove Ethernet alias changes.
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 6 +++++-
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
