Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E866C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2/kZvpx+n+a1Mz6RCz4d+R8mIBbv3sjgiIIQ8pCReY=; b=ZwamNb70BO0qHQ
	sYs89WvkGmN8QSRGsgwocjELphiTmVJ65+NkrTgViBc1gIvT0X0bYqH+ta4UV9I7RtBMbqEL7d0+h
	RYiajsYWmlfnpSip/6RBNrlRsbUPXykbgC29kb9iUvAmsBmnpnvJ//JW35C3QhyyWltRxKdZD6f5s
	7G23DNM/T2PrMEx7sgpJNOJySFqKp9eYtDZrc7/iQJABd0FyLHbcZ+7ihPxIgqSkAlTsFQuTwCCWT
	oKy0VqBJGOAhXVtx9XHNlB10eo44h5L7sRkI1MmlfqJgBQ2V8jdXtD4iK68YAbgOuKZKI+EDJxXmI
	NEZAWzzNOoc/fGXtiBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHcy-00000005ejk-33xH;
	Fri, 10 Jul 2026 20:15:16 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTB-00000003ycl-0FWp
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:12:30 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC71C740D7;
	Thu,  2 Jul 2026 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782983547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRjlOG5TiXfZ2nHN8jbS31TsEigRmVqtiMO2xZmgwtE=;
	b=qTiFPQh+EAtnfZMspyIp88DVum08lq2h4M2oG+17REMmQZO/x99GyEPSyZcrk+53/j4pE7
	ayUyxs1+H15MCkTXYR6IAyOF8/FJedHYq6bIOW4Tu55Xzy1cDgxE3TtnSGRxrEKYkr9qCx
	MPDOGMtMfY/q90k/HdbzQB0MG6RtC98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782983547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRjlOG5TiXfZ2nHN8jbS31TsEigRmVqtiMO2xZmgwtE=;
	b=aP6p0YP/H9yklntcuxcs7O0hloiylzECiJuUePIZbwx7+JaYmW/QkkjkEZbLRVL/Qrxsum
	V6sX1ipWkXeTo6AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xiNrM9PH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Gd5jd37P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782983546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRjlOG5TiXfZ2nHN8jbS31TsEigRmVqtiMO2xZmgwtE=;
	b=xiNrM9PHv8T5r22Baf5wzuy/XEFUTC4h/U218uOWQiGo4hRQJKmIZSs8S+OlGNXeruiGUh
	uEK3DCLCp2w+dcRHtrJu/oX0nohIw+HkUyfnSS2l1y6lkIHXdw2JY7qfkq/ytqyU4xB6Zp
	TSkWj8Mxuv4w/GQNzlcb1o/p9eJieDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782983546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRjlOG5TiXfZ2nHN8jbS31TsEigRmVqtiMO2xZmgwtE=;
	b=Gd5jd37PMMWNL15+a5FHWW6qPpNO2PnTB1RPKgya/PwYhq70rKS0IfGDTjRQHsyTLs59rb
	EnhfcqK6Ag9I1tBQ==
Date: Thu, 2 Jul 2026 11:12:25 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Sven Schnelle <svens@linux.ibm.com>
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
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <akYreY_BHuRbxSsO@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
 <yt9dechlbyj0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yt9dechlbyj0.fsf@linux.ibm.com>
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: CC71C740D7
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.65 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	NEURAL_SPAM_SHORT(1.96)[0.653];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[infradead.org,lwn.net,linuxfoundation.org,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,donnellan.id.au,arm.com,arndb.de,flygoat.com,sifive.com,linutronix.de,rivosinc.com,cispa.de,bytedance.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5ct4uf71gj8hk4gmisc87btw)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_021229_248265_C355DD51 
X-CRM114-Status: GOOD (  25.13  )
X-Mailman-Approved-At: Fri, 10 Jul 2026 13:15:15 -0700
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

On Thu, Jul 02, 2026 at 10:12:35AM +0200, Sven Schnelle wrote:
> Michal Such=E1nek <msuchanek@suse.de> writes:
> =

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
> >
> > Pass the syscall number as a pointer to the inline entry functions, and
> > use the return value exclusively for the indication that the syscall is
> > already handled.
> >
> > This should avoid the need for the s390 PIF_SYSCALL_RET_SET which is the
> > workaround for exactly this deficiency.
> =

> I'm not sure whether PIF_SYSCALL_RET_SET can be removed - the syscall
> return might still get set by PTRACE_SET_SYSCALL_INFO when the tracee is
> stopped. This might be a positive number which can't be distinguished
> from a syscall number. But maybe i'm missing something? It's been quite
> a while since I touched all that ptrace stuff.

When the syscall return value is set (in the registers) the return value
which is also the modified syscall number is set to -1 indicating the
syscall was handled. At least that's how the API is described.

So yes, if the syscall number range is restricted or the syscall number
is returned through a path different from the function return value the
flag should not be needed in the entry path because the case can be
detected through the return value alone.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
