Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DF6C83F17
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YQR6R9ZGZTKRnzk1oxNQFO6CTP5UyJ/cIeyp20WwuI=; b=yR41lXMEEXQ+BF
	on9oDdfyU0HgcuLO6iEOtxUaxNbHSVe5z6V9/p9Pcscm3AVqOpiyXRaNLzJjaXoDotKDDbtt6nZpI
	28Mu5dOGdrH2lqPgd07ULmfPzaA/NSsDWTAfIWEBGsMThWDTVqhwO0cWSCdioueZmkFQ0t9YHXd2v
	hcswRQDKyuE6p1D5KAF656ucd0NETGi2p+qr4Kg2nK+49uZA27DL9vDwzMvFnGdK24ykACAvf9bT3
	phFxEBS1D/iaFeuxg+UQ89l0x/PoPauigNLCGWWoiAsPB1wgiPTwYwg0ipBTs02zS/6cBbESEMIXw
	XrXOYoP74RTMvDFFjkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCaQ-00BrJO-0l;
	Thu, 07 Sep 2023 10:50:10 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCaN-00BrGG-0B
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 10:50:09 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-792979d4cb5so34617139f.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694083805; x=1694688605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brKbRdx1kpGoO2Y9NjS4SFjuuPU0IFk1738Z4hW7QPE=;
        b=E+fGE0GYqn4zDMjh0Z3LE+JF1uZlpfHMuKGrZc3CCXdW2sZz9tmtfjrmOmhm9syACV
         wOscxO93rAVSJQg+Fax+PQfNcrn8BO6fzsK9WKgdjpQmuywEh9c5rb/YXcx1bIQt9L89
         OnyvyUmRRZYnrF4YMJQidbHtatYkojLePvMdZnvJuKje1x11b3cKsIDMVidHXNo6K97F
         3DJi8y0Ups2dwswfu9UrYFndJiG24s+re1jW1ZFvhwZOCSHJ5Nvd9OSdhIEnz/eozpQK
         gEuUG/ap7fJ51dEVWLd+BAXvmfzFVCGaRi4xhL+705Z5MkU55F2gjHjEV8nAezveF8gT
         HGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083805; x=1694688605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brKbRdx1kpGoO2Y9NjS4SFjuuPU0IFk1738Z4hW7QPE=;
        b=POo7XbhAB/l+4BwcxpcLmMJnFPytiw2WpT3Qh/A75NCMNl7/fGp3chCzwV9Lc7dB/O
         nOGRDrSdeXxD7z9gzjamJit6IF0Yjm+MnHkeO8IjYbuOB+oMEtcQJjb70NdKhMmnUVWC
         0wpLp1P3iSSzBNLS4ti4LA23jckomidiUfveHBfLRI4IHLSpOSxkOrguRa34+jD2TSMK
         ySOnlnTD8tO6lzT4WdTfZrOHTzInffjBZ9Q8JYJqb068YAbDb5uUKEY4SbDRYNqa2s7Z
         XntIGLUO3WsTjW/bO4kbzllvJrme+Ni16qcyds56LM7gnHUge7kltZR836Ic/NoesluA
         ugYA==
X-Gm-Message-State: AOJu0YzHD0Rf3VebLyADrcvgTESj2O2s4BA7wtP1ib9eXvdz8WOtjcMt
	0Fft0TTqbZhBhOm8nOkV1uuBFTjnw5FUsjIe/H8=
X-Google-Smtp-Source: AGHT+IEB2hO+TGGIAGO65G3+5LgFgJwUd0dqMX6Dw9arpoFxlY11pB1Z3e5xVZisoM3mAw7p9kKP6mypD/66ucf4p3s=
X-Received: by 2002:a6b:d315:0:b0:787:ff98:c38c with SMTP id
 s21-20020a6bd315000000b00787ff98c38cmr21570759iob.10.1694083805330; Thu, 07
 Sep 2023 03:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
 <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
 <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com>
 <CA+V-a8s0i=VMSbMa6WvOiZpqe_idAhq4cZ0inSdCNy39-rQeAg@mail.gmail.com>
 <CAHVXubjgjAwMOi0J5zZJkuX8RKwgfKp-_=tVTLDvKN=tBBdxNQ@mail.gmail.com>
 <CA+V-a8uxe=sT7oX4Dk4zppCbYzWdZgWt9Xh4m+pA2+3t8kfnjg@mail.gmail.com> <CAHVXubitpk9RxMPc9+ss0y=ZmpOrfv0ocP+UDQktR=TM+gy=KQ@mail.gmail.com>
