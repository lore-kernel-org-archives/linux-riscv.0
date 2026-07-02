Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BFDC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsRmRJbAjVtSfvtIKAT1WFwUB6hcD4PR8HKJ4E+UT4c=; b=pgqpjRB3nno2b6
	ve2a9OjM17AUOwisghSMmMNi9pnWLTt9NO830aVRxV7WrPzwHYM9pfrKrBTLZR8DbG3XdVVAt4PbD
	3F2DY+66JXnNSV0SS/YhXXt16ERtFTP32hNPL/mWqy9YjjwzhJ5mPZAfHOw1ymSS746rdVjPPNcd6
	xCwGh70zulgMMKml02QGIOdyv397RGS6TEo7y02bRmmaLd4ZoaPpDA80ec6KuebXyyQUJa9Mm7kxh
	qVxhM76Cjrl9WL0EZ7hqg9P+s57Aghvkz1SwLnlAIGZykBtPeBTo/2sH1Co71ZlXHq7wvFvWtF+uM
	wMbnRAJDtSRJ8zSbUKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFrc-00000004LtB-0TYz;
	Thu, 02 Jul 2026 11:45:52 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFrZ-00000004LsF-2Oy3
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 11:45:50 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9393375C35;
	Thu,  2 Jul 2026 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782992747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sE5mvMjaed8Js4BiYjZ4KNoj5NHyhgaZgvHetARXIY=;
	b=S/IosL+Tzknzx5iaQYdkXBA9cX2U6axC0l8QFQJVZw4SSt5lzPuOhuAEKcOXi0o5YUTNR9
	Nw71o4rDsmcI05DH/48sQEQ5KafiSK7QR3+OmqxfRwrsOlxeFM5ONp1+OlmJSH4YMgw8BC
	jnF8mJq8iwbn8aLCSxV9v+4uWe4/VZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782992747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sE5mvMjaed8Js4BiYjZ4KNoj5NHyhgaZgvHetARXIY=;
	b=loCKWFsBT/7dFcBvmpE0VlQqhM/VS05dnHzMePJDdt6iY0tayVWWilEx9AEo2o/iuHk5CG
	ThxnObHRscAr1iDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="S/IosL+T";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=loCKWFsB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782992747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sE5mvMjaed8Js4BiYjZ4KNoj5NHyhgaZgvHetARXIY=;
	b=S/IosL+Tzknzx5iaQYdkXBA9cX2U6axC0l8QFQJVZw4SSt5lzPuOhuAEKcOXi0o5YUTNR9
	Nw71o4rDsmcI05DH/48sQEQ5KafiSK7QR3+OmqxfRwrsOlxeFM5ONp1+OlmJSH4YMgw8BC
	jnF8mJq8iwbn8aLCSxV9v+4uWe4/VZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782992747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sE5mvMjaed8Js4BiYjZ4KNoj5NHyhgaZgvHetARXIY=;
	b=loCKWFsBT/7dFcBvmpE0VlQqhM/VS05dnHzMePJDdt6iY0tayVWWilEx9AEo2o/iuHk5CG
	ThxnObHRscAr1iDg==
Date: Thu, 2 Jul 2026 13:45:46 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Zong Li <zong.li@sifive.com>, Nam Cao <namcao@linutronix.de>,
	Deepak Gupta <debug@rivosinc.com>,
	Lukas Gerlach <lukas.gerlach@cispa.de>,
	Rui Qi <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
Message-ID: <akZPakNl6JT_jgGd@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
 <878q7tprau.ffs@fw13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878q7tprau.ffs@fw13>
