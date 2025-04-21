Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10086C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuq3O9FoKc5yg/XGfneREuHOudiN0GdUUU/63NQuvYE=; b=FalPjbFwK/o+pn
	lrp/nbMYObIypub5QDBYhd+aA/PJ6e6n86OT0aFjIyiLhCDt+1c3uYVLgqY9J9zmIpbQlYYiJQ9mk
	HFBRRI3RE4fD+xiOWShmnac8tGH5tsMRsPrAXY9t9dquOqnuFWbahx/kJzJg8ZMeMH6THpfgxfjDb
	wQWH+ajQa4leZ+nVLYALRURQ61rAh74uzQjfJs6M+9ROg9QN09WijpkXVtbXVKXiRTCAXZn6MmAMM
	hJX4JDbisfxqKbjH0/i9+UnlsJWzKmMohAnmum+PZA36yb7D23vhc7XNz+G2R0hxQrAW57CSo60L+
	rigJSq0hIy9sShj1A8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lsh-00000003pLj-1tkL;
	Mon, 21 Apr 2025 07:47:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lse-00000003pLK-2liM
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 07:47:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98578442A6;
	Mon, 21 Apr 2025 07:47:46 +0000 (UTC)
Message-ID: <c7941874-758b-49eb-af58-23c371b7d1e8@ghiti.fr>
Date: Mon, 21 Apr 2025 09:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: misaligned: Add handling for ZCB instructions
Content-Language: en-US
To: Nylon Chen <nylon.chen@sifive.com>, linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-2-nylon.chen@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250411073850.3699180-2-nylon.chen@sifive.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehnhihlohhnrdgthhgvnhesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvhesl
 hhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhgvshhsvgesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_004752_832921_CC941E95 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Nylon,

On 11/04/2025 09:38, Nylon Chen wrote:
> Add support for the Zcb extension's compressed half-word instructions
> (C.LHU, C.LH, and C.SH) in the RISC-V misaligned access trap handler.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>


I would add the following fixes tag:

Fixes: 956d705dd279 ("riscv: Unaligned load/store handling for M_MODE")


> ---
>   arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 7cc108aed74e..d7275dfb6b7e 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -88,6 +88,13 @@
>   #define INSN_MATCH_C_FSWSP		0xe002
>   #define INSN_MASK_C_FSWSP		0xe003
>   
> +#define INSN_MATCH_C_LHU		0x8400
> +#define INSN_MASK_C_LHU			0xfc43
> +#define INSN_MATCH_C_LH			0x8440
> +#define INSN_MASK_C_LH			0xfc43
> +#define INSN_MATCH_C_SH			0x8c00
> +#define INSN_MASK_C_SH			0xfc43
> +
>   #define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
>   
>   #if defined(CONFIG_64BIT)
> @@ -431,6 +438,13 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>   		fp = 1;
>   		len = 4;
>   #endif
> +	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
> +		len = 2;
> +		insn = RVC_RS2S(insn) << SH_RD;
> +	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
> +		len = 2;
> +		shift = 8 * (sizeof(ulong) - len);
> +		insn = RVC_RS2S(insn) << SH_RD;
>   	} else {
>   		regs->epc = epc;
>   		return -1;
> @@ -530,6 +544,9 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
>   		len = 4;
>   		val.data_ulong = GET_F32_RS2C(insn, regs);
>   #endif
> +	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
> +		len = 2;
> +		val.data_ulong = GET_RS2S(insn, regs);
>   	} else {
>   		regs->epc = epc;
>   		return -1;


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
