Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9089D69105
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYQA1nVHVGz4GvQs7CIk1R7Sc60AezB/JCo8nk0StV4=; b=eebwghBMV9KjT0
	7OD3+zhB02dq4cplVCYcQPwQ4lRehvLo1z6zhFhgVu/AmBHQ/PJZETjQBcybSftm6xKmvA8iNTFtG
	hdtfB62RNWUkZ5ia9zAlE+s2r1WVLJ0cGYd9jDdLzF+4ifAKVZySYT2JQ+zhsoe3XAhQC8dXq6EF/
	UWeQpxorPln8A2Na29rUDsEpASTkt7gQFLzdxlIzpJ1wRttl7WSMJTikhhZ6Jh0JVQJi5nWwOz8Vx
	okJmT4cJtgD0VEfHn/YnNbaiaq7xHcCPbXT2L7zgd1I/i3rheVdvUhnurB0R1ywf/XZOjTquyZZ2C
	EwYyQw0EKdR++65oJtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeAU-0000000FZyR-2Cwj;
	Thu, 28 Nov 2024 13:02:50 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeAS-0000000FZxO-0LAe
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 13:02:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E022660005;
	Thu, 28 Nov 2024 13:02:40 +0000 (UTC)
Message-ID: <7662be43-16e6-4695-9bc4-077e1dd3ba12@ghiti.fr>
Date: Thu, 28 Nov 2024 14:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: kprobes: Fix incorrect address calculation
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: John Ogness <john.ogness@linutronix.de>, stable@vger.kernel.org
References: <20241119111056.2554419-1-namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241119111056.2554419-1-namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_050248_267858_D2BAE997 
X-CRM114-Status: GOOD (  15.86  )
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

On 19/11/2024 12:10, Nam Cao wrote:
> p->ainsn.api.insn is a pointer to u32, therefore arithmetic operations are
> multiplied by four. This is clearly undesirable for this case.
>
> Cast it to (void *) first before any calculation.
>
> Below is a sample before/after. The dumped memory is two kprobe slots, the
> first slot has
>
>    - c.addiw a0, 0x1c (0x7125)
>    - ebreak           (0x00100073)
>
> and the second slot has:
>
>    - c.addiw a0, -4   (0x7135)
>    - ebreak           (0x00100073)
>
> Before this patch:
>
> (gdb) x/16xh 0xff20000000135000
> 0xff20000000135000:	0x7125	0x0000	0x0000	0x0000	0x7135	0x0010	0x0000	0x0000
> 0xff20000000135010:	0x0073	0x0010	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000
>
> After this patch:
>
> (gdb) x/16xh 0xff20000000125000
> 0xff20000000125000:	0x7125	0x0073	0x0010	0x0000	0x7135	0x0073	0x0010	0x0000
> 0xff20000000125010:	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000
>
> Fixes: b1756750a397 ("riscv: kprobes: Use patch_text_nosync() for insn slots")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: stable@vger.kernel.org
> ---
>   arch/riscv/kernel/probes/kprobes.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 474a65213657..d2dacea1aedd 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -30,7 +30,7 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>   	p->ainsn.api.restore = (unsigned long)p->addr + len;
>   
>   	patch_text_nosync(p->ainsn.api.insn, &p->opcode, len);
> -	patch_text_nosync(p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
> +	patch_text_nosync((void *)p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
>   }
>   
>   static void __kprobes arch_prepare_simulate(struct kprobe *p)

This looks good to me, how did you find this issue?

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
