Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD363C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SerbJZ1Wxqw4gwB76tOy/1GsqOkhEN9oyDF5UzsS4Nc=; b=Lfp/urpwYKglGT
	PlJSNwD2oo4nzjJkBO/ZGrkE6rjlhKTYog7sCuOsNHu01U0Q+uD0+0rTobYOVP49oJAW4khMI9gK3
	X7oUmEdp7BmPB6g77jTew9ErM4DhL23/dyFU2BFAkCtFQBHJs14+gay/VW8ObhWz+wQZ3zM0Rpr4Z
	NVD218bJye9agAx8AhjXR5CGu95KHN8nKKzca3rPPdyFEWiXxds/UmLL1F9GiT4FNQa1W+X8lCzF7
	Di3LrlAZFi5l+yjEsiZ58DOsX4AvglzRlP/YekzeIm+hgmExIedCznISTfKMljdOfkF+/Cbql+ue6
	PJFQJfKQDW2xvVLMqDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcF3-0000000BvbO-24wg;
	Tue, 14 Jul 2026 12:28:05 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcEz-0000000BvZ4-27HR
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:28:03 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B1CE77E59;
	Tue, 14 Jul 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784032079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv55jrFDO93gjGYIsU0f7D2xrkBLg3m+YQNtif0jQGw=;
	b=ZlsG22+2qJHsdTgdkxvwmSlcE2jpD1rDFltZ2XBaaBUdxSXZ9XTNs5pK/w4lCTCHx6x/us
	rdRAWawR7siq4niXzhUqnNnE5zb9rtW+qo+o2fR+aSW99C2RM5JEfmFuQ+Ug1+/rcEi/8D
	zneyg7bhMeggThQytWIj8e9LdbZpxPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784032079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv55jrFDO93gjGYIsU0f7D2xrkBLg3m+YQNtif0jQGw=;
	b=SHQYjcVL5VrOKoaQAh2ZpNoUXIv2pbv4B/7Mv1feXJEdCMZcbfPGQCL5NBPQDmIOG9kGxC
	PRv0lwkN6hB1BSAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZlsG22+2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SHQYjcVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784032079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv55jrFDO93gjGYIsU0f7D2xrkBLg3m+YQNtif0jQGw=;
	b=ZlsG22+2qJHsdTgdkxvwmSlcE2jpD1rDFltZ2XBaaBUdxSXZ9XTNs5pK/w4lCTCHx6x/us
	rdRAWawR7siq4niXzhUqnNnE5zb9rtW+qo+o2fR+aSW99C2RM5JEfmFuQ+Ug1+/rcEi/8D
	zneyg7bhMeggThQytWIj8e9LdbZpxPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784032079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv55jrFDO93gjGYIsU0f7D2xrkBLg3m+YQNtif0jQGw=;
	b=SHQYjcVL5VrOKoaQAh2ZpNoUXIv2pbv4B/7Mv1feXJEdCMZcbfPGQCL5NBPQDmIOG9kGxC
	PRv0lwkN6hB1BSAQ==
Date: Tue, 14 Jul 2026 14:27:58 +0200
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
Subject: Re: [patch 0/4] entry: Rework syscall skip logic
Message-ID: <alYrTktEcosLvGiw@kunlun.suse.cz>
References: <20260712134433.549076055@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260712134433.549076055@kernel.org>
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: 7B1CE77E59
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [2.49 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,gmail.com,lwn.net,rendec.net];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kunlun.suse.cz:mid,kunlun.suse.cz:helo,suse.de:email,suse.de:dkim]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052801_904509_BD6E0548 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jul 12, 2026 at 11:25:12PM +0200, Thomas Gleixner wrote:
> This are the reworked leftovers of the larger entry logic rework series,
> which can be found here:
> =

>   https://lore.kernel.org/lkml/20260707181957.433213175@kernel.org
> =

> The undisputed part of the series has been merged into:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
> =

> After a fruitless discussion about the most resilent approach, I decided =
to
> give up wasting my time and reworked the series so it caters to the desire
> of powerpc and s390 to be special.
> =

> That results in almost identical behavior except for the case where
> tracing/probe/BPF sets the syscall number to -1 (or any other out of range
> value) and also sets the syscall return value to something different than
> -ENOSYS.
> =

> PowerPC and S390 will overwrite that value with -ENOSYS.
> =

> Loongarch, RISC-V and x86 will not overwrite it because those architectur=
es
> preset the return value to -ENOSYS and skip out of range syscalls
> completely. Loongarch and RISC-V always did the out of range skip. X86
> gained that in the already applied rework, which means that the final pat=
ch
> which splits the skip decision from the syscall number does not longer
> change x86 behavior for the above case.
> =

> Documentation is also updated and describes the two implementation varian=
ts
> and the subtle difference in the resulting behavior.
> =

> The series applies on top of:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
> =

> and is also available from git:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry/rewo=
rk

Hello,

applying this on top of 7.2~rc3 and running tests for the cases that
were reported as problematic I see results as expected.

This version of the patchset works for me.

Tested-by: Michal Such=E1nek <msuchanek@suse.de>

This is certainly not comprehensive, there are many corner cases not
tested. Some were broken to start with as well.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
