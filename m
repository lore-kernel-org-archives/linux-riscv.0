Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D924BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9EBE610D0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9EBE610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgiSq5WWKigt5WWWTL/JxrJ2E8hCIBHCypiCPLPmwwg=; b=t4jhZBJ61IgKP3
	Md+xcp8HPpAZMW1M8sPU0CdI5bPgkQJJk//HV8pFBeoFABI0b9TzXdCJVRD4vwtmyRBYXUSovG8ie
	RAKOl1A+71f0IYaDwvuztLU+MKUQTyF8J7kvRt9+xKx7zcnirAsKb15LuS/fpEdPxoj9M5P/bOVMv
	pjduhWTY/cCFYj3lQDjZsQGV9hUmYR5Qq9rkzHbgaJ7jdGMlNBPTOiF2ik+ZX6lUfJs5SVbavsrXJ
	rGu5mq0diiQAiwK4VF9REe95uu3rOlEKBKFLxUAtOzvJ3A6lUqj373U2dlvilGa04mACGAYgEJR0U
	qTBa5KKiy70jbZpJHUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdWPO-007N0i-O4; Thu, 21 Oct 2021 11:38:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdWPL-007MzG-9k
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 11:38:53 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HZlnL63ZLzZcKY;
 Thu, 21 Oct 2021 19:36:54 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:38:42 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:38:42 +0800
Message-ID: <bd3419a3-b858-1a4d-a081-d09bbc56eaa7@huawei.com>
Date: Thu, 21 Oct 2021 19:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] riscv: consolidate __ex_table construction
Content-Language: en-US
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
 <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
References: <20211020220529.54ccf4e9@xhacker> <20211020220610.25443e4c@xhacker>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211020220610.25443e4c@xhacker>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_043851_722070_2EB26D4A 
X-CRM114-Status: GOOD (  11.32  )
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



On 2021/10/20 22:06, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Consolidate all the __ex_table constuction code with a _ASM_EXTABLE
> helper.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/futex.h   | 12 +++-------
>   arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
>   2 files changed, 17 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index 1b00badb9f87..3191574e135c 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -30,10 +30,7 @@
>   	"3:	li %[r],%[e]				\n"	\
>   	"	jump 2b,%[t]				\n"	\
>   	"	.previous				\n"	\
> -	"	.section __ex_table,\"a\"		\n"	\
> -	"	.balign " RISCV_SZPTR "			\n"	\
> -	"	" RISCV_PTR " 1b, 3b			\n"	\
> -	"	.previous				\n"	\
> +		_ASM_EXTABLE(1b, 3b)				\
>   	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
>   	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
>   	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
> @@ -103,11 +100,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>   	"4:	li %[r],%[e]				\n"
>   	"	jump 3b,%[t]				\n"
>   	"	.previous				\n"
> -	"	.section __ex_table,\"a\"		\n"
> -	"	.balign " RISCV_SZPTR "			\n"
> -	"	" RISCV_PTR " 1b, 4b			\n"
> -	"	" RISCV_PTR " 2b, 4b			\n"
> -	"	.previous				\n"
> +		_ASM_EXTABLE(1b, 4b)			\
> +		_ASM_EXTABLE(2b, 4b)			\
>   	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
>   	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
>   	: "memory");
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index f314ff44c48d..35802e72ace8 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -10,6 +10,12 @@
>   
>   #include <asm/pgtable.h>		/* for TASK_SIZE */
>   
> +#define _ASM_EXTABLE(from, to)						\
> +	"	.pushsection	__ex_table, \"a\"\n"			\
> +	"	.balign "	RISCV_SZPTR "	 \n"			\
> +	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
> +	"	.popsection\n"
> +

The jump_label mechanism could use this macro too,
see arch/riscv/include/asm/jump_label.h, maybe move the above into asm.h
and also do some replace in next patch ?

Question: the jump label use relative address, but why not trigger the 
Section mismatch issue?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
