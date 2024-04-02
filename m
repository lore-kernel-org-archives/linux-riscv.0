Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E72CD128D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4wBaxD7RBlXfw5WPgP7UwaGZJlk2G59JFMcb8/DLbA=; b=sJWf1/a7XXUJbF
	31nOqXTXyjgFNJ/ypiFeTFw3iuVvKG7Y1vPJ+mPCyegoXu3OX04O8qGSGwH0XphUPi/n7ibm6WYFc
	856NPxTuosRrv9APVIMMoFBsH2alJl3BPDwCC5ygC3V0ndKzNu+cXtUUX1IfX0XHNPuWdOyZcKmk4
	rsm4/PBZSftPn530LBoCe3bFSq4KueUSiorCguAAnYQNwdzDJCAxMbPGwG9wnPrdSEuKks849pc7P
	JGGvMQZLj+8ZU9Vuoh4ZmQLO++bSTcDJb0aA1LMphZzLooOr/FVGFB47BmJK1D4ZLYbsFB1hTXuh0
	yLsNlsxQw6ab7DCJOLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdsH-0000000BG27-48rq;
	Tue, 02 Apr 2024 13:08:25 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdsE-0000000BG0U-1ssa
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 13:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JCjj67n0nhK6ksZt20rs/rYrpqTw+lXYUpYPa1MOEMo=; b=8xJ+0Hj1FxM6YbPGq6k+7eTm2v
	wDaAJkzhCrlNd/rhfGKjR2fqbKura1LXFB/GJJCXnYidq05WC/5WA3BFAPkzcO1ypYFeBkXgsULDA
	1ChsghUSYgT28jvXvg5d0HzfIMnYctxYSLyNb68rHhKHCdsZYzTmkFLy3oqjTxgU54fks+sOxvf2n
	hiIKge+u2KbIr91juxrSkh1rcA4vo24CZa6J//IdmcoTl4FFrOZhPUVSuBWf24fGT4EIOZEwPXVWp
	23/fycNn63jrmfcEBR3vFVA5I1Xyu3ycng5jlaUTNae47KxNLPeNYiLayyp3bgeZpsO9na0bC+QLt
	8duOKAVg==;
Received: from [143.58.228.53] (helo=[192.168.1.103])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1rrdRE-007s5s-MA; Tue, 02 Apr 2024 13:40:28 +0100
Message-ID: <12aa7a56-4bed-466a-a78f-21dc32d5c835@codethink.co.uk>
Date: Tue, 2 Apr 2024 13:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: Implement optimized memchr function
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, Bjorn Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-36b05ed9-dd1c-45ad-aeec-921b30a75f7a@palmer-ri-x1c9>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov@codethink.co.uk>
In-Reply-To: <mhng-36b05ed9-dd1c-45ad-aeec-921b30a75f7a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_060822_604943_8367A1D5 
X-CRM114-Status: GOOD (  20.92  )
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

