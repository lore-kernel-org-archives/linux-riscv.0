Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FBFC54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjypMxAQ47TG9gVsHrPfKXeYIDRh7Iv7V2kXTKr22gg=; b=13IJgdULpCkNdV
	ZTsfNN+rqH8PlfdA51GcONLTEUGLn6W2eN4KCSQ/ThwcWip/T9NN73RJFyWx02DvsFh1RCZnPycAC
	YjETXr8afjlssVLyp2fEcmrEXZHW5S0VnRSobpOpH2zjNPI+fhRnsFlBU6vloR7VBDpxa3cVYh277
	IsvkddL0t2VJdsw3pI/hSG33mET64bCLMSRrnAxuDrCii0N4UHwBeDYyoQhV+fD5Kn2u131Qvrpkm
	0idmXJdV17Sr1Dml2wBIuaJDAet0pDUAQDeGPcZtnOCZmz9F8ggCkbLJpZJRD3IHFCZiybgdL0rUN
	fC2nPby9++MqBOKITSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOAI-00000003Mp1-2noA;
	Fri, 23 May 2025 08:54:06 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOAG-00000003Mnu-09to
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 08:54:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1137943AD8;
	Fri, 23 May 2025 08:53:59 +0000 (UTC)
Message-ID: <cad644ea-a2c9-490d-ab41-160c73425169@ghiti.fr>
Date: Fri, 23 May 2025 10:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, linux-kernel@vger.kernel.org
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekgeefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhgrsggvnhgurgdrtghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhgvshhsvgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghnugihsghnrggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_015404_225165_28BB10AF 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Han,

On 5/22/25 19:27, Han Gao wrote:
> Fix [1] save/restore vector register error
>
> Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]


Would you mind rephrasing the log? It should explain what was wrong and 
how you fixed it.

Thanks,

Alex


>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   arch/riscv/include/asm/vector.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index e8a83f55be2b..7df6355023a3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
>   			THEAD_VSETVLI_T4X0E8M8D1
>   			THEAD_VSB_V_V0T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V8T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V16T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V24T0
>   			: : "r" (datap) : "memory", "t0", "t4");
>   	} else {
>   		asm volatile (
> @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
>   			THEAD_VSETVLI_T4X0E8M8D1
>   			THEAD_VLB_V_V0T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V8T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V16T0
>   			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V24T0
>   			: : "r" (datap) : "memory", "t0", "t4");
>   	} else {
>   		asm volatile (

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
