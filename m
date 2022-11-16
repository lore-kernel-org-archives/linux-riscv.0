Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F966C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ks/tPDdWEWRL8OMwzUzGsC7lk6qJmJLokgG5RVwy1U=; b=eiWO1pxsvlSDuU
	GMFVvhIZMXBtD8IzB285O5awhu4SiSjlpN31AXVnuLzkTwBzOlmzMQ8jJOXJIB/kd3mGB634UArQQ
	0lMzGYFX+qs0kI6jvaHHH6sk88/T5D9OGlelEH2sNmB1PEC2mWHuCCPAov4h2e9isjfoYqjrJncc5
	CX+/MeJIMeCzRPgdcWjcHGKX6fLJq9hXiYUnQoDv0C5+qR3mHwdq/mvMSzWfZPtKoWPw2LtaPbD85
	kCaRwCqC2dM01IlX5E8zT393+GZ9audviXedV93U0xtlVHKR7DIO1IzPRUkq8EqJ2rX97c6YqxR9G
	9pdOzKiCq7bmKwvrlfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovNE2-0070kv-QB; Wed, 16 Nov 2022 18:33:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovNDz-0070hw-P5
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 18:33:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27E7461EEB;
	Wed, 16 Nov 2022 18:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D15C433C1;
	Wed, 16 Nov 2022 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668623606;
	bh=eSuGKUsl70PuNN9v/+l3s8jhoenssYX/Z4beWGwsAVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRhpvsS+gYpyRB7RQu7j5i278NJKfkk2EMT2XlF3HL/nop0aIQmpeajkdk0JI9uvN
	 xtT/Jo5amx0nY65vKSsitogzhJGrPJ6Z36ORa8sKc8v9CHrXJpapMmGEwP3QaZRhqq
	 BZfP85n/pPSH+8EGIWVD5PVpbWgLEwB/DUcIaarwQPckhJrCRz3Nbip5j+/iFXqz4w
	 X0FDnDxo8iG7iLtY+vwTwOTMH3A7Se1AufuP/l9pnU6ubmKVZbfVXbw4vcl9t2rhzU
	 3i1riPkY86LBapqWoxa7dh6xOSAiLPom7/KTFF7l7LO9Gkiys8jo7zCgSdc/yaztDS
	 p1VoBtdKPD9jQ==
Date: Wed, 16 Nov 2022 18:33:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-riscv@lists.infradead.org, yash.shah@sifive.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH v2 0/3] some fixes for sifive_ccache
Message-ID: <Y3Us8uD8pFwSnnav@spud>
References: <20221018023149.1048176-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018023149.1048176-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_103327_867354_AAEF9B13 
X-CRM114-Status: GOOD (  13.71  )
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

Hey,

On Tue, Oct 18, 2022 at 10:31:46AM +0800, Yang Yingliang wrote:
> Add missing iounmap()/free_irq()/of_node_put() in sifive_ccache_init().

I've picked the series up for v6.2, should be here:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-soc-for-next

We've been sorting out re-routing stuff like this soc driver via the soc
tree rather than via the RISC-V and it took a bit of time so apologies
for the delay.

Thanks,
Conor.

> 
> v1 -> v2:
>   - Add review tag from Conor Dooley in patch #1 and #2.
>   - Add patch #3 to fix missing of_node_put().
> 
> Yang Yingliang (3):
>   soc: sifive: ccache: fix missing iounmap() in error path in
>     sifive_ccache_init()
>   soc: sifive: ccache: fix missing free_irq() in error path in
>     sifive_ccache_init()
>   soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init()
> 
>  drivers/soc/sifive/sifive_ccache.c | 33 ++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
