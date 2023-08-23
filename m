Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C66EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVBKk5WNXPNcdc1yj8g/aS6f3rkoF7SOm3F+1rUgXn0=; b=M8g7jaZqevCOlp
	FXkIVAeAE8ZRaHSaokrp+O+qTFSx13II5zIllFFOS0Dgd+0n36prS+yjKYQO0b3cFyghMnRMWvecg
	eJaWO0G9Imbl1ozmsN2IzD3N//VidW80Ym/pL1Zgj03eCs7CihmnN5twQc9Fx0vIu4yaeI9Ces+F1
	O/VNkuYkIT+9XgslzYOI8jul4LjgBcCuMxhquUtLFOb51dwPnc0/3vO8fSKyrhZKvAQxK2aow4AJl
	khGAqmm7/jErx6r/+9UUYuGSJvEosERpGLhzjlpYCDQzOPcdFaQLi/4o5NIDFGgk80VbqW8JVgeBR
	kRp2HK4NZYUo73EpVMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoA8-000m80-1N;
	Wed, 23 Aug 2023 13:44:44 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoA4-000m3l-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 13:44:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9cdba1228so88535871fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Aug 2023 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1692798275; x=1693403075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT2iBOeL5h1q2WVSaBUi8FulDxb7Lm+Rc+MDAqNSZHM=;
        b=dGAB5gqdg38JGt2SocHgpypW9Un3nHzGi/tEbT6fWdoyfXsO4SjP2XrbQb9nlWoUFz
         nbOA6cqL6cDtX1mR3tqlKyL9e28O7XH/1pU30CinjFlr3BUUzQitpS+bOOyxHTRjJA6Z
         /Hqmred3IASuQdo9U3+ckYaryADriMlJhlXRJGjX4Pt8vdVSVXRsl7Z+Hful7mTntAGK
         MbI/GWLPL33ERwbgZmEOoqsWeQxMZ3OFOkfr2dyqDka0Dqv6XPKnQCKq3qPJ6Mj7gJ84
         kgmRasN9hbEGPeVgqlzI+Rl1wzGA68tCdLEQ1GFyrZ2oJYZZV3jjcLAdsraVwoc0TBhn
         hKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692798275; x=1693403075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT2iBOeL5h1q2WVSaBUi8FulDxb7Lm+Rc+MDAqNSZHM=;
        b=NDZv8c3aoJnuvmB+EWWuMdiPo16+vQqd71IAlFMgz90liPnkZC8mXJkBiTD1ikjW8y
         Nw/QSF871xq7wnIthyDEIumR+6DJPdDo1XT1CluupE92MkKf5E6tNjvK2rkOu/yC/oNi
         Zce3k7b9dxQ6/qAsaZZhK1AtSRYFPHMCo2gFtOWCwpLT0xJooksPoyLfD6dFknBy6xim
         3iedGQwW3DKq4mpgpBMLITRKlHBSo6NDWMcqX011HbsHOramacrtYf6IYpSmSFAzuf5O
         ZThu809ZWKQwvpYuZ5vYK/6tSKcpOw8zHc+2mkx8Eau2LQIddteKL32ispihtsmJBguu
         Znhg==
X-Gm-Message-State: AOJu0YxNGpTeLirooBVjwl2ppsOH6AAgwRwq8g6CpPFC35LsgtNOYy7+
	pyQRBoCU3CzUBE6Grmu7WdSsC5O2OlwVOaBGoTGt4w==
X-Google-Smtp-Source: AGHT+IGkQFEDVaVffpkjs7q6/oHyZZWs4lXgUmMhJjGl1l33UdxCtWw2jgpwpw6f9mj/5ZgEHapfwZrBFt8DsT7fprY=
X-Received: by 2002:a05:651c:1208:b0:2bb:a111:e2c6 with SMTP id
 i8-20020a05651c120800b002bba111e2c6mr9865798lja.42.1692798274897; Wed, 23 Aug
 2023 06:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230822054739.33552-1-nick.hu@sifive.com> <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
 <CAKddAkDohdZqhjZKSawTg5NLMs0AXkL9SyYQr1q6vM1vm4Csfw@mail.gmail.com>
 <CAAhSdy0Yt-xcDYWz9BJCUgErpC2xM97yMXw4Wto078DKNk1nUg@mail.gmail.com> <CAKddAkBqUAwhftCiyoF3=tFM9cGTOnkYzeO=Cvsm3L7HAhiTMQ@mail.gmail.com>
