Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE33CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcZymnprudgEYzOqV5KhTYNZ6jAulUuSzEO0E6IjHMM=; b=xqj9Q9tr/GtbpJ
	l5CfwyHGdpLdSlrNS7Xm5WA3Gy03yurIghKkjEK2Xdie5MakgnM5nndAyM6haHOLfocdGOiiuegUi
	4R0e0YKm2h/RJ5jwLTn1HI7Nw7SmkIedZhHvVZqNMgP+1HhfPBoAn0wRGzaaMUf/1D9DLlNE+mk/d
	uXvisjk+QPtszbdANyc1qhmzRGKRsFQQglq70ryP5w0tXzdEhqyANfW9lBIZKxuIdZ8luIQTjhRWE
	Lef3cayEu0OnoKmN9TViRcNbOMYvSxPpQFOqYEu0NyCQ9b+Grre+FyxwZD9No87eVGsC2xKEOUR5e
	WpKKNgsJllqQsU6WcyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArn-0000000BGQq-1KkF;
	Tue, 04 Nov 2025 06:50:07 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArl-0000000BGPt-1VwP;
	Tue, 04 Nov 2025 06:50:06 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0z970xwrz9sSY;
	Tue,  4 Nov 2025 07:30:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8o3eFqSyCr4H; Tue,  4 Nov 2025 07:30:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0z966mmTz9sSV;
	Tue,  4 Nov 2025 07:30:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CA6B28B76C;
	Tue,  4 Nov 2025 07:30:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GLvucgCkTsyh; Tue,  4 Nov 2025 07:30:34 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C05318B763;
	Tue,  4 Nov 2025 07:30:32 +0100 (CET)
Message-ID: <fc087f38-2e14-41d1-8044-c054eb41ad19@csgroup.eu>
Date: Tue, 4 Nov 2025 07:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 08/12] uaccess: Provide put/get_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.609031602@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.609031602@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225005_565139_9B2E0E32 
X-CRM114-Status: GOOD (  15.81  )
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

