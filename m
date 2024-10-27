Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311ED1356D
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTkB+pI0BUw8avVPm9cksjq5zSYOIdyRlxXIm0zghYM=; b=FvQbyKj0OW2vcy
	cF3OEOreLA2JupB5Xb8EYqUld4fkfIdI81jQqjPdbiZlBZf930znTkCllpVPPSItjSmJyjYJbak3t
	PEmUCdIrTWuWuDIloP+w2y0U4Ty7ufu14XfQGXf9tyMJi9P1GdUQZPoU+bbnc4yf02fszSPl3hTZb
	GfpsS+iBPSkaiOOJW5WZB3RFxNduRIv5NqzRgawdal4jYozcxxqOHjWIlkPvmDHHlFd+1c4RjXNlh
	3Qc5FVWmtEJ88LhcIKnrT3pMN2cWHrCcNWQGid/Zdmy5ozJq0BIoOBVplpKlVRjeAE9HeE/B3NqiS
	oMQNRPNmcxNQizQ0B+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t55d4-00000008Vis-0Rxn;
	Sun, 27 Oct 2024 15:56:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t55cy-00000008Vhd-0nYm
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 15:56:32 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730044585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+uXrX1QNxr8SdaKFPlGOl0uCLyfvdg+yhI/DiahWTSQ=;
	b=WwMfGiqV8IWE9ZnXau9tUPrf91c8dF/qmw6tAr7evfycRWGrDFuYoiwuDGP51TKo8h0GQD
	t4C9V4T8+JnWj9Hv5fT7PkY8TdxuzaXGRE3qNPQLWVRMeuvjXaPUazxj89amJcAgCeDBlf
	cVaGPtD1qYPYSlByW6BYQjaUXZ9mXH17CuYsvbFYsl1x/i0bewmRlRm2oK/fGwOTFrdD5Z
	Rukv7Het7tvZH9ajvG4Xe4MEl+7yjqESHn9CcGgC52fptUfABWDqLzsL5Ir1IRSmK6FZcb
	9jGgKSLt33FHKBqQiI2xjEhcq6fd2DJfoBXrTz46zBvS4wx1XhgnmQbXvpYr9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730044585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+uXrX1QNxr8SdaKFPlGOl0uCLyfvdg+yhI/DiahWTSQ=;
	b=86XD6CNHMZM+YcZ0imnmN0RlxwuuJDg30Ji9TiaNJRngVHoikkn448VWerh3w+/9gnF8SD
	CgRpTnitXAx9wnDg==
To: Celeste Liu <coelacanthushex@gmail.com>, =?utf-8?B?QmrDtnJuIFTDtnBl?=
 =?utf-8?B?bA==?= <bjorn@kernel.org>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
In-Reply-To: <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com>
References: <87ldya4nv0.ffs@tglx>
 <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com>
Date: Sun, 27 Oct 2024 16:56:24 +0100
Message-ID: <87a5ep4k0n.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_085628_399756_7568D378 
X-CRM114-Status: GOOD (  13.45  )
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

On Sun, Oct 27 2024 at 23:29, Celeste Liu wrote:
> On 2024-10-27 04:21, Thomas Gleixner wrote:
>> The real problem is that orig_a0 is not exposed in the user view of the
>> registers. Changing that struct breaks the existing applications
>> obviously.
>> 
>> But you can expose it without changing the struct by exposing a regset
>> for orig_a0 which allows you to read and write it similar to what ARM64
>> does for the syscall number.
>
> If we add something like NT_SYSCALL_NR to UAPI, it cannot solve anything: We 
> already have PTRACE_GET_SYSCALL_INFO to get syscall number, which was introduced 
> in 5.3 kernel. The problem is only in the kernel before 5.3. So we can't fix 
> this issue unless we also backport NT_SYSCALL_NR to 4.19 LTS. But if we can 
> backport it, we can backport PTRACE_GET_SYSCALL_INFO directly instead.

PTRACE_GET_SYSCALL_INFO only solves half of the problem. It correctly
returns orig_a0, but there is no way to modify orig_a0, which is
required to change arg0.

On x86 AX contains the syscall number and is used for the return
value. So the tracer has do modify orig_AX when it wants to change the
syscall number.

Equivalently you need to be able to modify orig_a0 for changing arg0,
no?

Thanks,

        tglx



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
