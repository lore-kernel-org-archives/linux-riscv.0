Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C85BC982D9
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btuAM5vqhOabEoyFyl0IEq5wlXxrVsA61fs9yyeTcqs=; b=D8zLu/jQE+oT78
	vPMUDzPhKQHGCpWYfE6ZSiyAWN6i85NnLGohayIhePEU+89JQtfEk3vEzvyXQK60EBYmgUFACnBrl
	o1Mu4RRG7CPEmlfnjSUvaIAVNdtijlY3wyfcRG3sqKF4csZJ1aoBclnZnWn50WQUqxlFfy5YOC4FP
	4fPoZzfwLL6ifCvlg4Zt4NvOWG1RMG/32PKV3cSE8mcmGRHaIceHcaUQhe2Ray/RkwCqDJ1fljW36
	dPb9wbCAup7UGOLAME31FOWCl1oPP0qhgEAFlyQelqOcb1VzyRLkPhhgdvCRTxzuzGchZ3LNpT06d
	tTbvtL/silTyHYUSWeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UZP-0000000DtEa-23mI;
	Fri, 18 Sep 2026 09:07:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UZO-0000000DtER-0wwI
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 09:07:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4090F447A4;
	Fri, 18 Sep 2026 09:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A001F000FF;
	Fri, 18 Sep 2026 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722465;
	bh=dOVqpqan0xf3awI8+3T+cWwtyOXJou4D9LjGXtl8pC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HMaBZ9TEg+yhwwYqza+dLBctDcY80Ya7CW4bTCp6GIdirnqRLGpdGevy4KlJb6j/B
	 Lec1reZYQ3lh60CbH1aN526gyrZAhZhsBpVqqPCs+Co0lR2NYvHpSQjrF8COXH9K1B
	 u27qCUejlrqJxgVEC37/YW17DmqyxXO16mLZK9pI+7f0FE8nUNJiTt3asbm5kZv3OF
	 lRnDniAZcHOUaip1J1SP1eq5AQV3YmInHR6+QXsOamRvjYHl/vI6MARrzcwE06c+zk
	 h2Tr89/Rs49EggZgPTlPPQ856RlCWLDuX9FQ6gcBsSv8cV4KqHgYFQfLxiJu+u8dwW
	 ekrYR+wtSmzdA==
Date: Fri, 18 Sep 2026 11:07:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: k3: Add UFS support
Message-ID: <20260918-belligerent-succinct-kraken-7fa592@quoll>
References: <20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org>
 <20260916-08-k3-ufs-support-v5-3-1f5d71f1027d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916-08-k3-ufs-support-v5-3-1f5d71f1027d@kernel.org>
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

On Wed, Sep 16, 2026 at 02:59:55AM +0000, Yixun Lan wrote:
> Add UFS Host Controller support for SpacemiT K3 SoC, and enable
> it both on Pico-ITX and CoM260-IFX boards.
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 22 ++++++++++++++++++++++
>  3 files changed, 30 insertions(+)

Please do not combine DTS in UFS patchset, because it might end up taken
by SCSI/UFS folks and it should go via soc tree instead.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
