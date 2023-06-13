Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78085C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 06:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQYhxhfR/7PQQHI9mWVRl16V1WZ2TBc3cXiNJ0gCIBY=; b=T2KsnzoUjCuUpU
	FYYak8U6mVNZ+XxdSSGWqKN/C6C4G70SlxQJOgfyV4c8fu/YbbaPPu6wYKu0EpkRUC14h6Jf6GLWh
	I7AcWLdt0+a4xkhnNQwzxKZFm4P3UiMjNZuk7F2suaDDRcEqIvTbnlL9LmKGm265ZLqUJlB/mAMIB
	jep9MBrX4QSDcOaOowLXcW5jz7U8gqsx20sL4+BWWBHQ0+jLYR3PkSu8jtuHtW3Lg1YdsGBF3Eqwe
	ZjnNplKgxkx2YunVZ2Ct4fmko/8tH1AwBJHu5h/JbP0pqj4rB0phGdTMoc1ihWvhMfM6lDrX2/b2N
	1K0k9Beq41hssN0hmUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8xeQ-0075n6-1w;
	Tue, 13 Jun 2023 06:37:10 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8xeN-0075lW-0r
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 06:37:09 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 52BFF32006F5;
	Tue, 13 Jun 2023 02:36:59 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Tue, 13 Jun 2023 02:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1686638218; x=1686724618; bh=3F
	ZTRxLrHXD3Xm5q4Gr9FJo1SoQ3BCmMhPOkll2o7pw=; b=Z1Q5htHfdGX5fBNvv4
	sveyeHD0Hwx1nBULbzz4lGXbxo6P7l2zrE+3IC/veQLUUTsJr3DQ5ye55vgawVPP
	Z/A9EwVoOhUtkzh0nrSpiCgwiAI4KPgn+HrZ6/1ovOBiRNfS9yIBDT7tEAkCOqDh
	73cJBUPLzTlHAtdD4bnatgr4GrBRHjhWzjVl8X7NkDwNQwVXqlnyQoW+DLliTZXx
	15aeBFU1kourbUW6Sp2z9VBoAfaFf+mUF3NTIcUpokvSdxjcY0Gw1+vG2pOzbNjb
	ITkDQUyHjR6/ilt2Dwnfs+tfdK5vWMEuqeivWEvvlgPaAJD6Wf9djZ2qY55HjpMe
	Pbew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1686638218; x=1686724618; bh=3FZTRxLrHXD3X
	m5q4Gr9FJo1SoQ3BCmMhPOkll2o7pw=; b=m6iNhMZ+Zn4Krpl3SHtx2X8RAz0ff
	e8TSRlW5bTRnzraYYJeOrLdy2jjL6hTbApLUD4zwOVbyIlvA++UsJ2aPTBrCK3D6
	9Pu2PP+rzdcQcMvXsxVoW87Hp0Iu6aOx2NN/EWM6EL8ZwmQIT6Mrql5tkWP3LrlV
	s45Pc1HFG98isBVyGRrSfnTuFICuEj0k5nf8CwCu1H/wfyBJF0K5WZEEIQ/B+Cq7
	wJuJOi/NeomHEEgS9tVwP1xmSZRZH43RPFqgiotmbnyGvRQCaOzZfF4Nw1RlHyZw
	TWu3wgPqjty+TezvnauB47Nbp4RfdGuEqVQq/sa0C5xjqxHxU35t3b2uA==
X-ME-Sender: <xms:ig6IZHjxvmCEGYiVMNt3t-f8TivcklBZWqM6qye8_JlDamPbaHXKFQ>
    <xme:ig6IZEC81LBtFICISnpaqFE0kc4VE1Ztf6AedC1zCRAKuGXsPqL6o-RRqNgCal4Wf
    JsRyaf2FpWzUKdceQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpeefudejvdejuddvjeejudekgfeikeevveevleeitddvtedu
    jeegjeejgfeugfeiudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ig6IZHH_FW5IDhG5XbukEga-97ECL21KVm2yXWtd35blv9dDqHuCCA>
    <xmx:ig6IZES17GFt_TuoSBGbUAAALgR5_Vf7Bd8Jl9P9ij_7KiVDE_PmGw>
    <xmx:ig6IZEwKmKtr5TpsPALaV1g-MsiZQDtI3a77vzmaSbw9rU1OTe0IhA>
    <xmx:ig6IZLmkKySqM5X0srh4F9E50VuyRVe70Aog6zksBgAsK_2mXGLrtA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6F0A91700093; Tue, 13 Jun 2023 02:36:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-492-g08e3be04ba-fm-20230607.003-g08e3be04
Mime-Version: 1.0
Message-Id: <75071be8-272d-45e7-989f-5d717f313fe2@app.fastmail.com>
In-Reply-To: <20230228215435.3366914-3-heiko@sntech.de>
References: <20230228215435.3366914-1-heiko@sntech.de>
 <20230228215435.3366914-3-heiko@sntech.de>
