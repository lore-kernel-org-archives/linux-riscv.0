Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64616EE57CD
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 00:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpatKgDN2bLLbZWV/uTc2Y810L0FnNAkEoqwJu7yVaw=; b=Lgc6YNNdCGfKaS
	BNDgLudKFGpKkrAvgmVgtbWDCNaPbGuW/wDcfJvVEMBX7+5yY4wnMJ5qZFFezZGUcnOOKWkPPZkw3
	zcGNSaC4EkneXgDUZBcJ223yBiPjyBanvtjspAXg3Xcf2UVOuDBa2j+zZXU9dBXgdxAem1gA+/V2P
	fv9BJlxl98eJ+65NDAtx+B7YlsF1+ic+axTDnal9tI/NpIM0domY6fSC8cL+PM0kXUYgPujJAqehc
	A6ghpHoBikTFVRLD29pYU4TW2ZDRgyTK/D0dRfPFeWuagvkWmZOXSH35oYwmfRV8fiHCBD8JcLksq
	iIlzhY7TbofubzVjJWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf888-00FxBN-1t;
	Sun, 10 Sep 2023 00:16:48 +0000
Received: from bg2.exmail.qq.com ([106.55.200.77])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf885-00FxB0-0m
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 00:16:47 +0000
X-QQ-mid: bizesmtp62t1694304964txspi1h0
Received: from wangjiexun-virtual-machine.loca ( [120.225.34.249])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 10 Sep 2023 08:16:02 +0800 (CST)
X-QQ-SSF: 01200000000000101000000A0000000
X-QQ-FEAT: LE7C6P2vL8T8dkxfHfUMK4hSz907dsoEo8Skjve4CIaYwaWm+SWYl7AWRESLI
	ehkPraxg98x7BxgHqox8OAu/HvVe5UR7B/uh6GIpTqvIM4VlyioRIajkseCrD5vz0Zo+bMp
	2O1OS8zKXW3HL705eWwadY6uOGid8YnJBkt3hu4yQAl9QBxVhr72wpv5hgaPYrroUi1S8VB
	6tq+RaWxqUsVOblPxsz8V+MWqLRJwTyx2hOlBEl2ONG9mDsAtHeQTlSbEZbohMLT+PvaXl5
	3PhxYZfntGPUz9cQV6W/Vx+YT1KJurmcNGlWIyCN+TJ2pqo3xSYgtehlDyeqsJsNi51+461
	6PlUDSJeTOxhvyJadMEMCjQsNCPTILADZdTDnPvMeI5FpOUlN0=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9083973876487166381
From: Jiexun Wang <wangjiexun@tinylab.org>
To: samuel@sholland.org
Cc: aou@eecs.berkeley.edu,
	conor@kernel.org,
	falcon@tinylab.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	tglx@linutronix.de,
	wangjiexun@tinylab.org
Subject: Re: [PATCH v2] RISC-V: Fix use of non existent CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
Date: Sun, 10 Sep 2023 08:16:01 +0800
Message-Id: <20230910001601.371826-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0e270067-cd2d-ecd0-512b-5dce4865fa4c@sholland.org>
References: <0e270067-cd2d-ecd0-512b-5dce4865fa4c@sholland.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_171645_655054_6B0395E9 
X-CRM114-Status: GOOD (  13.80  )
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

On Sat, 9 Sep 2023 16:20:41 -0500, Samuel Holland wrote:
>Hi,
>
>The patch is correct, though the subject isn't quite accurate.
>CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK exists; it is defined in arch/Kconfig.
>It's just the wrong option to use to guard the function definition.
>

I think I should send a new version of the patch with the subject:
RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK. 
Does this subject look more appropriate?

>On 9/6/23 07:32, Jiexun Wang wrote:
>> If configuration options SOFTIRQ_ON_OWN_STACK and PREEMPT_RT 
>> are enabled simultaneously under RISC-V architecture,
>> it will result in a compilation failure:
>> 
>> arch/riscv/kernel/irq.c:64:6: error: redefinition of 'do_softirq_own_stack'
>>    64 | void do_softirq_own_stack(void)
>>       |      ^~~~~~~~~~~~~~~~~~~~
>> In file included from ./arch/riscv/include/generated/asm/softirq_stack.h:1,
>>                  from arch/riscv/kernel/irq.c:15:
>> ./include/asm-generic/softirq_stack.h:8:20: note: previous definition of 'do_softirq_own_stack' was here
>>     8 | static inline void do_softirq_own_stack(void)
>>       |                    ^~~~~~~~~~~~~~~~~~~~
>>       
>> After changing CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK to CONFIG_SOFTIRQ_ON_OWN_STACK,
>> compilation can be successful.
>> 
>> Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
>> Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>
>> ---
>> Changes in v2:
>> - changed to a more suitable subject line
>> - add a Fixes tag
>> 
>> ---
>>  arch/riscv/kernel/irq.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
>> index a8efa053c4a5..a86f272ae2c3 100644
>> --- a/arch/riscv/kernel/irq.c
>> +++ b/arch/riscv/kernel/irq.c
>> @@ -60,7 +60,7 @@ static void init_irq_stacks(void)
>>  }
>>  #endif /* CONFIG_VMAP_STACK */
>>  
>> -#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
>> +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
>
>It would be good to fix the #endif comment at the bottom of the function
>as well.

Thanks, I will fix this as well.

Best regards,
Jiexun Wang

>
>Regards,
>Samuel
>
>>  void do_softirq_own_stack(void)
>>  {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
