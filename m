Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96480C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bunN1h8gbZzECje6bSMrYn/dWL//12Cd3rWhICdB3Zg=; b=fo3fjVYG5fCXEZ
	GD9KdlfBQa2Y037SWjtK3EQY/UOU1pswHojmShJeyLFZ5w/oJHH+9qs3sRyYdBmljk4wPrOoWKlgJ
	pgnUQYdEkmG8IQLf4uJT7jbZiI3424x16n88tHvOxkBarKuoGYrjJTteF6EJ24aETgX4emJ3TYPyg
	QhPMmkVsGJgI1Wkl1DWABIk29oQXE3oMl7oo9tYTIh7lEk1jOqRfKMH7Sk92JtUOXRUMJG9ZQhMR1
	o+yR83XSbQYeSSYlWzIKwKBKeD6MRRCJR1vGS+rm2rwHOhm4c30O0Tgv06AmaDGqK+s1dmMuKLoTh
	AMQEf62LxVBALaohOEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuBr-0000000EjoU-3wbl;
	Fri, 14 Feb 2025 11:49:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tity6-0000000Eh5z-3zXl;
	Fri, 14 Feb 2025 11:34:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739532886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWdSDqLPiHMtkC3qRBjEr7KgW5xesCDv6jmHPBIB4Zc=;
	b=0VNtTEYhNZqymGENVsUmuk+rnlFfX7RSGT3Ho51Jzxq38FSlmeIElqqU148QkLgRvvbxMF
	oARriYR4RFpth96NjMkBo5hNBkelucCuzn5JwatniL1M08uy4SKjyhCAdV/qdQ/eba99LI
	XiEfVSgYOnLLjTtprHlvawcrkXxeqR+m8TpQcRwp+J+sEstFenL0586F5ak1q3mLy7LV6n
	qnrektVapcPsyxUDFZn8atapF68IW+EhNarZoqS+FgcZ3nF1GslRp9zthgkNswbWYfqivE
	2J78e9sNA7ZDPletmeb/HsB02wyQreu92A/Zp2E3TtpGj+8SwnWuzKOp2Uz71Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739532886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWdSDqLPiHMtkC3qRBjEr7KgW5xesCDv6jmHPBIB4Zc=;
	b=WFnwPIfjvhMmBrrfQwvQ/cPdgZnaXQkJD4fxKY5hU7USn1NEKaf7iB28bu/zo8sPSUnwBx
	KGOlqDpRoCYGNWAw==
To: David Woodhouse <dwmw2@infradead.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Russell King <linux@armlinux.org.uk>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
 linux-csky@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>, "Luu,
 Ryan" <rluu@amazon.com>, kvm <kvm@vger.kernel.org>
Subject: Re: [PATCH v3 00/18] vDSO: Introduce generic data storage
In-Reply-To: <ff83dc5c91b4e46bcf2d99680ec6af250fb05b27.camel@infradead.org>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <ff83dc5c91b4e46bcf2d99680ec6af250fb05b27.camel@infradead.org>
Date: Fri, 14 Feb 2025 12:34:44 +0100
Message-ID: <87ed00kbe3.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_033451_138757_97DC5281 
X-CRM114-Status: GOOD (  22.36  )
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

