Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F4C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq1Sp/42JqasSyGuF1pz7B/Pu67iIiVria/rsGXYpTA=; b=M/X/57mLJbqGWi
	0cbvPTIDXPEFwNWyVi2i1bNzZaoKzds6TKAwrcDT5gYYKNyKF/HPDquKES8wwJuJP96iJ/REZjvJq
	Qgdzhb4PqY+z/gF2iZLKC1LAbv26JfLk6gQlnS4v9kfWl3CaKBp1h3ayetM82bm4eLZwJ+/wXvDga
	b/byA5/GK+jHvtUfF1lFhQbWRY1vDRf9n3UE5mBgco6UnWuhnf65LEPLPS8f9L9fM0BBTeXvfQZ9V
	sffviXCIWuFUcvZva82eNTiTFmfe8GJIlyZ3kMxUVOUpVYbNdZ27wDxmvtE45zMbA82F6ZWMkyUSk
	SovhSszgboZ5bnyNXiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6l9f-0000000F52W-2G0f;
	Tue, 14 May 2024 05:56:51 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6l9c-0000000F51x-1YGI
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 05:56:50 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7e1c2ea8481so107649139f.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 22:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715666206; x=1716271006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=440oD4b9Bphk4WWjPWWaKFmIBo6vJ3VIwixVh9ybBDo=;
        b=gCaqu52Rsy+H7WX128Za9mznmRPOVSw182zk7iBQ9FDD9TtZG1cp1OSBywX8cAGva5
         hm4YDrrAliBWQzQILd3Q/egUelbbLReYav50jaah6N7+6yKX8Ie4Ee+9CtjKL0YfRNNC
         MIsY8CsP8AkfjCTFkWwQrcV5KE9jjVe8PC4vypqd8aCDnWOqo+IVENAf7NCN7zfCvkeY
         0eHuJBta1xXfQImxeVwFOBAjz7MxmOPJwZSdLfWbcllwSN1Hi20Sx/Gw6J36U1I42Fdm
         tlYNVflTX2dlGgOspMdsp3KX+bQJwCExFGmM5e5EpL+9i2trfR56HlS1YMfOaSCtLs9Z
         6U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715666206; x=1716271006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=440oD4b9Bphk4WWjPWWaKFmIBo6vJ3VIwixVh9ybBDo=;
        b=jUm9ry1px5VhHIGw0kPg0IeGC2Y7eYfasAjsn88R2Gwm8Rb8ZmGkkJxCQGW0pz5RLe
         prgklhYa/ySOfcxSK3wXrPc1i/8+FOI59ZI4xev3jBPsx6kQeSMCXW+0UP8eQZcCIxEX
         Ov42z5u6E1ibS6aa3+agT+sgcRkCMLVXjeyGAwb/PbDPRixRd+m/glHNqDXteXW+KUfI
         Tioax0mymWCsiCKarPTKq4pn4Y1+AArq71VZxzIhTmei3N+IALAX7cjj8+ntnao5Jvpg
         z2i6J9PzNSjZTpdPgdNYoKr8uMBrYt22Oc9fbZgQTVxGHg80kydzKh8u2zOf7QQWhD02
         jhRw==
X-Forwarded-Encrypted: i=1; AJvYcCUglUr5gSlb/0iACx4IMnHa9fo7Tfx2rEzLBqg3GwdHmnDuFopWtukfiCQ0mylFfx5iiayMKNaXjSwng7xG1e7/PUKf+qdGrsyId6abhrSW
X-Gm-Message-State: AOJu0YzTlXrPn52RZYkxLup5Vb8a2yxSFnl/Uem3FyvYEUoLloSpFHbk
	AIKHD+lOagdi+XRpSuZeU4pVeZCPz/qkLDoknD/2Qfd5QFgC45V2M7mq7qTSTsypq+lT+rSPjci
	AZTHk5sX+ZKOrBL0QLD+Jtr0j7MM/w0aKSZ+qrQ==
X-Google-Smtp-Source: AGHT+IF9N9dfmP7bVHVJo2ZfC3OHvLjDan409QcJv1aNsscxhoEEW8h6W1834/OEIiZpFBCIoCKO6oKWs8pWyT7uDD8=
X-Received: by 2002:a05:6602:3049:b0:7e1:d5cc:84bf with SMTP id
 ca18e2360f4ac-7e1d5cc851dmr559335339f.6.1715666206518; Mon, 13 May 2024
 22:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714752293.git.tjeznach@rivosinc.com> <b28d4fe49c5fe4e3ece9de789cfd92cfa5b3c16c.1714752293.git.tjeznach@rivosinc.com>
