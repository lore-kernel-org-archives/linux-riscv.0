Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B9FC71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgCMdhYs71Ng5LYgvFUEzYnm/h5yQiMoDHS52x5xClA=; b=5APW8ZglngHn/A
	8DYVWHfsE5nDytl11JO8sIxocFqQZif/YaKW96bjXCWMEdAwhVpWeZnpgveCfIEeFnaozS822HOPb
	VyVB0vZ4igSZyKyFcXSH+zasOVAZm4Ftijrria1BqrmpEcerruTm7VQiwsE7WBLtTb7EDpRg3/N3w
	6h2bUje1kNayFdzPf+Wm+FeFvQ0A+/ktnwkxW2LEq8Y8LCUTTqLr38ZwLymU0XSXeSjnY76FVFtOG
	651N03sXUsBRoIOaTkuN3Mj3JcjqnxLKMJCfnKR+hJjQNRSTnB8bu4NGi1kMmPrm6BdWZalhzeOwK
	fcc67Bvjepnxa3pJFDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzAG-0000000Ffoi-0Mdr;
	Fri, 13 Jun 2025 07:49:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyv-0000000Fcbf-0inR;
	Fri, 13 Jun 2025 07:37:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5C3D4451B;
	Fri, 13 Jun 2025 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeLleyfYulrm7/2JkDlmDKQ+W0qM+PQ6c1Xd/a6HciU=;
	b=PbUsx0iacezWvrE6A20Xyl+42FRd0/58MVH7JIf9elFbkDG3eJJOpPGahhO/fOwo06e7Gb
	v1In1Q/JhMx10WL0FVaMQLv8yM7qi6hl4gjHJBEBAadUl1AlxaXU/7UanahRe8NY82lPHT
	RIaBdWnX4B0AsjT9RnzYiuAtLL1q9vrkkVxg0R0brkQ9Wd4kPpfHCimyNG1cFEFCLp+eo+
	aZJ1YSyI68DwRMuA/gSfC4kdCpB5pK58wK19PUAQ6eYzrFh0n+serqJ33z6xPgAI6tCkyK
	jpHHzO+7YONhWsDauoIHYDC0ETlCR6ocSRSRHBCtmX/Qt7CSafBTpS9Q9PAfjQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:14 +0200
Subject: [PATCH bpf 5/7] bpf/powerpc64: use define for max regs count used
 for arguments
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-5-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003745_358190_12CF9420 
X-CRM114-Status: GOOD (  12.55  )
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

