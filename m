Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD412CDB471
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:In-Reply-To:References:From:Cc:
	Mime-Version:Message-Id:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S82r+Ix50BnS3x8Gj+qslsjCSAtngxiw6gTM8D6Qdaw=; b=IL1D5jbjAp37hr
	ePjK8dZUOwudo7SFeVAygtKOIM8hrdSVdb1gwElsuqlZ6N6cpAvPQJ68rRVSTUEs18iamQ8Je0Y0S
	NQcQKetaJZlQJUQjcsacGTJ49hbyAdYm3K0lssvCJXlR8A2cKizxnzl9ORAilzNnVDvtpC/GwgZXu
	WTYv1r/mEGWZaGk0i97lamDjqjCPcf2LxC7tN32L8NPb1/KpiDj9HfPFRtjMtYtYJQDU42XSJdtmG
	0QsUORDYUn/Iqq9u1gBxXUT72Xyi7FQpiOAQYxP7AHHyo3jbr9VptpQ/vH0tB7KHAQhr0RZHdflUz
	EDb/jjaViKH4nmXtz+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLfO-00000007ezi-0QH2;
	Wed, 24 Jun 2026 11:21:14 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLfL-00000007eyo-2lIw
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 11:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782300061; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=L9dC3M6WKeorB6pYmtdGrchtIlZmxMoP1qmCnJ6UEXU=;
 b=KsyBI90vFGK3bhU/gYm5zKtl10njXNMYV+URzA0VJFQtxnxWz58N2/wyDz0014yo+Sb80I
 0juPVERI26X9Ny86QWS4qr83+WEJcU/ICL4xeI5v+A2bVFosA8CsxCJIW4LjvCqznnhe+R
 t+RsQ87BHIRIiv6EGjbZIjMlmIAFi/xsIKKTSpQzy/vxkV6Iu09C/++9s/hUmnnd37c0x5
 jmdN6EeLI1fo6eEal6yKJQoS8euNbjYU77l1/upGfQJJ90XoizbeQ3gkt742vC/fqR0Zkc
 EgugHvqM1UDv5m7/R6muftT5ReCwYzv26gbcRcc2XNcmAMnirbnUn/+seRzxrQ==
To: "Nam Cao" <namcao@linutronix.de>, <palmer@dabbelt.com>, <pjw@kernel.org>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: fix frame pointer in call_on_irq_stack for RV32
X-Lms-Return-Path: <lba+26a3bbd9b+6c7a74+lists.infradead.org+qirui.001@bytedance.com>
Message-Id: <6f1628e9-190b-4214-990f-f1c87d756ab2@bytedance.com>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
References: <20260603035305.564823-1-qirui.001@bytedance.com> <87h5muv468.fsf@yellow.woof>
In-Reply-To: <87h5muv468.fsf@yellow.woof>
User-Agent: Mozilla Thunderbird
Date: Wed, 24 Jun 2026 19:19:29 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_042111_769077_8A652CC2 
X-CRM114-Status: GOOD (  12.26  )
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

On 6/23/26 2:08 AM, Nam Cao wrote:
> "Rui Qi" <qirui.001@bytedance.com> writes:
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -383,7 +383,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
>>  	REG_S	ra, STACKFRAME_RA(sp)
>>  	REG_S	s0, STACKFRAME_FP(sp)
>> -	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
>> +	addi	s0, sp, STACKFRAME_SIZE
> 
> Doesn't this break the calling convention? The ABI specifies that "After
> the prologue, the frame pointer register will point to [...] the stack
> pointer value on entry to the current procedure". The frame pointer is
> already correct here.
> 
> It is the storage locations of ra and fp that are broken. The ABI says
> "This puts the return address at fp - XLEN/8, and the previous frame
> pointer at fp - 2 * XLEN/8".
> 
> Or am I confused?
> 
> Nam

Hi Nam,

You are right, thank you for the correction. My patch makes fp
point to sp + STACKFRAME_SIZE instead of the entry stack pointer,
which violates the RISC-V calling convention.

The real issue is that on RV32, STACKFRAME_SIZE (8) differs from
STACKFRAME_SIZE_ON_STACK (16) due to alignment padding. The
current code stores ra and prev_fp at STACKFRAME_RA/STACKFRAME_FP
offsets from sp, which puts them at the wrong positions relative
to fp.

The correct fix, as you suggested, is to keep fp = entry_sp and
store ra and prev_fp at the ABI-mandated locations (fp - SZ and
fp - 2*SZ).

Samuel Holland actually proposed this same fix back in May 2024
[1] using exactly this approach: redefining STACKFRAME_FP and
STACKFRAME_RA as negative offsets from the frame pointer, so
that the storage locations automatically match the ABI on both
RV32 and RV64. His patch was never merged and the bug still
exists today.

I will drop my patch and resubmit Samuel's fix instead.

[1]
https://lore.kernel.org/all/20240530001733.1407654-2-samuel.holland@sifive.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
