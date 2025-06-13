Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD12C71155
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDiC3j2IQkwtbaxKOPSgTfHIC7lf0uOjNXvgD+cdWXw=; b=OAXYVGGVLf+lVc
	tXkgCpTJdn34TLZLfb576Pf/oQCuim10ImNrmwd2se/QBbDgSebpkBhiEJI0BA/3JQMB9eVVsV2bz
	kd720pyzmtf35P3cPjYXnYa0NWU+8WduGZxH8j11oBDc8iL0nuXpBXXn4EvuB8B/I/k32EZRojiw8
	S7CzWnjsQN0CBwXjxaGn/46dJHBmoINLZXCefA7ZBGRb7XyD/U5Z6Icac6ARLP3mJ9XxKoF5lpbfd
	LC32CL1aN4N2AfZQDoTarfp2DF4yuLwgvV9s1S+QJu2yIdzLpwAit+hSvsodI0weQ3MZ8AYjROosG
	sWDv+ierSfSmf4LqoiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzAG-0000000FfpH-35Q2;
	Fri, 13 Jun 2025 07:49:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyy-0000000Fce8-1uPU;
	Fri, 13 Jun 2025 07:37:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEC8444521;
	Fri, 13 Jun 2025 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKtkaErlksV8Vai/mKr2KqKy0M00KlPerZSqFi6ERyQ=;
	b=dwebunOKGliUOBu0dNuEzYlEobxLghh6N2AjWZRVOv7pySHnZ4d90y3u/LKtoLu/V3/LfP
	2KiFKa2Y0NEQldNzq3K71KBjpIjMQI1puCXBRaFQo7HCyQkh2gTujOhu67NHiEeLBb1DF1
	BPYsOl4mfk7z7+G5sHARa5gXMvyImzjZDetFx+lZny8idRUIrudoAxb3Y1NTVEefG4NQCz
	6ZbGLS+MmTGkdgFGSJY9hMfB0KAavEySPzPqdMYT8Gr0dOjwNLA5KFoIs1ibbeMRPL3EdA
	HQg1LeNMpm2RaUfwjAMZ1ai3nQJE4grrAFbz0KzRPMp0sg9141N7Zje4pN6WNg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:15 +0200
Subject: [PATCH bpf 6/7] bpf/powerpc64: prevent trampoline attachment when
 args location on stack is uncertain
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-6-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003748_644044_685466B2 
X-CRM114-Status: GOOD (  16.73  )
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

