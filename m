Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880CECE79CE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OW+Rx5oUSRUMZzBxhpv0bhqM6DjEQ2pKyCzN1MEXbTs=; b=tRpNoYfN0sMvmf
	a2RzPHrkeR0PHIRAhSPOBycZXlwF6FhwAgTLphJR7U9oGs5XwzLZVwpPb2ygQNjJWZ6YNiLGq4LqF
	101jW8++D9eV0BiOCB6E/ZAGBLUNJpoKFVHY23WzAOtBGrlNmGg46ASx6qSMviCS28H6PHSluBD+t
	1UPkPK2xxkZpGqcT7bQx3ILtmg/j4Vza+mWqc+TuXGPvpPgXthw7dh8X13fTtKU/gZPYQRsl4FTOa
	sTDvxz7I/Cks9hiOz10ufZIwOcULmFdtcwGiAh0dK4xtTHX1alDL4Z7s7RoJglTXCvYO3nAORNWlN
	6RP565PmVjcH8412q3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixaa-003E1h-2s;
	Wed, 20 Sep 2023 13:50:00 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixaX-003E0C-2B
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:49:59 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-27499bb759cso3838195a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695217794; x=1695822594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyKrFqZ6pe873R1m/St9homGtI5DVB4Bs4vDfySSmyA=;
        b=HjyvvOCgHjTb4E9fyv9sgS9RTwM421TQkkSkuuqkPtrJzsoam/1dDyLhCCnr12408O
         D1+uUwL9yyzM6v/xW38g4Qzjz/lQvY4MUF/+rgq7rRr7PLr0/VPW1HxoT705hyEqAznc
         DMx0y2QRn2bZ/9n103rNsRdt19CRk1NPaJMwZXq69r1AmWFboGCsipf6OBIAOU/O7Kn6
         iCH8j71KvbwXKKzn0I6S44rgeLSFEjjqnvPDLvLGD95drZSMR7nxdIRR/dwykWekbGWA
         1a+rLvcB2Idj+oeA8t5HaM/W8Ro+aEzXPWNV9qfWAnUZyjwt8y0yF3cbSUFReIxyDl0i
         YTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695217794; x=1695822594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyKrFqZ6pe873R1m/St9homGtI5DVB4Bs4vDfySSmyA=;
        b=rqWLFHRwzCACF53d+sqtotwjZT0dEMuYV8ETCRFYW0pzs03/5Pn1QkDEvBoi2BwcD6
         eqUsVarpnStT0My/fKL6iBUZuzobCfRboOd/8q+VS+61uPLSedQbIyrHWddJnJRkyFBE
         Oc4smg8IjKoxwA7wi19D1kCS3KaXYWD2xaZrLBakzwR0gMEVxRgwEUVQVGjrGIyGNTbH
         bvduRtxF5AY/vTIZ8kY+bxpm+hgat5ipH2l05xhiMybAA4g173O02ZhC+Z+RmykDpwSg
         wMooV73p+NJb8aH2ta2G8SHemQjNavxuk3IF7rv+zfMn27SgpLMOJXLKjlGVBDFztXKc
         Ljbg==
X-Gm-Message-State: AOJu0Yx6YFhuMbUuQbgPpujI7Erxvv1pYuc+EgpoqRsmnEp7a78+iYHN
	e2qJWTTu0DaQY272L/7165LIIv9rPBUt82BQrVc9qA==
X-Google-Smtp-Source: AGHT+IGgvZvXWV6O+m42o/WLo0Z7TC1OAA74vrGK11yPNbc2oxi+bWkJM6MYqS+QjE0clefOThdvmutuQ8u628EY1RM=
X-Received: by 2002:a17:90a:7c01:b0:274:b4ce:7049 with SMTP id
 v1-20020a17090a7c0100b00274b4ce7049mr2566829pjf.34.1695217793948; Wed, 20 Sep
 2023 06:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com> <20230920-d524c40b616536d0ad8213c3@orel>
