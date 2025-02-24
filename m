Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE49C021BB
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFELt+qHmwXuFT2H+4q0+UGFeB3T/wrw+f3K9icld7s=; b=sbEc2Bo2kIKHYt
	e2vEe4T9yF+n9SH7b7eQfExLzI5VvsQDJutD905nSKWOG/DvSyMzh7x3ioK4kEs4Y0HN7qX/8G+j3
	SStAmwPuNmRBcwE1Vvoie32bEvYN4w+4Hm5ySLURJvMaWyDTRrqunqvOa/b9FJZj9NiUlvQpgR1e8
	TePJ+x2NWntRDuewlHmBsjDvKYt5ehmL8Q/NxEwxoR0UQMa0tvgieUFwwOvWsuyEFoe/xS+NQO5xB
	6NEB/BSLLpNY7wv5+f4oMo9z8kaNayNSb98K0jZcTLYDnEQIuE0Xk2/KRHz8pmxFjKrbTyt7+SC4T
	9I7Zd1SxaSp/jLUiInnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZa7-0000000E7YB-31w1;
	Mon, 24 Feb 2025 14:37:15 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ9p-0000000E285-0we2
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 14:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740406203;
	bh=7BSvEQjr8ICbU0tQIQzNSwxDzW8DS5PIxkIDb9EMHLY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lx0TWNAfqQvVVNqNlfV2wWd85CYtCLG9tk+KSJdw4KjdTDnW7FzchpHrrc5cYJOGw
	 lcFyNWVN9aWI5Vkn1eH60J6WqIlmQlLz+JfMaf801aPMkmhXF+tt6RSNNUeER2Wj2x
	 ONRpPlCalyTuuJfPcNp2Q3J0r5S/8aaK7z4GYbng=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id CB7D01A413E;
	Mon, 24 Feb 2025 09:10:01 -0500 (EST)
Message-ID: <69007e7142414d281617c1edb7444b18f53fd1f0.camel@xry111.site>
Subject: Re: [PATCH] RISC-V: vDSO: Wire up getrandom() vDSO implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 22:10:00 +0800
In-Reply-To: <20250224150345-46f09b09-3d94-41bf-850c-6188d21750bb@linutronix.de>
References: <20250224122541.65045-1-xry111@xry111.site>
	 <20250224150345-46f09b09-3d94-41bf-850c-6188d21750bb@linutronix.de>
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_061005_283612_AD6204E6 
X-CRM114-Status: GOOD (  18.08  )
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

