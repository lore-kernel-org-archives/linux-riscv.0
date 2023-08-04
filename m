Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCF3C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPSq601PJzB4Tt7Cv60g7Brs5Juuy2Fw81ted7mnIuI=; b=lx73UhfZFA7laF
	WH7jTH6VUPBheS7g3mJ1syS7vy6N60j5T5JuBk+2kRP2k5PCu+3jGKGRheifl/jBzwzZjBM5D3isI
	DAsAw7OTLM8DdxSDiL/OivwSWd1SDM7ZgM4qCxzqnx5AmU/Zlf/NFtqn9h9GOte604revFKJ+tbHy
	ZG30xdyLQi572U9V3loT4XB+I5fS1HlZv3xRsjaqfp7Iave0RNKxAr7kUsjsZGZYp/f9Zi3OjZ7qa
	6YBXKGyNAPrKdAj6hnxWRkie9SqwEZYXIR9T2fYvETECg4LLu0tDla2UK1MFXAcRfuDgaOytS+hdh
	sDvn/tg0yZTOaZqmnlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRveO-00Ca8j-29;
	Fri, 04 Aug 2023 14:19:32 +0000
Received: from [2607:5300:203:b2ee::31e5] (helo=smtpout.efficios.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRveL-00Ca8K-1x
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 14:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1691158763;
	bh=8N0/Ipxy1IIEv+7V9seC0pyf9Fmr6LZitvst5gG2Urw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kPUDr0QkoJ80C88DLExAAzVxBuxHzvLT4DRPE13cahq3XYz/cqSW/xRBrU7sUmumf
	 B2ab4FI41aeFzq9aplvbu6vcDxYNLmKH6L8eOV0OOwR9BUwGM/KklwggIUZ1BPJ7/U
	 8CuJ3xu7dcZE/2fS5Hgk6BLMLuW0/LkIVcM4kbdEpinTNBDkKL/9gqPZd6Zi4GhReO
	 nHppH4nAiOjjjOukkdU2ZyCDOHN1dU9A1WPiJJKIMB0PvAYqBbXCjS9/Jhz6nO++82
	 STOBjhjqoAZGunkr+TgSziBb6Zl9utKS1tBzuDmBj6/PKU/fqnIR/iJHPOGr1KkC5F
	 MSo12onLq01gQ==
Received: from [IPV6:2605:59c8:2711:c800::c66] (unknown [IPv6:2605:59c8:2711:c800::c66])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4RHSWt413Wz1Kh6;
	Fri,  4 Aug 2023 10:19:22 -0400 (EDT)
Message-ID: <65350c17-3fcf-a057-a280-f6a5d36dcb21@efficios.com>
Date: Fri, 4 Aug 2023 10:20:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: paulmck@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com
References: <20230803040111.5101-1-parri.andrea@gmail.com>
 <ZMvLoI6PxLR8RJvR@andrea> <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
 <ZMxDe0gXKYbY5jgt@andrea>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZMxDe0gXKYbY5jgt@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_071929_864176_F274C166 
X-CRM114-Status: GOOD (  11.75  )
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

On 8/3/23 20:16, Andrea Parri wrote:
>> Can you double-check that riscv switch_mm() implies a fence.i or equivalent
>> on the CPU doing the switch_mm ?
> 
> AFAICT, (riscv) switch_mm() does not guarantee that.
> 
> 
>> AFAIR membarrier use of sync_core_before_usermode relies on switch_mm
>> issuing a core serializing instruction.
> 
> I see.  Thanks for the clarification.
> 
> BTW, the comment in __schedule() suggests that membarrier also relies on
> switch_mm() issuing a full memory barrier: I don't think this holds.
> 
> Removing the "deferred icache flush" logic in switch_mm() - in favour of
> a "plain" MB; FENCE.I - would meet both of these requirements.

What is the relationship between FENCE.I and instruction cache flush on 
RISC-V ?

On other architectures, there is need for careful flushing of the 
instruction cache for the address range that was modified, _and_ to 
issue a core serializing instruction on all cores (this last part being 
performed by membarrier SYNC_CORE) between the point where the old 
instructions were executed and before the new instructions are executed.

Thanks,

Mathieu

> 
> Other ideas?
> 
>    Andrea

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
