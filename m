Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E54C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MexpOcHr2jkvjK5zFn+KBYihLyYtnRp2omWb+17maiI=; b=PnRngi+Okpgb1Z
	+Rlg3PJsFpM5UTaXcXCmUz8QLxwWSDsdCWzBKOu2erxOyHHf9QErf7vDIml1vb1k9qz79rAY1XXnQ
	rQij+N+u7iJuQgU3hqnyjWmRs/stePkrEcsZQVRGA+YZ8NNip+t8CW1tIJaCV4Gwc5RC6Rw+9f1zZ
	YKY7PGFma4cXxmlivwyYPOv2C9nbcfy4HtqlfDBk12apLqVt0D7oBLyTi4NDBgqKeVKXx0KigdKRh
	+HL0vxi/v4M1ub9UPSrrB78ep6Md1BhW8oOG8KxtYHAHXqO9fdlqH75WBEpsAe9dPaWxwzJ6Zi85+
	XqYZfCWd4jyelCToOUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVWMW-00H0jQ-2h;
	Mon, 14 Aug 2023 12:07:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVWMU-00H0j2-1j
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 12:07:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EB876300B;
	Mon, 14 Aug 2023 12:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298C8C433CA;
	Mon, 14 Aug 2023 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692014873;
	bh=fCU0Jjxw0M+i9kUlQNkjYu/ErKYo4MA2He7FJSPpqYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B63DZ5lx/U5egdadm4tGxK9T8HhOgMQBi1/DFIO8KuO+MDbqozCxIkaNWIfDFdjfT
	 JJj2Se6ppUgXLTrC9/Og/VPTQR56nIj7nBc5nq2/9HhLdtXQRLYakQwAamteBLnfqC
	 3nLLDCKcjibHB6XplA6/jCUhieiZ+d94DR3utDMAAqb5TdPrheOElEwPCTfW2qQiTk
	 b1Jc2+tIprXjOY3VeYZorVmc+eNPJw45XN199hocTM50WgXvTP0B0UPcms/R1xeyjK
	 WdxsGVyg/SRTrd+juHW3YMSlg9C0R4PcbMY1O1T5HEm74frFR+5HvWxbX2FDHMNzsx
	 f8hlb9eECWdpA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>, charlie@rivosinc.com
Subject: Re: [PATCH] riscv: correct riscv_insn_is_c_jr() and
 riscv_insn_is_c_jalr()
