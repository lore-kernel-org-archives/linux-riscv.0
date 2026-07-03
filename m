Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E6C44500
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qs+X2wJ/+fVxSb9MxZl0rKn/BpXD39kdiRtcrHJ440s=; b=PMFanYPMalwOXT
	JKxin3bF/xrwPTnfCJYTwaCuHx2MJ9QZz35ILkdn1kEb8gAPRf5cqzuLKJhH33yJpw3awo1z1umlh
	Ut7K0w6lDFZgZfZ5pIb5UblgBqJRHssbIjOxFQ6yqqPZhc+It3zopDvm7oNadrSW3m9Jp1u0p0y58
	uUfw8zqBOHRvmnqppXPGC2d8D2Ipx29C8MumwKZmywVmwR4r4Ou0soLA6NtPK6aXrxoV+8JN8/40N
	KYlktkEbJDpHN1aozb34naYAz4qNDGW1gR7OyNPBdg89vZWuQ+hRk8RChuixXj5Ui0KtxXXZA9bZ+
	RQdhzYeW+2VQW8XKRj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaRg-00000006VM9-0ud9;
	Fri, 03 Jul 2026 09:44:28 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaRd-00000006VKw-0ovK
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:44:26 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 217FA747FE;
	Fri,  3 Jul 2026 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783071863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvVdFC/w93Kd0pOreOXa++4p9nmwSNNQYlxhQaYUCks=;
	b=DPLiZHb9AFizwgdPdY9ZWzKFAG1DhD3/oTe4wGbn51M13DPaair6AlbEX3LaV9XuUdBz81
	+giYBjxqeGo7J+lkc6Zx6O4HJE20nW4si+aVXHAEQ8WA+GGwEiJ96rkhulSg7xMgYxd5pN
	IRMjRKWfHWOwKHx6xE3I/LqStYDci2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783071863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvVdFC/w93Kd0pOreOXa++4p9nmwSNNQYlxhQaYUCks=;
	b=RFHq4t2n78OVH5E64KJJlOEOwn4PMj+Vd75rr7m6vznsLIX71F+uh+aM1TQTPREfoDwij2
	U8TSotwPfJf9l0AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DPLiZHb9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RFHq4t2n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783071863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvVdFC/w93Kd0pOreOXa++4p9nmwSNNQYlxhQaYUCks=;
	b=DPLiZHb9AFizwgdPdY9ZWzKFAG1DhD3/oTe4wGbn51M13DPaair6AlbEX3LaV9XuUdBz81
	+giYBjxqeGo7J+lkc6Zx6O4HJE20nW4si+aVXHAEQ8WA+GGwEiJ96rkhulSg7xMgYxd5pN
	IRMjRKWfHWOwKHx6xE3I/LqStYDci2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783071863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvVdFC/w93Kd0pOreOXa++4p9nmwSNNQYlxhQaYUCks=;
	b=RFHq4t2n78OVH5E64KJJlOEOwn4PMj+Vd75rr7m6vznsLIX71F+uh+aM1TQTPREfoDwij2
	U8TSotwPfJf9l0AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DD99779AA;
	Fri,  3 Jul 2026 09:44:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vJYxF3WER2oBAgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 03 Jul 2026 09:44:21 +0000
Date: Fri, 3 Jul 2026 10:44:19 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <akeDk49-pPgUDek1@pedro-suse>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703022507.187457-1-leon.hwang@linux.dev>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 217FA747FE
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kvack.org,lwn.net,linuxfoundation.org,linux-foundation.org,infradead.org,kernel.org,google.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linutronix.de,chromium.org,garyguo.net,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLaou5zaf46joj1hsq6ffhoiia)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,linux.dev:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_024425_557874_B28A3FEA 
X-CRM114-Status: GOOD (  31.64  )
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
> mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
> to sys_ni_syscall() and return -ENOSYS rather than -EPERM.
> 
> Document the -EINTR return from mmap_write_lock_killable(), fix the
> CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
> terms of VM_SEALED_SYSMAP.
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  Documentation/userspace-api/mseal.rst | 18 ++++++++++--------
>  init/Kconfig                          |  2 +-
>  mm/mseal.c                            |  4 ++--
>  3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
> index ea9b11a0bd89..1f1cf206670c 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -50,8 +50,10 @@ mseal syscall signature
>           * The start address (``addr``) is not allocated.
>           * The end address (``addr`` + ``len``) is not allocated.
>           * A gap (unallocated memory) between start and end address.
> -      - **-EPERM**:
> -         * sealing is supported only on 64-bit CPUs, 32-bit is not supported.
> +      - **-EINTR**:
> +         * Interrupted while waiting for the mmap write lock.
> +      - **-ENOSYS**:
> +         * The kernel does not implement ``mseal()``.
>  
>     **Note about error return**:
>        - For above error cases, users can expect the given memory range is

Honestly, this whole thing needs to be deleted. We need a proper manpage.

> @@ -62,7 +64,8 @@ mseal syscall signature
>          memory range could happen. However, those cases should be rare.
>  
>     **Architecture support**:
> -      mseal only works on 64-bit CPUs, not 32-bit CPUs.
> +      mseal is built only for 64-bit kernels. 32-bit kernels return
> +      ``-ENOSYS``.

This LGTM.

>  
>     **Idempotent**:
>        users can call mseal multiple times. mseal on an already sealed memory
> @@ -131,20 +134,19 @@ Use cases
>  - Chrome browser: protect some security sensitive data structures.
>  
>  - System mappings:
> -  The system mappings are created by the kernel and includes vdso, vvar,
> +  The system mappings are created by the kernel and include vdso, vvar,
>    vvar_vclock, vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
>  
>    Those system mappings are readonly only or execute only, memory sealing can
> -  protect them from ever changing to writable or unmmap/remapped as different
> +  protect them from ever changing to writable or unmapped/remapped as different
>    attributes. This is useful to mitigate memory corruption issues where a
>    corrupted pointer is passed to a memory management system.

Also LGTM.

>  
>    If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
> -  the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
> -  architecture.
> +  CONFIG_MSEAL_SYSTEM_MAPPINGS seals mappings marked with VM_SEALED_SYSMAP.

VM_SEALED_SYSMAP isn't meaningful to userspace.

>  
>    The following architectures currently support this feature: x86-64, arm64,
> -  loongarch and s390.
> +  loongarch, riscv, and s390.

This is also useless, every 64-bit architecture will support this.

>  
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/init/Kconfig b/init/Kconfig
> index 5230d4879b1c..12bb39f637b1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>  	  from a kernel perspective.
>  
>  	  After the architecture enables this, a distribution can set
> -	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
> +	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
>  
>  	  For complete descriptions of memory sealing, please see
>  	  Documentation/userspace-api/mseal.rst
> diff --git a/mm/mseal.c b/mm/mseal.c
> index 9781647483d1..0464c7b94ab9 100644
> --- a/mm/mseal.c
> +++ b/mm/mseal.c
> @@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
>   *   addr is not a valid address (not allocated).
>   *   end (start + len) is not a valid address.
>   *   a gap (unallocated memory) between start and end.
> - *  -EPERM:
> - *  - In 32 bit architecture, sealing is not supported.
> + *  -EINTR:
> + *   interrupted while waiting for the mmap write lock.
>   * Note:
>   *  user can call mseal(2) multiple times, adding a seal on an
>   *  already sealed memory is a no-action (no error).

And this whole header needs to be deleted as well. No one's looking at
kernel code for documentation (and if they are, we did a horrendous job
at actually documenting the thing).

-- 
Pedro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
