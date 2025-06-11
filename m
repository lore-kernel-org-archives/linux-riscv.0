Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347C0C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzUffuSwXDscCtLWavOXJ6sVdTCoLev8AMJk5QymMag=; b=poLR8SxEbLbmyK
	o3SoWrwmQqzPROqZduhQTEVFus3fe3HeB+95ENGkiH1WjQbeGbRmGPdkq1eaPtuchwYTJ/WR+gk+B
	cX0jnwqEwv6yITRLvRbvXRGj7FgxPjoFMERbrQkudrrd605Zp8WOAfJ6ez83zMEC/ICZwE3njQv38
	34Kv4eGHDGuexOxYMwjQdozeMTR/IbmTkZ7gXLeKpWC4y6PCUNQNRIiROljIUhx8kgd8yb8AIXFn2
	P0XFR4O4WqhIA6KTUYroPmeFIStefOcPpskOM/yFLRHhXBhBAWYuV3R3f80pA2LbYUVhQND3aH6zG
	kqJSPmCim5+8U4hwj5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFvk-000000096qU-47f8;
	Wed, 11 Jun 2025 07:31:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFvj-000000096pc-1pWi
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Auu8m1HstGkAfoUhbrTXjzaijr43bYMRyblts+38oag=; b=aXPpeGy9FNACKR/5kC67diza0P
	oC9Wb4sOO4mbPqYb0pWC2JIxSCGEC+6trqmAlzTHoTZJxEuSyfurQwsZOoTf+Q68yGlve9iaIOa7g
	K3nDpmCkIp9Qu2wpbR9gvclY/EovoGtQJjVkjfa53jcwKEcIUDbmIzWYRN8gwetCVwjNo77A6NKxx
	uUvTcTE4J0eM4RJ7ou5f2eENyyg94210aJnXYC3VlY6BYa//Sc+6xvRwwewRhvDhMUxoKda6YVkm1
	d1pdK0CpLRL/HpLOEBx1316rAUv4Z0gxmeV/XDH/kC0At4ORr4G9UorLXqkQoHqD8E7itjNKNhii/
	f7u9t8VA==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFvg-000000029sX-3fqn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:31:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9EDB443D4;
	Wed, 11 Jun 2025 07:31:18 +0000 (UTC)
Message-ID: <de5e9d8d-c620-4371-8c74-7ef804d97d53@ghiti.fr>
Date: Wed, 11 Jun 2025 09:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 cyrilbur@tenstorrent.com, jszhang@kernel.org, cleger@rivosinc.com,
 samuel.holland@sifive.com, linux-kernel@vger.kernel.org
References: <20250610213058.24852-1-palmer@dabbelt.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250610213058.24852-1-palmer@dabbelt.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemkedttgegmehfieekkeemvgehgehfmegutgdtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemkedttgegmehfieekkeemvgehgehfmegutgdtfedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemkedttgegmehfieekkeemvgehgehfmegutgdtfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiess
 hhifhhivhgvrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehjshiihhgrnhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshgrmhhuvghlrdhhohhllhgrnhgusehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083125_172250_536C9067 
X-CRM114-Status: GOOD (  15.26  )
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

On 6/10/25 23:30, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
>
> I must have lost this rebasing things during the merge window, I know I
> got it at some point but it's not here now.  Without this I get warnings
> along the lines of
>
>      include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>       3975 |         if (unlikely(get_user(c, path)))
>            |                      ^
>      arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
>        274 |                 __get_user((x), __p) :                          \
>            |                 ^
>      arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
>        244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
>            |         ^
>      arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
>        207 |         __ge  LD [M]  net/802/psnap.ko
>      t_user_nocheck(x, ptr, __gu_failed);                        \
>            |         ^
>      arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
>        196 |                 __get_user_8((x), __gu_ptr, label);             \
>            |                 ^
>      arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
>        130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
>            |         ^
>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index d472da4450e6..525e50db24f7 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -127,6 +127,7 @@ do {								\
>   
>   #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>   #define __get_user_8(x, ptr, label)				\
> +do {								\
>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>   	u32 __lo, __hi;						\
>   	asm_goto_output(					\
> @@ -141,7 +142,7 @@ do {								\
>   		: : label);                                     \
>   	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
>   		(((u64)__hi << 32) | __lo)));			\
> -
> +} while (0)
>   #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
>   #define __get_user_8(x, ptr, label)				\
>   do {								\


I had come up with the same fix so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
