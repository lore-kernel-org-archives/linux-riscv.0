Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7000EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5qm8MFG//l5aHrTWNJBCMDg2QXtPxhyehDz1G21uP/k=; b=au1jCK636jtHoNo7rep8V/1P/T
	VYTvQUOWkbI43AbmslRjCootUSmqqFwANEEieONPQqQ344B4Rgx7nZi0rmjqzEO6SjMSn6OA20mu4
	ZtXU4FuJFwqn95qSoHs8BKjVSO1tShr3b6FdNnFiif05rV11xaX+hvfE/EAnDha2ptmVMQoV9KQlV
	J7Xa1Mi4JFrmXdY/gymED8jbIE25h5fcbgZzXvvmhm2HD8ZhzoOnEya5ILSVGJo2RGo5BsDy8evX3
	hHjC5huYAGSXHJYsltpaGjZRtrRO+ZWfuoSRYis1+XuzGiqjPWhX0EQoEYvnn9fAwYwgGOcZKMeN2
	faMjVfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOOC-001NAg-2E;
	Thu, 22 Jun 2023 17:46:36 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOO9-001NA4-1r
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 17:46:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-54fb23ff7d3so3884206a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687455992; x=1690047992;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3g1kX5EMD1FCLy8k9DY4HJHEdrclO2Id0GTE8XaK54=;
        b=PGY1iv0lzSAwgaLm8qoo8sV1X1q1+k8lB4e5qt0KpELi1frrWDZTmC/E8L+xpvyKVj
         ThyOdqec1emu2EdcvP7g9wY8/U/Ap1e/93sOqyJ6fiZCYxR5d9Q+QAT2X7Zu7xzWo5Vj
         9oKCsdDx0mE+pnjFpiNHrHf8dwjywv+aL+2KkdBZe5j/6/b+Cu+yAi1cEXEvMP3uG3Cy
         tD6ylVu4s9gr8virKgjz2yaEmndM9lCv5OWjunFTXjAdf8mqBZ6GgRfO7ybFrdGHLziX
         ELxqDAW4/j/r2fYqbMmV2wQzbnD8KkVvWgUMeT/eJwGKa0xF0xojXe9NzpgvVtblTQOp
         vV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455992; x=1690047992;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3g1kX5EMD1FCLy8k9DY4HJHEdrclO2Id0GTE8XaK54=;
        b=eVz5wopfTXzbetU1SMojZiA37uTNFu2BbS0OrlZPB+Cq/SeCitLz+rJasRfTIEUI+6
         5063tJaMqtzWVuc8bUpa8nuPhoDxzzvPJAdG1oeh15HS/K3vDH1/oetRBlcGNLY3yOdY
         LDwGpPAMmEH/hGZ65hoGSuy1U8vZqlufVjr047w2o4kdF9cdLW/hdx9/vUgSFrw9mwgE
         PCJfhVZbWPkbSERribWm6likzm2qE2J573qvZAcNNO45NUqgZNwZywija9c0dEmS7lq2
         LzTVUnnYyPw8Mpqo7vGK/QzRhpY0Ao0iDoAgsmlv8yvpjgsalqUTu7eteFLd+IgO/6sb
         UYOg==
X-Gm-Message-State: AC+VfDxFKGa0y1bOY+RgPMGDW22oPMcHHfMH8adRns4nKVrmVD9Mw7GE
	smoKSSf7lzn9j7SUPRIF/4RXJQ==
X-Google-Smtp-Source: ACHHUZ4AP5ZV62BeieR8PqE8TcpqZtf2tmgORCE7MP8Q7zOL2rv+3UiJ7qvG9NdcdU0pi7xw3gGipw==
X-Received: by 2002:a17:90b:1953:b0:25e:b5b9:c2f1 with SMTP id nk19-20020a17090b195300b0025eb5b9c2f1mr12282340pjb.39.1687455991741;
        Thu, 22 Jun 2023 10:46:31 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id li14-20020a17090b48ce00b00256dff5f8e3sm16139pjb.49.2023.06.22.10.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:46:31 -0700 (PDT)
Date: Thu, 22 Jun 2023 10:46:31 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 10:45:50 PDT (-0700)
Subject: Re: [PATCH] riscv: Discard vector state on syscalls
In-Reply-To: <20230622173613.30722-1-bjorn@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
  linux@rivosinc.com, remi@remlab.net, Darius Rad <darius@bluespec.com>, andy.chiu@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org
