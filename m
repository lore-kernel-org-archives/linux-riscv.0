Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5DDC71153
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgPZeRJQi0nrLGbE1UWTPwsIYAxZ87ozKoPaJqQ6anw=; b=sE3oviFPQ2WUjm
	QS9nAqZWIWnqP8jV7yt4DwUD2iv89mAYQS8/mD4xd/aQHcwHcjSLFDcxHxyfBPqtp2RBn2DzIQH0J
	RvewdRX9OEnpOWgR5XPt/eQ9O702Z22251BPLAMiM5GPl4bA8fkU8RCCY68S+nQmHuR5P7xhLzeNP
	gj2y6FUA4hmMLYmfVp53aYnSsMxtqNYa5OWGtD9x4aaaG2RIEyoIDpToa9rvSB/7QEVfbGEyNa6TO
	GXdf9injwERa0nWNiUjzPnFxTpvA/42TvHQ3AGWj4aRRUwmqMIbAwQDUPQ9dys3dp/wDySEU0XQWm
	TADlZ+AnWbuuyRzIzX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzAD-0000000Ffmf-1d0Q;
	Fri, 13 Jun 2025 07:49:25 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyj-0000000FcOd-08ac;
	Fri, 13 Jun 2025 07:37:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCC6B44506;
	Fri, 13 Jun 2025 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWrXudQ87v1aByOGhl67T4UU7KUM5mT6FEm5oZqhcLg=;
	b=cAFx4niwDDsyQFKGdmMcGf11CvIpcE6i60PNTLVL6XAEHr8QsvAnUtPgghd0BMq2R+ppDC
	FFai5U507SCN+pyoN6wuDoWlTMOjSSoP4TnpNxYiC+w0QbX1ZUzPQlhl134JonesXJvjFx
	OWDw6aSbLFZe7FDXXsBj2S+b7DQHMXAKYwDHAWLiIwLUr5ryMSKFEAsH//6LX4WvBNf7+B
	RTSk1TpiSwF389Xnh71A9SzYutIAanBG+/eJ2O3NS8i6MD2qG3qY8IPYR+kJcbwUdA/tQF
	SzpnBSDBVvIxVqUtGLlQS7VmjGVpj6a1tNP17AMJbhSHMVv02WVX06WVxtBTDQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:10 +0200
Subject: [PATCH bpf 1/7] bpf/x86: use define for max regs count used for
 arguments
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-1-5be9211768c3@bootlin.com>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
In-Reply-To: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: ebpf@linuxfoundation.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003733_227074_640B31DA 
X-CRM114-Status: GOOD (  12.91  )
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

