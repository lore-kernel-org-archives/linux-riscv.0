Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67673C369D3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXYFx09ZKl1pK4NvQfF8bymj0JRkB56sxxGPTAK8m7E=; b=05xubxbqBfKdVH
	dUS16vKgXzUy3L7Rr6ypfRmLpdBwrh2J9sOB7KXjdaIRDq/CRoSqRV3XMqS8QD2d7V1iTJmAhySzo
	TK42blER9ItACoMw4inxaxFqfjyFm1FTO6UQXVCfI8Gsc7GqYNxIVLZwUQzH/Smaq4iUac1O7THZo
	NkIeKiZw4eZLjINdwUugdHHi4lzzsDD7SCX36vI7ZgaeNt00+ydcVqPHQnMpVaXeOB1LUdbf/ZMDH
	rl2SiZa3E5gEteUSJKsYm/4kCkuTG3CMD5dLCuVmmJ4gS2NYzinIFZy50436wKrzKuXVJ+p2CWXC0
	cLXYds9AMKkApNUpudAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DVb-00000007GO6-1s0K;
	Tue, 22 Apr 2025 13:17:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CPV-000000073V4-0Q1f;
	Tue, 22 Apr 2025 12:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BC5BA4B982;
	Tue, 22 Apr 2025 12:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB08C4CEE9;
	Tue, 22 Apr 2025 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745323652;
	bh=8WW9OB6zuGleMgSTpkSvsmydzrgJKFfSC7PR7tvoUhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n+QnN3QqdPlW9w6+THz//8BFiC/xzlKkG1GRTGM13ux+sysJWeOxftT3zB2O0Uq8K
	 +MlQxQgWanKWQtZmcLDcsLWUOnnDYT3uxQDcv2QmZ9LXBt88dZs73z7LQzhMfAF4NC
	 BDe59wLEhn37a0MKyOhpf4rBKLK3XIyLdpna36z/HqdURc/37QnTS4nV431DsVEwbx
	 lXDPDzFBeYGw5eKxZ1L2+8BzG084kHvuNyGBOgPZPsu7ynTeG4RDmqeIRUbyXzK56y
	 aoPFJSQZrX8OoU1OXHT06FqDD75L7YCqSMBTlZCJ3wmBDR40mmr9NpODuomymKD63Z
	 oUU4+U9RdhaNw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Song Shuai
 <songshuaishuai@tinylab.org>, Li Zhengyu <lizhengyu3@huawei.com>,
 kexec@lists.infradead.org, Dave Young <dyoung@redhat.com>, Yixun Lan
 <yixun.lan@gmail.com>, Xianting Tian <xianting.tian@linux.alibaba.com>,
 linux-riscv@lists.infradead.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Subject: Re: [PATCH 1/4] RISC-V: Add support for riscv kexec/kdump on
 kexec-tools
In-Reply-To: <20250422104825.GT2789685@horms.kernel.org>
References: <20250409201428.648717-1-bjorn@kernel.org>
 <20250409201428.648717-2-bjorn@kernel.org>
 <20250422104825.GT2789685@horms.kernel.org>
Date: Tue, 22 Apr 2025 14:07:28 +0200
Message-ID: <87bjso5ri7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_050733_267124_1899104C 
X-CRM114-Status: GOOD (  30.90  )
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

