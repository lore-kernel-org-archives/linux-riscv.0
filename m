Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A200FCD11C2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ccDjSzO/IU4UZK2etnUvqjHI6y5IpvLcRQdMvF9944=; b=oqhr0Ubeeu744V
	Idj1Ck/Ki0QtLIPTkDCSJRE36LR50g7CSroCGLYIin9e574rhOR7L1/9UebuPfMMzjQKaKFYUDg/X
	8JyGMosVpYBUEmI8MBmUsc/gyEP1gQsfamx5wWOCaY/BC/TUx8yr/tYvqTlRVJbrvRC1SYFq5UTM+
	ciLSAs8JPuQvzrIrIuQBGs1lMgHR4vfmMCp21mG/ABfXdqeT+2A6s7Y/Q+UKCRL41714w2IpmeCpI
	C8tlrnslsZOpdKfNT6JAykQl9Exf+pD5tI6StR10fh9AFqKC9re1aGYYAf3/VugTMsXNC1xOnkni8
	47D7iXjV45EiDdzRjlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rman8-0000000D1gs-1ZKI;
	Tue, 19 Mar 2024 14:50:14 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rman4-0000000D1fw-0y6k
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 14:50:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D4E8240003;
	Tue, 19 Mar 2024 14:50:01 +0000 (UTC)
Message-ID: <79b47f1d-8332-476c-b827-28043d7b3b76@ghiti.fr>
Date: Tue, 19 Mar 2024 15:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel
 preemption for RISC-V
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: Evgenii Shatokhin <e.shatokhin@yadro.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, ardb@kernel.org, greentime.hu@sifive.com,
 zong.li@sifive.com, guoren@kernel.org, Jessica Clarke <jrtc27@jrtc27.com>,
 kernel@esmil.dk, linux-riscv@lists.infradead.org, linux@yadro.com,
 Samuel Holland <samuel.holland@sifive.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <4fe4567b-96be-4102-952b-7d39109b2186@yadro.com>
 <CABgGipUGCVjy5wG1TMDpgf1Zn7Jcx5Lg1CUzQ0YLr5nOPf-TUg@mail.gmail.com>
 <51f21b87-ebed-4411-afbc-c00d3dea2bab@yadro.com>
 <bd7c2263-4e81-4be6-af4d-22a0842ba2e4@ghiti.fr>
 <CABgGipUtzLG2tffXOdV7-7ss+_doQvjxfwzVbfzyO56J3_3X0Q@mail.gmail.com>
 <f4506e4f-fca5-49ac-868e-f42f1f23ce9b@ghiti.fr>
 <c1d994e2-8f0c-4039-b790-a426fc48055c@sifive.com>
 <CABgGipX_WuB5pZ4xgLcBZF7WpHmt_J9m48k+7n-UwH-jUtXJ1A@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CABgGipX_WuB5pZ4xgLcBZF7WpHmt_J9m48k+7n-UwH-jUtXJ1A@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_075010_579523_2A04E5D6 
X-CRM114-Status: GOOD (  28.41  )
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

