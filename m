Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17EEC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onvElIy3MX5eRUTctL/8LO6lkqdvOYK6GON5EtrArmA=; b=Qsuk2kBntDzNkG
	wUX6ohLDk2mYn/l7OSIJx6HGEelDSwhMx212u8sku88LhLi9UH4WxkiZv5NJ+Z+iJzVoxZsZq3tuz
	QJmhe/4AbVY9VwG6cSdrKO0EDaADU4FyO6P154oVH8SDBvZcToxbBXJ9v4lQyIepKIMkb+BTrigl2
	T/sOFxA+5NvxXnypJjb/HjfsCfyVhs9m5bXZ2zxyTO6/PI/QMOnE1OWeq6QGHAm2l0jq9es2KJMiQ
	CO4RCxksttpr3fj50ckOSXu7ePbB5livXhjDkuzocRAw0gIZESmbOP01T8jOynlQN9/1RIyzMpUIi
	HxV6o7UtfDZ9gniGTJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVYNX-003mvh-Ck; Sat, 19 Mar 2022 12:40:19 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVYNT-003mv8-Ms
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 12:40:17 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nVYNP-0001Oy-P6; Sat, 19 Mar 2022 12:40:11 +0000
Message-ID: <9cc22be4-abba-ef75-a340-af7afb08f480@codethink.co.uk>
Date: Sat, 19 Mar 2022 12:40:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [V3] PCI: fu740: Drop to 2.5GT/s to fix initial device probing on
 some boards
Content-Language: en-GB
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, bhelgaas@google.com, robh@kernel.org,
 lorenzo.pieralisi@arm.com, greentime.hu@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <mhng-0c8e7e26-5480-4573-b7f6-27b09f06de59@palmer-ri-x1c9>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <mhng-0c8e7e26-5480-4573-b7f6-27b09f06de59@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_054015_776448_B9D9B46B 
X-CRM114-Status: GOOD (  30.11  )
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