RGF2aWQhCgpPbiBUaHUsIEZlYiAwNiAyMDI1IGF0IDA5OjMxLCBEYXZpZCBXb29kaG91c2Ugd3Jv
dGU6Cj4gVGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMuIElzIHRoZXJlIGEgcGxhbiB0byBleHBv
c2UgdGhlIHRpbWUgZGF0YQo+IGRpcmVjdGx5IHRvIHVzZXJzcGFjZSBpbiBhIGZvcm0gd2hpY2gg
aXMgdXNhYmxlICpvdGhlciogdGhhbiBieQo+IGZ1bmN0aW9uIGNhbGxzIHdoaWNoIGdldCB0aGUg
dmFsdWUgb2YgdGhlIGNsb2NrIGF0IGEgZ2l2ZW4gbW9tZW50Pwo+Cj4gRm9yIHBvcHVsYXRpbmcg
dGhlIHZtY2xvY2sgZGV2aWNlwrkgd2UgbmVlZCB0byBrbm93IHRoZSBhY3R1YWwKPiByZWxhdGlv
bnNoaXAgYmV0d2VlbiB0aGUgaGFyZHdhcmUgY291bnRlciAoVFNDLCBhcmNoIHRpbWVyLCBldGMu
KSBhbmQKPiByZWFsIHRpbWUgaW4gb3JkZXIgdG8gcHJvcGFnYXRlIHRoYXQgdG8gdGhlIGd1ZXN0
Lgo+Cj4gSSBzZWUgdHdvIG9wdGlvbnMgZm9yIGRvaW5nIHRoaXM6Cj4KPiAgMS4gVmlhIHVzZXJz
cGFjZSwgZXhwb3NpbmcgdGhlIHZkc28gdGltZSBkYXRhIChhbmQgYSBub3RpZmljYXRpb24gd2hl
bgo+ICAgICBpdCBjaGFuZ2VzPykgYW5kIGxldHRpbmcgdGhlIHVzZXJzcGFjZSBWTU0gcG9wdWxh
dGUgdGhlIHZtY2xvY2suCj4gICAgIFRoaXMgaXMgY29tcGxleCBmb3IgeDg2IGJlY2F1c2Ugb2Yg
VFNDIHNjYWxpbmc7IGluIGZhY3QgdXNlcnNwYWNlCj4gICAgIGRvZXNuJ3QgY3VycmVudGx5IGtu
b3cgdGhlIHByZWNpc2Ugc2NhbGluZyBmcm9tIGhvc3QgdG8gZ3Vlc3QgVFNDCj4gICAgIHNvIHdl
J2QgaGF2ZSB0byBiZSBhYmxlIHRvIGV4dHJhY3QgdGhhdCBmcm9tIEtWTS4KCkV4cG9zaW5nIHRo
ZSByYXcgZGF0YSBpcyBub3QgZ29pbmcgdG8gaGFwcGVuIGFzIHdlIHdvdWxkIGNyZWF0ZSBhbiBB
QkkKcHJldmVudGluZyBhbnkgbW9kaWZpY2F0aW9ucyB0byB0aGUgaW50ZXJuYWxzLiBWRFNPIGRh
dGEgaXMgY29uc2lkZXJlZCBhCmZ1bGx5IGludGVybmFsICh0aGluayBrZXJuZWwpIHJlcHJlc2Vu
dGF0aW9uIGFuZCB0aGUgYWNjZXNzb3IgZnVuY3Rpb25zCmNyZWF0ZSBhbiBBQkkgYXJvdW5kIGl0
LiBTbyBpZiBhdCBhbGwgeW91IGNhbiBhZGQgYSBhY2Nlc3NvciBmdW5jdGlvbgp3aGljaCBleHBv
c2VzIGRhdGEgdG8gdXNlciBzcGFjZSBzbyB0aGF0IHRoZSBpbnRlcm5hbCBkYXRhCnJlcHJlc2Vu
dGF0aW9uIGNhbiBzdGlsbCBiZSBtb2RpZmllZCBhcyBuZWNlc3NhcnkuCgo+ICAyLiBJbiBrZXJu
ZWwsIGFza2luZyBLVk0gdG8gcG9wdWxhdGUgdGhlIHZtY2xvY2sgc3RydWN0dXJlIG11Y2ggbGlr
ZQo+ICAgICBpdCBkb2VzIG90aGVyIHB2Y2xvY2tzIHNoYXJlZCB3aXRoIHRoZSBndWVzdC4gS1ZN
L3g4NiBhbHJlYWR5IHVzZXMKPiAgICAgcHZjbG9ja19ndG9kX3JlZ2lzdGVyX25vdGlmaWVyKCkg
dG8gaG9vayBjaGFuZ2VzOyBzaG91bGQgd2UgZXhwYW5kCj4gICAgIG9uIHRoYXQ/IFRoZSBwcm9i
bGVtIHdpdGggdGhhdCBub3RpZmllciBpcyB0aGF0IGl0IHNlZW1zIHRvIGJlCj4gICAgIGNhbGxl
ZCBmYXIgbW9yZSBmcmVxdWVudGx5IHRoYW4gSSdkIGV4cGVjdC4KCkl0J3MgY2FsbGVkIG9uY2Ug
cGVyIHRpY2sgdG8gZXhwb3NlIHRoZSBjb250aW5vdXMgdXBkYXRlcyB0byB0aGUKY29udmVyc2lv
biBmYWN0b3JzIGFuZCByZWxhdGVkIGludGVybmFsIGRhdGEuCgpUaGFua3MsCgogICAgICAgIHRn
bHgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
