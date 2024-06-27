Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511D8C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZzMGgShztKgvzRTfJWqs+oGCvShzyRhlQbeajZh+Tw=; b=dCTsp6IP3BMqq9
	cDzAZERU5Zfw5KKd4Ye7FDzSVSSxqxcZS8hM50ciOk9Xyx8/zPvUVD9O7TZ1Nr1QWq+tLyKOmT1XH
	p3YSBTwKte3wep+6orTnXl0NAHhcZ4KSD1SZzMTU5BrciAshPCF03L4xZYIiEKvIldIHZvqE23SYl
	F3l/rnj9t5bm/zaXjZZ0jkch8mKlEtmbZvXsP5FqisD8Yhzi39WWSQstaqj7RcnnpwXFUNHX+SMYw
	KUFHeRxpEY4F6WLoDzTq47G60MNiijOOAL/L+utc80pchFDLgxNxtstFAgB3orQog/kyEntbEY9gK
	Kc80qboTIhIV3IFv0b1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjKv-00000009WBi-2sO3;
	Thu, 27 Jun 2024 07:14:29 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjKs-00000009WAu-2ZQr
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 07:14:28 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 574DD72C8CC;
	Thu, 27 Jun 2024 10:14:22 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 4DCDF7CCB3C; Thu, 27 Jun 2024 10:14:22 +0300 (IDT)
Date: Thu, 27 Jun 2024 10:14:22 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andreas Schwab <schwab@suse.de>,
	David Laight <David.Laight@ACULAB.COM>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Ivan A. Melnikov" <iv@altlinux.org>
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Message-ID: <20240627071422.GA2626@altlinux.org>
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_001427_014786_416FA00F 
X-CRM114-Status: GOOD (  25.50  )
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

