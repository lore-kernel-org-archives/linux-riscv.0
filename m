Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A7C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 04:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPIDqP+2C0E8244slcCvSNv9JEe9V2kOkdWnCbrcrgE=; b=L2znMTqupeOB38tLjnnaYO1zM8
	FiCAHdNe7JCcVO5X4XQCxcIy5AHJHRQB72niJ94SIDgrjbDPx0eWSYjnjJgHOl3Inv+3r5PiFgZPu
	ZDQhERx5TXb3BedW42jsWCwEHMkJxzyHBdwPRiLj9dMxXgnMdVbY5QzS6KIJUvOlBtsjKOp6p6zqY
	Hw175PLJHMCH7OKvh4QKEzmVwwan3hdOQRsUbH361F9C8zJzfrvkSNp3WQc2TN31bEzP76Swoetna
	VztNZFEmMI+igIfPAB42Kv3fKUVgK94UZJjDv6Wk2SrCtAauSeDjyB8WEOnCrGEO0KekVO3jCu0mg
	+LdFUS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf8iR-00000003Xhy-1wbM;
	Thu, 02 Jul 2026 04:07:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf8iP-00000003Xhm-45F8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 04:07:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E32241485;
	Thu,  2 Jul 2026 04:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F051F000E9;
	Thu,  2 Jul 2026 04:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782965273;
	bh=DnEVEcJDxsyM432WD69nOlBblOFD/CeS/4w4EcraZIU=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=l+A32ihnWo8GqzDaLubXnRmf7NUq6k3fcrvbRJ81KHvT4qyyck8EwSViWmtlQ4y+E
	 PYKyGDVV4MK7yNcQNhnqQG/hdihqKL39ueM7zwmAl6eako+ml/Mo8bAqQ3TWAsm73f
	 9kyoIFuNuEDoiQUWo2SvrVxn5rxXpyvA6kjX7BXfwB8kZohk/KGSH8StjUDoimJfU9
	 DbNUA+JXOfKATIWb6fH1SrLZL62Cv+u9VSiD6dKif1HDogW5+N+GhFebA4HHhfjDby
	 xvVh9vhQ+kElVu0/GmhRl6/N9J8AatENAVvJ6yg7msgVgpaMexhx3yVc0l4Wb4BpPa
	 SXWYhEaXb/TYw==
Content-Type: multipart/mixed; boundary="===============1457489896787659387=="
MIME-Version: 1.0
Message-Id: <cee66b78b5bad62e6107ce7579d7e613ad05a258aef8d0ab279b706543651a13@mail.kernel.org>
In-Reply-To: <20260702025443.83389-4-cuiyunhui@bytedance.com>
References: <20260702025443.83389-4-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v7 3/3] riscv: store percpu offset into thread_info
From: bot+bpf-ci@kernel.org
To: cuiyunhui@bytedance.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,dennis@kernel.org,tj@kernel.org,cl@gentwo.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,thuth@redhat.com,ajones@ventanamicro.com,ben.dooks@codethink.co.uk,rkrcmar@ventanamicro.com,cuiyunhui@bytedance.com,samuel.holland@sifive.com,zong.li@sifive.com,conor.dooley@microchip.com,tglx@kernel.org,debug@rivosinc.com,seanwascoding@gmail.com,andybnac@gmail.com,menglong8.dong@gmail.com,cyrilbur@tenstorrent.com,wangruikang@iscas.ac.cn,atishp@rivosinc.com,apatel@ventanamicro.com,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-mm@kvack.org,bpf@vger.kernel.org,arnd@arndb.de,nathan@kernel.org,nick.desaulniers+lkml@gmail.com,morbo@google.com,justinstitt@google.com,qingfang.deng@siflower.com.cn,linux-arch@vg
 er.kernel.org,llvm@lists.linux.dev
Cc: ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  2 Jul 2026 04:07:52 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1457489896787659387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index e9e8ba83e632..137a49488325 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -91,11 +91,7 @@
>
>  #ifdef CONFIG_SMP
>  .macro asm_per_cpu dst sym tmp
> -	lw    \tmp, TASK_TI_CPU_NUM(tp)
> -	slli  \tmp, \tmp, RISCV_LGPTR
> -	la    \dst, __per_cpu_offset
> -	add   \dst, \dst, \tmp
> -	REG_L \tmp, 0(\dst)
> +	REG_L \tmp, TASK_TI_PCPU_OFFSET(tp)
>  	la    \dst, \sym
>  	add   \dst, \dst, \tmp
>  .endm

This isn't a bug, but asm_per_cpu was the only reader of TASK_TI_CPU_NUM,
and it now loads TASK_TI_PCPU_OFFSET(tp) instead.

> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index af827448a609..fbf53b66b0e0 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -38,6 +38,7 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_SUM, task_struct, thread.sum);
>
>  	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> +	OFFSET(TASK_TI_PCPU_OFFSET, task_struct, thread_info.pcpu_offset);
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);

A tree-wide search now finds TASK_TI_CPU_NUM only at its definition in
asm_offsets():

	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);

with no remaining users (TASK_TI_CPU is a separate symbol still referenced
by entry.S).  Could this OFFSET() line be dropped as well?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/28562450933
--===============1457489896787659387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1457489896787659387==--

