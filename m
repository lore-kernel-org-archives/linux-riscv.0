Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577F3CA5507
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YClRqFBbIoUEdOco+nSoQHDOF6OSYog8voJheGVqmG0=; b=UBJeovLkEdDFSY
	F/xDprtMwn8PGrB0/D4SPyi+D9OsxQwJZ7+DFSHZ5YTZNY7FaCnxLs995/4CKDZWLTmhWjIr21nrj
	EI5teT0UoyQl/6eByEkGDXQ0GOdU7VADPbDlS8yp/1oXOADvMHimdJb2xeg/nTZ0VsJWN4XiAVaCO
	HBHW9nGkE7bECsY2WmSFt5Ogfck623ruldsAiOr8xQxIkzX9hSSHoc1qniWDTtSHOKHEXeiaOszcK
	r7Pn7yZ4BTaknKRHbvTxDh6Hrfzax7GRL4/DJeBpnRGPfKYPEttSDwMX1YMlPaS7ZxgxC851EDshZ
	wF5YuFdUhHkmUTKAjafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLIT-0056u0-0v;
	Wed, 13 Sep 2023 08:32:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLIQ-0056t6-1F
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:32:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so76161695e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694593944; x=1695198744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnTWLbskqt//nMg0mFaFHPq2gBLre/x26wIHG0UioHY=;
        b=YrAITHUjSayq1FEM//UDnAco5YWHNtMeKCkobPnLVJZ+e2FpsRAAQt9BWatRItR5YB
         jR9Be57X/q0z8zNxNJ6lS3wDx31DOy3E+Q/CFYCApZdD5zH6058JxYuexd1/z4jEzhB8
         ClNqGGavDqz4PXpqlmEfN1FKKiGzSrTTUZ4iZtw8cDnlSjlhaEILdGuPk2QA59VpJbri
         nf/glA995hMsvUJa/sOADG6bXlnGc3k3RIVNPFg6ovFOFUsXsh+SgDnks5xJou/cFMkd
         5+qJtFiwXFFpZ/oZ+fl4AuCT3kjkufFTmzwZPqKnxABAt/xUcq+k7nNDp6J8Nv2Riyb1
         TKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593944; x=1695198744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnTWLbskqt//nMg0mFaFHPq2gBLre/x26wIHG0UioHY=;
        b=jV3QlNyW6kOmHRn8WFJktAEqNWLd82GZjgXIOBElNO3oPJNl+A7iajqzwyWk2FcJnQ
         EOtXK3AumubOXg6Xk7SDGeoB8nMy3S/qQpIO6FC3T667FAzTtqgclMSjgVbMazRRxV+G
         gjWM9RDYcBQy8iSHRA6ulfYjHBKxL354Wzj1SvR4T/xQkdj8k86iMn9P1EUOkayQs47+
         lg0uNaGm9xZ1nJbzTqJ4ppxK3YEREcxc5CLd4YUsOWlAZaQHeWGSxN90jWOEwtaqhxh8
         MMvapXAqrWfVi3UBJbKozE8lvycOkAEYuP5H6ejKMP73rvtvYE19jFY2k3CzIbsqHxDr
         6KuQ==
X-Gm-Message-State: AOJu0YyubF/lwru9t4Gs2jPgY1Li743ofyHExBC89YCknBh4Ol8OeHtW
	fNsyGjRx2OdsmEEuYgvOw0ewCPWB8k/7i3c2+srWnA==
X-Google-Smtp-Source: AGHT+IGEhCPdcCrXcmWUhJSPWmCvw+1W5qAcDduQR77c6UrkXb5UorlQyiK1+gYg5kjtoL67a1RhfxqWPgumpB4OPEY=
X-Received: by 2002:a5d:6589:0:b0:319:84dd:4596 with SMTP id
 q9-20020a5d6589000000b0031984dd4596mr1641330wru.5.1694593944637; Wed, 13 Sep
 2023 01:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
 <20230911131224.61924-5-alexghiti@rivosinc.com> <CAHVXubiVH=q9pnTLQyjS3X3W-hvuA=ZMM2D2xYPFkGjFnAgbWg@mail.gmail.com>
 <CA+V-a8tYzee-cX8rMiQ66ENWb+rLLFHmkOdovft0L-8ASQ3eog@mail.gmail.com>