T24gTW9uLCAyMDI1LTAyLTI0IGF0IDE1OjA3ICswMTAwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90
ZToKPiBIaSEKPiAKPiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwODoyNTo0MVBNICswODAwLCBY
aSBSdW95YW8gd3JvdGU6Cj4gPiBIb29rIHVwIHRoZSBnZW5lcmljIHZEU08gaW1wbGVtZW50YXRp
b24gdG8gdGhlIExvb25nQXJjaCB2RFNPIGRhdGEKPiA+IHBhZ2UKPiAKPiBMb29uZ0FyY2g/CgpP
b3BzLCBwYXN0byBieSAicmV1c2luZyIgbXkgb3duIHdvcmRzIGluIExvb25nQXJjaCBjb21taXQg
OiguCgo+ICJ0byB0aGUgZ2VuZXJpYyB2RFNPIGdldHJhbmRvbSBpbXBsZW1lbnRhdGlvbiIKPiAK
PiA+IGJ5IHByb3ZpZGluZyB0aGUgcmVxdWlyZWQgX19hcmNoX2NoYWNoYTIwX2Jsb2Nrc19ub3N0
YWNrLAo+ID4gX19hcmNoX2dldF9rX3Zkc29fcm5nX2RhdGEsIGFuZCBnZXRyYW5kb21fc3lzY2Fs
bCBpbXBsZW1lbnRhdGlvbnMuCj4gPiBBbHNvCj4gPiB3aXJlIHVwIHRoZSBzZWxmdGVzdHMuCj4g
PiAKPiA+IFRoZSBiZW5jaG1hcmsgcmVzdWx0Ogo+ID4gCj4gPiAJdmRzbzogMjUwMDAwMDAgdGlt
ZXMgaW4gMi41NjAwMjQ5MTMgc2Vjb25kcwo+ID4gCWxpYmM6IDI1MDAwMDAwIHRpbWVzIGluIDQw
Ljk2MDUyNDc2NyBzZWNvbmRzCj4gPiAJc3lzY2FsbDogMjUwMDAwMDAgdGltZXMgaW4gNDAuMzgw
NjUxODY0IHNlY29uZHMKPiA+IAo+ID4gCXZkc286IDI1MDAwMDAwIHggMjU2IHRpbWVzIGluIDE3
MS44MzA2NTUzMjEgc2Vjb25kcwo+ID4gCWxpYmM6IDI1MDAwMDAwIHggMjU2IHRpbWVzIGluIDI5
MTMuMTA3MDgwMTMyIHNlY29uZHMKPiA+IAlzeXNjYWxsOiAyNTAwMDAwMCB4IDI1NiB0aW1lcyBp
biAyNjkyLjA4NDMyMzM3NyBzZWNvbmRzCj4gPiAKPiA+IE5vdGUgdGhhdCBpdCBkZXBlbmRzIG9u
IFRob21hcyBXZWnDn3NjaHVoJ3MgdkRTTyBnZW5lcmljIGRhdGEgc3RvcmFnZQo+ID4gaW1wbGVt
ZW50YXRpb24gKG5vdyBpbiB0aGUgdGltZXJzL3Zkc28gYnJhbmNoIG9mIHRpcCkuCj4gCj4gVGhl
IG5vdGUgc2hvdWxkIGJlIGJlbG93IGEgIi0tLSIgbGluZSwgc28gaXQgZG9lc24ndCBlbmQgdXAg
aW4gdGhlCj4gY29tbWl0LgoKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFhpIFJ1b3lhbyA8eHJ5MTEx
QHhyeTExMS5zaXRlPgo+ID4gLS0tCj4gPiDCoGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiA+
IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5owqDCoMKgwqDCoMKgIHzC
oCAzMCArKysKPiA+IMKgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArLQo+ID4gwqBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNv
L2dldHJhbmRvbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKwo+ID4gwqBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MSArCj4gPiDCoGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmdldHJhbmRvbS1jaGFjaGEuU8KgwqDC
oCB8IDI0NAo+ID4gKysrKysrKysrKysrKysrKysrCj4gPiDCoC4uLi9zZWxmdGVzdHMvdkRTTy92
Z2V0cmFuZG9tLWNoYWNoYS5TwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCj4gPiDCoDcgZmlsZXMg
Y2hhbmdlZCwgMjk0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaAo+ID4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9nZXRyYW5kb20uYwo+ID4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0cmFuZG9tLWNo
YWNoYS5TCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiA+IGluZGV4IGFhOGVhNTMxODZjMC4uNmZkZDYzZTE1ZmI0IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IEBAIC0yMTMsNiArMjEzLDcgQEAgY29uZmlnIFJJU0NWCj4gPiDCoAlzZWxlY3QgVEhSRUFE
X0lORk9fSU5fVEFTSwo+ID4gwqAJc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKPiA+IMKg
CXNlbGVjdCBVQUNDRVNTX01FTUNQWSBpZiAhTU1VCj4gPiArCXNlbGVjdCBWRFNPX0dFVFJBTkRP
TSBpZiBIQVZFX0dFTkVSSUNfVkRTTwo+IAo+IEJyb2tlbiBhbHBoYWJldGljYWwgb3JkZXJpbmcu
CgpJJ20gc3RpbGwgaW52ZXN0aWdhdGluZyBzb21lIENJIGZhaWx1cmVzIChhdCBsZWFzZSBzb21l
IG9mIHRoZW0gc2VlbSBub3QKanVzdCBjYXVzZWQgYnkgbWlzc2luZyB0aGUgZ2VuZXJpYyBkYXRh
IHN0b3JhZ2UgaW1wbGVtZW50YXRpb24pLiAgSSdsbApmaXggdGhlbSBhbmQgdGhlIGVycm9ycyB5
b3UgZm91bmQgaW4gVjIuCgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+ClNjaG9v
bCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