eDg2IGFsbG93cyB1c2luZyB1cCB0byA2IHJlZ2lzdGVycyB0byBwYXNzIGFyZ3VtZW50cyBiZXR3
ZWVuIGZ1bmN0aW9uCmNhbGxzLiBUaGlzIHZhbHVlIGlzIGhhcmRjb2RlZCBpbiBtdWx0aXBsZSBw
bGFjZXMsIHVzZSBhIGRlZmluZSBmb3IgdGhpcwp2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Ci0tLQogYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwgMTQgKysrKysrKystLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29t
cC5jCmluZGV4IDE1NjcyY2I5MjZmYzE4MTdmOTdkMmNkMWM1NWQxNTc1ODAzZjY5NTguLjk2ODk4
MzRkZTFiYjFhOTBmZGMyODE1NmUwZTJhNTZhYzBmZjIwNzYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L25ldC9icGZfaml0X2NvbXAuYworKysgYi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKQEAg
LTYxLDYgKzYxLDggQEAgc3RhdGljIHU4ICplbWl0X2NvZGUodTggKnB0ciwgdTMyIGJ5dGVzLCB1
bnNpZ25lZCBpbnQgbGVuKQogI2RlZmluZSBFTUlUX0VOREJSX1BPSVNPTigpCiAjZW5kaWYKIAor
I2RlZmluZSBNQVhfUkVHU19GT1JfQVJHUwk2CisKIHN0YXRpYyBib29sIGlzX2ltbTgoaW50IHZh
bHVlKQogewogCXJldHVybiB2YWx1ZSA8PSAxMjcgJiYgdmFsdWUgPj0gLTEyODsKQEAgLTI3MTAs
MTAgKzI3MTIsMTAgQEAgc3RhdGljIGludCBnZXRfbnJfdXNlZF9yZWdzKGNvbnN0IHN0cnVjdCBi
dGZfZnVuY19tb2RlbCAqbSkKIAogCWZvciAoaSA9IDA7IGkgPCBtaW5fdChpbnQsIG0tPm5yX2Fy
Z3MsIE1BWF9CUEZfRlVOQ19BUkdTKTsgaSsrKSB7CiAJCWFyZ19yZWdzID0gKG0tPmFyZ19zaXpl
W2ldICsgNykgLyA4OwotCQlpZiAobnJfdXNlZF9yZWdzICsgYXJnX3JlZ3MgPD0gNikKKwkJaWYg
KG5yX3VzZWRfcmVncyArIGFyZ19yZWdzIDw9IE1BWF9SRUdTX0ZPUl9BUkdTKQogCQkJbnJfdXNl
ZF9yZWdzICs9IGFyZ19yZWdzOwogCi0JCWlmIChucl91c2VkX3JlZ3MgPj0gNikKKwkJaWYgKG5y
X3VzZWRfcmVncyA+PSBNQVhfUkVHU19GT1JfQVJHUykKIAkJCWJyZWFrOwogCX0KIApAQCAtMjc1
MSw3ICsyNzUzLDcgQEAgc3RhdGljIHZvaWQgc2F2ZV9hcmdzKGNvbnN0IHN0cnVjdCBidGZfZnVu
Y19tb2RlbCAqbSwgdTggKipwcm9nLAogCQkgKiB0aGUgYXJnMS01LGFyZzcgd2lsbCBiZSBwYXNz
ZWQgYnkgcmVncywgYW5kIGFyZzYgd2lsbAogCQkgKiBieSBzdGFjay4KIAkJICovCi0JCWlmIChu
cl9yZWdzICsgYXJnX3JlZ3MgPiA2KSB7CisJCWlmIChucl9yZWdzICsgYXJnX3JlZ3MgPiBNQVhf
UkVHU19GT1JfQVJHUykgewogCQkJLyogY29weSBmdW5jdGlvbiBhcmd1bWVudHMgZnJvbSBvcmln
aW4gc3RhY2sgZnJhbWUKIAkJCSAqIGludG8gY3VycmVudCBzdGFjayBmcmFtZS4KIAkJCSAqCkBA
IC0yODExLDcgKzI4MTMsNyBAQCBzdGF0aWMgdm9pZCByZXN0b3JlX3JlZ3MoY29uc3Qgc3RydWN0
IGJ0Zl9mdW5jX21vZGVsICptLCB1OCAqKnByb2csCiAJICovCiAJZm9yIChpID0gMDsgaSA8IG1p
bl90KGludCwgbS0+bnJfYXJncywgTUFYX0JQRl9GVU5DX0FSR1MpOyBpKyspIHsKIAkJYXJnX3Jl
Z3MgPSAobS0+YXJnX3NpemVbaV0gKyA3KSAvIDg7Ci0JCWlmIChucl9yZWdzICsgYXJnX3JlZ3Mg
PD0gNikgeworCQlpZiAobnJfcmVncyArIGFyZ19yZWdzIDw9IE1BWF9SRUdTX0ZPUl9BUkdTKSB7
CiAJCQlmb3IgKGogPSAwOyBqIDwgYXJnX3JlZ3M7IGorKykgewogCQkJCWVtaXRfbGR4KHByb2cs
IEJQRl9EVywKIAkJCQkJIG5yX3JlZ3MgPT0gNSA/IFg4Nl9SRUdfUjkgOiBCUEZfUkVHXzEgKyBu
cl9yZWdzLApAQCAtMjgyNCw3ICsyODI2LDcgQEAgc3RhdGljIHZvaWQgcmVzdG9yZV9yZWdzKGNv
bnN0IHN0cnVjdCBidGZfZnVuY19tb2RlbCAqbSwgdTggKipwcm9nLAogCQkJc3RhY2tfc2l6ZSAt
PSA4ICogYXJnX3JlZ3M7CiAJCX0KIAotCQlpZiAobnJfcmVncyA+PSA2KQorCQlpZiAobnJfcmVn
cyA+PSBNQVhfUkVHU19GT1JfQVJHUykKIAkJCWJyZWFrOwogCX0KIH0KQEAgLTMxNDksNyArMzE1
MSw3IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJw
Zl90cmFtcF9pbWFnZSAqaW0sIHZvaWQgKnJ3X2ltCiAJc3RhY2tfc2l6ZSArPSAoc2l6ZW9mKHN0
cnVjdCBicGZfdHJhbXBfcnVuX2N0eCkgKyA3KSAmIH4weDc7CiAJcnVuX2N0eF9vZmYgPSBzdGFj
a19zaXplOwogCi0JaWYgKG5yX3JlZ3MgPiA2ICYmIChmbGFncyAmIEJQRl9UUkFNUF9GX0NBTExf
T1JJRykpIHsKKwlpZiAobnJfcmVncyA+IE1BWF9SRUdTX0ZPUl9BUkdTICYmIChmbGFncyAmIEJQ
Rl9UUkFNUF9GX0NBTExfT1JJRykpIHsKIAkJLyogdGhlIHNwYWNlIHRoYXQgdXNlZCB0byBwYXNz
IGFyZ3VtZW50cyBvbi1zdGFjayAqLwogCQlzdGFja19zaXplICs9IChucl9yZWdzIC0gZ2V0X25y
X3VzZWRfcmVncyhtKSkgKiA4OwogCQkvKiBtYWtlIHN1cmUgdGhlIHN0YWNrIHBvaW50ZXIgaXMg
MTYtYnl0ZSBhbGlnbmVkIGlmIHdlCgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
