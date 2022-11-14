Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25884C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJaHrwsEp3BnXAcWaSX/un6qF0guCrFNlYnS0V+CIUQ=; b=w8GkkStRr38ZmA
	kjayCCzL8IWGTYoQ8xfPezhLmJiP4fC5JpjWvZpFWepcVtrGvCxnipZq0kUay2oSVdKm1qjTMiyPG
	x2YKsgOlB1klNS4vZcjgWCF3q7a2W9a+DhuPcgWXvVAI25dcST4JZfqoQJzqCusp7L6j1SMSGr4rx
	XMZAuCD0Tmp5Yb6ULvKKd8eRLHTMKkXFr/MQfufyKGkMVb3Gs/QiLCU5rPvBV/Lj5YITrU3QMAZzN
	ih/konkjAxfi0fLc4b+JlVL6pKZWsivJnjvHGdsFEntg+s4H5uikgKA1Qapwo7siy85fCKLzXdEQC
	EnE1Minp5luVHRE7STNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouaaV-001nBc-54; Mon, 14 Nov 2022 14:37:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouaaS-001n7r-7S
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 14:37:25 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 63D1140002;
	Mon, 14 Nov 2022 14:37:10 +0000 (UTC)
Message-ID: <b82f4580-76a0-e02b-05c8-4a89e576da0c@ghiti.fr>
Date: Mon, 14 Nov 2022 15:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: mm: Proper page permissions after initmem free
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org
References: <20221112113543.3165646-1-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20221112113543.3165646-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_063724_438892_411D521A 
X-CRM114-Status: GOOD (  23.07  )
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

