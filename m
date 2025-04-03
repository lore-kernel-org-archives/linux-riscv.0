Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85979C3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxLsrCo2GI2ZyzjZyQhRm5nLY70hV+TOdUWbjvXZUlE=; b=YS13vsJ4INrooy
	sqgso6WaEzYtKA6AHSko1zCLxq8GPFvRCRFncIgHfcpoyAObrZrOZHKSt5hUKZmf5bgeHaFSmD5AX
	d5h2U7pQWzVrdGwGWPLcFCeFM3KDf8rtVPKwJz2M1HbaQeLkjHnLkR9L4c1/EpXnMAgyg5mhPnqWh
	bkKsEIEsF0MlFSODl2zCWow46bzplM1uKvF59xyyduYn13xwcSv0D2p55HTpHpy+svMWqM+5BZHqb
	NqiKvVFe2ReKVyTWjkesUrV5Rfw1SR8t0R4dFbyDijFvGavrep52odpHaY3YVTDgTcyyN3Qj/vj/e
	Uichs2sTbLwwA31uGhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HgM-00000008YAG-2rfG;
	Thu, 03 Apr 2025 10:20:22 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HLf-00000008TGG-0MiE
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 09:59:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AFF943231;
	Thu,  3 Apr 2025 09:58:50 +0000 (UTC)
Message-ID: <5b0adf9b-2b22-43fe-ab74-68df94115b9a@ghiti.fr>
Date: Thu, 3 Apr 2025 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Content-Language: en-US
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Huacai Chen <chenhuacai@loongson.cn>
References: <330B3BAFC6FDB763+20250402074247.64483-1-wangyuli@uniontech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <330B3BAFC6FDB763+20250402074247.64483-1-wangyuli@uniontech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepfigrnhhghihulhhisehunhhiohhnthgvtghhrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpt
 hhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhntggvnhhtrdgthhgvnhesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_025859_259069_ACC8999E 
X-CRM114-Status: GOOD (  16.70  )
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

On 02/04/2025 09:42, WangYuli wrote:
> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
> symbol using inline assembly.
>
> There's a potential issue where the compiler might inline
> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst


I guess you meant kgdb_compiled_break.


> symbol multiple times, leading to fail to link vmlinux.o.
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
>   *v1->v2: Add the missing __ASSEMBLY__ check and substitute
> ".option rvc/norvc" with ".option push/pop".
> ---
>   arch/riscv/include/asm/kgdb.h | 9 +--------
>   arch/riscv/kernel/kgdb.c      | 8 ++++++++
>   2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index 46677daf708b..d9f6a8fc387f 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -19,16 +19,9 @@
>   
>   #ifndef	__ASSEMBLY__
>   
> +extern void arch_kgdb_breakpoint(void);


The "extern" is not needed here.


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
> index 2e0266ae6bd7..5873d3970360 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>   	regs->epc = pc;
>   }
>   
> +noinline void arch_kgdb_breakpoint(void)
> +{
> +	asm(".global kgdb_compiled_break\n"
> +	    ".option push\n"


Here you forgot .option norvc. But this fix as mentioned by Samuel 
should be in a separate patch.

Thanks,

Alex


> +	    "kgdb_compiled_break: ebreak\n"
> +	    ".option pop\n");
> +}
> +
>   void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>   				char *remcom_out_buffer)
>   {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
