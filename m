Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49040C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b99T2JXJMeUnP4GFxpy4lQjpbLyw6OdQuvDuLk+V9GE=; b=UHS7WwjKIiKkrk
	vA58i/d9upTdmn36BbUJ8dXGmIWmEjnIKUnuS3sOjNuUJjH+4hLtmWQ5LrmHgp9wVFZDVmvrVB9lL
	nv2bZNhHNRguXHgll1e1QCPfBR8k6/0rk0cEtMQHaZLBt1W2HtSqm8VPtZ7ZxN1F4DCnw5keDAZAT
	aY6G06+DnhAfMI6hgrlx72Ue/Nis7VC2KY1WqMVtVaMfSCyRb75oqiZwJGVSIVVZBV1di74S+49YX
	TU868/AYHhDlMHa3iTsr7OFxTp/bEiXTG55eTJMzno63E6PsfjCms5sLY1KVVW91ILX3aZDzaYLcQ
	NDGCbFO5gi22DePeVaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJyJ-0000000A4AD-21OG;
	Fri, 25 Jul 2025 15:04:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJv7-0000000A3nx-0X86;
	Fri, 25 Jul 2025 15:01:14 +0000
Received: from [192.168.0.108] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowADHWHovnINokAgZBw--.10820S2;
	Fri, 25 Jul 2025 23:01:04 +0800 (CST)
Message-ID: <feb3549f-da91-4eaa-a624-b9f35db6ba3c@iscas.ac.cn>
Date: Fri, 25 Jul 2025 23:01:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Drew Fustini <fustini@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Drew Fustini <dfustini@tenstorrent.com>, Andy Chiu <andybnac@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <cc82c938-def3-4df6-9fc9-fc321af7d54a@iscas.ac.cn>
 <DBL2588APTCA.2XUKQCJ0DW89C@ventanamicro.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <DBL2588APTCA.2XUKQCJ0DW89C@ventanamicro.com>
X-CM-TRANSID: rQCowADHWHovnINokAgZBw--.10820S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr47Ww48Ww17Aw4UJry7KFg_yoW5JFWxpa
	y7Kwn8tw1kAr4fuwnIvr4Iqa1Fyr9ayay5JFn5t3y2ya45GF9YqFs0gayYqFZxArsrCr1j
	qayfu347Zas8ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_080113_526602_8B7A772B 
X-CRM114-Status: GOOD (  13.40  )
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

