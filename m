Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C177C77B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 01:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uqIQBMIrU07QRRwRpz7S4CPjwKP1J2lmbBZjM09dRM0=; b=N2WrNlACyGI7ErdpBxhn6+Ic/N
	khQ65e+7z7Es7oTpuj/3LyIStwQ19C48ve6kyFR6ceM3+v12RUMxSbjDhl6a4K2rqujYLMCsxGXRG
	1zJGdY7fIFrcqK9S3A+15wWXX/sQSqGuigOdjehXoId1vIAcUHffAPoLupxrJ1ssYjcij39q/yhNm
	lTyGz4tq+43kDomS2lNoo/St1JVgC0HTp6mwEGMMRI9z0HxnynIf1px6rwiTFviiKou6BxJX2w9cW
	/ySbRa/dneqiRgUd1r9Drbf4CbugsrqOomBmvUeVh0EsKetcctcCrnP2/+3THqGwE7ml2NcNJp/K5
	xi2nG45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ddc-00C45n-2n;
	Wed, 24 May 2023 01:50:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cgX-00Bwav-36
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 00:49:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a516fb6523so2859285ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 17:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684889341; x=1687481341;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8Q5fkMlc8by1KD06IeJCEUWvcQpGPxJr1LDoSieL3c=;
        b=jdZu5vla5Uo2tOVGR8Asn7q4X5WTXomqzaOebqQ75ZPg+ssH7vMffZ6PEhyxIz1C3Q
         Rfk9hNWbw8peUbG38Mog307milNRPMsGuQqL3Ub+xnNE0u8H5/XJXZimy4JFtOq2GZ+m
         a3xGAyd/ByUMDGQ/sX9ScJgHrKmzGEeymBTa5Pe6zw7+YOQWPsPxyrIYDyTUOwt65IBB
         HsLBPZsxMvxHCiFQnbGaWm1lZ/56D6SrNHLKOwXTSYPMqOnBo81U/LBqGlQ13QOeZeuZ
         ++sbcujNISe0nVvF8xshsGIqXVXDjEOmqNc1yz6e/T2Dmi1itqcdCz8peSjjUhANcA5K
         pj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684889341; x=1687481341;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8Q5fkMlc8by1KD06IeJCEUWvcQpGPxJr1LDoSieL3c=;
        b=OlzotWtNTcpOT14XQjRytfTdnLG4AmqJEsRbwtjxqueUQHVS9tjtZ3pcHVcetJJ/1X
         Nuhw/H1uXl+tVydpJizsEDp8BKwZxLGrFTaOWKPK+DtEZyPn4GIiFODagFanjYJVbws4
         LLngoxEVg6BM+Tq/Uk7mmd/NGwMRc+9UI5OCI4ITcG/PZWkt3hTvLnrv41LvOULYdJOF
         +Y/XKkgfoDL+FeWWrHK2N1kzA3jjgErmwh1SpRth6oIAb5uW1ELyai4m+dWxJVpi/SDb
         YaAV9NPKZL5zv2x2sFZC6a9eywTBbIuLB7tq4rxSuVnDGVNZju1wmcSxPQxp3Q1LALuF
         rXbQ==
X-Gm-Message-State: AC+VfDzRveXSrY813CbR36MhpSGzCjWMrdCgTB4E2gNGyJG5UjlTHGy7
	RPbt4LDi3k3VIQFqRyBzAxwuDsJGsMSf9ZJMtaE=
X-Google-Smtp-Source: ACHHUZ6Nd4bmihlt6wCOZDvRQj8f70TyLJ4oD3F6CpGsBs1OFkQEoAdWm2PYlWgcTqINU/EchycIZQ==
X-Received: by 2002:a17:903:41cf:b0:1ae:2e0e:dfcf with SMTP id u15-20020a17090341cf00b001ae2e0edfcfmr16923403ple.2.1684889340781;
        Tue, 23 May 2023 17:49:00 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902b28200b0019ee045a2b3sm7328709plr.308.2023.05.23.17.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:49:00 -0700 (PDT)
Date: Tue, 23 May 2023 17:49:00 -0700 (PDT)
X-Google-Original-Date: Tue, 23 May 2023 17:26:55 PDT (-0700)
Subject: Re: [PATCH -next v20 09/26] riscv: Introduce struct/helpers to save/restore per-task Vector state
In-Reply-To: <20230518161949.11203-10-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu, guoren@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-ea968659-052d-429b-861e-1f616337f802@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_174901_999072_FA35F068 
X-CRM114-Status: GOOD (  23.66  )
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

