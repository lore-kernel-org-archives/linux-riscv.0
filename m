Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE06BCAC58D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgD4jrBs28lKh2AC26aCVe0gMjVKHcvGMoUtbBSrge8=; b=t0YxmZlyLjWhH9/Zi7y2aWUiWd
	QLzl4dtSpt81Re8o93BCkFuGcrKT5xGu68y1vrdK3DhALIucDvLPsV6xEZ+8sOhxn9BHMkFGwa63V
	PS804Hl2Yzq/B9jA+IcbA5cGMStUOCHwZHMYMueFNWTRvlFfDe66YzT/tiK8XJt5Q4oqXpHpdpFrA
	CXjwYu1Mg0cZVoL/1U3+wvbsVWR5f4EuqtjHJjr3P3MOxu9V9qo0iMZdFriwL69vWPIFj94+M/u9S
	s+HSfkHn49JmOYgAQqhR87BXRTLX9vDaqUwD5zx8B73Odlcr2w0p1VVlzqd2bOB8upxWtnJK0bqJx
	tmYd7TJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqarQ-00000006TlJ-3HRj;
	Tue, 17 Sep 2024 16:15:28 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYt2-00000006HUr-217R
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 14:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3aXEZKcXMJ5ziv2kml8HWagXVp/G+gCcLnf9PSnoXEo=; b=HSSME6GVjVPOxFgt5twCnlOrQ+
	8waZHuuTJp4w0z+RdlbbhpJaF2xdOmMxXJw3hNrf7K0oQ+rmQSV+PKCy/6SPZG+9PSlWF65hK5VEo
	3UfRHITnHcCNTm7UjOIRijtz+0rdQDkXm02+lETHALGWpN+jpeyUQgRkQMcWkvhtNBuOXgj1MjTHd
	vRIjgC1gTP6521pMYtH1BZ5rLtZ7beKer58AelP1YY2QwNlAVnGOuO6dyUfhPFH13QPgd3WMwo01A
	HeYDy2vs693TkLnwBqRbHJetrgoj3mViCUkeXlEegH74I6FXT5pPV6S25tnioERN2dDimdDWUl8m+
	03RNKQDw==;
Received: from [83.68.141.146] (helo=[10.136.0.254])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqYsz-00BSso-Mc
	for <linux-riscv@lists.infradead.org> ; Tue, 17 Sep 2024 15:08:57 +0100
Message-ID: <44dfbf73-a6af-490e-b1cb-182583d5e7f5@codethink.co.uk>
Date: Tue, 17 Sep 2024 15:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: add trap and emulation for RDCYCLE
To: linux-riscv@lists.infradead.org
References: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
 <20240917130853.18657-4-ben.dooks@codethink.co.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20240917130853.18657-4-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_070900_562955_773E61CA 
X-CRM114-Status: GOOD (  18.69  )
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

On 17/09/2024 14:08, Ben Dooks wrote:
> Add a trap for RDCYCLE and emulate it as RDTIME instruciton.
> 
> This is an initial PoC and should probably be made more generic
> way of trapping and dealing with bad instructions
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>   arch/riscv/kernel/traps.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 1c3fab272fd1..51ea28ebf54d 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -167,6 +167,35 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>   DO_ERROR_INFO(do_trap_insn_fault,
>   	SIGSEGV, SEGV_ACCERR, "instruction access fault");
>   
> +#define is_system(__i) (((__i) & 0x7f) == RVG_OPCODE_SYSTEM)
> +
> +static bool riscv_try_csr_fixup_user(struct pt_regs *regs, u32 insn)
> +{
> +	/* expecting a 4 byte CSR instruction (*/
> +	if (unlikely(GET_INSN_LENGTH(insn) != 4))
> +		return false;
> +
> +	if (is_system(insn)) {
> +		u32 csr = insn >> RVG_SYSTEM_CSR_OFF;
> +		u32 rd = (insn >> RVG_RD_OPOFF) & RVG_RD_MASK;
> +		u32 rs = (insn >> RVG_RS1_OPOFF) & RVG_RS1_MASK;
> +		u32 funct3 = (insn >> RV_INSN_FUNCT3_OPOFF) & 0x7;
> +
> +		if (rs == 0 && funct3 == 2 && csr == CSR_CYCLE) {
> +			u64 val = csr_read(CSR_TIME);
> +			/* we've got a RDCCLYE, emulated it with CSR_TIME */
> +
> +			printk_ratelimited("PID %d: process using RDCYCLE, emulating with RDTIME\n", current->pid);
> +
> +			regs_set_register(regs, rd*sizeof(unsigned long), val);
> +			regs->epc += 4;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
>   {
>   	bool handled;
> @@ -186,6 +215,8 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>   		}
>   
>   		handled = riscv_v_first_use_handler(regs, insn);
> +		if (!handle)
> +			handled = riscv_try_csr_fixup_user(regs, insn);
>   
>   		local_irq_disable();
>   

oops, forgot to fold in a fix patch, this has 2 issues.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