Ck9uIDcvMjUvMjUgMTg6MTgsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPiAyMDI1LTA3LTI0VDA1
OjU1OjU0KzA4OjAwLCBWaXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+Ogo+PiBP
biA3LzE5LzI1IDExOjM5LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4+PiBGcm9tOiBEcmV3IEZ1c3Rp
bmkgPGRmdXN0aW5pQHRlbnN0b3JyZW50LmNvbT4KPj4+IENsb2JiZXJpbmcgdGhlIHZlY3RvciBy
ZWdpc3RlcnMgY2FuIHNpZ25pZmljYW50bHkgaW5jcmVhc2Ugc3lzdGVtIGNhbGwKPj4+IGxhdGVu
Y3kgZm9yIHNvbWUgaW1wbGVtZW50YXRpb25zLiBUbyBtaXRpZ2F0ZSB0aGlzIHBlcmZvcm1hbmNl
IGltcGFjdCwgYQo+Pj4gcG9saWN5IG1lY2hhbmlzbSBpcyBwcm92aWRlZCB0byBhZG1pbmlzdHJh
dG9ycywgZGlzdHJvIG1haW50YWluZXJzLCBhbmQKPj4+IGRldmVsb3BlcnMgdG8gY29udHJvbCB2
ZWN0b3Igc3RhdGUgZGlzY2FyZCBpbiB0aGUgZm9ybSBvZiBhIHN5c2N0bCBrbm9iOgo+PiBTbyBJ
IGhhZCBhbiBpZGVhOiBJcyBpdCBwb3NzaWJsZSB0byBhdm9pZCByZXBlYXRlZGx5IGRpc2NhcmRp
bmcgdGhlCj4+IHN0YXRlIG9uIGV2ZXJ5IHN5c2NhbGwgYnkgc2V0dGluZyBWUyB0byBJbml0aWFs
IGFmdGVyIGRpc2NhcmRpbmcsIGFuZAo+PiBhdm9pZGluZyBkaXNjYXJkaW5nIHdoZW4gVlMgaXMg
SW5pdGlhbD8gU286Cj4+Cj4+IGlmIChWUyA9PSBDbGVhbiB8fCBWUyA9PSBEaXJ0eSkgewo+PiDC
oCDCoCBjbG9iYmVyOwo+PiDCoCDCoCBWUyA9IEluaXRpYWw7Cj4+IH0KPj4KPj4gVGhpcyB3b3Vs
ZCBhdm9pZCB0aGlzIHByb2JsZW0gd2l0aCBzeXNjYWxsLWhlYXZ5IHVzZXIgcHJvZ3JhbXMgd2hp
bGUKPj4gYWRkaW5nIG1pbmltdW0gb3ZlcmhlYWQgZm9yIGV2ZXJ5dGhpbmcgZWxzZS4KPiBJIHRo
aW5rIHlvdXIgcHJvcG9zYWwgaW1wcm92ZXMgdGhlIGV4aXN0aW5nIGNvZGUsIGJ1dCBpZiBhIHVz
ZXJzcGFjZSBpcwo+IHVzaW5nIHZlY3RvcnMsIGl0J3MgbGlrZWx5IGFsc28gcmVzdG9yaW5nIHRo
ZW0gYWZ0ZXIgYSBzeXNjYWxsLCBzbyB0aGUKPiBzdGF0ZSB3b3VsZCBpbW1lZGlhdGVseSBnZXQg
ZGlydHksIGFuZCB0aGUgbmV4dCBzeXNjYWxsIHdvdWxkIGFnYWluCj4gbmVlZGxlc3NseSBjbG9i
YmVyIHZlY3RvciByZWdpc3RlcnMuCgpXaXRob3V0IGFueSBkYXRhIHRvIGJhY2sgaXQgdXAsIEkg
d291bGQgc2F5IHRoYXQgbXkgdW5kZXJzdGFuZGluZyBpcwp0aGF0IHRoaXMgc2hvdWxkIGJlIGEg
cmFyZSBjYXNlLCBvbmx5IGhhcHBlbmluZyBpZiBlLmcuIHNvbWVvbmUgaXMKYWRkaW5nIHByaW50
ZiBkZWJ1Z2dpbmcgdG8gdGhlaXIgdmVjdG9yIGNvZGUuIE90aGVyd2lzZSwgdmVjdG9yIGxvb3Bz
CnNob3VsZCBub3QgaGF2ZSBzeXNjYWxscyBpbiB0aGVtLgoKQSBtb3JlIHJlYXNvbmFibGUgd29y
cnkgd291bGQgYmUgcHJvZ3JhbXMgdXNpbmcgUlZWIGV2ZXJ5d2hlcmUgaW4gYWxsCnNvcnRzIG9m
IGNvbW1vbiBvcGVyYXRpb25zLiBJbiB0aGF0IGNhc2UsIGFsdGVybmF0aW5nIHN5c2NhbGxzIGFu
ZAp2ZWN0b3JzIHdvdWxkIG1ha2UgdGhlIGRpc2NhcmRpbmcgd2FzdGVmdWwuCgo+IFByZXNlcnZp
bmcgdGhlIHZlY3RvciBzdGF0ZSBzdGlsbCBzZWVtcyBiZXR0ZXIgZm9yIHVzZXJzcGFjZXMgdGhh
dCB1c2UKPiBib3RoIHZlY3RvcnMgYW5kIHN5c2NhbGxzLgoKSWYgd2UgY2FuIGV4cGVjdCBlLmcu
IHVzZXJzcGFjZSBwcm9ncmFtcyB0byBwcmltYXJpbHkgcmVwZWF0ZWRseSB1c2UgUlZWCndpdGgg
bm8gc3lzY2FsbHMgYmV0d2VlbiBsb29wcywgKm9yKiBwcmltYXJpbHkgcmVwZWF0ZWRseSB1c2Ug
c3lzY2FsbHMKd2l0aCByYXJlIG9jY3VycmVuY2VzIG9mIFJWViBiZXR3ZWVuIHN5c2NhbGxzLiBU
aGlzIHdheSwgdGhlIHByaW1hcmlseQpzeXNjYWxsIHByb2dyYW1zIGNhbiBiZW5lZml0IGZyb20g
c2xpZ2h0bHkgc3dpdGNoaW5nLCBzaW5jZSB0aGVyZSdzIG5vCm5lZWQgdG8gc2F2ZSBhbmQgcmVz
dG9yZSBzdGF0ZSBmb3IgdGhvc2UgbW9zdCBvZiB0aGUgdGltZS4gSW4gZWZmZWN0LApzeXNjYWxs
cyBzZXJ2ZXMgYXMgYSBoaW50IHRoYXQgUlZWIGlzIG92ZXIuIFRoZSBwcmltYXJpbHkgUlZWIHBy
b2dyYW1zCnNob3VsZCBub3QgYmUgc3dpdGNoaW5nIGFzIG11Y2ggLSBpZiB0aGV5IGFyZSwgdGhh
dCdzIGEgc2lnbiBvZiBDUFUKcmVzb3VyY2VzIGJlaW5nIG92ZXJzdWJzY3JpYmVkLsKgCgpIYXZp
bmcgc2FpZCBhbGwgb2YgdGhhdCwgSSBhbSBhY3R1YWxseSBzbGlnaHRseSBtb3JlIGludGVyZXN0
ZWQgaW4gd2h5CnZtdi52LnZpIGlzICpzbyBzbG93KiBvbiBTaUZpdmUgWDI4MC4gSSB3b25kZXIg
aWYgdGhlcmUgd291bGQgYmUgYSBtb3JlCm1pY3JvYXJjaGl0ZWN0dXJhbCBmYXZvcmFibGUgd2F5
cyB0byBqdXN0IHB1dCBhIGJ1bmNoIG9mIG9uZXMgaW4gc29tZQp2ZWN0b3IgcmVnaXN0ZXJzPyBX
b3VsZCAwIGJlIGJldHRlcj8KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
