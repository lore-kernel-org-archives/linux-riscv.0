Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C263C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CA2fhDT8gfwi9BsdYOXQArIhy2fzVnv134832Cx1eIA=; b=wt185ahO+YNYyu
	6gFRBUK+SOhaVgdoPyjrSJhUj5r0al3acKwcaiZxN408/pbW59eeVSnj6QNAGHhfgf7g4MJQpjod0
	iV2yv77j3pXoOX2OTBhZrDW6JHQ/DNBJBnK1OMAm5cqNK22mxXaigi4KpCDwDGrc4PLbC99AL/TDK
	DBqSPcJAC0RjSVKjXrDPi6bDLj7rdsRWTVDgFphRBXUg6nYuRK1qQrxc6oe0HR3huzX5p9n8qmaxK
	VfTgRyDW1fp+1QJliBRKLVJQB1hrVf3CTtex7oj+HfJ5zMa2c+29i5OhBJoJJF/VA8ekKoEzt3GNm
	qOQK1hAYkXLInr5MzAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8ah-003Qom-1N;
	Fri, 15 Dec 2023 13:50:59 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8ae-003QoG-30
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 13:50:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04DB12000E;
	Fri, 15 Dec 2023 13:50:47 +0000 (UTC)
Message-ID: <0b4f729b-fe97-4a42-b00c-d3e908cb3839@ghiti.fr>
Date: Fri, 15 Dec 2023 14:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tools: selftests: riscv: Fix compile warnings in mm
 tests
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
 <20231123185821.2272504-6-christoph.muellner@vrull.eu>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231123185821.2272504-6-christoph.muellner@vrull.eu>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055057_109187_5BDE3517 
X-CRM114-Status: GOOD (  15.40  )
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

T24gMjMvMTEvMjAyMyAxOTo1OCwgQ2hyaXN0b3BoIE11ZWxsbmVyIHdyb3RlOgo+IEZyb206IENo
cmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+Cj4gV2hlbiBi
dWlsZGluZyB0aGUgbW0gdGVzdHMgd2l0aCBhIHJpc2N2MzIgY29tcGlsZXIsIHdlIHNlZSBhIHJh
bmdlCj4gb2Ygc2hpZnQtY291bnQtb3ZlcmZsb3cgZXJyb3JzIGZyb20gc2hpZnRpbmcgMVVMIGJ5
IG1vcmUgdGhhbiAzMiBiaXRzCj4gaW4gZG9fbW1hcHMoKS4gU2luY2UsIHRoZSByZWxldmFudCBj
b2RlIGlzIG9ubHkgY2FsbGVkIGZyb20gY29kZSB0aGF0Cj4gaXMgZ2F0ZWQgYnkgYF9fcmlzY3Zf
eGxlbiA9PSA2NGAsIHdlIGNhbiBqdXN0IGFwcGx5IHRoZSBzYW1lIGdhdGluZwo+IHRvIGRvX21t
YXBzKCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5t
dWVsbG5lckB2cnVsbC5ldT4KPiAtLS0KPiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L21tL21tYXBfdGVzdC5oIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9tbS9tbWFw
X3Rlc3QuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L21tL21tYXBfdGVzdC5oCj4g
aW5kZXggOWI4NDM0ZjYyZjU3Li4yZTBkYjljNWJlNmMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcmlzY3YvbW0vbW1hcF90ZXN0LmgKPiArKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi9tbS9tbWFwX3Rlc3QuaAo+IEBAIC0xOCw2ICsxOCw4IEBAIHN0cnVj
dCBhZGRyZXNzZXMgewo+ICAgCWludCAqb25fNTZfYWRkcjsKPiAgIH07Cj4gICAKPiArLy8gT25s
eSB3b3JrcyBvbiA2NCBiaXQKPiArI2lmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ICAgc3RhdGljIGlu
bGluZSB2b2lkIGRvX21tYXBzKHN0cnVjdCBhZGRyZXNzZXMgKm1tYXBfYWRkcmVzc2VzKQo+ICAg
ewo+ICAgCS8qCj4gQEAgLTUwLDYgKzUyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGRvX21tYXBz
KHN0cnVjdCBhZGRyZXNzZXMgKm1tYXBfYWRkcmVzc2VzKQo+ICAgCW1tYXBfYWRkcmVzc2VzLT5v
bl81Nl9hZGRyID0KPiAgIAkJbW1hcChvbl81Nl9iaXRzLCA1ICogc2l6ZW9mKGludCksIHByb3Qs
IGZsYWdzLCAwLCAwKTsKPiAgIH0KPiArI2VuZGlmIC8qIF9fcmlzY3ZfeGxlbiA9PSA2NCAqLwo+
ICAgCj4gICBzdGF0aWMgaW5saW5lIGludCBtZW1vcnlfbGF5b3V0KHZvaWQpCj4gICB7CgoKWW91
IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgoKVGhhbmtzIQoKQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
