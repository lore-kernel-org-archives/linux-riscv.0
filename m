Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5366C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:Cc:To:References:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVlhILQroN5M9GXJudubhWtcZvJ7ZNFmXYiVf8AhVfQ=; b=CI60Q6em5wwgiO
	fk9QqXi88tj29PgB91egEbVrTcKgow31vJS1yE+GoT8oZ7zokyOaBQbskzyrY1HBNCrPRjY5empUv
	lAok5xWf9iUGRWqamvA7+fOVhg30wirpS8C/dN+rG2NlaSX6BRMgErBPqa4bLZl09pw0ixPK3sSw6
	/Bf408CmxkqNqSiyh6i9OMts8dEWNrQ3OqpaKLkWtbVSaElbnfKVtmVUIhns2ToBIymt2RAjO+vtO
	CPrqeQmSe37aUR75IdlGfhitEOeSredt6LNoxWx6Mr60FplSXaZFLF1i4xO4Vn15UScc0UBoY2/SM
	RttaMghG1stM5XHrBTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pquhH-00GEfy-2j;
	Mon, 24 Apr 2023 11:49:31 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pquhF-00GEfD-0K
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 11:49:31 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxSurDbEZkigYAAA--.58S3;
	Mon, 24 Apr 2023 19:49:23 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxebbBbEZknrc4AA--.11256S3;
	Mon, 24 Apr 2023 19:49:22 +0800 (CST)
Subject: Re: [PATCH] riscv: uprobes: Restore thread.bad_cause
References: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 Oleg Nesterov <oleg@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f60e6e0f-a520-2e8d-0b81-6b15498cb300@loongson.cn>
Date: Mon, 24 Apr 2023 19:49:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf8DxebbBbEZknrc4AA--.11256S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Aw1Utw4rZFyDXF1DZw48Xrb_yoW8Xrykpa
	1DCF4rtFn8Jws3Ja47Ja95Wry0vF95Wr47Wr17AayfJwsrKrW5Zw40gFWDtF1Yyrs5Kr18
	ZFyjqryIvay7JrJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jz2NtUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_044929_499173_8E39FD35 
X-CRM114-Status: GOOD (  13.92  )
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
Reply-To: loongson-kernel@lists.loongnix.cn
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cc:
Oleg Nesterov <oleg@redhat.com>
Srikar Dronamraju <srikar@linux.vnet.ibm.com>

On 04/23/2023 09:42 AM, Tiezhu Yang wrote:
> thread.bad_cause is saved in arch_uprobe_pre_xol(), it should be restored
> in arch_uprobe_{post,abort}_xol() accordingly, otherwise the save operation
> is meaningless, this change is similar with x86 and powerpc.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/riscv/kernel/probes/uprobes.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> index c976a21..194f166 100644
> --- a/arch/riscv/kernel/probes/uprobes.c
> +++ b/arch/riscv/kernel/probes/uprobes.c
> @@ -67,6 +67,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>  	struct uprobe_task *utask = current->utask;
>
>  	WARN_ON_ONCE(current->thread.bad_cause != UPROBE_TRAP_NR);
> +	current->thread.bad_cause = utask->autask.saved_cause;
>
>  	instruction_pointer_set(regs, utask->vaddr + auprobe->insn_size);
>
> @@ -102,6 +103,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>  {
>  	struct uprobe_task *utask = current->utask;
>
> +	current->thread.bad_cause = utask->autask.saved_cause;
>  	/*
>  	 * Task has received a fatal signal, so reset back to probbed
>  	 * address.
>

Hi Oleg and Srikar,

Could you please review this patch, thank you.

Thanks,
Tiezhu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
