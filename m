Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385C8C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrHPDjJXlffd4cKVGJcPaLNznHt6LjXA455D8d1YF6w=; b=c1RHaL4916x6xj
	RxQpzUnA7CqSa0WefaNi8gJ+EjMjRHDUi6d/Opl46shZATJ9M7z8+9ZMsPc6cZ6rutEb/q/7BSjL1
	ids08J1mG2v+xf+54fQ3I0NHAT6b91fWECRWN6M4wQpo4nER3zP35w/Ee/qzAK4YXQ+ege1KMD9k+
	qeRGZ4SLhjaiYcl7F9ZRRLWVyMBe9jfORlK+DY/xStfADIEiqcSmbVAZcpXcJdc1yzbXHLs1eTTz4
	AWiLcdqazSLQeDkhkKsZaYLJm7QHjJePXrwSPeg6nRxvx0Rz95yEUWYqq8X/RzWD5VPZwZOLWZ5sr
	TRhamGya7Z2LJEa3hGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzlc9-00000006J3M-3keW;
	Wed, 24 Apr 2024 23:01:21 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzlc6-00000006J2l-1r0V
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 23:01:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2a53e810f10so346023a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 16:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713999676; x=1714604476; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5eYQv4SEnPtJtu5rV+wjwKaumy6GBL26odmvclmovo=;
        b=EVuCsKsYF4wkl9ka7TVImwzFaBXITzyrI0ZHZUuEF9AsnI78BZ6BujQwDpt958TY72
         zLm9W2J1NG4CufkqeUARmnnW33n+EPOv9WpehLDfaX+bkt572MOcOdyPFGZbWo34JG4Q
         gE23W0U2sUkR1N6SMdGDfXO9pAe64D2mtFKOXprrTyz5CzxisHXwGt2BHcqFDk0Vbln4
         iZt/htGAAiycAzCWqkUP3ckrmHrT7SnJVL9WU3ClYFiYEOn2qVaDqrB4DPJnf7U2plIA
         DIepKQcxFkvKQ8stIKUl3rKO2Wd+1moH9LRMnDKri/sT28yiTx67uHs2ToOTtWMlVEOd
         Hd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713999676; x=1714604476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5eYQv4SEnPtJtu5rV+wjwKaumy6GBL26odmvclmovo=;
        b=Ra9ze8NY9FCaWHG9he/tvnqCdq7YBriwhK+G0kZuyDWfjKLWInqqUaaZbgiHT/2VWw
         aXU6saZfoQjZ5s/iFO97byQMgbnXRmxrBMw3rMWxeXQUUHVWup54Xa7on0F3bcSKzy34
         Tp8jsYGd2Ov+0ODPySGqRPoNeyH+Gxpztozs1IzcckeMwDnu2aaPyFmOqwJu9iE3wcmB
         us8ZDDxwwACjpsuiLxMMjGU5jrU3g9VO/FtYYDRpzwMZ6vWau1BHmPI10eb9Hx4NvBfn
         B/mtq34tumz/OssPlvBAEojs59IqzRfeb9U8zkkRKaEM/dEXQFakwW8xtjBJVaUzl5vO
         5ULw==
X-Forwarded-Encrypted: i=1; AJvYcCX93wJ6ZgFaD/eT3KlFjU18fb07aKuN8BL7lYik/zq4+tp2yn+cSfvjz3IWZLLvmqUGJeo5Z0+jPXi+1+Mlbu64nXOzUHNy+vLMZuS+zv6m
X-Gm-Message-State: AOJu0YzHJCeKRz7IpAyv14SgzNg5oZ81cG+hXfk5/5LSlrH4ICwZvotF
	R8IOGswp9WRZQtysISxIIG5jyxQ3uJgnJ1idNQcyMZ48LnHiu6mig1VvAL8Pk1z0ihmo9ME3gtL
	IKKYDbdZp5oebR61E9Tj6FiB5Wa9lxZzn8LsGrQ==
