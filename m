Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E34C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy+oQswaiICuMJ0hdb3WW4uHbsDbfwykbJm4pfBNzyo=; b=oFA+fylrDq2dZu9YZqe77C8f3U
	16DbiEVxcNA10SA4AuaDDntpPXoUxb0APemSL5wruZUT8G1IUVTNRk7RMl83T5Ftslrbstp5+LR9j
	I/y9os8x3QLtCW2R3ixzyS7k9HiooCJgJTuwEPI45+WMwRwqmEKBmUN/+iQIaGrQH07TgvbNkGuyv
	rUomVAOsdyO6s15ewz5w0GTcFeskSpyNjXAdT36o5pR9Hsopjw1T7b9VremW6EEHp5HN+gE8Klaiu
	dOWaMNL7Wy9dVq8V42sWQJ1TZ0r39BdiasH4/sNh1erZQtKdbe6B/1D+5zdxcBr0t7qXnADBSlnRU
	CXYTwKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6bd-0000000ELGi-25gO;
	Wed, 14 May 2025 07:32:45 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6U9-0000000EIsm-23o4
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 07:25:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08D08442BC;
	Wed, 14 May 2025 07:24:55 +0000 (UTC)
Message-ID: <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>
Date: Wed, 14 May 2025 09:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746997351.git.namcao@linutronix.de>
 <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeifeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveetvdfhvdeuheekvdettdegheetgeejiefgjeetvedtfeeuvddvtefhjeffgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehnrghmtggroheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlm
 hgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_002501_686690_F6268718 
X-CRM114-Status: GOOD (  15.18  )
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

Hi Nam,

On 11/05/2025 23:17, Nam Cao wrote:
> Similar to other instruction-processing macros/functions, branch_rs2_idx
> should be in insn.h.
>
> Move it into insn.h as RV_EXTRACT_RS2_REG. This new name matches the style
> in insn.h.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/insn.h            | 5 +++++
>   arch/riscv/kernel/probes/simulate-insn.c | 5 +----
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 09fde95a5e8f..debac13a3476 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -64,6 +64,7 @@
>   #define RVG_RS2_OPOFF		20
>   #define RVG_RD_OPOFF		7
>   #define RVG_RS1_MASK		GENMASK(4, 0)
> +#define RVG_RS2_MASK		GENMASK(4, 0)
>   #define RVG_RD_MASK		GENMASK(4, 0)
>   
>   /* The bit field of immediate value in RVC J instruction */
> @@ -295,6 +296,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>   	({typeof(x) x_ = (x); \
>   	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
>   
> +#define RV_EXTRACT_RS2_REG(x) \
> +	({typeof(x) x_ = (x); \
> +	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })


RV_X() definition was inconsistent across multiple files, so I 
harmonized RV_X() it in this patch 
https://lore.kernel.org/linux-riscv/20250508125202.108613-3-alexghiti@rivosinc.com/

So here you use the "old" version, would you mind rebasing on top this 
patchset and use RV_X_mask() instead?

If you can't, let me know and I'll find some time, I'd like to merge 
those cleanups in 6.16.

Thanks,

Alex


> +
>   #define RV_EXTRACT_RD_REG(x) \
>   	({typeof(x) x_ = (x); \
>   	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index 6c166029079c..77be381bb8b4 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
>   #define branch_rs1_idx(opcode) \
>   	(((opcode) >> 15) & 0x1f)
>   
> -#define branch_rs2_idx(opcode) \
> -	(((opcode) >> 20) & 0x1f)
> -
>   #define branch_funct3(opcode) \
>   	(((opcode) >> 12) & 0x7)
>   
> @@ -157,7 +154,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
>   	unsigned long rs2_val;
>   
>   	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
> -	    !rv_insn_reg_get_val(regs, branch_rs2_idx(opcode), &rs2_val))
> +	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
>   		return false;
>   
>   	offset_tmp = branch_offset(opcode);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
