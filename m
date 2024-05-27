Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98013C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eUwI4HMnJuP27ooH9SGz6/lHHzM1uCWlnFQorn86ls=; b=l8aVpFePLJOrhy
	w0lber2WBhp4Ev59ntKKDm0IKqUYLZnvWV9MRLA0lcf1+3c9rXLFgXQI6kFsWqLPn8oIoUFYnnSKQ
	mc/wFCjQXEfDxa5ufq6A2q2F2BmV8uA9ZkYwEJ6WSQKK85OCBgM8+bvifJGtGcwr59jgA+3x3p2dd
	cSnUSXt22vj/kLbEbScRXMaH4csT02n4v1bZ8tRuuU6xBmK7xMdzX7oXFCeza95M7SDGFPfovGBoo
	UKb8ADbdRxGhJdCkPTia8X8RLNPH2tvjac7N6BKwmNEywMX3nuShR5Bhk4P8IZvInrSLLZOKUb2w8
	s4cxXzjH9sdG40cVmeOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBV1p-0000000E6LN-02RO;
	Mon, 27 May 2024 07:44:21 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBV1l-0000000E6K0-1O2e
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 07:44:20 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3371B21D1C;
	Mon, 27 May 2024 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716795853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfTEwhz17LhBXJ7/IsPznzhELsWPwN0beYnNi8p1FD0=;
	b=w8dUBJ0XL2QX+E5WRQ7lRxJXa7dw2ob4+UYKhErg99SykbszjfcrLUwgoR7yIfgOr0+i0w
	6ejvuUNj1MTnEb4QfTzL9UcWUmVrpPpKuzp1QIScbv9dGPyeqaN1el4Bpv6WVsE0yOVpp0
	tWmLDN8iRX8/Z1vbqSuRVmQkYn5RlM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716795853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfTEwhz17LhBXJ7/IsPznzhELsWPwN0beYnNi8p1FD0=;
	b=C73yQLQm+NpIA0s2TLH3Q1IRtmv91635FJsFTaVu7z0Q+MnVjslPuUaMqHVDSNexghbx0c
	Ni+//G2W5VHjrPCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716795853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfTEwhz17LhBXJ7/IsPznzhELsWPwN0beYnNi8p1FD0=;
	b=w8dUBJ0XL2QX+E5WRQ7lRxJXa7dw2ob4+UYKhErg99SykbszjfcrLUwgoR7yIfgOr0+i0w
	6ejvuUNj1MTnEb4QfTzL9UcWUmVrpPpKuzp1QIScbv9dGPyeqaN1el4Bpv6WVsE0yOVpp0
	tWmLDN8iRX8/Z1vbqSuRVmQkYn5RlM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716795853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfTEwhz17LhBXJ7/IsPznzhELsWPwN0beYnNi8p1FD0=;
	b=C73yQLQm+NpIA0s2TLH3Q1IRtmv91635FJsFTaVu7z0Q+MnVjslPuUaMqHVDSNexghbx0c
	Ni+//G2W5VHjrPCQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 24CFD4A0577; Mon, 27 May 2024 09:44:13 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: io: Don't have a void* PCI_IOBASE
In-Reply-To: <20240526213617.12890-2-palmer@rivosinc.com> (Palmer Dabbelt's
	message of "Sun, 26 May 2024 14:36:18 -0700")
References: <20240526213617.12890-2-palmer@rivosinc.com>
X-Yow: I feel better about world problems now!
Date: Mon, 27 May 2024 09:44:13 +0200
Message-ID: <mvm5xuzwvg2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_004417_537157_C26FB6CB 
X-CRM114-Status: UNSURE (   7.68  )
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

On Mai 26 2024, Palmer Dabbelt wrote:

> I recently started noticing warnings along the lines of
>
>     include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             insw(addr, buffer, count);
>             ^~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
>     #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
>
> which are triggered by having PCI_IOBASE be a "void __iomem *".  I'm not
> quite sure what the right thing to do is here: having it as u8 to make
> the pointer arithmetic work seems reasonable to me,

A u8 null pointer is still a null pointer.  Are you sure you are quoting
the right warning?  AFAICS, PCI_IOBASE is not a null pointer.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
