Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B0C636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaN2buK7oQnGtKslzevZr5ncmT9C1NdtnzJBm0glzbU=; b=BcVsoo6IFEaCE1
	clIEnbuKKsxW0VXm0p33kcec8p0MXgse4UQtjESaEvUX99puF6e4nofa05jO8IUK7CyKQL6mgt4IY
	6erVGQZALpQm3QRG57b28zRx6HCQwVCwcFPif+5gjCs3M8zZKEnmrbD+JhHBmVCdGmF+4bSZcz9T1
	/j2qXL7hSjU3ybfb97RaplDglPXLydc8ZjSBMCQiKks/C9xZpnwdlydT+8IqowSsKLGBp7n87M3Fs
	AB/WPj29qJKi5lOietIwRP42vyxTTMImgpOeH1N2Z/uiCbEqq9SwMJaBSOVaaSm3LIsfn6hYrbqd3
	EBrHNErSXByH9u1BQRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCcj-0030nS-UQ; Thu, 09 Feb 2023 19:30:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCcg-0030lf-I6
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 19:30:24 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 0D99440008;
	Thu,  9 Feb 2023 19:30:13 +0000 (UTC)
Message-ID: <7ae60bca-5cc0-6cc6-f68a-b48c0b43388b@ghiti.fr>
Date: Thu, 9 Feb 2023 20:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, macro@orcam.me.uk,
 david.abdurachmanov@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-9e6b4607-6bea-411c-b843-916c1e0798ee@palmerdabbelt-glaptop>
 <182c1d4e-a117-79d6-4dd1-8e3c8a447b4a@ghiti.fr>
 <CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com>
 <CACT4Y+Y1s2iE3OF8WHwb7F2crRjgnFCWQfoFvs3d-KgHpMLeKg@mail.gmail.com>
Content-Language: fr
From: Alex Ghiti <alex@ghiti.fr>
In-Reply-To: <CACT4Y+Y1s2iE3OF8WHwb7F2crRjgnFCWQfoFvs3d-KgHpMLeKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_113022_903757_9AC0D4A3 
X-CRM114-Status: GOOD (  23.85  )
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

