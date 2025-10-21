Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A3CCD1AB
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 19:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyHv8ITmpCbT55V5/wi0t+PYjYQqzUYmfPCz9x91PsY=; b=NwVbP19rfgAJyj
	WEKnpWH3SDrQT7PHM+Fu9BmT4xP9I8DHqBjko0TMrC9yDfOKdmbFHAUw6+yTF0QhrXnbhg/Dr7Cbl
	cMZjIK4VFLzAAoD4Xsw5iBWWFMBqlLChGYZEqiVstNchkcJojeV7T4pd7i2UJ1lejZMRQl36kzxv7
	yomjF8iHhhTHlOrsc1ARfsScMbrz9KccfipKWlUal3eilk+oSxtpVWwXr987RSShtZAveE9Gq69sj
	tXN3ltd2eThNa4OFMqJN6S6TCKTMVHQVz4FVnQJhvBvRujsVMhsZpN4rj4GxOp6/UqRjDA+HLAOQY
	Gjzzrn7wGWd3fZkCK3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHya-00000000Tbc-1RUG;
	Tue, 21 Oct 2025 19:24:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHyY-00000000TbP-1zUy
	for linux-riscv@bombadil.infradead.org;
	Tue, 21 Oct 2025 19:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DJKT2QONZCH3kce1x0l6r7O/vjQeswEDBGtYmqkrZlY=; b=qRJJvLiSDPnWdeTco8FMIa0FQv
	yqIC87sEkEvk0jZ48koKW+JEhdN9lOMCbY58at90p6CQtM6nbQLmk2VjBCP+dTTHf7aPJZ/3kVQzw
	jNRkV/7QM3iE4jNz7oCnpY0ydeBI0i720H6k7+ZqpkLjtX2cFipkp0Dqh4a4ppPAQ+28y01MSvAAD
	pyZiekynI+2YDUJX0nMcd61+QYYxLxmxoEuKGBv+fXSaMq1Z9QO7/hCpzyJFYJfjA4uvWs7bOUMBo
	tztmID9jy4NKb+xUDAPOc4yV+yKPHE1w7r2laMNYkmUkpVyDUz8BBqzx0CLZkBqzKVwK0pU6g4Im9
	wQ0I9h8g==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBGLn-000000000nQ-2kYU
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 17:40:51 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251021183604euoutp019317dc710b860a3aaae802f8760d0ce0~wlXB_NQGs1388713887euoutp01t
	for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 18:36:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251021183604euoutp019317dc710b860a3aaae802f8760d0ce0~wlXB_NQGs1388713887euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761071764;
	bh=DJKT2QONZCH3kce1x0l6r7O/vjQeswEDBGtYmqkrZlY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=t1jEoHh2mGultn0vKqMDg4pjoB4gyhpPLw3irgvnbrDmkih1wF3yYeKKQiTfK0DGW
	 qSO9uIGJxwPWPJpI8wyDwqNjlboO3IYD8OOdZRr/68o7hCIIM/uLNEPW26/iq1D8VU
	 89Rpcj9y37qOg+WGhfXUqe372alAX/YZt9qCceos=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251021183604eucas1p128aae1b63df44b4dfd26abe2a3d3cd11~wlXB09V7V0437104371eucas1p17;
	Tue, 21 Oct 2025 18:36:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251021183603eusmtip1fd1f79b260b6cc623515b24c5eae6a9e~wlXBTN8bd2983529835eusmtip1y;
	Tue, 21 Oct 2025 18:36:03 +0000 (GMT)
Message-ID: <e8a0782a-4e63-45a6-85c8-e3113b1f391a@samsung.com>
Date: Tue, 21 Oct 2025 20:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
To: Johan Hovold <johan@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Jassi Brar
	<jassisinghbrar@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251017055414.7753-1-johan@kernel.org>
X-CMS-MailID: 20251021183604eucas1p128aae1b63df44b4dfd26abe2a3d3cd11
X-Msg-Generator: CA
X-RootMTR: 20251017055521eucas1p1344f04a5012eb6981315cf160ffc1ec6
X-EPHeader: CA
X-CMS-RootMailID: 20251017055521eucas1p1344f04a5012eb6981315cf160ffc1ec6
References: <CGME20251017055521eucas1p1344f04a5012eb6981315cf160ffc1ec6@eucas1p1.samsung.com>
	<20251017055414.7753-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_184048_411994_4557368D 
X-CRM114-Status: GOOD (  17.18  )
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



On 10/17/25 07:54, Johan Hovold wrote:
> The purpose of the devm_add_action_or_reset() helper is to call the
> action function in case adding an action ever fails so drop the clock
> disable from the error path to avoid disabling the clocks twice.
> 
> Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/mailbox/mailbox-th1520.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
> index a6b2aa9ae952..626957c2e435 100644
> --- a/drivers/mailbox/mailbox-th1520.c
> +++ b/drivers/mailbox/mailbox-th1520.c
> @@ -435,10 +435,8 @@ static int th1520_mbox_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_add_action_or_reset(dev, th1520_disable_clk, priv);
> -	if (ret) {
> -		clk_bulk_disable_unprepare(ARRAY_SIZE(priv->clocks), priv->clocks);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	/*
>  	 * The address mappings in the device tree align precisely with those

Hi,
Thanks for your fix. I believe it is correct as devm_add_action_or_reset
will call th1520_disable_clk on failure, like you noticed.

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
