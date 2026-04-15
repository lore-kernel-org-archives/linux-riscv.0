Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56129F9D0CE
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZRUjqvIIT6JCB0ejjDmzYilqcyZPR0h/An3rOOLjKs=; b=TyHPOeM6ARkdZY
	9AkcyMenb1bxLiJmja14jjyoXqKlMRSAhTEKlB9wFVYOkJvsrCK9kye6L1hhNd0NZK8GdI/RDWt7x
	qcMiOINCRbXJNOMeCa1UgO5gaJaDTdX9lmYtwTcCwIm4X0sn+zWIfCcM1cqNP72h/GU5BJxgqLF79
	bT0br5HFHAPnCVFV/uISkIOyAWVdJgtAmmZN2hv2HgqkWwdsEESo6E8IIo+wexGe0KKTl0uVjSKzh
	l0F9PV4h3PnAwFNQ0jg/Fhfpdib+QVkS8x7RDiDpv29t5KRroDw49S+03xk9Nu2mRGTK9NR8YuDDb
	AKXq7xlY84qDwjHcd5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpeF-00000000T9r-2MOs;
	Wed, 15 Apr 2026 02:06:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpeE-00000000T9g-2Jqa
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 02:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 626BC60130;
	Wed, 15 Apr 2026 02:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB00C19425;
	Wed, 15 Apr 2026 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776218793;
	bh=wrPhtXBTaIZ8n5auWmKEqYCeajJmghFT1WeRrnKaIFI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O9Vb+PIkUQqTLoT8BXzdxs53f7IgCa1Si1+RDST2lxRhV9PCz5L9zzqt65UAxTK+O
	 nMJS0RGVyyFXpjx4UZPXWMurEVtOaZnO9uoX3r1Nj3CqPr+lq8XDi62CSwwLUbZr2e
	 Qbd3YcfTxIYPW6ad00zZW/solNDl7burQnYAx7CvbY37CURkRVMnF7BLmOCKuaaCs2
	 OOoH0Tlnp3fIaGpF2ADjmrRBAdKbxGdIqE+JRxPu/Q5D3JTP0Ygn2S0d09wZKW/JBF
	 7yVzhL2bNEVO6YtZ2Q3RCMVtUDDZch1P4YHSkn/1EOazHVjXCTfasp9dL9cyYUv9Za
	 C+EuPJvvTOdyw==
Message-ID: <d38e585f-554a-4f81-8136-981870fe3383@kernel.org>
Date: Wed, 15 Apr 2026 12:06:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: smp: Align secondary_start_sbi to 4 bytes
To: cp0613@linux.alibaba.com, pjw@kernel.org, anup@brainfault.org,
 andrew.jones@oss.qualcomm.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260413132009.133752-1-cp0613@linux.alibaba.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260413132009.133752-1-cp0613@linux.alibaba.com>
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

On 13/4/2026 23:20, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> During SMP boot, the secondary_start_sbi address is passed to the
> slave core via sbi_hsm_hart_start. In OpenSBI, this address is
> written to STVEC in sbi_hart_switch_mode.

...

> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6fe8..9f33be6260e1 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -127,6 +127,7 @@ relocate_enable_mmu:
>   #endif /* CONFIG_MMU */
>   #ifdef CONFIG_SMP
>   	.global secondary_start_sbi
> +	.align 2
>   secondary_start_sbi:
>   	/* Mask all interrupts */
>   	csrw CSR_IE, zero


Minor nit, but IMHO .balign is preferable in new code. It always byte 
aligns, whereas .align has different meanings across architectures, and 
on some arches (including riscv) requires the reader to do the math to 
convert to a byte alignment.

These days there's also the SYM_CODE_START etc. macros defined via 
linkage.h, which use __ALIGN from arch/riscv/include/asm/linkage.h, 
which is already .balign 4.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
