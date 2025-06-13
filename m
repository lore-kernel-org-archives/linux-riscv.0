Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07808C71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkF4i+1+868m3TzfHyG0Qga+9fbqxmTH8T/NNnalq2Q=; b=gAG0NyJ4IxxJpz
	bauqcTg1+RdJ+juOMi/mjkd1JaoL1emm6g6MH203aNfCGf3H7Sw9AcBpOxBHJHHQCJVE3WoDbyzWp
	p2FsLg5+PHDa2dFPtD+Z4AVpXH4XCp3MEy/p3+/oHRb4uIu9nL2+SaoPvmoqu9gir2lRR3pmTldUn
	ngsh6XV0+2T5ME7/+ddD2RiuhvTXuoPYMhyEUeLm34rsCont9nocWmR2+F8MeANa2QGXbth7Wcbml
	9KlN1A9nelccZk/Htgd81Lf6R9Tam3pXWMMUBbbeBXQ5pmogdWo6s18egN9uqERP18HjVCMWg2W/0
	2bumQKZaexVi9ICm0yDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzAE-0000000FfnE-2iqi;
	Fri, 13 Jun 2025 07:49:26 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyo-0000000FcVM-3wpt;
	Fri, 13 Jun 2025 07:37:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4737044515;
	Fri, 13 Jun 2025 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLtF15o+Ex4Ed3vWHcKorxdQYUZ/IggFlAe1+Bvb1bQ=;
	b=fYTs9JbtnbQa0LG78Ip8By4e8kxfeBYaAkBZGd4wF2a4/6esqJ7MVj2PbEj1VGMwdzrKHn
	7XSJaqODDAiuBQDbcyOJ7ITyuZE+Zts95dmJNmUCOudt2D1o/fCHsHwfW7ERCyNo9O1egn
	/LwdsL+26wj2ktOlxMEyz4YwoQPhxWG3YI5wtVxeYPnSz7g19gMYyM6asNdvVsnq2m9Nud
	WCK4DjKtHb+62+sqH6m5ov7tSnrcJSJbY8GgNj68E54TrE24BXl7RVaYv4PAxT+EIQDmaB
	TM9B8Eacu+Xd3qzw1RWvru499qrPa8XL5GB3APEztX4F4YDKWoL4Z2Ne93qTdQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:12 +0200
Subject: [PATCH bpf 3/7] bpf/riscv: prevent trampoline attachment when args
 location on stack is uncertain
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-3-5be9211768c3@bootlin.com>
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
X-CRM114-CacheID: sfid-20250613_003739_108929_2BD5C40B 
X-CRM114-Status: GOOD (  16.38  )
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
ZnVuY3Rpb24uCgpGaXhlczogNjgwMWIwYWVmNzlkICgicmlzY3YsIGJwZjogQWRkIDEyLWFyZ3Vt
ZW50IHN1cHBvcnQgZm9yIFJWNjQgYnBmIHRyYW1wb2xpbmUiKQpTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29t
PgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggMTBlMDFmZjA2MzEyZDlmMWU2ZTIx
M2JiMDY5YzZlYTc0OWVhOWFmMi4uZWEzYTFjM2FmNmJjMTI5MDU3YzE2YTQwNzBjMzNkYmYwMGU2
YzYxMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCkBAIC0xMDA1LDYgKzEwMDUsMjQgQEAgc3Rh
dGljIGludCBpbnZva2VfYnBmX3Byb2coc3RydWN0IGJwZl90cmFtcF9saW5rICpsLCBpbnQgYXJn
c19vZmYsIGludCByZXR2YWxfb2YKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IHZhbGlk
YXRlX2FyZ3MoY29uc3Qgc3RydWN0IGJ0Zl9mdW5jX21vZGVsICptKQoreworCWludCBpLCBucl9h
cmdfc2xvdHMsIG5yX3JlZ3MgPSAwOworCisJaWYgKG0tPm5yX2FyZ3MgPiBNQVhfQlBGX0ZVTkNf
QVJHUykKKwkJcmV0dXJuIC1FTk9UU1VQUDsKKworCWZvciAoaSA9IDA7IGkgPCBtLT5ucl9hcmdz
OyBpKyspIHsKKwkJbnJfYXJnX3Nsb3RzID0gcm91bmRfdXAobS0+YXJnX3NpemVbaV0sIDgpIC8g
ODsKKwkJaWYgKG5yX3JlZ3MgKyBucl9hcmdfc2xvdHMgPiBSVl9NQVhfUkVHX0FSR1MgJiYKKwkJ
ICAgIG0tPmFyZ19mbGFnc1tpXSAmIEJURl9GTU9ERUxfU1RSVUNUX0FSRykKKwkJCXJldHVybiAt
RU5PVFNVUFA7CisJCW5yX3JlZ3MgKz0gbnJfYXJnX3Nsb3RzOworCX0KKworCXJldHVybiAwOwor
fQorCiBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZf
dHJhbXBfaW1hZ2UgKmltLAogCQkJCQkgY29uc3Qgc3RydWN0IGJ0Zl9mdW5jX21vZGVsICptLAog
CQkJCQkgc3RydWN0IGJwZl90cmFtcF9saW5rcyAqdGxpbmtzLApAQCAtMTA2OSw4ICsxMDg3LDEy
IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90
cmFtcF9pbWFnZSAqaW0sCiAJaWYgKGZsYWdzICYgKEJQRl9UUkFNUF9GX09SSUdfU1RBQ0sgfCBC
UEZfVFJBTVBfRl9TSEFSRV9JUE1PRElGWSkpCiAJCXJldHVybiAtRU5PVFNVUFA7CiAKLQlpZiAo
bS0+bnJfYXJncyA+IE1BWF9CUEZfRlVOQ19BUkdTKQotCQlyZXR1cm4gLUVOT1RTVVBQOworCS8q
IG1ha2Ugc3VyZSB0aGF0IGFueSBhcmd1bWVudCBjYW4gYmUgbG9jYXRlZCBhbmQgcHJvY2Vzc2Vk
IGJ5IHRoZQorCSAqIHRyYW1wb2xpbmUKKwkgKi8KKwlyZXQgPSB2YWxpZGF0ZV9hcmdzKG0pOwor
CWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKIAlmb3IgKGkgPSAwOyBpIDwgbS0+bnJfYXJnczsg
aSsrKQogCQlucl9hcmdfc2xvdHMgKz0gcm91bmRfdXAobS0+YXJnX3NpemVbaV0sIDgpIC8gODsK
Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