In-Reply-To: <b28d4fe49c5fe4e3ece9de789cfd92cfa5b3c16c.1714752293.git.tjeznach@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 14 May 2024 13:56:35 +0800
Message-ID: <CANXhq0q+aQ1T37j4uQi5ryUyPxBtvQkaBJ9qvS9iGwSRGaQSyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] iommu/riscv: Enable IOMMU registration and device probe.
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
	Lu Baolu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_225648_490500_3978C497 
X-CRM114-Status: GOOD (  20.95  )
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

T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAxMjoxM+KAr0FNIFRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gQWR2ZXJ0aXNlIElPTU1VIGRldmljZSBhbmQgaXRz
IGNvcmUgQVBJLgo+IE9ubHkgbWluaW1hbCBpbXBsZW1lbnRhdGlvbiBmb3Igc2luZ2xlIGlkZW50
aXR5IGRvbWFpbiB0eXBlLCB3aXRob3V0Cj4gcGVyLWdyb3VwIGRvbWFpbiBwcm90ZWN0aW9uLgo+
Cj4gUmV2aWV3ZWQtYnk6IEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUuYwo+IGluZGV4IDNjNWE2YjQ5NjY5ZC4uMWY4ODlkYWZmYjBlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUuYwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9pbml0
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPgo+ICAjaW5jbHVkZSAiaW9tbXUtYml0cy5o
Igo+ICAjaW5jbHVkZSAiaW9tbXUuaCIKPiBAQCAtMzYsNiArMzcsNjAgQEAgc3RhdGljIHZvaWQg
cmlzY3ZfaW9tbXVfZGlzYWJsZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiAg
ICAgICAgIHJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX1BRQ1NSLCAw
KTsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfYXR0YWNoX2lkZW50aXR5X2RvbWFp
bihzdHJ1Y3QgaW9tbXVfZG9tYWluICppb21tdV9kb21haW4sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsg
ICAgICAgLyogR2xvYmFsIHBhc3MtdGhyb3VnaCBhbHJlYWR5IGVuYWJsZWQsIGRvIG5vdGhpbmcg
Zm9yIG5vdy4gKi8KPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0
IGlvbW11X2RvbWFpbiByaXNjdl9pb21tdV9pZGVudGl0eV9kb21haW4gPSB7Cj4gKyAgICAgICAu
dHlwZSA9IElPTU1VX0RPTUFJTl9JREVOVElUWSwKPiArICAgICAgIC5vcHMgPSAmKGNvbnN0IHN0
cnVjdCBpb21tdV9kb21haW5fb3BzKSB7Cj4gKyAgICAgICAgICAgICAgIC5hdHRhY2hfZGV2ID0g
cmlzY3ZfaW9tbXVfYXR0YWNoX2lkZW50aXR5X2RvbWFpbiwKPiArICAgICAgIH0KPiArfTsKPiAr
Cj4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBlKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiArewo+ICsgICAgICAgcmV0dXJuIElPTU1VX0RPTUFJTl9JREVOVElUWTsKPiAr
fQo+ICsKPiArc3RhdGljIHN0cnVjdCBpb21tdV9ncm91cCAqcmlzY3ZfaW9tbXVfZGV2aWNlX2dy
b3VwKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsgICAgICAgaWYgKGRldl9pc19wY2koZGV2
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHBjaV9kZXZpY2VfZ3JvdXAoZGV2KTsKPiArICAg
ICAgIHJldHVybiBnZW5lcmljX2RldmljZV9ncm91cChkZXYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW50IHJpc2N2X2lvbW11X29mX3hsYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0
IG9mX3BoYW5kbGVfYXJncyAqYXJncykKPiArewo+ICsgICAgICAgcmV0dXJuIGlvbW11X2Z3c3Bl
Y19hZGRfaWRzKGRldiwgYXJncy0+YXJncywgMSk7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qg
aW9tbXVfZGV2aWNlICpyaXNjdl9pb21tdV9wcm9iZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBkZXZfaW9tbXVf
ZndzcGVjX2dldChkZXYpOwo+ICsgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9t
bXU7Cj4gKwo+ICsgICAgICAgaWYgKCFmd3NwZWMtPmlvbW11X2Z3bm9kZS0+ZGV2IHx8ICFmd3Nw
ZWMtPm51bV9pZHMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwoK
SXQgc2VlbXMgdG8gbWUgdGhhdCB3ZSBtaWdodCBuZWVkIHRvIGVuc3VyZSBmd3NwZWMgaXMgbm90
IE5VTEwgYmVmb3JlCmFjY2Vzc2luZyBmd3NwZWMtPmlvbW11X2Z3bm9kZSwgb3RoZXJ3aXNlLCBp
dCB3aWxsIGNhdXNlIE5VTEwgcG9pbnRlcgpkZXJlZmVyZW5jZS4KCj4gKwo+ICsgICAgICAgaW9t
bXUgPSBkZXZfZ2V0X2RydmRhdGEoZndzcGVjLT5pb21tdV9md25vZGUtPmRldik7Cj4gKyAgICAg
ICBpZiAoIWlvbW11KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsK
PiArCj4gKyAgICAgICByZXR1cm4gJmlvbW11LT5pb21tdTsKPiArfQo+ICsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBpb21tdV9vcHMgcmlzY3ZfaW9tbXVfb3BzID0gewo+ICsgICAgICAgLm9mX3hs
YXRlID0gcmlzY3ZfaW9tbXVfb2ZfeGxhdGUsCj4gKyAgICAgICAuaWRlbnRpdHlfZG9tYWluID0g
JnJpc2N2X2lvbW11X2lkZW50aXR5X2RvbWFpbiwKPiArICAgICAgIC5kZWZfZG9tYWluX3R5cGUg
PSByaXNjdl9pb21tdV9kZXZpY2VfZG9tYWluX3R5cGUsCj4gKyAgICAgICAuZGV2aWNlX2dyb3Vw
ID0gcmlzY3ZfaW9tbXVfZGV2aWNlX2dyb3VwLAo+ICsgICAgICAgLnByb2JlX2RldmljZSA9IHJp
c2N2X2lvbW11X3Byb2JlX2RldmljZSwKPiArfTsKPiArCj4gIHN0YXRpYyBpbnQgcmlzY3ZfaW9t
bXVfaW5pdF9jaGVjayhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiAgewo+ICAg
ICAgICAgdTY0IGRkdHA7Cj4gQEAgLTcxLDYgKzEyNiw3IEBAIHN0YXRpYyBpbnQgcmlzY3ZfaW9t
bXVfaW5pdF9jaGVjayhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPgo+ICB2b2lk
IHJpc2N2X2lvbW11X3JlbW92ZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiAg
ewo+ICsgICAgICAgaW9tbXVfZGV2aWNlX3VucmVnaXN0ZXIoJmlvbW11LT5pb21tdSk7Cj4gICAg
ICAgICBpb21tdV9kZXZpY2Vfc3lzZnNfcmVtb3ZlKCZpb21tdS0+aW9tbXUpOwo+ICB9Cj4KPiBA
QCAtOTUsNSArMTUxLDE1IEBAIGludCByaXNjdl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21t
dV9kZXZpY2UgKmlvbW11KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShp
b21tdS0+ZGV2LCByYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNh
bm5vdCByZWdpc3RlciBzeXNmcyBpbnRlcmZhY2VcbiIpOwo+Cj4gKyAgICAgICByYyA9IGlvbW11
X2RldmljZV9yZWdpc3RlcigmaW9tbXUtPmlvbW11LCAmcmlzY3ZfaW9tbXVfb3BzLCBpb21tdS0+
ZGV2KTsKPiArICAgICAgIGlmIChyYykgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyX3Byb2Jl
KGlvbW11LT5kZXYsIHJjLCAiY2Fubm90IHJlZ2lzdGVyIGlvbW11IGludGVyZmFjZVxuIik7Cj4g
KyAgICAgICAgICAgICAgIGdvdG8gZXJyX3JlbW92ZV9zeXNmczsKPiArICAgICAgIH0KPiArCj4g
ICAgICAgICByZXR1cm4gMDsKPiArCj4gK2Vycl9yZW1vdmVfc3lzZnM6Cj4gKyAgICAgICBpb21t
dV9kZXZpY2Vfc3lzZnNfcmVtb3ZlKCZpb21tdS0+aW9tbXUpOwo+ICsgICAgICAgcmV0dXJuIHJj
Owo+ICB9Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