T24gVGh1LCAxOCBNYXkgMjAyMyAwOToxOTozMiBQRFQgKC0wNzAwKSwgYW5keS5jaGl1QHNpZml2
ZS5jb20gd3JvdGU6Cj4gRnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNv
bT4KPgo+IEFkZCB2ZWN0b3Igc3RhdGUgY29udGV4dCBzdHJ1Y3QgdG8gYmUgYWRkZWQgbGF0ZXIg
aW4gdGhyZWFkX3N0cnVjdC4gQW5kCj4gcHJlcGFyZSBsb3ctbGV2ZWwgaGVscGVyIGZ1bmN0aW9u
cyB0byBzYXZlL3Jlc3RvcmUgdmVjdG9yIGNvbnRleHRzLgo+Cj4gVGhpcyBpbmNsdWRlIFZlY3Rv
ciBSZWdmaWxlIGFuZCBDU1JzIGhvbGRpbmcgZHluYW1pYyBjb25maWd1cmF0aW9uIHN0YXRlCj4g
KHZzdGFydCwgdmwsIHZ0eXBlLCB2Y3NyKS4gVGhlIFZlYyBSZWdpc3RlciB3aWR0aCBjb3VsZCBi
ZSBpbXBsZW1lbnRhdGlvbgo+IGRlZmluZWQsIGJ1dCBzYW1lIGZvciBhbGwgcHJvY2Vzc2VzLCBz
byB0aGF0IGlzIHNhdmVkIHNlcGFyYXRlbHkuCj4KPiBUaGlzIGlzIG5vdCB5ZXQgd2lyZWQgaW50
byBmaW5hbCB0aHJlYWRfc3RydWN0IC0gd2lsbCBiZSBkb25lIHdoZW4KPiBfX3N3aXRjaF90byBh
Y3R1YWxseSBzdGFydHMgZG9pbmcgdGhpcyBpbiBsYXRlciBwYXRjaGVzLgo+Cj4gR2l2ZW4gdGhl
IHZhcmlhYmxlIChhbmQgcG90ZW50aWFsbHkgbGFyZ2UpIHNpemUgb2YgcmVnZmlsZSwgdGhleSBh
cmUKPiBzYXZlZCBpbiBkeW5hbWljYWxseSBhbGxvY2F0ZWQgbWVtb3J5LCBwb2ludGVkIHRvIGJ5
IGRhdGFwIHBvaW50ZXIgaW4KPiBfX3Jpc2N2X3ZfZXh0X3N0YXRlLgo+Cj4gQ28tZGV2ZWxvcGVk
LWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVs
bC5ldT4KPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5l
dT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICAgIHwgOTUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
cHRyYWNlLmggfCAxNyArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBpbmRleCBkZjNiNWNhZWNjODcuLjNjMjlmNGVi
NTUyYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+IEBAIC0xMSw4ICsxMSwxMCBAQAo+
Cj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1YKPgo+ICsjaW5jbHVkZSA8bGludXgvc3RyaW5n
aWZ5Lmg+Cj4gICNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9jc3IuaD4K
PiArI2luY2x1ZGUgPGFzbS9hc20uaD4KPgo+ICBleHRlcm4gdW5zaWduZWQgbG9uZyByaXNjdl92
X3ZzaXplOwo+ICBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2b2lkKTsKPiBAQCAtMjIsNiArMjQs
MjYgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc192ZWN0b3Iodm9pZCkKPiAgCXJl
dHVybiByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfdik7Cj4gIH0K
Pgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiArewo+ICsJcmVncy0+c3RhdHVzID0gKHJlZ3MtPnN0YXR1cyAmIH5TUl9W
UykgfCBTUl9WU19DTEVBTjsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3Zf
dnN0YXRlX29mZihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJcmVncy0+c3RhdHVzID0g
KHJlZ3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9WU19PRkY7Cj4gK30KPiArCj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9vbihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+
ICsJcmVncy0+c3RhdHVzID0gKHJlZ3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9WU19JTklUSUFM
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfcXVlcnkoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4gK3sKPiArCXJldHVybiAocmVncy0+c3RhdHVzICYgU1JfVlMp
ICE9IDA7Cj4gK30KPiArCj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCByaXNjdl92X2Vu
YWJsZSh2b2lkKQo+ICB7Cj4gIAljc3Jfc2V0KENTUl9TU1RBVFVTLCBTUl9WUyk7Cj4gQEAgLTMy
LDEzICs1NCw4NiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgcmlzY3Zfdl9kaXNhYmxl
KHZvaWQpCj4gIAljc3JfY2xlYXIoQ1NSX1NTVEFUVVMsIFNSX1ZTKTsKPiAgfQo+Cj4gK3N0YXRp
YyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9jc3Jfc2F2ZShzdHJ1Y3QgX19yaXNjdl92
X2V4dF9zdGF0ZSAqZGVzdCkKPiArewo+ICsJYXNtIHZvbGF0aWxlICgKPiArCQkiY3NycgklMCwg
IiBfX3N0cmluZ2lmeShDU1JfVlNUQVJUKSAiXG5cdCIKPiArCQkiY3NycgklMSwgIiBfX3N0cmlu
Z2lmeShDU1JfVlRZUEUpICJcblx0Igo+ICsJCSJjc3JyCSUyLCAiIF9fc3RyaW5naWZ5KENTUl9W
TCkgIlxuXHQiCj4gKwkJImNzcnIJJTMsICIgX19zdHJpbmdpZnkoQ1NSX1ZDU1IpICJcblx0Igo+
ICsJCTogIj1yIiAoZGVzdC0+dnN0YXJ0KSwgIj1yIiAoZGVzdC0+dnR5cGUpLCAiPXIiIChkZXN0
LT52bCksCj4gKwkJICAiPXIiIChkZXN0LT52Y3NyKSA6IDopOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQgX192c3RhdGVfY3NyX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zf
dl9leHRfc3RhdGUgKnNyYykKPiArewo+ICsJYXNtIHZvbGF0aWxlICgKPiArCQkiLm9wdGlvbiBw
dXNoXG5cdCIKPiArCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCj4gKwkJInZzZXR2bAkgeDAsICUy
LCAlMVxuXHQiCj4gKwkJIi5vcHRpb24gcG9wXG5cdCIKPiArCQkiY3NydwkiIF9fc3RyaW5naWZ5
KENTUl9WU1RBUlQpICIsICUwXG5cdCIKPiArCQkiY3NydwkiIF9fc3RyaW5naWZ5KENTUl9WQ1NS
KSAiLCAlM1xuXHQiCj4gKwkJOiA6ICJyIiAoc3JjLT52c3RhcnQpLCAiciIgKHNyYy0+dnR5cGUp
LCAiciIgKHNyYy0+dmwpLAo+ICsJCSAgICAiciIgKHNyYy0+dmNzcikgOik7Cj4gK30KPiArCj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IF9fcmlzY3Zf
dl9leHRfc3RhdGUgKnNhdmVfdG8sCj4gKwkJCQkJIHZvaWQgKmRhdGFwKQo+ICt7Cj4gKwl1bnNp
Z25lZCBsb25nIHZsOwo+ICsKPiArCXJpc2N2X3ZfZW5hYmxlKCk7Cj4gKwlfX3ZzdGF0ZV9jc3Jf
c2F2ZShzYXZlX3RvKTsKPiArCWFzbSB2b2xhdGlsZSAoCj4gKwkJIi5vcHRpb24gcHVzaFxuXHQi
Cj4gKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+ICsJCSJ2c2V0dmxpCSUwLCB4MCwgZTgsIG04
LCB0YSwgbWFcblx0Igo+ICsJCSJ2c2U4LnYJCXYwLCAoJTEpXG5cdCIKPiArCQkiYWRkCQklMSwg
JTEsICUwXG5cdCIKPiArCQkidnNlOC52CQl2OCwgKCUxKVxuXHQiCj4gKwkJImFkZAkJJTEsICUx
LCAlMFxuXHQiCj4gKwkJInZzZTgudgkJdjE2LCAoJTEpXG5cdCIKPiArCQkiYWRkCQklMSwgJTEs
ICUwXG5cdCIKPiArCQkidnNlOC52CQl2MjQsICglMSlcblx0Igo+ICsJCSIub3B0aW9uIHBvcFxu
XHQiCj4gKwkJOiAiPSZyIiAodmwpIDogInIiIChkYXRhcCkgOiAibWVtb3J5Iik7Cj4gKwlyaXNj
dl92X2Rpc2FibGUoKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92
c3RhdGVfcmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqcmVzdG9yZV9mcm9tLAo+
ICsJCQkJCSAgICB2b2lkICpkYXRhcCkKPiArewo+ICsJdW5zaWduZWQgbG9uZyB2bDsKPiArCj4g
KwlyaXNjdl92X2VuYWJsZSgpOwo+ICsJYXNtIHZvbGF0aWxlICgKPiArCQkiLm9wdGlvbiBwdXNo
XG5cdCIKPiArCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCj4gKwkJInZzZXR2bGkJJTAsIHgwLCBl
OCwgbTgsIHRhLCBtYVxuXHQiCj4gKwkJInZsZTgudgkJdjAsICglMSlcblx0Igo+ICsJCSJhZGQJ
CSUxLCAlMSwgJTBcblx0Igo+ICsJCSJ2bGU4LnYJCXY4LCAoJTEpXG5cdCIKPiArCQkiYWRkCQkl
MSwgJTEsICUwXG5cdCIKPiArCQkidmxlOC52CQl2MTYsICglMSlcblx0Igo+ICsJCSJhZGQJCSUx
LCAlMSwgJTBcblx0Igo+ICsJCSJ2bGU4LnYJCXYyNCwgKCUxKVxuXHQiCj4gKwkJIi5vcHRpb24g
cG9wXG5cdCIKPiArCQk6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiKTsKPiAr
CV9fdnN0YXRlX2Nzcl9yZXN0b3JlKHJlc3RvcmVfZnJvbSk7Cj4gKwlyaXNjdl92X2Rpc2FibGUo
KTsKPiArfQo+ICsKPiAgI2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNBX1YgICovCj4KPiAgc3Ry
dWN0IHB0X3JlZ3M7Cj4KPiAgc3RhdGljIGlubGluZSBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2
b2lkKSB7IHJldHVybiAtRU9QTk9UU1VQUDsgfQo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJv
b2wgaGFzX3ZlY3Rvcih2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+ICtzdGF0aWMgaW5saW5lIGJv
b2wgcmlzY3Zfdl92c3RhdGVfcXVlcnkoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpIHsgcmV0dXJuIGZh
bHNlOyB9Cj4gICNkZWZpbmUgcmlzY3Zfdl92c2l6ZSAoMCkKPiArI2RlZmluZSByaXNjdl92X3Zz
dGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHJpc2N2X3ZfdnN0YXRl
X29uKHJlZ3MpCQkJZG8ge30gd2hpbGUgKDApCj4KPiAgI2VuZGlmIC8qIENPTkZJR19SSVNDVl9J
U0FfViAqLwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJh
Y2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaAo+IGluZGV4IDg4MjU0
N2Y2YmQ1Yy4uNTg2Nzg2ZDAyM2M0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9wdHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJh
Y2UuaAo+IEBAIC03Nyw2ICs3NywyMyBAQCB1bmlvbiBfX3Jpc2N2X2ZwX3N0YXRlIHsKPiAgCXN0
cnVjdCBfX3Jpc2N2X3FfZXh0X3N0YXRlIHE7Cj4gIH07Cj4KPiArc3RydWN0IF9fcmlzY3Zfdl9l
eHRfc3RhdGUgewo+ICsJdW5zaWduZWQgbG9uZyB2c3RhcnQ7Cj4gKwl1bnNpZ25lZCBsb25nIHZs
Owo+ICsJdW5zaWduZWQgbG9uZyB2dHlwZTsKPiArCXVuc2lnbmVkIGxvbmcgdmNzcjsKPiArCXZv
aWQgKmRhdGFwOwo+ICsJLyoKPiArCSAqIEluIHNpZ25hbCBoYW5kbGVyLCBkYXRhcCB3aWxsIGJl
IHNldCBhIGNvcnJlY3QgdXNlciBzdGFjayBvZmZzZXQKPiArCSAqIGFuZCB2ZWN0b3IgcmVnaXN0
ZXJzIHdpbGwgYmUgY29waWVkIHRvIHRoZSBhZGRyZXNzIG9mIGRhdGFwCj4gKwkgKiBwb2ludGVy
Lgo+ICsJICoKPiArCSAqIEluIHB0cmFjZSBzeXNjYWxsLCBkYXRhcCB3aWxsIGJlIHNldCB0byB6
ZXJvIGFuZCB0aGUgdmVjdG9yCj4gKwkgKiByZWdpc3RlcnMgd2lsbCBiZSBjb3BpZWQgdG8gdGhl
IGFkZHJlc3MgcmlnaHQgYWZ0ZXIgdGhpcwo+ICsJICogc3RydWN0dXJlLgo+ICsJICovCj4gK307
Cj4gKwo+ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCj4KPiAgI2VuZGlmIC8qIF9VQVBJX0FT
TV9SSVNDVl9QVFJBQ0VfSCAqLwoKUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
