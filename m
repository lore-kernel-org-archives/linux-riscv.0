Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8DBC3ABD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weJEJB3k7+K5fT5CZa3PWxNLrGO0ZGCIiE/d3mIzxIM=; b=DDZFhBZ0wbgJKg
	ouEhg5AhBRkRIkcwfiEuViqvPQlapsPlf3VXXIhRaqVQh/0ETe7GQOj0bFy8bw/uWQd3krMasa2NK
	Y4rPyYBDI1/D8UtK4fZqeR0TD48W1mhLA4brZudqNcIGpWTmmkXVTMCcLjCjlTkJSnPLtcCo18P+k
	3TjNR9s1BTCqyrl6H70sE0pJ3XSyIlOvqpQBbn/ABk9wE+K537yv0IOU5zrypzjTyzTf2+7W8cuBO
	eK55OBJkSGcaVuPWPC41g7RlYwxqrfow3eSlGa+Ypuw+4foRUSAvOCiDPPWOgapTvMiJB/5ptDvBU
	46wNocJiUlWgqcew06ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx1x-00000003rIQ-446k;
	Fri, 16 May 2025 15:31:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwh5-00000003nN9-446K
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 15:09:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 366ED43AE3;
	Fri, 16 May 2025 15:09:47 +0000 (UTC)
Message-ID: <6886cf50-1a05-4ebd-bf8c-1afa652e8c89@ghiti.fr>
Date: Fri, 16 May 2025 17:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] bugs/riscv: Concatenate 'cond_str' with '__FILE__'
 in __BUG_FLAGS(), to extend WARN_ON/BUG_ON output
Content-Language: en-US
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
References: <20250515124644.2958810-1-mingo@kernel.org>
 <20250515124644.2958810-13-mingo@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250515124644.2958810-13-mingo@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegsieguheemgehfudelmeeirgeludemjeekfhdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegsieguheemgehfudelmeeirgeludemjeekfhdtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegsieguheemgehfudelmeeirgeludemjeekfhdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhun
 hgurghtihhonhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughu
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_080952_145344_0BF01916 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Ingo,

On 15/05/2025 14:46, Ingo Molnar wrote:
> Extend WARN_ON and BUG_ON style output from:
>
>    WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410
>
> to:
>
>    WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410
>
> Note that the output will be further reorganized later in this series.
>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
> Cc: <linux-arch@vger.kernel.org>
> ---
>   arch/riscv/include/asm/bug.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index feaf456d465b..da9b8e83934d 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -61,7 +61,7 @@ do {								\
>   			".org 2b + %3\n\t"                      \
>   			".popsection"				\
>   		:						\
> -		: "i" (__FILE__), "i" (__LINE__),		\
> +		: "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
>   		  "i" (flags),					\
>   		  "i" (sizeof(struct bug_entry)));              \
>   } while (0)

I have added a dummy WARN_ON_ONCE(pgtable_l5_enabled == true) and I get 
the following output:

WARNING: [pgtable_l5_enabled == true] arch/riscv/kernel/setup.c:364 at 
setup_arch+0x6c4/0x704, CPU#0: swapper/0

So you can add for riscv:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
