Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D98C54F4D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:To:Subject:In-Reply-To:
	References:Mime-Version:Date:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ3yRgeqF31zdWiU/32DSrE6RFMbnc9ARaQOOEoef1U=; b=iqDQs1/jxBJrwU
	Xw1P9xcFRQnTfCBLik7iYJ3pAJSGMmNBpdDo8C4gSEL0sG8qhkLj6FuR2ONyQkV8ZlTry40dyUFoG
	RgsP22keN20SC9WuDBVtWy2p2P9tIt+bTHLn+UkgeVWpTOkgiymKGpZ8jmdjCdTP7maSeZW8Ex3U9
	v95LdTGk381o0HPf73lIqE7xtVto/WSI9T7TjiO1KdorgTkz3H1Wf1ozz9PaL96xnKOPRlMXo/JsQ
	Aat1zeyto/RNIhK9bi9ZLaaWnGHtai9oulFd3sdH0wuO24Zb0yCnEzYjYf7dmxJdsOfvts/wjW9vX
	CWwBB/UmWZ8KD2TPc8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woknU-00000005px6-39JU;
	Tue, 28 Jul 2026 16:36:52 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woknR-00000005pvz-3RKj
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785256602; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UqSzfZD/yy5iBL6j0bWJrIqUDWKu6ZWP8mPJEJHjZ9s=;
 b=MwmDHwv3NxNOWvLXZl8YPTHZPp1GieqEWC4Da2bgB5NR8ZzDu84VCMhOu97h+1y7pbiUht
 J9fr+DbyWzytHVt7FekmlupIZ03hI99nPf/7HqEAM1nVSzLFU+oeKX3P3AIWbh4NzRhCRH
 KHwcOyTrygr1vQi9WNzVIPPmvS4wrnCt/JrHFAlO/S9geaWRW0dZE+sgXt2CzkcMYgEUJ0
 150viqWuTM4oVOFkiSH5s4uCEh1tDKmcVaj7xTNE5P14zGOpwcGrAk5rfJfuJryWChwIpM
 nM0S1lRNNPCehBVBWkNpi+Xbj5rQjvm1qZ5rsYBECJyOsRuRy8BcySJD4HMwyw==
Cc: <yang.yicong@picoheart.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<geshijian@picoheart.com>, <shenyang.young@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Wed, 29 Jul 2026 00:36:37 +0800
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a68da99+7e6419+lists.infradead.org+yang.yicong@picoheart.com>
References: <20260728141938.95845-1-yang.yicong@picoheart.com> <CAAhSdy0a30XuKJGsRHf4p3BkO0vbJLWij9xp-CPKd7Rj2hjyCw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAAhSdy0a30XuKJGsRHf4p3BkO0vbJLWij9xp-CPKd7Rj2hjyCw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from [192.168.0.109] ([27.38.181.244]) by smtp.feishu.cn with ESMTPS; Wed, 29 Jul 2026 00:36:40 +0800
To: "Anup Patel" <anup@brainfault.org>
Message-Id: <dbf5e68a-db4e-414e-aea0-085ceed4365f@picoheart.com>
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093650_048268_E6E17041 
X-CRM114-Status: GOOD (  12.11  )
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

