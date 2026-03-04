Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00503EFCE4B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 22:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/51jZasP1qVdumHHD0Ao//0N665it66gqyDajrScWZ0=; b=PlN//qzsw3Mi8c
	F5C594Lqeu30x36PAPInB0Cr88o8mdgN49y39Bt2BmoOy24ArLw8670SPBQmJ+XLW5IOo9QttHnzT
	/TgizKzJxhHsDJ7brAfXBLcyY1dV1C3CrmjlZZhAF8zLblNvbURFCoUECRLCJfuZOpB9MzRuye7+u
	cSAgoqjlQnik9SvKwESxI+Z2zv7u4uWykTBlOxo5l5tmcc3xbosDbTmZK8/+iVP9qKW+RsMjQl+yH
	oRPL/zjyu5F8Yta9gjCrif0jipWrfbcP6Pn27Ia7JuNAqfC7fDkY6oRdnl4siKAAWZKVieXh4JoWD
	d1HY7tgtu2kVhiu5/+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuLb-00000000Yby-1rjg;
	Wed, 04 Mar 2026 22:05:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuLa-00000000Ybr-3CFk
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 22:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96FDF600AE;
	Wed,  4 Mar 2026 22:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09F2C4CEF7;
	Wed,  4 Mar 2026 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772661937;
	bh=yTweHBHkCdS7zf1l+ISMq2/EQiGHtk/j5+I6y51gnTs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MbDYNSJ4yUTHVm5Ec0OTxCd0scI0+zUBtC7SnpebZ12E9ZXEiKuG80/dp/eN/cwj5
	 hDOfKQBI62whSUM1VF5WeM1C52c317Nyub4gf22LbJw7q65UnTaFwuUOdK8YpnpJSl
	 LK/V+Ll/LYRx5euZuHudSe00UbZSA9ZakCZy5oZp+nSOAFevRr9ErKALLFJx0GgoJd
	 spU5p6CZ+K5AqeI9egNXkGyy9BYXYXOXkz4Xl0+Ybckenp4WcnkdtFA4g2ZSKnwTxz
	 MV41dDCxWw2ZaOm9Hf9xVI/ONfsBKiY/IkGT8PTUoYa2KYiCp3naDPnXJgkuvL3v4L
	 bp3mTTAE2W33Q==
Date: Wed, 4 Mar 2026 14:05:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan
 <dlan@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] net: spacemit: Remove unused buff_addr
 fields
Message-ID: <20260304140535.678e65f2@kernel.org>
In-Reply-To: <02bbff3d-1f27-4b03-a963-660bbb7facee@lunn.ch>
References: <20260303-k1-ethernet-more-fixes-v1-0-0ab0122fdd14@iscas.ac.cn>
	<20260303-k1-ethernet-more-fixes-v1-1-0ab0122fdd14@iscas.ac.cn>
	<02bbff3d-1f27-4b03-a963-660bbb7facee@lunn.ch>
MIME-Version: 1.0
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

On Wed, 4 Mar 2026 21:57:57 +0100 Andrew Lunn wrote:
> On Tue, Mar 03, 2026 at 05:24:18PM +0800, Vivian Wang wrote:
> > These were never used. Just remove them.
> > 
> > Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")  
> 
> If you are giving a Fixes: tag, please use the net tree, not net-next.

Maybe rephrasing what Andrew said slightly - please read
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
and general documentation about Fixes tags. The tags mean there is
a bug which may be impacting users.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
