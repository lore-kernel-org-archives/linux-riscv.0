Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB35C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcQXWZ6I6mRaQ2IuxfeWYS53XEtnZJEc0Ohp7nUoooI=; b=GeQ7LlH3maF7nf
	c7z6fIS5loTN89spfLhV1RACySYkQnOsfYt8SMgZNmANUQtxh1no83hm69P6N3mKNO7KvjKcYh/UW
	eH7IQvSxLLm+MzPi7Oh+Q/BFTBaOU1Lon7aaZPLvxHfypYuBoW9hslohjYmF8BFegPDSZ665SMG9Z
	741WhP9cV/6JSyJszC62uV2JzGAWLY2mRcd6MDoVxY+p9IPzGjBZj2VT7rYGw/XtexAYgEOJCRyfg
	PC6h5hr6CqZgGrlm+Q7ZijJ6BWcbuJ8sXgxf9eVVH5ajzTweQ/1oV+Rc565ls3/pMhE8Ndo6NBHjk
	1dscOn5Jpuix/T5BB1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9onc-0000000APnf-0DdM;
	Tue, 29 Apr 2025 17:31:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9niC-0000000AEyW-0sJA
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 16:21:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ee6260fc7so403720f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745943695; x=1746548495; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4Wt+BZ71x/abgZTG5PyDsFpbW2D/kzzpuguZVbmGlc=;
        b=Gba8SYzv0/qvHjAJyHph5xD/rVPzMbRU/lfbDdA1TEqGnuMNtY5QdEvOf0AMdBrOLx
         adcdQKqSSyRsqqIaBwMqn0i9mvwkXLkQzdG2t0dHD+Sqwsim45mbADMYPJv1gwEi+p2Q
         Xkoov0HbZ9L7gfBNjeAWdyQwgUdcJ1NHouA7D6cs9pJI0NCQcPAxCDkr47vvKn0Yfa2d
         8FcbDv8KU5fDOswHxdCFQNhTkoutElv8+kFUqRRM+dJArEIu7Rhl+rzT54UGQdKtK8/7
         4QdJdMZDhojPsFGCEYJ/S1qgOo9kqwRWyY84BBrjvfOGkfqRaEVhYz0dnEgPN9MLE1AY
         tzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745943695; x=1746548495;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4Wt+BZ71x/abgZTG5PyDsFpbW2D/kzzpuguZVbmGlc=;
        b=OXdQ/cEgR4Q1a8FUxj5OmWUyz888dEtVdm8EX67sMfPEblLFBLh+tbs24NcZ9SZ2KG
         suHLx26guapt2oRwyEZ/E6OpV6I9ldUCnxW7eWtG2j4TNsO+q1lZngbCMdvzzWgl5jG/
         uHhzdkGIV13rU6nIux/uqfzi9AYROgEN0Alm4Fr8IK8ZlIzWIQU/OHteITpWmAzApdIK
         u6jBipNNfNpG1l6fNlsPtMhwldIwP29SEUDlC2996473d/9tZU1tNlNjF5i55XDED/2/
         md1eYcqv6tw9fWoSchyLU//wxXS/1VpuDEhFYPHNxC9ap3G/ItDYsLB4vBpwF4FTuufx
         Ae3g==
X-Forwarded-Encrypted: i=1; AJvYcCVIlxGGENO8maam82cvM6DOlqKLX6IQLaHglOXOWYELK8CttHVkKoUJStJuHJBP8CXDf1V6GKjo4ofq9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKfjYLfW55P0Re9PFKFUmNJp1kMAAJdlTRey/RHUoUzgq2CN0/
	NBFx19/Olf+dKsj0USRYlHX+gF9feZkNGWLVo3HuVfKwGGaHpXvmzs/1XDMTvMc=
X-Gm-Gg: ASbGncuFw42lkWO6mYK0Yy1/jJM20VZiOcbyHM3wqElvnkW2kn1EqmQu8JGa1+cLW3O
	nkenYTQhgBH2NC/7MMLBaiy33IclrD4X9ksYugZvbtPYTwnYeqKfRx8/bqYa95xGigx/DZTX4iG
	4r2CpIw7u7iZmjnItZ6wpBZk8WmMQDwvW+4JItfQbJyQOvs9L3a1lCQbzv85ERbBEaxbEoeTZvK
	EsbVrMFtz4oyGHePoWPyradTJJiWODiIjTD9m+WDXtfASIFjzcAzuFAcKHDsQjtyH6wRDQA1b/5
	Uz0YBUOxTjSO8nn4bNzoLKPn4ENZk8OzeErozf7LlFqm4NTP
