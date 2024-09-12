Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B3EEB565
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5iVd6cjA1uEEGu3pD0Qm7QTqD6sIQ955rhOhQdwwYY=; b=b/7nrkhiR3mHV0
	YdceaRk0NRck3YM1LHc7VlU8n7Q+mg8WXL4tkQwMXYVFGnXdwWYHkQmxhbBBh7nK0iiSuyk0E2hpE
	ETSLSJRs95ErFbUwgVEH1C+7r6x4AqBDOvXwzoLvSAXGnLYGUxI5rt/fGD+DU5wTeV0a243JMntX6
	iHQVGfNHMpZ2+qofmqDbBc5ZUFeG8mBC41fUuhM6p0XKaqzl9tyEpeLarpw2FQzyOW2xIPzaICSkt
	WyIr8BH+gn3V/kkfurPsDo21zf7mr4O/Qcla56f86GU6yR7TrXk1stTCMg+/eK36IbLNks5IGL6QY
	uTH5js2YZzRyfbr50rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofjp-0000000CSiw-1ooV;
	Thu, 12 Sep 2024 09:03:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofjl-0000000CShr-1hm0;
	Thu, 12 Sep 2024 09:03:40 +0000
Received: from [192.168.12.114] (unknown [180.111.103.6])
	by APP-01 (Coremail) with SMTP id qwCowAC3aKhbruJmh60BAw--.7963S2;
	Thu, 12 Sep 2024 17:03:24 +0800 (CST)
Message-ID: <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
Date: Thu, 12 Sep 2024 17:03:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to
 guest
To: anup@brainfault.org, ajones@ventanamicro.com, atishp@atishpatra.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
Content-Language: en-US
From: Quan Zhou <zhouquan@iscas.ac.cn>
In-Reply-To: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
X-CM-TRANSID: qwCowAC3aKhbruJmh60BAw--.7963S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtF1rtr1xWF43Gr4fGFW8Xrb_yoW8JryrpF
	43CF1a9r4rWFyq93WIvrs7uFWIqwn5K3ZxWr4jqFW5Xwsrtas5Crs0g3yUtFy8Gr4rX3yI
	9F4IqFyvyFn8twUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07UN2-5UUUUU=
X-Originating-IP: [180.111.103.6]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCQ8SBmbifb-JEgAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_020338_883744_A3B6C87D 
X-CRM114-Status: GOOD (  12.45  )
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


On 2024/8/29 14:20, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The M-mode redirects an unhandled instruction access
> fault trap back to S-mode when not delegating it to
> VS-mode(hedeleg). However, KVM running in HS-mode
> terminates the VS-mode software when back from M-mode.
> 
> The KVM should redirect the trap back to VS-mode, and
> let VS-mode trap handler decide the next step.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/kvm/vcpu_exit.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index fa98e5c024b2..696b62850d0b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -182,6 +182,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>   	ret = -EFAULT;
>   	run->exit_reason = KVM_EXIT_UNKNOWN;
>   	switch (trap->scause) {
> +	case EXC_INST_ACCESS:

A gentle ping, the instruction access fault should be redirected to
VS-mode for handling, is my understanding correct?

>   	case EXC_INST_ILLEGAL:
>   	case EXC_LOAD_MISALIGNED:
>   	case EXC_STORE_MISALIGNED:
> 
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
