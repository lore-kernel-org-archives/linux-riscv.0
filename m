Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97632EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 00:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ao+k55xjTfoZl4MWqT5Va4v4lKXo33wH3U76tW7OljU=; b=0/srdHivRDkmn2
	CdT67MbzX95o4KiheLBL6Q5IZ5QixWEDoX10npjpQJKDl4E13Yk1Mxliok42Fq7+PTG6LAnYjsvLb
	Tt3NB36FRqk7N2OnlSKzmbSfNTUVsTs2MbsnZEtZC78PpZ/cA2Sm/YTRF7c/bzh8R58izCjV7mBZh
	1ZyjsTavtkwxvUdpZQyNWNY1RDDaBZsLsFvmg3tDrVE8jLOCXQsVzJzdJ0GjQR8H3tPtqXdvEruSp
	oPN3ffNULAbu1kFbAy3QnXir4EoGAc4F5tF1OXFiMOANMWuzl+1H3cBb1dahQL9bcpo8X6QO2le63
	RKatJ/KmTTXT6iOsFn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9aj0-00D83G-03;
	Thu, 15 Jun 2023 00:20:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9aix-00D82n-0T
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 00:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 750F260DD7;
	Thu, 15 Jun 2023 00:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D401EC433C8;
	Thu, 15 Jun 2023 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686788425;
	bh=ozv6giPzGRmfPQuuB5WiAMIv+WoZnlC14A7qr+rfDI0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fNvwp91OD4u/aRRucVtnnzbLVjb8nGkhseyxYbrgGkqYJU1kUsrMKzJ+yWd/tTwdc
	 21uNiFAu6SEuJlQa6yFHT0JrOuy9te6VMWT0TwPsZ6ecCUXUOiVlPaEtx1t00KrEHr
	 tfltbesbpdcqI1ecgpPexmoSTZ1B0h+tiw0GteXedDxoFxATBt57StUL6c+knzyeXA
	 0jTPlQq0VloUkgH20At8N++y8FKGn46XPWH6lFzTxb2/cYEUZlva5uaOh33tjAwN3L
	 Tgkn9JASl5Xgj1BIDvNeqoX9omDBw0fHjFWVc4mJoR8IEh5/+8dJcaPw0hJd6oGLtU
	 6r6L/AJRq4pDg==
Message-ID: <3d583029c237b29deb49159a1a64d04f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230428070005.41192-1-yang.lee@linux.alibaba.com>
References: <20230428070005.41192-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] clk: sifive: Use devm_platform_ioremap_resource()
From: Stephen Boyd <sboyd@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Date: Wed, 14 Jun 2023 17:20:23 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_172027_685944_CE1142B6 
X-CRM114-Status: UNSURE (   6.60  )
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

Quoting Yang Li (2023-04-28 00:00:05)
> Convert platform_get_resource(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource(), as this is exactly what this
> function does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