In-Reply-To: <CA+V-a8tYzee-cX8rMiQ66ENWb+rLLFHmkOdovft0L-8ASQ3eog@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 13 Sep 2023 10:32:13 +0200
Message-ID: <CAHVXubjYpkaOhP3oJwAQVHJLON7pNt+D0A7enqr3n5UuKC13UQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] riscv: Improve flush_tlb_kernel_range()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_013226_432736_08D7ADB0 
X-CRM114-Status: GOOD (  33.75  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTA6MjTigK9BTSBMYWQsIFByYWJoYWthcgo8cHJhYmhh
a2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleGFuZHJlLAo+Cj4gT24gV2Vk
LCBTZXAgMTMsIDIwMjMgYXQgOTowNOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQExhZCwgUHJhYmhha2FyIEFueSBjaGFuY2UgeW91
IGdpdmUgYSB0cnkgdG8gdGhpcyBuZXcgcGF0Y2hzZXQ/IFNvCj4gPiB0aGF0IHdlIG1ha2Ugc3Vy
ZSBTYW11ZWwgZm91bmQgeW91ciBpc3N1ZSA6KQo+ID4KPiBJIGhhdmUgZ2l2ZW4gdGhlIHBhdGNo
ZXMgYSB0cnkgYW5kIG5vdCBzZWVuIHRoZSBtb2R1bGUgbG9hZCBmYWlsdXJlcwo+IGFzIHNlZW4g
cHJldmlvdXNseS4gSSBoYXZlIHNvbWUgcmlnb3JvdXMgdGVzdHMgd2hpY2ggdGVzdCB0aGUgY29t
cGxldGUKPiBwbGF0Zm9ybS4gSSdtIGp1c3Qgd2FpdGluZyBmb3IgaXQgdG8gY29tcGxldGUgYmVm
b3JlIEkgZ2l2ZSBUZXN0ZWQgYnkuCj4KCkF3ZXNvbWUsIHRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEg
V2VsbCBkb25lIEBTYW11ZWwgSG9sbGFuZAoKPiBDaGVlcnMsCj4gUHJhYmhha2FyCj4KPiA+IE9u
IE1vbiwgU2VwIDExLCAyMDIzIGF0IDM6MTbigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0
aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGlzIGZ1bmN0aW9uIHVzZWQgdG8g
c2ltcGx5IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxsIGhhcnRzLCBiZSBtb3JlCj4gPiA+IHN1
YnRpbGUgYW5kIHRyeSB0byBvbmx5IGZsdXNoIHRoZSByYW5nZS4KPiA+ID4KPiA+ID4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB3ZSBjYW4gb25seSB1c2UgUEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3
ZSBkb24ndCBrbm93Cj4gPiA+IHRoZSBzaXplIG9mIHRoZSB1bmRlcmx5aW5nIG1hcHBpbmcgYW5k
IHRoZW4gdGhpcyBmdW5jdGlvbiB3aWxsIGJlIGltcHJvdmVkCj4gPiA+IG9ubHkgaWYgdGhlIHNp
emUgb2YgdGhlIHJlZ2lvbiB0byBmbHVzaCBpcyA8IHRocmVzaG9sZCAqIFBBR0VfU0laRS4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1p
Y3JvLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmggfCAxMSArKysrKystLS0tLQo+ID4gPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAg
ICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gPiBpbmRleCAxNzBhNDljNTMxYzYuLjhmMzQxOGM1
ZjE3MiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5o
Cj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gPiBAQCAt
NDAsNiArNDAsNyBAQCB2b2lkIGZsdXNoX3RsYl9tbV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ID4gIHZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4gPiA+ICB2b2lkIGZs
dXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBz
dGFydCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQpOwo+ID4g
PiArdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgZW5kKTsKPiA+ID4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UK
PiA+ID4gICNkZWZpbmUgX19IQVZFX0FSQ0hfRkxVU0hfUE1EX1RMQl9SQU5HRQo+ID4gPiAgdm9p
ZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25l
ZCBsb25nIHN0YXJ0LAo+ID4gPiBAQCAtNTYsMTUgKzU3LDE1IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiA+ICAgICAg
ICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiAtI2RlZmluZSBm
bHVzaF90bGJfbW0obW0pIGZsdXNoX3RsYl9hbGwoKQo+ID4gPiAtI2RlZmluZSBmbHVzaF90bGJf
bW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6ZSkgZmx1c2hfdGxiX2FsbCgpCj4gPiA+
IC0jZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KPiA+ID4gLQo+ID4gPiAg
LyogRmx1c2ggYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8KPiA+ID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiA+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiA+ICB7Cj4gPiA+IC0gICAgICAgZmx1c2hfdGxi
X2FsbCgpOwo+ID4gPiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiA+ID4gIH0KPiA+
ID4KPiA+ID4gKyNkZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxsKCkKPiA+ID4g
KyNkZWZpbmUgZmx1c2hfdGxiX21tX3JhbmdlKG1tLCBzdGFydCwgZW5kLCBwYWdlX3NpemUpIGZs
dXNoX3RsYl9hbGwoKQo+ID4gPiArI2VuZGlmIC8qICFDT05GSUdfU01QIHx8ICFDT05GSUdfTU1V
ICovCj4gPiA+ICsKPiA+ID4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RMQkZMVVNIX0ggKi8KPiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwo+ID4gPiBpbmRleCAyYzExMzZkNzM0MTEuLjI4Y2Q4NTM5YjU3NSAxMDA2NDQK
PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYwo+ID4gPiBAQCAtOTcsMTkgKzk3LDI3IEBAIHN0YXRpYyB2b2lkIF9f
Zmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0
LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUs
IHVuc2lnbmVkIGxvbmcgc3RyaWRlKQo+ID4gPiAgewo+ID4gPiAgICAgICAgIHN0cnVjdCBmbHVz
aF90bGJfcmFuZ2VfZGF0YSBmdGQ7Cj4gPiA+IC0gICAgICAgc3RydWN0IGNwdW1hc2sgKmNtYXNr
ID0gbW1fY3B1bWFzayhtbSk7Cj4gPiA+ICsgICAgICAgc3RydWN0IGNwdW1hc2sgKmNtYXNrLCBm
dWxsX2NtYXNrOwo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXNpZCA9IEZMVVNIX1RMQl9O
T19BU0lEOwo+ID4gPiAtICAgICAgIHVuc2lnbmVkIGludCBjcHVpZDsKPiA+ID4gICAgICAgICBi
b29sIGJyb2FkY2FzdDsKPiA+ID4KPiA+ID4gLSAgICAgICBpZiAoY3B1bWFza19lbXB0eShjbWFz
aykpCj4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ICsgICAgICAgaWYgKG1tKSB7
Cj4gPiA+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY3B1aWQ7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICAgICAgICAgIGNtYXNrID0gbW1fY3B1bWFzayhtbSk7Cj4gPiA+ICsgICAgICAgICAg
ICAgICBpZiAoY3B1bWFza19lbXB0eShjbWFzaykpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+ID4KPiA+ID4gLSAgICAgICBjcHVpZCA9IGdldF9jcHUoKTsKPiA+ID4g
LSAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUgc2VudCB0byBvdGhl
ciBDUFVzICovCj4gPiA+IC0gICAgICAgYnJvYWRjYXN0ID0gY3B1bWFza19hbnlfYnV0KGNtYXNr
LCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+ID4gPiArICAgICAgICAgICAgICAgY3B1aWQgPSBnZXRf
Y3B1KCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVl
ZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVzICovCj4gPiA+ICsgICAgICAgICAgICAgICBicm9h
ZGNhc3QgPSBjcHVtYXNrX2FueV9idXQoY21hc2ssIGNwdWlkKSA8IG5yX2NwdV9pZHM7Cj4gPiA+
ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKCZm
dWxsX2NtYXNrKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGNtYXNrID0gJmZ1bGxfY21hc2s7Cj4g
PiA+ICsgICAgICAgICAgICAgICBicm9hZGNhc3QgPSB0cnVlOwo+ID4gPiArICAgICAgIH0KPiA+
ID4KPiA+ID4gLSAgICAgICBpZiAoc3RhdGljX2JyYW5jaF91bmxpa2VseSgmdXNlX2FzaWRfYWxs
b2NhdG9yKSkKPiA+ID4gKyAgICAgICBpZiAoc3RhdGljX2JyYW5jaF91bmxpa2VseSgmdXNlX2Fz
aWRfYWxsb2NhdG9yKSAmJiBtbSkKPiA+ID4gICAgICAgICAgICAgICAgIGFzaWQgPSBhdG9taWNf
bG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2s7Cj4gPiA+Cj4gPiA+ICAgICAg
ICAgaWYgKGJyb2FkY2FzdCkgewo+ID4gPiBAQCAtMTI4LDcgKzEzNiw4IEBAIHN0YXRpYyB2b2lk
IF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0
YXJ0LAo+ID4gPiAgICAgICAgICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoc3Rh
cnQsIHNpemUsIHN0cmlkZSwgYXNpZCk7Cj4gPiA+ICAgICAgICAgfQo+ID4gPgo+ID4gPiAtICAg
ICAgIHB1dF9jcHUoKTsKPiA+ID4gKyAgICAgICBpZiAobW0pCj4gPiA+ICsgICAgICAgICAgICAg
ICBwdXRfY3B1KCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICB2b2lkIGZsdXNoX3RsYl9tbShzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKPiA+ID4gQEAgLTE4OSw2ICsxOTgsMTIgQEAgdm9pZCBmbHVzaF90
bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQs
Cj4gPiA+Cj4gPiA+ICAgICAgICAgX19mbHVzaF90bGJfcmFuZ2Uodm1hLT52bV9tbSwgc3RhcnQs
IGVuZCAtIHN0YXJ0LCBzdHJpZGVfc2l6ZSk7Cj4gPiA+ICB9Cj4gPiA+ICsKPiA+ID4gK3ZvaWQg
Zmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IGVuZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZShOVUxMLCBzdGFy
dCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gICNpZmRl
ZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPiA+ID4gIHZvaWQgZmx1c2hfcG1kX3RsYl9y
YW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiA+IC0tCj4g
PiA+IDIuMzkuMgo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
