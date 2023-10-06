Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9554E81DE8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdwoj79wsQKd4Obh15OKTcw81h23EZJ/NmyJOJX0uWw=; b=zvQREf+sofbhAl
	3qWTCjNwqNxSqkVMeSk71MONrp3eMn7UerpQhmU9jwiECZRNXnTmwakeTHODPZBPKpNp+aGtD+1lv
	0lejp4RXv/YJ0UxGnYnc1Buy/38QTlCRcew1V4GMXdNN2Q/KhDytWJYJrqn37sXyZyUAMTgfKljnf
	bsiY3coUpBnykEIFFuMGIPq/J7+firTg5yTvMeZbyARJWdDm+D7PfiRPuLXfoRJpwSeJLfWXyIgw5
	BcvwoKBLa+/G5WrxvZNCE0w2jLVGhULEsX1c66ps9RNivwY0wrVo3+EzifkkzomYPeQHmX7OmW9Vw
	UDsvqBopfWzWccpmj4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojA0-005hEv-0K;
	Fri, 06 Oct 2023 11:38:24 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoj9w-005hDI-2e
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 11:38:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E7A3E0010;
	Fri,  6 Oct 2023 11:38:05 +0000 (UTC)
Message-ID: <e08d9ab1-a61f-442c-9eb2-81aaac291815@ghiti.fr>
Date: Fri, 6 Oct 2023 13:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] Test for riscv fixes
To: Mark Rutland <mark.rutland@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Edward AD <twuufnxlz@gmail.com>, aou@eecs.berkeley.edu, conor@kernel.org,
 gregkh@linuxfoundation.org, guoren@kernel.org, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, liushixin2@huawei.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <CAHVXubhG2c=ShFHF4hMMFm8=BYDTyDUduOizujbUWQBW+55wTw@mail.gmail.com>
 <20230929230549.45206-2-twuufnxlz@gmail.com>
 <CAHVXubiBVKJ89fBtV1fvEpoOyLvdvjkWfeDmw2yZsod5ao9hPw@mail.gmail.com>
 <ZRrIcaa-2Co2cSJm@FVFF77S0Q05N.cambridge.arm.com>
Content-Language: en-US
In-Reply-To: <ZRrIcaa-2Co2cSJm@FVFF77S0Q05N.cambridge.arm.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_043821_165307_765937D5 
X-CRM114-Status: GOOD (  25.49  )
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

