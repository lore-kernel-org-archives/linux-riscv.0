Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C62C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKbwCqK0+4+GVzAOTRlE4VkFZOGXHHMHB4l8dhU7810=; b=vS9uYW3NAKp2Vh
	7eygZ8ercJ5Gpa39+93IJjVlD9K0SoqiOt3y8UxIa1UE1pLtXtgTYo+qr0Z5b3W3kr8V1MSV99jB3
	dQzTKJagt3v7k6WLtWAPGPjyAZXTVLYjmj3ZquzdqG1RXEZzqFZ/tgu6+96YY0JgXCVHEtd6G47/j
	HSIjBJ57ObkQd3Knk95X0SHhcEoTSEltRicoSIUe3U7amytquuep0iWgW5+0CxQBMl39y0SnnTvF7
	GMWZWfXtb1fULSZeOXT6Zmucv5S1mbI8opEmwO72oSKMwhDOZjcdDRV4VPbTBui2w2Hi7M7gPPILo
	3GMsyvxkw5jxFlJOCXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyECI-009iTr-Dh; Thu, 24 Nov 2022 15:31:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyECF-009iSi-US
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 15:31:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 335DF6219E
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 15:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BBAC43470
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303886;
	bh=TDMuBu38U1AMrW3mcmFNJeSUQwnbe0WArXcInbl7bVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZuYiUni2iJILK+gszXOLekonZV+0uIJj/L/WPxCoRl+yYv+dFpQvc5+SydWxHv3Xw
	 69QWcf3PR0TTYDpWHctJdPxiYnFr3FukFy5ekJvYvxt/sS2odZPp3Zm3xpKxzNsKcN
	 hRwkIM+oh1NslDAowSJ4RfXqsk/o3RNIh3YV7CTpFIgjMq6JPciXbor8NwOU+6vLMu
	 iAOnzrtchM0YNLI34AyZ2qKDIBX3AeGn4cld6Y9u7LqRkRkZGw93UIf0lTwAHXhHrj
	 EEkyflTgbEcStMh4UyKigVSuWI9klRDPOxNeEi6w7DhZuZM1rJZTW/SjbsS4ZXrEOG
	 SQOjVnTno5TCQ==
Received: by mail-ej1-f44.google.com with SMTP id e27so4827605ejc.12
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 07:31:25 -0800 (PST)
X-Gm-Message-State: ANoB5pkWOAFcfC0PLjxCHP/wmOjON4CJhDtXFGQiQxaWl7BaC1HlHop2
	ajj6k3aanrWI4V96r6VvsFzfYlRbftzxLdIq8Gs=
X-Google-Smtp-Source: AA0mqf5uEZ6EnzDTd1z6S1Ab2kydukpFXBLZV5kE7YxTMsmWCnZlk8uwjby79zF1TP73le5ESnqyrMl96pMNQAAuw/M=
X-Received: by 2002:a17:906:19d7:b0:7b2:b782:e1df with SMTP id
 h23-20020a17090619d700b007b2b782e1dfmr23920529ejd.308.1669303884230; Thu, 24
 Nov 2022 07:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
In-Reply-To: <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 24 Nov 2022 23:31:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTWSr0qYTnRORSexEHMqUt-Lj6xZd0O-fUgC+f74FfCZA@mail.gmail.com>
Message-ID: <CAJF2gTTWSr0qYTnRORSexEHMqUt-Lj6xZd0O-fUgC+f74FfCZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_073128_084601_795BB0B9 
X-CRM114-Status: GOOD (  28.70  )
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