cG93ZXJwYyBhbGxvd3MgdXNpbmcgdXAgdG8gOCByZWdpc3RlcnMgdG8gcGFzcyBhcmd1bWVudHMg
YmV0d2VlbiBmdW5jdGlvbgpjYWxscy4gVGhpcyB2YWx1ZSBpcyBoYXJkY29kZWQgaW4gbXVsdGlw
bGUgcGxhY2VzLCB1c2UgYSBkZWZpbmUgZm9yIHRoaXMKdmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgotLS0KIGFyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgfCAxMCArKysrKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3Bvd2VycGMvbmV0
L2JwZl9qaXRfY29tcC5jCmluZGV4IGMwNjg0NzMzZTlkNmFjNzliNGNmNjUzYmYxYjlhZDQwZWIz
ZTFhY2EuLmQzMTM5MjBhNDJjMjMxMGM2YjVkZWFiNmQ4MmUxM2FmNDljOGVjYjEgMTAwNjQ0Ci0t
LSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC9wb3dlcnBjL25l
dC9icGZfaml0X2NvbXAuYwpAQCAtMjIsNiArMjIsOCBAQAogCiAjaW5jbHVkZSAiYnBmX2ppdC5o
IgogCisjZGVmaW5lIE1BWF9SRUdTX0ZPUl9BUkdTCTgKKwogLyogVGhlc2Ugb2Zmc2V0cyBhcmUg
ZnJvbSBicGYgcHJvZyBlbmQgYW5kIHN0YXkgdGhlIHNhbWUgYWNyb3NzIHByb2dzICovCiBzdGF0
aWMgaW50IGJwZl9qaXRfb29sX3N0dWIsIGJwZl9qaXRfbG9uZ19icmFuY2hfc3R1YjsKIApAQCAt
NjEzLDcgKzYxNSw3IEBAIHN0YXRpYyB2b2lkIGJwZl90cmFtcG9saW5lX3NhdmVfYXJncyh1MzIg
KmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgsIGluCiAJcGFyYW1fc2F2ZV9hcmVh
X29mZnNldCArPSBTVEFDS19GUkFNRV9NSU5fU0laRTsgLyogcGFyYW0gc2F2ZSBhcmVhIGlzIHBh
c3QgZnJhbWUgaGVhZGVyICovCiAKIAlmb3IgKGludCBpID0gMDsgaSA8IG5yX3JlZ3M7IGkrKykg
ewotCQlpZiAoaSA8IDgpIHsKKwkJaWYgKGkgPCBNQVhfUkVHU19GT1JfQVJHUykgewogCQkJRU1J
VChQUENfUkFXX1NUTChfUjMgKyBpLCBfUjEsIHJlZ3Nfb2ZmICsgaSAqIFNaTCkpOwogCQl9IGVs
c2UgewogCQkJRU1JVChQUENfUkFXX0xMKF9SMywgX1IxLCBwYXJhbV9zYXZlX2FyZWFfb2Zmc2V0
ICsgaSAqIFNaTCkpOwpAQCAtNjI2LDcgKzYyOCw3IEBAIHN0YXRpYyB2b2lkIGJwZl90cmFtcG9s
aW5lX3NhdmVfYXJncyh1MzIgKmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgsIGlu
CiBzdGF0aWMgdm9pZCBicGZfdHJhbXBvbGluZV9yZXN0b3JlX2FyZ3NfcmVncyh1MzIgKmltYWdl
LCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgsCiAJCQkJCSAgICAgaW50IG5yX3JlZ3MsIGlu
dCByZWdzX29mZikKIHsKLQlmb3IgKGludCBpID0gMDsgaSA8IG5yX3JlZ3MgJiYgaSA8IDg7IGkr
KykKKwlmb3IgKGludCBpID0gMDsgaSA8IG5yX3JlZ3MgJiYgaSA8IE1BWF9SRUdTX0ZPUl9BUkdT
OyBpKyspCiAJCUVNSVQoUFBDX1JBV19MTChfUjMgKyBpLCBfUjEsIHJlZ3Nfb2ZmICsgaSAqIFNa
TCkpOwogfQogCkBAIC03MjUsNyArNzI3LDkgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9i
cGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwgdm9pZCAqcndfaW0KIAkg
KgogCSAqIFJlc2VydmUgc3BhY2UgZm9yIGF0IGxlYXN0IDggcmVnaXN0ZXJzIGZvciBub3cuIFRo
aXMgY2FuIGJlIG9wdGltaXplZCBsYXRlci4KIAkgKi8KLQlicGZfZnJhbWVfc2l6ZSArPSAobnJf
cmVncyA+IDggPyBucl9yZWdzIDogOCkgKiBTWkw7CisJYnBmX2ZyYW1lX3NpemUgKz0KKwkJKG5y
X3JlZ3MgPiBNQVhfUkVHU19GT1JfQVJHUyA/IG5yX3JlZ3MgOiBNQVhfUkVHU19GT1JfQVJHUykg
KgorCQlTWkw7CiAKIAkvKiBSb29tIGZvciBzdHJ1Y3QgYnBmX3RyYW1wX3J1bl9jdHggKi8KIAly
dW5fY3R4X29mZiA9IGJwZl9mcmFtZV9zaXplOwoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
