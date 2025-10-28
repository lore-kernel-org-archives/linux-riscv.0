Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F452CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Wegi0Nly/lpVeVvT6Q2TASu2VILLC/6GwmMN7ska5w=; b=U7jh4chyxI52rF
	DnEi62f9mr193EYNYekgUJKu8k59XjoP965tCs9yNENgaCGNyNTV9UAwhXDJ8cakWrm3/drWeyvm4
	yys/MjyLUBVAglzgd69ZpRomygq0ohgwyP59kG13iK7kZzjGcisq8AUT3T+u2Tdg/300jeIHQC7pW
	nKyheYWKvrJIk8BQKcXo/BerjyeLXunZzAObxrNqw9X7OEFE8fE2sh+mupp57HFSxyoCM/YZ80Tqg
	cv1FVK9DN+xy7Mrvvc9r45ufblGNsUFE5+47NJYgMQn8y1pUC99vkWcE67FcYbW+UefsCSRsvz/kJ
	uLHjgb8lZ+xHr/SDHusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm1H-0000000GFAs-02h7;
	Tue, 28 Oct 2025 15:53:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm1E-0000000GFAB-2Col;
	Tue, 28 Oct 2025 15:53:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761666833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	b=OPEqap7k08VJelhy9WBQ/aL5T/8oowjEW/Fj5ejEzvuFUOJdHdYO+nY9g3zwtVd8QWDf1F
	3OycYZl/mXIIkjDEJbYqJn/3lZONlfMLSSkvOIeF5euOmDzhBeb9eL4MDJ07aVD52j+vc3
	2Ki2E0N97eFYWZ8+a5iDKRlRRUgRRS/Cia0Rk/IX+jL/+Yov9CCKMTIDCIZkBPTMJtSuC6
	TlGUy15ZD9OqxHiszUngKkX1GB7hr2PiWfv/E9vY6vQ531cTPrIrUUZLo9u4YJwZ5ShkEp
	MXYPHAOozI3S6XnQsFcoK8zfWpgofXu0Rlf3rxgsiAc0s0ZysVI8vQGLdVgzig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761666833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	b=SARXk4Ruf1xEZbt1pBhbOZgPe7j89e4OCU0if/0OgDMjDi4dxReWkPtapI3fZt2x6xbwVl
	0zokLNUUHORNRdCg==
To: Yann Ylavic <ylavic.dev@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, Darren
 Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
In-Reply-To: <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.231716098@linutronix.de>
 <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
Date: Tue, 28 Oct 2025 16:53:52 +0100
Message-ID: <87jz0fuinj.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085356_781505_467FC2D0 
X-CRM114-Status: UNSURE (   7.46  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjggMjAyNSBhdCAxNTowNCwgWWFubiBZbGF2aWMgd3JvdGU6Cj4gT24gVHVl
LCBPY3QgMjgsIDIwMjUgYXQgMTA6MzLigK9BTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4gd3JvdGU6Cj4+ICsKPj4gKyNkZWZpbmUgX19wdXRfa2VybmVsX25vZmF1bHQoZHN0
LCBzcmMsIHR5cGUsIGxhYmVsKSAgICAgICAgICAgIFwKPj4gK2RvIHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICBf
X2xhYmVsX18gbG9jYWxfbGFiZWw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
Pj4gKyAgICAgICBhcmNoX2dldF9rZXJuZWxfbm9mYXVsdChkc3QsIHNyYywgdHlwZSwgbG9jYWxf
bGFiZWwpOyAgIFwKPgo+IFByb2JhYmx5IGFyY2hfcHV0X2tlcm5lbF9ub2ZhdWx0KCkgaW5zdGVh
ZD8KCkR1aC4gSW5kZWVkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