SGkgTWFyaywKCk9uIDAyLzEwLzIwMjMgMTU6NDEsIE1hcmsgUnV0bGFuZCB3cm90ZToKPiBPbiBN
b24sIE9jdCAwMiwgMjAyMyBhdCAwOToxMzo1MkFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4+IEhpIEVkd2FyZCwKPj4KPj4gT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTowNuKAr0FN
IEVkd2FyZCBBRDx0d3V1Zm54bHpAZ21haWwuY29tPiAgd3JvdGU6Cj4+PiBIaSBBbGV4YW5kcmUs
Cj4+Pgo+Pj4gT24gRnJpLCAyOSBTZXAgMjAyMyAxMDoyNTo1OSArMDIwMCBBbGV4YW5kcmUgR2hp
dGk8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gIHdyb3RlOgo+Pj4+IEknbSBzdGlsbCBub3QgY29u
dmluY2VkIHRoaXMgd2lsbCBmaXggdGhlIGthc2FuIG91dC1vZi1ib3VuZHMKPj4+PiBhY2Nlc3Nl
cywgdGhlIHBhZ2UgY2FuIGJlIHZhbGlkIGJ1dCB0aGUgcmVhZCBjYW4gaGFwcGVuIGF0IGFuIG9m
ZnNldAo+Pj4+IG5vdCBpbml0aWFsaXplZCBhbmQgdHJpZ2dlciBzdWNoIGVycm9ycyByaWdodD8g
SSBzdGlsbCB0aGluayB0aGVyZSBpcwo+Pj4+IHNvbWV0aGluZyB3ZWlyZCBhYm91dCB0aGUgc3Rh
Y2sgZnJhbWUsIGFzIHRvIG1lIHRoaXMgc2hvdWxkIG5vdCBoYXBwZW4KPj4+PiAoYnV0IGFkbWl0
dGVkbHkgSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgdGhhdCkuCj4+PiBUaGUgYWRkZWQgY2hlY2sg
Y2FuIGNvbmZpcm0gdGhhdCB0aGUgcGh5c2ljYWwgcGFnZSBpcyBpbnZhbGlkICh3aGV0aGVyIGl0
IGlzIGEKPj4+IHZtYWxsb2MgYWxsb2NhdGVkIHBhZ2Ugb3IgYSBzbGFiIGFsbG9jYXRlZCBwYWdl
KSwgYW5kIGV4aXQgdGhlIGZvciBsb29wIHdoZW4gaXQgaXMgaW52YWxpZC4KPj4gWWVzLCBidXQg
dG8gbWUgdGhpcyBpcyBub3Qgd2hhdCBoYXBwZW5zIGluIHRoZSBidWcgcmVwb3J0IHlvdSBsaW5r
Ogo+Pgo+PiB8IEJVRzogS0FTQU46IG91dC1vZi1ib3VuZHMgaW4gd2Fsa19zdGFja2ZyYW1lKzB4
MTMwLzB4MmYyCj4+IGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYzo1OQo+PiB8IFJlYWQg
b2Ygc2l6ZSA4IGF0IGFkZHIgZmYyMDAwMDAwNmQzN2MzOCBieSB0YXNrIHN3YXBwZXIvMS8wCj4+
Cj4+IFNvIHRoZSByZWFkIGF0IGFkZHJlc3MgZmYyMDAwMDAwNmQzN2MzOCBpcyBub3QgIm5vcm1h
bCIgYWNjb3JkaW5nIHRvCj4+IEtBU0FOICh5b3UgY2FuIHNlZSB0aGVyZSBpcyBubyB0cmFwLCBt
ZWFuaW5nIHRoZSBwaHlzaWNhbCBtYXBwaW5nCj4+IGV4aXN0cykuCj4+Cj4+IHwgVGhlIGJ1Z2d5
IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgdmlydHVhbCBtYXBwaW5nIGF0Cj4+IHwgIFtmZjIwMDAw
MDA2ZDMwMDAwLCBmZjIwMDAwMDA2ZDM5MDAwKSBjcmVhdGVkIGJ5Ogo+PiB8IGtlcm5lbF9jbG9u
ZSsweDExOC8weDg5NiBrZXJuZWwvZm9yay5jOjI5MDkKPj4KPj4gVGhlIHZpcnR1YWwgYWRkcmVz
cyBpcyBsZWdpdGltYXRlIHNpbmNlIHRoZSB2bWEgZXhpc3RzIF4KPj4KPj4gfCBUaGUgYnVnZ3kg
YWRkcmVzcyBiZWxvbmdzIHRvIHRoZSBwaHlzaWNhbCBwYWdlOgo+PiB8IHBhZ2U6ZmYxYzAwMDAw
MjUwZGJjMCByZWZjb3VudDoxIG1hcGNvdW50OjAgbWFwcGluZzowMDAwMDAwMDAwMDAwMDAwCj4+
IGluZGV4OjB4MCBwZm46MHg5NDM2Zgo+Pgo+PiBBbmQgdGhlIHBoeXNpY2FsIHBhZ2UgYWxzbyBl
eGlzdHMgXgo+Pgo+PiBTbyBJIGluc2lzdCwgY2hlY2tpbmcgdGhhdCBhIHBoeXNpY2FsIG1hcHBp
bmcgZXhpc3RzIHRvIGV4aXQgdGhlIGxvb3AKPj4gaXMgbm90IGVub3VnaCwgdG8gbWUsIHRoZSBl
cnJvciBoZXJlIGlzIHRoYXQgdGhlIGJhY2t0cmFjZSBnb2VzICJ0b28KPj4gZmFyIiBhdCBhbiBh
ZGRyZXNzIHdoZXJlIG5vdGhpbmcgd2FzIHdyaXR0ZW4gYmVmb3JlIGFuZCB0aGVuIEtBU0FOCj4+
IGNvbXBsYWlucyBhYm91dCB0aGF0LCBhZ2Fpbiwgd2UgZG9uJ3QgdGFrZSBhbnkgcGFnZSBmYXVs
dCBoZXJlIHNvIGl0J3MKPj4gbm90IGEgcHJvYmxlbSBvZiBleGlzdGluZyBwaHlzaWNhbCBtYXBw
aW5nLgo+IFllcCEKPgo+IEkgYmVsaWV2ZSB3aGF0J3MgaGFwcGVuaW5nIGhlcmUgaXMgb25lIHRh
c2sgdW53aW5kaW5nIGFub3RoZXIgKHN0YXJ0aW5nIGZyb20KPiB3aGF0ZXZlciBnZXRzIHNhdmVk
IGluIHN3aXRjaF90bygpKSwgYW5kIHRoZXJlJ3Mgbm90aGluZyB0aGF0IHByZXZlbnRzIHRoYXQK
PiBvdGhlciB0YXNrIGZyb20gcnVubmluZyBjb25jdXJyZW50bHkgYW5kIG1vZGlmeWluZy9wb2lz
b25pbmcgaXRzIHN0YWNrLiBJbgo+IGdlbmVyYWwgdHJ5aW5nIHRvIHVud2luZCBhIHJlbW90ZSBz
dGFjayBpcyByYWN5IGFuZCBicm9rZW4sIGJ1dCB3ZSdyZSBzdHVjawo+IHdpdGggYSBmZXcgYml0
cyBvZiB0aGUga2VybmVsIHRyeWluZ3RvIGRvIHRoYXQgb2NjYXNpb25hbGx5IGFuZCBzbyB0aGUg
YXJjaAo+IGNvZGUgbmVlZHMgdG8gaGFuZGxlIHRoYXQgd2l0aG91dCBibG93aW5nIHVwLgoKClRo
YW5rcyBmb3IgdGhhdCwgSSBoYWQgYWxyZWFkeSBmaXhlZCB0aGUgImltcHJlY2lzZSIgdW53aW5k
ZXIgKHdoZW4gd2UgCmRvbid0IGhhdmUgYSBmcmFtZSBwb2ludGVyKSB1c2luZyBSRUFEX09OQ0Vf
Tk9DSEVDSygpIGJ1dCBJIGhhZCBub3QgdGhpcyAKdXNlIGNhc2UgaW4gbWluZCwgc28gSSdsbCBm
aXggdGhhdCB0b28uCgoKPiBGb3IgS0FTQU4gc3BlY2lmaWNhbGx5IHlvdSdsbCBuZWVkIHRvIGFj
Y2VzcyB0aGUgc3RhY2sgd2l0aCB1bmNoZWNrZWQgYWNjZXNzZXMKPiAoZS5nLiB1c2luZyBSRUFE
X09OQ0VfTk9DSEVDSygpIHRvIHJlYWQgdGhlIHN0cnVjdCBzdGFja2ZyYW1lKSwgYW5kIHlvdSds
bAo+IHByb2JhYmx5IHdhbnQgdG8gYWRkIHNvbWUgZXhwbGljaXQgY2hlY2tzIHRoYXQgcG9pbnRl
cnMgYXJlIHdpdGhpbiBzdGFjayBib3VuZHMKPiBzaW5jZSBjb25jdXJyZW50IG1vZGlmaWNhdGlv
biAob3IgY29ycnVwdGlvbikgY291bGQgcmVzdWx0IGluIGVudGlyZWx5IGJvZ3VzCj4gcG9pbnRl
cnMuCj4KPiBJICp0aGluayogdGhhdCB3ZSBkbyB0aGUgcmlnaHQgdGhpbmcgb24gYXJtNjQsIHNv
IHlvdSBtaWdodCB3YW50IHRvIHRha2UgYSBsb29rCj4gYXQgYXJtNjQncyB1bndpbmRlciBpbiBh
cmNoL2FybTY0L2tlcm5lbC9zdGFja3RyYWNlLmMsCj4gYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9z
dGFja3RyYWNlLmgsIGFuZAo+IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS9jb21t
b24uaC4KCgpBbmQgSSdsbCBjaGVjayB0aGF0IGZvciB0aGUgc3RhY2sgYm91bmRzIGNoZWNrLgoK
VGhhbmtzIGFnYWluLAoKQWxleAoKCj4KPiBNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
