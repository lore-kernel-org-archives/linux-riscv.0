Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34B9C19F2E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgslAiLF54cKJXBATXgiestIYVkbJ5evcvUfyPOJXS0=; b=fk5i7e353Hye67
	4j4ccRu41XhjeuuwwJpNatrb05LGO/gspfXVX+xEV6dgMnCP3UOprQaV2ck3TjXXeGOuZugasm15P
	hw+Gn+OZb1Tqs8sfc3yJTLo/gCRNh7pQhoBv6PxQBD+tdgF+rFbYUalPOf5x5LqOk1GzCgkSY0bG7
	/WD0yMyKEbipC+smDOrHOsjoVdciH6IRpoFmGh1VK18h9cltnOR0q3abCkw7/z4rb5lmig4NOK/Lp
	sN80iiy7d2acUUCj5LD/pwnU/Br1S7V+ujKj4sqWi4lH/i2mWsVTRoPHMHGzSIVzgq3l03Vlz7nZo
	2Qb3bRiH0fzRjVP9rLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEy-00000004FYO-2AB3;
	Wed, 26 Feb 2025 15:22:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnINf-000000044z6-366s
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 14:27:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCA8A433C9;
	Wed, 26 Feb 2025 14:27:17 +0000 (UTC)
Message-ID: <83830ab7-e15c-476f-b583-0df8d614f7cf@ghiti.fr>
Date: Wed, 26 Feb 2025 15:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Add parentheses in macro definitions of
 make_call_t0 and make_call_ra
Content-Language: en-US
To: Juhan Jin <juhan.jin@foxmail.com>, guoren@kernel.org,
 guoren@linux.alibaba.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <tencent_AE90AA59903A628E87E9F80E563DA5BA5508@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_AE90AA59903A628E87E9F80E563DA5BA5508@qq.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepjhhuhhgrnhdrjhhinhesfhhogihmrghilhdrtghomhdprhgtphhtthhopehguhhorhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhuohhrvghnsehlihhnuhigrdgrlhhisggrsggrrdgtohhmp
 dhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_062723_910413_012E99E7 
X-CRM114-Status: GOOD (  17.50  )
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

Hi Juhan,

On 06/02/2025 20:28, Juhan Jin wrote:
> This patch adds parentheses to parameters caller and callee of macros
> make_call_t0 and make_call_ra. Every existing invocation of these two
> macros uses a single variable for each argument, so the absence of the
> parentheses seems okay. However, future invocations might use more
> complex expressions as arguments. For example, a future invocation might
> look like this: make_call_t0(a - b, c, call). Without parentheses in the
> macro definition, the macro invocation expands to:
>
> ...
> unsigned int offset = (unsigned long) c - (unsigned long) a - b;
> ...
>
> which is clearly wrong.
>
> The use of parentheses ensures arguments are correctly evaluated and
> potentially saves future users of make_call_t0 and make_call_ra debugging
> trouble.
>
> Fixes: 6724a76cff85 ("riscv: ftrace: Reduce the detour code size to half")
> Signed-off-by: Juhan Jin <juhan.jin@foxmail.com>
> ---
>   arch/riscv/include/asm/ftrace.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index c4721ce44ca4..2636ee00ccf0 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -92,7 +92,7 @@ struct dyn_arch_ftrace {
>   #define make_call_t0(caller, callee, call)				\
>   do {									\
>   	unsigned int offset =						\
> -		(unsigned long) callee - (unsigned long) caller;	\
> +		(unsigned long) (callee) - (unsigned long) (caller);	\
>   	call[0] = to_auipc_t0(offset);					\
>   	call[1] = to_jalr_t0(offset);					\
>   } while (0)
> @@ -108,7 +108,7 @@ do {									\
>   #define make_call_ra(caller, callee, call)				\
>   do {									\
>   	unsigned int offset =						\
> -		(unsigned long) callee - (unsigned long) caller;	\
> +		(unsigned long) (callee) - (unsigned long) (caller);	\
>   	call[0] = to_auipc_ra(offset);					\
>   	call[1] = to_jalr_ra(offset);					\
>   } while (0)
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b


Probably not worth going into fixes since the problem is not around for 
now, but that's still a good catch:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
