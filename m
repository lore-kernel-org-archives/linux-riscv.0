Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305CFCD484D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BFMC7E+Bxz+yAfCr1iTxB6LAG6qeXeRm4HgriTd3gs=; b=GIRVS4PhZGa2+X
	nJAJ9hA8mQ9NtscqjfYB0Si2m9YOBcSw2MaYvRBwKmtPt1LOxdakfWyjaQ4uIfoyt/67WyrqlvSZB
	/jbcXFsvcEHb8z5bgPHU6ISMZe9IFHA5he8gTGQCG96seY8GVXsSO8jJWrzL5e8yUzRsILURcLAhH
	6msGpZlRhNOGI+CiPMv4bQrR2YcJsWvU+jJLwX9iOOKHbv89cmr2gMDD6XeperZtE9ck+Gsxrnd7/
	grayPfp//sPnUNJ10Dv7JoK+VXDSqcap5nf5Zs5/eefkJz2pPfJ3QuyFf/5BfDqrkTEF0rGz4sYRf
	6yHVJ/j6LluS+2iqpu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrGm-00000004qW1-1qxO;
	Wed, 04 Sep 2024 14:46:04 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrGN-00000004qMb-039j
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:45:40 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-39f4ff22a49so17176385ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1725461138; x=1726065938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51nJ3+dnXamTe1z0PXS6eJAv/Sucabjt3mu+GvHMgUs=;
        b=iWnYM9j/dnc359gZ398m8DqkFyVZo1g6oKPaeawyMBEGjLbLwPgBu6+Enwh8QC4IsP
         +fuGEvk42x6j/fIgOQCZ/TFopLm7p8P4uO/qUUHjUkaKFgTe7Lgt1U5n89mUD+Ee1nui
         56lv4GOQ6tAk+1OIhuoa/4ROyfsa4CkvXiYkyqIzD+HWUwlVcpVEd6i4tBxAfitkbNjK
         gMzDcRZk0P1Os/SNLuvJARY6zisrFIfV3wL4oLjciK+5NV5pXe3YkTW0ZJbWtUS5OF4E
         JNQxeHntfqFBYkDkk/kMlce6nPTYv3SAbNngk8Lt7Tzgn7/oyHCiRbCgKdMggauytzq6
         Xbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461138; x=1726065938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51nJ3+dnXamTe1z0PXS6eJAv/Sucabjt3mu+GvHMgUs=;
        b=wxDYy/yWArdE6yUgUGrdVB85kl7DB250Sz4F7C1klY6mKpRWFb/WL5LD97bJyt/dR/
         zSwJuHKewuDMADf6yw2voMhYqH3Sp9el8ZeJffSHNIBvtYhhcnmN8+Xd37E2eElOkR0o
         Wkibwc+br7ajjaNCj5tM9I2dpgY7VBVJvcHjmgB3cnTDaWhR7PQNTSzvNSdeQIhGr8+S
         2Sy6V39aAf6YD5irkNhsubJcMdw6ydCZJHyGOMZNOv/tCVrvy5Hi9jzYW1ViJJi1HHv2
         CjQqRrUx1wYGtc2cunWqD9sBeO027q+VcRLRZo02G15Bis6dH4H6m0Fndn1rwKrdCLGC
         83fw==
X-Forwarded-Encrypted: i=1; AJvYcCXXYoheeQWBvAe3W5IX7761qZEkODvAcqiv9pBSPfBUhfI5Hpl76kuPszX9gp0qgziaNRDW3E/artud5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9yOcQUTCnssjvOiIppzqOdpVHgw9lkb4o0pFSyRBCR72KAsTU
	cexVS7ncMIxJTbWxfr4i/jpqStBT7parrEb9xm4U3u5vw3C3P+1SAFC6c10lP7V0e0OV2ywEbEq
	Iqb9c2qkZte2PBgZtcFPWulvgEEsUlFnRiYPahQ==
