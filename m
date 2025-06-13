Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A90C71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YkYhENr+QH51RCYQIfq74NnW61kgnmCc9RCsk+byJE=; b=o/fuafw01+Xc1R
	0nulaerjrQI+NWnMX/nzX7Kt5n9zVBOR/TjsMJS5QtzTFof2NUUrrrjKgZEX9zBN0KmEFuUdrRF0b
	0Qdxt5F85jUCyPN7dHyLxQR3U6cpVOy0R60RkRrTQbwIHBQRGE7OtjN/LMS/+KJ8HAeMd/L/W0ihN
	jyvNSFcUELipzLU9ixIhJDRzw6UfkCKrGc6GA2tzRnd1SORoIAvEDYyjym6d9OA6JuUW6RWVoY46Z
	IfSH3FzAdD7QSrnzibEzDWr9Thh2uZ8GYfE8IyWbZVbvyfs140uv4qtwjcXqnYWfDsTMGG8fqCVFH
	oDST0KixFoawG9tP0h+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzkT-0000000FkuX-2ZaK;
	Fri, 13 Jun 2025 08:26:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzkS-0000000Fktu-057n;
	Fri, 13 Jun 2025 08:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oy7cnpuIfUbxnBIHzSxSzs3wF3pN160eEFEtn1XrHHA=; b=gmH0ajnNPGxVN/gWStIoA6WohU
	uG1HcSE6FPjGThP8edPn3aTX6bDbmukvB2lbdZnTLh9+WvBNAiR2zIwUhuEzB2d/Czlur+n7QPcUg
	mTHk1vWiYx5E6O8Md/cMFkSJ+lULYcnp/UBIhiL8X/h4sied1CrYtHzAyH67L0NLYojnEBVUqVdo7
	QNE4j7Wxb+2e/P0zuhrDreUfwVpdqaFwE9x6b62ZMZVHXBtsr3zCD8P6Jb9GVXoRJQkSloWC+b8y3
	3t3/CpdFW6jnFTVZNzP0TsC+V0bXYOgKjH6JN/R1vEpvdV5akMj2U2lr4EWxYsIgWOmLxF1uJX6t4
	vVTcs6/A==;
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzkP-00000002vRc-1Zgy;
	Fri, 13 Jun 2025 08:26:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B142A41C06;
	Fri, 13 Jun 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749803203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oy7cnpuIfUbxnBIHzSxSzs3wF3pN160eEFEtn1XrHHA=;
	b=BnJGbMk/e7fYDOccAaKbhkPl6Zkb+CJk54xIzM7oGJ/68LdgKmC814rIU32t6tdn2RLttv
	x15WZiOubSuud24F243NbAQNPG2k3Dui7U5bdWbzo6Lo7AjeJ+KSplTU5N9Z/cTjXj0Rr9
	AtxWE42xFJSR7fqyJtvD37GTtg2rovAwTR+VAfdN1C4ZXMlk7rhOwNdTxFQnBalxqPz9tm
	e/OD8ENjC+yzoBhzLvEBBNcwIj7ZN9YK2gi89xBilq+iVetQOvwYaFKA3l+J6erZ08hSMo
	zVQuK+p9cI9MOofvRUYJC5RnI8Wf/o3bDNy4BjM6rT5BKMfG/sqEM22GLR1tVQ==
Mime-Version: 1.0
Date: Fri, 13 Jun 2025 10:26:37 +0200
Message-Id: <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Menglong Dong"
 <imagedong@tencent.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, "Pu Lehui" <pulehui@huawei.com>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Hari
 Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Mykola
 Lysenko" <mykolal@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, <ebpf@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when
 args location on stack is uncertain
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com> <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com> <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfftdejhefhieelvefhgeffvddulefhfeegleegkefgffejgeffjeeigfdtveeinecuffhomhgrihhnpehlihhnuhigsggrshgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiihesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_092649_471088_7F449795 
X-CRM114-Status: GOOD (  15.19  )
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

