Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AEDC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnxvU7vryVMZ8dGQrivavZ6Frk7nlhuh0woTystVois=; b=VYJBMUKbYWOP9X
	GkqYkRdoE7N4xu5XonDeiyiNVAg0R5DgKoBmuEeMWuhcGWmGlBZZjtPtwZc0+iXwW/j3XwkBTYJwX
	ZNdFsNeaOzO/ZZ02iUAJgt2QN0jE72AZv1378/fQ+TlSRKRS+sl1nTnT7yO7mOjCCxDTv3pSDhYaA
	RpEDragAO7xpz/6nKGJH3MCYWTzjAQoqJqeDfZGbKd2/4FJJRKVHQ2PcFOEHbMIIfNsuqVOYS8Cqh
	629ED5c2RIshI6e1w0qxaO4ivXPhkfSRhdQgFE1P2DKBFOidRtt9R8nup/BrRC/ZLoOJyUA+K4FjM
	BEYYe11XJOaw6uRT8/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4elX-0000000ESSn-2Ik0;
	Thu, 10 Sep 2026 13:24:35 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4elU-0000000ESSO-1pr7
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:24:34 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 755037A00BD;
	Thu, 10 Sep 2026 09:24:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 10 Sep 2026 09:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789046668;
	 x=1789133068; bh=pPNVfymHR2XC9ByNjrUYouH52ihzMf/+u8o83ywFdQA=; b=
	gA7IDNQ5qcGQ9FpoVUXx9Rl3euUYNZXCVvMUXllrij8BbixGwlvEoz+9AmV/oe8F
	klwFza6v+Hvs7i9T/PobFxsBaXSh8CpcDBbQfhD81HBahEPDTNRiXueurK9nM/Po
	fCbADRszzAEoYA4tnSUBJfTiyPpEUGJVfqpiVuus1c8nzILjIIk6+BqdXh+88b4H
	LTnHh0eG7dRkS48byEoYQyFw8+Chf2ptYiq2yadDL7LyRsU7iepSJhVPZranDtCL
	vu7ZHtkVKQZ5vWU9sZCJCQh447z+hKgU6g/R2aTx4hVmfei0kdAqAP5QmrLDj+Tp
	eiZ6RgAcdMkjLEKeXrVcaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789046668; x=
	1789133068; bh=pPNVfymHR2XC9ByNjrUYouH52ihzMf/+u8o83ywFdQA=; b=n
	Y6v7Fp3DIuBnH4qWqWrhvgGn8EpZdyXTxR/TVEn5qpH+MBLay5FShFAcIVqrh868
	os9oa0fPPAKtyKLOZ9H3qvO70CPLiFTXfE2/q4qO3eVN6BZQ5rZAyyyfk6pdcX1u
	wGbfu/41czlwRjJMnwu+8FQtQ4M52XftYOe1xViiXZjUZ207rGQPFLKxkQwvN4+U
	p10s39b0WMEwLx9XaEl5sUlhawoblXVzSnY2DlobwjdD2eYfdFcuxll7d7pxC4PL
	/BKogLV3SXHDZjLAZrhDwY63kBkJMRutj2CnW3l1nLf62WwxNnhw40F7GxKfmpyD
	99IsnV93FfZSImJPgWyfA==
X-ME-Sender: <xms:iq-iau1ZCqh3xeTm8AsCTDDwXElvTfmJJ8FPc5up_wuHJVzjvusHCw>
    <xme:iq-iaqu7-sHbm7-NYmO4UD99rGyGL7EXy2NIPADQS3IL1bz52ihG0_0XhxHiX9ql7
    5kUH6FCyMy7smka-K_qc2gyNkGDyG0gmZW4h7O5KIW9_M4CsuxsGfx->
