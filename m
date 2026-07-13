Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58742C55174
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7Fdtd9jLp2VVHlnrxSaYaUWILxBIb0mMuZfDCZ8WNs=; b=eNVr1Tr5ch5KUx
	eXhoeWJWv48xAoNAX/c+zHvi8w3qLTr+cf34xELqb2cPso7nB2iYb9rhfjpCi9UF3Y/bSJNadatoJ
	hk93ymBvdWiF3t1RB/RGu2bFjUxlhOlly4wbTU3vTIxCHB83ahzQaSpLlC+aoq6i2UBWeQW/O+Iqy
	HJv2Gb8YDan+RgyhpSPsl43e2C73+hCgLyoBpRan5ISxjvdgt+zVaknnFjd5iUrtE/oYSoMDW4LBy
	HTah5ltnPjuOqdm1BVtfmJZJbjgzb+izsDv61ph+F8+mlzRzLkGwiO2yVKd7Qz/vYl0uR89M6l7xl
	4UkFR5/lrkl1FX50sGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuIp-0000000Da2k-0Vw9;
	Fri, 31 Jul 2026 20:57:59 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCHY-00000008d3D-0OMF
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:44:57 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BA357744E;
	Mon, 13 Jul 2026 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783932292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOqYLE7XCd1dyoTtB3Uni1tJhG2ZPfNesMlKhEUlxw0=;
	b=r+RdOu7XiG6HWhbr9pAG6XGyeZKMMBFIRjat/72NL2mbYxHP0zrOB3f3QilNPJI7q3w5xs
	wVeyVaHVmQa0RWsKdSNXdpZ68FK/P6qCgxIqCmH0rzBIz1yc8AtG57aGojuCq+btSgCdJM
	kMgpjbKEFSn/eBjKsOd+YBfrfwpNGCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783932292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOqYLE7XCd1dyoTtB3Uni1tJhG2ZPfNesMlKhEUlxw0=;
	b=gQkdb4P9HbkQTKS5EkCscMvwW0dRzYA0YniAiaIdT5hSQuexB294AZ+icFllO6E4kklxGL
	Yl2ucsTSYxhqrIBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r+RdOu7X;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gQkdb4P9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783932292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOqYLE7XCd1dyoTtB3Uni1tJhG2ZPfNesMlKhEUlxw0=;
	b=r+RdOu7XiG6HWhbr9pAG6XGyeZKMMBFIRjat/72NL2mbYxHP0zrOB3f3QilNPJI7q3w5xs
	wVeyVaHVmQa0RWsKdSNXdpZ68FK/P6qCgxIqCmH0rzBIz1yc8AtG57aGojuCq+btSgCdJM
	kMgpjbKEFSn/eBjKsOd+YBfrfwpNGCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783932292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOqYLE7XCd1dyoTtB3Uni1tJhG2ZPfNesMlKhEUlxw0=;
	b=gQkdb4P9HbkQTKS5EkCscMvwW0dRzYA0YniAiaIdT5hSQuexB294AZ+icFllO6E4kklxGL
	Yl2ucsTSYxhqrIBA==
Date: Mon, 13 Jul 2026 10:44:51 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Radu Rendec <radu@rendec.net>
Subject: Re: [patch 4/4] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
Message-ID: <alSlg72c8xmjaj48@kunlun.suse.cz>
References: <20260712134433.549076055@kernel.org>
 <20260712141346.772209074@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260712141346.772209074@kernel.org>
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [14.88 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.69)[0.897];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,gmail.com,lwn.net,rendec.net];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spamd-Bar: ++++++++++++++
X-Rspamd-Queue-Id: 8BA357744E
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_014456_279697_7F90E282 
X-CRM114-Status: GOOD (  21.45  )
X-Mailman-Approved-At: Fri, 31 Jul 2026 13:57:57 -0700
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

Hello,

On Sun, Jul 12, 2026 at 11:25:32PM +0200, Thomas Gleixner wrote:
> The return values of syscall_enter_from_user_mode[_work]() are
> non-intuitive. Both functions return the syscall number which should be
> invoked by the architecture specific syscall entry code. The returned
> number can be:
> 
>   - the unmodified syscall number which was handed in by the caller
> 
>   - a modified syscall number (ptrace, seccomp, trace/probe/bpf)
> 
> That has an additional twist. If the return value is -1L then the caller is
> not allowed to modify the return value as that indicates that the modifying
> entity requests to abort the syscall and set the return value already. That
> can obviously not be differentiated from a syscall which handed in -1 as
> syscall number.
> 
> The most trivial way to deal with that is:
> 
>     set_return_value(regs, -ENOSYS);
>     nr = syscall_enter_from_user_mode(regs, nr);
>     if (valid(nr))
>     	handle_syscall(regs, nr);
> 
> That's what LOONGARCH, RISCV, and X86 do. But PowerPC and S390 do not
> preset the return value, so when user space hands in -1 and there is
> nothing setting the return value in the entry work code, then the syscall
> is skipped but the return value is whatever random data has been in the
> return value register.

The reason why PowerPC and S390 do not preset the return value is that
the return value uses the same register as the syscall number. There are
apparently other architectures on which the return value overlaps with
the arguments which also do not preset the return value for that reason.
If they would use the generic entry the same problem would arise.

> Change the return values of syscall_enter_from_user_mode[_work]() to
> boolean and return false, when either ptrace or seccomp request to skip the

There is a difference between seccomp and ptrace.

When seccomp indicates to skip the syscall it has also set the syscall
return value.

However, when the syscall number is -1 and the return value is not
preset that does not indicate anything.

The return value can still hold garbage. ptrace does not have the
ability to indicate that a syscall is to be skipped, at least on the
entry trace. It needs to be skipped based on the syscall number being
invalid.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
