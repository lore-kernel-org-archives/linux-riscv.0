Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F04C38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 02:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXadPwUpPGSV1HkI6Rmbn5jOweaaTZskOk1dRK+yoL4=; b=iCIc0jx+2nFSM/
	+/3Quqrwyphs/A5PrG4ienJwCI7zdCuBx7o6d0rCDZLjWbHrg4f+TeEUbQsf2KKYJshFD9RCqjhAW
	Sd13DO4u9xHNfjKUq/X8dAlsvpjT3+g01a9O4Lq/qRPSCL0aTzTADtJ+XcHBUoazqdRSs4bVypAIF
	lfY9UvkK8XhIvtJgctMxnyCAYZfUMN1EzfCHga81YQNqTPen5WVpGhHszUp9nQ8AScbqIGE7EIpNq
	+kqCV73g+/WpzfEL9jm8I1dChXNycKfQTdDc49ijuGyNJ4hfJ86owUz8lhzPE4IBD/dftRrkeDY2A
	VDsrOSDtVkZP9o5YjcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLbNd-00H54n-9j; Sat, 28 Jan 2023 02:55:49 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLbNY-00H53q-Nb
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 02:55:47 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4P3fCR0dt0z16Mn6;
	Sat, 28 Jan 2023 10:53:39 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 28 Jan 2023 10:55:35 +0800
Message-ID: <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
Date: Sat, 28 Jan 2023 10:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal
 position
To: <guoren@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<mhiramat@kernel.org>, <conor.dooley@microchip.com>, <penberg@kernel.org>,
	<mark.rutland@arm.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@linux.alibaba.com>
References: <20230126130509.1418251-1-guoren@kernel.org>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20230126130509.1418251-1-guoren@kernel.org>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_185545_168040_59589348 
X-CRM114-Status: GOOD (  15.64  )
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