X-Google-Smtp-Source: AGHT+IEmZmY0a/pcbMjVZ7zbn5k9LdZezmxUS44Gf63fTy4Sf2HGSXWIH1nVc43qJR8VXcBqXhgqPnmKQIhIOfhQbP0=
X-Received: by 2002:a17:90b:1e0a:b0:2ae:e1e0:3d8f with SMTP id
 pg10-20020a17090b1e0a00b002aee1e03d8fmr3623341pjb.2.1713999675753; Wed, 24
 Apr 2024 16:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713456597.git.tjeznach@rivosinc.com> <232b2824d5dfd9b8dcb3553bfd506444273c3305.1713456598.git.tjeznach@rivosinc.com>
 <20240419124017.GC223006@ziepe.ca>
In-Reply-To: <20240419124017.GC223006@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 24 Apr 2024 16:01:04 -0700
Message-ID: <CAH2o1u7_YBtS6m1-T56tmxud1mda2gb6tLGVpbBSs15FPcjaGQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] iommu/riscv: Device directory management.
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_160118_581073_8610AE3D 
X-CRM114-Status: GOOD (  38.16  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgNTo0MOKAr0FNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDA5OjMyOjIzQU0gLTA3
MDAsIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+ID4gQEAgLTMxLDEzICszMiwzNTAgQEAgTU9EVUxF
X0xJQ0VOU0UoIkdQTCIpOwo+ID4gIC8qIFRpbWVvdXRzIGluIFt1c10gKi8KPiA+ICAjZGVmaW5l
IFJJU0NWX0lPTU1VX0REVFBfVElNRU9VVCAgICAgNTAwMDAKPiA+Cj4gPiAtc3RhdGljIGludCBy
aXNjdl9pb21tdV9hdHRhY2hfaWRlbnRpdHlfZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmRv
bWFpbiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGRldmljZSAqZGV2KQo+ID4gKy8qIFJJU0MtViBJT01NVSBQUE4gPD4gUEhZUyBhZGRyZXNz
IGNvbnZlcnNpb25zLCBQSFlTIDw9PiBQUE5bNTM6MTBdICovCj4gPiArI2RlZmluZSBwaHlzX3Rv
X3Bwbih2YSkgICgoKHZhKSA+PiAyKSAmICgoKDFVTEwgPDwgNDQpIC0gMSkgPDwgMTApKQo+ID4g
KyNkZWZpbmUgcHBuX3RvX3BoeXMocG4pICAgICAgICgoKHBuKSA8PCAyKSAmICgoKDFVTEwgPDwg
NDQpIC0gMSkgPDwgMTIpKQo+ID4gKwo+ID4gKyNkZWZpbmUgZGV2X3RvX2lvbW11KGRldikgXAo+
ID4gKyAgICAgY29udGFpbmVyX29mKChkZXYpLT5pb21tdS0+aW9tbXVfZGV2LCBzdHJ1Y3Qgcmlz
Y3ZfaW9tbXVfZGV2aWNlLCBpb21tdSkKPgo+IFdlIGhhdmUgaW9tbXVfZ2V0X2lvbW11X2Rldigp
IG5vdwo+Cj4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgcmlzY3ZfaW9tbXVfZ2V0X3BhZ2VzKHN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gPiAr
ewo+ID4gKyAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldnJlcyAqZGV2cmVzOwo+ID4gKyAgICAg
c3RydWN0IHBhZ2UgKnBhZ2VzOwo+ID4gKwo+ID4gKyAgICAgcGFnZXMgPSBhbGxvY19wYWdlc19u
b2RlKGRldl90b19ub2RlKGlvbW11LT5kZXYpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEdGUF9LRVJORUxfQUNDT1VOVCB8IF9fR0ZQX1pFUk8sIG9yZGVyKTsKPiA+ICsgICAg
IGlmICh1bmxpa2VseSghcGFnZXMpKSB7Cj4gPiArICAgICAgICAgICAgIGRldl9lcnIoaW9tbXUt
PmRldiwgIlBhZ2UgYWxsb2NhdGlvbiBmYWlsZWQsIG9yZGVyICV1XG4iLCBvcmRlcik7Cj4gPiAr
ICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgfQo+Cj4gVGhpcyBuZWVkcyBhZGp1c3Rp
bmcgZm9yIHRoZSByZWNlbnRseSBtZXJnZWQgYWxsb2NhdGlvbiBhY2NvdW50aW5nCj4KPiA+ICtz
dGF0aWMgaW50IHJpc2N2X2lvbW11X2F0dGFjaF9kb21haW4oc3RydWN0IHJpc2N2X2lvbW11X2Rl
dmljZSAqaW9tbXUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkZXZpY2UgKmRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGlvbW11X2RvbWFpbiAqaW9tbXVfZG9tYWluKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBp
b21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KGRldik7Cj4gPiArICAg
ICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGMgKmRjOwo+ID4gKyAgICAgdTY0IGZzYywgdGEsIHRjOwo+
ID4gKyAgICAgaW50IGk7Cj4gPiArCj4gPiArICAgICBpZiAoIWlvbW11X2RvbWFpbikgewo+ID4g
KyAgICAgICAgICAgICB0YSA9IDA7Cj4gPiArICAgICAgICAgICAgIHRjID0gMDsKPiA+ICsgICAg
ICAgICAgICAgZnNjID0gMDsKPiA+ICsgICAgIH0gZWxzZSBpZiAoaW9tbXVfZG9tYWluLT50eXBl
ID09IElPTU1VX0RPTUFJTl9JREVOVElUWSkgewo+ID4gKyAgICAgICAgICAgICB0YSA9IDA7Cj4g
PiArICAgICAgICAgICAgIHRjID0gUklTQ1ZfSU9NTVVfRENfVENfVjsKPiA+ICsgICAgICAgICAg
ICAgZnNjID0gRklFTERfUFJFUChSSVNDVl9JT01NVV9EQ19GU0NfTU9ERSwgUklTQ1ZfSU9NTVVf
RENfRlNDX01PREVfQkFSRSk7Cj4gPiArICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAv
KiBUaGlzIHNob3VsZCBuZXZlciBoYXBwZW4uICovCj4gPiArICAgICAgICAgICAgIHJldHVybiAt
RU5PREVWOwo+ID4gKyAgICAgfQo+Cj4gUGxlYXNlIGRvbid0IHdyaXRlIGl0IGxpa2UgdGhpcy4g
VGhpcyBmdW5jdGlvbiBpcyBhbHJlYWR5IGJlaW5nIGNhbGxlZAo+IGJ5IGZ1bmN0aW9ucyB0aGF0
IGFyZSBhbHJlYWR5IHVuZGVyIHNwZWNpZmljIG9wcywgZG9uJ3QgY2hlY2sKPiBkb21haW4tPnR5
cGUgaGVyZS4KPgo+IEluc3RlYWQgaGF2ZSB0aGUgY2FsbGVyIGNvbXB1dGUgYW5kIHBhc3MgaW4g
dGhlIHRhL3RjL2ZzYwo+IHZhbHVlcy4gTWF5YmUgaW4gYSB0aWR5IHN0cnVjdC4uCj4KPiA+ICsg
ICAgIC8qIFVwZGF0ZSBleGlzdGluZyBvciBhbGxvY2F0ZSBuZXcgZW50cmllcyBpbiBkZXZpY2Ug
ZGlyZWN0b3J5ICovCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZndzcGVjLT5udW1faWRzOyBp
KyspIHsKPiA+ICsgICAgICAgICAgICAgZGMgPSByaXNjdl9pb21tdV9nZXRfZGMoaW9tbXUsIGZ3
c3BlYy0+aWRzW2ldLCAhaW9tbXVfZG9tYWluKTsKPiA+ICsgICAgICAgICAgICAgaWYgKCFkYyAm
JiAhaW9tbXVfZG9tYWluKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4g
KyAgICAgICAgICAgICBpZiAoIWRjKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAt
RU5PREVWOwo+Cj4gQnV0IGlmIHRoaXMgZmFpbHMgc29tZSBvZiB0aGUgZndzcGVjcyB3ZXJlIGxl
ZnQgaW4gYSB3ZWlyZCBzdGF0ZSA/Cj4KPiBEcml2ZXJzIHNob3VsZCB0cnkgaGFyZCB0byBoYXZl
IGF0dGFjaCBmdW5jdGlvbnMgdGhhdCBmYWlsIGFuZCBtYWtlIG5vCj4gY2hhbmdlIGF0IGFsbCBv
ciBmdWxseSBzdWNjZWVkLgo+Cj4gTWVhbmluZyBpZGVhbGx5IHByZWFsbG9jYXRlIGFueSByZXF1
aXJlZCBtZW1vcnkgYmVmb3JlIGRvaW5nIGFueQo+IGNoYW5nZSB0byB0aGUgSFcgdmlzYWJsZSBz
dHJ1Y3R1cmVzLgo+CgpHb29kIHBvaW50LiBEb25lLgpMb29raW5nIGF0IHRoZSBmd3NwZWMtPmlk
c1tdIEknbSBhc3N1bWluZyBub2JvZHkgd2lsbCBhZGQvbW9kaWZ5IHRoZQpJRHMgYWZ0ZXIgaW9t
bXVfcHJvYmVfZGV2aWNlKCkgY29tcGxldGVzLgoKPiA+ICsKPiA+ICsgICAgICAgICAgICAgLyog
U3dhcCBkZXZpY2UgY29udGV4dCwgdXBkYXRlIFRDIHZhbGlkIGJpdCBhcyB0aGUgbGFzdCBvcGVy
YXRpb24gKi8KPiA+ICsgICAgICAgICAgICAgeGNoZzY0KCZkYy0+ZnNjLCBmc2MpOwo+ID4gKyAg
ICAgICAgICAgICB4Y2hnNjQoJmRjLT50YSwgdGEpOwo+ID4gKyAgICAgICAgICAgICB4Y2hnNjQo
JmRjLT50YywgdGMpOwo+Cj4gVGhpcyBkb2Vzbid0IGxvb29rIHJpZ2h0PyBXaGVuIHlvdSBnZXQg
dG8gYWRkaW5nIFBBR0lORyBzdXBvcnQgZnNjIGhhcwo+IHRoZSBwYWdlIHRhYmxlIHBmbiBhbmQg
dGEgaGFzIHRoZSBjYWNoZSB0YWcsIHNvIHRoaXMgd2lsbCBlbmQgdXAKPiB0ZWFyaW5nIHRoZSBk
YXRhIGZvciBzdXJlLCBlZyB3aGVuIGFza2VkIHRvIHJlcGxhY2UgYSBQQUdJTkcgZG9tYWluCj4g
d2l0aCBhbm90aGVyIFBBR0lORyBkb21haW4/IFRoYXQgd2lsbCBjcmVhdGUgYSBmdW5jdGlvbmFs
L3NlY3VyaXR5Cj4gcHJvYmxlbSwgcmlnaHQ/Cj4KPiBJIHdvdWxkIGVuY291cmFnZSB5b3UgdG8g
cmUtdXNlIHRoZSBBUk0gc2VxdWVuY2luZyBjb2RlLCBpZGVhbGx5IG1vdmVkCj4gdG8gc29tZSBn
ZW5lcmljIGhlbHBlciBsaWJyYXJ5LiBFdmVyeSBpb21tdSBkcml2ZXIgZGVhbGluZyB3aXRoCj4g
bXVsdGktcXVhbnRhIGRlc2NyaXB0b3JzIHNlZW1zIHRvIGhhdmUgdGhpcyBzYW1lIGZ1bmRhbWVu
dGFsCj4gc2VxdWVuY2luZyBwcm9ibGVtLgo+CgpHb29kIHBvaW50LiBSZXdvcmtlZC4KCj4gPiAr
c3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfcmVsZWFzZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gZGV2
X3RvX2lvbW11KGRldik7Cj4gPiArCj4gPiArICAgICByaXNjdl9pb21tdV9hdHRhY2hfZG9tYWlu
KGlvbW11LCBkZXYsIE5VTEwpOwo+ID4gK30KPgo+IFRoZSByZWxlYXNlX2RvbWFpbiBoYXMgbGFu
ZGVkIHRvbyBub3cuIFBsZWFzZSBkb24ndCBpbnZlbnQgd2VpcmQgTlVMTAo+IGRvbWFpbiB0eXBl
cyB0aGF0IGhhdmUgc3BlY2lhbCBtZWFuaW5nLiBJIGFzc3VtZSBjbGVhcmluZyB0aGUgViBiaXQg
aXMKPiBhIGJsb2NraW5nIGJlaGF2aW9yPyBTbyBwbGVhc2UgaW1wbGVtZW50IGEgcHJvcGVyIGJs
b2NraW5nIGRvbWFpbiBhbmQKPiBzZXQgcmVsZWFzZV9kb21haW4gPSAmcmlzY3ZfaW9tbXVfYmxv
Y2tpbmcgYW5kIGp1c3Qgb21pdCB0aGlzIHJlbGVhc2UKPiBmdW5jdGlvbi4KPgoKVXBkYXRlZCB0
byB1c2UgcmVsZWFzZV9kb21haW4sIHNob3VsZCBiZSBjbGVhbmVyIG5vdy4KQ2xlYXJpbmcgVEMu
ViBpcyBhIGJsb2NraW5nIChidXQgbm9pc3kpIGJlaGF2aW9yLCBzaG91bGQgYmUgZmluZSBmb3IK
cmVsZWFzZSBkb21haW4gd2hlcmUgZGV2aWNlcyBzaG91bGQgYmUgcXVpZXNjZWQgYWxyZWFkeS4K
Cj4gPiBAQCAtMTMzLDEyICs0ODAsMTQgQEAgaW50IHJpc2N2X2lvbW11X2luaXQoc3RydWN0IHJp
c2N2X2lvbW11X2RldmljZSAqaW9tbXUpCj4gPiAgICAgICByYyA9IHJpc2N2X2lvbW11X2luaXRf
Y2hlY2soaW9tbXUpOwo+ID4gICAgICAgaWYgKHJjKQo+ID4gICAgICAgICAgICAgICByZXR1cm4g
ZGV2X2Vycl9wcm9iZShpb21tdS0+ZGV2LCByYywgInVuZXhwZWN0ZWQgZGV2aWNlIHN0YXRlXG4i
KTsKPiA+IC0gICAgIC8qCj4gPiAtICAgICAgKiBQbGFjZWhvbGRlciBmb3IgYSBjb21wbGV0ZSBJ
T01NVSBkZXZpY2UgaW5pdGlhbGl6YXRpb24uCj4gPiAtICAgICAgKiBGb3Igbm93LCBvbmx5IGJh
cmUgbWluaW11bTogZW5hYmxlIGdsb2JhbCBpZGVudGl0eSBtYXBwaW5nIG1vZGUgYW5kIHJlZ2lz
dGVyIHN5c2ZzLgo+ID4gLSAgICAgICovCj4gPiAtICAgICByaXNjdl9pb21tdV93cml0ZXEoaW9t
bXUsIFJJU0NWX0lPTU1VX1JFR19ERFRQLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIEZJ
RUxEX1BSRVAoUklTQ1ZfSU9NTVVfRERUUF9NT0RFLCBSSVNDVl9JT01NVV9ERFRQX01PREVfQkFS
RSkpOwo+ID4gKwo+ID4gKyAgICAgcmMgPSByaXNjdl9pb21tdV9kZHRfYWxsb2MoaW9tbXUpOwo+
ID4gKyAgICAgaWYgKFdBUk4ocmMsICJjYW5ub3QgYWxsb2NhdGUgZGV2aWNlIGRpcmVjdG9yeVxu
IikpCj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX2luaXQ7Cj4KPiBtZW1vcnkgYWxsb2NhdGlv
biBmYWlsdXJlIGFscmVhZHkgbWFrZXMgbm9pc3kgcHJpbnRzLCBtb3JlIHByaW50cyBhcmUKPiBu
b3QgbmVlZGVkLi4KPgo+ID4gKyAgICAgcmMgPSByaXNjdl9pb21tdV9zZXRfZGR0cF9tb2RlKGlv
bW11LCBSSVNDVl9JT01NVV9ERFRQX01PREVfTUFYKTsKPiA+ICsgICAgIGlmIChXQVJOKHJjLCAi
Y2Fubm90IGVuYWJsZSBpb21tdSBkZXZpY2VcbiIpKQo+ID4gKyAgICAgICAgICAgICBnb3RvIGVy
cl9pbml0Owo+Cj4gVGhpcyBpcyBub3QgYSBwcm9wZXIgdXNlIG9mIFdBUk4sIGl0IHNob3VsZCBv
bmx5IGJlIHVzZWQgZm9yIHRoaW5ncwo+IHRoYXQgY2Fubm90IGhhcHBlbiBub3QgdW5kZXNpcmVk
IGVycm9yIHBhdGhzLgo+Cj4gSmFzb24KClRoYW5rcywgYWNrIHRvIGFsbC4gV2lsbCBwdXNoIHVw
ZGF0ZWQgdjMgc2hvcnRseS4KLSBUb21hc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