In-Reply-To: <CAKddAkBqUAwhftCiyoF3=tFM9cGTOnkYzeO=Cvsm3L7HAhiTMQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Aug 2023 19:14:23 +0530
Message-ID: <CAAhSdy3+0dReF9mj2aLo725Yc6co3sKNjjRw2QUCe0K_iWipFQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
To: Nick Hu <nick.hu@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Andy Chiu <andy.chiu@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_064441_011403_95E65365 
X-CRM114-Status: GOOD (  40.03  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgODozOOKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwCj4KPiBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2tzCj4g
T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgNToxN+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDE6MjjigK9Q
TSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBBbnVw
Cj4gPiA+Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDI6MTbigK9QTSBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFR1
ZSwgQXVnIDIyLCAyMDIzIGF0IDExOjE34oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUuY29t
PiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJZiBhIHRhc2sgaXMgdGhlIG9uZSB3aG8gcGVy
Zm9ybXMgdGhlIHN1c3BlbmQgZmxvdyBhbmQgaXQgYWxzbyBkbyBzb21lCj4gPiA+ID4gPiBmbG9h
dGluZyBvciB2ZWN0b3Igb3BlcmF0aW9ucyBiZWZvcmUgdGhlIHN1c3BlbmQsIHdlIG1pZ2h0IGxv
c2UgdGhlIEZQVQo+ID4gPiA+ID4gYW5kIHZlY3RvciBzdGF0ZXMgd2hlbiBpdCBnb2VzIHRvIHRo
ZSBub24tcmV0ZW50aW9uIHN5c3RlbSBzdXNwZW5kIHN0YXRlLgo+ID4gPiA+ID4gQWRkIHN5c2Nv
cmUgb3BzIHRvIHNhdmUgYW5kIHJlc3RvcmUgdGhlIEZQVSBhbmQgdmVjdG9yIHN0YXRlcyBvZiB0
aGUKPiA+ID4gPiA+IGN1cnJlbnQgdGFzayB0byBmaXggdGhlIGlzc3VlIGFib3ZlLgo+ID4gPiA+
Cj4gPiA+ID4gVGhpcyBvbmx5IGFwcGxpZXMgdG8gbm9uLXJldGVudGl2ZSBzeXN0ZW0gc3VzcGVu
ZCBzbyB3aHkgZG8gd2UgbmVlZAo+ID4gPiA+IHRoaXMgYmVmb3JlIFNCSSBzeXN0ZW0gc3VzcGVu
ZCBpcyBtZXJnZWQgPwo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBBbnVwCj4gPiA+
ID4KPiA+ID4gPgo+ID4gPiBIb3cgYWJvdXQgaGliZXJuYXRpb24/Cj4gPgo+ID4gSWYgdGhpcyBp
cyBmb3IgaGliZXJuYXRpb24gdGhlbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIHNob3VsZCBzYXkg
c28uCj4gPgo+IEFjdHVhbGx5IHRoaXMgY29tbWl0IGlzIGZvciB0aGUgc3VzcGVuZC10by1yYW0u
IEkgYXNrIGFib3V0Cj4gaGliZXJuYXRpb24gaGVyZSBiZWNhdXNlIEkgdGhpbmsgaGliZXJuYXRp
b24gbWF5IGFsc28gaGF2ZSB0aGUgc2FtZQo+IGlzc3VlIHRvby4KPiBJZiBoaWJlcm5hdGlvbiBk
b2Vzbid0IG5lZWQgaXQsIEkgY2FuIGRlZmVyIHRoaXMgcGF0Y2ggdW50aWwgd2UgaGF2ZQo+IHN5
c3RlbSBzdXNwZW5kLgo+IEkgc2VuZCB0aGlzIHBhdGNoIGJlY2F1c2UgSSBiZWxpZXZlIHdlIHdp
bGwgc3VwcG9ydCBzeXN0ZW0gc3VzcGVuZCBpbgo+IHRoZSBrZXJuZWwgc29vbiBvciBsYXRlciBh
bmQgdGhlIGhpYmVybmF0aW9uIG1pZ2h0IG5lZWQgaXQgbm93LgoKT2theSwgdW5kZXJzdG9vZC4K
Cj4KPiA+IEFkZGluZyBzeXNjb3JlX29wcyB3b3VsZCBtZWFuIHRoZXNlIGNhbGxiYWNrcyB3aWxs
IGJlIGNhbGxlZCBmb3IKPiA+IGJvdGggc3VzcGVuZC10by1yYW0gYW5kIGhpYmVybmF0ZSBjYXNl
cy4gT3RoZXIgYXJjaGl0ZWN0dXJlcyBkb24ndAo+ID4gaGF2ZSB0aGlzIHNhdmUvcmVzdG9yZSBm
b3Igc3VzcGVuZC10by1yYW0gYmVjYXVzZSBpdCBpcyBnZW5lcmFsbHkKPiA+IGNhbGxlZCBmcm9t
IGlkbGUgdGFzay4KPiA+Cj4gRG8geW91IHRoaW5rIHdlIGRvbid0IGhhdmUgdG8gY29uc2lkZXIg
dGhlIGNhc2UgaW4gdGhlIHBhdGNoPwoKSSB3YXMgY29tcGFyaW5nIG90aGVyIGFyY2hpdGVjdHVy
ZXMgYnV0IEkgZGlkIG5vdCBmaW5kIGFueSBleHBsaWNpdApzYXZpbmcgb2YgRlAgc3RhdGUgZm9y
IHN1c3BlbmQtdG8tcmFtLiBBbHRob3VnaCwgSSBkaWQgZmluZCBleHBsaWNpdApGUCBzYXZlIGZv
ciBoaWJlcm5hdGUuCgpGdW5jdGlvbmFsbHksIGl0IGlzIGZpbmUgdG8gYWx3YXlzIHNhdmUgRlAg
c3RhdGUgZm9yIHN1c3BlbmQtdG8tcmFtCmJ1dCBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIHJlZHVu
ZGFudCB3b3JrIGluIHN1c3BlbmQtdG8tcmFtIHBhdGguCgpSZWdhcmRzLApBbnVwCgo+Cj4gUmVn
YXJkcywKPiBOaWNrCj4gPiBXaHkgbm90IGRvIHRoZSBzYXZlL3Jlc3RvcmUgaW4gc2F2ZV9wcm9j
ZXNzb3Jfc3RhdGUoKSBhbmQKPiA+IHJlc3RvcmVfcHJvY2Vzc29yX3N0YXRlKCkganVzdCBsaWtl
IGFyY2gvbWlwcy9wb3dlci9jcHUuYyA/Cj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPiA+Cj4g
Pgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBOaWNrCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ28t
ZGV2ZWxvcGVkLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+IGEpIEFkZCBDby1kZXZlbG9wZWQt
YnkgYW5kIGFkanVzdCB0aGUgb3JkZXIgb2Ygc2lnbmVkLW9mZgo+ID4gPiA+ID4gYikgUmVwaHJh
c2UgdGhlIGNvbW1pdCBtZXNzYWdlCj4gPiA+ID4gPgo+ID4gPiA+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3N1c3BlbmQuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+ID4gPiA+IGluZGV4IDNjODliOGVjNjljNC4uZmY2OWZm
OGExOTc0IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5j
Cj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+ID4gPiA+IEBA
IC00LDkgKzQsMTQgQEAKPiA+ID4gPiA+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMjIgVmVudGFuYSBN
aWNybyBTeXN0ZW1zIEluYy4KPiA+ID4gPiA+ICAgKi8KPiA+ID4gPiA+Cj4gPiA+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2NwdV9wbS5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9mdHJhY2Uu
aD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvdGhyZWFkX2luZm8uaD4KPiA+ID4gPiA+ICsj
aW5jbHVkZSA8bGludXgvc3lzY29yZV9vcHMuaD4KPiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL2Nz
ci5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxhc20vc3VzcGVuZC5oPgo+ID4gPiA+ID4gKyNpbmNs
dWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiAgdm9pZCBzdXNwZW5kX3NhdmVfY3NycyhzdHJ1Y3Qgc3VzcGVu
ZF9jb250ZXh0ICpjb250ZXh0KQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+IEBAIC04NSwzICs5MCw0
MyBAQCBpbnQgY3B1X3N1c3BlbmQodW5zaWduZWQgbG9uZyBhcmcsCj4gPiA+ID4gPgo+ID4gPiA+
ID4gICAgICAgICByZXR1cm4gcmM7Cj4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
K3N0YXRpYyBpbnQgcmlzY3ZfY3B1X3N1c3BlbmQodm9pZCkKPiA+ID4gPiA+ICt7Cj4gPiA+ID4g
PiArICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3VyX3Rhc2sgPSBnZXRfY3VycmVudCgpOwo+
ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IHRhc2tfcHRfcmVncyhjdXJf
dGFzayk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGlmIChoYXNfZnB1KCkpIHsKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkocmVncy0+c3RhdHVzICYgU1JfU0Qp
KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZnN0YXRlX3NhdmUoY3VyX3Rhc2ss
IHJlZ3MpOwo+ID4gPiA+ID4gKyAgICAgICB9Cj4gPiA+ID4gPiArICAgICAgIGlmIChoYXNfdmVj
dG9yKCkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkocmVncy0+c3Rh
dHVzICYgU1JfU0QpKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Zfdl92
c3RhdGVfc2F2ZShjdXJfdGFzaywgcmVncyk7Cj4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiArfQo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X2NwdV9yZXN1bWUodm9pZCkKPiA+ID4gPiA+ICt7
Cj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3VyX3Rhc2sgPSBnZXRfY3Vy
cmVudCgpOwo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IHRhc2tfcHRf
cmVncyhjdXJfdGFzayk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGlmIChoYXNfZnB1
KCkpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgZnN0YXRlX3Jlc3RvcmUoY3VyX3Rhc2ssIHJl
Z3MpOwo+ID4gPiA+ID4gKyAgICAgICBpZiAoaGFzX3ZlY3RvcigpKQo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoY3VyX3Rhc2ssIHJlZ3MpOwo+ID4gPiA+
ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IHN5c2NvcmVfb3BzIHJp
c2N2X2NwdV9zeXNjb3JlX29wcyA9IHsKPiA+ID4gPiA+ICsgICAgICAgLnN1c3BlbmQgICAgICAg
ID0gcmlzY3ZfY3B1X3N1c3BlbmQsCj4gPiA+ID4gPiArICAgICAgIC5yZXN1bWUgICAgICAgICA9
IHJpc2N2X2NwdV9yZXN1bWUsCj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtz
dGF0aWMgaW50IF9faW5pdCByaXNjdl9jcHVfc3VzcGVuZF9pbml0KHZvaWQpCj4gPiA+ID4gPiAr
ewo+ID4gPiA+ID4gKyAgICAgICByZWdpc3Rlcl9zeXNjb3JlX29wcygmcmlzY3ZfY3B1X3N5c2Nv
cmVfb3BzKTsKPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiArfQo+ID4gPiA+
ID4gK2FyY2hfaW5pdGNhbGwocmlzY3ZfY3B1X3N1c3BlbmRfaW5pdCk7Cj4gPiA+ID4gPiAtLQo+
ID4gPiA+ID4gMi4zNC4xCj4gPiA+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