X-Google-Smtp-Source: AGHT+IE7T1o3gyNSKYkssQg0Lf54mrrx8eDIwrOxAiax301n2e5FcgwZ3P+UeYD0s4r1YzAGb1Az4w==
X-Received: by 2002:adf:f4c7:0:b0:3a0:75ff:261f with SMTP id ffacd0b85a97d-3a075ff267amr3429312f8f.11.1745943694680;
        Tue, 29 Apr 2025 09:21:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e4641csm14226859f8f.80.2025.04.29.09.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:21:34 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 29 Apr 2025 18:21:33 +0200
Message-Id: <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <apatel@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
 <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
In-Reply-To: <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_092136_266539_C17A728B 
X-CRM114-Status: GOOD (  31.99  )
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

MjAyNS0wNC0yOVQyMDozMToxOCswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMzo1NeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gMjAyNS0wNC0yOVQxMToyNToz
NSswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Ogo+PiA+IE9uIE1v
biwgQXByIDI4LCAyMDI1IGF0IDExOjE14oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiAyMDI1LTA0LTI4VDE3OjUyOjI1KzA1
OjMwLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoKPj4gPj4gPiBPbiBUaHUsIEFw
ciAzLCAyMDI1IGF0IDU6MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1p
Y3JvLmNvbT4gd3JvdGU6Cj4+ID4+ID4+IEZvciBhIGNsZWFuZXIgc29sdXRpb24sIHdlIHNob3Vs
ZCBhZGQgaW50ZXJmYWNlcyB0byBwZXJmb3JtIHRoZSBLVk0tU0JJCj4+ID4+ID4+IHJlc2V0IHJl
cXVlc3Qgb24gdXNlcnNwYWNlIGRlbWFuZC4gIEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBtdWNo
IGJldHRlcgo+PiA+PiA+PiBpZiB1c2Vyc3BhY2Ugd2FzIGluIGNvbnRyb2wgb2YgdGhlIHBvc3Qt
cmVzZXQgc3RhdGUuCj4+ID4+ID4KPj4gPj4gPiBBcGFydCBmcm9tIGJyZWFraW5nIEtWTSB1c2Vy
LXNwYWNlLCB0aGlzIHBhdGNoIGlzIGluY29ycmVjdCBhbmQKPj4gPj4gPiBkb2VzIG5vdCBhbGln
biB3aXRoIHRoZToKPj4gPj4gPiAxKSBTQkkgc3BlYwo+PiA+PiA+IDIpIE9TIGJvb3QgcHJvdG9j
b2wuCj4+ID4+ID4KPj4gPj4gPiBUaGUgU0JJIHNwZWMgb25seSBkZWZpbmVzIHRoZSBlbnRyeSBz
dGF0ZSBvZiBjZXJ0YWluIENQVSByZWdpc3RlcnMKPj4gPj4gPiAobmFtZWx5LCBQQywgQTAsIGFu
ZCBBMSkgd2hlbiBDUFUgZW50ZXJzIFMtbW9kZToKPj4gPj4gPiAxKSBVcG9uIFNCSSBIU00gc3Rh
cnQgY2FsbCBmcm9tIHNvbWUgb3RoZXIgQ1BVCj4+ID4+ID4gMikgVXBvbiByZXN1bWluZyBmcm9t
IG5vbi1yZXRlbnRpdmUgU0JJIEhTTSBzdXNwZW5kIG9yCj4+ID4+ID4gICAgIFNCSSBzeXN0ZW0g
c3VzcGVuZAo+PiA+PiA+Cj4+ID4+ID4gVGhlIFMtbW9kZSBlbnRyeSBzdGF0ZSBvZiB0aGUgYm9v
dCBDUFUgaXMgZGVmaW5lZCBieSB0aGUKPj4gPj4gPiBPUyBib290IHByb3RvY29sIGFuZCBub3Qg
YnkgdGhlIFNCSSBzcGVjLiBEdWUgdG8gdGhpcywgcmVhc29uCj4+ID4+ID4gS1ZNIFJJU0MtViBl
eHBlY3RzIHVzZXItc3BhY2UgdG8gc2V0IHVwIHRoZSBTLW1vZGUgZW50cnkKPj4gPj4gPiBzdGF0
ZSBvZiB0aGUgYm9vdCBDUFUgdXBvbiBzeXN0ZW0gcmVzZXQuCj4+ID4+Cj4+ID4+IFdlIGNhbiBo
YW5kbGUgdGhlIGluaXRpYWwgc3RhdGUgY29uc2lzdGVuY3kgaW4gb3RoZXIgcGF0Y2hlcy4KPj4g
Pj4gV2hhdCBuZWVkcyBhZGRyZXNzaW5nIGlzIGEgd2F5IHRvIHRyaWdnZXIgdGhlIEtWTSByZXNl
dCBmcm9tIHVzZXJzcGFjZSwKPj4gPj4gZXZlbiBpZiBvbmx5IHRvIGNsZWFyIHRoZSBpbnRlcm5h
bCBLVk0gc3RhdGUuCj4+ID4+Cj4+ID4+IEkgdGhpbmsgbXBfc3RhdGUgaXMgY3VycmVudGx5IHRo
ZSBiZXN0IHNpZ25hbGl6YXRpb24gdGhhdCBLVk0gc2hvdWxkCj4+ID4+IHJlc2V0LCBzbyBJIGFk
ZGVkIGl0IHRoZXJlLgo+PiA+Pgo+PiA+PiBXaGF0IHdvdWxkIGJlIHlvdXIgcHJlZmVycmVkIGlu
dGVyZmFjZSBmb3IgdGhhdD8KPj4gPj4KPj4gPgo+PiA+IEluc3RlYWQgb2YgY3JlYXRpbmcgYSBu
ZXcgaW50ZXJmYWNlLCBJIHdvdWxkIHByZWZlciB0aGF0IFZDUFUKPj4gPiB3aGljaCBpbml0aWF0
ZXMgU0JJIFN5c3RlbSBSZXNldCBzaG91bGQgYmUgcmVzZXR0ZWQgaW1tZWRpYXRlbHkKPj4gPiBp
bi1rZXJuZWwgc3BhY2UgYmVmb3JlIGZvcndhcmRpbmcgdGhlIHN5c3RlbSByZXNldCByZXF1ZXN0
IHRvCj4+ID4gdXNlciBzcGFjZS4KPj4KPj4gVGhlIGluaXRpYXRpbmcgVkNQVSBtaWdodCBub3Qg
YmUgdGhlIGJvb3QgVkNQVS4KPj4gSXQgd291bGQgYmUgc2FmZXIgdG8gcmVzZXQgYWxsIG9mIHRo
ZW0uCj4KPiBJIG1lYW50IGluaXRpYXRpbmcgVkNQVSBhbmQgbm90IHRoZSBib290IFZDUFUuIEN1
cnJlbnRseSwgdGhlCj4gbm9uLWluaXRpYXRpbmcgVkNQVXMgYXJlIGFscmVhZHkgcmVzZXR0ZWQg
YnkgVkNQVSByZXF1ZXN0cwo+IHNvIG5vdGhpbmcgc3BlY2lhbCBuZWVkcyB0byBiZSBkb25lLgoK
Q3VycmVudGx5LCB3ZSBtYWtlIHRoZSByZXF1ZXN0IG9ubHkgZm9yIFZDUFVzIGJyb3VnaHQgdXAg
YnkgSFNNIC0tIHRoZQpub24tYm9vdCBWQ1BVcy4gIFRoZXJlIGlzIGEgc2luZ2xlIFZDUFUgbm90
IGJlaW5nIHJlc2V0IGFuZCByZXNldHRpbmcKdGhlIHJlc2V0IGluaXRpYXRpbmcgVkNQVSBjaGFu
Z2VzIG5vdGhpbmcuIGUuZy4KCiAgMSkgVkNQVSAxIGluaXRpYXRlcyB0aGUgcmVzZXQgdGhyb3Vn
aCBhbiBlY2FsbC4KICAyKSBBbGwgVkNQVXMgYXJlIHN0b3BwZWQgYW5kIHJldHVybiB0byB1c2Vy
c3BhY2UuCiAgMykgVXNlcnNwYWNlIHByZXBhcmVzIFZDUFUgMCBhcyB0aGUgYm9vdCBWQ1BVLgog
IDQpIFZDUFUgMCBleGVjdXRlcyB3aXRob3V0IGdvaW5nIHRocm91Z2ggS1ZNIHJlc2V0IHBhdGhz
LgoKVGhlIHBvaW50IG9mIHRoaXMgcGF0Y2ggaXMgdG8gcmVzZXQgdGhlIGJvb3QgVkNQVSwgc28g
d2UgcmVzZXQgdGhlIFZDUFUKdGhhdCBpcyBtYWRlIHJ1bm5hYmxlIGJ5IHRoZSBLVk1fU0VUX01Q
X1NUQVRFIElPQ1RMLgoKRm9yIGRlc2lnbiBhbHRlcm5hdGl2ZXMsIGl0IGlzIGFsc28gcG9zc2li
bGUgdG8gcmVzZXQgaW1tZWRpYXRlbHkgaW4gYW4KSU9DVEwgaW5zdGVhZCBvZiBtYWtpbmcgdGhl
IHJlc2V0IHJlcXVlc3QuCgo+PiBZb3UgYWxzbyBwcmV2aW91c2x5IG1lbnRpb25lZCB0aGF0IHdl
IG5lZWQgdG8gcHJlc2VydmUgdGhlIHByZS1yZXNldAo+PiBzdGF0ZSBmb3IgdXNlcnNwYWNlLCB3
aGljaCBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCBhbmQgaXQgaXMgd2h5IHRoZQo+PiByZXNldCBo
YXBwZW5zIGxhdGVyLgo+Cj4gWWVzLCB0aGF0IHdhcyBvbmx5IGZvciBkZWJ1ZyBwdXJwb3NlcyBm
cm9tIHVzZXIgc3BhY2UuIEF0IHRoZQo+IG1vbWVudCwgdGhlcmUgaXMgbm8gb25lIHVzaW5nIHRo
aXMgZm9yIGRlYnVnIHB1cnBvc2VzIHNvIHdlCj4gY2FuIHNhY3JpZmljZSB0aGF0LgoKV2Ugc3Rp
bGwgY2FuJ3QgaW1tZWRpYXRlbHkgcmVzZXQgdGhlIGJvb3QgVkNQVSwgYmVjYXVzZSBpdCBtaWdo
dCBhbHJlYWR5CmJlIGluIHVzZXJzcGFjZS4gIFdlIGRvbid0IHJlYWxseSBiZW5lZml0IGZyb20g
aW1tZWRpYXRlbHkgcmVzZXR0aW5nIHRoZQppbml0aWF0aW5nIFZDUFUuCkFsc28sIG1ha2luZyB0
aGUgcmVzZXQgcmVxdWVzdCBmb3IgYWxsIFZDUFVzIGZyb20gdGhlIGluaXRpYXRpbmcgVkNQVQpo
YXMgc29tZSB1bmRlc2lyYWJsZSByYWNlIGNvbmRpdGlvbnMgd2Ugd291bGQgaGF2ZSB0byBwcmV2
ZW50LCBzbyBJIGRvCnByZWZlciB3ZSBnbyB0aGUgSU9DVEwgcmVzZXQgd2F5LgoKPj4gPiAgICAg
ICAgICAgICBUaGlzIHdheSB3ZSBhbHNvIGZvcmNlIEtWTSB1c2VyLXNwYWNlIHRvIGV4cGxpY2l0
bHkKPj4gPiBzZXQgdGhlIFBDLCBBMCwgYW5kIEExIGJlZm9yZSBydW5uaW5nIHRoZSBWQ1BVIGFn
YWluIGFmdGVyCj4+ID4gc3lzdGVtIHJlc2V0Lgo+Pgo+PiBXZSBhbHNvIHdhbnQgdG8gY29uc2lk
ZXIgcmVzZXQgZnJvbSBlbXVsYXRpb24gb3V0c2lkZSBvZiBLVk0uCj4+Cj4+IFRoZXJlIGlzIGEg
InNpbXBsZSIgc29sdXRpb24gdGhhdCBjb3ZlcnMgZXZlcnl0aGluZyAoZXhjZXB0IHNwZWVkKSAt
LQo+PiB0aGUgdXNlcnNwYWNlIGNhbiB0ZWFyIGRvd24gdGhlIHdob2xlIFZNIGFuZCByZS1jcmVh
dGUgaXQuCj4+IERvIHdlIHdhbnQgdG8gZG8gdGhpcyBpbnN0ZWFkIGFuZCBkcm9wIGFsbCByZXNl
dHMgZnJvbSBLVk0/Cj4KPiBJIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRoZSBWQ1BVIHJlc2V0cyBp
biBLVk0gc28gdGhhdCBoYW5kbGluZwo+IG9mIHN5c3RlbSByZXNldCBoYW5kbGluZyBpbiB1c2Vy
IHNwYWNlIHJlbWFpbnMgc2ltcGxlLiBUaGUgdXNlcgo+IHNwYWNlIGNhbiBhbHNvIHJlLWNyZWF0
ZSB0aGUgVk0gdXBvbiBzeXN0ZW0gcmVzZXQgYnV0IHRoYXQgaXMKPiB1c2VyIHNwYWNlIGNob2lj
ZS4KCk9rLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
