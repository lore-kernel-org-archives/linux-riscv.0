Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FD4CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyIwOfHJ8OaUmcoqVakFpXSdA2Wo42n/jHhUZ4/qecM=; b=JhehJvEePOubHP
	L58xYdkS5dswD10akBs1RseivToFagIZpDcTLIqfarWK6tVt4wnH8/qXGUM2X7cliHd45OefieSvc
	kI4Bxx5cwx2ZhcDSi7RlI4iSWUYyrSOYHZ3YNe9gwUSYkS8jmn2BpkIt2UE/ehh2Z333D3pZVPePp
	4kBxk0+fZMXlzgR2uy4mcR+SyKlx+QzpbGWCw77gnsv0n/hlHwR9I7UkBJQl23v4VhBXjyNe2120z
	xJlMIqikd9TbghE8uZ+BWhSTZZkUJDVZjcwqLxZYtdvYULfuhPSpms0NOPGv9Q2HTionRzw/h9urg
	NZ1oZ4g2ytxl+dO7zfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuLY-0000000F1xL-3UEg;
	Mon, 18 May 2026 09:33:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuLX-0000000F1wt-1d9J
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 09:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=JuU62QcJ/dqEaYZHpIfZGP6RARK1HuMM/kP0DacFFvQ=; b=pylTxa5t93KhCtTHHf+OX48GlX
	upTp5qdjmng4Sk7di7SvlFpMI0IA7rEcsE7eIyJBCijQ07RPEy6KJzuSIplmVLiksm4dd09NAwpAl
	NhrJOVJ9S4Pv13K/SLKN29Wj6/tSIgoGbJ/JRGa8hbsA0wH3Is+3/Yrf4pj6ro0I5iJueZTmPz1AL
	4mefnSxgfq52SGRU//wiuRXe0DaRF1so6cJnJN1ndxGR/yqXz4LFe+E6g+ADof/4bwhoInFBX7PrD
	RKACTx8QBKt2a+j/gfTGWI46vJczjN0JAkxi1UekZjwRCQuKtWKeVNlHMALnFv+tqp5FOSC8foMV1
	W5wHCONw==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuLR-0000000AaNh-3FWD
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 09:33:10 +0000
Received: from [10.213.6.35] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACHGw_I3ApqAT+cEA--.21251S2;
	Mon, 18 May 2026 17:32:56 +0800 (CST)
Message-ID: <ad83b61d-d6ad-434c-9435-067008662d31@iscas.ac.cn>
Date: Mon, 18 May 2026 17:32:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Panic: Oops - store (or AMO) access fault in __memset
 during gcc/gentoo-sources compilation on riscv64 (JH7110 / Star64)
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: =?UTF-8?B?0JDRgNGC0LXQvCDQnNCw0LrRlNGU0LI=?= <artemmakieiev@gmail.com>,
 linux-riscv@lists.infradead.org
References: <CAB4LXH9MY8-2r4PH+ki_KtdmUXmjyWPe2rN5SnRoP1TU9s=knQ@mail.gmail.com>
 <f2709b23-769a-4694-8275-e601b1664b7f@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <f2709b23-769a-4694-8275-e601b1664b7f@iscas.ac.cn>
X-CM-TRANSID: zQCowACHGw_I3ApqAT+cEA--.21251S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWrtF1rZrW7ur1DAF17GFg_yoW5Xw18pF
	Wjg34v9F4kJw17A34kJw1xZ3yrCwn5CFWrWr93Jw17Ga1UGr1vvryjqw45W3W7J395Jryj
	qFZ2yrsYga1DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUy0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26F4j6r4UJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07bekskUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_103306_699915_E0BA6E9F 
X-CRM114-Status: GOOD (  14.54  )
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