Date: Tue, 13 Jun 2023 02:35:53 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Heiko Stuebner" <heiko@sntech.de>, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org, "Heiko Stuebner" <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_233707_792550_A0C6CBE9 
X-CRM114-Status: GOOD (  13.20  )
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

On Tue, Feb 28, 2023, at 4:54 PM, Heiko Stuebner wrote:
> @@ -29,6 +78,7 @@ static __always_inline bool has_vector(void)
>  static inline void __vstate_clean(struct pt_regs *regs)
>  {
>  	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
> +
>  }
> 
>  static inline void vstate_off(struct pt_regs *regs)
> @@ -58,30 +108,75 @@ static __always_inline void rvv_disable(void)
> 
>  static __always_inline void __vstate_csr_save(struct __riscv_v_state *dest)
>  {
> -	asm volatile (
> +	register u32 t1 asm("t1") = (SR_FS);
> +
> +	/*
> +	 * CSR_VCSR is defined as
> +	 * [2:1] - vxrm[1:0]
> +	 * [0] - vxsat
> +	 * The earlier vector spec implemented by T-Head uses separate
> +	 * registers for the same bit-elements, so just combine those
> +	 * into the existing output field.
> +	 *
> +	 * Additionally T-Head cores need FS to be enabled when accessing
> +	 * the VXRM and VXSAT CSRs, otherwise ending in illegal instructions.
> +	 */
> +	asm volatile (ALTERNATIVE(
>  		"csrr	%0, " CSR_STR(CSR_VSTART) "\n\t"
>  		"csrr	%1, " CSR_STR(CSR_VTYPE) "\n\t"
>  		"csrr	%2, " CSR_STR(CSR_VL) "\n\t"
>  		"csrr	%3, " CSR_STR(CSR_VCSR) "\n\t"
> +		__nops(5),
> +		"csrs	sstatus, t1\n\t"
> +		"csrr	%0, " CSR_STR(CSR_VSTART) "\n\t"
> +		"csrr	%1, " CSR_STR(CSR_VTYPE) "\n\t"
> +		"csrr	%2, " CSR_STR(CSR_VL) "\n\t"
> +		"csrr	%3, " CSR_STR(THEAD_C9XX_CSR_VXRM) "\n\t"
> +		"slliw	%3, %3, " CSR_STR(VCSR_VXRM_SHIFT) "\n\t"
> +		"csrr	t4, " CSR_STR(THEAD_C9XX_CSR_VXSAT) "\n\t"
> +		"or	%3, %3, t4\n\t"
> +		"csrc	sstatus, t1\n\t",
> +		THEAD_VENDOR_ID,
> +		ERRATA_THEAD_VECTOR, CONFIG_ERRATA_THEAD_VECTOR)
>  		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
> -		  "=r" (dest->vcsr) : :);
> +		  "=r" (dest->vcsr) : "r"(t1) : "t4");
>  }
> 
>  static __always_inline void __vstate_csr_restore(struct __riscv_v_state *src)
>  {
> -	asm volatile (
> +	register u32 t1 asm("t1") = (SR_FS);
> +
> +	/*
> +	 * Similar to __vstate_csr_save above, restore values for the
> +	 * separate VXRM and VXSAT CSRs from the vcsr variable.
> +	 */
> +	asm volatile (ALTERNATIVE(
>  		"vsetvl	 x0, %2, %1\n\t"
>  		"csrw	" CSR_STR(CSR_VSTART) ", %0\n\t"
>  		"csrw	" CSR_STR(CSR_VCSR) ", %3\n\t"
> +		__nops(6),
> +		"csrs	sstatus, t1\n\t"
> +		"vsetvl	 x0, %2, %1\n\t"
> +		"csrw	" CSR_STR(CSR_VSTART) ", %0\n\t"
> +		"srliw	t4, %3, " CSR_STR(VCSR_VXRM_SHIFT) "\n\t"
> +		"andi	t4, t4, " CSR_STR(VCSR_VXRM_MASK) "\n\t"
> +		"csrw	" CSR_STR(THEAD_C9XX_CSR_VXRM) ", t4\n\t"
> +		"andi	%3, %3, " CSR_STR(VCSR_VXSAT_MASK) "\n\t"
> +		"csrw	" CSR_STR(THEAD_C9XX_CSR_VXSAT) ", %3\n\t"
> +		"csrc	sstatus, t1\n\t",
> +		THEAD_VENDOR_ID,
> +		ERRATA_THEAD_VECTOR, CONFIG_ERRATA_THEAD_VECTOR)
>  		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
> -		    "r" (src->vcsr) :);
> +		    "r" (src->vcsr), "r"(t1): "t4");
>  }

vxrm and vxsat are part of fcsr in 0.7.1, so they should already have been
handled by __fstate_save and __fstate_restore, and this code is likely to
misbehave (saving the new process's vxrm/vxsat in the old process's save area
because float state is swapped before vector state in __switch_to).

-s

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
