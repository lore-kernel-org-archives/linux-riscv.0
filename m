Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E610AC71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIQeAhh6ba8M1rRThKRaFgAKovstYqP8vytn+U/XlfI=; b=x7OZcVyOvk7E1w
	MaZrneIXKePBCkRr8jpujA34DIDMvcAf9DAdrBzyc8/Wi7GUtVMf+niJ3l8615vObACh9jv7uWuOA
	Stk2EdR+BtEl5Y5ViAKpLg4t6YgoGbzKdq4dFfjqqXUqrT+CaAqLhqwni7AhItvsXMfW0K43pe/En
	TPGvsqyo0ORbSynSlQs4jBgIcpuQIieFhvr5bVpiLXVt9blYwc+JnRiZY2K+nuxuzkMJ7WMXYxdj5
	SrcKCP/5EuI42jighiPYpu5FHvhaBzFvVnF5Gshum5g0DQMlVAtyMeHlMzDXfXsaMPP4cSbPCCS4W
	peejSL0cBeMUIUmEb+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzAD-0000000Ffmp-4B6n;
	Fri, 13 Jun 2025 07:49:25 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyl-0000000FcSL-3Zo0;
	Fri, 13 Jun 2025 07:37:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B4044504;
	Fri, 13 Jun 2025 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnHGDvZzrjKVg91VYE4fUbD95rOheLuWrUC1SCUNvho=;
	b=hjz+up3owp19jC1PLRYly2+dyctAQgkbxpKo1hqYq1HETrfATLqzq1SfruQePM9/7t5pLa
	0zTgV4Mt+jHNfjm41uNZRq3n71py93L9O+7KZhUPST/iQHmzyaGpfn7MSZ8OgZbCmciiE7
	GxM/QOW8RLxX86eh4eiqAagDX+1Yh47rRt5h5IfedzZXFQZhW4NYI7kCZJcYIItqps3uLX
	BZnHjMANkEjvI0mf6/VMLdo44AkZvBkC/epgTg/TqottCOybUirzxNFNynKpbkqAqLHbRi
	dv/ae9NbgtJ9xY7jGbo/ojuHvNaSLl6MZIZ/7dtwKDtTbHVzpUbjlkT5KrLJbQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:11 +0200