T24gNS8xOC8yNiAxMToyNSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4gSGkg0JDRgNGC0LXQvCDQnNCw
0LrRlNGU0LIsCj4KPiBPbiA1LzE4LzI2IDAwOjQ1LCDQkNGA0YLQtdC8INCc0LDQutGU0ZTQsiB3
cm90ZToKPj4gWy4uLl0KPiBbLi4uXQo+Cj4gSXQgd291bGQgYWxzbyBoZWxwIGlmIHlvdSBjb3Vs
ZCBwcm92aWRlIHRoZXNlIGluZm9ybWF0aW9uOgo+Cj4gICAqIFZlcnNpb24gaW5mb3JtYXRpb24g
b2YgVS1Cb290LCBPcGVuU0JJLCBldGMsIGFzIHRoZXkgd291bGQKPiAgICAgc2VsZi1yZXBvcnQg
b24gc2VyaWFsIHBvcnQgb24gYm9vdC4KPiAgICogRnVsbCBib290IHRpbWUga2VybmVsIGxvZ3Mu
IEl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBhbGwgdGhlIHdheSB0byB0aGUKPiAgICAgcGFuaWM7IGp1
c3QgdXAgdG8gYSBub3JtYWwgc3RhcnR1cCBpcyBlbm91Z2guCgpJIHJlY2VpdmVkIHByaXZhdGUg
cmVwbGllcyBmcm9tINCQ0YDRgtC10Lwgd2l0aCBsb2dzIHRoYXQgaGFkIGNvbmZpcm1lZCBteQpk
aWFnbm9zaXMuIEknbSByZXBseWluZyBwdWJsaWNseSBmb3IgcG9zdGVyaXR5LgoKT24gNS8xOC8y
NiAxNToyMSwg0JDRgNGC0LXQvCDQnNCw0LrRlNGU0LIgd3JvdGU6Cgo+IFsuLi5dCj4KPiBPcGVu
c2JpIGFuZCB1Ym9vdCB2ZXJzaW9uIGFuZCBsb2c6CgooSSByZW1vdmVkIG1vc3Qgb2YgdGhlIGxv
Z3MgdG8gaGlkZSBwb3NzaWJseSBwcml2YXRlIGluZm9ybWF0aW9uLikKCj4gWy4uLl0KPgo+IFUt
Qm9vdCAyMDIxLjEwIChKYW4gMTkgMjAyMyAtIDA0OjA5OjQxICswODAwKSwgQnVpbGQ6IGplbmtp
bnMtZ2l0aHViX3Zpc2lvbmZpdmUyLTYKClRoaXMgaXMgU3RhckZpdmUncyBmaXJtd2FyZS4gSSB3
b3VsZCByZWNvbW1lbmQgcmVwbGFjaW5nIGl0IHdpdGggYSBuZXdlcgptYWlubGluZSBVLUJvb3Qg
c2luY2UgU3RhckZpdmUncyBpcyBxdWl0ZSBhbiBvbGQgdmVyc2lvbiBhbmQgaGFzIG1hbnkKdmVu
ZG9yLXNwZWNpZmljIG1vZGlmaWNhdGlvbnMgdGhhdCBtYXkgbm90IGJlIHVuc3VpdGFibGUgZm9y
IGEgZ2VuZXJhbApkaXN0cm8uCgpUaGVyZSBpcyBhIHZlcnkgZGV0YWlsZWQgZ3VpZGUgaW4gdGhl
IFUtQm9vdCBkb2N1bWVudGF0aW9uOgoKICAgIGh0dHBzOi8vZG9jcy51LWJvb3Qub3JnL2VuL2xh
dGVzdC9ib2FyZC9zdGFyZml2ZS9waW5lNjRfc3RhcjY0Lmh0bWwKCkl0IGlzIGdlbmVyYWxseSBz
YWZlIHRvIGRvIHNvLCBzaW5jZSB0aGUgZXhpc3RlbmNlIG9mIHRoZSBVQVJUIGJvb3QgbW9kZQpt
ZWFucyB0aGF0IGl0IGlzIG5vdCBnZW5lcmFsbHkgcG9zc2libGUgdG8gYnJpY2sgYSBKSDcxMTAg
Ym9hcmQgd2l0aCBiYWQKc29mdHdhcmUuIERvIG5vdGUgdGhhdCB2ZXJzaW9uIDIwMjUuMTAgb253
YXJkcyBzdG9wcGVkIHN1cHBvcnRpbmcKZmlybXdhcmUtb24tU0QtY2FyZCBib290IHNvIHlvdSB3
b3VsZCBoYXZlIHRvIHVzZSBhbiBvbGRlciB2ZXJzaW9uIG9yCmN1c3RvbWl6ZSBpdCBzb21ld2hh
dCBpZiB5b3UncmUgdXNpbmcgdGhhdC4KCkkgZG9uJ3Qga25vdyBob3cgeW91ciBkaXN0cm8gc2V0
cyB1cCB0aGUgYm9vdCBjb25maWd1cmF0aW9uIHRvIGxldApVLUJvb3QgZmluZCB5b3VyIGtlcm5l
bCwgZXRjLCBzbyBJIGRvbid0IGtub3cgaWYgaXQncyBjb21wYXRpYmxlIHdpdGgKdGhlIGRlIGZh
Y3RvIHN0YW5kYXJkcyB0aGF0IG1haW5saW5lIFUtQm9vdCB1c2VzLiBJZiB5b3UncmUgdW5mYW1p
bGlhcgp3aXRoIGhvdyB0byBzZXQgdXAgc3R1ZmYgbGlrZSBleHRsaW51eCBib290aW5nLCBpdCB3
b3VsZCBiZSBiZXR0ZXIgdG8KYXNrIG90aGVyIEdlbnRvbyB1c2VycyBmb3IgaGVscCwgc2luY2Ug
aXQncyB3aWxkbHkgZGlmZmVyZW50IGJldHdlZW4KZGlzdHJvcy4KCj4gWy4uLl0KPgo+IFsgICAg
MC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IFBpbmU2NCBTdGFyNjQKPiBbICAgIDAuMDAwMDAwXSBT
Qkkgc3BlY2lmaWNhdGlvbiB2MS4wIGRldGVjdGVkCj4gWyAgICAwLjAwMDAwMF0gU0JJIGltcGxl
bWVudGF0aW9uIElEPTB4MSBWZXJzaW9uPTB4MTAwMDIKPiBbICAgIDAuMDAwMDAwXSBTQkkgVElN
RSBleHRlbnNpb24gZGV0ZWN0ZWQKPiBbICAgIDAuMDAwMDAwXSBTQkkgSVBJIGV4dGVuc2lvbiBk
ZXRlY3RlZAo+IFsgICAgMC4wMDAwMDBdIFNCSSBSRkVOQ0UgZXh0ZW5zaW9uIGRldGVjdGVkCj4g
WyAgICAwLjAwMDAwMF0gU0JJIFNSU1QgZXh0ZW5zaW9uIGRldGVjdGVkCj4gWyAgICAwLjAwMDAw
MF0gZWZpOiBVRUZJIG5vdCBmb3VuZC4KPiBbICAgIDAuMDAwMDAwXSBlYXJseWNvbjogdWFydDAg
YXQgTU1JTzMyIDB4MDAwMDAwMDAxMDAwMDAwMCAob3B0aW9ucyAnMTE1MjAwbjgnKQo+IFsgICAg
MC4wMDAwMDBdIHByaW50azogbGVnYWN5IGJvb3Rjb25zb2xlIFt1YXJ0MF0gZW5hYmxlZAo+IFsg
ICAgMC4wMDAwMDBdIE9GOiByZXNlcnZlZCBtZW06IFJlc2VydmVkIG1lbW9yeTogTm8gcmVzZXJ2
ZWQtbWVtb3J5IG5vZGUgaW4gdGhlIAo+ClRoaXMgbWVhbnMgdGhhdCBpdCdzIGRlZmluaXRlbHkg
dGhlIGZpcm13YXJlJ3MgcHJvYmxlbSwgc2luY2UgdGhlcmUKZGVmaW5pdGVseSBzaG91bGQgYmUg
c29tZSByZXNlcnZlZCBtZW1vcnkgZm9yIE9wZW5TQkksIGVpdGhlciBmcm9tIFVFRkkKKHdoaWNo
IGRvZXMgbm90IGFwcGx5IGhlcmUpIG9yIC9yZXNlcnZlZC1tZW1vcnkgKGl0J3MgbWlzc2luZyku
IFdpdGhvdXQKdGhpcyBpbmZvcm1hdGlvbiBMaW51eCBjb3VsZCBub3Qga25vdyB0aGF0IHNvbWUg
bWVtb3J5IGlzIG5vdCB1c2FibGUuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
