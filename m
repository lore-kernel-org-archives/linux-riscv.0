Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45563CD4847
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uazq2/UoUeJAhnx89AZs8rS1rS6GAKd3/87Dcd8WkI=; b=gimKmivHrUG+Sc
	fRvA7U24/1tePaQmaG6kXFPMNA7lii2acxZAYYw0ZWLWvY441YwruKwUVDxjDUiDwOOcGDl4XdhAq
	ppMu4D9Q8Zoum9fBbZptykJIfKlfAu02xtqZotOvngRiwjevFg/oaQEGpMu3wc1gxTVlanz4x//zf
	bKZeaID+3aLdEBL3I6n8kIkLlKeRfh8aliIuIP/1h5UszL6JuIFDLh3mApJ7XiqSvviS+D0xM2jyS
	n5wGlj9qLTibITN5cr9AgAcm/kNWXSWSomvkMzqmQt2WMRwlz2SPeyITIeRzdnp3WNRvhB0depvB2
	31Os7aGRDUIsn04oicgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjjfE-009UEc-1t;
	Fri, 22 Sep 2023 17:10:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjjf7-009U09-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 17:09:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ae75ece209so112305766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695402587; x=1696007387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZMr1kN15ref1wUYr4E6kS3JTBkLGuuuWxsn4v7voMQ=;
        b=AZ36GfzM3DLzo9ymSU1B3adCZCWb1BfHuHql8IHX+af6DAL+p9YSRgdKH/NqV4Gzi8
         H7WrrDyUJ5XQwXnT7xQ5yDyRUa8rP/g3ojftpxaM5pwcivNeZWi784jeiSCeQgdXIptB
         /J0GShoXkmVctB761yoOMroIdgkA6IuAtMlg7ILNhr7xj2TjV7+RwD3lrc1mZlajvTio
         r+F2t9Q3FJCNCVToqkvPrnLdT5zNbyfAzBspKAJCs06d7aCT/KzSqBp+IAA3FHnzPq8L
         VGTdUXR04tCoZ9XmD4PXeab7m53pTQVUo9Dz3rvdXer+c1eewa8SVL8MNKZFFWh2w1uN
         PCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695402587; x=1696007387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZMr1kN15ref1wUYr4E6kS3JTBkLGuuuWxsn4v7voMQ=;
        b=oTQ6/XnQ/5zjT1mrW0Rsz+W4Nrozsgw4ECO4y4uNdOfZDQOgF5yOB22OgKpOm37hPw
         bfzyNQKkbLw9FgzWNdIeY/0X1oqHNZlAK8C13EE3Mcq8LkaYqQlyR24dTexhT+wUShIS
         EQ99HhS5lNe7tLh9hvTA+yAHtAt2eegF6oziSAsSxQmJgPBv4oUbUms+Mi8cQLjKyXsp
         3LyuD4tpVN48O0jV+exxJCHoTOTMaGARcPmYhVHs+fiiffd6SKiSjmsASVf/MHpz1WX3
         dBJg4HbDzYuVBJiNeUsUi0K+nWzu3xm41qoNAZQHmjKpALFnNALK46GoKrJQYGJ5rCl3
         hzHQ==
X-Gm-Message-State: AOJu0Yy9gniySqxRMXLjytAVbt0CgghtSVNXhUYV8WXfRA+cFAWSS0C+
	7eYlpYKGo/EApxAHAlUgW9Ujx8KDaEIZIAwq3+D4jg==
X-Google-Smtp-Source: AGHT+IH4/kuj4pc7LLnOeIo2zssiCuHuC210f94Y24I1r6FA5L9LiUH2koVLT71RUpM7wLJf6p3XQNKYGbF6emeCse8=
X-Received: by 2002:a17:907:985b:b0:9a2:1ce5:1243 with SMTP id
 jj27-20020a170907985b00b009a21ce51243mr7710566ejc.60.1695402586369; Fri, 22
 Sep 2023 10:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230922115804.2043771-1-ryan.roberts@arm.com>
 <20230922115804.2043771-3-ryan.roberts@arm.com> <20230922161404.GA23332@willie-the-truck>
 <32052cb7-91f1-461d-a226-2cd2fcf34ad2@arm.com>