In-Reply-To: <CAHVXubitpk9RxMPc9+ss0y=ZmpOrfv0ocP+UDQktR=TM+gy=KQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 Sep 2023 11:49:03 +0100
Message-ID: <CA+V-a8tGGR8q1Wv=dJJKLkbAsfmH8p8Fn9Ycns7+1LCSzxvpZA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_035007_116564_E782F8CD 
X-CRM114-Status: GOOD (  48.63  )
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

SGkgQWxleGFuZHJlLAoKT24gVGh1LCBTZXAgNywgMjAyMyBhdCAxMDowNuKAr0FNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIs
Cj4KPiBPbiBXZWQsIFNlcCA2LCAyMDIzIGF0IDM6NTXigK9QTSBMYWQsIFByYWJoYWthcgo+IDxw
cmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQWxleGFuZHJlLAo+
ID4KPiA+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgMTo0M+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgU2VwIDYs
IDIwMjMgYXQgMjoyNOKAr1BNIExhZCwgUHJhYmhha2FyCj4gPiA+IDxwcmFiaGFrYXIuY3Nlbmdn
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSBBbGV4YW5kcmUsCj4gPiA+ID4K
PiA+ID4gPiBPbiBXZWQsIFNlcCA2LCAyMDIzIGF0IDE6MTjigK9QTSBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFdl
ZCwgU2VwIDYsIDIwMjMgYXQgMjowOeKAr1BNIExhZCwgUHJhYmhha2FyCj4gPiA+ID4gPiA8cHJh
Ymhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBI
aSBBbGV4YW5kcmUsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIFdlZCwgU2VwIDYsIDIwMjMg
YXQgMTowMeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBIaSBQcmFiaGFrYXIsCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBPbiBXZWQsIFNlcCA2LCAyMDIzIGF0IDE6NDnigK9QTSBMYWQsIFBy
YWJoYWthcgo+ID4gPiA+ID4gPiA+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSGkgQWxleGFuZHJlLAo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDEsIDIwMjMgYXQgOTo1OOKAr0FNIEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFRoaXMgZnVuY3Rpb24gdXNlZCB0byBzaW1wbHkgZmx1
c2ggdGhlIHdob2xlIHRsYiBvZiBhbGwgaGFydHMsIGJlIG1vcmUKPiA+ID4gPiA+ID4gPiA+ID4g
c3VidGlsZSBhbmQgdHJ5IHRvIG9ubHkgZmx1c2ggdGhlIHJhbmdlLgo+ID4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdlIGNhbiBvbmx5IHVzZSBQ
QUdFX1NJWkUgYXMgc3RyaWRlIHNpbmNlIHdlIGRvbid0IGtub3cKPiA+ID4gPiA+ID4gPiA+ID4g
dGhlIHNpemUgb2YgdGhlIHVuZGVybHlpbmcgbWFwcGluZyBhbmQgdGhlbiB0aGlzIGZ1bmN0aW9u
IHdpbGwgYmUgaW1wcm92ZWQKPiA+ID4gPiA+ID4gPiA+ID4gb25seSBpZiB0aGUgc2l6ZSBvZiB0
aGUgcmVnaW9uIHRvIGZsdXNoIGlzIDwgdGhyZXNob2xkICogUEFHRV9TSVpFLgo+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+ID4gPiA+ID4gPiAt
LS0KPiA+ID4gPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8
IDExICsrKysrLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ID4gPiA+
ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBBZnRlciBhcHBseWluZyB0aGlz
IHBhdGNoLCBJIGFtIHNlZWluZyBtb2R1bGUgbG9hZCBpc3N1ZXMgb24gUlovRml2ZQo+ID4gPiA+
ID4gPiA+ID4gKGNvbXBsZXRlIGxvZyBbMF0pLiBJIGFtIHRlc3RpbmcgZGVmY29uZmlnICsgWzFd
IChyei9maXZlIHJlbGF0ZWQKPiA+ID4gPiA+ID4gPiA+IGNvbmZpZ3MpLgo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IEFueSBwb2ludGVycyBvbiB3aGF0IGNvdWxkIGJlIGFuIGlzc3Vl
IGhlcmU/Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBDYW4geW91IGdpdmUgbWUgdGhlIGV4
YWN0IHZlcnNpb24gb2YgdGhlIGtlcm5lbCB5b3UgdXNlPyBUaGUgdHJhcAo+ID4gPiA+ID4gPiA+
IGFkZHJlc3NlcyBhcmUgdm1hbGxvYyBhZGRyZXNzZXMsIGFuZCBhIGZpeCBmb3IgdGhvc2UgbGFu
ZGVkIHZlcnkgbGF0ZQo+ID4gPiA+ID4gPiA+IGluIHRoZSByZWxlYXNlIGN5Y2xlLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IEkgYW0gdXNpbmcgbmV4dC0yMDIzMDkwNiwgSXZlIHB1c2hlZCBh
IGJyYW5jaCBbMV0gZm9yIHlvdSB0byBoYXZlIGEgbG9vay4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9wcmFiaGFrYXJsYWQvbGludXgvdHJlZS9yemZpdmUt
ZGVidWcKPiA+ID4gPiA+Cj4gPiA+ID4gPiBHcmVhdCwgdGhhbmtzLCBJIGhhZCB0byBnZXQgcmlk
IG9mIHRoaXMgcG9zc2liaWxpdHkgOikKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBcy1pcywgSSBoYXZl
IG5vIGlkZWEsIGNhbiB5b3UgdHJ5IHRvICJiaXNlY3QiIHRoZSBwcm9ibGVtPyBJIG1lYW4KPiA+
ID4gPiA+IHdoaWNoIHBhdGNoIGluIHRoZSBzZXJpZXMgbGVhZHMgdG8gdGhvc2UgdHJhcHM/Cj4g
PiA+ID4gPgo+ID4gPiA+IE9vcHMgc29ycnkgZm9yIG5vdCBtZW50aW9uaW5nIGVhcmxpZXIsIHRo
aXMgaXMgdGhlIG9mZmVuZGluZyBwYXRjaAo+ID4gPiA+IHdoaWNoIGxlYWRzIHRvIHRoZSBpc3N1
ZXMgc2VlbiBvbiByei9maXZlLgo+ID4gPgo+ID4gPiBPaywgc28gYXQgbGVhc3QgSSBmb3VuZCB0
aGUgZm9sbG93aW5nIHByb2JsZW0sIGJ1dCBJIGRvbid0IHNlZSBob3cKPiA+ID4gdGhhdCBjb3Vs
ZCBmaXggeW91ciBpc3N1ZTogY2FuIHlvdSBnaXZlIGEgdHJ5IGFueXdheT8gSSBrZWVwIGxvb2tp
bmcKPiA+ID4gaW50byB0aGlzLCB0aGFua3MKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gPiBpbmRl
eCBkZjJhMDgzOGMzYTEuLmI1NjkyYmM2Yzc2YSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4g
PiBAQCAtMjM5LDcgKzIzOSw3IEBAIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLAo+ID4gPiB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gPgo+ID4gPiAgdm9p
ZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxv
bmcgZW5kKQo+ID4gPiAgewo+ID4gPiAtICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKE5VTEwsIHN0
YXJ0LCBlbmQsIFBBR0VfU0laRSk7Cj4gPiA+ICsgICAgICAgX19mbHVzaF90bGJfcmFuZ2UoTlVM
TCwgc3RhcnQsIGVuZCAtIHN0YXJ0LCBQQUdFX1NJWkUpOwo+ID4gPiAgfQo+ID4gPgo+ID4gSSBh
bSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCB0aGUgYWJvdmUgY2hhbmdlIHRvby4K
Pgo+IEkgY2FuJ3QgcmVwcm9kdWNlIHRoZSBwcm9ibGVtIG9uIG15IFVubWF0Y2hlZCBvciBRZW11
LCBzbyBpdCBpcyBub3QKPiBlYXN5IHRvIGRlYnVnLiBCdXQgSSB0b29rIGFub3RoZXIgbG9vayBh
dCB5b3VyIHRyYWNlcyBhbmQgc29tZXRoaW5nIGlzCj4gd2VpcmQgdG8gbWUuIEluIHRoZSBmb2xs
b3dpbmcgdHJhY2UgKGFuZCB0aGVyZSBpcyBhbm90aGVyIG9uZSksIHRoZQo+IHRyYXAgaXMgdGFr
ZW4gYXQgMHhmZmZmZmZmZjAxNWNhMDM0LCB3aGljaCBpcyB0aGUgYmVnaW5uaW5nIG9mCj4gcnpf
c3NpX3Byb2JlKCk6IHRoYXQncyBhIHBhZ2UgZmF1bHQsIHNvIG5vIHRyYW5zbGF0aW9uIHdhcyBm
b3VuZCAob3IKPiBhbiBpbnZhbGlkIG9uZSBpcyBjYWNoZWQpLgo+Cj4gWyAgIDE2LjU4NjUyN10g
VW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbAo+IGFkZHJl
c3MgZmZmZmZmZmYwMTVjYTAzNAo+IFsgICAxNi41OTQ3NTBdIE9vcHMgWyMzXQo+IC4uLgo+IFsg
ICAxNi42MjIwMDBdIGVwYyA6IHJ6X3NzaV9wcm9iZSsweDAvMHg1MmEgW3NuZF9zb2Nfcnpfc3Np
XQo+IC4uLgo+IFsgICAxNi43MDg2OTddIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRy
OiBmZmZmZmZmZjAxNWNhMDM0Cj4gY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGMKPiBbICAgMTYuNzE2
NTgwXSBbPGZmZmZmZmZmMDE1Y2EwMzQ+XSByel9zc2lfcHJvYmUrMHgwLzB4NTJhCj4gW3NuZF9z
b2Nfcnpfc3NpXQo+IC4uLgo+Cj4gQnV0IHRoZW4gaGVyZSB3ZSBhcmUgYWJsZSB0byByZWFkIHRo
ZSBjb2RlIGF0IHRoaXMgc2FtZSBhZGRyZXNzOgo+IFsgICAxNi44MjE2MjBdIENvZGU6IDAxMDkg
NjU5NyAwMDAwIDg1OTMgNWY2NSA3MDk3IDdmMzQgODBlNyA3YWEwIGI3YTkKPiAoNzEzOSkgZjgy
Mgo+Cj4gU28gdGhhdCBsb29rcyBsaWtlIGEgInRyYW5zaWVudCIgZXJyb3IuIERvIHlvdSBrbm93
IGlmIHlvdSB1YXJjaAo+IGNhY2hlcyBpbnZhbGlkIFRMQiBlbnRyaWVzPyBJZiB5b3UgZG9uJ3Qg
a25vdywgSSBoYXZlIGp1c3Qgd3JpdHRlbgo+IHNvbWUgcGllY2Ugb2YgY29kZSB0byBkZXRlcm1p
bmUgaWYgaXQgZG9lcywgbGV0IG1lIGtub3cuCj4KTm8gSSBkb250LCBjYW4geW91IHBsZWFzZSBz
aGFyZSB0aGUgZGV0YWlscyBzbyB0aGF0IEkgY2FuIHBhc3Mgb24gdGhlCmluZm9ybWF0aW9uIHRv
IHlvdS4KCj4gRG8gdGhvc2UgZXJyb3JzIGFsd2F5cyBoYXBwZW4/Cj4KWWVzIHRoZXkgZG8uCgpD
aGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
