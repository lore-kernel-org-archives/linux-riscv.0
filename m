Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172F9C54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rx1mCirSp5DPQtPOg5KQ1+9zea7Pu++eJgh7eZxhEAc=; b=mcWEKygZ880lZJ
	QASa+2Ga4WMWu/m4WOm3PiSrqTDmlq/qP7o1HIvEinImWKk5F2fSxLW7t/4zOcDgwNSttYMGm62Wx
	mUwPDqFVNFRKYEIOZPqTrFig9dMoldWpe5hIS22UNp7pwwiP59pQl7edh0/EU+WH/MqLNttQlHaNI
	sIMEP/P+BdU8lT7IXHsDoVRxOoVt334EfHDV1KxOYOBJUBy7/J8qfOH5ImoKUBW6AxKVpD0Xl+5TT
	DdRciCWgpIKECnU//8f7CKXKVlZbN/2Sd+8/zgUndQqCiOK/g8Tse0FevunWaykSndXkbnIdxKGVs
	zNVr5Y3wTXVRsnTkd1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3NK-000000084JC-1h4M;
	Mon, 04 Mar 2024 08:08:42 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3NH-000000084GY-19MZ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 08:08:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D51CE0002;
	Mon,  4 Mar 2024 08:08:32 +0000 (UTC)
Message-ID: <79b41dfc-004e-4939-b045-0c320037e584@ghiti.fr>
Date: Mon, 4 Mar 2024 09:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 1 (riscv 32-bit)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20240301165705.07d9b52c@canb.auug.org.au>
 <e111f031-1015-4c35-b89b-263f7174431c@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <e111f031-1015-4c35-b89b-263f7174431c@infradead.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_000839_508374_ACE1DA9D 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Randy,

On 02/03/2024 06:37, Randy Dunlap wrote:
>
> On 2/29/24 21:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20240229:
>>
> on riscv 32-bit:
>
> In file included from ../arch/riscv/include/asm/uaccess.h:12,
>                   from ../include/linux/uaccess.h:11,
>                   from ../include/linux/sched/task.h:13,
>                   from ../include/linux/sched/signal.h:9,
>                   from ../include/linux/rcuwait.h:6,
>                   from ../include/linux/percpu-rwsem.h:7,
>                   from ../include/linux/fs.h:33,
>                   from ../kernel/events/core.c:11:
> ../kernel/events/core.c: In function 'perf_get_pgtable_size':
> ../arch/riscv/include/asm/pgtable.h:443:41: error: implicit declaration of function 'napot_cont_size' [-Werror=implicit-function-declaration]
>    443 |                                         napot_cont_size(napot_cont_order(pte)) :\
>        |                                         ^~~~~~~~~~~~~~~
> ../kernel/events/core.c:7588:24: note: in expansion of macro 'pte_leaf_size'
>   7588 |                 size = pte_leaf_size(pte);
>        |                        ^~~~~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:443:57: error: implicit declaration of function 'napot_cont_order'; did you mean 'get_count_order'? [-Werror=implicit-function-declaration]
>    443 |                                         napot_cont_size(napot_cont_order(pte)) :\
>        |                                                         ^~~~~~~~~~~~~~~~
> ../kernel/events/core.c:7588:24: note: in expansion of macro 'pte_leaf_size'
>   7588 |                 size = pte_leaf_size(pte);
>        |                        ^~~~~~~~~~~~~
>
>
> Full randconfig file is attached.
>

I missed it because this patch interacts with FAST_GUP support merged in 
for-next. But what this means is that the fix I sent for 6.8-rc7 was not 
needed at all...my bad, sorry.

I have just sent a fix here: 
https://lore.kernel.org/linux-riscv/20240304080247.387710-1-alexghiti@rivosinc.com/T/#u

Thanks,

Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