T24gMjcvMDMvMjAyNCAxNDoyMSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gTW9uLCAxMSBE
ZWMgMjAyMyAwNzoyNToxNSBQU1QgKC0wODAwKSwgaXZhbi5vcmxvdkBjb2RldGhpbmsuY28udWsg
d3JvdGU6Cj4+IE9uIDExLzEyLzIwMjMgMTU6MDgsIEFuZHJldyBKb25lcyB3cm90ZToKPj4+PiBB
cyB5b3UgY2FuIHNlZSwgdGhlIG5ldyBmdW5jdGlvbiBzaG93cyBtdWNoIGJldHRlciByZXN1bHRz
IGV2ZW4gZm9yCj4+Pj4gdGhlIHNtYWxsIGFycmF5cyBvZiAyNTYgZWxlbWVudHMsIHRoZXJlZm9y
ZSBJIGJlbGlldmUgaXQgY291bGQgYmUgYQo+Pj4+IHVzZWZ1bCBhZGRpdGlvbiB0byB0aGUgZXhp
c3RpbmcgcmlzY3Ytc3BlY2lmaWMgc3RyaW5nIGZ1bmN0aW9ucy4KPj4+Cj4+PiBMb29rcyBnb29k
LCBidXQgZG8gd2Ugd2FudCB0byBtYWludGFpbiBib3RoIHRoaXMgdmVyc2lvbiBhbmQgYSB6YmIK
Pj4+IHZlcnNpb24/IEknZCBleHBlY3QgYSB6YmIgdmVyc2lvbiB0byBiZSBldmVuIGJldHRlci4K
Pj4+Cj4+Cj4+IEhpIEFuZHJldywKPj4KPj4gWWVzLCBaQkIgYW5hbG9nIHdvdWxkIGJlIG11Y2gg
YmV0dGVyLCBhbmQgaWYgd2UgdXNlIFpCQiBvcGVyYXRpb25zIHdlCj4+IGNvdWxkIGF2b2lkIHRo
ZSBtb3N0IHBhcnQgb2YgYml0IG1hZ2ljIGhhcHBlbmluZyB0aGVyZS4KPj4KPj4+PiArwqDCoMKg
IGFkZCB0MSwgeDAsIGEyCj4+Pgo+Pj4gbW92ZSB0MSwgYTIKPj4+Cj4+PiBhbmQgZm9yIHRoZSBy
ZW1haW5kZXIgb2YgdGhlIGZ1bmN0aW9uIHMveDAvemVyby8KPj4+Cj4+Cj4+IEFscmlnaHQsIHdp
bGwgYmUgZml4ZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPj4+PiArwqDCoMKgIHNsdGl1IHQyLCBh
MiwgTUlOX0JPUkRFUgo+Pj4+ICvCoMKgwqAgYm5leiB0MiwgNmYKPj4+PiArCj4+Pj4gK8KgwqDC
oCAvLyBnZXQgdGhlIG51bWJlciBvZiBieXRlcyB3ZSBzaG91bGQgaXRlcmF0ZSBiZWZvcmUgYWxp
Z25tZW50Cj4+Pgo+Pj4gSSdtIG5vdCBzdXJlLCBidXQgSSB0aGluayBldmVuIGluIGFzc2VtYmx5
IHdlIHByZWZlciB0aGUgLyogKi8gY29tbWVudAo+Pj4gZm9ybWF0Lgo+Pj4KPj4+PiArwqDCoMKg
IGFuZGkgdDAsIGEwLCBTWlJFRyAtIDEKPj4+PiArwqDCoMKgIGJlcXogdDAsIDRmCj4+Pj4gKwo+
Pj4+ICvCoMKgwqAgIyBnZXQgdGhlIFNaUkVHIC0gdDAKPj4+Cj4+PiBJJ20gOTklIHN1cmUgd2Ug
ZG9uJ3Qgd2FudCB0byB1c2UgdGhlICMgY29tbWVudCBzeW50YXguCj4+Pgo+Pj4+ICvCoMKgwqAg
eG9yIHQwLCB0MCwgU1pSRUcgLSAxCj4+Pgo+Pj4geG9yaT8KPj4+Cj4+Cj4+IEhtbSwgSSdtIHN1
cnByaXNlZCB0aGF0IGl0IGlzIGFjdHVhbGx5IGNvbXBpbGFibGUuLi4gWWVhaCwgc2hvdWxkIGJl
IAo+PiBmaXhlZAo+Pj4+ICvCoMKgwqAgYWRkaSB0MCwgdDAsIDEKPj4+PiArCj4+Pj4gK8KgwqDC
oCBzdWIgYTIsIGEyLCB0MAo+Pj4KPj4+IG5pdDogTG9va3MgYSBiaXQgb2RkIHRvIHB1dCBhIGJs
YW5rIGxpbmUgYWJvdmUgdGhlIHN1YiBsaW5lIGFib3ZlLAo+Pj4gaW5zdGVhZCBvZiBhYm92ZSB0
aGUgYmVsb3cgY29tbWVudC4KPj4+Cj4+Pj4gK8KgwqDCoCAvLyBpdGVyYXRlIGJlZm9yZSBhbGln
bm1lbnQKPj4+PiArMToKPj4+PiArwqDCoMKgIGJlcSB0MCwgeDAsIDRmCj4+Pj4gK8KgwqDCoCBs
YnUgdDIsIDAoYTApCj4+Pj4gK8KgwqDCoCBiZXEgdDIsIGExLCAzZgo+Pj4+ICvCoMKgwqAgYWRk
aSB0MCwgdDAsIC0xCj4+Pgo+Pj4gVGhpcyBhZGRpIHQwLi4uIGlzbid0IG5lY2Vzc2FyeSBpZiB3
ZSBkbwo+Pj4KPj4KPj4gWWVhaCwgc291bmRzIHJlYXNvbmFibGUsIHdlIGNhbiBtYWtlIGl0IGZh
c3Rlcgo+Pj4gwqDCoMKgwqBhZGQgdDAsIGEwLCB0MAo+Pj4gMToKPj4+IMKgwqDCoMKgYmVxIGEw
LCB0MCwgNGYKPj4+IMKgwqDCoMKgLi4uCj4+PiDCoMKgwqDCoC4uLgo+Pj4gwqDCoMKgwqBhZGRp
IGEwLCBhMCwgMQo+Pj4gwqDCoMKgwqBqIDFiCj4+Pgo+Pj4+ICvCoMKgwqAgYWRkaSBhMCwgYTAs
IDEKPj4+PiArwqDCoMKgIGogMWIKPj4+PiArCj4+Pj4gKzI6Cj4+Pj4gK8KgwqDCoCAvLyBmb3Vu
ZCBhIHdvcmQuIEl0ZXJhdGUgaXQgdW50aWwgd2UgZmluZCB0aGUgdGFyZ2V0IGJ5dGUKPj4+PiAr
wqDCoMKgIGxpIHQxLCBTWlJFRwo+Pj4+ICvCoMKgwqAgaiA2Zgo+Pj4KPj4+IFRoZXNlIGluc3Ry
dWN0aW9ucyBzZWVtIG9kZGx5IHBsYWNlZCBhbW9uZyB0aGUgcmVzdC4KPj4+Cj4+Pj4gKzM6Cj4+
Pj4gK8KgwqDCoCByZXQKPj4+Cj4+PiBBbmQgdGhpcyBpcyBhbiBvZGQgcGxhY2UgdG8gcHV0IHRo
aXMgcmV0IChhZnRlciB1bmNvbmRpdGlvbmFsIGp1bXAgYW5kCj4+PiBpbiB0aGUgbWlkZGxlIG9m
IHRoZSBmdW5jdGlvbikuIFdlIGNhbiBqdXN0IHB1dCBhIGxhYmVsIGF0IHRoZSBib3R0b20gCj4+
PiByZXQuCj4+Pgo+Pgo+PiBJIGFncmVlLCB0aGFua3MhCj4+Pj4gKwo+Pj4+ICs0Ogo+Pj4+ICvC
oMKgwqAgLy8gZ2V0IHRoZSBjb3VudCByZW1haW5kZXIKPj4+PiArwqDCoMKgIGFuZGkgdDEsIGEy
LCBTWlJFRyAtIDEKPj4+PiArCj4+Pj4gK8KgwqDCoCAvLyBhbGlnbiB0aGUgY291bnQKPj4+PiAr
wqDCoMKgIHN1YiBhMiwgYTIsIHQxCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLy8gaWYgd2UgaGF2ZSBu
byB3b3JkcyB0byBpdGVyYXRlLCBpdGVyYXRlIHRoZSByZW1haW5kZXIKPj4+PiArwqDCoMKgIGJl
cXogYTIsIDZmCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLy8gZnJvbSAweEJBIHdlIHdpbGwgZ2V0IDB4
QkFCQUJBQkFCQUJBQkFCQQo+Pj4+ICvCoMKgwqAgbGkgdDMsIFJFUF8wMQo+Pj4+ICvCoMKgwqAg
bXVsIHQzLCB0MywgYTEKPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gaW1wbGVtZW50
IGFuIG9wdGltaXplZCBhc3NlbWJseSBmdW5jdGlvbiB3aXRoCj4+PiBtdWwuIFdlIGNhbiBqdXN0
IHVzZSBhIGZldyBzaGlmdHMgYW5kIG9ycy4KPj4+Cj4+PiDCoMKgwqDCoHNsbGnCoMKgwqAgdDMs
IGExLCA4Cj4+PiDCoMKgwqDCoG9ywqDCoMKgIHQzLCB0MywgYTEKPj4+IMKgwqDCoMKgc2xsacKg
wqDCoCB0NCwgdDMsIDE2Cj4+PiDCoMKgwqDCoG9ywqDCoMKgIHQzLCB0NCwgdDMKPj4+ICNpZiBf
X3Jpc2N2X3hsZW4gPT0gNjQKPj4+IMKgwqDCoMKgc2xsacKgwqDCoCB0NCwgdDMsIDMyCj4+PiDC
oMKgwqDCoG9ywqDCoMKgIHQzLCB0NCwgdDMKPj4+ICNlbmRpZgo+Pj4KPj4KPj4gTmljZSBwb2lu
dCwgdGhhbmtzISBXaWxsIGJlIG9wdGltaXplZCA6KQo+Pj4+ICsKPj4+PiArwqDCoMKgIGFkZCBh
MiwgYTIsIGEwCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgbGkgdDQsIFJFUF8wMQo+Pj4+ICvCoMKgwqAg
bGkgdDUsIFJFUF84MAo+Pj4+ICsKPj4+PiArNToKPj4+PiArwqDCoMKgIFJFR19MIHQyLCAwKGEw
KQo+Pj4+ICsKPj4+PiArwqDCoMKgIC8vIGFmdGVyIHRoaXMgeG9yIHdlIHdpbGwgZ2V0IG9uZSB6
ZXJvIGJ5dGUgaW4gdGhlIHdvcmQgaWYgaXQgCj4+Pj4gY29udGFpbnMgdGhlIHRhcmdldCBieXRl
Cj4+Pj4gK8KgwqDCoCB4b3IgdDIsIHQyLCB0Mwo+Pj4+ICsKPj4+PiArwqDCoMKgIC8vIHdvcmQg
diBjb250YWlucyB0aGUgdGFyZ2V0IGJ5dGUgaWYgKHYgLSAweDAxMDEwMTAxKSAmICh+dikgJiAK
Pj4+PiAweDgwODA4MDgwIGlzIHBvc2l0aXZlCj4+Pgo+Pj4gcy9pcyBwb3NpdGl2ZS9pcyBub3Qg
emVyby8KPj4+Cj4+Pj4gK8KgwqDCoCBzdWIgdDAsIHQyLCB0NAo+Pj4+ICsKPj4+PiArwqDCoMKg
IG5vdCB0MiwgdDIKPj4+PiArCj4+Pj4gK8KgwqDCoCBhbmQgdDAsIHQwLCB0Mgo+Pj4+ICvCoMKg
wqAgYW5kIHQwLCB0MCwgdDUKPj4+PiArCj4+Pj4gK8KgwqDCoCBibmV6IHQwLCAyYgo+Pj4+ICvC
oMKgwqAgYWRkaSBhMCwgYTAsIFNaUkVHCj4+Pj4gK8KgwqDCoCBibmUgYTAsIGEyLCA1Ygo+Pj4+
ICsKPj4+PiArNjoKPj4+PiArwqDCoMKgIC8vIGl0ZXJhdGUgdGhlIHJlbWFpbmRlcgo+Pj4+ICvC
oMKgwqAgYmVxIHQxLCB4MCwgN2YKPj4+PiArwqDCoMKgIGxidSB0NCwgMChhMCkKPj4+PiArwqDC
oMKgIGJlcSB0NCwgYTEsIDNiCj4+Pj4gK8KgwqDCoCBhZGRpIGEwLCBhMCwgMQo+Pj4+ICvCoMKg
wqAgYWRkaSB0MSwgdDEsIC0xCj4+Pgo+Pj4gU2FtZSBjb21tZW50IGFzIGFib3ZlIGFib3V0IGJl
aW5nIGFibGUgdG8gZHJvcCB0aGUgYWRkaSB0MS4uLgo+Pj4KPj4+PiArwqDCoMKgIGogNmIKPj4+
PiArCj4+Pj4gKzc6Cj4+Pj4gK8KgwqDCoCBhZGRpIGEwLCB4MCwgMAo+Pj4KPj4+IGxpIGEwLCAw
Cj4+Pgo+Pj4+ICvCoMKgwqAgcmV0Cj4+Pj4gK1NZTV9GVU5DX0VORChtZW1jaHIpCj4+Pj4gK1NZ
TV9GVU5DX0FMSUFTKF9fcGlfbWVtY2hyLCBtZW1jaHIpCj4+Pj4gLS0gCj4+Pj4gMi4zNC4xCj4+
Pj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBkcmV3Cj4+Pgo+Pgo+PiBUaGFua3MgYSBsb3QgZm9yIHRo
ZSByZXZpZXchCj4gCj4gRG8geW91IGhhdmUgYSB2Mj/CoCBTb3JyeSBpZiBJIGxvc3QgaXQuCj4g
CgpIaSBQYWxtZXIsCgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpBZnRlciBhIGZldyBleHBl
cmltZW50cyBpdCBiZWNhbWUgY2xlYXIgdGhhdCB3ZSB3b24ndCBnZXQgc3VjaCBhIGxhcmdlIApw
ZXJmb3JtYW5jZSBnYWluIGZvciB0aGUgeGxlbj0zMi4gQWxzbywgSSBjb2xsZWN0ZWQgc29tZSB1
c2FnZSAKc3RhdGlzdGljcyBvbiB0aGUgc3lzdGVtLCBhbmQgaXQgc2hvd24gdGhhdCBgbWVtY2hy
YCBoYXMgdG8gaXRlcmF0ZSBtb3JlIAp0aGFuIDEyOCBieXRlcyBxdWl0ZSBpbmZyZXF1ZW50bHku
CgpDb25zaWRlcmluZyB0aGlzIGluZm9ybWF0aW9uLCBpdCBzZWVtcyB0byBtZSB0aGF0IHN1Y2gg
YW4gCm92ZXJjb21wbGljYXRpb24gb2YgdGhlIGBtZW1jaHJgIGZ1bmN0aW9uIHNpbXBseSBkb2Vz
bid0IHdvcnRoIGl0LiBTbywgCnRoZXJlIHdhcyBubyBWMiBmb3IgdGhpcyBwYXRjaCA6KAoKU29y
cnksIEkgc2hvdWxkJ3ZlIHdyaXR0ZW4gaXQgZWFybGllci4KCi0tIApLaW5kIHJlZ2FyZHMsCkl2
YW4gT3Jsb3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
