Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D83EA4E33
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhNw2/eJCFNmVC1FwrU6coXa8lZLk3vBTFKAkkg5Wp0=; b=PcI1r85vCxtmDmk4GZx2zfLdJ3
	aLp/30QLRIKSg6+ecVshx7MNfLUgQXXOtwm88j8V0XuXrbV5jk2TTU4b197vq516EyUnAzkdO9X70
	k95X/DrqmTIVKtiziFHaX/PzQLas+pInQprGOO/zHVR/b/aF39c/aUBksVlgX7Y6JTBxTRgnA5iS6
	wKBpQAR/4KHW5eqLPSWh6rQHdnz02K0nL6U7gdbyAJrTCrWxO/jc1ifGzPRAHEvEgqkPUD33FhrJp
	U8VjadRz3BFgB1YWZsnjwuHuI0nGTSopsFwiWqRBuVhWSEDZP+ZUDiVKZDpygq6hvv+BwSwR9k7XL
	5MplAntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ns-0000000DSBE-4AoD;
	Mon, 02 Mar 2026 16:07:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5nr-0000000DSAo-2k25;
	Mon, 02 Mar 2026 16:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4321B60008;
	Mon,  2 Mar 2026 16:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AD7C19423;
	Mon,  2 Mar 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772467645;
	bh=Q4f5IphZs1HK0nenixYFPe8rEaCz8xjgoIeWN6zDZUo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=IMLp9T97Z1WGqMa4vKl8aLMG1SCE+RTETM4LF9HiMKYx4UrsyfNc9AmTDAGMeQxpx
	 atWX3a+51jxWTnQfRmsvdiTbUN5rkz4n69cFBN9Vaugs7LwCYmh6fDHvK5BH95218S
	 WjTE7/IyxVl5IgiZ9xplzxjGM5hkgVvNAXL1Z1enx+z/+fXCcGFwXMTuwRFFzTqiGk
	 S9kzt7FFHlwJc14uSgPaUHzirBOUCLO109ioqQTYkZsBASo9Vte2pZwBVGSWpTn/BA
	 OyyNKXo2fT5eBtBhIb63i0iitx6BOkgqZj36M2Gp4ZCV608BRToV1uBjtWBe/i8M7c
	 IezwEcB5TWUBA==
Message-ID: <5cef9283-c718-4832-9ef6-71f1722cb8e1@kernel.org>
Date: Mon, 2 Mar 2026 17:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next 5/5] signal: Use scoped_user_access() instead of
 __put/get_user()
To: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andre Almeida <andrealmeid@igalia.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-6-david.laight.linux@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260302132755.1475451-6-david.laight.linux@gmail.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwMi8wMy8yMDI2IMOgIDE0OjI3LCBkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tIGEg
w6ljcml0wqA6Cj4gRnJvbTogRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwu
Y29tPgo+IAo+IE1lY2hhbmljYWxseSBjaGFuZ2UgdGhlIGFjY2Vzc19vaygpIGFuZCBfX2dldC9w
dXRfdXNlcigpIHRvIHVzZQo+IHNjb3BlZF91c2VyX3JlYWQvd3JpdGVfYWNjZXNzKCkgYW5kIHVu
c2FmZV9nZXQvcHV0X3VzZXIoKS4KPiAKPiBUaGlzIGdlbmVyYXRlcyBiZXR0ZXIgY29kZSB3aXRo
IGZld2VyIFNUQUMvQ0xBQyBwYWlycy4KPiAKPiBJdCBhbHNvIGVuc3VyZXMgdGhhdCBhY2Nlc3Nf
b2soKSBpcyBjYWxsZWQgbmVhciB0aGUgdXNlciBhY2Nlc3Nlcy4KPiBJIGZhaWxlZCB0byBmaW5k
IHRoZSBvbmUgZm9yIF9fc2F2ZV9hbHRzdGFjaygpLgoKT24gYXJtNjQgaXQncyBkb25lIGluIGdl
dF9zaWdmcmFtZSgpIGl0IHNlZW1zLgoKPiAKPiBMb29raW5nIGF0IHRoZSBjaGFuZ2UsIHBlcmhh
cHMgdGhlcmUgc2hvdWxkIGJlIGFsaWFzZXM6Cj4gI2RlZmluZSBzY29wZWRfcHV0X3VzZXIgdW5z
YWZlX3B1dF91c2VyCj4gI2RlZmluZSBzY29wZWRfZ2V0X3VzZXIgdW5zYWZlX2dldF91c2VyCgpN
aWdodCBiZSBjb25mdXNpbmcgdG8gaGF2ZSB0d28gbWFjcm9zIGRvaW5nIGV4YWN0bHkgdGhlIHNh
bWUgdGhpbmcuCgpBbmQgdGhlIGNodXJuIG1pZ2h0IGJlIHVubmVjZXNzYXJ5IG9uIHNvbWUgY29k
ZSB0aGF0IGFscmVhZHkgd2lkZWx5IHVzZSAKdW5zYWZlX3h4eCBtYWNyb3MgYW5kIHRoYXQgd2Ug
d2FudCB0byBjb252ZXJ0IHRvIHNjb3BlZCB1c2VyIGFjY2VzcywgCmxpa2UgZm9yIGluc3RhbmNl
IGFyY2gvcG93ZXJwYy9rZXJuZWwvc2lnbmFsXzMyLmMKCkNocmlzdG9waGUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