T24gMTEvMDMvMjAyNCAxNToyNCwgQW5keSBDaGl1IHdyb3RlOgo+IE9uIFRodSwgTWFyIDcsIDIw
MjQgYXQgMTE6NTfigK9QTSBTYW11ZWwgSG9sbGFuZAo+IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPiB3cm90ZToKPj4gSGkgQWxleCwKPj4KPj4gT24gMjAyNC0wMy0wNyA3OjIxIEFNLCBBbGV4
YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBCdXQgVEJILCBJIGhhdmUgc3RhcnRlZCB0aGlua2luZyBh
Ym91dCB0aGUgaXNzdWUgeW91ciBwYXRjaCBpcyB0cnlpbmcgdG8gZGVhbAo+Pj4gd2l0aC4gSUlV
QyB5b3UncmUgdHJ5aW5nIHRvIGF2b2lkIHRyYXBzIChvciBzaWxlbnQgZXJyb3JzKSB0aGF0IGNv
dWxkIGhhcHBlbgo+Pj4gYmVjYXVzZSBvZiBjb25jdXJyZW50IGFjY2Vzc2VzIHdoZW4gcGF0Y2hp
bmcgaXMgaGFwcGVuaW5nIG9uIGEgcGFpciBhdWlwYy9qYXJsLgo+Pj4KPj4+IEknbSB3b25kZXJp
bmcgaWYgaW5zdGVhZCwgd2UgY291bGQgbm90IGFjdHVhbGx5IGhhbmRsZSB0aGUgcG90ZW50aWFs
IHRyYXBzOgo+Pj4gYmVmb3JlIHN0b3JpbmcgdGhlIGF1aXBjICsgamFsciBwYWlyLCB3ZSBjb3Vs
ZCB1c2UgYSB3ZWxsLWlkZW50aWZpZWQgdHJhcHBpbmcKPj4+IGluc3RydWN0aW9uIHRoYXQgY291
bGQgYmUgcmVjb2duaXplZCBpbiB0aGUgdHJhcCBoYW5kbGVyIGFzIGEgbGVnaXRpbWF0ZSB0cmFw
Lgo+Pj4gRm9yIGV4YW1wbGU6Cj4+Pgo+Pj4KPj4+IGF1aXBjICAtLT4gIGF1aXBjICAtLT4gIFhY
WFggIC0tPiAgWFhYWCAgLS0+ICBhdWlwYwo+Pj4gamFsciAgICAgICAgWFhYWCAgICAgICAgWFhY
WCAgICAgICBqYWxyICAgICAgIGphbHIKPj4+Cj4+Pgo+Pj4gSWYgYSBjb3JlIHRyYXBzIG9uIGEg
WFhYWCBpbnN0cnVjdGlvbiwgd2Uga25vdyB0aGlzIGFkZHJlc3MgaXMgYmVpbmcgcGF0Y2hlZCwg
c28KPj4+IHdlIGNhbiByZXR1cm4gYW5kIHByb2JhYmx5IHRoZSBwYXRjaGluZyB3aWxsIGJlIG92
ZXIuIFdlIGNvdWxkIGFsc28gaWRlbnRpZnkKPj4+IGhhbGYgcGF0Y2hlZCB3b3JkIGluc3RydWN0
aW9uIChJIG1lYW4gd2l0aCBvbmx5IFhYKS4KPj4gVW5mb3J0dW5hdGVseSB0aGlzIGRvZXMgbm90
IHdvcmsgd2l0aG91dCBzb21lIGZlbmNlLmkgaW4gdGhlIG1pZGRsZS4gVGhlCj4+IHByb2Nlc3Nv
ciBpcyBmcmVlIHRvIGZldGNoIGFueSBpbnN0cnVjdGlvbiB0aGF0IGhhcyBiZWVuIHdyaXR0ZW4g
dG8gYSBsb2NhdGlvbgo+PiBzaW5jZSB0aGUgbGFzdCBmZW5jZS5pIGluc3RydWN0aW9uLiBTbyBp
dCB3b3VsZCBiZSBwZXJmZWN0bHkgdmFsaWQgdG8gZmV0Y2ggdGhlCj4+IG9sZCBhaXVwYyBhbmQg
bmV3IGphbHIgb3IgdmljZSB2ZXJzYSBhbmQgbm90IHRyYXAuIFRoaXMgd291bGQgaGFwcGVuIGlm
LCBmb3IKPj4gZXhhbXBsZSwgdGhlIHR3byBpbnN0cnVjdGlvbnMgd2VyZSBpbiBkaWZmZXJlbnQg
Y2FjaGUgbGluZXMsIGFuZCBvbmx5IG9uZSBvZiB0aGUKPj4gY2FjaGUgbGluZXMgZ290IGV2aWN0
ZWQgYW5kIHJlZmlsbGVkLgo+Pgo+PiBCdXQgc2VuZGluZyBhbiBJUEkgdG8gcnVuIHRoZSBmZW5j
ZS5pIHByb2JhYmx5IG5lZ2F0ZXMgdGhlIHBlcmZvcm1hbmNlIGJlbmVmaXQuCj4gTWF5YmUgc29t
ZXRoaW5nIGxpa2UgeDg2LCB3ZSBjYW4gaG9vayBmdHJhY2VfcmVwbGFjZV9jb2RlKCkgb3V0IGFu
ZAo+IGJhdGNoIHNlbmQgSVBJcyB0byBwcmV2ZW50IHN0b3JtcyBvZiByZW1vdGUgZmVuY2VzLiBU
aGUgc29sdXRpb24gQWxleAo+IHByb3Bvc2VkIGNhbiBzYXZlIHRoZSBjb2RlIHNpemUgZm9yIGZ1
bmN0aW9uIGVudHJpZXMuIEJ1dCB3ZSBoYXZlIHRvCj4gc2VuZCBvdXQgcmVtb3RlIGZlbmNlcyBh
dCBlYWNoICItLT4iIHRyYW5zaXRpb24sIHdoaWNoIGlzIDQgc2V0cyBvZgo+IHJlbW90ZSBJUElz
LiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhpcyBzZXJpZXMgaW5jcmVhc2VzIHRoZSBwZXItZnVuY3Rp
b24KPiBwYXRjaCBzaXplIHRvIDI0IGJ5dGVzLiBIb3dldmVyLCBpdCBkZWNyZWFzZXMgdGhlIG51
bWJlciBvZiByZW1vdGUKPiBmZW5jZXMgdG8gMSBzZXQuCj4KPiBUaGUgcGVyZm9ybWFuY2UgaGl0
IGNvdWxkIGJlIG9ic2VydmFibGUgZm9yIHRoZSBhdWlwYyArIGphbHIgY2FzZSwKPiBiZWNhdXNl
IGFsbCByZW1vdGUgY29yZXMgd2lsbCBiZSBleGVjdXRpbmcgb24gWFhYWCBpbnN0cnVjdGlvbnMg
YW5kCj4gdGFrZSBhIHRyYXAgYXQgZWFjaCBmdW5jdGlvbiBlbnRyeSBkdXJpbmcgY29kZSBwYXRj
aGluZy4KPgo+IEJlc2lkZXMsIHRoaXMgc2VyaWVzIHdvdWxkIGdpdmUgdXMgYSBjaGFuY2Ugbm90
IHRvIHNlbmQgYW55IHJlbW90ZQo+IGZlbmNlcyBpZiB3ZSB3ZXJlIHRvIGNoYW5nZSBvbmx5IHRo
ZSBkZXN0aW5hdGlvbiBvZiBmdHJhY2UgKGUuZy4gdG8gYQo+IGN1c3RvbSBmdHJhY2UgdHJhbXBv
bGluZSkuIEFzIGl0IHdvdWxkIGJlIGEgcmVndWxhciBzdG9yZSBmb3IgdGhlCj4gd3JpdGVyIGFu
ZCByZWd1bGFyIGxvYWQgZm9yIHJlYWRlcnMsIG9ubHkgZmVuY2Ugdyx3IGlzIG5lZWRlZC4KPiBI
b3dldmVyLCBJIGFtIG5vdCB2ZXJ5IGNlcnRhaW4gb24gaG93IG9mdGVuIHdvdWxkIGJlIGZvciB0
aGlzCj4gcGFydGljdWxhciB1c2UgY2FzZS4gSSdkIG5lZWQgc29tZSB0aW1lIHRvIGludmVzdGln
YXRlIGl0Lgo+Cj4+IE1heWJlIHRoZXJlIGlzIHNvbWUgY3JlYXRpdmUgd2F5IHRvIG92ZXJjb21l
IHRoaXMuCj4+Cj4+PiBCdXQgcGxlYXNlIGxldCBtZSBrbm93IGlmIHRoYXQncyBjb21wbGV0ZWx5
IHN0dXBpZCBhbmQgSSBkaWQgbm90IHVuZGVyc3RhbmQgdGhlCj4+PiBwcm9ibGVtLCBzaW5jZSBt
eSBwYXRjaHNldCB0byBzdXBwb3J0IHN2dnB0YywgSSBhbSB3b25kZXJpbmcgaWYgaXQgaXMgbm90
IG1vcmUKPj4+IHBlcmZvcm1hbnQgdG8gYWN0dWFsbHkgdGFrZSB2ZXJ5IHVubGlrZWx5IHRyYXBz
IGluc3RlYWQgb2YgdHJ5aW5nIHRvIGF2b2lkIHRoZW0uCj4+IEkgYWdyZWUgaW4gZ2VuZXJhbCBp
dCBpcyBhIGdvb2QgaWRlYSB0byBvcHRpbWl6ZSB0aGUgaG90IHBhdGggbGlrZSB0aGlzLgo+Pgo+
PiBSZWdhcmRzLAo+PiBTYW11ZWwKPj4KPiBSZWdhcmRzLAo+IEFuZHkKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpTbyBpbmRlZWQgbXkg
c29sdXRpb24gd2FzIHdheSB0b28gbmFpdmUgYW5kIHdlJ3ZlIGJlZW4gZGlzY3Vzc2luZyB0aGF0
IAp3aXRoIEJqw7ZybiBsYXRlbHkuIEhlIHdvcmtlZCBhIGxvdCBvbiB0aGF0IGFuZCBjYW1lIHVw
IHdpdGggdGhlIHNvbHV0aW9uIApoZSBwcm9wb3NlZCBoZXJlIApodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi84N3pmdjBvbnJlLmZzZkBhbGwueW91ci5iYXNlLmFyZS5iZWxvbmcu
dG8udXMvCgpUaGUgdGhpbmcgaXMgZnRyYWNlIHNlZW1zIHRvIGJlIHF1aXRlIGJyb2tlbiBhcyB0
aGUgZnRyYWNlIGtzZWxmdGVzdHMgCnJhaXNlIGEgbG90IG9mIGlzc3VlcyB3aGljaCBJIGhhdmUg
c3RhcnRlZCB0byBkZWJ1ZyBidXQgYXJlIG5vdCB0aGF0IAplYXN5LCBzbyB3ZSBhcmUgd29uZGVy
aW5nIGlmICpzb21lb25lKiBzaG91bGQgbm90IHdvcmsgb24gQmpvcm4ncyAKc29sdXRpb24gKG9y
IGFub3RoZXIsIG9wZW4gdG8gZGlzY3Vzc2lvbnMpIGZvciA2LjEwLiBAQW5keSBXRFlUPyBEbyB5
b3UgCmhhdmUgZnJlZSBjeWNsZXM/IEJqw7ZybiBjb3VsZCB3b3JrIG9uIHRoYXQgdG9vIChhbmQg
SSdsbCBoZWxwIGlmIG5lZWRlZCkuCgpMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluayEKCkFsZXgK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