CgpMZSAyNy8xMC8yMDI1IMOgIDA5OjQzLCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBQ
cm92aWRlIGNvbnZlbmlhbmNlIHdyYXBwZXJzIGFyb3VuZCBzY29wZWQgdXNlciBhY2Nlc3Mgc2lt
aWxpYXIgdG8KPiBwdXQvZ2V0X3VzZXIoKSwgd2hpY2ggcmVkdWNlIHRoZSB1c2FnZSBzaXRlcyB0
bzoKPiAKPiAgICAgICAgIGlmICghZ2V0X3VzZXJfaW5saW5lKHZhbCwgcHRyKSkKPiAgICAgICAg
IAkJcmV0dXJuIC1FRkFVTFQ7Cj4gCj4gU2hvdWxkIG9ubHkgYmUgdXNlZCBpZiB0aGVyZSBpcyBh
IGRlbW9uc3RyYWJsZSBwZXJmb3JtYW5jZSBiZW5lZml0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KCj4gLS0tCj4gVjU6IFJlbmFt
ZSB0byBpbmxpbmUKPiBWNDogUmVuYW1lIHRvIHNjb3BlZAo+IC0tLQo+ICAgaW5jbHVkZS9saW51
eC91YWNjZXNzLmggfCAgIDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiAKPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5o
Cj4gQEAgLTgyNSw2ICs4MjUsNTYgQEAgZm9yIChib29sIGRvbmUgPSBmYWxzZTsgIWRvbmU7IGRv
bmUgPSB0cgo+ICAgI2RlZmluZSBzY29wZWRfdXNlcl9yd19hY2Nlc3ModXB0ciwgZWxibCkJCQkJ
XAo+ICAgCXNjb3BlZF91c2VyX3J3X2FjY2Vzc19zaXplKHVwdHIsIHNpemVvZigqKHVwdHIpKSwg
ZWxibCkKPiAgIAo+ICsvKioKPiArICogZ2V0X3VzZXJfaW5saW5lIC0gUmVhZCB1c2VyIGRhdGEg
aW5saW5lZAo+ICsgKiBAdmFsOglUaGUgdmFyaWFibGUgdG8gc3RvcmUgdGhlIHZhbHVlIHJlYWQg
ZnJvbSB1c2VyIG1lbW9yeQo+ICsgKiBAdXNyYzoJUG9pbnRlciB0byB0aGUgdXNlciBzcGFjZSBt
ZW1vcnkgdG8gcmVhZCBmcm9tCj4gKyAqCj4gKyAqIFJldHVybjogMCBpZiBzdWNjZXNzZnVsLCAt
RUZBVUxUIHdoZW4gZmF1bHRlZAo+ICsgKgo+ICsgKiBJbmxpbmVkIHZhcmlhbnQgb2YgZ2V0X3Vz
ZXIoKS4gT25seSB1c2Ugd2hlbiB0aGVyZSBpcyBhIGRlbW9uc3RyYWJsZQo+ICsgKiBwZXJmb3Jt
YW5jZSByZWFzb24uCj4gKyAqLwo+ICsjZGVmaW5lIGdldF91c2VyX2lubGluZSh2YWwsIHVzcmMp
CQkJCVwKPiArKHsJCQkJCQkJCVwKPiArCV9fbGFiZWxfXyBlZmF1bHQ7CQkJCQlcCj4gKwl0eXBl
b2YodXNyYykgX3RtcHNyYyA9IHVzcmM7CQkJCVwKPiArCWludCBfcmV0ID0gMDsJCQkJCQlcCj4g
KwkJCQkJCQkJXAo+ICsJc2NvcGVkX3VzZXJfcmVhZF9hY2Nlc3MoX3RtcHNyYywgZWZhdWx0KQkJ
XAo+ICsJCXVuc2FmZV9nZXRfdXNlcih2YWwsIF90bXBzcmMsIGVmYXVsdCk7CQlcCj4gKwlpZiAo
MCkgewkJCQkJCVwKPiArCWVmYXVsdDoJCQkJCQkJXAo+ICsJCV9yZXQgPSAtRUZBVUxUOwkJCQkJ
XAo+ICsJfQkJCQkJCQlcCj4gKwlfcmV0OwkJCQkJCQlcCj4gK30pCj4gKwo+ICsvKioKPiArICog
cHV0X3VzZXJfaW5saW5lIC0gV3JpdGUgdG8gdXNlciBtZW1vcnkgaW5saW5lZAo+ICsgKiBAdmFs
OglUaGUgdmFsdWUgdG8gd3JpdGUKPiArICogQHVkc3Q6CVBvaW50ZXIgdG8gdGhlIHVzZXIgc3Bh
Y2UgbWVtb3J5IHRvIHdyaXRlIHRvCj4gKyAqCj4gKyAqIFJldHVybjogMCBpZiBzdWNjZXNzZnVs
LCAtRUZBVUxUIHdoZW4gZmF1bHRlZAo+ICsgKgo+ICsgKiBJbmxpbmVkIHZhcmlhbnQgb2YgcHV0
X3VzZXIoKS4gT25seSB1c2Ugd2hlbiB0aGVyZSBpcyBhIGRlbW9uc3RyYWJsZQo+ICsgKiBwZXJm
b3JtYW5jZSByZWFzb24uCj4gKyAqLwo+ICsjZGVmaW5lIHB1dF91c2VyX2lubGluZSh2YWwsIHVk
c3QpCQkJCVwKPiArKHsJCQkJCQkJCVwKPiArCV9fbGFiZWxfXyBlZmF1bHQ7CQkJCQlcCj4gKwl0
eXBlb2YodWRzdCkgX3RtcGRzdCA9IHVkc3Q7CQkJCVwKPiArCWludCBfcmV0ID0gMDsJCQkJCQlc
Cj4gKwkJCQkJCQkJXAo+ICsJc2NvcGVkX3VzZXJfd3JpdGVfYWNjZXNzKF90bXBkc3QsIGVmYXVs
dCkJCVwKPiArCQl1bnNhZmVfcHV0X3VzZXIodmFsLCBfdG1wZHN0LCBlZmF1bHQpOwkJXAo+ICsJ
aWYgKDApIHsJCQkJCQlcCj4gKwllZmF1bHQ6CQkJCQkJCVwKPiArCQlfcmV0ID0gLUVGQVVMVDsJ
CQkJCVwKPiArCX0JCQkJCQkJXAo+ICsJX3JldDsJCQkJCQkJXAo+ICt9KQo+ICsKPiAgICNpZmRl
ZiBDT05GSUdfSEFSREVORURfVVNFUkNPUFkKPiAgIHZvaWQgX19ub3JldHVybiB1c2VyY29weV9h
Ym9ydChjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpkZXRhaWwsCj4gICAJCQkgICAgICAg
Ym9vbCB0b191c2VyLCB1bnNpZ25lZCBsb25nIG9mZnNldCwKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
