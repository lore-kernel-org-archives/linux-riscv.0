Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA475EEB568
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXtTjaNAu2uTrQ7LqJ0pSlet7E+j6PEh4OIf/5ruftU=; b=p1Oku0BVEi9CWr
	G7DXqnP+vNcSzAEa94O0XzTUlRnX4NwS/QEae2itt+5WyIkThZaFedULyX3VzYu33wJRyq9rRH9j/
	5OPGVw2w+LFCSD8ufyARqGL8BPF9rxL9E6CeOrS2RvmpZiL3MJoabMPStF9W6Zmkwsj4dfVTIXgr0
	U4O/NpNmx+18twnaI3r6UEprqnsyXS3h17XEIn2Yyce9dN2CE83JzovRg5SBU7GS9siuTRnwONgdc
	AtAXq8xaSDQFlbaLYJXZ1PL6rmokYDDiP3XnX/bW6qYCJJPLSJCFM1VpdAEyWqgpZYg8SfflWHx2Q
	TypgxIsQOQpTlVeUiR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qefmz-00ECM5-2Q;
	Fri, 08 Sep 2023 18:01:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qefmu-00ECKS-2g
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 18:01:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 65466B821B2;
	Fri,  8 Sep 2023 18:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7042BC433D9;
	Fri,  8 Sep 2023 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694196058;
	bh=j5UUaXb8RGSEciFJtoJmgCe8/tVFxQk6ZmOw1l6vuDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NUd8H4XGUmIbpfXJ4nSJDCyUWIba4C/yKXXNnUoDmgKVA6N0O48Xl7R9VKJdgZWvf
	 SD9ZJwAphWGUDSWDlOxCp2LuZH/QhbU9ozpEkEIHr3lh7cal+Y7CStKB3eN0tmY7OL
	 qf/tEQ7G7FGQJ05iHGCMkm0Z+okPShWcdANAErepGkTk3L5gUzPI2Ro6UIyCPf9Yru
	 vwQUZ8mzXBL1MmFkBcqHI8gTdelPF2/czKUhcF7ZJdd+2YPVdu5FN1wo2ZdX3NmDzs
	 7bf7SrTmrhfhG3Nl+WodJCFS0fdqWKXPDy8lO16W25M5eMM6cVXMk/aVjkEXqG05HF
	 bMLFJkkXudP5A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
 jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com,
 elver@google.com, glider@google.com, cyphar@cyphar.com,
 kirill.shutemov@linux.intel.com, keescook@chromium.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH v5] riscv: add userland instruction dump
 to RISC-V splats
In-Reply-To: <CAEEQ3wnDAJOMo2SZAB23aZgOhBKPmZegC9E048YJaFhiXEkA-A@mail.gmail.com>
References: <20230901123043.73700-1-cuiyunhui@bytedance.com>
 <878r9hvn3m.fsf@all.your.base.are.belong.to.us>
 <CAEEQ3wnDAJOMo2SZAB23aZgOhBKPmZegC9E048YJaFhiXEkA-A@mail.gmail.com>
Date: Fri, 08 Sep 2023 20:00:55 +0200
Message-ID: <87r0n8pmso.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_110101_168760_5CB57033 
X-CRM114-Status: GOOD (  19.25  )
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

eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gSGkgQmrDtnJu
77yMCj4KPiBPbiBGcmksIFNlcCA4LCAyMDIzIGF0IDI6NDXigK9BTSBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVk
YW5jZS5jb20+IHdyaXRlczoKPj4KPj4gPiBBZGQgdXNlcmxhbmQgaW5zdHJ1Y3Rpb24gZHVtcCBh
bmQgcmVuYW1lIGR1bXBfa2VybmVsX2luc3RyKCkKPj4gPiB0byBkdW1wX2luc3RyKCkuCj4+ID4K
Pj4gPiBBbiBleGFtcGxlOgo+PiA+IFsgICAgMC44MjI0MzldIEZyZWVpbmcgdW51c2VkIGtlcm5l
bCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5OiA2OTE2Swo+PiA+IFsgICAgMC44MjM4MTddIFJ1biAv
aW5pdCBhcyBpbml0IHByb2Nlc3MKPj4gPiBbICAgIDAuODM5NDExXSBpbml0WzFdOiB1bmhhbmRs
ZWQgc2lnbmFsIDQgY29kZSAweDEgYXQgMHgwMDAwMDAwMDAwMDViZTE4IGluIGJiWzEwMDAwKzVm
YjAwMF0KPj4gPiBbICAgIDAuODQwNzUxXSBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRh
aW50ZWQgNS4xNC4wLXJjNC0wMDA0OS1nYmQ2NDQyOTBhYTcyLWRpcnR5ICMxODcKPj4gPiBbICAg
IDAuODQxMzczXSBIYXJkd2FyZSBuYW1lOiAgLCBCSU9TCj4+ID4gWyAgICAwLjg0MTc0M10gZXBj
IDogMDAwMDAwMDAwMDA1YmUxOCByYSA6IDAwMDAwMDAwMDAwNzllNzQgc3AgOiAwMDAwMDAzZmZm
Y2FmZGEwCj4+ID4gWyAgICAwLjg0MjI3MV0gIGdwIDogZmZmZmZmZmY4MTZlOWRjOCB0cCA6IDAw
MDAwMDAwMDAwMDAwMDAgdDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyAgICAwLjg0Mjk0N10g
IHQxIDogMDAwMDAwM2ZmZmM5ZmRmMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOiAwMDAwMDAw
MDAwMDAwMDAwCj4+ID4gWyAgICAwLjg0MzQzNF0gIHMxIDogMDAwMDAwMDAwMDAwMDAwMCBhMCA6
IDAwMDAwMDNmZmZjYTAxOTAgYTEgOiAwMDAwMDAzZmZmY2FmZTE4Cj4+ID4gWyAgICAwLjg0Mzg5
MV0gIGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQgOiAwMDAw
MDAwMDAwMDAwMDAwCj4+ID4gWyAgICAwLjg0NDM1N10gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBh
NiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyAgICAwLjg0
NDgwM10gIHMyIDogMDAwMDAwMDAwMDAwMDAwMCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAw
MDAwMDAwMDAwMDAwMDAwCj4+ID4gWyAgICAwLjg0NTI1M10gIHM1IDogMDAwMDAwMDAwMDAwMDAw
MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyAgICAw
Ljg0NTcyMl0gIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAwMDAwMDAgczEw
OiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyAgICAwLjg0NjE4MF0gIHMxMTogMDAwMDAwMDAwMGQx
NDRlMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDAgdDQgOiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyAg
ICAwLjg0NjYxNl0gIHQ1IDogMDAwMDAwMDAwMDAwMDAwMCB0NiA6IDAwMDAwMDAwMDAwMDAwMDAK
Pj4gPiBbICAgIDAuODQ3MjA0XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAwMjAgYmFkYWRkcjogMDAw
MDAwMDBmMDAyODA1MyBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMgo+PiA+IFsgICAgMC44NDgyMTld
IENvZGU6IGYwNmYgZmY1ZiAzODIzIGZhMTEgMDExMyBmYjAxIDJlMjMgMDIwMSAwMjkzIDAwMDAg
KDgwNTMpIGYwMDIKPj4gPiBbICAgIDAuODUxMDE2XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2lu
ZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwNAo+PiA+Cj4+ID4g
U2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4+ID4g
LS0tCj4+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCAxOSArKysrKysrKysrKysrKysr
LS0tCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ID4gaW5kZXggZjc5OGM4NTNiZWRlLi45MjNiNDljMzg5
ODUgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiA+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gPiBAQCAtMzMsNyArMzMsMTkgQEAgaW50IHNo
b3dfdW5oYW5kbGVkX3NpZ25hbHMgPSAxOwo+PiA+Cj4+ID4gIHN0YXRpYyBERUZJTkVfU1BJTkxP
Q0soZGllX2xvY2spOwo+PiA+Cj4+ID4gLXN0YXRpYyB2b2lkIGR1bXBfa2VybmVsX2luc3RyKGNv
bnN0IGNoYXIgKmxvZ2x2bCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ID4gK3N0YXRpYyBpbnQg
Y29weV9jb2RlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1MTYgKnZhbCwgY29uc3QgdTE2ICppbnNu
cykKPj4gPiArewo+PiA+ICsgICAgIGlmICghdXNlcl9tb2RlKHJlZ3MpKQo+PiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIGdldF9rZXJuZWxfbm9mYXVsdCgqdmFsLCBpbnNucyk7Cj4+ID4gKwo+PiA+
ICsgICAgIC8qIFRoZSB1c2VyIHNwYWNlIGNvZGUgZnJvbSBvdGhlciB0YXNrcyBjYW5ub3QgYmUg
YWNjZXNzZWQuICovCj4+ID4gKyAgICAgaWYgKHJlZ3MgIT0gdGFza19wdF9yZWdzKGN1cnJlbnQp
KQo+PiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPj4gPiArCj4+ID4gKyAgICAgcmV0
dXJuIGNvcHlfZnJvbV91c2VyX25vZmF1bHQodmFsLCBpbnNucywgc2l6ZW9mKCp2YWwpKTsKPj4K
Pj4gSG1tLCBJIHRoaW5rIHlvdSBtaXNzZWQgdGhlIGFjdHVhbCBwcm9ibGVtIGluIFsxXS4gSSdt
IHN0aWxsIGdldHRpbmc6Cj4+Cj4+ICAgfCAgIENIRUNLICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+PiAgIHwgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzo0Njo0NDogd2FybmluZzogaW5j
b3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMiAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQo+PiAg
IHwgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzo0Njo0NDogICAgZXhwZWN0ZWQgdm9pZCBjb25z
dCBbbm9kZXJlZl0gX191c2VyICpzcmMKPj4gICB8IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6
NDY6NDQ6ICAgIGdvdCB1bnNpZ25lZCBzaG9ydCBjb25zdCBbdXNlcnR5cGVdICppbnNucwo+Pgo+
Cj4gSG93IGRpZCB0aGUgd2FybmluZ3MgYWJvdmUgY29tZSBhYm91dD8gSSBkb24ndCBoYXZlIG9u
ZSBsb2NhbGx5LiBXaGF0Cj4gaXMgeW91ciByaXNjLXYgZ2NjIHZlcnNpb24/CgpJdCdzIGZyb20g
dGhlICJzcGFyc2UiIHRvb2wuIFBhc3MgIkM9MSIgdG8gbWFrZS4gVW5mb3J0dW5hdGVseSBSViBz
cGFyc2UKbmVlZHMgdG8gYmUgYnVpbHQgbWFudWFsbHk6IGh0dHBzOi8vZ2l0aHViLmNvbS9Db25j
aHVPRC9zcGFyc2UKCiB8IG1ha2UgQVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGlu
dXgtZ251LSBDPTEgVz0xIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLm8KCgpUaGFua3MhCkJqw7Zy
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