TGUgOS8wMi8yMDIzIMOgIDEyOjM3LCBEbWl0cnkgVnl1a292IGEgw6ljcml0wqA6Cj4gT24gVGh1
LCAxMCBOb3YgMjAyMiBhdCAyMjowMSwgRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29t
PiB3cm90ZToKPj4KPj4gT24gTW9uLCAyMSBKdW4gMjAyMSBhdCAwMDoxMSwgQWxleCBHaGl0aSA8
YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4+Pgo+Pj4gSGkgUGFsbWVyLAo+Pj4KPj4+IExlIDIzLzA0
LzIwMjEgw6AgMDQ6NTcsIFBhbG1lciBEYWJiZWx0IGEgw6ljcml0IDoKPj4+PiBPbiBGcmksIDAy
IEFwciAyMDIxIDExOjMzOjMwIFBEVCAoLTA3MDApLCBtYWNyb0BvcmNhbS5tZS51ayB3cm90ZToK
Pj4+Pj4gT24gRnJpLCAyIEFwciAyMDIxLCBEYXZpZCBBYmR1cmFjaG1hbm92IHdyb3RlOgo+Pj4+
Pgo+Pj4+Pj4+Pj4gICBUaGlzIG1hY3JvIGlzIGV4cG9ydGVkIGFzIGEgcGFydCBvZiB0aGUgdXNl
ciBBUEkgc28gaXQgbXVzdAo+Pj4+Pj4gbm90IGRlcGVuZCBvbgo+Pj4+Pj4+Pj4gS2NvbmZpZy4g
IEFsc28gY2hhbmdpbmcgaXQgKHJhdGhlciB0aGFuIHNheSBhZGRpbmcKPj4+Pj4+IENPTU1BTkRf
TElORV9TSVpFX1YyIG9yCj4+Pj4+Pj4+PiBzd2l0Y2hpbmcgdG8gYW4gZW50aXJlbHkgbmV3IGRh
dGEgb2JqZWN0IHRoYXQgaGFzIGl0cyBkaW1lbnNpb24KPj4+Pj4+IHNldCBpbiBhCj4+Pj4+Pj4+
PiBkaWZmZXJlbnQgd2F5KSByZXF1aXJlcyBjYXJlZnVsIGV2YWx1YXRpb24gYXMgZXh0ZXJuYWwg
YmluYXJpZXMKPj4+Pj4+IGhhdmUgYW5kCj4+Pj4+Pj4+PiB3aWxsIGhhdmUgdGhlIHZhbHVlIGl0
IGV4cGFuZHMgdG8gY29tcGlsZWQgaW4sIHNvIGl0J3MgYSBwYXJ0Cj4+Pj4+PiBvZiB0aGUgQUJJ
Cj4+Pj4+Pj4+PiB0b28uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoYW5rcywgSSBkaWRuJ3QgcmVhbGl6
ZSB0aGlzIHdhcyBwYXJ0IG9mIHRoZSB1c2VyIEJJLiAgSW4gdGhhdAo+Pj4+Pj4gY2FzZSB3ZQo+
Pj4+Pj4+PiByZWFsbHkgY2FuJ3QgY2hhZ2UgaXQsIHNvIHdlJ2xsIGhhdmUgdG8gc29ydCBvdXQg
c29tZSBvdGhlciB3YXkKPj4+Pj4+IGRvIGZpeAo+Pj4+Pj4+PiB3aGF0ZXZlciBpcyBnb2luZyBv
bi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSd2ZSBkcm9wcGVkIHRoaXMgZnJvbSBmaXhlcy4KPj4+Pj4+
Pgo+Pj4+Pj4+IERvZXMgaW5jcmVhc2luZyBDT01NQU5EX0xJTkVfU0laRSBicmVhayB1c2VyLXNw
YWNlIGJpbmFyaWVzPyBJIHdvdWxkCj4+Pj4+Pj4gZXhwZWN0IGl0IHRvIHdvcmsgdGhlIHNhbWUg
d2F5IGFzIGFkZGluZyBuZXcgZW51bSB2YWx1ZXMsIG9yIGFkZGluZwo+Pj4+Pj4+IGZpZWxkcyBh
dCB0aGUgZW5kIG9mIHZlcnNpb25lZCBzdHJ1Y3RzLCBldGMuCj4+Pj4+Pj4gSSB3b3VsZCBhc3N1
bWUgdGhlIG9sZCBib290bG9hZGVycy9ldGMgd2lsbCBvbmx5IHN1cHBvcnQgdXAgdG8gdGhlCj4+
Pj4+Pj4gb2xkLCBzbWFsbGVyIG1heCBjb21tYW5kIGxpbmUgc2l6ZSwgd2hpbGUgdGhlIGtlcm5l
bCB3aWxsIHN1cHBvcnQKPj4+Pj4+PiBsYXJnZXIgY29tbWFuZCBsaW5lIHNpemUsIHdoaWNoIGlz
IGZpbmUuCj4+Pj4+Pj4gSG93ZXZlciwgaWYgc29tZXRoaW5nIGNvcGllcyAvcHJvYy9jbWRsaW5l
IGludG8gYSBmaXhlZC1zaXplIGJ1ZmZlcgo+Pj4+Pj4+IGFuZCBleHBlY3RzIHRoYXQgdG8gd29y
aywgdGhhdCB3aWxsIGJyZWFrLi4uIHRoYXQncyBxdWl0ZSB1bmZvcnR1bmF0ZQo+Pj4+Pj4+IHVz
ZXItc3BhY2UgY29kZS4uLiBpcyBpdCB3aGF0IHdlIGFmcmFpZCBvZj8KPj4+Pj4+Pgo+Pj4+Pj4+
IEFsdGVybmF0aXZlbHksIGNvdWxkIGV4cG9zZSB0aGUgc2FtZSBDT01NQU5EX0xJTkVfU0laRSwg
YnV0IGludGVybmFsbHkKPj4+Pj4+PiBzdXBwb3J0IGEgbGFyZ2VyIGNvbW1hbmQgbGluZT8KPj4+
Pj4+Cj4+Pj4+PiBMb29raW5nIGF0IGtlcm5lbCBjb21taXQgaGlzdG9yeSBJIHNlZSBQb3dlclBD
IHN3aXRjaGVkIGZyb20gNTEyIHRvCj4+Pj4+PiAyMDQ4LCBhbmQgSSBkb24ndCBzZWUgY29tcGxh
aW50cyBhYm91dCB0aGUgQUJJIG9uIHRoZSBtYWlsaW5nIGxpc3QuCj4+Pj4+Pgo+Pj4+Pj4gSWYg
Q09NTUFORF9MSU5FX1NJWkUgaXMgdXNlZCBieSB1c2VyIHNwYWNlIGFwcGxpY2F0aW9ucyBhbmQg
d2UKPj4+Pj4+IGluY3JlYXNlIGl0IHRoZXJlIHNob3VsZG4ndCBiZSBwcm9ibGVtcy4gSSB3b3Vs
ZCBleHBlY3QgdGhpbmdzIHRvCj4+Pj4+PiB3b3JrLCBidXQganVzdCBnZXQgdHJ1bmNhdGVkIGJv
b3QgYXJncz8gVGhhdCBpcyB0aGUgYXBwbGljYXRpb24gd2lsbAo+Pj4+Pj4gY29udGludWUgb25s
eSB0byBsb29rIGF0IHRoZSBpbml0aWFsIDUxMiBjaGFycy4KPj4+Pj4KPj4+Pj4gICBUaGUgbWFj
cm8gaXMgaW4gYW4gaW5jbHVkZS91YXBpIGhlYWRlciwgc28gaXQncyBleHBvcnRlZCB0byB0aGUg
dXNlcmxhbmQKPj4+Pj4gYW5kIGEgcGFydCBvZiB0aGUgdXNlciBBUEkuICBJIGRvbid0IGtub3cg
d2hhdCB0aGUgY29uc2VxdWVuY2VzIGFyZSBmb3IKPj4+Pj4gdGhlIFJJU0MtViBwb3J0IHNwZWNp
ZmljYWxseSwgYnV0IGl0IGhhcyByYWlzZWQgbXkgYXR0ZW50aW9uLCBhbmQgSSB0aGluawo+Pj4+
PiBpdCBoYXMgdG8gYmUgaW52ZXN0aWdhdGVkLgo+Pj4+Pgo+Pj4+PiAgIFBlcmhhcHMgaXQncyBP
SyB0byBjaGFuZ2UgaXQgYWZ0ZXIgYWxsLCBidXQgeW91J2QgaGF2ZSB0byBnbyB0aHJvdWdoCj4+
Pj4+IGtub3duL3BvdGVudGlhbCB1c2VycyBvZiB0aGlzIG1hY3JvLiAgSSBndWVzcyB0aGVyZSBz
aG91bGRuJ3QgYmUgdGhhdAo+Pj4+PiBtYW55Cj4+Pj4+IG9mIHRoZW0uCj4+Pj4+Cj4+Pj4+ICAg
SW4gYW55IGNhc2UgaXQgY2Fubm90IGRlcGVuZCBvbiBLY29uZmlnLCBiZWNhdXNlIHRoZSB1c2Vy
bGFuZCB3b24ndCBoYXZlCj4+Pj4+IGFjY2VzcyB0byB0aGUgY29uZmlndXJhdGlvbiwgYW5kIHRo
ZW4gcHJlc3VtYWJseSB3YW50cyB0byBoYW5kbGUgYW55IGFuZAo+Pj4+PiBhbGwuCj4+Pj4KPj4+
PiBJdCBraW5kIG9mIGZlZWxzIHRvIG1lIGxpa2UgQ09NTUFORF9MSU5FX1NJWkUgc2hvdWxkbid0
IGhhdmUgYmVlbiBwYXJ0Cj4+Pj4gb2YgdGhlIFVBQkkgdG8gYmVnaW4gd2l0aC4gIEkgc2VudCBh
IHBhdGNoIHRvIHJlbW92ZSBpdCBmcm9tIHRoZQo+Pj4+IGFzbS1nZW5lcmljIFVBQkksIGxldCdz
IHNlZSBpZiBhbnlvbmUga25vd3Mgb2YgYSByZWFzb24gaXQgc2hvdWxkIGJlIFVBQkk6Cj4+Pj4K
Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcmNoLzIwMjEwNDIzMDI1NTQ1LjMx
Mzk2NS0xLXBhbG1lckBkYWJiZWx0LmNvbS9ULyN1Cj4+Pgo+Pj4gQXJuZCBzZWVtZWQgdG8gYWdy
ZWUgd2l0aCB5b3UgYWJvdXQgcmVtb3ZpbmcgQ09NTUFORF9MSU5FX1NJWkUgZnJvbSB0aGUKPj4+
IFVBQkksIGFueSBwcm9ncmVzcyBvbiB5b3VyIHNpZGU/Cj4+Cj4+IFdhcyB0aGlzIGV2ZXIgbWVy
Z2VkPyBEb24ndCBzZWUgdGhpcyBldmVuIGluIGxpbnV4LW5leHQuCj4gCj4gUGluZy4gU3RpbGwg
YW4gaXNzdWUgYXQgbGVhc3QgZm9yIHN5emJvdC4KClllcywgYWdyZWVkLCBQYWxtZXIgcHJvcG9z
ZWQgdGhlIGZvbGxvd2luZyBpbnN0ZWFkIHNpbmNlIGJsaW5kbHkgCmluY3JlYXNpbmcgdGhlIGNv
bW1hbmQgbGluZSBzaXplIHdvdWxkIGJyZWFrIHVzZXJzcGFjZSBBQkk6IApodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzIwMjIxMjExMDYxMzU4LjI4MDM1LTEtcGFsbWVyQHJpdm9zaW5jLmNv
bS9ULwoKSSB3aWxsIGJ1bXAgdGhpcyB0aHJlYWQgdG8gbWFrZSBwcm9ncmVzcywgdGhhbmtzIGZv
ciB0aGUgcGluZy4KCkFsZXgKCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