In-Reply-To: <20230731183925.152145-1-namcaov@gmail.com>
References: <20230731183925.152145-1-namcaov@gmail.com>
Date: Mon, 14 Aug 2023 14:07:50 +0200
Message-ID: <87o7j9g73d.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_050754_659773_6CE5CED5 
X-CRM114-Status: GOOD (  14.34  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhlIGluc3RydWN0aW9ucyBj
LmpyIGFuZCBjLmphbHIgbXVzdCBoYXZlIHJzMSAhPSAwLCBidXQKPiByaXNjdl9pbnNuX2lzX2Nf
anIoKSBhbmQgcmlzY3ZfaW5zbl9pc19jX2phbHIoKSBkbyBub3QgY2hlY2sgZm9yIHRoaXMuIFNv
LAo+IHJpc2N2X2luc25faXNfY19qcigpIGNhbiBtYXRjaCBhIHJlc2VydmVkIGVuY29kaW5nLCB3
aGlsZQo+IHJpc2N2X2luc25faXNfY19qYWxyKCkgY2FuIG1hdGNoIHRoZSBjLmVicmVhayBpbnN0
cnVjdGlvbi4KPgo+IFJld3JpdGUgdGhlbSB3aXRoIGNoZWNrIGZvciByczEgIT0gMC4KPgo+IFNp
Z25lZC1vZmYtYnk6IE5hbSBDYW8gPG5hbWNhb3ZAZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2luc24uaCB8IDE1ICsrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5z
bi5oCj4gaW5kZXggNGUxNTA1Y2VmOGFhLi5mY2UwMDQwMGM5YmMgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2luc24uaAo+IEBAIC0xMTAsNiArMTEwLDcgQEAKPiAgI2RlZmluZSBSVkNfSU5TTl9GVU5DVDRf
T1BPRkYJMTIKPiAgI2RlZmluZSBSVkNfSU5TTl9GVU5DVDNfTUFTSwlHRU5NQVNLKDE1LCAxMykK
PiAgI2RlZmluZSBSVkNfSU5TTl9GVU5DVDNfT1BPRkYJMTMKPiArI2RlZmluZSBSVkNfSU5TTl9K
X1JTMV9NQVNLCUdFTk1BU0soMTEsIDcpCj4gICNkZWZpbmUgUlZDX0lOU05fSl9SUzJfTUFTSwlH
RU5NQVNLKDYsIDIpCj4gICNkZWZpbmUgUlZDX0lOU05fT1BDT0RFX01BU0sJR0VOTUFTSygxLCAw
KQo+ICAjZGVmaW5lIFJWQ19FTkNPREVfRlVOQ1QzKGZfKQkoUlZDX0ZVTkNUM18jI2ZfIDw8IFJW
Q19JTlNOX0ZVTkNUM19PUE9GRikKPiBAQCAtMjQ1LDggKzI0Niw2IEBAIF9fUklTQ1ZfSU5TTl9G
VU5DUyhjX2phbCwgUlZDX01BU0tfQ19KQUwsIFJWQ19NQVRDSF9DX0pBTCkKPiAgX19SSVNDVl9J
TlNOX0ZVTkNTKGF1aXBjLCBSVkdfTUFTS19BVUlQQywgUlZHX01BVENIX0FVSVBDKQo+ICBfX1JJ
U0NWX0lOU05fRlVOQ1MoamFsciwgUlZHX01BU0tfSkFMUiwgUlZHX01BVENIX0pBTFIpCj4gIF9f
UklTQ1ZfSU5TTl9GVU5DUyhqYWwsIFJWR19NQVNLX0pBTCwgUlZHX01BVENIX0pBTCkKPiAtX19S
SVNDVl9JTlNOX0ZVTkNTKGNfanIsIFJWQ19NQVNLX0NfSlIsIFJWQ19NQVRDSF9DX0pSKQo+IC1f
X1JJU0NWX0lOU05fRlVOQ1MoY19qYWxyLCBSVkNfTUFTS19DX0pBTFIsIFJWQ19NQVRDSF9DX0pB
TFIpCj4gIF9fUklTQ1ZfSU5TTl9GVU5DUyhjX2osIFJWQ19NQVNLX0NfSiwgUlZDX01BVENIX0Nf
SikKPiAgX19SSVNDVl9JTlNOX0ZVTkNTKGJlcSwgUlZHX01BU0tfQkVRLCBSVkdfTUFUQ0hfQkVR
KQo+ICBfX1JJU0NWX0lOU05fRlVOQ1MoYm5lLCBSVkdfTUFTS19CTkUsIFJWR19NQVRDSF9CTkUp
Cj4gQEAgLTI3Myw2ICsyNzIsMTggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2
X2luc25faXNfYnJhbmNoKHUzMiBjb2RlKQo+ICAJcmV0dXJuIChjb2RlICYgUlZfSU5TTl9PUENP
REVfTUFTSykgPT0gUlZHX09QQ09ERV9CUkFOQ0g7Cj4gIH0KPiAgCj4gK3N0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgYm9vbCByaXNjdl9pbnNuX2lzX2NfanIodTMyIGNvZGUpCj4gK3sKPiArCXJldHVy
biAoY29kZSAmIFJWQ19NQVNLX0NfSlIpID09IFJWQ19NQVRDSF9DX0pSICYmCj4gKwkgICAgICAg
KGNvZGUgJiBSVkNfSU5TTl9KX1JTMV9NQVNLKSAhPSAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgX19h
bHdheXNfaW5saW5lIGJvb2wgcmlzY3ZfaW5zbl9pc19jX2phbHIodTMyIGNvZGUpCj4gK3sKPiAr
CXJldHVybiAoY29kZSAmIFJWQ19NQVNLX0NfSkFMUikgPT0gUlZDX01BVENIX0NfSkFMUiAmJgo+
ICsJICAgICAgIChjb2RlICYgUlZDX0lOU05fSl9SUzFfTUFTSykgIT0gMDsKPiArfQo+ICsKCk5p
Y2Ugb25lIQoKSW4gdGhlIGZ1dHVyZSwgYWRkIGEgRml4ZXMtdGFnIGZvciB0aGVzZSBraW5kIG9m
IGNoYW5nZXMhCkZpeGVzOiBlYzVmOTA4Nzc1MTYgKCJSSVNDLVY6IE1vdmUgcmlzY3ZfaW5zbl9p
c18qIG1hY3JvcyBpbnRvIGEgY29tbW9uIGhlYWRlciIpCgooTm8gbmVlZCBmb3IgYSByZXNwaW4s
IGI0IHdpbGwgcGljayB1cCB0aGUgRml4ZXMgYWJvdmUuKQoKCkJqw7ZybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
