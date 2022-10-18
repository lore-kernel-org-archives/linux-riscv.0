Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE80C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNeqJ18gdsRbeonfQu9edRs1ssgbbIWSmz7kTanj4qc=; b=vwpO7FuKIkGOPv
	azqsROPHWB4FcXKCOIlhJYy0Lsgv7Y3wm1z6hD4s+EfCPcLCt3raGf2KnNfPJi8Nz4dkNGaacmOTC
	to1DnRqVuyAumQVT2NX4BH7AE1X/gILod0ZNCwED8EOQUi4EHcN3vH0nW1+19z5T9/CS7YYvC9ZX6
	0B8RzG+VcQShL0sOfGvwgYaDOXRmyaE9fMG2ecpEvh5P1ZCOKfkfr6F2K6XA0j9LuIqlbZ98P3HVd
	902wcpNHfXiMb9ts81vLKyDIT/1XZ+IremriweruoxcRdq8dj/PUQb+OzPzqo2MtmGX8p+zGywmCh
	KHqk74FXra04PmkdIG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh8Q-003ra0-4c; Tue, 18 Oct 2022 07:35:34 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh8M-003rXM-Mg
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 07:35:32 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1okh8E-00GQYR-JA; Tue, 18 Oct 2022 08:35:23 +0100
Message-ID: <008889e0-965f-0031-78e4-aec6407e2b3a@codethink.co.uk>
Date: Tue, 18 Oct 2022 08:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 0/3] some fixes for sifive_ccache
Content-Language: en-GB
To: Yang Yingliang <yangyingliang@huawei.com>, linux-riscv@lists.infradead.org
Cc: yash.shah@sifive.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 conor@kernel.org
References: <20221018023149.1048176-1-yangyingliang@huawei.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20221018023149.1048176-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_003530_771938_F9FF8744 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 18/10/2022 03:31, Yang Yingliang wrote:
> Add missing iounmap()/free_irq()/of_node_put() in sifive_ccache_init().
> 
> v1 -> v2:
>    - Add review tag from Conor Dooley in patch #1 and #2.
>    - Add patch #3 to fix missing of_node_put().
> 
> Yang Yingliang (3):
>    soc: sifive: ccache: fix missing iounmap() in error path in
>      sifive_ccache_init()
>    soc: sifive: ccache: fix missing free_irq() in error path in
>      sifive_ccache_init()
>    soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init()
> 
>   drivers/soc/sifive/sifive_ccache.c | 33 ++++++++++++++++++++++--------
>   1 file changed, 25 insertions(+), 8 deletions(-)

i might get some time to test these, initial review looks fine.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
