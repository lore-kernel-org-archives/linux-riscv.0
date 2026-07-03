Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9C8C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYERMfmDG7QkY/P1AxhGVOS398pKefGP7ruJXJ6yrqc=; b=Q18nWZUz/G26hi
	zABX0Asw0UV+5sWhaqVkcCAfmy5ScQpU6M/cJCz8Kyza79T5OApIohtW5YMT/85+BnejNUFhq1Fte
	JIqk3nrFQzZQ4hBrZpxxjkeHeKDUsp9eSp0BDCvTOOs0VAmdOiCDWJE0J7xYaAYun7qQ8JcGoy+UV
	uTJJjS/BlxgQJRRrXUh4u0GtHQSm6dGgC+ODL1c68crLBANlX0o3Nzp1qblRM3Sck2IF7uLLOwWfC
	VeSqt7dH3y3FwitbTZV80wD11L/QDKu5+POfpejWotd1lhcfYBd+a8TCT4dJjPf50w/OvrGWaQTIT
	AkPD2DDzMepE38z9RelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaIG-00000006Udi-1PDG;
	Fri, 03 Jul 2026 09:34:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaIF-00000006UdV-2dBN
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D09566001A;
	Fri,  3 Jul 2026 09:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B011F000E9;
	Fri,  3 Jul 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783071282;
	bh=nMY8UZyvI/HF5Rdv1bSkWyNbGRbx1G27seV2ZaZUbN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=K4JQ6Zc8TPguGmkEN1toHL2v5PXz61h6EWt7zZ8rNB04Nv/OFyWtRbIK7/fVYv1YG
	 B2iavueYbkcwMfN5GGnSDuP3/Y2ypQOlduP9C9EH0oHedTCI4eVb8GN99XZ7K3gk2U
	 mKiWTX7nFzp9NihhXbgvqGtv6EZe36azyYLF8fKo4DpnPtV9M5EwlFIg4kabWNJ5dR
	 ivYvj8LWnh2+s/7LGPHBUsOszJO62d4z94v7KFjNFI2CueHXILKryvycsxAeIyGtSG
	 s98h3rggiuosCqsSmQ0MRnvTtW2Y2rrZ6VdGUVtB9Peojv9MYzNR0W2Zxz87hN6G4/
	 UM7w31V/ebUew==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Andrew Donnellan <andrew+kernel@donnellan.id.au>, Mark
 Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Ryan Roberts <ryan.roberts@arm.com>, Greg
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
In-Reply-To: <akdqlO0eJ6jKH-wU@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz> <878q7tprau.ffs@fw13>
 <akZPakNl6JT_jgGd@kunlun.suse.cz> <87jyrdnmrh.ffs@fw13>
 <akdqlO0eJ6jKH-wU@kunlun.suse.cz>
Date: Fri, 03 Jul 2026 11:34:39 +0200
Message-ID: <87ik6wmn68.ffs@fw13>
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

T24gRnJpLCBKdWwgMDMgMjAyNiBhdCAwOTo1MywgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBP
biBUaHUsIEp1bCAwMiwgMjAyNiBhdCAxMDo0NTo1NFBNICswMjAwLCBUaG9tYXMgR2xlaXhuZXIg
d3JvdGU6Cj4+ID4gV2hlbiB0aGUgc3lzY2FsbCBudW1iZXIgd2FzIC0xIHRvIHN0YXJ0IHdpdGgg
aXQncyBub3QgcG9zc2libGUgdG8KPj4gPiBkZXRlcm1pbmUgaWYgdGhlIHN5c2NhbGwgd2FzIGZp
bGV0ZXJkIGZyb20gdGhlIHJldHVybiB2YWx1ZS4gczM5MAo+PiA+IHJldHVybnMgdGhlIGZpbHRl
cmVkIHN0YXRlIGluIGEgZmxhZyBpdCBzZXRzIG9uIHRoZSByZWdzIHN0cnVjdHVyZSwKPj4gPiBh
dm9pZGluZyB0aGlzIHByb2JsZW0uCj4+IAo+PiBXaGF0IG5lZWRzIHRvIGRldGVybWluZSB3aGV0
aGVyIHRoZSBzeXNjYWxsIHdhcyBmaWx0ZXJlZCBvciBub3Q/Cj4KPiBUaGUgY29kZSB0aGF0IGV4
ZWN1dGVzIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSBuZWVkcyB0byBkZXRlcm1pbmUK
PiB0aGF0Lgo+Cj4gQWZ0ZXIgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIHJldHVybnMg
dGhlIHN5c2NhbGwgbmVlZHMgdG8gYmUKPiBleGVjdXRlZCBvciBza2lwcGVkLgo+Cj4gJ0V4ZWN1
dGluZycgYW4gaW52YWxpZCBzeXNjYWxsIGJvaWxzIGRvd24gdG8gc2V0dGluZyB0aGUgcmV0dXJu
IHZhbHVlIHRvCj4gLUVOT1NZUy4KPgo+IEJ1dCBpZiB0aGUgc3lzY2FsbCBudW1iZXIgcmV0dXJu
ZWQgaXMgLTEgd2FzIHRoZSBzeXNjYWxsIGZpbHRlcmVkIGFuZAo+IHRoZSByZXR1cm4gdmFsdWUg
c2V0IGJ5IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSBvciBzaG91bGQgaXQgYmUKPiBz
ZXQgYnkgdGhlIGNhbGxlciB0byAtRU5PU1lTPwoKU2VlIHRoZSBleHBsYW5hdGlvbiBJIGdhdmUg
dG8gUGV0ZXIuIEl0J3MgY29uY2x1c2l2ZSwgYnV0IGFkbWl0dGVkbHkgbm90CmludHVpdGl2ZS4K
ClRoZSBmYWN0LCB0aGF0IHMzOTAgZGVjaWRlZCB0byBoYXZlIHRoZSBzeXNjYWxsIG51bWJlciBh
bmQgdGhlIHJldHVybgp2YWx1ZSBpbiB0aGUgc2FtZSByZWdpc3RlciBpcyBhIGRpZmZlcmVudCBw
cm9ibGVtLCBidXQgYXMgSSBwb2ludGVkIG91dAp0byBTdmVuIGl0IGNvdWxkIGhhdmUgYmVlbiBz
b2x2ZWQgY29tcGxldGVseSB3aXRob3V0IHRoYXQgZmxhZy4KClRoYW5rcywKCiAgICAgICAgdGds
eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
