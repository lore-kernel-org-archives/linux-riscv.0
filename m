Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6800C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cisCdoE/wzOalIvBmEwCivLLkN7Pz65sC+wkTIW22Gk=; b=EDCBNs5eCS9I5r
	eSgQW9YPiYNvEK9gIu9XYNvRIiqHOFBvAPmHeVSUMUzPWOHK2TNiSXWn4F4ISTUjtuZdChcuxxqgr
	ZyKskt2R9LizSZqZxnABtehjOSFXoj78Nmbh5/CYpwFKk/JTvie6LM0wxBZBh1iUCdwnwCAtRerEP
	V8nRxoDkVcPGwjV2jFkPNEXAbz4fv7Btf6booIjsYYRTRFynwBY7HOL72A8Ojm/XkpRaWlHB4d7jC
	4RgSzeLKFGTXdJTWILtpx7MZLI5gDb8vk8nMyuulJavY7B5hk/nm8iv/glSn/1wHxDzsHmhdsI/Ct
	dCHIcuiLxduiiNlYJjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Gec-00000007wbN-42vR;
	Tue, 22 Apr 2025 16:39:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FEL-00000007dV4-2rEh
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 15:08:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B659443A1B;
	Tue, 22 Apr 2025 15:08:10 +0000 (UTC)
Message-ID: <56bbe957-734a-49af-8f14-9523cb8cf3a0@ghiti.fr>
Date: Tue, 22 Apr 2025 17:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make regs_irqs_disabled() more clear
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@loongson.cn>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250422113156.25742-1-yangtiezhu@loongson.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250422113156.25742-1-yangtiezhu@loongson.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtohephigrnhhgthhivgiihhhusehlohhonhhgshhonhdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgvnhhhuhgrtggriheslhhoohhnghhsohhnrdgtnhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_080813_851570_4A516B58 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Tiezhu,

On 22/04/2025 13:31, Tiezhu Yang wrote:
> The return value of regs_irqs_disabled() is true or false, so change
> its type to reflect that and also make it always inline.
>
> Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/riscv/include/asm/ptrace.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index 2910231977cb..a7dc0e330757 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -175,7 +175,7 @@ static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
>   	return 0;
>   }
>   
> -static inline int regs_irqs_disabled(struct pt_regs *regs)
> +static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
>   {
>   	return !(regs->status & SR_PIE);
>   }

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
