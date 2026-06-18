Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B36DCD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahkCRnMnTekg977m8YtZgUgAmCbMVbCM5XpMJwybL+o=; b=etyuTJRBzRmoIR
	SL3YQwQGdHFFIjzTXsFqjLwu0aZ0oDqLiLOA+DjILrSty48tV7j3hoBUosQ8zdS5ps3HDUM2PfZPZ
	VDXLl/xjz65DzDm/Gi6KdPnQMqYYv9wMXkeV50t7hQy7I7bn4veKjPqyICPERE42a6K0kwUZa2vjf
	7BCRXT2jUt//uUyPanvNKf/azqdRPqZgLY9c0wJTri9fuVjZ8jwp5Smf8ghQMlNoR5o5XDTk824n2
	nSZevORt9ClaWmeJgl+5iUfdfKnWykDUhPdApgdR99vc51ZNpGEmrcqQUTbunTfKmh+opKv3Kjcz5
	dYnnffD6nt7SVGzH3Gqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waG0M-00000001bd0-2mvQ;
	Thu, 18 Jun 2026 16:54:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waG0L-00000001bcl-2FZq
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 16:54:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8FB760008;
	Thu, 18 Jun 2026 16:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B6F1F000E9;
	Thu, 18 Jun 2026 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781801652;
	bh=f921/Yupm9I7VYe6MpH7HOkwP0ic1/72UUx/dXvrHHE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=Q828+UYYr24vWrvjy2oG7aXakUIBAlvCiJALDDs/wf4+XQ1nAFhnbqHq7Y+YEOV/y
	 rPjawwyDW2dFHRuDin9ItMYjhXDRgP6b2PXXMVlegk5qKdA+ThZnSfJXe0XGtomzis
	 QxTpWfJAEAgPXJRcqskz5F1PAgg9p9FNw9/S+GVhTJw66LPuSOzDXP0Waw3ZkJ+VwF
	 25u738kQo+006SrwPB6b78V8VWApIa5qz3SS6ScULFEvt+chW15eVTQ1a4mvVfKq9V
	 lTlNlS3UCKjbmZsDcnt31ijzACAyRkbhmc2KUuyeBgEdqoTi9F9aJcVNA4DM46MWkc
	 0SmcqIDOClPFA==
Date: Thu, 18 Jun 2026 09:54:11 -0700
From: Kees Cook <kees@kernel.org>
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: Add kCFI type prefix to unaligned copy routines
User-Agent: K-9 Mail for Android
In-Reply-To: <877bnwtb0n.fsf@yellow.woof>
References: <20260618081252.work.711-kees@kernel.org> <877bnwtb0n.fsf@yellow.woof>
Message-ID: <9E1CFDD7-018E-4945-B261-0D46B355A369@kernel.org>
MIME-Version: 1.0
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



On June 18, 2026 3:10:00 AM PDT, Nam Cao <namcao@linutronix.de> wrote:
>Kees Cook <kees@kernel.org> writes:
>> __riscv_copy_words_unaligned() and __riscv_copy_bytes_unaligned() are
>> called indirectly through function pointers from measure_cycles() (via
>> compare_unaligned_access()) during the boot-time unaligned-access
>> probe. Under kCFI, an indirect call checks the type id stored in the
>> word immediately preceding the callee against the type id of the
>> function-pointer type at the call site. These two routines are defined
>> with SYM_FUNC_START(), which emits no __cfi_ prefix, so the check reads
>> the alignment padding ahead of the function (zero) instead of a type id
>> and traps:
>
>This has already been fixed by commit f2abc305aa93f ("riscv: Define
>__riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START")

Ah-ha! Great. I need to update my tree, it seems. :)

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
