Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A056C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4OJsZEYPQGl9YCHmBb4W2rgwyJExT9HMGQarGaDwG4=; b=ZY7P5+lbFBz7B5
	gRCmwwJz4U5+kiYfuLRcxOCXvngwFfdotHLQaXUCuQ5Qiuh8tVUIgA3gBVLZ8B3IX6XG2VqYveh5Y
	gdftQH5A9ksYtYac5SH9Xf13hDqb/pPdFeuTitRG1RuoQukyEcXjUcZcLV/ZiwHoGLn62der9mNB5
	V1oUesVZTBaWFF+MmAKM7A+6b4s+qzQxoLCDEdrp+5rkIh5WFfEk2T0wgOVLTNNzeCjH8GA4FokfD
	Cpqf6mDRjPOXKo7k3kZ4e/OclGeUFcHNx4TN8JPgehoBOyrwfHSMN0V5mBXdv7neVGoiBz9zj9VTx
	7NL1czIh4nxVkeHc1c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCEL-0000000CUDZ-1mMV;
	Wed, 14 Feb 2024 10:11:05 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCEF-0000000CUAX-3vIj
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 10:11:03 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 0988A22034;
	Wed, 14 Feb 2024 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707905455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKHS3Tm9mFG5fwX6aOLXFqUCCVUiA1XcZVTlspPHL4k=;
	b=hQ59DxE2eGoDgeAPzrKgnd/lATT0UnlL/VauispDaRmzRcWzrHoupVd/iuLFCcp1bWccOm
	wnRQ9OG0lph7VCAeWQGzfeaCX/KMKNXGjXwh/aA/4BSRpjXMdXADAbkn9RcDHqzCH0yjHo
	4F0S2cuQUl47fVitwZf/lrQtyIB8/ns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707905455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKHS3Tm9mFG5fwX6aOLXFqUCCVUiA1XcZVTlspPHL4k=;
	b=Cijv3v90qAXWqCrQVYxQ0HJ75CdM4G/XjXV4BhnxSqAlbNQFxbiNrf1OOnhumuEhyOJGPc
	XSJJM0WOCaUFivCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707905455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKHS3Tm9mFG5fwX6aOLXFqUCCVUiA1XcZVTlspPHL4k=;
	b=hQ59DxE2eGoDgeAPzrKgnd/lATT0UnlL/VauispDaRmzRcWzrHoupVd/iuLFCcp1bWccOm
	wnRQ9OG0lph7VCAeWQGzfeaCX/KMKNXGjXwh/aA/4BSRpjXMdXADAbkn9RcDHqzCH0yjHo
	4F0S2cuQUl47fVitwZf/lrQtyIB8/ns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707905455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKHS3Tm9mFG5fwX6aOLXFqUCCVUiA1XcZVTlspPHL4k=;
	b=Cijv3v90qAXWqCrQVYxQ0HJ75CdM4G/XjXV4BhnxSqAlbNQFxbiNrf1OOnhumuEhyOJGPc
	XSJJM0WOCaUFivCA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id C1FF44A04EC; Wed, 14 Feb 2024 11:10:54 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,  Palmer Dabbelt <palmer@dabbelt.com>,
  Yunhui Cui <cuiyunhui@bytedance.com>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: use KERN_INFO in do_trap
In-Reply-To: <20240214-exclusion-pluck-fcb6352a8393@spud> (Conor Dooley's
	message of "Wed, 14 Feb 2024 09:19:09 +0000")
References: <mvmh6ic1y75.fsf@suse.de>
	<20240214-exclusion-pluck-fcb6352a8393@spud>
X-Yow: This is a NO-FRILLS flight -- hold th' CANADIAN BACON!!
Date: Wed, 14 Feb 2024 11:10:54 +0100
Message-ID: <mvmttmbz781.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.89 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-1.79)[93.73%]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_021100_147752_E0A6A75B 
X-CRM114-Status: UNSURE (   8.74  )
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

On Feb 14 2024, Conor Dooley wrote:

> On Tue, Feb 13, 2024 at 10:59:58AM +0100, Andreas Schwab wrote:
>> Print the instruction dump with info instead of emergency level like the
>> rest of the output when printing the information for an unhandled signal.
>
> I'm not entirely sure that this is true, __show_regs() prints with
> KERN_DEFAULT, but this certainly is more consistent than it was before.

The first line is printed with pr_info.  Perhaps __show_regs should gain
a level argument.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
