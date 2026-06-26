Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA26CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDha5+ibYOQFtR/MPgESAtnu/AJeSJGwcmiQKdiddJA=; b=s9Ungu/JmwzqB6
	zDx2fGbY+hu6XdBJ78x9nDZzr1xOoQPgqiyJs6pnu11U7V5rZY39eO/RJE4dmigrk0W47djhGN2qq
	bZo4ZQhB+VFbA6UK+0aF56g4VCB3LIXhorX2P0ilFZ/F/TP/+Oc9yTsZqllHYpiyoV1U7sScTf9KY
	oH7c0RE0wQosSzt2JyoLLVvB45Jc4VAvuzgovxARI9fG4pQYo5Jj0wjgIa5IXAt5FQ4f8akoaCGaL
	CTYygAM9pH055JcVS5HtlO982CW7Ufw6QmMx6T7hCkJgQZWzJuWEFBFTskAxZGDYtE/zsY2ZGcyua
	omKpj1LEux9QSxNVZ2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1CJ-0000000Agvj-3st6;
	Fri, 26 Jun 2026 07:41:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1CH-0000000Agux-1G09
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 07:41:58 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjrjzY1Mz4M7W7+mH6SFfvv5SyOtbQWDc5tfJ0WRI/Q=;
	b=ZVGM5QZw9KCXdT0Cf6on+p+YGML7b4zbyU0Yb974g9K2U1C7zHhVcgPPibiDNELVYKIfaD
	8CcTdiD+WTeRDscyJ+sXWtyLPSK9/zvbZoQnRYby9q0BWeVthOl78i3162b/uiMxQphOXQ
	VBm+i0zW6umWmUkkKsQK/eDgP7VDUON/solg8EeBpzKoSRfH56GiQjR4mwfj8r8UOsKp1d
	Ab81hn9WvL02LVcbHgOhJgIK78CEORwqEpGU16NGekxZt45+Z/AKcGY9NGzPmdqlXbN2rR
	ug4JFmztIoOJkcI7gVDqDj8OSRkwR/dosufAqeV89z29sZcNJm1z/GVKZGcLDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjrjzY1Mz4M7W7+mH6SFfvv5SyOtbQWDc5tfJ0WRI/Q=;
	b=MujXDXRMGSDVucDnztmf/AbszPzXcOcDKQNVn41vDWFHKrg/u2Js3lyDCt8paFE0Uy1pwE
	3YAI6uaKuG7/liCQ==
To: Xiaofeng Yuan <xiaofengmian@163.com>, pjw@kernel.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Xiaofeng
 Yuan <xiaofengmian@163.com>
Subject: Re: [PATCH v3] riscv: probes: simulate c.jal instruction
In-Reply-To: <20260626062228.54873-1-xiaofengmian@163.com>
References: <20260626062228.54873-1-xiaofengmian@163.com>
Date: Fri, 26 Jun 2026 09:41:54 +0200
Message-ID: <87echtiw8t.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004157_507829_C47E47EB 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 65d9590bf..8506470e9 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -29,7 +29,7 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	 * TODO: the REJECTED ones below need to be implemented
>  	 */
>  #ifdef CONFIG_RISCV_ISA_C
> -	RISCV_INSN_REJECTED(c_jal,		insn);
> +	RISCV_INSN_SET_SIMULATE(c_jal,		insn);
>  	RISCV_INSN_REJECTED(c_ebreak,		insn);

Nit: move this RISCV_INSN_SET_SIMULATE down to be with the others.

>  	RISCV_INSN_SET_SIMULATE(c_j,		insn);
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index fa581590c..6d7a5f949 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -163,6 +163,14 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
>  	return true;
>  }
>  
> +bool __kprobes simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	if (!rv_insn_reg_set_val(regs, 1, addr + 2))
> +		return false;

rv_insn_reg_set_val() is a helper to change a register by index. But
it's always RA in this case, so I think it's much clearer to simply:

	regs->ra = addr + 2;

(with the two above suggested changes, the patch would look identical to
a patch I have but I forgot to send, and I would be able to give my
Tested-by tag without additional effort from me :D)

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
