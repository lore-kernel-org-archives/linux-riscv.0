Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE9AC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KOIl0KnLZL/QOwsrnB9rgND/vpZU8EjhjNj7YNapIE=; b=kRl97BM+JMiwZM
	J2F+MmgcBca3c02Pxyq43S5O2qWiW1NqCMMvwhN5rTP5BncCUFGLu4slRFZxgYdmrRrqA/IFvZOKj
	GEc9pNytppQzz6nZeamzWF9O8oW8AFY6e2EkQw+SVPN//bee1N+ouRy9BIc2zdVagpe7WVYpRIjWN
	aOOSxpQ6kTSY0H4E3C3EyAUm8b0o/9McXD3dbBXSma3PmkG5fECMKAI5e01fmrasi/Os5Eoz/aB11
	Z+GWMLj/3D4xBM9j+/t5G7E9TIkjUzywhX99pnM1vthzAPB5BRmo8KELE4TWqeOwyDje27KOpryrA
	D+rb0HEYAA5EIUqk3/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sH8-0000000AjbU-1bzE;
	Thu, 10 Apr 2025 13:49:02 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sBC-0000000AiLU-2ht0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 13:42:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 372934431A;
	Thu, 10 Apr 2025 13:42:46 +0000 (UTC)
Message-ID: <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
Date: Thu, 10 Apr 2025 15:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Content-Language: en-US
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeltdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepfigrnhhghihulhhisehunhhiohhnthgvtghhrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpt
 hhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhntggvnhhtrdgthhgvnhesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_064254_824741_B73E0DD7 
X-CRM114-Status: GOOD (  18.20  )
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

Hi WangYuli,

On 08/04/2025 11:54, WangYuli wrote:
> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
> symbol using inline assembly.
>
> There's a potential issue where the compiler might inline
> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst


You forgot to replace kgdb_breakinst into kgdb_compiled_break.


> symbol multiple times, leading to fail to link vmlinux.o.
>
> This isn't merely a potential compilation problem. The intent here
> is to determine the global symbol address of kgdb_compiled_break,
> and if this function is inlined multiple times, it would logically
> be a grave error.
>
> Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
> Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> Changelog:
>   *v1->v2:
>      1. Add the missing __ASSEMBLY__ check and substitute
> ".option rvc/norvc" with ".option push/pop".
>    v2->v3:
>      1. Remove "extern".
>      2. Restore the inadvertently deleted .option norvc to prevent
> a change in semantics.
> ---
>   arch/riscv/include/asm/kgdb.h | 9 +--------
>   arch/riscv/kernel/kgdb.c      | 9 +++++++++
>   2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index 46677daf708b..cc11c4544cff 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -19,16 +19,9 @@
>   
>   #ifndef	__ASSEMBLY__
>   
> +void arch_kgdb_breakpoint(void);
>   extern unsigned long kgdb_compiled_break;
>   
> -static inline void arch_kgdb_breakpoint(void)
> -{
> -	asm(".global kgdb_compiled_break\n"
> -	    ".option norvc\n"
> -	    "kgdb_compiled_break: ebreak\n"
> -	    ".option rvc\n");
> -}
> -
>   #endif /* !__ASSEMBLY__ */
>   
>   #define DBG_REG_ZERO "zero"
> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
> index 2e0266ae6bd7..7f2d3d956167 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -254,6 +254,15 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>   	regs->epc = pc;
>   }
>   
> +noinline void arch_kgdb_breakpoint(void)
> +{
> +	asm(".global kgdb_compiled_break\n"
> +	    ".option push\n"
> +	    ".option norvc\n"
> +	    "kgdb_compiled_break: ebreak\n"
> +	    ".option pop\n");
> +}


You are fixing 2 things here, you need to split this patch into 2. And 
as noted by Palmer, we actually don't need norvc here, so you can remove 
it instead.

Thanks,

Alex


> +
>   void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>   				char *remcom_out_buffer)
>   {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