Message-ID: <mhng-5f8ae912-3b56-4eda-bdfa-1de31a7c93e0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_104633_860964_C0F35CFD 
X-CRM114-Status: GOOD (  28.44  )
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

T24gVGh1LCAyMiBKdW4gMjAyMyAxMDozNjoxMyBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBU
aGUgUklTQy1WIHZlY3RvciBzcGVjaWZpY2F0aW9uIHN0YXRlczoKPiAgIEV4ZWN1dGluZyBhIHN5
c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2FsbGVyLXNhdmVkIHZlY3RvciByZWdpc3RlcnMKPiAgICh2
MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZzdGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCj4KPiBU
aGUgdmVjdG9yIHJlZ2lzdGVycyBhcmUgY2xlYXJlZCwgdmlsbCBpcyBzZXQgKGludmFsaWQpLCBh
bmQgdGhlCj4gdmVjdG9yIHN0YXR1cyBpcyBzZXQgdG8gSW5pdGlhbC4KPgo+IFRoYXQgd2F5IHdl
IGNhbiBwcmV2ZW50IHVzZXJzcGFjZSBmcm9tIGFjY2lkZW50YWxseSByZWx5aW5nIG9uIHRoZQo+
IHN0YXRlZCBzYXZlLgo+Cj4gUsOpbWkgcG9pbnRlZCBvdXQgWzFdIHRoYXQgY2xlYXJpbmcgdGhl
IHJlZ2lzdGVycyBtaWdodCBiZSBzdXBlcmZsdW91cywKPiBhbmQgc2V0dGluZyB2aWxsIGlzIHN1
ZmZpY2llbnQuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8x
Mjc4NDMyNi45VVBQSzNNQWVCQGJhc2lsZS5yZW1sYWIubmV0LyAjIFsxXQo+IFN1Z2dlc3RlZC1i
eTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBS
w6ltaSBEZW5pcy1Db3VybW9udCA8cmVtaUByZW1sYWIubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KPgo+IEkgZmlndXJlZCBJJ2Qg
c2VudCBvdXQgYSBwcm9wZXIgcGF0Y2guIEkgbGlrZSBBbmR5J3Mgb3B0aW1pemF0aW9uCj4gcGF0
Y2gsIGJ1dCBUQkggSSB0aGluayB3ZSBzaG91bGQgZG8gdGhhdCBhcyBhIGZvbGxvdyB1cC4KPgo+
IEFzIFLDqW1pIHBvaW50ZWQgb3V0LCB0aGUgY2xlYXJpbmcgbWlnaHQgYmUgb3B0ZWQgb3V0LCBi
dXQgSSBsZWZ0IGl0IGluCj4gaGVyZS4KCkkgdGhpbmsgd2UncmUgZ29pbmcgdG8gZW5kIHVwIHdp
dGggYSBidW5jaCBvZiB1YXJjaC1zcGVjaWZpYyBzdHVmZiBoZXJlLCAKYnV0IGZvciBub3cgaGF2
aW5nIHRoZSBoZWF2eSBoYW1tZXIgc2VlbXMgc2FmZXN0LiAgVGhlcmUncyBubyBWIGhhcmR3YXJl
IAp5ZXQgc28gd2UgY2FuJ3QgcmVhbGx5IHRlbGwgaG93IGFueXRoaW5nIHBlcmZvcm1zLCBhdCBs
ZWFzdCB0aGlzIHdheSAKd2UncmUgZGVmaW5hdGVseSBub3QgbGVha2luZyBhbnl0aGluZy4KClNv
IEknbSBPSyB3aXRoIHRoaXMuICBJJ2QgYWxzbyBiZSBmaW5lIHdpdGggY2xlYXJpbmcgdG8gYWxs
LTFzLCBJIHRoaW5rIAppdCdzIGtpbmQgb2Ygc3BsaXR0aW5nIGhhaXJzIGF0IHRoaXMgcG9pbnQ6
IHRoZSAxcyBhcmUgbmljZSBiZWNhdXNlIAp0aGV5J3JlIHdoYXQgdGhlIHJlc3Qgb2YgViBkb2Vz
LCBidXQgc2V0dGluZyB2aWxsIHNob3VsZCBtYWtlIGV2ZXJ5dGhpbmcgCnRyYXAgYW55d2F5IHNv
IG1heWJlIGl0IGRvZXNuJ3QgbWF0dGVyIC0tIGFuZCBpdCdzIG5vdCBjbGVhciBpZiAxIG9yIDAg
CndpbGwgYWxsb3cgaW5pdGlhbCwgc28gd2hvIGtub3dzLgoKRGFyaXVzOiBJJ20gY29vbCBzd2Fw
cGluZyBvdmVyIHRvIHRoZSAxcyBpZiB5b3UgZmVlbCBzdHJvbmdseSBhYm91dCBpdC4gIApCam9y
biBzYXlzIFN3ZWVkZW4gaXMgb24gdmFjYXRpb24sIHNvIGp1c3QgTE1LIGFuZCBJJ2xsIHJlLXNw
aW4gaXQgd2l0aCAKdGhlIDFzLgoKUmVnYXJkbGVzcyBJJ2QgbGlrZSB0byBwaWNrIHVwIHNvbWV0
aGluZyB0aGF0IGJsb3dzIGF3YXkgViBzdGF0ZSBmb3IgCnRoaXMgbWVyZ2Ugd2luZG93LCBhcyBp
dCdsbCBtYWtlIHN1cmUgdGhlIHVBQkkgaXMgcXVpdGUgc3RyaWN0bHkgCmVuZm9yY2VkLgoKPiBC
asO2cm4KPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgMjUgKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAg
IHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmVjdG9yLmgKPiBpbmRleCAwNGMwYjA3YmY2Y2QuLjY5MmNlNTVlNGE2OSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+IEBAIC0xNjMsNiArMTYzLDMwIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBfX3N3aXRjaF90b192ZWN0b3Ioc3RydWN0IHRhc2tfc3RydWN0ICpwcmV2LAo+ICB2
b2lkIHJpc2N2X3ZfdnN0YXRlX2N0cmxfaW5pdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzayk7Cj4g
IGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCk7Cj4KPiArc3RhdGlj
IGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdmwsIHZ0eXBlX2ludmFsID0gMVVMIDw8IChCSVRTX1BF
Ul9MT05HIC0gMSk7Cj4gKwo+ICsJaWYgKCFyaXNjdl92X3ZzdGF0ZV9xdWVyeShyZWdzKSkKPiAr
CQlyZXR1cm47Cj4gKwo+ICsJcmlzY3Zfdl9lbmFibGUoKTsKPiArCWFzbSB2b2xhdGlsZSAoCj4g
KwkJIi5vcHRpb24gcHVzaFxuXHQiCj4gKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+ICsJCSJ2
c2V0dmxpCSUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ICsJCSJ2bXYudi5pCXYwLCAwXG5c
dCIKPiArCQkidm12LnYuaQl2OCwgMFxuXHQiCj4gKwkJInZtdi52LmkJdjE2LCAwXG5cdCIKPiAr
CQkidm12LnYuaQl2MjQsIDBcblx0Igo+ICsJCSJ2c2V0dmwJCSUwLCB4MCwgJTFcblx0Igo+ICsJ
CSIub3B0aW9uIHBvcFxuXHQiCj4gKwkJOiAiPSZyIiAodmwpIDogInIiICh2dHlwZV9pbnZhbCkg
OiAibWVtb3J5Iik7Cj4gKwlyaXNjdl92X2Rpc2FibGUoKTsKPiArCj4gKwlyaXNjdl92X3ZzdGF0
ZV9vbihyZWdzKTsKPiArfQo+ICsKPiAgI2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNBX1YgICov
Cj4KPiAgc3RydWN0IHB0X3JlZ3M7Cj4gQEAgLTE3OCw2ICsyMDIsNyBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkgeyByZXR1cm4gZmFs
c2U7IH0KPiAgI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25leHQpCWRvIHt9
IHdoaWxlICgwKQo+ICAjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX29mZihyZWdzKQkJZG8ge30gd2hp
bGUgKDApCj4gICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykJCQlkbyB7fSB3aGlsZSAo
MCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpCQlkbyB7fSB3aGlsZSAo
MCkKPgo+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBp
bmRleCAwNWZmZGNkMTQyNGUuLjAwYzY4YjU3ZmY4OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC0y
OTUsNiArMjk1LDggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBk
b190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAkJcmVncy0+ZXBjICs9IDQ7
Cj4gIAkJcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+Cj4gKwkJcmlzY3Zfdl92c3RhdGVfZGlz
Y2FyZChyZWdzKTsKPiArCj4gIAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21v
ZGUocmVncywgc3lzY2FsbCk7Cj4KPiAgCQlpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+Cj4g
YmFzZS1jb21taXQ6IDQ2ODFkYWNhZGVlZmE1Y2E2MDE3ZTAwNzM2YWRjMWQ3ZGM5NjNjNmEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