SGksCgpPbiBUdWUsIEF1ZyAwMSwgMjAyMyBhdCAxMDoxNToxNlBNICswODAwLCBDZWxlc3RlIExp
dSB3cm90ZToKPiBXaGVuIHdlIHRlc3Qgc2VjY29tcCB3aXRoIDYuNCBrZXJuZWwsIHdlIGZvdW5k
IGVycm5vIGhhcyB3cm9uZyB2YWx1ZS4KPiBJZiB3ZSBkZW55IE5FVExJTktfQVVESVQgd2l0aCBF
QUZOT1NVUFBPUlQsIGFmdGVyIGYwYmRkZjUwNTg2ZCwgd2Ugd2lsbAo+IGdldCBFTk9TWVMgaW5z
dGVhZC4gV2UgZ290IHNhbWUgcmVzdWx0IHdpdGggY29tbWl0IDljMjU5OGQ0MzUxMCAoInJpc2N2
Ogo+IGVudHJ5OiBTYXZlIGEwIHByaW9yIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSIp
Lgo+IAo+IEFmdGVyIGFuYWx5c2luZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVO
T1NZUyBzaG91bGQgb25seSBiZQo+IGV4ZWN1dGVkIHdoZW4gc3lzY2FsbCAhPSAtMS4gSW4gX19z
ZWNjb21wX2ZpbHRlciwgd2hlbiBzZWNjb21wIHJlamVjdGVkCj4gdGhpcyBzeXNjYWxsIHdpdGgg
c3BlY2lmaWVkIGVycm5vLCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJldHVybiBudW1iZXIgYXMKPiBz
eXNjYWxsIEFCSSwgYW5kIHRoZW4gcmV0dXJuIC0xLiBUaGlzIHJldHVybiBudW1iZXIgaXMgZmlu
YWxseSBwYXNzIGFzCj4gcmV0dXJuIG51bWJlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZCB3aXRoCj4gTlJfc3lzY2FsbHMgYWZ0ZXIgY29udmVy
dGVkIHRvIHVsb25nIChzbyBpdCB3aWxsIGJlIFVMT05HX01BWCkuIFRoZQo+IGNvbmRpdGlvbiBz
eXNjYWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMgYmUgZmFsc2UsIHNvIHJlZ3MtPmEwID0g
LUVOT1NZUwo+IGlzIGFsd2F5cyBleGVjdXRlZC4gSXQgY292ZXJlZCBhMCBzZXQgYnkgc2VjY29t
cCwgc28gd2UgYWx3YXlzIGdldAo+IEVOT1NZUyB3aGVuIG1hdGNoIHNlY2NvbXAgUkVUX0VSUk5P
IHJ1bGUuCj4gCj4gRml4ZXM6IGYwYmRkZjUwNTg2ZCAoInJpc2N2OiBlbnRyeTogQ29udmVydCB0
byBnZW5lcmljIGVudHJ5IikKPiBSZXBvcnRlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0Bh
cmNobGludXgub3JnPgo+IENvLWRldmVsb3BlZC1ieTogUnVpemhlIFBhbiA8YzE0MTAyOEBnbWFp
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUnVpemhlIFBhbiA8YzE0MTAyOEBnbWFpbC5jb20+Cj4g
Q28tZGV2ZWxvcGVkLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4KPiBT
aWduZWQtb2ZmLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDZWxlc3RlIExpdSA8Q29lbGFjYW50aHVzSGV4QGdtYWlsLmNvbT4KPiBUZXN0
ZWQtYnk6IEZlbGl4IFlhbiA8ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KPiBUZXN0ZWQtYnk6
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29t
Pgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IC0tLQo+IAo+IHY0IC0+IHY1
OiBhZGQgVGVzdGVkLWJ5IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGlu
Z0BjYW5vbmljYWwuY29tPgo+IHYzIC0+IHY0OiB1c2UgbG9uZyBpbnN0ZWFkIG9mIHVsb25nIHRv
IHJlZHVjZSB0eXBlIGNhc3QgYW5kIGF2b2lkCj4gICAgICAgICAgIGltcGxlbWVudGF0aW9uLWRl
ZmluZWQgYmVoYXZpb3IsIGFuZCBtYWtlIHRoZSBqdWRnbWVudCBvZiBzeXNjYWxsCj4gICAgICAg
ICAgIGludmFsaWQgbW9yZSBleHBsaWNpdAo+IHYyIC0+IHYzOiB1c2UgaWYtc3RhdGVtZW50IGlu
c3RlYWQgb2Ygc2V0IGRlZmF1bHQgdmFsdWUsCj4gICAgICAgICAgIGNsYXJpZnkgdGhlIHR5cGUg
b2Ygc3lzY2FsbAo+IHYxIC0+IHYyOiBhZGRlZCBleHBsYW5hdGlvbiBvbiB3aHkgYWx3YXlzIGdv
dCBFTk9TWVMKPiAKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDYgKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCj4gaW5kZXggZjkxMGRmY2NiZjVkMi4uNzI5Zjc5Yzk3ZTJiZiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Ywo+IEBAIC0yOTcsNyArMjk3LDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICBhc21saW5rYWdl
IF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiAgewo+ICAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+IC0JCXVsb25nIHN5
c2NhbGwgPSByZWdzLT5hNzsKPiArCQlsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPiAgCj4gIAkJ
cmVncy0+ZXBjICs9IDQ7Cj4gIAkJcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+IEBAIC0zMDYs
OSArMzA2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190
cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAo+ICAJCXN5c2NhbGwgPSBzeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+ICAKPiAtCQlpZiAoc3lz
Y2FsbCA8IE5SX3N5c2NhbGxzKQo+ICsJCWlmIChzeXNjYWxsID49IDAgJiYgc3lzY2FsbCA8IE5S
X3N5c2NhbGxzKQo+ICAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4gLQkJZWxz
ZQo+ICsJCWVsc2UgaWYgKHN5c2NhbGwgIT0gLTEpCj4gIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsK
PiAgCj4gIAkJc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKClVuZm9ydHVuYXRlbHks
IHRoaXMgY2hhbmdlIGludHJvZHVjZWQgYSByZWdyZXNzaW9uOiBpdCBicm9rZSBzdHJhY2UKc3lz
Y2FsbCB0YW1wZXJpbmcgb24gcmlzY3YuICBXaGVuIHRoZSB0cmFjZXIgY2hhbmdlcyBzeXNjYWxs
IG51bWJlciB0byAtMSwKdGhlIGtlcm5lbCBmYWlscyB0byBpbml0aWFsaXplIGEwIHdpdGggLUVO
T1NZUyBhbmQgc3Vic2VxdWVudGx5IGZhaWxzIHRvCnJldHVybiB0aGUgZXJyb3IgY29kZSBvZiB0
aGUgZmFpbGVkIHN5c2NhbGwgdG8gdXNlcnNwYWNlLgoKSSB3aXNoIHlvdSB3ZXJlIHJ1bm5pbmcg
c3RyYWNlIHRlc3Qgc3VpdGUgYmVmb3JlIGNoYW5naW5nIHRoaXMgcGFydCBvZiB0aGUKa2VybmVs
LiAgTm93IEknbSBnb2luZyB0byBhcHBseSBhIHdvcmthcm91bmQgWzFdIGluIHN0cmFjZSwgYnV0
IHBsZWFzZQpub3RlIHRoYXQgcmlzY3Ygc2VlbXMgdG8gYmUgdGhlIG9ubHkgbGludXggYXJjaGl0
ZWN0dXJlIHdoZXJlIHN1Y2ggYQp3b3JrYXJvdW5kIGlzIGN1cnJlbnRseSByZXF1aXJlZC4KClRo
ZXJlIHdhcyBhIHNpbWlsYXIga2VybmVsIGJ1ZyBvbmNlIG9uIHBhcmlzYywgYnV0IGl0IHdhcyBm
aXhlZCBbMl0Kc2V2ZXJhbCB5ZWFycyBhZ28gYnkgY29tbWl0IGI3ZGM1YTA3MWRkZi4KClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vc3RyYWNlL3N0cmFjZS9jb21taXQvYzNhZTJiMjc3MzI5NTI2NjNh
MzYwMDI2OTg4NGUzNjNjYjc3YTAyNApbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxk
cy9jL2I3ZGM1YTA3MWRkZjY5YzAzNTAzOTZiMjAzY2JhMzJmZTViYWI1MTAKCgotLSAKbGR2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