SGkgUGV0ZXIsCgpPbiBGcmkgSnVuIDEzLCAyMDI1IGF0IDEwOjExIEFNIENFU1QsIFBldGVyIFpp
amxzdHJhIHdyb3RlOgo+IE9uIEZyaSwgSnVuIDEzLCAyMDI1IGF0IDA5OjM3OjExQU0gKzAyMDAs
IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSB3cm90ZToKPj4gV2hlbiB0aGUgdGFy
Z2V0IGZ1bmN0aW9uIHJlY2VpdmVzIG1vcmUgYXJndW1lbnRzIHRoYW4gYXZhaWxhYmxlCj4+IHJl
Z2lzdGVycywgdGhlIGFkZGl0aW9uYWwgYXJndW1lbnRzIGFyZSBwYXNzZWQgb24gc3RhY2ssIGFu
ZCBzbyB0aGUKPj4gZ2VuZXJhdGVkIHRyYW1wb2xpbmUgbmVlZHMgdG8gcmVhZCB0aG9zZSB0byBw
cmVwYXJlIHRoZSBicGYgY29udGV4dCwKPj4gYnV0IGFsc28gdG8gcHJlcGFyZSB0aGUgdGFyZ2V0
IGZ1bmN0aW9uIHN0YWNrIHdoZW4gaXQgaXMgaW4gY2hhcmdlIG9mCj4+IGNhbGxpbmcgaXQuIFRo
aXMgd29ya3Mgd2VsbCBmb3Igc2NhbGFyIHR5cGVzLCBidXQgaWYgdGhlIHZhbHVlIGlzIGEKPj4g
c3RydWN0LCB3ZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgdGhlIGV4YWN0IHN0cnVjdCBsb2NhdGlv
biwgYXMgaXQgbWF5Cj4+IGhhdmUgYmVlbiBwYWNrZWQgb3IgbWFudWFsbHkgYWxpZ25lZCB0byBh
IGdyZWF0ZXIgdmFsdWUuCj4KPiBodHRwczovL3JlZnNwZWNzLmxpbnV4YmFzZS5vcmcvZWxmL3g4
Nl82NC1hYmktMC45OS5wZGYKPgo+IEhhcyBmYWlybHkgY2xlYXIgcnVsZXMgb24gaG93IGFyZ3Vt
ZW50cyBhcmUgZW5jb2RlZC4gQnJvYWRseSBzcGVha2luZwo+IGZvciB0aGUga2VybmVsLCBpZiB0
aGUgc3RydWN0dXJlIGV4Y2VlZHMgMiByZWdpc3RlcnMgaW4gc2l6ZSwgaXQgaXMKPiBwYXNzZWQg
YXMgYSByZWZlcmVuY2UsIG90aGVyd2lzZSBpdCBpcyBwYXNzZWQgYXMgdHdvIHJlZ2lzdGVycy4K
Ck1heWJlIG15IGNvbW1pdCB3b3JkaW5nIGlzIG5vdCBwcmVjaXNlIGVub3VnaCwgYnV0IGluZGVl
ZCwgdGhlcmUncyBub3QKZG91YnQgYWJvdXQgd2hldGhlciB0aGUgc3RydWN0IHZhbHVlIGlzIHBh
c3NlZCBvbiB0aGUgc3RhY2sgb3IgdGhyb3VnaCBhCnJlZ2lzdGVyL2EgcGFpciBvZiByZWdpc3Rl
cnMuIFRoZSBkb3VidCBpcyByYXRoZXIgYWJvdXQgdGhlIHN0cnVjdCBsb2NhdGlvbgp3aGVuIGl0
IGlzIHBhc3NlZCBfYnkgdmFsdWVfIGFuZCBfb24gdGhlIHN0YWNrXzogdGhlIEFCSSBpbmRlZWQg
Y2xlYXJseQpzdGF0ZXMgdGhhdCAiU3RydWN0dXJlcyBhbmQgdW5pb25zIGFzc3VtZSB0aGUgYWxp
Z25tZW50IG9mIHRoZWlyIG1vc3QKc3RyaWN0bHkgYWxpZ25lZCBjb21wb25lbnQiIChwLjEzKSwg
YnV0IHRoaXMgcnVsZSBpcyAic2lsZW50bHkgYnJva2VuIiB3aGVuCmEgc3RydWN0IGhhcyBhbiBf
X2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBvciBhbmQgX19hdHRyaWJ1dGVfXygoYWxpZ25lZChYKSkp
LAphbmQgQUZBSUNUIHRoaXMgY2FzZSBjYW4gbm90IGJlIGRldGVjdGVkIGF0IHJ1bnRpbWUgd2l0
aCBjdXJyZW50IEJURiBpbmZvLgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