X-ME-Received: <xmr:iq-iaqXxZlRXMG6Q087BNmElwkwy7c5kMjQNNG2N3bl1LoUM5cRlkWyQxQK7RJwPA3Syt0_y8nQFYmzTRdUhfIKg>
X-ME-Proxy-Cause: dmFkZTGW95mqvfGMGPYTEqTrjHWUVhcvA5HTKwj8urM2KImtx2Iw9C8bH169hBTFRhfrF5
    EXeXd9fEyRmAWq9C2AqmFUuIGYg/rCdWRGD5tqrtc0m9Lhzfe+klqthxkpugjTTbNWrHfM
    wKkmWGL6lweONGEbJlksgvzcsa+Runt4ZT+UhiucVixdhhbKgwMLrxvwWBsqhNctodDxiX
    RhKdnuGYmxMwDpUPut0kWqIpwpWh7wFiX1VHnz9y81TIP16Sm/ODsJnLE1VbX8czDGZ4cV
    VnrFvtCSTjzb5GUj2Kwvm+WTy0Y9CC7bnCVPt9Yjp5Hb63szP80RltNxaT8GmrQ+7bzToH
    uSAMr6O8uIM9PgHR8wHhCKsDgQsE6NyQ1Akb3s20XBOFhVNDLkBuA4DZcr370TyYkPfOJm
    idUL8lrxcn1/Sg3PMKZS5IEdNXCiCkFwoBsMwXsuADlEPM5EpBFyRygH/ylWjEFcO8GDl8
    onCEtXKyRX/LiKCWmfFxf1w9g3MflXjTVaKzS/1OAvttW1MtnRg/TmGkIcX2nOVWw6UZP2
    Ei2H8MjjdY+Oh2vgIwjyANe9Y7D0h6S8wyOjp+AYfGS0gC+p57aNyKjXSSF9gwhm/tRL0y
    kmVdqVgottQbPVU7s/CzACugOVlyd6HNA+WS9TMNI1LjAFOvUdosxnB7yOaQ
X-ME-Proxy: <xmx:iq-iamsBE7VFp0yC1usqqOlKq6NWZOi2YZ7MMOpPyHX_T1aba7SUvQ>
    <xmx:iq-iasMa2D8EhXge6o50AOreJAAV5d8ekGHgPXI7vUp2CxdepWUmXg>
    <xmx:iq-ialnWx7C9_Bx9AM9fOxw6XPc4d9fM1jjtkuxlA5WQbsbeKZ1WJw>
    <xmx:iq-iaizoz_Gdf6XyKAvKLqi5mCun_CYzbYMm4UqE_B6Y6IZ310BXgA>
    <xmx:jK-iajLKynxfVMAs1dc03eCGD-yBdoLJ1PdVyg3mE6-cAJthBQ0IY_9c>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 09:24:20 -0400 (EDT)
Date: Thu, 10 Sep 2026 22:24:17 +0900 (JST)
Message-Id: <20260910.222417.2048885189565815846.tomo@flapping.org>
To: gary@garyguo.net
Cc: mkchauras@gmail.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 rust-for-linux@vger.kernel.org, tomo@flapping.org
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
	<DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_062432_954725_CE78772C 
X-CRM114-Status: GOOD (  15.44  )
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

On Thu, 10 Sep 2026 13:05:27 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Thu Sep 10, 2026 at 11:08 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
>> The Rust kernel infrastructure generates inline asm for WARN() via
>> ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
>> preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
>> arch-specific asm template string for use in Rust's core::arch macros.
>>
>> powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
>> Rust builds to fail on powerpc with
>> ```
>> error: no rules expected `ARCH_WARN_ASM`
>>    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
>>     |
>>   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> 
> I think we probably want to catch this earlier by have something like
> 
> #ifndef ARCH_WARN_ASM
> #error "ARCH_WARM_ASM is not defined"
> #endif
> 
> in generated_arch_warn_asm.rs.S.

Good idea.

One thing needs to be fixed first. arm and loongarch do not define
ARCH_WARN_ASM. rust/kernel/bug.rs uses bindings::WARN_ON() on those
architectures, so it never includes generated_arch_warn_asm.rs. But
rust/Makefile still generates the file for them. With #error, their
builds would break.

I think we should add a condition to rust/Makefile to stop generating
the file for arm and loongarch. Then #error can be unconditional.

Does that sound reasonable? I can send patches.


>>  arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
>>  1 file changed, 20 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
>> index 0db48977c70c..df2183c35945 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -32,34 +32,38 @@
>>  #endif /* verbose */
>>  
>>  #else /* !__ASSEMBLER__ */
>> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
>> -   sizeof(struct bug_entry), respectively */
>>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>> -#define _EMIT_BUG_ENTRY				\
>> -	".section __bug_table,\"aw\"\n"		\
>> -	"2:	.4byte 1b - .\n"		\
>> -	"	.4byte %0 - .\n"		\
>> -	"	.short %1, %2\n"		\
>> -	".org 2b+%3\n"				\
>> -	".previous\n"
>> +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
>> +	".section __bug_table,\"aw\"\n"			\
>> +	"2:	.4byte " label "b - .\n"		\
> 
> "b" is part of the label. "1b" itself is a label and "1" is just an integer.
> 
> If the code uses
> 
>     _EMIT_BUG_ENTRY(..)
>     "1: ..."
> 
> then the correct label would be "1f".

Agreed.

I think keeping the label fixed, as v2 did, would be fine too. x86,
arm64 and riscv all hardcode it. A comment that says the caller must
put the trap at 1: might be enough.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