CgrlnKggMjAyMy8xLzI2IDIxOjA1LCBndW9yZW5Aa2VybmVsLm9yZyDlhpnpgZM6Cj4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+IFRoZSBrZXJuZWwgd291bGQg
cGFuaWMgd2hlbiBwcm9iZWQgZm9yIGFuIGlsbGVnYWwgcG9zaXRpb24uIGVnOgo+IAo+IChDT05G
SUdfUklTQ1ZfSVNBX0M9bikKPiAKPiBlY2hvICdwOmhlbGxvIGtlcm5lbF9jbG9uZSsweDE2IGEw
PSVhMCcgPj4ga3Byb2JlX2V2ZW50cwo+IGVjaG8gMSA+IGV2ZW50cy9rcHJvYmVzL2hlbGxvL2Vu
YWJsZQo+IGNhdCB0cmFjZQo+IAo+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBzdGFjay1w
cm90ZWN0b3I6IEtlcm5lbCBzdGFjawo+IGlzIGNvcnJ1cHRlZCBpbjogX19kb19zeXNfbmV3ZnN0
YXRhdCsweGI4LzB4YjgKPiBDUFU6IDAgUElEOiAxMTEgQ29tbTogc2ggTm90IHRhaW50ZWQKPiA2
LjIuMC1yYzEtMDAwMjctZzJkMzk4ZmU0OWE0ZCAjNDkwCj4gSGFyZHdhcmUgbmFtZTogcmlzY3Yt
dmlydGlvLHFlbXUgKERUKQo+IENhbGwgVHJhY2U6Cj4gWzxmZmZmZmZmZjgwMDA3MjY4Pl0gZHVt
cF9iYWNrdHJhY2UrMHgzOC8weDQ4Cj4gWzxmZmZmZmZmZjgwYzVlODNjPl0gc2hvd19zdGFjaysw
eDUwLzB4NjgKPiBbPGZmZmZmZmZmODBjNmRhMjg+XSBkdW1wX3N0YWNrX2x2bCsweDYwLzB4ODQK
PiBbPGZmZmZmZmZmODBjNmRhNmM+XSBkdW1wX3N0YWNrKzB4MjAvMHgzMAo+IFs8ZmZmZmZmZmY4
MGM1ZWNmND5dIHBhbmljKzB4MTYwLzB4Mzc0Cj4gWzxmZmZmZmZmZjgwYzZkYjk0Pl0gZ2VuZXJp
Y19oYW5kbGVfYXJjaF9pcnErMHgwLzB4YTgKPiBbPGZmZmZmZmZmODAyZGVlYjA+XSBzeXNfbmV3
c3RhdCsweDAvMHgzMAo+IFs8ZmZmZmZmZmY4MDAxNThjMD5dIHN5c19jbG9uZSsweDIwLzB4MzAK
PiBbPGZmZmZmZmZmODAwMDM5ZTg+XSByZXRfZnJvbV9zeXNjYWxsKzB4MC8weDQKPiAtLS1bIGVu
ZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJvdGVjdG9yOgo+IEtlcm5lbCBz
dGFjayBpcyBjb3JydXB0ZWQgaW46IF9fZG9fc3lzX25ld2ZzdGF0YXQrMHhiOC8weGI4IF0tLS0K
PiAKPiBUaGF0IGlzIGJlY2F1c2UgdGhlIGtwcm9iZSdzIGVicmVhayBpbnN0cnVjdGlvbiBicm9r
ZSB0aGUga2VybmVsJ3MKPiBvcmlnaW5hbCBjb2RlLiBUaGUgdXNlciBzaG91bGQgZ3VhcmFudGVl
IHRoZSBjb3JyZWN0aW9uIG9mIHRoZSBwcm9iZQo+IHBvc2l0aW9uLCBidXQgaXQgY291bGRuJ3Qg
bWFrZSB0aGUga2VybmVsIHBhbmljLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBhcmNoX2NoZWNrX2tw
cm9iZSBpbiBhcmNoX3ByZXBhcmVfa3Byb2JlIHRvIHByZXZlbnQgYW4KPiBpbGxlZ2FsIHBvc2l0
aW9uIChTdWNoIGFzIHRoZSBtaWRkbGUgb2YgYW4gaW5zdHJ1Y3Rpb24pLgo+IAo+IEZpeGVzOiBj
MjJiMGJjYjFkZDAgKCJyaXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVkIikKPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9rcHJvYmVzLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
YmVzL2twcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBpbmRl
eCBmMjE1OTJkMjAzMDYuLjQ3NTk4OWYwNmQ2ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2tw
cm9iZXMuYwo+IEBAIC00OCw2ICs0OCwyMSBAQCBzdGF0aWMgdm9pZCBfX2twcm9iZXMgYXJjaF9z
aW11bGF0ZV9pbnNuKHN0cnVjdCBrcHJvYmUgKnAsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAJ
cG9zdF9rcHJvYmVfaGFuZGxlcihwLCBrY2IsIHJlZ3MpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgYm9v
bCBfX2twcm9iZXMgYXJjaF9jaGVja19rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiArewo+ICsJ
dW5zaWduZWQgbG9uZyB0bXAgID0gKHVuc2lnbmVkIGxvbmcpcC0+YWRkciAtIHAtPm9mZnNldDsK
PiArCXVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHI7Cj4gKwo+ICsJ
d2hpbGUgKHRtcCA8PSBhZGRyKSB7Cj4gKwkJaWYgKHRtcCA9PSBhZGRyKQo+ICsJCQlyZXR1cm4g
dHJ1ZTsKPiArCj4gKwkJdG1wICs9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9iZV9vcGNvZGVfdCAq
KXRtcCk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIGZhbHNlOwo+ICt9CgpMR1RNLgoKSSBoYXZlIHN1
Ym1pdCBhIHBhdGNoIHRvIGZpeCB0aGUgc2FtZSBwcm9ibGVtLCBmb3VuZCBhdDoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAxMjcxMzA1NDEuMTI1MDg2NS0xMS1jaGVuZ3Vva2Fp
MTdAbWFpbHMudWNhcy5hYy5jbi8KClNvIHRoaXMgYm91bmRhcnkgY2hlY2sgaXMgbmVjZXNzYXJ5
IG5vIG1hdHRlciBDT05GSUdfUklTQ1ZfSVNBX0MgaXMgZW5hYmxlIG9yIG5vdCwgcmlnaHQ/CgoK
PiArCj4gIGludCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpw
KQo+ICB7Cj4gIAl1bnNpZ25lZCBsb25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQgbG9uZylwLT5h
ZGRyOwo+IEBAIC01NSw2ICs3MCw5IEBAIGludCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9i
ZShzdHJ1Y3Qga3Byb2JlICpwKQo+ICAJaWYgKHByb2JlX2FkZHIgJiAweDEpCj4gIAkJcmV0dXJu
IC1FSUxTRVE7Cj4gIAo+ICsJaWYgKCFhcmNoX2NoZWNrX2twcm9iZShwKSkKPiArCQlyZXR1cm4g
LUVJTFNFUTsKPiArCj4gIAkvKiBjb3B5IGluc3RydWN0aW9uICovCj4gIAlwLT5vcGNvZGUgPSAq
cC0+YWRkcjsKPiAgCgotLSAKQlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
