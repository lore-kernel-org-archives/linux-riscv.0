Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E4C5AD4E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xjo4JTrgIZl2kEu3TwGcM3Y8womoFIlGqzIA810sulg=; b=JlOWeNPXDKFJTx
	WtmrqytOV+LwHyUeUak7x8qDlasc1JnDJZNUPct0C9rQwf3oTmfIK2YFW0WYXcjoN70xKw9nQRdOa
	mfdhZCjKBdCyHt7GKdl9u7TQILOvkYbgklI0zeW0aP7f2ZYHjRxJAM8Fll1yBFKNGh95hxKmKNKU4
	KCI69wHYrq73ySuAfAC+KPyEbmQUFOgsgKdswHi+unyXjtPwsv9xje7LjPy5raT779FHHGk9PBjLz
	UOhBJS2Nv5EVaq2Uaoz5b17xRBo7qavbKOwmV55wIqZZVQb06Y+iDG/5qXRUtwVKCRLp+ZycrKtgE
	NNNmWp60b2BvWCU5l7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMQZ-0000000BPup-19DB;
	Mon, 10 Aug 2026 09:36:15 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMQW-0000000BPuC-0jod
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 09:36:14 +0000
Received: from [198.18.0.1] (unknown [121.237.244.183])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzmFm3lqvWlyBA--.59127S2;
	Mon, 10 Aug 2026 17:36:06 +0800 (CST)
Message-ID: <e0335440-3746-43e2-829d-54164a667a75@iscas.ac.cn>
Date: Mon, 10 Aug 2026 17:36:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: uprobe: Relax SYSTEM instruction validation
Content-Language: en-US
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260720080016.49842-1-daichengrong@iscas.ac.cn>
From: daichengrong <daichengrong@iscas.ac.cn>
In-Reply-To: <20260720080016.49842-1-daichengrong@iscas.ac.cn>
X-CM-TRANSID: rQCowAAXGzmFm3lqvWlyBA--.59127S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF43Xr1xJw4UCFWkXw18Krg_yoWrWFWrpF
	Z8Cwn3CF4kWrs3Ca4fAw48ur4YgayrGw43Gr90vw47Ka98tr98tFn7t3y5tr1kJrWjqr1j
	qr129r95Za47A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xS
	Y4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUY
	enQ5UUUUU==
X-Originating-IP: [121.237.244.183]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_023612_590745_75C4AB8B 
X-CRM114-Status: GOOD (  18.99  )
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


On 7/20/26 16:00, daichengrong wrote:
> RISC-V uprobe currently rejects all SYSTEM instructions during
> instruction validation.
> 
> This policy is conservative, but it also rejects CSR instructions that
> only read architectural state, preventing uprobe from instrumenting
> user applications containing such instructions.
> 
> This RFC proposes refining the SYSTEM instruction validation by
> distinguishing read-only CSR instructions from CSR operations that may
> modify processor state. Read-only CSR instructions are allowed, while
> CSR write operations and other SYSTEM instructions continue to be
> rejected.
> 
> The RISC-V ISA permits implementation-defined side effects on some CSR
> reads. Feedback is welcome on whether instruction-level validation is
> sufficient, or whether additional validation based on CSR properties
> would be more appropriate.
> 
> Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/insn.h          | 15 +++++++++++++++
>  arch/riscv/kernel/probes/decode-insn.c |  2 +-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index c3005573e8c9..08c6be4609ea 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -600,4 +600,19 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
>  	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
>  	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
>  }
> +
> +static __always_inline bool riscv_insn_is_csr_read(u32 code)
> +{
> +	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_SYSTEM &&
> +			(GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRS)
> +				 || GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRC)
> +				 || GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRSI)
> +				 || GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRCI)) &&
> +			 RV_EXTRACT_RS1_REG(code) == 0;
> +}
> +
> +static __always_inline bool riscv_insn_is_system_except_csr_read(u32 code)
> +{
> +	return riscv_insn_is_system(code) && !riscv_insn_is_csr_read(code);
> +}
>  #endif /* _ASM_RISCV_INSN_H */
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 65d9590bfb9f..4a6a33b95159 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -21,7 +21,7 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	/*
>  	 * Reject instructions list:
>  	 */
> -	RISCV_INSN_REJECTED(system,		insn);
> +	RISCV_INSN_REJECTED(system_except_csr_read,		insn);
>  	RISCV_INSN_REJECTED(fence,		insn);
>  
>  	/*

PING.

I'd like to add some motivation for this change.

Direct CSR accesses have traditionally been relatively uncommon in ordinary
userspace applications. However, as more RISC-V architectural extensions are
used by userspace software, reading architectural state through CSRs is
becoming more relevant.

The Vector extension is one example. Vector-enabled applications, runtime
libraries, and compiler-generated code may contain CSR reads as part of
querying or managing architectural state. Similar cases may also appear with
other extensions that expose useful state to userspace.

Therefore, rejecting all CSR instructions in uprobe validation can prevent
instrumentation of otherwise valid userspace code even when the instruction
only observes architectural state and does not modify it.

The intent of this RFC is to distinguish such read-only CSR accesses from
operations that modify processor state. CSR writes and other SYSTEM
instructions would remain rejected.

There is still the question of CSR read side effects permitted by the ISA.
Feedback would be appreciated on whether checking the instruction semantics
is sufficient here, or whether we should additionally restrict the set of
CSRs that uprobes may accept.

Thanks,
Chengrong


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