T24gVGh1LCBOb3YgMjQsIDIwMjIgYXQgMToyNyBBTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLl
ubQxMeaciDIz5pel5ZGo5LiJIDIzOjAy5YaZ6YGT77yaCj4gPgo+ID4gQ29vbCBqb2IsIHRoeC4K
PiA+Cj4gPiBPbiBXZWQsIE5vdiAyMywgMjAyMiBhdCAxMDoyMCBQTSBTb25nIFNodWFpIDxzdWFn
cmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIERZTkFN
SUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQgZm9yIFJJU0MtVi4KPiA+Pgo+ID4+
IHNlbGVjdCB0aGUgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgdG8gcHJvdmlkZSB0
aGUKPiA+PiByZWdpc3Rlcl9mdHJhY2VfZGlyZWN0W19tdWx0aV0gaW50ZXJmYWNlcyBhbGxvd2lu
ZyB1c2VycyB0byByZWdpc3Rlcgo+ID4+IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChkaXJlY3Rf
Y2FsbGVyKSBhcyB0aGUgbWNvdW50IGZvciBvbmUgb3IKPiA+PiBtb3JlIHRhcmdldCBmdW5jdGlv
bnMuIEFuZCBtb2RpZnlfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGFyZSBhbHNvCj4gPj4gcHJvdmlk
ZWQgZm9yIG1vZGlmeWluZyBkaXJlY3RfY2FsbGVyLgo+ID4+Cj4gPj4gVG8gbWFrZSB0aGUgZGly
ZWN0X2NhbGxlciBhbmQgdGhlIG90aGVyIGZ0cmFjZSBob29rcyAoZWcuIGZ1bmN0aW9uL2ZncmFw
aAo+ID4+IHRyYWNlciwga1tyZXRdcHJvYmVzKSBjby1leGlzdCwgYSB0ZW1wb3JhcnkgcmVnaXN0
ZXIgaXMgbm9taW5hdGVkIHRvCj4gPj4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxl
ciBpbiBmdHJhY2VfcmVnc19jYWxsZXIuIEFmdGVyIHRoZQo+ID4+IHNldHRpbmcgb2YgdGhlIGFk
ZHJlc3MgZGlyZWN0X2NhbGxlciBieSBkaXJlY3Rfb3BzLT5mdW5jIGFuZCB0aGUKPiA+PiBSRVNU
T1JFX1JFR1MgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLCBkaXJlY3RfY2FsbGVyIHdpbGwgYmUganVt
cGVkIHRvCj4gPj4gYnkgdGhlIGBqcmAgaW5zdC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNv
bmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNj
di9LY29uZmlnICAgICAgICAgICAgICB8IDEgKwo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Z0cmFjZS5oIHwgNiArKysrKysKPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5T
ICB8IDQgKysrKwo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+PiBpbmRleCAzOWVjOGQ2MjhjZjYuLmQwODNlYzA4ZDBiNiAxMDA2NDQKPiA+PiAtLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcKPiA+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+PiBAQCAt
Mjc4LDYgKzI3OCw3IEBAIGNvbmZpZyBBUkNIX1JWNjRJCj4gPj4gICAgICAgICBzZWxlY3QgQVJD
SF9TVVBQT1JUU19JTlQxMjggaWYgQ0NfSEFTX0lOVDEyOAo+ID4+ICAgICAgICAgc2VsZWN0IEhB
VkVfRFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1VICYmICQoY2Mtb3B0aW9uLC1m
cGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPj4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5B
TUlDX0ZUUkFDRV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQo+ID4+ICsgICAgICAg
c2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKPiA+PiAgICAgICAg
IHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEIGlmICFYSVBfS0VSTkVMCj4gPj4gICAg
ICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVIKPiA+PiAgICAgICAgIHNlbGVj
dCBIQVZFX0ZVTkNUSU9OX1RSQUNFUiBpZiAhWElQX0tFUk5FTCAmJiAhUFJFRU1QVElPTgo+ID4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4+IGluZGV4IDAxYmViYjI4ZWFiZS4uYmU0ZDU3NTY2
MTM5IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPj4gQEAgLTExNCw2ICsx
MTQsMTIgQEAgc3RydWN0IGZ0cmFjZV9yZWdzOwo+ID4+ICB2b2lkIGZ0cmFjZV9ncmFwaF9mdW5j
KHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwLAo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wLCBzdHJ1Y3QgZnRyYWNlX3JlZ3Mg
KmZyZWdzKTsKPiA+PiAgI2RlZmluZSBmdHJhY2VfZ3JhcGhfZnVuYyBmdHJhY2VfZ3JhcGhfZnVu
Ywo+ID4+ICsKPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZnRyYWNlX3NldF9kaXJlY3Rf
Y2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gPj4gK3sK
PiA+PiArICAgICAgICAgICAgICAgcmVncy0+dDEgPSBhZGRyOwo+ID4KPiA+IEhvdyBhYm91dCBy
ZWdzLT50MCA9IGFkZHI7ID8KPiA+IEFuZCBkZWxldGUgYWxsIG1jb3VudC1keW4uUyBtb2RpZmlj
YXRpb24uCj4gPgo+IFRoZSBkaXJlY3RfY2FsbGVyIGhhcyB0aGUgc2FtZSBwcm9ncmFtIGxheW91
dCBhcyB0aGUgZnRyYWNlX2NhbGxlciwgd2hpY2ggbWVhbnMKPiB0aGUgcmVnIHQwIHdpbGwgbmV2
ZXIgYmUgY2hhbmdlZCB3aGVuIGRpcmVjdF9jYWxsZXIgcmV0dXJucy4KPgo+IElmIHJlZ3MtPnQw
IGNoYW5nZXMgaGVyZSBhbmQgZnRyYWNlX3JlZ3NfY2FsbGVyIGV4ZWN1dGVzIGBqciB0MGAsCj4g
ZGlyZWN0X2NhbGxlciB3aWxsIGVudGVyIHRoZSBkZWFkIGxvb3AuCj4KPiBBY3R1YWxseSB0aGUg
cmVnIHQwIGFsd2F5cyBzYXZlcyB0aGUgYWRkcmVzcyBvZiBmdW5jdGlvbiBlbnRyeSB3aXRoIDhC
Cj4gb2Zmc2V0LCBpdCBzaG91bGQgb25seQo+IGNoYW5nZWQgYnkgdGhlIElQTU9ESUZZIG9wcyBp
bnN0ZWFkIG9mIHRoZSBkaXJlY3Rfb3BzLgpIb3cgYWJvdXQ6CnN0YXRpYyBpbmxpbmUgdm9pZCBh
cmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywKdW5zaWdu
ZWQgbG9uZyBhZGRyKQp7CiAgICAgICAgICAgICAgIHJlZ3MtPnQxID0gcmVncy0+dDA7CiAgICAg
ICAgICAgICAgIHJlZ3MtPnQwID0gYWRkcjsKCmRpcmVjdF9jYWxsZXI6CmFkZCBzcCxzcCwtPwpz
ZCB0MSw/KHNwKQpzZCByYSw/KHNwKQpjYWxsIGZvbwpsZCB0MSw/KHNwKQpsZCByYSw/KHNwKQph
ZGQgc3Asc3AsPwpqciB0MSAvLyA8LSBiYWNrIHRvIGZ1bmN0aW9uIGVudHJ5CgpBbmQgZGVsZXRl
IGFsbCBtY291bnQtZHluLlMgbW9kaWZpY2F0aW9uLgoKPiA+Pgo+ID4+ICt9Cj4gPj4gKwo+ID4+
ICAjZW5kaWYgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAqLwo+ID4+Cj4gPj4g
ICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvbWNvdW50LWR5bi5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPj4g
aW5kZXggNDY2YzZlZjIxN2IxLi5iODljODVhNTg1NjkgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNv
dW50LWR5bi5TCj4gPj4gQEAgLTIzMyw2ICsyMzMsNyBAQCBFTkRQUk9DKGZ0cmFjZV9jYWxsZXIp
Cj4gPj4gICNlbHNlIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+PiAg
RU5UUlkoZnRyYWNlX3JlZ3NfY2FsbGVyKQo+ID4+ICAgICAgICAgU0FWRV9BQklfUkVHUyAxCj4g
Pj4gKyAgICAgICBSRUdfUyAgIHgwLCBQVF9UMShzcCkKPiA+PiAgICAgICAgIFBSRVBBUkVfQVJH
Uwo+ID4+Cj4gPj4gIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPj4gQEAgLTI0MSw3ICsyNDIsMTAgQEAg
ZnRyYWNlX3JlZ3NfY2FsbDoKPiA+Pgo+ID4+Cj4gPj4gICAgICAgICBSRVNUT1JFX0FCSV9SRUdT
IDEKPiA+PiArICAgICAgIGJuZXogICAgdDEsLkxkaXJlY3QKPiA+PiAgICAgICAgIGpyIHQwCj4g
Pj4gKy5MZGlyZWN0Ogo+ID4+ICsgICAgICAganIgdDEKPiA+PiAgRU5EUFJPQyhmdHJhY2VfcmVn
c19jYWxsZXIpCj4gPj4KPiA+PiAgRU5UUlkoZnRyYWNlX2NhbGxlcikKPiA+PiAtLQo+ID4+IDIu
MjAuMQo+ID4+Cj4gPgo+ID4KPiA+IC0tCj4gPiBCZXN0IFJlZ2FyZHMKPiA+ICBHdW8gUmVuCgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