X-Spamd-Bar: +++
X-Rspamd-Queue-Id: 9393375C35
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.99 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,lwn.net,linuxfoundation.org,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,donnellan.id.au,arm.com,arndb.de,flygoat.com,sifive.com,linutronix.de,rivosinc.com,cispa.de,bytedance.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	RCVD_COUNT_ZERO(0.00)[0];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	R_RATELIMIT(0.00)[to_ip_from(RLs1yuyu6ywojxyk8y3ncu5g39)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_044549_768673_1AACBA7D 
X-CRM114-Status: GOOD (  34.47  )
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

On Thu, Jul 02, 2026 at 01:24:57PM +0200, Thomas Gleixner wrote:
> On Wed, Jul 01 2026 at 19:42, Michal Such=E1nek wrote:
> > The return value of syscall_enter_from_user_mode is used both for the
> > adjusted syscall number and the indicator that a syscall should be
> > skipped.
> >
> > As seccomp can be invoked on any syscall, including invalid ones this
> > somewhat undermines seccomp.
> >
> > While the seccomp variants that terminate the process do not need to
> > care about this for the filter that sets the syscall return value this
> > disctinction is required.
> =

> You completely fail to explain why and what actual problem you are
> trying to solve. At least I can't figure it out from the above word
> salad.

syscall_enter_from_user_mode returns the new syscall number after doing
something arbitrarry with it, including running seccomp.

Wehn the syscall is already handled, eg. by seccomp filtering it returns
-1 as the new syscall number. -1 is an invalid syscall number but it can
still be filtered by seccomp. When the syscall number was -1 to start
with it's not possible to determine if the syscall was fileterd from the
return value. s390 returns the filtered state in a flag it sets on the
regs structure, avoiding this problem.

However, the API should be specified in a way that does not require
everyone implementing such flag.

> =

> > Pass the syscall number as a pointer to the inline entry functions, and
> > use the return value exclusively for the indication that the syscall is
> > already handled.
> >
> > This should avoid the need for the s390 PIF_SYSCALL_RET_SET which is the
> > workaround for exactly this deficiency.
> >
> > If this is desirable the patch could be split into some series that
> > adjusts the code flow where needed so that the final change is mostly
> > mechanical.
> =

> That's not a matter of desire. That's mandatory.

So long as it's desirable to implement an API change in this direction,
it's not clear to me so far.

> > -	instrumentation_begin();
> > -	if (!invoke_syscall(regs, nr) && nr !=3D -1)
> > -	 	result_reg(regs) =3D __sys_ni_syscall(regs);
> > -	instrumentation_end();
> > +	/* Skip syscall when -1 is returned */
> > +	if (!syscall_enter_from_user_mode(regs, &nr)) {
> =

> Seriously?
> =

> If we go and separate the syscall number from the return value, then the
> return value 0 means success and anything else fail. Which in other
> words is a boolean. So instead of tastelessly adding a completely
> nonsensical comment about -1 here, syscall_enter_from_user_mode() wants
> to have the return value type bool with a proper boolean logic: true =3D
> success, false =3D abort.

We have that very same API down to __secure_computing() which returns
boolean represented as -1 and 0 values. That does not mean it's not
tasteless.

> =

> > @@ -168,8 +168,7 @@ __visible noinstr void do_int80_emulation(struct pt=
_regs *regs)
> >  	nr =3D syscall_32_enter(regs);
> >  =

> >  	local_irq_enable();
> > -	nr =3D syscall_enter_from_user_mode_work(regs, nr);
> > -	do_syscall_32_irqs_on(regs, nr);
> > +	syscall_enter_from_user_mode_work(regs, &nr);
> =

> How exactly is this ever going to invoke a valid syscall?

That's one of the problems with giant all-in-one patch, things like this
easily slip in. However, it is in cluded mostly for illustration, I
don't expect anyone to merge this as-is.

> =

> > +	if (!syscall_enter_from_user_mode_work(regs, &nr)) {
> > +		nr &=3D GENMASK(31, 0);
> > +		do_syscall_32_irqs_on(regs, nr);
> =

>   do_syscall_32_irqs_on(regs, (int)nr);
> =

> would be too simple, right?

Also way less explicit.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
