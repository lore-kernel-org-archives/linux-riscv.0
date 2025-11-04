Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B6ECCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTQbQ6TlctMkq7zDchI4CbuJWPAGFgB42DpaeLm8vFw=; b=q7nGZJLJ3VwLLy
	hAb4QD6c+BiFUOydNQNQlATmHbZ4Rbxnt3/YdMHxejx/A1YrOkOW01xBd+utulwZqYJWJEM64gzys
	+H6kq9UgjMHKkXJcg9Vqvol6lEWam2isGsunmxeWWW6DznEFVbJjzNWdL6uVvQkbqLuRDPcxCqmpX
	HqvtMmBqlECJUHIL9omR5UfZyL7zh3+v8burSBZOKVO2JV2T/CAeFXwQLCNSsHok8I/5Zat+cQTve
	+/yIupv0FuxoZ5hVs3AQopd5x438X+RB5LgoNpfAKho//U4FxyvoCxSWec40sJ9srvIpfMJYU0VAF
	PJyf5r+JnXBc+J/fyIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArv-0000000BGVZ-1Ryd;
	Tue, 04 Nov 2025 06:50:15 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArt-0000000BGSv-0FB7;
	Tue, 04 Nov 2025 06:50:14 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0zBs3R9Fz9sSf;
	Tue,  4 Nov 2025 07:32:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sv0jWyS-5i0P; Tue,  4 Nov 2025 07:32:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0zBs2ZWMz9sSd;
	Tue,  4 Nov 2025 07:32:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B0AF8B76C;
	Tue,  4 Nov 2025 07:32:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZVg7BC0yuWfv; Tue,  4 Nov 2025 07:32:05 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 62AEA8B763;
	Tue,  4 Nov 2025 07:32:03 +0100 (CET)
Message-ID: <db0e0201-0bb5-4096-ad87-f2cd109d07dc@csgroup.eu>
Date: Tue, 4 Nov 2025 07:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 12/12] select: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
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
 <andrealmeid@igalia.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.862419776@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.862419776@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225013_272155_6C111148 
X-CRM114-Status: GOOD (  14.53  )
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

CgpMZSAyNy8xMC8yMDI1IMOgIDA5OjQ0LCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBG
cm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiAKPiBSZXBsYWNlIHRo
ZSBvcGVuIGNvZGVkIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIHNjb3BlZCB1c2VyIGFjY2VzcyBn
dWFyZC4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogQWxleGFuZGVy
IFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgo+IENjOiBDaHJpc3RpYW4gQnJhdW5lciA8
YnJhdW5lckBrZXJuZWwub3JnPgo+IENjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IENjOiBs
aW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwoKUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KCj4gLS0tCj4gVjQ6IFVzZSByZWFkIGd1
YXJkIC0gUGV0ZXJ6Cj4gICAgICBSZW5hbWUgb25jZSBtb3JlCj4gVjM6IEFkb3B0IHRvIHNjb3Bl
IGNoYW5nZXMKPiAtLS0KPiAgIGZzL3NlbGVjdC5jIHwgICAxMiArKysrLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gLS0tCj4gLS0t
IGEvZnMvc2VsZWN0LmMKPiArKysgYi9mcy9zZWxlY3QuYwo+IEBAIC03NzYsMTcgKzc3NiwxMyBA
QCBzdGF0aWMgaW5saW5lIGludCBnZXRfc2lnc2V0X2FyZ3BhY2soc3RyCj4gICB7Cj4gICAJLy8g
dGhlIHBhdGggaXMgaG90IGVub3VnaCBmb3Igb3ZlcmhlYWQgb2YgY29weV9mcm9tX3VzZXIoKSB0
byBtYXR0ZXIKPiAgIAlpZiAoZnJvbSkgewo+IC0JCWlmIChjYW5fZG9fbWFza2VkX3VzZXJfYWNj
ZXNzKCkpCj4gLQkJCWZyb20gPSBtYXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4oZnJvbSk7Cj4gLQkJ
ZWxzZSBpZiAoIXVzZXJfcmVhZF9hY2Nlc3NfYmVnaW4oZnJvbSwgc2l6ZW9mKCpmcm9tKSkpCj4g
LQkJCXJldHVybiAtRUZBVUxUOwo+IC0JCXVuc2FmZV9nZXRfdXNlcih0by0+cCwgJmZyb20tPnAs
IEVmYXVsdCk7Cj4gLQkJdW5zYWZlX2dldF91c2VyKHRvLT5zaXplLCAmZnJvbS0+c2l6ZSwgRWZh
dWx0KTsKPiAtCQl1c2VyX3JlYWRfYWNjZXNzX2VuZCgpOwo+ICsJCXNjb3BlZF91c2VyX3JlYWRf
YWNjZXNzKGZyb20sIEVmYXVsdCkgewo+ICsJCQl1bnNhZmVfZ2V0X3VzZXIodG8tPnAsICZmcm9t
LT5wLCBFZmF1bHQpOwo+ICsJCQl1bnNhZmVfZ2V0X3VzZXIodG8tPnNpemUsICZmcm9tLT5zaXpl
LCBFZmF1bHQpOwo+ICsJCX0KPiAgIAl9Cj4gICAJcmV0dXJuIDA7Cj4gICBFZmF1bHQ6Cj4gLQl1
c2VyX3JlYWRfYWNjZXNzX2VuZCgpOwo+ICAgCXJldHVybiAtRUZBVUxUOwo+ICAgfQo+ICAgCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