X-Google-Smtp-Source: AGHT+IFLJd6RqOOTfo+W5iDNyY9QHqf9y/6hYcTKnLONyt7tLaod+XWb5F7JfdnatN+pTnZbGN1pwsF1i8OPhTP7U0c=
X-Received: by 2002:a05:6e02:52c:b0:39f:558a:e404 with SMTP id
 e9e14a558f8ab-39f558ae637mr120606115ab.4.1725461138110; Wed, 04 Sep 2024
 07:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-10-samuel.holland@sifive.com> <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
 <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com>
In-Reply-To: <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Sep 2024 20:15:27 +0530
Message-ID: <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_074539_256726_ED51C8BE 
X-CRM114-Status: GOOD (  35.62  )
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

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCA4OjAx4oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDIwMjQtMDktMDQg
NzoxNyBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDI5LCAyMDI0IGF0IDY6
MzLigK9BTSBTYW11ZWwgSG9sbGFuZAo+ID4gPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdy
b3RlOgo+ID4+Cj4gPj4gVGhlIGludGVyZmFjZSBmb3IgY29udHJvbGxpbmcgcG9pbnRlciBtYXNr
aW5nIGluIFZTLW1vZGUgaXMgaGVudmNmZy5QTU0sCj4gPj4gd2hpY2ggaXMgcGFydCBvZiB0aGUg
U3NucG0gZXh0ZW5zaW9uLCBldmVuIHRob3VnaCBwb2ludGVyIG1hc2tpbmcgaW4KPiA+PiBIUy1t
b2RlIGlzIHByb3ZpZGVkIGJ5IHRoZSBTbW5wbSBleHRlbnNpb24uIEFzIGEgcmVzdWx0LCBlbXVs
YXRpbmcgU21ucG0KPiA+PiBpbiB0aGUgZ3Vlc3QgcmVxdWlyZXMgKG9ubHkpIFNzbnBtIG9uIHRo
ZSBob3N0Lgo+ID4+Cj4gPj4gU2luY2UgdGhlIGd1ZXN0IGNvbmZpZ3VyZXMgU21ucG0gdGhyb3Vn
aCB0aGUgU0JJIEZpcm13YXJlIEZlYXR1cmVzCj4gPj4gaW50ZXJmYWNlLCB0aGUgZXh0ZW5zaW9u
IGNhbiBiZSBkaXNhYmxlZCBieSBmYWlsaW5nIHRoZSBTQkkgY2FsbC4gU3NucG0KPiA+PiBjYW5u
b3QgYmUgZGlzYWJsZWQgd2l0aG91dCBpbnRlcmNlcHRpbmcgd3JpdGVzIHRvIHRoZSBzZW52Y2Zn
IENTUi4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9s
bGFuZEBzaWZpdmUuY29tPgo+ID4+IC0tLQo+ID4+Cj4gPj4gKG5vIGNoYW5nZXMgc2luY2UgdjIp
Cj4gPj4KPiA+PiBDaGFuZ2VzIGluIHYyOgo+ID4+ICAtIE5ldyBwYXRjaCBmb3IgdjIKPiA+Pgo+
ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAyICsrCj4gPj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDMgKysrCj4gPj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4g
Pj4gaW5kZXggZTk3ZGIzMjk2NDU2Li40ZjI0MjAxMzc2YjEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oCj4gPj4gQEAgLTE3NSw2ICsxNzUsOCBAQCBlbnVtIEtWTV9SSVND
Vl9JU0FfRVhUX0lEIHsKPiA+PiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKPiA+PiAg
ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+ID4+ICAgICAgICAgS1ZNX1JJU0NWX0lT
QV9FWFRfWkFXUlMsCj4gPj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTSwKPiA+PiAr
ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NTTlBNLAo+ID4+ICAgICAgICAgS1ZNX1JJU0NWX0lT
QV9FWFRfTUFYLAo+ID4+ICB9Owo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gPj4gaW5kZXgg
YjMxOWM0YzEzYzU0Li42ZjgzM2VjMjM0NGEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMK
PiA+PiBAQCAtMzQsOSArMzQsMTEgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lz
YV9leHRfYXJyW10gPSB7Cj4gPj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfTV0gPSBSSVND
Vl9JU0FfRVhUX20sCj4gPj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfVl0gPSBSSVNDVl9J
U0FfRVhUX3YsCj4gPj4gICAgICAgICAvKiBNdWx0aSBsZXR0ZXIgZXh0ZW5zaW9ucyAoYWxwaGFi
ZXRpY2FsbHkgc29ydGVkKSAqLwo+ID4+ICsgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX1NNTlBN
XSA9IFJJU0NWX0lTQV9FWFRfU1NOUE0sCj4gPgo+ID4gV2h5IG5vdCB1c2UgS1ZNX0lTQV9FWFRf
QVJSKCkgbWFjcm8gaGVyZSA/Cj4KPiBCZWNhdXNlIHRoZSBleHRlbnNpb24gbmFtZSBpbiB0aGUg
aG9zdCBkb2VzIG5vdCBtYXRjaCB0aGUgZXh0ZW5zaW9uIG5hbWUgaW4gdGhlCj4gZ3Vlc3QuIFBv
aW50ZXIgbWFza2luZyBmb3IgSFMgbW9kZSBpcyBwcm92aWRlZCBieSBTbW5wbS4gUG9pbnRlciBt
YXNraW5nIGZvciBWUwo+IG1vZGUgaXMgcHJvdmlkZWQgYnkgU3NucG0gYXQgdGhlIGhhcmR3YXJl
IGxldmVsLCBidXQgdGhpcyBuZWVkcyB0byBhcHBlYXIgdG8gdGhlCj4gZ3Vlc3QgYXMgaWYgU21u
cG0gd2FzIGltcGxlbWVudGVkLCBzaW5jZSB0aGUgZ3Vlc3QgdGhpbmtzIGl0IGlzIHJ1bm5pbmcg
b24gYmFyZQo+IG1ldGFsLgoKT2theSwgbWFrZXMgc2Vuc2UuCgo+Cj4gPj4gICAgICAgICBLVk1f
SVNBX0VYVF9BUlIoU01TVEFURUVOKSwKPiA+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU0FJ
QSksCj4gPj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NDT0ZQTUYpLAo+ID4+ICsgICAgICAg
S1ZNX0lTQV9FWFRfQVJSKFNTTlBNKSwKPiA+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU1RD
KSwKPiA+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVklOVkFMKSwKPiA+PiAgICAgICAgIEtW
TV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKPiA+PiBAQCAtMTI5LDYgKzEzMSw3IEBAIHN0YXRpYyBi
b29sIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQp
Cj4gPj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX006Cj4gPj4gICAgICAgICAvKiBU
aGVyZSBpcyBub3QgYXJjaGl0ZWN0dXJhbCBjb25maWcgYml0IHRvIGRpc2FibGUgc3Njb2ZwbWYg
Y29tcGxldGVseSAqLwo+ID4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU0NPRlBN
RjoKPiA+PiArICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1NOUE06Cj4gPgo+ID4gV2h5
IG5vdCBhZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZSA/Cj4gPgo+ID4gRGlzYWJsaW5n
IFNtbnBtIGZyb20gS1ZNIHVzZXIgc3BhY2UgaXMgdmVyeSBkaWZmZXJlbnQgZnJvbQo+ID4gZGlz
YWJsaW5nIFNtbnBtIGZyb20gR3Vlc3QgdXNpbmcgU0JJIEZXRlQgZXh0ZW5zaW9uLgo+Cj4gVW50
aWwgYSBzdWNjZXNzZnVsIFNCSSBGV0ZUIGNhbGwgdG8gS1ZNIHRvIGVuYWJsZSBwb2ludGVyIG1h
c2tpbmcgZm9yIFZTIG1vZGUsCj4gdGhlIGV4aXN0ZW5jZSBvZiBTbW5wbSBoYXMgbm8gdmlzaWJs
ZSBlZmZlY3Qgb24gdGhlIGd1ZXN0LiBTbyBmYWlsaW5nIHRoZSBTQkkKPiBjYWxsIGlzIHN1ZmZp
Y2llbnQgdG8gcHJldGVuZCB0aGF0IHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0IFNtbnBt
Lgo+Cj4gPiBUaGUgS1ZNIHVzZXIgc3BhY2Ugc2hvdWxkIGFsd2F5cyBhZGQgU21ucG0gaW4gdGhl
Cj4gPiBHdWVzdCBJU0Egc3RyaW5nIHdoZW5ldmVyIHRoZSBIb3N0IElTQSBzdHJpbmcgaGFzIGl0
Lgo+Cj4gSSBkaXNhZ3JlZS4gQWxsb3dpbmcgdXNlcnNwYWNlIHRvIGRpc2FibGUgZXh0ZW5zaW9u
cyBpcyB1c2VmdWwgZm9yIHRlc3RpbmcgYW5kCj4gdG8gc3VwcG9ydCBtaWdyYXRpb24gdG8gaG9z
dHMgd2hpY2ggZG8gbm90IHN1cHBvcnQgdGhvc2UgZXh0ZW5zaW9ucy4gU28gSSB3b3VsZAo+IG9u
bHkgYWRkIGV4dGVuc2lvbnMgdG8gdGhpcyBsaXN0IGlmIHRoZXJlIGlzIG5vIHBvc3NpYmxlIHdh
eSB0byBkaXNhYmxlIHRoZW0uCgpJIGFtIG5vdCBzYXlpbmcgdG8gZGlzYWxsb3cgS1ZNIHVzZXIg
c3BhY2UgZGlzYWJsaW5nIFNtbnBtLgoKVGhlIHByZXNlbmNlIG9mIFNtbnBtIGluIElTQSBvbmx5
IG1lYW5zIHRoYXQgaXQgaXMgcHJlc2VudCBpbiBIVwpidXQgaXQgbmVlZHMgdG8gYmUgZXhwbGlj
aXRseSBjb25maWd1cmVkL2VuYWJsZWQgdXNpbmcgU0JJIEZXRlQuCgpLVk0gdXNlciBzcGFjZSBj
YW4gY2VydGFpbmx5IGRpc2FibGUgZXh0ZW5zaW9ucyBieSBub3QgYWRkaW5nIGl0IHRvCklTQSBz
dHJpbmcgYmFzZWQgb24gdGhlIEtWTVRPT0wvUUVNVS1LVk0gY29tbWFuZCBsaW5lIG9wdGlvbi4K
QWRkaXRpb25hbGx5LCB3aGVuIFNCSSBGV0ZUIGlzIGFkZGVkIHRvIEtWTSBSSVNDLVYuIEl0IHdp
bGwgaGF2ZSBpdHMKb3duIHdheSB0byBleHBsaWNpdGx5IGRpc2FibGUgZmlybXdhcmUgZmVhdHVy
ZXMgZnJvbSBLVk0gdXNlciBzcGFjZS4KCj4KPiA+IFRoZSBHdWVzdCBtdXN0IGV4cGxpY2l0bHkg
dXNlIFNCSSBGV0ZUIHRvIGVuYWJsZQo+ID4gU21ucG0gb25seSBhZnRlciBpdCBzZWVzIFNtbnBt
IGluIElTQSBzdHJpbmcuCj4KPiBZZXMsIGV4YWN0bHksIGFuZCB0aGUgcHVycG9zZSBvZiBub3Qg
aW5jbHVkaW5nIFNtbnBtIGluIHRoZSBzd2l0Y2ggY2FzZSBoZXJlIGlzCj4gc28gdGhhdCBLVk0g
dXNlciBzcGFjZSBjYW4gY29udHJvbCB3aGV0aGVyIG9yIG5vdCBpdCBhcHBlYXJzIGluIHRoZSBJ
U0Egc3RyaW5nLgo+Cj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+ID4+ICAgICAgICAgY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9TU1RDOgo+ID4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9T
VklOVkFMOgo+ID4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVk5BUE9UOgo+ID4+
IC0tCj4gPj4gMi40NS4xCj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+Cj4gPiBSZWdhcmRzLAo+ID4g
QW51cAo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
