Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913C606A336
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iueyvnYa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mboLPc58
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SQtcuR95RGt7Mc9HaAO8My79WJbH46IzjFmjzaxkfUI=; b=iueyvnYanJOWZLtlCa5RB9hPjg
	4wYdrTpCfnk3sDe90XeXKVftcm2IV5BUt21gx6KsbnZr4UQ+IUwVZwVh0/G4oJg+O5fTbKmO6bEyt
	jT5Op778EuWjYLH3u1QsuJNue6KJ7h/MKnSc5oGsyhR+ip13m9Ywby3CP6VvkWyQFuM13SiJLaXwt
	aUcJf01FwrI1BujzeNrewCFATfStPPM1gbWrisV9uENDY8Xusf1lKm+2q/xFJ4ZDf5uxi1uI6vcq2
	rkB/uIEKpLQx+xM9NLbdcILX8QcPE1Lb4OSY3gSfwBqUsIB/H7Gsk9y0Gcy7c0Y7IkQj69wpZuf/o
	GqsuaSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZy4-00000007zWp-48Yw;
	Wed, 18 Nov 2026 07:20:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZy3-00000007zWA-2GgD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 07:20:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E2AB600B4;
	Wed, 18 Nov 2026 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FC61F000C4;
	Wed, 18 Nov 2026 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794986430;
	bh=lxx1A+zrwMot67CrXBF9WBlbfa11lGwCfKsvX/5BHN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mboLPc58hAAEuz7c1hMop3M67riiBc030zRMMnTF0p32VJzEF9mKK6xcnntUNIRaE
	 KID5Li5SumEH3GzeQPbVWUsQjIOzXr8YTreTI7sthCupAeyB7xEP9WREyHe6syoWrv
	 melivE07ruhJC/FDTKrwDl8rO547aILvOYIkeWjHwAbIgu2+Sr9pbF/1CrCMN10CTu
	 ngYonohFo5TwFWuTFxd6K7wAaE35mrZH9n8rPjgT36+LJFaM7+tggSZH6hmxZ/CsLk
	 hci0rSn0F4quihF1frlndN7z1TbnUH/UyNt2VdsgwoEwgpAvSoeH8tPqPzX6wJZZhu
	 aIUtaUUjq2cEQ==
Date: Wed, 18 Nov 2026 07:20:26 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/2] SpacemiT K3 use 8gb memory size on CoM260 and
 Pico-ITX
Message-ID: <20261118072026-GKB156369@kernel.org>
References: <20261115195112.32120-1-e@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11:50 Sun 15 Nov     , E Shattow wrote:
> Adjust from 16GiB to 8GiB memory size configuration on CoM260
> and Pico-ITX for compatibility with 8GiB/16GiB/32GiB configurations.
> 
> It is expected that the bootloader will read EEPROM TLV value for
> ID of the EEPROM part and adjust the device tree node accordingly.
> In the simple case where adjustment is not performed however, then
> the previous 16GiB range may overflow a 8GiB DRAM optioned board.
> 
> DeepComputing FML13v05 is sold in 16GiB/32GiB variants and not 8GiB
> so it remains as 16GiB configuration.
> 
> E Shattow (2):
>   riscv: dts: spacemit: k3: use com260 8gb memory configuration
>   riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration
> 
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
For the series, 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
