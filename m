Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300CAEE14C3
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8DJdNhDgbzcUvHBF7oZcMU2GCIYCkWNitnrb+v/zx0=; b=I/p7kj8bHWVuW5
	49VQAFY0R5T+dINrQSEcCVQJxurDY8p5Rj4anxP0Vcq5jHLL8042LJiuKrEB7+xsN6sDNTIT1J6h8
	h70ZhMiLS0q1lGW5nRk4wRpbi6lFys2kGRhhSAC5sb2YoJtH6fhOuUJ6i+cesLONgdijLSaCW3ZD7
	vdUD6EpBJuF/Uk5AoThA9W7ADsbeRHyp2tQu3eVfvBb7QXJ7Z4/lBcyEoyVQixHoUCofUuVrcGCqf
	sBmHywSDccJT0HiiJbE1dKOn0C1dEOY6WCrQk2E69UeLwyFkwQmA5Oj1sIEoSLioQzWZyBatY2h1F
	hKRyBxnu43P9fcaqzWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5Nw-00Fogy-2E;
	Sat, 09 Sep 2023 21:20:56 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5Nu-00FogD-0p
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 21:20:55 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id F3E5D3200805;
	Sat,  9 Sep 2023 17:20:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 09 Sep 2023 17:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1694294444; x=1694380844; bh=Sn2F/0ubDOgcdhrssDrqzyRGCBkHH7oBOQI
	2a3Dinvw=; b=GwMSj3GmmUGZUz+TzefxuyYs4BxeAeaAzAg9uFmhn+iuiHAcSS0
	UCrIWMAq+eEhHxUOScsfTTCr+XCYuk61sWRBnWlP8byarAIQiuS05kS2uV7d/PO/
	42LKGoTORm/viV/UehjHdWUmrJ68gBAdUbUzMSHTGSVVZKdj0NSHlw5a6g1Byax1
	MKGw2IcAdCl789VxnsQeCAuDkRn+PiOki44TQvWQJKQlrh09KZ4Na9TPXxlvOizw
	SXz7Ufzm0MNh7oi45zHJOXto8bXnuU9CudcCDRLSqtRqa7IJgU2CF594BnRhu6XT
	HtyQ02B5tQQ7KIDGidfmFzHtMiAgzQZhSYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1694294444; x=1694380844; bh=Sn2F/0ubDOgcdhrssDrqzyRGCBkHH7oBOQI
	2a3Dinvw=; b=JXBPmsC1WwVG1Wi+i14PgkFlxICfX0K39Y0SIGAsyVutUYfpmoM
	cbHhKaoaSqemWeyc0xBOOeK3Tceh8FpQJkhiFJYMl4xglCFqy3D0j0Wrc7hjgr6z
	yChJgeyYjK3YajwhZM3AOcNnjZbfRXNYrYKLqfJz5Tr8ZAC+17VEAEX5j0JSF4oV
	oNZtf2A8iquLvyd6W5V0ndEd/DO6KpISEf7uD4wci8agPvsbtBOM4fn9CuH7yNzb
	03uYTZ8og4EsY/ST8/bcmJ+ywpwfyHDH6oeZePz8iOxD+A9NEAWNR+ijgNLzyujJ
	C4dHWJkawuGx3OWcsdmrb7bFkSvW42Mc7Yg==
X-ME-Sender: <xms:q-H8ZPgbPY-tZDHvFsPcSW49oPbyPvlJCr04wYBTLWbaSv0IPkEPAg>
    <xme:q-H8ZMDUuwQUw-TBkbry3YApEn7IPWzGZL5_Yj9BETCm8liLsUzDxcyJXzckcp69Q
    Z9bAnZEStQdIiCx0Q>
X-ME-Received: <xmr:q-H8ZPFtfl2lcnF1mQFNxCxpAlI9sWLZ9OgYZQux4MGKilueQTRF1IrAioHmCUWzMYKYgXA6dtEMBtAVA9NGhmtTQBL4cV2oray7v4NxnpeaPemZ3hedkoZu3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:q-H8ZMTBqgLvdEJiU3F2cVwLmo6piZogtcSt106rPxcBSUoFEP-tMg>
    <xmx:q-H8ZMxcvmFo-citqyBq2p4cKY6o--hIXpR_DweRNSv4E3D_6qoK9Q>
    <xmx:q-H8ZC5nY5rEfTHrgzJsnaucjNyrPZGF7BcgNiMJ4OuDiVGEIzYTKw>
    <xmx:rOH8ZIfbw2x-39473PQatEKS5LHn-7UshH0Ml9ilRqtCVpwKrOF-9A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 17:20:42 -0400 (EDT)
Message-ID: <0e270067-cd2d-ecd0-512b-5dce4865fa4c@sholland.org>
Date: Sat, 9 Sep 2023 16:20:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] RISC-V: Fix use of non existent
 CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
Content-Language: en-US
To: Jiexun Wang <wangjiexun@tinylab.org>
Cc: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, falcon@tinylab.org, jszhang@kernel.org,
 tglx@linutronix.de, conor@kernel.org
References: <20230906123216.255932-1-wangjiexun@tinylab.org>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230906123216.255932-1-wangjiexun@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_142054_329714_41946F7F 
X-CRM114-Status: GOOD (  20.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

The patch is correct, though the subject isn't quite accurate.
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK exists; it is defined in arch/Kconfig.
It's just the wrong option to use to guard the function definition.

On 9/6/23 07:32, Jiexun Wang wrote:
> If configuration options SOFTIRQ_ON_OWN_STACK and PREEMPT_RT 
> are enabled simultaneously under RISC-V architecture,
> it will result in a compilation failure:
> 
> arch/riscv/kernel/irq.c:64:6: error: redefinition of 'do_softirq_own_stack'
>    64 | void do_softirq_own_stack(void)
>       |      ^~~~~~~~~~~~~~~~~~~~
> In file included from ./arch/riscv/include/generated/asm/softirq_stack.h:1,
>                  from arch/riscv/kernel/irq.c:15:
> ./include/asm-generic/softirq_stack.h:8:20: note: previous definition of 'do_softirq_own_stack' was here
>     8 | static inline void do_softirq_own_stack(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~
>       
> After changing CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK to CONFIG_SOFTIRQ_ON_OWN_STACK,
> compilation can be successful.
> 
> Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
> Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>
> ---
> Changes in v2:
> - changed to a more suitable subject line
> - add a Fixes tag
> 
> ---
>  arch/riscv/kernel/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index a8efa053c4a5..a86f272ae2c3 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -60,7 +60,7 @@ static void init_irq_stacks(void)
>  }
>  #endif /* CONFIG_VMAP_STACK */
>  
> -#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
> +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK

It would be good to fix the #endif comment at the bottom of the function
as well.

Regards,
Samuel

>  void do_softirq_own_stack(void)
>  {
>  #ifdef CONFIG_IRQ_STACKS


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
