Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A4DC61DFD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 02:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:In-Reply-To:From:Cc:
	References:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgM2+yGcOlG3rd8S2kSo2vOU0yCGMQXODWnymXCbwF4=; b=k9NSgHJsVkKJkK
	3MoZ+kHXGkBofNYLJvnbSqct4mBMDcJ44xj57wlxFe1q9OwHAKQfh1chkBuNSshARs101tb3NI61G
	Nk2UfOq01cJQG8+qYA0AUUPbWpWgLwf9FZnQwG2zlJNMG26IwgWZt/FdtGzxr3m2SkYjf35vEpG69
	a/8yv92eb+WxXIqmndbWzsI1rWJGbWBLHgcykMkEPc43Mwgw9bbERIblcefaiCQcYhjCj/keZSMJA
	zphukCLHmPz6Epy+HJTZlo7xRrBJ04tChWtZ0s0tJktEWR6AgDrOpOsCob4CpVYFtJ69iKChM2N2Q
	MnPBjqSlgnOMWJvb1v2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EFg-0000000Aso8-2FHS;
	Tue, 01 Sep 2026 02:29:32 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EFe-0000000AsnW-0jdQ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 02:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788229764; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=nSl8I61Po4NfLfKWOqzFnz5x9QTmz7kfJ1JFGJE3pRE=;
 b=hlhscmI2xhebF6JU6PU6pMC525JkzK9pEvUyuBitNtDz8R0gCPPMWh10l/jEMNIgIBh/Sm
 aCbodVFA7wel9kPjXOGlkOHIsYme+5WNozR7DxCLAG/T8nYSit+M2VTFCox+ePYZVcpyeF
 98UhbrxwegdzE+KwfHnvqCCsnUyreAO3xqusX+YMEvriYDCc+GPjkV/zgDRHEQEqdUOQ7d
 9L5OS7+lAjP9qfuoNDewhhUpcFSCY6m2R1KnQ3ix+m9YDtMHKlZImmLpeiO7VAIDJhIp9u
 5ot74krM2P1BgmTRoO97fLXsL0QZ7fdpxaYEsJaJauAEQiZB3l6PuMxOLa+wpg==
Date: Tue, 1 Sep 2026 10:29:06 +0800
Message-Id: <bd8646c1-1ed7-4b04-a00b-ef31700a41fa@bytedance.com>
X-Lms-Return-Path: <lba+26a963882+d3e6f6+lists.infradead.org+qirui.001@bytedance.com>
User-Agent: Mozilla Thunderbird
To: "Steven Rostedt" <rostedt@goodmis.org>, <palmer@dabbelt.com>, 
	<pjw@kernel.org>
Subject: Re: [PATCH] riscv: ftrace: reject out-of-range non-direct targets
References: <20260707121235.759104-1-qirui.001@bytedance.com> <20260901020000.1-qirui.001@bytedance.com> <20260831105820.22085739@gandalf.local.home>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: <mhiramat@kernel.org>, <mark.rutland@arm.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<linux-trace-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
From: "Rui Qi" <qirui.001@bytedance.com>
In-Reply-To: <20260831105820.22085739@gandalf.local.home>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192930_287176_FAD27D93 
X-CRM114-Status: GOOD (  16.95  )
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

On 8/31/26 10:58 PM, Steven Rostedt wrote:
> On Mon, 31 Aug 2026 11:50:45 +0800
> "Rui Qi" <qirui.001@bytedance.com> wrote:
> 
>> Hi Steven,
>>
>> Gentle ping on this patch. It's been over a month since submission
>> and I'd appreciate your review when you have a chance.
>>
>> The patch fixes ftrace_modify_call() on RISC-V to properly validate
>> old_addr/addr instead of always treating sites as FTRACE_ADDR, and
>> rejects out-of-range non-direct targets that can't be dispatched
>> through the existing ftrace_caller path.
> 
> This patch looks very architecture specific. Is there a generic ftrace
> issue you have with this? "out-of-range" issues are specific to an
> architecture (x86 doesn't have this issue).
> 
> You need the RISC-V maintainers to review and accept this patch. I don't
> see anything specific to generic ftrace infrastructure here, which is what
> I maintain.
> 
> -- Steve
> 

Hi Steven,

Thanks for the clarification. You're right, this is entirely
RISC-V specific -- the out-of-range issue comes from RISC-V's
AUIPC/JALR relocation limits, and the fix only touches
arch/riscv/kernel/ftrace.c. There's no generic ftrace change here.

Palmer, Paul, could you take a look at this patch? The core fix is
making ftrace_modify_call() honor its old_addr/addr arguments instead
of always validating against FTRACE_ADDR, and rejecting out-of-range
non-direct targets that can't fall back through ftrace_caller.

Thanks,
Rui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
