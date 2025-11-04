Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B054CCFA00
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utxp2eZRiICAhGXbkf/kJW6y4UXhTFgumDSMz1gDPHE=; b=1t8mFwnpgmQPHp
	uxp6tbJygkVcp5SrA8ZvUwZlZHwmEd+tL0QtrhXtwJ7FAIBQ91NgLJ+4qAXQLWgHapYXL9IDVzue7
	U3xeBA3LS4wlWH4tIoZzHjLmpsSCfw2cLhmSTdmwqPYTM8dNSOIpU19Kjry0ou97C0jEgcnUfSpCK
	NkJNgw5CmSLKWZW9Ac3OKCxlQap8n4qo6Zpd+PkcIlPYXtwwpRqsXDdj7t3lEMLikFlcj+ow/CyDn
	B508xaysbvRlvciwIEZBBUEsoBLDcx2KJlT835FrjZEHPHZXqw0fU4Wo9bkZHbyHAw5ToGHxlQM+J
	vm4vqM8l5Vqg6ea996Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAs1-0000000BGZD-3zcY;
	Tue, 04 Nov 2025 06:50:21 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArx-0000000BGWe-3r8w;
	Tue, 04 Nov 2025 06:50:20 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0zGM0Zbtz9sSh;
	Tue,  4 Nov 2025 07:35:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4w3aEv5EITr; Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0zGL6PZFz9sSg;
	Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4D928B76C;
	Tue,  4 Nov 2025 07:35:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fs4pJqTtKSTf; Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C60B08B763;
	Tue,  4 Nov 2025 07:35:04 +0100 (CET)
Message-ID: <e0795f90-1030-4954-aefc-be137e9db49e@csgroup.eu>
Date: Tue, 4 Nov 2025 07:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083700.573016505@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225019_068600_794CF9F7 
X-CRM114-Status: GOOD (  13.26  )
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

CgpMZSAyNy8xMC8yMDI1IMOgIDA5OjQzLCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBU
aGlzIGlzIGEgZm9sbG93IHVwIG9uIHRoZSBWNCBmZWVkYmFjazoKPiAKPiAgICAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvMjAyNTEwMjIxMDI0MjcuNDAwNjk5Nzk2QGxpbnV0cm9uaXguZGUKPiAK
PiBDaGFuZ2VzIHZzLiBWNDoKPiAKPiAgICAtIFJlbmFtZSBnZXQvcHV0X3VzZXJfbWFza2VkKCkg
dG8gZ2V0L3B1dF91c2VyX2lubGluZSgpCj4gCj4gICAgLSBSZW1vdmUgdGhlIGZ1dGV4IGhlbHBl
cnMuIEtlZXAgdGhlIGlubGluZSBnZXQvcHV0IGZvciBub3cgYXMgaXQgbmVlZHMKPiAgICAgIG1v
cmUgdGVzdGluZyB3aGV0aGVyIHRoZXkgYXJlIHJlYWxseSB2YWx1YWJsZS4KPiAKPiAgICAtIFBp
Y2tlZCB1cCB0YWdzCj4gCj4gVGhlIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xOC1yYzEgYW5kIGFs
c28gYXZhaWxhYmxlIGZyb20gZ2l0Ogo+IAo+ICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RnbHgvZGV2ZWwuZ2l0IHVhY2Nlc3Mvc2NvcGVkCj4gCgpt
b3ZlX2FkZHJfdG9fdXNlcigpIGluIG5ldC9zb2NrZXQuYyBhbmQgcHV0X2Ntc2coKSBpbiBuZXQv
Y29yZS9zY20uYyAKc2hvdWxkIGJlIGNvbnZlcnRlZCBhcyB3ZWxsCgpDaHJpc3RvcGhlCgo+IFRo
YW5rcywKPiAKPiAJdGdseAo+IC0tLQo+IFRob21hcyBHbGVpeG5lciAoMTIpOgo+ICAgICAgICBB
Uk06IHVhY2Nlc3M6IEltcGxlbWVudCBtaXNzaW5nIF9fZ2V0X3VzZXJfYXNtX2R3b3JkKCkKPiAg
ICAgICAgdWFjY2VzczogUHJvdmlkZSBBU00gR09UTyBzYWZlIHdyYXBwZXJzIGZvciB1bnNhZmVf
Kl91c2VyKCkKPiAgICAgICAgeDg2L3VhY2Nlc3M6IFVzZSB1bnNhZmUgd3JhcHBlcnMgZm9yIEFT
TSBHT1RPCj4gICAgICAgIHBvd2VycGMvdWFjY2VzczogVXNlIHVuc2FmZSB3cmFwcGVycyBmb3Ig
QVNNIEdPVE8KPiAgICAgICAgcmlzY3YvdWFjY2VzczogVXNlIHVuc2FmZSB3cmFwcGVycyBmb3Ig
QVNNIEdPVE8KPiAgICAgICAgczM5MC91YWNjZXNzOiBVc2UgdW5zYWZlIHdyYXBwZXJzIGZvciBB
U00gR09UTwo+ICAgICAgICB1YWNjZXNzOiBQcm92aWRlIHNjb3BlZCB1c2VyIGFjY2VzcyByZWdp
b25zCj4gICAgICAgIHVhY2Nlc3M6IFByb3ZpZGUgcHV0L2dldF91c2VyX2lubGluZSgpCj4gICAg
ICAgIGNvY2NpbmVsbGU6IG1pc2M6IEFkZCBzY29wZWRfbWFza2VkXyRNT0RFX2FjY2VzcygpIGNo
ZWNrZXIgc2NyaXB0Cj4gICAgICAgIGZ1dGV4OiBDb252ZXJ0IHRvIGdldC9wdXRfdXNlcl9pbmxp
bmUoKQo+ICAgICAgICB4ODYvZnV0ZXg6IENvbnZlcnQgdG8gc2NvcGVkIHVzZXIgYWNjZXNzCj4g
ICAgICAgIHNlbGVjdDogQ29udmVydCB0byBzY29wZWQgdXNlciBhY2Nlc3MKPiAKPiAgIGFyY2gv
YXJtL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICAgICAgICAgIHwgICAyNiArKwo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICAgICAgfCAgICA4Cj4gICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICAgICAgICB8ICAgIDgKPiAgIGFyY2gv
czM5MC9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgICAgICAgIHwgICAgNAo+ICAgYXJjaC94
ODYvaW5jbHVkZS9hc20vZnV0ZXguaCAgICAgICAgICAgICAgICAgfCAgIDc1ICsrLS0tLQo+ICAg
YXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICAgICAgICAgICAgfCAgIDEyIC0KPiAg
IGZzL3NlbGVjdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMiAtCj4g
ICBpbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaCAgICAgICAgICAgICAgICAgICAgICB8ICAzMTQgKysr
KysrKysrKysrKysrKysrKysrKysrKystCj4gICBrZXJuZWwvZnV0ZXgvY29yZS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDQKPiAgIGtlcm5lbC9mdXRleC9mdXRleC5oICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA1OCAtLS0tCj4gICBzY3JpcHRzL2NvY2NpbmVsbGUvbWlzYy9z
Y29wZWRfdWFjY2Vzcy5jb2NjaSB8ICAxMDggKysrKysrKysrCj4gICAxMSBmaWxlcyBjaGFuZ2Vk
LCA1MDEgaW5zZXJ0aW9ucygrKSwgMTI4IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