T24gNy8yOC8yNiAxMTo1NyBQTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUsIEp1bCAyOCwg
MjAyNiBhdCA3OjQ54oCvUE0gWWljb25nIFlhbmcgPHlhbmcueWljb25nQHBpY29oZWFydC5jb20+
IHdyb3RlOgo+Pgo+PiBDdXJyZW50bHkgdGhlIFJNVyBmb3IgSU1TSUMgTVJJRiBpcyBpbXBsZW1l
bnRlZCB3aXRoCj4+IHdvcmQgTFJTQyBsb29wLiBUaGlzIHdpbGwgb25seSBjb3ZlciB0aGUgbG93
ZXIgMzJiaXQKPj4gb24gYSA2NGJpdCBzeXN0ZW0uIEluc3RlYWQgb2YgZ3VhcmQgdGhlIGltcGxl
bWVudGF0aW9uCj4+IHdpdGggQ09ORklHXzY0QklUIGhlcmUsIHVzZSB0cnlfY21weGNoZygpIHdy
YXBwZXIKPj4gd2hpY2ggaGFzIGFscmVhZHkgdGFrZSBjYXJlIHRoaXMgdG8gZml4IHRoaXMgaXNz
dWUuCj4+IEl0IGNhbiBhbHNvIHVzZSBBTU8gaW5zdHJ1Y3Rpb25zIG9uIHN1cHBvcnRlZCBzeXN0
ZW0uCj4+Cj4+IEZpeGVzOiBkYjhiN2U5N2Q2MTMgKCJSSVNDLVY6IEtWTTogQWRkIGluLWtlcm5l
bCB2aXJ0dWFsaXphdGlvbiBvZiBBSUEgSU1TSUMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBZaWNvbmcg
WWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYyB8IDE1ICsrKysrKy0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPj4gaW5kZXgg
ZDM4ZjVkZTA4MzRjLi5jOTIyYzAzNzM0NGMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4+IEBAIC0y
MjAsMTUgKzIyMCwxMiBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBpbXNpY19tcmlmX2F0b21pY19y
bXcoc3RydWN0IGltc2ljX21yaWYgKm1yaWYsCj4+ICB7Cj4+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyBvbGRfdmFsID0gMCwgdG1wID0gMDsKPj4KPj4gLSAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoCj4+IC0gICAgICAgICAgICAgICAiMDogICAgIGxyLncuYXEgICAlMSwgJTBcbiIKPj4gLSAg
ICAgICAgICAgICAgICIgICAgICAgYW5kICAgICAgICUyLCAlMSwgJTNcbiIKPj4gLSAgICAgICAg
ICAgICAgICIgICAgICAgb3IgICAgICAgICUyLCAlMiwgJTRcbiIKPj4gLSAgICAgICAgICAgICAg
ICIgICAgICAgc2Mudy5ybCAgICUyLCAlMiwgJTBcbiIKPj4gLSAgICAgICAgICAgICAgICIgICAg
ICAgYm5leiAgICAgICUyLCAwYiIKPj4gLSAgICAgICAgICAgICAgIDogIitBIiAoKnB0ciksICIr
ciIgKG9sZF92YWwpLCAiK3IiICh0bXApCj4+IC0gICAgICAgICAgICAgICA6ICJyIiAofndyX21h
c2spLCAiciIgKG5ld192YWwgJiB3cl9tYXNrKQo+PiAtICAgICAgICAgICAgICAgOiAibWVtb3J5
Iik7Cj4+ICsgICAgICAgbmV3X3ZhbCAmPSB3cl9tYXNrOwo+PiArCj4+ICsgICAgICAgb2xkX3Zh
bCA9IFJFQURfT05DRSgqcHRyKTsKPj4gKyAgICAgICBkbyB7Cj4+ICsgICAgICAgICAgICAgICB0
bXAgPSAob2xkX3ZhbCAmIH53cl9tYXNrKSB8IG5ld192YWw7Cj4+ICsgICAgICAgfSB3aGlsZSAo
IXRyeV9jbXB4Y2hnKHB0ciwgJm9sZF92YWwsIHRtcCkpOwo+IAo+IFRoaXMgcGF0Y2ggaXMgYWxy
ZWFkeSBicm9rZW4gYmVjYXVzZSAib2xkX3ZhbCA9IFJFQURfT05DRSgqcHRyKTsiCj4gbXVzdCBi
ZSBkb25lIGluc2lkZSB0aGUgZG8geyAuLi4gfSB3aGlsZSAoLi4uKQo+IAoKdHJ5X2NtcHhoZygp
IHdpbGwgdXBkYXRlIHRoZSAmb2xkX3ZhbCBpZiBmYWlsZWQgdG8gZXhjaGFuZ2UsIHRoZW4KYSBz
ZWNvbmQgUkVBRF9PTkNFKCkgd2l0aGluIHRoZSBsb29wIHdpbGwgYmUgcmVkdW5kYW50LCByaWdo
dD8KCnRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
