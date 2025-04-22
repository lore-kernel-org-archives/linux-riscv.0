Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D6DC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXGA2L+5gTM+O0KixXl/dia4bb8RJOLz3b8adKv5csA=; b=iFRc5ZE0gc4KQX
	Am1OJL31+grTHbNTxb0ThhF5+0osfugY7pfrTJs6Jr0tHqvllGK8+6wMGEvraAlZ7CvrkXSxYKFAb
	BWJisBx/UbWz/gaEsUXRkZ9bgJUj+arAmkmoS6bjBg6WTrw/VG0xVBAVjZN99Qh3O7J5hsoY5hH6o
	tF0bcTil6ZhmRDkKgs9O4ArdqUkTQMn7O5+qn3lNNL+V8soCwXQ8wH88eTXNKsvFx3ZFa9DUTcQkb
	zpVm47Je65TBzC5fV6FKbVk++CZmCI8zPLo52eRZbYuxH1UDVQ1o3JgIryv8QyLkui9K5QIqsguca
	yn61iu6v6mb5cnSJxRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DVc-00000007GOE-0BwN;
	Tue, 22 Apr 2025 13:17:56 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CSb-000000073xj-2rOh
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 12:10:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43B7F43B4C;
	Tue, 22 Apr 2025 12:10:41 +0000 (UTC)
Message-ID: <6cefe9be-c103-4533-9f44-4666d3fba2f5@ghiti.fr>
Date: Tue, 22 Apr 2025 14:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] riscv: uaccess: use input constraints for ptr of
 __put_user()
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-4-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-4-cyrilbur@tenstorrent.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetvdffkedvjeefkeegfefgteffleeltefggfdvheekfffhfeeghfeffffhtdelvdenucffohhmrghinhepghhnuhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhus
 egvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_051045_865157_584B0F27 
X-CRM114-Status: GOOD (  13.15  )
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


On 10/04/2025 09:05, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Putting ptr in the inputs as opposed to output may seem incorrect but
> this is done for a few reasons:
> - Not having it in the output permits the use of asm goto in a
>    subsequent patch. There are bugs in gcc [1] which would otherwise
>    prevent it.
> - Since the output memory is userspace there isn't any real benefit from
>    telling the compiler about the memory clobber.
> - x86, arm and powerpc all use this technique.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [Cyril Bur: Rewritten commit message]
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index c9a461467bf4..da36057847f0 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -219,11 +219,11 @@ do {								\
>   	__typeof__(*(ptr)) __x = x;				\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
> -		"	" insn " %z2, %1\n"			\
> +		"	" insn " %z1, %2\n"			\
>   		"2:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> -		: "+r" (err), "=m" (*(ptr))			\
> -		: "rJ" (__x));					\
> +		: "+r" (err)					\
> +		: "rJ" (__x), "m"(*(ptr)));			\
>   } while (0)
>   
>   #ifdef CONFIG_64BIT
> @@ -236,16 +236,16 @@ do {								\
>   	u64 __x = (__typeof__((x)-(x)))(x);			\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
> -		"	sw %z3, %1\n"				\
> +		"	sw %z1, %3\n"				\
>   		"2:\n"						\
> -		"	sw %z4, %2\n"				\
> +		"	sw %z2, %4\n"				\
>   		"3:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
>   		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
> -		: "+r" (err),					\
> -			"=m" (__ptr[__LSW]),			\
> -			"=m" (__ptr[__MSW])			\
> -		: "rJ" (__x), "rJ" (__x >> 32));		\
> +		: "+r" (err)					\
> +		: "rJ" (__x), "rJ" (__x >> 32),			\
> +			"m" (__ptr[__LSW]),			\
> +			"m" (__ptr[__MSW]));			\
>   } while (0)
>   #endif /* CONFIG_64BIT */
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
