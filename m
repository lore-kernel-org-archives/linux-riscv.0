Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13185C44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaNQXVDDj8vUOzEhneJVOs6r1qrBkRGbZ8+I6odTpZk=; b=EWKdxZ3pG9jUfm
	8ZjjnLvO4KAetpZnGcXjoPGtpxUkF8BcZtWhSpwuHY29FF+JUwzOTYM8FlnRdmDLpKRNlQbyHbJfG
	sPCk+hud7l0jnPGnVTjjDUrJhWaVVEMwvHbrSQA67XwTUytf+xh+iyn935LJd65jm+h6yeUNMCzfv
	tlr6WuDgku1JHIgwAifyji//+uQfIfE83dd5aRt+Z2clyWIbze/6dFppHg2/WP+ZKEC/wh/UZlaNm
	K77wFnPtx3GamVVdGrAPFcEgJYr4KyIo9DtXEeZ7VrG6Gpyu9uqhZefRcr1xGfWgFMjU7K6WSCsAy
	dz894Upvzu+5g3gfkV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeVj-0000000Bo4X-2syA;
	Mon, 06 Jul 2026 08:17:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeVi-0000000Bo4K-0ejR
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08683600C3;
	Mon,  6 Jul 2026 08:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CF91F000E9;
	Mon,  6 Jul 2026 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783325820;
	bh=r7+ah1vbGAvQLsR+3yUG/Iv1avIrbLDskfWMmANIMpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XfC9H2UVpNQGtHq/xKLEWuvy4dBFo+F8wnT4a3nMjIvGfHuzuoXWCWWpR3IRGACyX
	 ddDWKGu9BP+PsJvxUDK2bd/p/KeWLd0czr6A1n2oiorGfYOAORf0VSj4p8BpzPNLGs
	 Ks/289z7wkXWc1DnJ7LrjlkM5r3LLyPV2aysSVO7Va/BtZrxeY3rlf3iV2jR28XK6V
	 xvP1325V2CnieiUAnTaDerFyvnvz3so5txLMmGU2XfJvoVLUklK5D8L7xrnfvcxkuk
	 3Zu/60IEr5IZRUAZ6W1jaKJhtWOhQgEXUqGG56v4UZ08TQLLk8BNUS0lXkVaayTddt
	 u2lcP/zMPqcAw==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Andy
 Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Donnellan
 <andrew+kernel@donnellan.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Arnd Bergmann
 <arnd@arndb.de>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Ryan Roberts <ryan.roberts@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>, Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>, Lukas Gerlach <lukas.gerlach@cispa.de>, Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
Date: Mon, 06 Jul 2026 10:16:57 +0200
Message-ID: <87ik6sjzwm.ffs@fw13>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMDEgMjAyNiBhdCAxOTo0MiwgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiAg
Cj4gIAlpZiAodW5saWtlbHkod29yayAmIFNZU0NBTExfV09SS19TWVNDQUxMX1RSQUNFUE9JTlQp
KQo+IC0JCXN5c2NhbGwgPSB0cmFjZV9zeXNjYWxsX2VudGVyKHJlZ3MsIHN5c2NhbGwpOwo+ICsJ
CSpzeXNjYWxsID0gdHJhY2Vfc3lzY2FsbF9lbnRlcihyZWdzLCAqc3lzY2FsbCk7Cj4gIAo+IC0J
c3lzY2FsbF9lbnRlcl9hdWRpdChyZWdzLCBzeXNjYWxsKTsKPiArCXN5c2NhbGxfZW50ZXJfYXVk
aXQocmVncywgKnN5c2NhbGwpOwo+ICAKPiAtCXJldHVybiByZXQgPyA6IHN5c2NhbGw7Cj4gKwly
ZXR1cm4gMDsKClRoYXQgYnJlYWtzIHRyYWNlX3N5c2NhbGxfZW50ZXIoKSBiZWNhdXNlIHRoZSBw
cm9iZXMvQlBGIG11Y2sgYXR0YWNoZWQKb3QgdGhhdCBjYW46CgogICAgIDEpIHNldCB0aGUgcmV0
dXJuIGNvZGUKICAgICAyKSBzZXQgc3lzY2FsbCB0byAtMUwKClRoYXQgd29ya3MgY29ycmVjdGx5
IHRvZGF5LCBidXQgd2l0aCB5b3VyIHNsb3BweSBoYWNrZXJ5IHRoZSBsb3cgbGV2ZWwKeDg2IGNv
ZGUgZmFsbHMgaW50byBzeXNfbmlfc3lzY2FsbCgpIHdoaWNoIHNldHMgdGhlIHJldHVybiBjb2Rl
IHRvCi1FTk9TWVMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
