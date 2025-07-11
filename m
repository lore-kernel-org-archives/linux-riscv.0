Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF04C8303C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pxm9SwmpFVZBiaxz/SDilMlPrgY0Kfj2IfSn4lNNFs=; b=NisTdIg/5tnGDq
	g8Km8gB6S0o29r6aHLY8UpZQqekxOrr7YAmBNKvPcMCtdyY1u7tCM83+O6cKL6jmyr6/kPAaCnTf2
	f+cfl5Jjdsh+te3zvJ/TPThUO85bVvrHVlEDxsNCqs6wauMCdoK++mNWET6LtaxXicLnEKPlud/Ud
	ep2ejGHvFhCbD9UcWU3PYgYe8sXrjQkVAKhmULjYXXOuqiRLYzfVJtmTWJhZvnlKYadFn4qfgTDYG
	6ex5uzQrdTV0lgcH0hOns9Uaabn2pjh1qfvlDBR9O2FVphuI6cr/9vP5ebB3FOK7lXKOQV+TNpUJ8
	hiQwTd5AkiFQjW7UpbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8UN-0000000E1n9-3yKF;
	Fri, 11 Jul 2025 07:48:11 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8C7-0000000Dyaj-24QA
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 07:29:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3B7744363;
	Fri, 11 Jul 2025 07:29:14 +0000 (UTC)
Message-ID: <d1533a6a-d904-428b-a44c-362faf61daf8@ghiti.fr>
Date: Fri, 11 Jul 2025 09:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: traps_misaligned: properly sign extend value in
 misaligned load handler
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: damien.lemoal@wdc.com, anup@brainfault.org, palmer@dabbelt.com
References: <mvmikk0goil.fsf@suse.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmikk0goil.fsf@suse.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedukeehrddvudefrdduheegrddugeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudegiedphhgvlhhopegluddtrddugedrtddrudekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepshgthhifrggssehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegurghmihgvnhdrlhgvmhhorghlseifuggtrdgtohhmpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_002919_675057_396C66E8 
X-CRM114-Status: GOOD (  11.37  )
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

Hi Andreas,

On 7/10/25 15:32, Andreas Schwab wrote:
> Add missing cast to signed long.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/kernel/traps_misaligned.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 93043924fe6c..f760e4fcc052 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -461,7 +461,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>   	}
>   
>   	if (!fp)
> -		SET_RD(insn, regs, val.data_ulong << shift >> shift);
> +		SET_RD(insn, regs, (long)(val.data_ulong << shift) >> shift);
>   	else if (len == 8)
>   		set_f64_rd(insn, regs, val.data_u64);
>   	else


Let's add:

Fixes: 956d705dd279 ("riscv: Unaligned load/store handling for M_MODE")

Cc: stable@vger.kernel.org

Does that fix the issue you reported when booting with opensbi 1.7?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