In-Reply-To: <32052cb7-91f1-461d-a226-2cd2fcf34ad2@arm.com>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Fri, 22 Sep 2023 10:09:08 -0700
Message-ID: <CAJHvVcgq9mJFgy=M1J546XboTu2=SWMdbQM457xUtD1kba4xew@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: hugetlb: Fix set_huge_pte_at() to work with
 all swap entries
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Arnd Bergmann <arnd@arndb.de>, Mike Kravetz <mike.kravetz@oracle.com>, 
	Muchun Song <muchun.song@linux.dev>, SeongJae Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_100953_849431_967AFE5B 
X-CRM114-Status: GOOD (  41.77  )
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

TG9va3MgY29ycmVjdCB0byBtZSAtIHRoYW5rcyBmb3IgdGhlIGZpeCEKClJldmlld2VkLWJ5OiBB
eGVsIFJhc211c3NlbiA8YXhlbHJhc211c3NlbkBnb29nbGUuY29tPgoKT24gRnJpLCBTZXAgMjIs
IDIwMjMgYXQgOTo0MeKAr0FNIFJ5YW4gUm9iZXJ0cyA8cnlhbi5yb2JlcnRzQGFybS5jb20+IHdy
b3RlOgo+Cj4gT24gMjIvMDkvMjAyMyAxNzoxNCwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gPiBPbiBG
cmksIFNlcCAyMiwgMjAyMyBhdCAxMjo1ODowNFBNICswMTAwLCBSeWFuIFJvYmVydHMgd3JvdGU6
Cj4gPj4gV2hlbiBjYWxsZWQgd2l0aCBhIHN3YXAgZW50cnkgdGhhdCBkb2VzIG5vdCBlbWJlZCBh
IFBGTiAoZS5nLgo+ID4+IFBURV9NQVJLRVJfUE9JU09ORUQgb3IgUFRFX01BUktFUl9VRkZEX1dQ
KSwgdGhlIHByZXZpb3VzIGltcGxlbWVudGF0aW9uCj4gPj4gb2Ygc2V0X2h1Z2VfcHRlX2F0KCkg
d291bGQgZWl0aGVyIGNhdXNlIGEgQlVHKCkgdG8gZmlyZSAoaWYKPiA+PiBDT05GSUdfREVCVUdf
Vk0gaXMgZW5hYmxlZCkgb3IgY2F1c2UgYSBkZXJlZmVyZW5jZSBvZiBhbiBpbnZhbGlkIGFkZHJl
c3MKPiA+PiBhbmQgc3Vic2VxdWVudCBwYW5pYy4KPiA+Pgo+ID4+IGFybTY0J3MgaHVnZSBwdGUg
aW1wbGVtZW50YXRpb24gc3VwcG9ydHMgbXVsdGlwbGUgaHVnZSBwYWdlIHNpemVzLCBzb21lCj4g
Pj4gb2Ygd2hpY2ggYXJlIGltcGxlbWVudGVkIGluIHRoZSBwYWdlIHRhYmxlIHdpdGggbXVsdGlw
bGUgY29udGlndW91cwo+ID4+IGVudHJpZXMuIFNvIHNldF9odWdlX3B0ZV9hdCgpIG5lZWRzIHRv
IHdvcmsgb3V0IGhvdyBiaWcgdGhlIGxvZ2ljYWwgcHRlCj4gPj4gaXMsIHNvIHRoYXQgaXQgY2Fu
IGFsc28gd29yayBvdXQgaG93IG1hbnkgcGh5c2ljYWwgcHRlcyAob3IgcG1kcykgbmVlZAo+ID4+
IHRvIGJlIHdyaXR0ZW4uIEl0IHByZXZpb3VzbHkgZGlkIHRoaXMgYnkgZ3JhYmJpbmcgdGhlIGZv
bGlvIG91dCBvZiB0aGUKPiA+PiBwdGUgYW5kIHF1ZXJ5aW5nIGl0cyBzaXplLgo+ID4+Cj4gPj4g
SG93ZXZlciwgdGhlcmUgYXJlIGNhc2VzIHdoZW4gdGhlIHB0ZSBiZWluZyBzZXQgaXMgYWN0dWFs
bHkgYSBzd2FwCj4gPj4gZW50cnkuIEJ1dCB0aGlzIGFsc28gdXNlZCB0byB3b3JrIGZpbmUsIGJl
Y2F1c2UgZm9yIGh1Z2UgcHRlcywgd2Ugb25seQo+ID4+IGV2ZXIgc2F3IG1pZ3JhdGlvbiBlbnRy
aWVzIGFuZCBod3BvaXNvbiBlbnRyaWVzLiBBbmQgYm90aCBvZiB0aGVzZSB0eXBlcwo+ID4+IG9m
IHN3YXAgZW50cmllcyBoYXZlIGEgUEZOIGVtYmVkZGVkLCBzbyB0aGUgY29kZSB3b3VsZCBncmFi
IHRoYXQgYW5kCj4gPj4gZXZlcnl0aGluZyBzdGlsbCB3b3JrZWQgb3V0Lgo+ID4+Cj4gPj4gQnV0
IG92ZXIgdGltZSwgbW9yZSBjYWxscyB0byBzZXRfaHVnZV9wdGVfYXQoKSBoYXZlIGJlZW4gYWRk
ZWQgdGhhdCBzZXQKPiA+PiBzd2FwIGVudHJ5IHR5cGVzIHRoYXQgZG8gbm90IGVtYmVkIGEgUEZO
LiBBbmQgdGhpcyBjYXVzZXMgdGhlIGNvZGUgdG8gZ28KPiA+PiBiYW5nLiBUaGUgdHJpZ2dlcmlu
ZyBjYXNlIGlzIGZvciB0aGUgdWZmZCBwb2lzb24gdGVzdCwgY29tbWl0Cj4gPj4gOTlhYTc3MjE1
YWQwICgic2VsZnRlc3RzL21tOiBhZGQgdWZmZCB1bml0IHRlc3QgZm9yIFVGRkRJT19QT0lTT04i
KSwKPiA+PiB3aGljaCBjYXVzZXMgYSBQVEVfTUFSS0VSX1BPSVNPTkVEIHN3YXAgZW50cnkgdG8g
YmUgc2V0LCBjb3V0ZXNleSBvZgo+ID4+IGNvbW1pdCA4YTEzODk3ZmIwZGEgKCJtbTogdXNlcmZh
dWx0ZmQ6IHN1cHBvcnQgVUZGRElPX1BPSVNPTiBmb3IKPiA+PiBodWdldGxiZnMiKSAtIGFkZGVk
IGluIHY2LjUtcmM3LiBBbHRob3VnaCByZXZpZXcgc2hvd3MgdGhhdCB0aGVyZSBhcmUKPiA+PiBv
dGhlciBjYWxsIHNpdGVzIHRoYXQgc2V0IFBURV9NQVJLRVJfVUZGRF9XUCAod2hpY2ggYWxzbyBo
YXMgbm8gUEZOKSwKPiA+PiB0aGVzZSBkb24ndCB0cmlnZ2VyIG9uIGFybTY0IGJlY2F1c2UgYXJt
NjQgZG9lc24ndCBzdXBwb3J0IFVGRkQgV1AuCj4gPj4KPiA+PiBBcmd1YWJseSwgdGhlIHJvb3Qg
Y2F1c2UgaXMgcmVhbGx5IGR1ZSB0byBjb21taXQgMThmMzk2Mjk1M2U0ICgibW06Cj4gPj4gaHVn
ZXRsYjoga2lsbCBzZXRfaHVnZV9zd2FwX3B0ZV9hdCgpIiksIHdoaWNoIGFpbWVkIHRvIHNpbXBs
aWZ5IHRoZQo+ID4+IGludGVyZmFjZSB0byB0aGUgY29yZSBjb2RlIGJ5IHJlbW92aW5nIHNldF9o
dWdlX3N3YXBfcHRlX2F0KCkgKHdoaWNoCj4gPj4gdG9vayBhIHBhZ2Ugc2l6ZSBwYXJhbWV0ZXIp
IGFuZCByZXBsYWNpbmcgaXQgd2l0aCBjYWxscyB0bwo+ID4+IHNldF9odWdlX3B0ZV9hdCgpIHdo
ZXJlIHRoZSBzaXplIHdhcyBpbmZlcnJlZCBmcm9tIHRoZSBmb2xpbywgYXMKPiA+PiBkZXNjaWJl
ZCBhYm92ZS4gV2hpbGUgdGhhdCBjb21taXQgZGlkbid0IGJyZWFrIGFueXRoaW5nIGF0IHRoZSB0
aW1lLCBpdAo+ID4+IGRpZCBicmVhayB0aGUgaW50ZXJmYWNlIGJlY2F1c2UgaXQgY291bGRuJ3Qg
aGFuZGxlIHN3YXAgZW50cmllcyB3aXRob3V0Cj4gPj4gUEZOcy4gQW5kIHNpbmNlIHRoZW4gbmV3
IGNhbGxlcnMgaGF2ZSBjb21lIGFsb25nIHdoaWNoIHJlbHkgb24gdGhpcwo+ID4+IHdvcmtpbmcu
IEJ1dCBnaXZlbiB0aGUgYnJva2VuZXNzIGlzIG9ubHkgb2JzZXJ2YWJsZSBhZnRlciBjb21taXQK
PiA+PiA4YTEzODk3ZmIwZGEgKCJtbTogdXNlcmZhdWx0ZmQ6IHN1cHBvcnQgVUZGRElPX1BPSVNP
TiBmb3IgaHVnZXRsYmZzIiksCj4gPj4gdGhhdCBvbmUgZ2V0cyB0aGUgRml4ZXMgdGFnLgo+ID4+
Cj4gPj4gTm93IHRoYXQgd2UgaGF2ZSBtb2RpZmllZCB0aGUgc2V0X2h1Z2VfcHRlX2F0KCkgaW50
ZXJmYWNlIHRvIHBhc3MgdGhlCj4gPj4gaHVnZSBwYWdlIHNpemUgaW4gdGhlIHByZXZpb3VzIHBh
dGNoLCB3ZSBjYW4gdHJpdmlhbGx5IGZpeCB0aGlzIGlzc3VlLgo+ID4+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogUnlhbiBSb2JlcnRzIDxyeWFuLnJvYmVydHNAYXJtLmNvbT4KPiA+PiBGaXhlczogOGEx
Mzg5N2ZiMGRhICgibW06IHVzZXJmYXVsdGZkOiBzdXBwb3J0IFVGRkRJT19QT0lTT04gZm9yIGh1
Z2V0bGJmcyIpCj4gPj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDYuNSsKPiA+PiAt
LS0KPiA+PiAgYXJjaC9hcm02NC9tbS9odWdldGxicGFnZS5jIHwgMTcgKysrLS0tLS0tLS0tLS0t
LS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9odWdldGxicGFnZS5jIGIvYXJj
aC9hcm02NC9tbS9odWdldGxicGFnZS5jCj4gPj4gaW5kZXggYTdmOGM4ZGIzNDI1Li4xM2ZkNTky
MjI4YjEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9hcm02NC9tbS9odWdldGxicGFnZS5jCj4gPj4g
KysrIGIvYXJjaC9hcm02NC9tbS9odWdldGxicGFnZS5jCj4gPj4gQEAgLTI0MSwxMyArMjQxLDYg
QEAgc3RhdGljIHZvaWQgY2xlYXJfZmx1c2goc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gPj4gICAg
ICBmbHVzaF90bGJfcmFuZ2UoJnZtYSwgc2FkZHIsIGFkZHIpOwo+ID4+ICB9Cj4gPj4KPiA+PiAt
c3RhdGljIGlubGluZSBzdHJ1Y3QgZm9saW8gKmh1Z2V0bGJfc3dhcF9lbnRyeV90b19mb2xpbyhz
d3BfZW50cnlfdCBlbnRyeSkKPiA+PiAtewo+ID4+IC0gICAgVk1fQlVHX09OKCFpc19taWdyYXRp
b25fZW50cnkoZW50cnkpICYmICFpc19od3BvaXNvbl9lbnRyeShlbnRyeSkpOwo+ID4+IC0KPiA+
PiAtICAgIHJldHVybiBwYWdlX2ZvbGlvKHBmbl90b19wYWdlKHN3cF9vZmZzZXRfcGZuKGVudHJ5
KSkpOwo+ID4+IC19Cj4gPj4gLQo+ID4+ICB2b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlLCB1bnNpZ25lZCBsb25nIHN6KQo+ID4+ICB7Cj4g
Pj4gQEAgLTI1NywxMyArMjUwLDEwIEBAIHZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPj4gICAgICB1bnNpZ25lZCBsb25nIHBm
biwgZHBmbjsKPiA+PiAgICAgIHBncHJvdF90IGh1Z2Vwcm90Owo+ID4+Cj4gPj4gLSAgICBpZiAo
IXB0ZV9wcmVzZW50KHB0ZSkpIHsKPiA+PiAtICAgICAgICAgICAgc3RydWN0IGZvbGlvICpmb2xp
bzsKPiA+PiAtCj4gPj4gLSAgICAgICAgICAgIGZvbGlvID0gaHVnZXRsYl9zd2FwX2VudHJ5X3Rv
X2ZvbGlvKHB0ZV90b19zd3BfZW50cnkocHRlKSk7Cj4gPj4gLSAgICAgICAgICAgIG5jb250aWcg
PSBudW1fY29udGlnX3B0ZXMoZm9saW9fc2l6ZShmb2xpbyksICZwZ3NpemUpOwo+ID4+ICsgICAg
bmNvbnRpZyA9IG51bV9jb250aWdfcHRlcyhzeiwgJnBnc2l6ZSk7Cj4gPj4KPiA+PiAtICAgICAg
ICAgICAgZm9yIChpID0gMDsgaSA8IG5jb250aWc7IGkrKywgcHRlcCsrKQo+ID4+ICsgICAgaWYg
KCFwdGVfcHJlc2VudChwdGUpKSB7Cj4gPj4gKyAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBu
Y29udGlnOyBpKyssIHB0ZXArKywgYWRkciArPSBwZ3NpemUpCj4gPj4gICAgICAgICAgICAgICAg
ICAgICAgc2V0X3B0ZV9hdChtbSwgYWRkciwgcHRlcCwgcHRlKTsKPiA+Cj4gPiBPdXIgc2V0X3B0
ZV9hdCgpIGRvZXNuJ3QgdXNlICdhZGRyJyBmb3IgYW55dGhpbmcgYW5kIHRoZSBvbGQgY29kZSBk
aWRuJ3QKPiA+IGV2ZW4gYm90aGVyIHRvIGluY3JlbWVudCBpdCBoZXJlISBJJ20gZmluZSBhZGRp
bmcgdGhhdCwgYnV0IGl0IGZlZWxzCj4gPiB1bnJlbGF0ZWQgdG8gdGhlIGlzc3VlIHdoaWNoIHRo
aXMgcGF0Y2ggaXMgYWN0dWFsbHkgZml4aW5nLgo+Cj4gVHJ1ZS4gSSBhZ3JlZSBpdHMgbm90IHN0
cmljdGx5IG5lY2Vzc2FyeSBhbmQgd2lsbCBwcmVzdW1hYmx5IGJlIG9wdGltaXplZCBvdXQuCj4g
QnV0IEknbSBub3Qgc3VyZSB0aGF0IGhhdmluZyBrbm93bGVkZ2UgdGhhdCB0aGUgaW1wbGVtZW50
YXRpb24gZG9lc24ndCB1c2UgaXQgaXMKPiBhIGdvb2QgcmVhc29uIG5vdCB0byBjYWxsIHRoZSBp
bnRlcmZhY2UgY29ycmVjdGx5LiBJJ2xsIGxlYXZlIGl0IGFzIEkndmUgZG9uZSBpdAo+IGlmIHRo
YXQncyBvay4KPgo+ID4KPiA+IEVpdGhlciB3YXk6Cj4gPgo+ID4gQWNrZWQtYnk6IFdpbGwgRGVh
Y29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4KPiBUaGFua3MhCj4KPiA+Cj4gPiBXaWxsCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
