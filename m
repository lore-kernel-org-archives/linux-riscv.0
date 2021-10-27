Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC60C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 11:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C462760E8B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 11:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C462760E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcLhZyxR6pCcy2j5F9gouoUAfF6zfvybb0+zcIeNoME=; b=3cMtRDTpZwVfIF
	5+Gp4ZUiKLGZ4UOqQe58OZcVi2qHPBwwJcjxSdU+/GwcBLJBRxMbCnghVCAgLXRIyj4qizckd3KOa
	8gbgyxWBwTTf4Tp5RtKh2/go+pEMzhXI0yuWoyUg/sGcFOx+EdHZfwglZWzNCGZTHgWQfgACYM/uq
	ZnvZDmgrfrLwhb4dTJN4KeQ9rCjpM5Q1K29r6/fxLfX6NdUmTSSWsGrbjjLYWLUD/gGWn07ogUTNE
	Fd5ziavQGxfRIyKzm3yCIxpcx84LRiSKs2jHsIvi3RA8L2AjfVkEzlPfvg4yjGfsOMC/YyaFlMzLp
	8EEYVRQKRGQrCadxzqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhSL-004ltf-Ip; Wed, 27 Oct 2021 11:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhSI-004lrm-R1
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 11:50:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9AD31FB;
 Wed, 27 Oct 2021 04:50:51 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.72.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51AF43F73D;
 Wed, 27 Oct 2021 04:50:47 -0700 (PDT)
Date: Wed, 27 Oct 2021 12:50:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
Message-ID: <20211027115043.GB54628@C02TD0UTHF1T.local>
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211027111822.3801679-1-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_045054_946082_E2089C54 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Oct 27, 2021 at 11:18:22AM +0000, Tong Tiangen wrote:
> When a tracing BPF program attempts to read memory without using the
> bpf_probe_read() helper, the verifier marks the load instruction with
> the BPF_PROBE_MEM flag. Since the riscv JIT does not currently recognize
> this flag it falls back to the interpreter.
> 
> Add support for BPF_PROBE_MEM, by appending an exception table to the
> BPF program. If the load instruction causes a data abort, the fixup
> infrastructure finds the exception table and fixes up the fault, by
> clearing the destination register and jumping over the faulting
> instruction.
> 
> A more generic solution would add a "handler" field to the table entry,
> like on x86 and s390.
> 
> The same issue in ARM64 is fixed in:
> commit 800834285361 ("bpf, arm64: Add BPF exception tables")

> +#ifdef CONFIG_BPF_JIT
> +int rv_bpf_fixup_exception(const struct exception_table_entry *ex, struct pt_regs *regs);
> +#endif
> +
>  int fixup_exception(struct pt_regs *regs)
>  {
>  	const struct exception_table_entry *fixup;
>  
>  	fixup = search_exception_tables(regs->epc);
> -	if (fixup) {
> -		regs->epc = fixup->fixup;
> -		return 1;
> -	}
> -	return 0;
> +	if (!fixup)
> +		return 0;
> +
> +#ifdef CONFIG_BPF_JIT
> +	if (regs->epc >= BPF_JIT_REGION_START && regs->epc < BPF_JIT_REGION_END)
> +		return rv_bpf_fixup_exception(fixup, regs);
> +#endif
> +
> +	regs->epc = fixup->fixup;
> +	return 1;
>  }

As a heads-up, on the extable front, both arm64 and x86 are moving to
having an enumerated "type" field to select the handler:

x86:

  https://lore.kernel.org/lkml/20210908132525.211958725@linutronix.de/

arm64:

  https://lore.kernel.org/linux-arm-kernel/20211019160219.5202-11-mark.rutland@arm.com/

... and going forwards, riscv might want to do likewise.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