U2ltb24hCgpTaW1vbiBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gVGhhbmtz
IEJqw7ZybiwKPgo+IE92ZXJhbGwgSSBhbSBoYXBweSB3aXRoIHRoaXMgcGF0Y2hzZXQuIEJ1dCB0
aGVyZSBhcmUgYSBmZXcgbWlub3IgcG9pbnRzCj4gSSdkIGxpa2UgYWRkcmVzc2VkLCB3aGljaCBy
ZWxhdGUgc3RyaWN0bHkgdG8gYnVpbGQgY292ZXJhZ2UgYW5kIHRoZSBDSS4KPiBJIGNhbiBoYW5k
bGUgdGhlc2UgbXlzZWxmIGlmIHlvdSBwcmVmZXIuCgpJdCdzIHJlYWxseSB1cCB0byB5b3UhIFdo
YXQgZG8geW91IHByZWZlcj8gSSBjYW4gc3BpbiBhIHYyIGlmIHRoYXQncwplYXNpZXIgZm9yIHlv
dSAoYW5kIHRoZW4gSSdsbCB0cnkgdG8gYWRkcmVzcyBhbGwgdGhlIHRoaW5ncyB5b3UgcG9pbnRl
ZApvdXQgYmVsb3cpIQoKCkJqw7ZybgoKPiBGaXJzdGx5LCBpdCB3b3VsZCBiZSByZWFsbHkgZ3Jl
YXQgaWYgdGhlIGZvbGxvd2luZyBjb3VsZCBiZSBpbmNsdWRlZCBhdCB0aGUKPiBlbmQgb2YgdGhl
IHNlcmllcywgc28gdGhlcmUgaXMgc29tZSBidWlsZCBjb3ZlcmFnZSBvZiBSSVNDLVYgaW4gdGhl
IENJLgo+IChGZWVsIGZyZWUgdG8gcmV3cml0ZSBvciBhdHRyaWJ1dGUgaG93ZXZlciB5b3Ugc2Vl
IGZpdCAtIGl0IGlzIGEgdHJpdmFsIG9uZQo+IGxpbmVyLikKPgo+IEZyb206IFNpbW9uIEhvcm1h
biA8aG9ybXNAa2VybmVsLm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0hdIHdvcmtmbG93OiBBZGQgcmlz
Y3Y2NAo+Cj4gQWRkIHJpc2N2NjQgdG8gbWF0cml4IG9mIGJ1aWxkIGFyY2hpdGVjdHVyZXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IC5naXRodWIvd29ya2Zsb3dzL2J1aWxkLnltbCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS8uZ2l0aHViL3dvcmtmbG93cy9idWlsZC55bWwg
Yi8uZ2l0aHViL3dvcmtmbG93cy9idWlsZC55bWwKPiBpbmRleCBmZDllYTZjOGVjYTcuLmQxYjNl
NzQzOTFmZiAxMDA2NDQKPiAtLS0gYS8uZ2l0aHViL3dvcmtmbG93cy9idWlsZC55bWwKPiArKysg
Yi8uZ2l0aHViL3dvcmtmbG93cy9idWlsZC55bWwKPiBAQCAtMTksNiArMTksNyBAQCBqb2JzOgo+
ICAgICAgICAgIC0gcG93ZXJwYwo+ICAgICAgICAgIC0gcG93ZXJwYzY0Cj4gICAgICAgICAgLSBw
b3dlcnBjNjRsZQo+ICsgICAgICAgIC0gcmlzY3Y2NAo+ICAgICAgICAgIC0gc2g0Cj4gICAgICAg
ICAgLSBzMzkweAo+ICAgICAgICAgIC0geDg2XzY0LXgzMgo+Cj4gLi4uCj4KPj4gZGlmZiAtLWdp
dCBhL2tleGVjL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9rZXhlYy9hcmNoL3Jpc2N2L01ha2VmaWxl
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjI2Y2M5MDI1
ZTc3Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIva2V4ZWMvYXJjaC9yaXNjdi9NYWtlZmlsZQo+
PiBAQCAtMCwwICsxLDM1IEBACj4+ICsjCj4+ICsjIGtleGVjIHJpc2N2Cj4+ICsjCj4+ICtyaXNj
dl9LRVhFQ19TUkNTID0gIGtleGVjL2FyY2gvcmlzY3Yva2V4ZWMtcmlzY3YuYwo+PiArcmlzY3Zf
S0VYRUNfU1JDUyArPSBrZXhlYy9hcmNoL3Jpc2N2L2tleGVjLWVsZi1yaXNjdi5jCj4+ICtyaXNj
dl9LRVhFQ19TUkNTICs9IGtleGVjL2FyY2gvcmlzY3YvY3Jhc2hkdW1wLXJpc2N2LmMKPj4gKwo+
PiArcmlzY3ZfTUVNX1JFR0lPTlMgPSBrZXhlYy9tZW1fcmVnaW9ucy5jCj4+ICsKPj4gK3Jpc2N2
X0RUX09QUyArPSBrZXhlYy9kdC1vcHMuYwo+PiArCj4+ICtyaXNjdl9BUkNIX1JFVVNFX0lOSVRS
RCA9Cj4+ICsKPj4gK3Jpc2N2X0NQUEZMQUdTICs9IC1JICQoc3JjZGlyKS9rZXhlYy8KPj4gKwo+
PiArZGlzdCArPSBrZXhlYy9hcmNoL3Jpc2N2L01ha2VmaWxlICQocmlzY3ZfS0VYRUNfU1JDUykJ
CQlcCj4KPiBrZXhlYy9hcmNoL3Jpc2N2L2lvbWVtLmggYWxzbyBuZWVkcyB0byBiZSBhZGRlZCB0
byBkaXN0Cj4gc28gdGhhdCBpdCBzaG93cyB1cCBpbiB0aGUgZGlzdHJpYnV0aW9uIHRhcmJhbGwu
Cj4KPj4gKwlrZXhlYy9hcmNoL3Jpc2N2L2tleGVjLXJpc2N2LmgJCQkJCVwKPj4gKwlrZXhlYy9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXJjaC9vcHRpb25zLmgKPgo+IEFsc28sIGl0IHdvdWxkIGJlIG5p
Y2UgdG8gc29ydCB0aGVzZSBsaW5lcyBhbHBoYWJldGljYWxseS4KPgo+PiArCj4+ICtpZmRlZiBI
QVZFX0xJQkZEVAo+PiArCj4+ICtMSUJTICs9IC1sZmR0Cj4+ICsKPj4gK2Vsc2UKPj4gKwo+PiAr
aW5jbHVkZSAkKHNyY2Rpcikva2V4ZWMvbGliZmR0L01ha2VmaWxlLmxpYmZkdAo+PiArCj4+ICts
aWJmZHRfU1JDUyArPSAkKExJQkZEVF9TUkNTOiU9a2V4ZWMvbGliZmR0LyUpCj4+ICsKPj4gK3Jp
c2N2X0NQUEZMQUdTICs9IC1JJChzcmNkaXIpL2tleGVjL2xpYmZkdAo+PiArCj4+ICtyaXNjdl9L
RVhFQ19TUkNTICs9ICQobGliZmR0X1NSQ1MpCj4+ICsKPj4gK2VuZGlmCj4+ICsKPgo+IC4uLgo+
Cj4+IGRpZmYgLS1naXQgYS9rZXhlYy9kdC1vcHMuYyBiL2tleGVjL2R0LW9wcy5jCj4+IGluZGV4
IDBhOTZiNzVmNjVhYS4uM2UyODVhYjIwNDNiIDEwMDY0NAo+PiAtLS0gYS9rZXhlYy9kdC1vcHMu
Ywo+PiArKysgYi9rZXhlYy9kdC1vcHMuYwo+PiBAQCAtNCw5ICs0LDExIEBACj4+ICAjaW5jbHVk
ZSA8bGliZmR0Lmg+Cj4+ICAjaW5jbHVkZSA8c3RkaW8uaD4KPj4gICNpbmNsdWRlIDxzdGRsaWIu
aD4KPj4gKyNpbmNsdWRlIDxzdGRib29sLmg+Cj4+ICAKPj4gICNpbmNsdWRlICJrZXhlYy5oIgo+
PiAgI2luY2x1ZGUgImR0LW9wcy5oIgo+PiArI2luY2x1ZGUgIm1lbV9yZWdpb25zLmgiCj4KPiBB
cyBkdC1vcHMuYyB3aWxsIG5vdyB1c2Ugc3ltYm9scyB0aGF0IGFyZSBpbXBsZW1lbnRlZCBpbiBt
ZW1fcmVnaW9ucy5jCj4gd2hlbiB0aGUgZm9ybWVyIGlzIGNvbXBpbGVkIHRoZSBsYXR0ZXIgbm93
IG11c3QgYmUgY29tcGlsZWQgdG9vLgo+Cj4gSW4gcHJhY3RpY2UgaXQgaXMgb25seSBtaXBzIHdo
ZXJlIHRoYXQgaXMgbm90IHRoZSBjYXNlLgo+IEFuZCBJIGJlbGlldmUgdGhhdCBjYW4gYmUgYWRk
cmVzc2VkIGJ5IHNxdWFzaGluZyB0aGUgZm9sbG93aW5nIGludG8KPiB0aGlzIHBhdGNoLgo+Cj4g
ZGlmZiAtLWdpdCBhL2tleGVjL2FyY2gvbWlwcy9NYWtlZmlsZSBiL2tleGVjL2FyY2gvbWlwcy9N
YWtlZmlsZQo+IGluZGV4IDFmZTc4ODYwOGZiZS4uZmE4N2ZiZGI3ODk3IDEwMDY0NAo+IC0tLSBh
L2tleGVjL2FyY2gvbWlwcy9NYWtlZmlsZQo+ICsrKyBiL2tleGVjL2FyY2gvbWlwcy9NYWtlZmls
ZQo+IEBAIC0xMSw2ICsxMSw4IEBAIG1pcHNfRlMyRFRfSU5DTFVERSA9IFwKPiAgCS1pbmNsdWRl
ICQoc3JjZGlyKS9rZXhlYy9hcmNoL21pcHMvY3Jhc2hkdW1wLW1pcHMuaCBcCj4gIAktaW5jbHVk
ZSAkKHNyY2Rpcikva2V4ZWMvYXJjaC9taXBzL2tleGVjLW1pcHMuaAo+ICAKPiArbWlwc19NRU1f
UkVHSU9OUyA9IGtleGVjL21lbV9yZWdpb25zLmMKPiArCj4gIG1pcHNfRFRfT1BTICs9IGtleGVj
L2R0LW9wcy5jCj4gIAo+ICBpbmNsdWRlICQoc3JjZGlyKS9rZXhlYy9saWJmZHQvTWFrZWZpbGUu
bGliZmR0Cj4KPiBGVFIsIEkgYmVsaWV2ZSB0aGlzIGlzIHRoZSBzYW1lIG1lbV9yZWdpb25zX2Fs
bG9jX2FuZF9hZGQgaXNzdWUgdGhhdAo+IEkgZmxhZ2dlZCBpbiB0aGUgdGhyZWFkIFsyXS4KPgo+
IEFuZCBhdCB0aGUgbGluayBiZWxvdyB5b3UgY2FuIHNlZSBhIGJ1aWxkIGZhaWx1cmUgd2l0aCB0
aGlzIHBhdGNoLCBidXQgbm90Cj4gdGhlIGZpeCBhYm92ZSwgYXBwbGllZDoKPgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9ob3Jtcy9rZXhlYy10b29scy9hY3Rpb25zL3J1bnMvMTQ1OTEzODE2MzMvam9i
LzQwOTI3MjE5MjQzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
