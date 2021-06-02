Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D79DC47083
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 06:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD77F61359
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 06:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD77F61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZnh+4KZ/DuU60xjtoM/pXNl02j8UVXgtyDPZt1idN0=; b=YK8yzIiXG0O3ru
	dtcohf1Ga4+o3O7H4ReEfb1EVmN0jlQc2+wHE4JXnV/7Ngs+SgqJl4euZKwQS0EOEZyZzVQpM8Hut
	0T81XSKYV/CoickyKwLaI3nbf59a4NXhrIv9oDP1tYpNBvQfOLguOZizando3IlWgylUIkQ+5bAjh
	PnZ6QUOioJKOPjYTaiG4vWPU+Z3Y2V6uSbdeMALgEr5PSNM9feIEvg0Ve/XNHBUmyiTzFtIEpQ262
	ZVrivwxbY/dqsfgqCls2lgREOMrHFSX+66bPyOOfpY56Ia4nWvNxKDIHAN0O0EOkGXKubg8ta4u0+
	kXQ5wQGe69KKpYKf3Tfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKY5-0023WB-Eq; Wed, 02 Jun 2021 06:40:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKY3-0023Vi-U9
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 06:40:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C59261376;
 Wed,  2 Jun 2021 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622616015;
 bh=THlcYQ10VKSYG5Xv5F8H1EJpR36FH5uMYr88jsClAcg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hvu7itcOMD12Btn11AxxlfcYayJcZShNJP+Csz7hbhfb4yBepxOHKrGpeBit4o5YJ
 MMIz1FDKfwUeWP6sAggEEmQwdSCdVKpCeunD8KwqYqQ1sFkTowvw7UpI5EwUFKJUBD
 9QFcY8oeKK9d61b7BId9+Xd5RVefCc95093aLM+wF/kmfBqt5cwdVuUJZhirN4X/fn
 mtKKT5dQ4kkZyyFxZ0b1vf5BxweyyAATn3UUTmn5v3agD6ZWqcxYTTbmqQwMbOGBM1
 HrZrzlN5w+xV60yrCSHng9aUkMTqMWMJwUyweuO3qwta8x/yFrZ2asAlX5baHJQXLx
 2rXuhyfUMGB4g==
MIME-Version: 1.0
In-Reply-To: <20210601114154.3163327-1-yangyingliang@huawei.com>
References: <20210601114154.3163327-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] clk: analogbits: fix doc warning in wrpll-cln28hpc.c
From: Stephen Boyd <sboyd@kernel.org>
Cc: paul.walmsley@sifive.com, mturquette@baylibre.com
To: Yang Yingliang <yangyingliang@huawei.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 01 Jun 2021 23:40:14 -0700
Message-ID: <162261601448.4130789.18272149822674703279@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_234016_011118_EEB50CA3 
X-CRM114-Status: UNSURE (   4.55  )
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

Quoting Yang Yingliang (2021-06-01 04:41:54)
> Fix the following make W=1 warning:
> 
>   drivers/clk/analogbits/wrpll-cln28hpc.c:227: warning: expecting prototype for wrpll_configure(). Prototype was for wrpll_configure_for_rate() instead
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
