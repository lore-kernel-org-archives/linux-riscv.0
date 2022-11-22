Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8655FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 00:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rHaK914EWayx7z+qDmck0/8WCqkI9ZKxytE0v4Y3Uw=; b=gjVkOKG3LgyyHg
	59dmHxMhROCT8fTjcjluWxKEPNu2ATychg2Ewo939SVpfTpjd+zjg/K25aXUMznBeyh3IHdF5PRsC
	yrLVnHN+GmFzy0dk+Tvbp74WIZFjJ06uDQRYnXFcDuPXfnPGJv9l7zy8KO99v9PAN0veq4ZUQWy98
	GQAJMafjdc4Kb7YOt9iUuyz2lMQoBmBCIZhijwZmfyl7MyYWHlJcf1ke0/EEQ+AC2tpiWIXEnaD2w
	5/T67md02nSwde7C05Z/MR4R4VQ22eJavY/PFEUS3rpKuwsswrfqYWosCalSdNrDgSLDdICfmk2JN
	mKv4rPIWu+2+fyIZlaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHPr-001hoK-2W; Tue, 22 Nov 2022 00:45:35 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHPn-001hkj-Pw
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 00:45:33 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id C2AE032009D7;
	Mon, 21 Nov 2022 19:45:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 21 Nov 2022 19:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669077927; x=
	1669164327; bh=fDo4wIRpT/cr00JSFZyRJXJl6OzORncK/vIgc7ZRQkk=; b=J
	6CnMjqONXI2E8ioFDyVdFNnyvY9ueuRBNt/1e26aLfKYAlgFhVS2hel8L1xo8We4
	NTYSTpdzySKpFbIhsX4pkj8++3yIFa1rLeE5J3mz0FM4zKmk7yQNSbGolsbMFq5r
	M8mXmPB9g4HGNKO1FdbHFuHpvPJbEkd++eT++A2EQxdsIR/uc+7Qzvd20inmEnJs
	2mPE3SKyf4UX8km4FaZG+ZcQZtF2Tlfc3/EK721qDYW+mIgWsTnoe9sJQrrEjLm4
	af7LtAi+BSe9MStIZi77K8M41RGKWjO8FKWj4AR0jhOm0n55EwepzYPq1lHHEDrE
	8hShbPP0pCwmsedUWfJvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669077927; x=
	1669164327; bh=fDo4wIRpT/cr00JSFZyRJXJl6OzORncK/vIgc7ZRQkk=; b=V
	nJZxtfGEVMrF6eg8Ky2o+OwLEwr0qWH4WDtXfKZW4ubG0wPZhoUTcUtV/aF7stxL
	5R531aiFniq99980T+GAVs9G7ZaEHCJYi6IGjvjG0sMDCvJJu52oDmirdPXZNTss
	2yxe0hUdqK1pvbH78w/FwN3N8gB7ev+5uZGXQo0QNAcFZWeZC8bvcUCsfIzZIdOY
	f7TERsbeOhzNMG+BysOGxzQ029YLfXWGWf5TP2DvwPsHIw4BuWdlzHT2q0FAW4Gj
	gJhOmIBCd+zQHH/GVUhCF369+g60Ohdd9AC7TzYquTDwaXfmPDKLnkGcwugLlc7Q
	k3z8lJ7qxKAh6LoCc3aOA==
X-ME-Sender: <xms:pht8YyN3rNC6uJQ2Z3tbMqBvJReCw8urSh3znvc6odcyNAuEhCZzVg>
    <xme:pht8Yw9IskL-BeP9Cllr-RUzsAzpj5cMnVTiSE1rnIu05wRQtkBwbBW5vw3qzWMvd
    2N2Uvn3Zyo1xfKy6Q>
X-ME-Received: <xmr:pht8Y5SA2vkiZu8yuAFfA_h9yIiBZ18polg7Aya-z4cFMzkJwOn1mnYPmp-QBRqXUdE6YhIGUX9Xv1VcvyBUTHVHkpgMn3HT4VkgPacarLTIKUnZNcj1-nW1tQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudeuuefgleeludegueegvdeggffhveejgfeileejveegiefhffev
    ieffiedvkeehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:pht8Yysj4datzUUG5edxXJy2MuVRIzBoK2sHeXWKZttbNul8Qj4niw>
    <xmx:pht8Y6dfXLUOLPyz43Ob75QLXwnUyqWdhTq1F9D8JvtGxnO83rtwow>
    <xmx:pht8Y21gH7eBzGzthxlJ7A7Ps2F61GJc1hmGOMMa3qxvSUASe4NmVQ>
    <xmx:pxt8Y7UpRk1RyeyLvm3OglNzb_1tlIWhO1LTvdikdXxmkhbY5AVQqQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Nov 2022 19:45:26 -0500 (EST)
Message-ID: <bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org>
Date: Mon, 21 Nov 2022 18:45:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: anup@brainfault.org, rafael@kernel.org, daniel.lezcano@linaro.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com
References: <20221121205647.23343-1-palmer@rivosinc.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
In-Reply-To: <20221121205647.23343-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_164532_119503_F6B4DFB4 
X-CRM114-Status: GOOD (  28.12  )
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

Hi Palmer,

On 11/21/22 14:56, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As per [1], whether or not the core can wake up from non-retentive
> suspend is a platform-specific detail.  We don't have any way to encode
> that, so just stop using them until we've sorted that out.

We do have *exactly* a way to encode that. Specifically, the existence
or non-existence of a non-retentive CPU suspend state in the DT.

If a hart has no way of resuming from non-retentive suspend (i.e. a
complete lack of interrupt delivery in non-retentive suspend), then it
makes zero sense to advertise such a suspend state in the DT. Therefore,
if the state exists in the DT, you can assume there is *some* interrupt
that can wake up the hart. And I would extend that to assume at least
one of those wakeup-capable interrupts is a timer interrupt, although
not necessarily the architectural timer interrupt.

> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687

This comment refers specifically to the architectural timer interrupt,
not interrupts more generally.

> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> ---
> 
> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> Events are stopped during CPU suspend"), which fixes suspend on the D1
> but breaks timers everywhere.

I understand that reverting 232ccac1bd9b is the easiest way to fix the
issues you and others are seeing. I do not have any functioning RISC-V
hardware with SMP, so it is hard for me to help debug the root issue in
the Linux timer code. I do not know why turning on the C3STOP flag
breaks RCU stall detection or clock_nanosleep(), but I agree that
breakage should not happen.

So while I still think 232ccac1bd9b is the right change to make from a
"following the spec" standpoint, I am okay with reverting it for
pragmatic reasons. Since the D1 has another timer driver that is
currently used in preference to the RISC-V/SBI timer triver, reverting
232ccac1bd9b does not break non-retentive suspend for the D1.

But please do not make the change below. It is unnecessarily broad, and
will break something that works fine right now. If the DT advertises a
CPU suspend state that cannot be woken up from at all, then that is a
bug in the DT. Linux should not try to work around that.

So revert 232ccac1bd9b for now, and we can figure out what to do about
the DT property, but please do not merge this.

Regards,
Samuel

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 05fe2902df9a..9d1063a54495 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
>  	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
>  	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
>  		return false;
> +
> +	/*
> +	 * Whether or not RISC-V systems deliver interrupts to harts in a
> +	 * non-retentive suspend state is a platform-specific detail.  This can
> +	 * leave the hart unable to wake up, so just mark these states as
> +	 * unsupported until we have a mechanism to expose these
> +	 * platform-specific details to Linux.
> +	 */
> +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +		return false;
> +
>  	return true;
>  }
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
