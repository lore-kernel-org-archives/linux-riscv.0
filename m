Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F30C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:29:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D41224D2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D41224D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=noM0xJFcMawPsW18K8Yuvd0mWcdf3beWkHdzgRAHmQo=; b=bfmZ+VQzyYwNdchHyGFHbeLVW
	LU7BoU7zVvWc8b6vGevV/TtGbMoam5QJTnN3gNrc4EK7bQGlY6g3q6oXxq1xodvpd5i9WHz2B4v/d
	Pq2KHRydkKvZJ3FEo4E4XAkMqdycWWy8u/QAN00EnVB0HNGThJKGXiI7C+k87EjxgMisWFNkUI5sP
	Xu8qZiHw20lVvDMyXt9yTkQa58mWUwjzucMM6+4iDz8DFw8Rz+d/tCbca18oWHt3h4PVstY+5SXwK
	qQRP4swZcTjOGkcyY03ATFOqFqQtlgYUZpNbPgEMPO3TrIg2kjN7Lci0XCqPudc8G4X6mCFkibWfn
	QxtM7VksQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kroHG-0007jW-VI; Tue, 22 Dec 2020 20:29:02 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kroHE-0007ir-LI
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 20:29:01 +0000
Received: by mail-io1-xd29.google.com with SMTP id i18so13159348ioa.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 12:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OTjpbzYdqfy5holAtVpMy0B5i/Z0HCSXKXt74XUjUwM=;
 b=rxV0TSHX2r1WwoMSddhqhSJMOtzqynd22XcR0IasHMZI8T5Ouh5kBAjpkFzut9/eUT
 1mN5HNo49/m3xvx7t8fcx8MZ1S0UIm5fBmP5OT8/aKPTQ5Zkvalw/i1GFMvIT5Y6Wr01
 bfMJ6KYML0r3lFBG+SUK2nn+wK8zzlPQJlihc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OTjpbzYdqfy5holAtVpMy0B5i/Z0HCSXKXt74XUjUwM=;
 b=Z8OcS9aX9dlKiM/88G1twpvLFqU2jaKVIzgs4I/lSzgmc9rHSykzViXnrLR9c25IG9
 wpW/ptemEjp9E9/25i4u9jlOaFRgYdKd5g/w8junxThKMPBxgyPkvjoaY61fSS27feBp
 9YMo52q/dujwdIGpVf7B38uXkMZifH/fOVm3l8Q9Hu2OyxTW2OzkKNmgxWMWxFjYByiF
 s9TavxITxHMy16du68eTTPxd4erQugmUoiWmmGBD+ldCiwQBKCjQ1xTf3Lof5CQDuPik
 YANTSzuHuq67BpcNKSUbkt2GZRJzupvVc5/F8QLEhqOycVfmlCgEb3gETQtzynsTGoLB
 8iZQ==
X-Gm-Message-State: AOAM531a9AXftTH4gfjm9IdCtgLMsDBXwDnA66CAQ8PfRaBTZBXaLKka
 HsqBb7ckuKv9JDR0FUH+lDwEMSmRxv3m3rcYZAzP0o6GPWQa9SU=
X-Google-Smtp-Source: ABdhPJzTMIJllL6FWzYT4NDN0l4KUevQysMzf3L2QkUqr5KjoRWeoj5NkIFT9q/63k0XxRNObZ+pjP9PyPErQGuIGew=
X-Received: by 2002:a02:ac18:: with SMTP id a24mr20186071jao.24.1608668939009; 
 Tue, 22 Dec 2020 12:28:59 -0800 (PST)
MIME-Version: 1.0
References: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
 <CAOnJCU+RXxiP+_qK=H_d30tUg1-GMo5PDk+WBVFLumquXYUNNQ@mail.gmail.com>
