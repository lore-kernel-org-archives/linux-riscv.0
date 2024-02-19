Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19E8C48BF8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HspA/JCdc0sbAt6BJcSGluSuQKxZvmY7Qbv23SHSYzg=; b=bY0jCK9Z7qrok0
	aH30wo+OLJUomqdWtQd+W5P1dmEiCOnLmkpsnPLazbWabXSHRUbIxR2vVweYrv3YMWDROlhUhfpt1
	hJYJppKm/2iBrNzMAj8lCYS7BF7RndbL7P1DYWufRxLAsSazf+svFEGLQOG8/DUMoeW12UOLpwvPB
	j8mzIq8LldKImWS4WQtfKBHxxMLU8vvbd+4vRwbIWuDVaNqYEbDe39mBCvpI/1yrlNm0jhDUwcCcV
	jbtyu9FD1JqMq3G7SQdi8Qk4IUC/NMf4sNmHjfjFmpmg9YafxrTrU72ZyZ8+3ddFa0GOAOnxth+K9
	UDZYDkYHfBYQpNf79PAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2hv-0000000ANuJ-0nW1;
	Mon, 19 Feb 2024 12:25:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2hr-0000000ANsE-37AQ
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 12:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4ED6560D41;
	Mon, 19 Feb 2024 12:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F711C43609;
	Mon, 19 Feb 2024 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708345509;
	bh=Qt19ljXFDHGnHsJC4+Ibe49Z9ewRnSNk2tYJMGxyCEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H4u7QbifuxAeJ6eSh940HphqB9PmtRuzg+WBkSsKMWqS3vtrXfp18rtzxrUJOUm3e
	 dghQfLgD5drU3GkO28skuRzB7lgL8yd9FoaW5jOqJ8O2ofm7g8hDU62m3SHx54gYEY
	 P0FQe/vpi7yF8h0k6zMT4MWaRJCX/OPUJ5f4wyHSGCr15tDNM0rmeCB4ptqF37t/p3
	 KGUw7j93NmCTXtkHJjfbQiH6yn3YQEFH/db4yqG5u6r44tn2XLjIwACIAvzKhQFOIp
	 ki6KlTWmUHgN9TvIkZSGS43MZuw5vhHz6dc7Tn50rwYSMVY94SRkzCV6Lc4vZq1lVY
	 M6eUzZyJY0zyA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>, Samuel Holland
 <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jason Baron <jbaron@akamai.com>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, bpf@vger.kernel.org, Alexandre Ghiti
 <alexghiti@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Subject: Re: [PATCH 0/7] riscv: Various text patching improvements
In-Reply-To: <ZctnfZWWO3HCiXe5@andrea>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <ZctnfZWWO3HCiXe5@andrea>
Date: Mon, 19 Feb 2024 13:25:05 +0100
Message-ID: <87msrwfxpa.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_042511_868265_06495363 
X-CRM114-Status: GOOD (  11.13  )
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

Andrea Parri <parri.andrea@gmail.com> writes:

> Hi Samuel,
>
> On Sun, Feb 11, 2024 at 06:55:11PM -0800, Samuel Holland wrote:
>> Here are a few changes to minimize calls to stop_machine() and
>> flush_icache_*() in the various text patching functions, as well as
>> to simplify the code.
>> 
>> 
>> Samuel Holland (7):
>>   riscv: jump_label: Batch icache maintenance
>>   riscv: jump_label: Simplify assembly syntax
>>   riscv: kprobes: Use patch_text_nosync() for insn slots
>>   riscv: Simplify text patching loops
>>   riscv: Pass patch_text() the length in bytes
>>   riscv: Use offset_in_page() in text patching functions
>>   riscv: Remove extra variable in patch_text_nosync()
>
> This does look like a nice clean-up.  Just curious (a "teach me"-like question),
> how did you test these changes? kselftests, micro-benchmarks, other?
>
> BTW, I recall a parallel work from Alex and Bjorn [1] that might have some minor
> conflict with these changes; + both of them to Cc: for further sync.

Indeed! I think Alex is still working on the v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