In-Reply-To: <20230920-d524c40b616536d0ad8213c3@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Sep 2023 19:19:42 +0530
Message-ID: <CAK9=C2V-9s1ErSCLcaPwNTrGAWTP69vVmAV0kSsuRn841aofhg@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA registers
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_064957_878374_F9EFBFED 
X-CRM114-Status: GOOD (  30.21  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMTA6NTTigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDExOjM2
OjQ2UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBDdXJyZW50bHkgdGhlIEFJQSBPTkVf
UkVHIHJlZ2lzdGVycyBhcmUgcmVwb3J0ZWQgYnkgZ2V0LXJlZy1saXN0Cj4gPiBhcyBuZXcgcmVn
aXN0ZXJzIGZvciB2YXJpb3VzIHZjcHVfcmVnX2xpc3QgY29uZmlncyB3aGVuZXZlciBTc2FpYQo+
ID4gaXMgYXZhaWxhYmxlIG9uIHRoZSBob3N0IGJlY2F1c2UgU3NhaWEgZXh0ZW5zaW9uIGNhbiBv
bmx5IGJlCj4gPiBkaXNhYmxlZCBieSBTbXN0YXRlZW4gZXh0ZW5zaW9uIHdoaWNoIGlzIG5vdCBh
bHdheXMgYXZhaWxhYmxlLgo+ID4KPiA+IFRvIHRhY2tsZSB0aGlzLCB3ZSBzaG91bGQgZmlsdGVy
LW91dCBBSUEgT05FX1JFRyByZWdpc3RlcnMgb25seQo+ID4gd2hlbiBTc2FpYSBjYW4ndCBiZSBk
aXNhYmxlZCBmb3IgYSBWQ1BVLgo+ID4KPiA+IEZpeGVzOiA0NzcwNjkzOThlZDYgKCJLVk06IHJp
c2N2OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVnLWxpc3QgdGVzdCIpCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9z
ZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8IDIzICsrKysrKysrKysr
KysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jp
c2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dl
dC1yZWctbGlzdC5jCj4gPiBpbmRleCA3NmMwYWQxMWU0MjMuLjg1OTA3Yzg2YjgzNSAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3Qu
Ywo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jCj4gPiBAQCAtMTIsNiArMTIsOCBAQAo+ID4KPiA+ICAjZGVmaW5lIFJFR19NQVNLIChLVk1f
UkVHX0FSQ0hfTUFTSyB8IEtWTV9SRUdfU0laRV9NQVNLKQo+ID4KPiA+ICtzdGF0aWMgYm9vbCBp
c2FfZXh0X2NhbnRfZGlzYWJsZVtLVk1fUklTQ1ZfSVNBX0VYVF9NQVhdOwo+ID4gKwo+ID4gIGJv
b2wgZmlsdGVyX3JlZyhfX3U2NCByZWcpCj4gPiAgewo+ID4gICAgICAgc3dpdGNoIChyZWcgJiB+
UkVHX01BU0spIHsKPiA+IEBAIC00OCw2ICs1MCwxNSBAQCBib29sIGZpbHRlcl9yZWcoX191NjQg
cmVnKQo+ID4gICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9aSUZFTkNFSToKPiA+ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZN
X1JJU0NWX0lTQV9FWFRfWklIUE06Cj4gPiAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4g
KyAgICAgLyogQUlBIHJlZ2lzdGVycyBhcmUgYWx3YXlzIGF2YWlsYWJsZSB3aGVuIFNzYWlhIGNh
bid0IGJlIGRpc2FibGVkICovCj4gPiArICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZN
X1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhzaXNlbGVjdCk6
Cj4gPiArICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlB
IHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzEpOgo+ID4gKyAgICAgY2FzZSBLVk1f
UkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NS
X0FJQV9SRUcoaXByaW8yKToKPiA+ICsgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1f
UkVHX1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKHNpZWgpOgo+ID4g
KyAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQSB8IEtW
TV9SRUdfUklTQ1ZfQ1NSX0FJQV9SRUcoc2lwaCk6Cj4gPiArICAgICBjYXNlIEtWTV9SRUdfUklT
Q1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JF
RyhpcHJpbzFoKToKPiA+ICsgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJ
U0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlwcmlvMmgpOgo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gaXNhX2V4dF9jYW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRf
U1NBSUFdID8gdHJ1ZSA6IGZhbHNlOwo+Cj4gTm8gbmVlZCBmb3IgdGhlICc/IHRydWUgOiBmYWxz
ZScKCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiAgICAgICBkZWZhdWx0Ogo+ID4gICAgICAg
ICAgICAgICBicmVhazsKPiA+ICAgICAgIH0KPiA+IEBAIC03MSwxNCArODIsMjIgQEAgc3RhdGlj
IGlubGluZSBib29sIHZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBleHQp
Cj4gPgo+ID4gIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gIHsKPiA+ICsgICAgIGludCByYzsKPiA+ICAgICAgIHN0
cnVjdCB2Y3B1X3JlZ19zdWJsaXN0ICpzOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBpc2FfZXh0
X3N0YXRlW0tWTV9SSVNDVl9JU0FfRVhUX01BWF0gPSB7IDAgfTsKPgo+IG5pdDogSSB0aGluayB3
ZSBwcmVmZXIgcmV2ZXJzZSB4bWFzIHRyZWUgaW4ga3NlbGZ0ZXN0cywgYnV0IHdoYXRldmVyLgoK
T2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsKPiA+ICsgICAgIGZvciAoaW50IGkgPSAwOyBp
IDwgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYOyBpKyspCj4gPiArICAgICAgICAgICAgIF9fdmNwdV9n
ZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGkpLCAmaXNhX2V4dF9zdGF0ZVtpXSk7Cj4g
Pgo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIERpc2FibGUgYWxsIGV4dGVuc2lvbnMgd2hpY2gg
d2VyZSBlbmFibGVkIGJ5IGRlZmF1bHQKPiA+ICAgICAgICAqIGlmIHRoZXkgd2VyZSBhdmFpbGFi
bGUgaW4gdGhlIHJpc2MtdiBob3N0Lgo+ID4gICAgICAgICovCj4gPiAtICAgICBmb3IgKGludCBp
ID0gMDsgaSA8IEtWTV9SSVNDVl9JU0FfRVhUX01BWDsgaSsrKQo+ID4gLSAgICAgICAgICAgICBf
X3ZjcHVfc2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhUX1JFRyhpKSwgMCk7Cj4gPiArICAgICBm
b3IgKGludCBpID0gMDsgaSA8IEtWTV9SSVNDVl9JU0FfRVhUX01BWDsgaSsrKSB7Cj4gPiArICAg
ICAgICAgICAgIHJjID0gX192Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoaSks
IDApOwo+ID4gKyAgICAgICAgICAgICBpZiAocmMgJiYgaXNhX2V4dF9zdGF0ZVtpXSkKPgo+IEhv
dyBoZWxwZnVsIGlzIGl0IHRvIGNoZWNrIHRoYXQgaXNhX2V4dF9zdGF0ZVtpXSBpc24ndCB6ZXJv
PyBUaGUgdmFsdWUgb2YKPiB0aGUgcmVnaXN0ZXIgY291bGQgYmUgemVybywgcmlnaHQ/IFNob3Vs
ZG4ndCB3ZSBpbnN0ZWFkIGNhcHR1cmUgdGhlIHJldHVybgo+IHZhbHVlcyBmcm9tIF9fdmNwdV9n
ZXRfcmVnIGFuZCBpZiB0aGUgcmV0dXJuIHZhbHVlIGlzIHplcm8gZm9yIGEgZ2V0LAo+IGJ1dCBu
b256ZXJvIGZvciBhIHNldCwgdGhlbiB3ZSBrbm93IHdlIGhhdmUgaXQsIGJ1dCBjYW4ndCBkaXNh
YmxlIGl0LgoKVGhlIGludGVudCBpcyB0byBmaW5kLW91dCB0aGUgSVNBX0VYVCByZWdpc3RlcnMg
d2hpY2ggYXJlIGVuYWJsZWQgYnV0CndlIGFyZSBub3QgYWJsZSB0byBkaXNhYmxlIGl0LgoKPgo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGlzYV9leHRfY2FudF9kaXNhYmxlW2ldID0gdHJ1ZTsK
PiA+ICsgICAgIH0KPiA+Cj4gPiAgICAgICBmb3JfZWFjaF9zdWJsaXN0KGMsIHMpIHsKPiA+ICAg
ICAgICAgICAgICAgaWYgKCFzLT5mZWF0dXJlKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+IFRo
YW5rcywKPiBkcmV3CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