SGkgQmrDtnJuLAoKT24gMTIvMTEvMjAyMiAxMjozNSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBG
cm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiA2NC1iaXQgUklTQy1W
IGtlcm5lbHMgaGF2ZSB0aGUga2VybmVsIGltYWdlIG1hcHBlZCBzZXBhcmF0ZWx5LCBhbmQgaW4K
PiBhZGRpdGlvbiB0byB0aGUgbGluZWFyIG1hcC4gV2hlbiB0aGUga2VybmVsIGlzIGxvYWRlZCwg
dGhlIGxpbmVhciBtYXAKPiBvZiBrZXJuZWwgaW1hZ2UgaXMgc2V0IHRvIFBBR0VfUkVBRCBwZXJt
aXNzaW9uLCBhbmQgdGhlIGtlcm5lbCBtYXAgaXMKPiBzZXQgdG8gUEFHRV9SRUFEIGFuZCBQQUdF
X0VYRUMuCj4KPiBXaGVuIHRoZSBpbml0bWVtIGlzIGZyZWVkLCB0aGUgY29ycmVzcG9uZGluZyBw
YWdlcyBpbiB0aGUgbGluZWFyIG1hcAo+IHNob3VsZCBiZSByZXN0b3JlZCB0byBQQUdFX1JFQUQg
YW5kIFBBR0VfV1JJVEUuIFRoZSBjb3JyZXNwb25kaW5nCj4gcGFnZXMgaW4gdGhlIGtlcm5lbCBt
YXAgc2hvdWxkIGFsc28gYmUgcmVzdG9yZWQgdG8gUEFHRV9SRUFEIGFuZAo+IFBBR0VfV1JJVEUs
IGJ5IHJlbW92aW5nIHRoZSBQQUdFX0VYRUMgcGVybWlzc2lvbiwgYW5kIGFkZGluZwo+IFBBR0Vf
V1JJVEUuCj4KPiBUaGlzIGlzIG5vdCB0aGUgY2FzZS4gRm9yIDY0LWJpdCBrZXJuZWxzLCBvbmx5
IHRoZSBsaW5lYXIgbWFwIGlzCj4gcmVzdG9yZWQgdG8gaXRzIHByb3BlciBwYWdlIHBlcm1pc3Np
b25zIGF0IGluaXRtZW0gZnJlZSwgYW5kIG5vdCB0aGUKPiBrZXJuZWxtYXAuCj4KPiBJbiBwcmFj
dGlzZSB0aGlzIHJlc3VsdHMgaW4gdGhhdCB0aGUga2VybmVsIGNhbiBwb3RlbnRpYWxseSBqdW1w
IHRvCj4gZGVhZCBfX2luaXQgY29kZSwgYW5kIHN0YXJ0IGV4ZWN1dGluZyBpbnZhbGlkIDB4Y2Mg
aW5zdHJ1Y3Rpb25zLAo+IHdpdGhvdXQgZ2V0dGluZyBhbiBleGNlcHRpb24uCj4KPiBSZXN0b3Jl
IHRoZSBmcmVlZCBpbml0bWVtIHByb3Blcmx5LCBieSBzZXR0aW5nIGJvdGggdGhlIGFsaWFzIChr
ZXJuZWwKPiBtYXApIGFuZCB0aGUgbGluZWFyIG1hcCB0byB0aGUgY29ycmVjdCBwZXJtaXNzaW9u
cy4KPgo+IEZpeGVzOiBlNWMzNWZhMDQwMTkgKCJyaXNjdjogTWFwIHRoZSBrZXJuZWwgd2l0aCBj
b3JyZWN0IHBlcm1pc3Npb25zIHRoZSBmaXJzdCB0aW1lIikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jIHwgMTAgKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
ZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IGluZGV4IGFkNzZiYjU5YjA1OS4u
MzYxZTYzNTA3MGZlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gQEAgLTMyMSwxMCArMzIxLDEyIEBAIHN1
YnN5c19pbml0Y2FsbCh0b3BvbG9neV9pbml0KTsKPiAgIAo+ICAgdm9pZCBmcmVlX2luaXRtZW0o
dm9pZCkKPiAgIHsKPiAtCWlmIChJU19FTkFCTEVEKENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCkp
Cj4gLQkJc2V0X2tlcm5lbF9tZW1vcnkobG1fYWxpYXMoX19pbml0X2JlZ2luKSwgbG1fYWxpYXMo
X19pbml0X2VuZCksCj4gLQkJCQkgIElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSA/Cj4gLQkJCQkJ
c2V0X21lbW9yeV9ydyA6IHNldF9tZW1vcnlfcndfbngpOwo+ICsJaWYgKElTX0VOQUJMRUQoQ09O
RklHX1NUUklDVF9LRVJORUxfUldYKSkgewo+ICsJCWlmIChJU19FTkFCTEVEKENPTkZJR182NEJJ
VCkpCj4gKwkJCXNldF9rZXJuZWxfbWVtb3J5KGxtX2FsaWFzKF9faW5pdF9iZWdpbiksIGxtX2Fs
aWFzKF9faW5pdF9lbmQpLAo+ICsJCQkJCSAgc2V0X21lbW9yeV9ydyk7Cj4gKwkJc2V0X2tlcm5l
bF9tZW1vcnkoX19pbml0X2JlZ2luLCBfX2luaXRfZW5kLCBzZXRfbWVtb3J5X3J3X254KTsKCgpU
aGF0J3Mgbml0cyBidXQgZm9yIDY0LWJpdCBrZXJuZWxzLCBkbyB3ZSByZWFsbHkgd2FudCB0byBt
YWtlIHRoZSBrZXJuZWwgCm1hcHBpbmcgd3JpdGFibGU/IEkgdGhpbmsgY2F0Y2hpbmcgYSB3cml0
ZSBhY2Nlc3MgaGVyZSB3b3VsZCBiZSBiZXR0ZXIgCmJlY2F1c2UgSU1PIHRoYXQgc2hvdWxkIG5v
dCBoYXBwZW4uCgpUaGFua3MsCgpBbGV4CgoKPiArCX0KPiAgIAo+ICAgCWZyZWVfaW5pdG1lbV9k
ZWZhdWx0KFBPSVNPTl9GUkVFX0lOSVRNRU0pOwo+ICAgfQo+Cj4gYmFzZS1jb21taXQ6IDQ0MmJj
YmZkMmM1NDAxNTg3Yjk4M2UzNGJlZDBiNDA3MjE0NzM1YzMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