Subject: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when args
 location on stack is uncertain
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003736_042584_6ADCF531 
X-CRM114-Status: GOOD (  17.95  )
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
ZSB0byBwcmVwYXJlIHRoZSBicGYgY29udGV4dCwKYnV0IGFsc28gdG8gcHJlcGFyZSB0aGUgdGFy
Z2V0IGZ1bmN0aW9uIHN0YWNrIHdoZW4gaXQgaXMgaW4gY2hhcmdlIG9mCmNhbGxpbmcgaXQuIFRo
aXMgd29ya3Mgd2VsbCBmb3Igc2NhbGFyIHR5cGVzLCBidXQgaWYgdGhlIHZhbHVlIGlzIGEKc3Ry
dWN0LCB3ZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgdGhlIGV4YWN0IHN0cnVjdCBsb2NhdGlvbiwg
YXMgaXQgbWF5CmhhdmUgYmVlbiBwYWNrZWQgb3IgbWFudWFsbHkgYWxpZ25lZCB0byBhIGdyZWF0
ZXIgdmFsdWUuCgpQcmV2ZW50IHdyb25nIHJlYWRpbmdzIGJ5IHJlZnVzaW5nIHRyYW1wb2xpbmUg
YXR0YWNobWVudCBpZiB0aGUgdGFyZ2V0CmZ1bmN0aW9uIHJlY2VpdmVzIGEgc3RydWN0IG9uIHN0
YWNrLiBXaGlsZSBhdCBpdCwgbW92ZSB0aGUgbWF4IGJwZiBhcmdzCmNoZWNrIGluIHRoZSBuZXcg
ZnVuY3Rpb24uCgpGaXhlczogNDczZTMxNTBlMzBhICgiYnBmLCB4ODY6IGFsbG93IGZ1bmN0aW9u
IGFyZ3VtZW50cyB1cCB0byAxMiBmb3IgVFJBQ0lORyIpClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBM
b3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0t
LQogYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNo
L3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKaW5kZXggOTY4OTgzNGRlMWJiMWE5MGZkYzI4MTU2ZTBl
MmE1NmFjMGZmMjA3Ni4uMTIwZTA1YTk3ODY3OWMwNDY2MzFjYzk0ZDk0MjgwMGMzMDUxYWQwYSAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCisrKyBiL2FyY2gveDg2L25l
dC9icGZfaml0X2NvbXAuYwpAQCAtMzAwMSw2ICszMDAxLDI5IEBAIHN0YXRpYyBpbnQgaW52b2tl
X2JwZl9tb2RfcmV0KGNvbnN0IHN0cnVjdCBidGZfZnVuY19tb2RlbCAqbSwgdTggKipwcHJvZywK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCB2YWxpZGF0ZV9hcmdzKGNvbnN0IHN0cnVjdCBi
dGZfZnVuY19tb2RlbCAqbSkKK3sKKwlpbnQgaSwgYXJnX3JlZ3MgPSAwLCBucl9yZWdzID0gMDsK
KworCWZvciAoaSA9IDA7IGkgPCBtaW5fdChpbnQsIG0tPm5yX2FyZ3MsIE1BWF9CUEZfRlVOQ19B
UkdTKTsgaSsrKSB7CisJCWFyZ19yZWdzID0gKG0tPmFyZ19zaXplW2ldICsgNykgLyA4OworCisJ
CWlmIChucl9yZWdzICsgYXJnX3JlZ3MgPiBNQVhfUkVHU19GT1JfQVJHUyAmJgorCQkgICAgbS0+
YXJnX2ZsYWdzW2ldICYgQlRGX0ZNT0RFTF9TVFJVQ1RfQVJHKQorCQkJcmV0dXJuIC1FTk9UU1VQ
UDsKKwkJbnJfcmVncyArPSBhcmdfcmVnczsKKwl9CisKKwkvKiB4ODYtNjQgc3VwcG9ydHMgdXAg
dG8gTUFYX0JQRl9GVU5DX0FSR1MgYXJndW1lbnRzLiAxLTYKKwkgKiBhcmUgcGFzc2VkIHRocm91
Z2ggcmVncywgdGhlIHJlbWFpbnMgYXJlIHRocm91Z2ggc3RhY2suCisJICovCisJaWYgKG5yX3Jl
Z3MgPiBNQVhfQlBGX0ZVTkNfQVJHUykKKwkJcmV0dXJuIC1FTk9UU1VQUDsKKworCisJcmV0dXJu
IDA7Cit9CisKIC8qIG1vdiByYXgsIHF3b3JkIHB0ciBbcmJwIC0gcm91bmRlZF9zdGFja19kZXB0
aCAtIDhdICovCiAjZGVmaW5lIExPQURfVFJBTVBfVEFJTF9DQUxMX0NOVF9QVFIoc3RhY2spCVwK
IAlfX0xPQURfVENDX1BUUigtcm91bmRfdXAoc3RhY2ssIDgpIC0gOCkKQEAgLTMwODksMTggKzMx
MTIsMTkgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3Qg
YnBmX3RyYW1wX2ltYWdlICppbSwgdm9pZCAqcndfaW0KIAlXQVJOX09OX09OQ0UoKGZsYWdzICYg
QlBGX1RSQU1QX0ZfSU5ESVJFQ1QpICYmCiAJCSAgICAgKGZsYWdzICYgfihCUEZfVFJBTVBfRl9J
TkRJUkVDVCB8IEJQRl9UUkFNUF9GX1JFVF9GRU5UUllfUkVUKSkpOwogCisJLyogbWFrZSBzdXJl
IHRoYXQgYW55IGFyZ3VtZW50IGNhbiBiZSBsb2NhdGVkIGFuZCBwcm9jZXNzZWQgYnkgdGhlCisJ
ICogdHJhbXBvbGluZQorCSAqLworCXJldCA9IHZhbGlkYXRlX2FyZ3MobSk7CisJaWYgKHJldCkK
KwkJcmV0dXJuIHJldDsKKwogCS8qIGV4dHJhIHJlZ2lzdGVycyBmb3Igc3RydWN0IGFyZ3VtZW50
cyAqLwogCWZvciAoaSA9IDA7IGkgPCBtLT5ucl9hcmdzOyBpKyspIHsKIAkJaWYgKG0tPmFyZ19m
bGFnc1tpXSAmIEJURl9GTU9ERUxfU1RSVUNUX0FSRykKIAkJCW5yX3JlZ3MgKz0gKG0tPmFyZ19z
aXplW2ldICsgNykgLyA4IC0gMTsKIAl9CiAKLQkvKiB4ODYtNjQgc3VwcG9ydHMgdXAgdG8gTUFY
X0JQRl9GVU5DX0FSR1MgYXJndW1lbnRzLiAxLTYKLQkgKiBhcmUgcGFzc2VkIHRocm91Z2ggcmVn
cywgdGhlIHJlbWFpbnMgYXJlIHRocm91Z2ggc3RhY2suCi0JICovCi0JaWYgKG5yX3JlZ3MgPiBN
QVhfQlBGX0ZVTkNfQVJHUykKLQkJcmV0dXJuIC1FTk9UU1VQUDsKLQogCS8qIEdlbmVyYXRlZCB0
cmFtcG9saW5lIHN0YWNrIGxheW91dDoKIAkgKgogCSAqIFJCUCArIDggICAgICAgICBbIHJldHVy
biBhZGRyZXNzICBdCgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
