Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D1AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 07:07:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225EA64EC3
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 07:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225EA64EC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bfxOQCRJkM1ValFfWUeMUdVaoJTVNC6SEqnlunnWKKA=; b=zh8cvKZDlxe4SVQft9xTqLmIg
	gsmzjrM3cojC5qU0bKuwmugegdeoLGes0CnPJn6EpS0XFASUw3ktwj7ooxKNbo5Odag+/WeZqLv0m
	uO+kSW78A6dteKjARZn88JPWw70cAPUW5zHGsi1Oqz5fpmpMeBRgj0PdgHepWX1D8cQjlvrrBqvfh
	ki+2A6lrvRjKw2EHFTPUQrl+aWkUX3B+GM5iEtYqvMVX5R46hFcpM9nb+X8j1hwlLMqeZBuXbnCLq
	LVFeeri+YqPbRcBwLRnp1GwyvkI3DYM434T7/a6EAkT7NNo3hZcfd8ARdazzVQo+FB679V82nIbVa
	1h6qcCqKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6plz-0003Ob-JC; Tue, 02 Feb 2021 07:06:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6plx-0003O4-Co
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 07:06:50 +0000
X-Originating-IP: 82.65.183.113
Received: from [172.16.5.113] (82-65-183-113.subs.proxad.net [82.65.183.113])
 (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 773666000A;
 Tue,  2 Feb 2021 07:06:44 +0000 (UTC)
Subject: Re: [PATCH] riscv: kasan: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>, aryabinin@virtuozzo.com
References: <1612245119-116845-1-git-send-email-yang.lee@linux.alibaba.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <4b3294d7-ff30-8f02-81ff-d2d73a79e465@ghiti.fr>
Date: Tue, 2 Feb 2021 02:06:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612245119-116845-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_020649_531980_1D5A6353 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, glider@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yang,

Le 2/2/21 =E0 12:51 AM, Yang Li a =E9crit=A0:
> Eliminate the following coccicheck warning:
> ./arch/riscv/mm/kasan_init.c:103:2-3: Unneeded semicolon
> =

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   arch/riscv/mm/kasan_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index a8a2ffd..fac437a 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -100,7 +100,7 @@ void __init kasan_init(void)
>   			break;
>   =

>   		populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
> -	};
> +	}
>   =

>   	for (i =3D 0; i < PTRS_PER_PTE; i++)
>   		set_pte(&kasan_early_shadow_pte[i],
> =


Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