V2hlbiB0aGUgdGFyZ2V0IGZ1bmN0aW9uIHJlY2VpdmVzIG1vcmUgYXJndW1lbnRzIHRoYW4gYXZh
aWxhYmxlCnJlZ2lzdGVycywgdGhlIGFkZGl0aW9uYWwgYXJndW1lbnRzIGFyZSBwYXNzZWQgb24g
c3RhY2ssIGFuZCBzbyB0aGUKZ2VuZXJhdGVkIHRyYW1wb2xpbmUgbmVlZHMgdG8gcmVhZCB0aG9z
ZSB0byBwcmVwYXJlIHRoZSBicGYgY29udGV4dCwgYnV0CmFsc28gdG8gcHJlcGFyZSB0aGUgdGFy
Z2V0IGZ1bmN0aW9uIHN0YWNrIHdoZW4gaXQgaXMgaW4gY2hhcmdlIG9mCmNhbGxpbmcgaXQuIFRo
aXMgd29ya3Mgd2VsbCBmb3Igc2NhbGFyIHR5cGVzLCBidXQgaWYgdGhlIHZhbHVlIGlzIGEKc3Ry
dWN0LCB3ZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgdGhlIGV4YWN0IHN0cnVjdCBsb2NhdGlvbiwg
YXMgaXQgbWF5CmhhdmUgYmVlbiBwYWNrZWQgb3IgbWFudWFsbHkgYWxpZ25lZCB0byBhIGdyZWF0
ZXIgdmFsdWUuCgpQcmV2ZW50IHdyb25nIHJlYWRpbmdzIGJ5IHJlZnVzaW5nIHRyYW1wb2xpbmUg
YXR0YWNobWVudCBpZiB0aGUgdGFyZ2V0CmZ1bmN0aW9uIHJlY2VpdmVzIGEgc3RydWN0IG9uIHN0
YWNrLiBXaGlsZSBhdCBpdCwgbW92ZSB0aGUgbWF4IGJwZiBhcmdzCmNoZWNrIGluIHRoZSBuZXcg
ZnVuY3Rpb24uCgpGaXhlczogZDI0M2I2MmI3YmQzICgicG93ZXJwYzY0L2JwZjogQWRkIHN1cHBv
cnQgZm9yIGJwZiB0cmFtcG9saW5lcyIpClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAo
ZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXAuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3Bvd2VycGMv
bmV0L2JwZl9qaXRfY29tcC5jCmluZGV4IGQzMTM5MjBhNDJjMjMxMGM2YjVkZWFiNmQ4MmUxM2Fm
NDljOGVjYjEuLjk3ZjUyMDlhMjVhZGI0ODY1ZTNjYzM0MjI5MmM4ZjE1YjE5ODUxNTYgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC9wb3dlcnBj
L25ldC9icGZfaml0X2NvbXAuYwpAQCAtNjQ4LDYgKzY0OCwyNCBAQCBzdGF0aWMgdm9pZCBicGZf
dHJhbXBvbGluZV9yZXN0b3JlX2FyZ3Nfc3RhY2sodTMyICppbWFnZSwgc3RydWN0IGNvZGVnZW5f
Y29udGV4dAogCWJwZl90cmFtcG9saW5lX3Jlc3RvcmVfYXJnc19yZWdzKGltYWdlLCBjdHgsIG5y
X3JlZ3MsIHJlZ3Nfb2ZmKTsKIH0KIAorc3RhdGljIGludCB2YWxpZGF0ZV9hcmdzKGNvbnN0IHN0
cnVjdCBidGZfZnVuY19tb2RlbCAqbSkKK3sKKwlpbnQgbnJfcmVncyA9IG0tPm5yX2FyZ3MsIGk7
CisKKwlmb3IgKGkgPSAwOyBpIDwgbS0+bnJfYXJnczsgaSsrKSB7CisJCWlmIChtLT5hcmdfc2l6
ZVtpXSA+IFNaTCkKKwkJCW5yX3JlZ3MgKz0gcm91bmRfdXAobS0+YXJnX3NpemVbaV0sIFNaTCkg
LyBTWkwgLSAxOworCQlpZiAoaSA+IE1BWF9SRUdTX0ZPUl9BUkdTICYmCisJCSAgICBtLT5hcmdf
ZmxhZ3NbaV0gJiBCVEZfRk1PREVMX1NUUlVDVF9BUkcpCisJCQlyZXR1cm4gLUVOT1RTVVBQOwor
CX0KKworCWlmIChucl9yZWdzID4gTUFYX0JQRl9GVU5DX0FSR1MpCisJCXJldHVybiAtRU5PVFNV
UFA7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJh
bXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwgdm9pZCAqcndfaW1hZ2UsCiAJCQkJ
CSB2b2lkICpyd19pbWFnZV9lbmQsIHZvaWQgKnJvX2ltYWdlLAogCQkJCQkgY29uc3Qgc3RydWN0
IGJ0Zl9mdW5jX21vZGVsICptLCB1MzIgZmxhZ3MsCkBAIC02NjgsMTUgKzY4NiwxOSBAQCBzdGF0
aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJhbXBfaW1h
Z2UgKmltLCB2b2lkICpyd19pbQogCWlmIChJU19FTkFCTEVEKENPTkZJR19QUEMzMikpCiAJCXJl
dHVybiAtRU9QTk9UU1VQUDsKIAorCS8qIG1ha2Ugc3VyZSB0aGF0IGFueSBhcmd1bWVudCBjYW4g
YmUgbG9jYXRlZCBhbmQgcHJvY2Vzc2VkIGJ5IHRoZQorCSAqIHRyYW1wb2xpbmUKKwkgKi8KKwly
ZXQgPSB2YWxpZGF0ZV9hcmdzKG0pOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlucl9y
ZWdzID0gbS0+bnJfYXJnczsKIAkvKiBFeHRyYSByZWdpc3RlcnMgZm9yIHN0cnVjdCBhcmd1bWVu
dHMgKi8KIAlmb3IgKGkgPSAwOyBpIDwgbS0+bnJfYXJnczsgaSsrKQogCQlpZiAobS0+YXJnX3Np
emVbaV0gPiBTWkwpCiAJCQlucl9yZWdzICs9IHJvdW5kX3VwKG0tPmFyZ19zaXplW2ldLCBTWkwp
IC8gU1pMIC0gMTsKIAotCWlmIChucl9yZWdzID4gTUFYX0JQRl9GVU5DX0FSR1MpCi0JCXJldHVy
biAtRU9QTk9UU1VQUDsKLQogCWN0eCA9ICZjb2RlZ2VuX2N0eDsKIAltZW1zZXQoY3R4LCAwLCBz
aXplb2YoKmN0eCkpOwogCgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