In-Reply-To: <CAOnJCU+RXxiP+_qK=H_d30tUg1-GMo5PDk+WBVFLumquXYUNNQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Dec 2020 12:28:48 -0800
Message-ID: <CAOnJCUKuywqBd+E2gtPnsJMdcQUqS2P734CYWuOPavprhkAa3g@mail.gmail.com>
Subject: Re: ftrace_init doesn't patch _mcount calls on boot
To: Varad Gautam <varad.gautam@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_152900_722968_241380A5 
X-CRM114-Status: GOOD (  22.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgMTI6MTggUE0gQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlz
aHBhdHJhLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAyMiwgMjAyMCBhdCAyOjUzIEFNIFZh
cmFkIEdhdXRhbSA8dmFyYWQuZ2F1dGFtQHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+
Cj4gPiBJJ20gb2JzZXJ2aW5nIHRoZSBmb2xsb3dpbmcgb24gcWVtdSB3aXRoIENPTkZJR19EWU5B
TUlDX0ZUUkFDRT15Ogo+ID4KPiA+IHJvb3RAZGViaWFuOi9zeXMva2VybmVsL2RlYnVnL3RyYWNp
bmcjIGVjaG8gZnVuY3Rpb24gPiBjdXJyZW50X3RyYWNlcgo+ID4gWyAgIDczLjY3NDI2NV0gKF9f
X19wdHJ2YWxfX19fKTogZXhwZWN0ZWQgKDAwMDAwMDEzIDAwMDAwMDEzKSBidXQgZ290Cj4gPiAo
MDAwMDYwOTcgYTM4MDgwZTcpCj4gPiBbICAgNzMuNjc1MTQ0XSAtLS0tLS0tLS0tLS1bIGZ0cmFj
ZSBidWcgXS0tLS0tLS0tLS0tLQo+ID4gWyAgIDczLjY3NTY2NV0gZnRyYWNlIGZhaWxlZCB0byBt
b2RpZnkKPiA+IFsgICA3My42NzY1NDhdIFs8ZmZmZmZmZTAwMDAwMjAxMD5dIF9zdGV4dCsweDEw
LzB4M2MKPiA+IFsgICA3My42Nzc2NDFdICBhY3R1YWw6ICAgOTc6NjA6MDA6MDA6ZTc6ODA6ODA6
YTMKPiA+IFsgICA3My42Nzg1MzRdIFNldHRpbmcgZnRyYWNlIGNhbGwgc2l0ZSB0byBjYWxsIGZ0
cmFjZSBmdW5jdGlvbgo+ID4gWyAgIDczLjY3ODg0Ml0gZnRyYWNlIHJlY29yZCBmbGFnczogODAw
MDAwMDEKPiA+IFsgICA3My42NzkwODhdICAoMSkKPiA+IFsgICA3My42NzkwODhdICBleHBlY3Rl
ZCB0cmFtcDogZmZmZmZmZTAwMDAwODAyMAo+ID4gWyAgIDczLjY3OTY4N10gLS0tLS0tLS0tLS0t
WyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPgo+ID4gVGhpcyBjb21lcyBmcm9tIGZ0cmFjZV9j
aGVja19jdXJyZW50X2NhbGwoKSwgd2hpY2ggZW5zdXJlcyB0aGF0IHRoZQo+ID4gcGF0Y2ggdGFy
Z2V0IGxvY2F0aW9uIGlzIHNldCB0byBOT1BzIGJlZm9yZSBwYXRjaGluZyBpdCB3aXRoIGEKPiA+
IGBhdWlwYy9qYWxyIE1DT1VOVF9BRERSYCBzZXF1ZW5jZSB3aGVuIGZ0cmFjZSBpcyBlbmFibGVk
Cj4gPiAoZnRyYWNlX25vcF9pbml0aWFsaXplIC0+IGZ0cmFjZV9pbml0X25vcCAtPiBmdHJhY2Vf
bWFrZV9ub3AgLT4KPiA+IGZ0cmFjZV9jaGVja19jdXJyZW50X2NhbGwpLgo+ID4KPiA+IER1bXBp
bmcgYSBmZXcgZnVuY3Rpb24gcHJvbG9ndWVzIGZyb20gbWVtb3J5IGJlZm9yZSBlbmFibGluZyBm
dHJhY2UsIEkKPiA+IHNlZSB0aGF0IGJvb3QtdGltZSBwYXRjaGluZyBkaWRuJ3Qgd29yayBhcyBl
eHBlY3RlZC4gVGhlIGZ0cmFjZV9zdHViCj4gPiBjYWxsIHNlcXVlbmNlIHN0aWxsIGV4aXN0cywg
d2hpY2ggc2hvdWxkIGhhdmUgYmVlbiBwYXRjaGVkIG92ZXIgYnkgTk9Qcy4KPiA+Cj4gPiAoZ2Ri
KSB4LzEwaSBibGtfcHV0X3JlcXVlc3QKPiA+ICAgICBbLi4uXQo+ID4gICAgIDB4ZmZmZmZmZTAw
MDMxNjliYSA8YmxrX3B1dF9yZXF1ZXN0KzE0PjogICAgIGF1aXBjICAgcmEsMHhmZmNmMQo+ID4g
ICAgIDB4ZmZmZmZmZTAwMDMxNjliZSA8YmxrX3B1dF9yZXF1ZXN0KzE4PjogICAgIGphbHIgICAg
NDQ2KHJhKQo+ID4KPiA+IChnZGIpIGRpc2FzIGJsa19wdXRfcmVxdWVzdAo+ID4gRHVtcCBvZiBh
c3NlbWJsZXIgY29kZSBmb3IgZnVuY3Rpb24gYmxrX3B1dF9yZXF1ZXN0Ogo+ID4gICAgIFsuLi5d
Cj4gPiAgICAgMHhmZmZmZmZlMDAwMzE2OWJhIDwrMTQ+OiAgICBhdWlwYyAgIHJhLDB4ZmZjZjEK
PiA+ICAgICAweGZmZmZmZmUwMDAzMTY5YmUgPCsxOD46ICAgIGphbHIgICAgNDQ2KHJhKSAjIDB4
ZmZmZmZmZTAwMDAwN2I3OAo+ID4gPGZ0cmFjZV9zdHViPgo+ID4KPiA+IERpZ2dpbmcgZnVydGhl
ciwgSSBmaW5kIHRoYXQgdGhlIGNvcHlfdG9fa2VybmVsX25vZmF1bHQoKSB3cmFwcGVkIGluCj4g
PiBwYXRjaF9pbnNuX3dyaXRlKCkgcmV0dXJucyB3aXRob3V0IHRoZSB3cml0ZSBnb2luZyB0aHJv
dWdoLiBSZXBsYWNpbmcKPiA+IHRoaXMgd2l0aCBhIG1lbWNweSBob3dldmVyLCBtYWtlcyBmdHJh
Y2Ugd29yayBhcyBleHBlY3RlZC4KPiA+Cj4gPiBJJ2xsIGJlIGxvb2tpbmcgaW50byBxZW11J3Mg
ZW11bGF0aW9uIGZvciBjb3B5X3RvX2tlcm5lbF9ub2ZhdWx0KCkgbmV4dCwKPiA+IGJ1dCBJJ2Qg
bGlrZSB0byBjaGVjayBpZiBzb21lb25lIGVsc2UgY2FuIHJlcHJvZHVjZSB0aGlzIGJlaGF2aW9y
IHdpdGgKPiA+IENPTkZJR19EWU5BTUlDX0ZUUkFDRT15Lgo+ID4KPgo+IERvZXMgdGhpcyBmaXgg
dGhlIGlzc3VlID8KPgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzEwLzIxLzc3Cj4KCmFu
ZCB0aGlzIHNlcmllcy4gSXQgdHJpZXMgdG8gbW92ZSB0byBmZW50cnkgZnJvbSBtY291bnQuIEd1
byBmaXhlZCBhCmtlcm5lbCBwYW5pYyBpbiB0aGlzIGFzIHdlbGwuCgpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2VyaWVzPTQwMzY4NQoKPiA+
IEtlcm5lbCA6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9yaXNjdi9saW51eC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTdkOTVhODhmOTI1NGI3
MTFhM2E5NTEwNmZjNzNmNmEzYTk4NjZhNDAKPiA+Cj4gPiBUaGFua3MsCj4gPiBWYXJhZAo+ID4K
PiA+IC0tCj4gPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPiA+IE1heGZl
bGRzdHIuIDUKPiA+IDkwNDA5IE7DvHJuYmVyZwo+ID4gR2VybWFueQo+ID4KPiA+IEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnCj4gPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVy
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cj4KPgo+Cj4gLS0KPiBSZWdhcmRzLAo+IEF0aXNoCgoKCi0tIApSZWdhcmRzLApBdGlz
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
