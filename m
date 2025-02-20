Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1385CC021AD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Mime-Version:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vc+d0cFyZnTDjbOFDcF5LLJJ7CpmlZ7BrR1HLE+vSQ=; b=i06bLf6eUVbAAW
	xaS7xLtnjaczoA0ge6BoLCzul8mTMCty8eJ0+ND7Vs36x/Efi3vcnxk2AwUex5ht6+w7LEOjFqv80
	6JeeALFzCV0EqTk6NAZTT/SSXH0YdYjk815OLcQ/xPzUJELs6Bahtaq79lUdQLuBBjiVwU5iLJoUF
	uTIZ3Eh+9BMAVRQZZHgmiraMGpeBxlRwgZaEYsaWVp6EbHY6GOxYEbIN5l2k6UvY4eGnCy092KSDc
	mJfJA+9mnKeE8rJJIaNsavQed9Lth0ez3/MPgDXKep2Q0m8AU8ttSixN3ZmF6lxV8Y6++fK1O6cPg
	cRqTsJWz3BHXW7CoWdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1ki-0000000HJuV-07xH;
	Thu, 20 Feb 2025 08:17:48 +0000
Received: from va-2-43.ptr.blmpb.com ([209.127.231.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1kd-0000000HJsI-36hX
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 08:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1740039456;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=pmGu7qlT9sN4uFBznTexCJJyE2/CEgvGdWTgk5+9oHI=;
 b=eUdNYUYT66qLI47XM+Bp4foSDc1HjUmiaDUY4GHxey6tVOrjIDP2OsT3YpnJhE1PhoUL9u
 7P/oMwZ5gykMCDrkjhvfLodt04Q9kl4cDH/HwHbcKJSaaZfVfLWR3rBoV+vAbWrGZCKvTl
 Y9i/K3o9Ra3X+rGygkYkCzUnAfDsbwrjjWYKw3KXfZAZ/ChceIWIy0/N40PglscGqbWb2Z
 fwiC4aSmCn2wKGkidxwJKHnE7do1sM7SmnyiViohHX2LgVmWfSqwiMvAjy3TIECM52Wz60
 tLRZLc061LpGWuVIlgrQvpPEnFlsEebbcNboo1uygKIscWqKOK3+XKwhhxQYgA==
Date: Thu, 20 Feb 2025 16:17:33 +0800
Message-Id: <38cc241c40a8ef2775e304d366bcd07df733ecf0.818d94fe.c229.4f42.a074.e64851f0591b@feishu.cn>
To: "Andrew Jones" <ajones@ventanamicro.com>
Cc: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
	<anup@brainfault.org>, <kvm-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <atishp@atishpatra.org>, 
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, 
	"linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
From: "xiangwencheng" <xiangwencheng@lanxincomputing.com>
Mime-Version: 1.0
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com> <D7WALEFMK28X.13HQ0UL1S3NM5@ventanamicro.com> <38cc241c40a8ef2775e304d366bcd07df733ecf0.f7f1d4c7.545f.42a8.90f5.c5d09b1d32ec@feishu.cn>
	<20250220-f9c4c4b3792a66999ea5b385@orel>
In-Reply-To: <20250220-f9c4c4b3792a66999ea5b385@orel>
X-Lms-Return-Path: <lba+167b6e51e+b3eb00+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_001743_857068_F4B671D9 
X-CRM114-Status: GOOD (  15.25  )
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

Cj4gRnJvbTogIkFuZHJldyBKb25lcyI8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gRGF0ZTrC
oCBUaHUsIEZlYiAyMCwgMjAyNSwgMTY6MDEKPiBTdWJqZWN0OsKgIFJlOiBbUEFUQ0hdIHJpc2N2
OiBLVk06IFJlbW92ZSB1bm5lY2Vzc2FyeSB2Y3B1IGtpY2sKPiBUbzogInhpYW5nd2VuY2hlbmci
PHhpYW5nd2VuY2hlbmdAbGFueGluY29tcHV0aW5nLmNvbT4KPiBDYzogIlJhZGltIEtyxI1tw6HF
mSI8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiwgPGFudXBAYnJhaW5mYXVsdC5vcmc+LCA8a3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+LCA8a3ZtQHZnZXIua2VybmVsLm9yZz4sIDxsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnPiwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+LCA8YXRpc2hwQGF0aXNocGF0cmEub3JnPiwgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4s
IDxwYWxtZXJAZGFiYmVsdC5jb20+LCA8YW91QGVlY3MuYmVya2VsZXkuZWR1PiwgImxpbnV4LXJp
c2N2IjxsaW51eC1yaXNjdi1ib3VuY2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gT24gVGh1LCBG
ZWIgMjAsIDIwMjUgYXQgMDM6MTI6NThQTSArMDgwMCwgeGlhbmd3ZW5jaGVuZyB3cm90ZToKCj4g
Li4uCgo+ID4gQXMgIktWTTrCoCBXRkkgd2FrZS11cCB1c2luZyBJTVNJQyBWUy1maWxlcyIgdGhh
dCBkZXNjcmliZWQgaW4gWzFdLCB3cml0aW5nIHRvwqAKCj4gPiBWUy1GSUxFIHdpbGwgd2FrZSB1
cCB2Q1BVLgoKPiA+wqAKCj4gPiBLVk0gaGFzIGFsc28gaGFuZGxlZCB0aGUgc2l0dWF0aW9uIG9m
IFdGSS4gSGVyZSBpcyB0aGUgV0ZJIGVtdWxhdGlvbiBwcm9jZXNzOgoKPiA+IGt2bV9yaXNjdl92
Y3B1X2V4aXTCoAoKPiA+IMKgwqDCoCAtPiBrdm1fcmlzY3ZfdmNwdV92aXJ0dWFsX2luc27CoAoK
PiA+IMKgwqAgwqAgwqAgwqAgLT4gc3lzdGVtX29wY29kZV9pbnNuwqAKCj4gPiDCoMKgIMKgIMKg
IMKgIMKgIMKgwqAgLT4gd2ZpX2luc27CoAoKPiA+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LT4ga3ZtX3Jpc2N2X3ZjcHVfd2ZpCgo+ID4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAtPiBrdm1fdmNwdV9oYWx0Cgo+ID4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAtPiBrdm1fdmNwdV9ibG9jawoKPiA+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgLT4ga3ZtX2FyY2hfdmNwdV9ibG9ja2luZwoKPiA+IMKgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLT4ga3ZtX3Jpc2N2X2Fp
YV93YWtlb25faGdlaQoKPiA+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLT4gY3NyX3NldChDU1JfSEdFSUUsIEJJVChoZ2VpKSk7
Cgo+ID4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAtPiBzZXRf
Y3VycmVudF9zdGF0ZShUQVNLX0lOVEVSUlVQVElCTEUpOwoKPiA+IMKgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLT4gc2NoZWR1bGUKCj4gPsKgCgo+ID4gSW4ga3Zt
X2FyY2hfdmNwdV9ibG9ja2luZyBpdCB3aWxsIGVuYWJsZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1
cHQsIHdoaWNoCgo+ID4gbWVhbnMgd2lydGluZyB0byBWU19GSUxFIHdpbGwgY2F1c2UgYW4gaW50
ZXJydXB0LiBBbmQgdGhlIGludGVycnVwdCBoYW5kbGVyCgo+ID4gaGdlaV9pbnRlcnJ1cHQgd2hp
Y2ggaXMgc2V0dGVkIGluIGFpYV9oZ2VpX2luaXQgd2lsbCBmaW5hbGx5IGNhbGwga3ZtX3ZjcHVf
a2ljawoKPiA+IHRvIHdha2UgdXAgdkNQVS4KCj4gPsKgCgo+ID4gU28gSSBzdGlsbCB0aGluayBp
cyBub3QgbmVjZXNzYXJ5IHRvIGNhbGwgYW5vdGhlciBrdm1fdmNwdV9raWNrIGFmdGVyIHdyaXRp
bmcgdG8KCj4gPiBWU19GSUxFLgoKPiA+wqAKCj4gPiBXYWl0aW5nIGZvciBtb3JlIGluZm8uIFRo
YW5rcy4KCj4gPsKgCgo+ID4gWzFdwqAgaHR0cHM6Ly9rdm0tZm9ydW0ucWVtdS5vcmcvMjAyMi9B
SUFfVmlydHVhbGl6YXRpb25faW5fS1ZNX1JJU0NWX2ZpbmFsLnBkZgoKPiA+Cgo+wqAKPiBSaWdo
dCwgd2UgZG9uJ3QgbmVlZCBhbnl0aGluZyBzaW5jZSBoZ2VpX2ludGVycnVwdCgpIGtpY2tzIGZv
ciB1cywgYnV0IGlmCgo+IHdlIGRvCgo+wqAKPiBAQCAtOTczLDggKzk3Myw4IEBAIGludCBrdm1f
cmlzY3ZfdmNwdV9haWFfaW1zaWNfaW5qZWN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKCj4gwqAg
wqAgwqAgwqAgcmVhZF9sb2NrX2lycXNhdmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwoK
PsKgCj4gwqAgwqAgwqAgwqAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ID49IDApIHsKCj4gKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBrdm1fdmNwdV93YWtlX3VwKHZjcHUpOwoKPiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB3cml0ZWwoaWlkLCBpbXNpYy0+dnNmaWxlX3ZhICsgSU1TSUNfTU1JT19TRVRJ
UE5VTV9MRSk7Cgo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAga3ZtX3ZjcHVfa2ljayh2Y3B1KTsK
Cj4gwqAgwqAgwqAgwqAgfSBlbHNlIHsKCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZWl4ID0g
Jmltc2ljLT5zd2ZpbGUtPmVpeFtpaWQgLyBCSVRTX1BFUl9UWVBFKHU2NCldOwoKPiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBzZXRfYml0KGlpZCAmIChCSVRTX1BFUl9UWVBFKHU2NCkgLSAxKSwg
ZWl4LT5laXApOwoKPsKgCj4gdGhlbiB3ZSBzaG91bGQgYmUgYWJsZSB0byBhdm9pZCB0YWtpbmcg
YSBob3N0IGludGVycnVwdC4KCkJ1dCBpdCBtYXkgc2NoZWR1bGUgYWdhaW4gaW4gdGhlIGZvcig7
OykgbG9vcCBvZiBrdm1fdmNwdV9ibG9jayBhZnRlciBrdm1fdmNwdV93YWtlX3VwIGJ1dMKgCmJl
Zm9yZSB0aGUgd3JpdGUgb2YgdnNmaWxlLCBhbmQgd2Ugd2lsbCBzdGlsbCBnZXQgYSBob3N0IGlu
dGVycnVwdC4KQEAgLTM1NzMsNiArMzU3Myw4IEBAIGJvb2wga3ZtX3ZjcHVfYmxvY2soc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQrCoMKgIMKgIMKgwqAgZm9yICg7OykgewrCoMKgIMKgIMKgIMKgIMKg
IMKgIMKgwqAgc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19JTlRFUlJVUFRJQkxFKTsKCisgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgLy8gSGVyZSB3aWxsIG5vdCBicmVhayBiZWZvcmUgdGhlIHdyaXRlIG9m
IHZzZmlsZSwKKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvLyBhbmQgdGhlbiB3ZSB3aWxsIHNjaGVk
dWxlIGFnYWluLgrCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgaWYgKGt2bV92Y3B1X2NoZWNrX2Js
b2NrKHZjcHUpIDwgMCkKwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIGJyZWFr
OwoKwqDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIHdhaXRlZCA9IHRydWU7CsKgwqAgwqAgwqAgwqAg
wqAgwqAgwqDCoCBzY2hlZHVsZSgpOwrCoMKgIMKgIMKgwqAgfQoKVGhhbmtzwqAKCj7CoAo+IFRo
YW5rcywKCj4gZHJldwo+wqAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
