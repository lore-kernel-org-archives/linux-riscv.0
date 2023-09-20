Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683D8CE79B4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWtc1o9JvSdErN57HkrQuP1msTxbD58jiOKfLaHIx70=; b=QaPifLCUhl0T5x
	6JwW6Dl9sxYGecHworPVhBo5hYwrpGKug5ZnJVVPPuRL4C9fr1diUHwE8d/NuueqihC9gikxpZeYy
	cW2OjBLNgK2rzLwCUID1h+pV9qpwMe76JoEyJmOLGO3UwidskbIYMA6BAZCDCwu9vL7Oq+opTREjQ
	dbTgD/u7f41zKan/HdeeGVgyg3+9lCQ+BJQkUgWmMfIqAP3Z73DMwgRfHj38nJ3Koo5Am4srAPDPB
	or1RAGoN1NKAFmde2lho3R5FAiSPTwmHS0DehAaT07xMCDYEDSKq5nm38/7Ll4enTCDxrEvAyR/Kw
	FVIVTxBn7yLzBCefXzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiu4d-002Xv6-0m;
	Wed, 20 Sep 2023 10:04:47 +0000
Received: from bg2.exmail.qq.com ([114.132.224.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiu4a-002Xtx-03
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 10:04:46 +0000
X-QQ-mid: bizesmtp76t1695204251taao2372
Received: from [10.4.6.71] ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Sep 2023 18:04:10 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: IV30oiqrgAb5rna1TIEV7YfRW072k5eKxAQ5LfodYttb50A7vd2R+5p1I1QL1
	laK8zIgLCa1QBVxGwsSeVP+5VLUtRrYmsY7fkrLmPFb6782LLuRNqfN7Qt+bY2ujIMut0HC
	BbE+EyBB+E/toQsROAWBx8NpBFyspfc7ndKuq7pOsFXa5JtnWqkP0hw6ZQm3OxpB2ki6Yrc
	SIpl+l5rSdDaWiSJn6PzpZtYagyK+7kWxUiz7keJ4frDvRtYMfx5cJfagGgh0UkajE/5wYH
	wnMdqfNLQsG8FkoeCOTlcGpgIEJt082cNpIa+3MhnaDw5gxc+6nX8A+uWCNOHAUMm0lveTf
	AOPeR6/fQymbQ/ybHWWlpUjS9gW0w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4374422987798744598
Message-ID: <114145FFA8546AF1+24aac21b-3748-3d50-4154-a25ab59be1be@tinylab.org>
Date: Wed, 20 Sep 2023 18:04:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH -fixes] riscv: Remove duplicate objcopy flag
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-8cabcad9-a181-4db8-904b-3f7daa7621f1@palmer-ri-x1c9a>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <mhng-8cabcad9-a181-4db8-904b-3f7daa7621f1@palmer-ri-x1c9a>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_030444_410475_743737C6 
X-CRM114-Status: GOOD (  13.05  )
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

CgrlnKggMjAyMy85LzIwIDE3OjUyLCBQYWxtZXIgRGFiYmVsdCDlhpnpgZM6Cj4gT24gVGh1LCAx
NCBTZXAgMjAyMyAwMjoxMzozNCBQRFQgKC0wNzAwKSwgc29uZ3NodWFpc2h1YWlAdGlueWxhYi5v
cmcgd3JvdGU6Cj4+IFRoZXJlIGFyZSB0d28gZHVwbGljYXRlIGAtTyBiaW5hcnlgIGZsYWdzIHdo
ZW4gb2JqY29weWluZyBmcm9tIHZtbGludXgKPj4gdG8gSW1hZ2UveGlwSW1hZ2UuCj4+Cj4+IFJJ
U0MtViBzZXQgYC1PIGJpbmFyeWAgZmxhZyBpbiBib3RoIE9CSkNPUFlGTEFHUyBpbiB0aGUgdG9w
LWxldmVsIHJpc2N2Cj4+IE1ha2VmaWxlIGFuZCBPQkpDT1BZRkxBR1NfKiBpbiB0aGUgYm9vdC9N
YWtlZmlsZSwgYW5kIHRoZSBvYmpjb3B5IGNtZAo+PiBpbiBLYnVpbGQgd291bGQgam9pbiB0aGVt
IHRvZ2V0aGVyLgo+Pgo+PiBUaGUgYC1PIGJpbmFyeWAgZmxhZyBpcyBvbmx5IG5lZWRlZCBmb3Ig
b2JqY29weWluZyBJbWFnZSwgc28gcmVtb3ZlIHRoZQo+PiBPQkpDT1BZRkxBR1MgaW4gdGhlIHRv
cC1sZXZlbCByaXNjdiBNYWtlZmlsZS4KPj4KPj4gRml4ZXM6IGMwZmJjZDk5MTg2MCAoIlJJU0Mt
VjogQnVpbGQgZmxhdCBhbmQgY29tcHJlc3NlZCBrZXJuZWwgaW1hZ2VzIikKPj4gU2lnbmVkLW9m
Zi1ieTogU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+Cj4+IC0tLQo+PiDC
oGFyY2gvcmlzY3YvTWFrZWZpbGUgfCAxIC0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yv
TWFrZWZpbGUKPj4gaW5kZXggMTMyOWUwNjBjNTQ4Li5iNDNhNmJiN2U0ZGMgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+PiBA
QCAtNiw3ICs2LDYgQEAKPj4gwqAjIGZvciBtb3JlIGRldGFpbHMuCj4+IMKgIwo+Pgo+PiAtT0JK
Q09QWUZMQUdTwqDCoMKgIDo9IC1PIGJpbmFyeQo+PiDCoExERkxBR1Nfdm1saW51eCA6PSAteiBu
b3JlbHJvCj4+IMKgaWZlcSAoJChDT05GSUdfUkVMT0NBVEFCTEUpLHkpCj4+IMKgwqDCoMKgIExE
RkxBR1Nfdm1saW51eCArPSAtc2hhcmVkIC1Cc3ltYm9saWMgLXogbm90ZXh0IC0tZW1pdC1yZWxv
Y3MKPiAKPiBEb2VzIHRoaXMgcmVzdWx0IGluIGFueSBpbmNvcnJlY3QgYmVoYXZpb3I/wqAgSXQg
bG9va3MgZmluZSB0byBtZSwgYnV0IGlmCk5vcCwgb2JqY29weSB3b3JrcyBhcyBpdCdzIGV4cGVj
dGVkLiBZb3UgY2FuIHB1dCB0aGlzIHBhdGNoIG9uIC1uZXh0LgoKPiB0aGVyZSdzIG5vIHJlZ3Jl
c3Npb24gSSdsbCBwdXQgaW4gb24gLW5leHQgaW5zdGVhZCBvZiAtZml4ZXMuCj4gCj4gUmV2aWV3
ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAoKLS0gClRoYW5r
cwpTb25nIFNodWFpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