T24gMTgvMDMvMjAyMiAyMzowMywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gRnJpLCAxOCBN
YXIgMjAyMiAwODoyNDozMCBQRFQgKC0wNzAwKSwgYmVuLmRvb2tzQGNvZGV0aGluay5jby51ayB3
cm90ZToKPj4gVGhlIGZ1NzQwIFBDSWUgY29yZSBkb2VzIG5vdCBwcm9iZSBhbnkgZGV2aWNlcyBv
biB0aGUgU2lGaXZlIFVubWF0Y2hlZAo+PiBib2FyZCB3aXRob3V0IHRoaXMgZml4IChvciBoYXZp
bmcgVS1Cb290IGV4cGxpY2l0bHkgc3RhcnQgdGhlIFBDSWUgdmlhCj4+IGVpdGhlciBib290LXNj
cmlwdCBvciB1c2VyIGNvbW1hbmQpLiBUaGUgZml4IGlzIHRvIHN0YXJ0IHRoZSBsaW5rIGF0Cj4+
IDIuNUdUL3Mgc3BlZWRzIGFuZCBvbmNlIHRoZSBsaW5rIGlzIHVwIHRoZW4gY2hhbmdlIHRoZSBt
YXhpbXVtIHNwZWVkIGJhY2sKPj4gdG8gdGhlIGRlZmF1bHQuCj4+Cj4+IFRoZSBVLUJvb3QgZHJp
dmVyIGNsYWltcyB0byBzZXQgdGhlIGxpbmstc3BlZWQgdG8gMi41R1QvcyB0byBnZXQgdGhlIAo+
PiBwcm9iZQo+PiB0byB3b3JrIChhbmQgVS1Cb290IGRvZXMgcHJpbnQgbGluayB1cCBhdCAyLjVH
VC9zKSBpbiB0aGUgZm9sbG93aW5nIGNvZGU6Cj4+IGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1i
b290L3UtYm9vdC8tL2Jsb2IvbWFzdGVyL2RyaXZlcnMvcGNpL3BjaWVfZHdfc2lmaXZlLmM/aWQ9
djIwMjIuMDEjTDI3MSAKPj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9v
a3NAY29kZXRoaW5rLmNvLnVrPgo+PiAtLSAKPiAKPiBBICItLSIgdHJpZ2dlcnMgc29tZSBtYWls
IGhhbmRsZXMgdG8gdGhpbmsgdGhlIHJlc3Qgb2YgdGhpcyBpcyBhIAo+IHNpZ25hdHVyZSwgZ2l0
IGZvbGtzIHVzdWFsbHkgdXNlIGEgIi0tLSIgdG8gaW5kaWNhdGUgYSBjb21tZW50IHRoYXQgCj4g
c2hvdWxkbid0IGJlIHBhcnQgb2Ygd2hhdCdzIGV2ZW50dWFsbHkgbWVyZ2VkIChsaWtlIHRoaXMg
Y2hhbmdlbG9nIHN0dWZmKS4KPiAKPj4gTm90ZSwgdGhpcyBwYXRjaCBoYXMgaGFkIHNpZ25pZmlj
YW50IHJlLXdvcmsgc2luY2UgdGhlIHByZXZpb3VzIDQKPj4gc2V0cywgaW5jbHVkaW5nIHRyeWlu
ZyB0byBmaXggc3R5bGUsIG1lc3NhZ2UsIHJlbGlhbmNlIG9uIHRoZSBVLUJvb3QKPj4gZml4IGFu
ZCB0aGUgY29tbWVudHMgYWJvdXQgdXNhZ2Ugb2YgTElOS19DQVAgYW5kIHJlc2VydmVkIGZpZWxk
cy4KPj4KPj4gdjI6Cj4+IC0gZml4IGlzc3VlcyB3aXRoIEdlbjEvMi41R1RzCj4+IC0gdXBkYXRl
ZCBjb21tZW50IG9uIHRoZSBpbml0aWFsIHByb2JlCj4+IC0gcnVuIHRlc3RzIHdpdGggYm90aCB1
bmluaXRpYWxpc2VkIGFuZCBpbml0aWFsc2VkIHBjaWUgZnJvbSB1Ym9vdAo+PiAtLS0KPj4gwqBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMgfCA1MiArKysrKysrKysrKysr
KysrKysrKysrKystCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZnU3NDAuYyAKPj4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMK
Pj4gaW5kZXggODQyYjcyMDJiOTZlLi5lY2FjMDM2NDE3OGEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwo+PiArKysgYi9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMKPj4gQEAgLTE4MSwxMCArMTgxLDYwIEBAIHN0YXRp
YyBpbnQgZnU3NDBfcGNpZV9zdGFydF9saW5rKHN0cnVjdCBkd19wY2llIAo+PiAqcGNpKQo+IAo+
IElzIHRoZXJlIGFuIGVycmF0YT/CoCBJSVVDIHRoaXMgd2lsbCB0cmlnZ2VyIHRoZSB3b3JrYXJv
dW5kIG9uIGFsbCAKPiBGVTc0MHMsIGJ1dCBmcm9tIHRoZSBkZXNjcmlwdGlvbiBpdCBzZWVtcyBs
aWtlIG1vcmUgb2YgYSBib2FyZCBidWcgdGhhbiAKPiBhIGNoaXAgYnVnLsKgIFRoZSBkaXN0aW5j
dGlvbiBkb2Vzbid0IHJlYWxseSBtYXR0ZXIsIGFzIHRoZXJlJ3Mgb25seSBvbmUgCj4gYm9hcmQg
Zm9yIHRoaXMgY2hpcCAoYW5kIEknbSBhc3N1bWluZyB0aGF0J2xsIGFsd2F5cyBiZSB0aGUgY2Fz
ZSksIGJ1dCAKPiBpZiB0aGVyZSdzIGFuIGVycmF0YSAob3IgYW55IHdheSB0aGlzIGlzIGRvY3Vt
ZW50ZWQpIGl0IG1pZ2h0IG1ha2UgCj4gdGhpbmdzIGEgYml0IGVhc2llciB0byBzb3J0IG91dCBp
ZiB3ZSBlbmQgdXAgd2l0aCBhbm90aGVyIHNpbWlsYXIgCj4gY2hpcC9ib2FyZC4KPiAKPiBFaXRo
ZXIgd2F5Cj4gCj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pgo+IAo+IEknbSBhc3N1bWluZyB5b3UsIG9yIHNvbWVvbmUgZWxzZSwgaGFzIHRlc3RlZCB0aGlz
IG9uIHRoZSBib2FyZD/CoCBJJ20gCj4gcHJldHR5IHN1cmUgSSd2ZSBnb3Qgb25lIGx5aW5nIGFy
b3VuZCBzb21ld2hlcmUsIGJ1dCBJIGRvbid0IHJlZ3VsYXJseSAKPiB1c2UgaXQuwqAgSSBjYW4g
ZHVzdCBpdCBvZmYgaWYgbm9ib2R5IGVsc2UgaGFzIHRyaWVkIHRoaXMsIGJ1dCBoYXBweSB0byAK
PiBhdm9pZCB0aGUgbmVlZCB0byBkbyBzby4KCgpJJ3ZlIGJlZW4gdHJ5aW5nIHRoaXMgb24gbXkg
b3duIFVubWF0Y2hlZCBib2FyZCwgd2hlcmUgSSBvZnRlbiB1c2UKbmV0d29yayBib290LiBXZSBo
YXZlIGFsc28gdGVzdGVkIHdpdGggYSBuZXctaXNoIFUtQm9vdCAoMjAyMi4wMSBJCnRoaW5rKSB3
aXRoIGJvdGggInBjaSBlbnVtIiBhbmQgbm90LiBJdCBoYXMgYmVlbiBvbiBvdXIgdGVzdCBib2Fy
ZApmb3Igb3ZlciBhIHdlZWsgd2l0aG91dCBhbiBpc3N1ZS4KCkkgd2lsbCBoYXZlIGEgbG9vayBm
b3IgdjQgYWJvdXQgY2hhbmdpbmcgdGhlIFdBUk5fT04oKSB0byBzb21ldGhpbmcKbW9yZSB1c2Vm
dWwuCgoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KU2VuaW9y
IEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3LmNv
ZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
