Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B86CA1010
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5LqEDM3r9Ltlswc1K0BRmZBacY/M/68acf6xE4d0bQ=; b=rtEF5d9aYGN8by
	dT7Gdq7qXm+gjz8Aj5oKvNOyRPnxOyDcoMCsrLgMPy8DWGH+YOTbsTOIErPgJriI08nnb5ufhHchC
	o33YS+Wt4374xXiNph2jjRTJ/0l+k0823JMyhZqtRZnI7yfK9XWO6ux0VOPx29lvO+942QJLJZSlh
	85LS/gf3iDy9mEhghTntQ89/FVBPCfmsCOTpQB1ILDwI0vfg3gS5ZWtOcMr204dKGsFIDz7bmrZwI
	/+uIQPxuDbX1E/3KqZs+sIXIOUWJNuhnCzVeVdJLpnkPWxb+7n75D3hpcs9hL4tSOscVxozQ0yFTW
	gUghviOq6KBg/s5ghYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbT-0000000GaTh-40r7;
	Fri, 05 Sep 2025 03:59:11 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN6j-0000000GRvg-0XlI
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 03:27:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso2606634a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 20:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757042843; x=1757647643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os04syBpjRUYrOuY5Z5ul0OnAt1kwR5e6GPJHPTZohI=;
        b=Qrdbk9u8fklyw5VaAzdtiwUhr/BA2k5SSZh0iQFX4uaSs+QRT/cMEL+gCiaaxeoBhE
         c6bIuBCmYq9Ft8trvF3tVagbAwtKEArTDS8i6VNiVCbQjqeyl2Uz669ES99FruZGidAd
         dN5ERcM4UFaJj+gRgZSG8cYvY2ivhpUYrsOA4TjO9zyYKb5TCSFiO9BUczWFrNATeH3L
         HdLWgQCuQCP2WWJ/qZjjbK2jLmxF5Mz31QDXWrb14zFD6c9KbcePt9gwPxfQF6RUeWB+
         Zx7g9kfzAnDxttIVmA79ZnQiTdJcgs3+23cg2b3ULaVzrRn3F8p0KCHdCwU2q3jeuSG7
         N4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757042843; x=1757647643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os04syBpjRUYrOuY5Z5ul0OnAt1kwR5e6GPJHPTZohI=;
        b=HXibVr8dh57SyI8pxg6g8UwzAAq29DvFXfkUNPlFc60STFwrQeIStikhJYDKMzvUXJ
         ulyO/TGyfjuGQp6IGY8cJgBWQ9kaYHM31ur+onlG/jFFxVQQAuGygMP7TldvkSJ+WSl+
         6jr5dx8rwoCRK+wkDq30I3ciE/8Y0P+KNdF/OQp5mxsHJ4tDsoBk27gTgP9ZME8l9O/N
         uR7EcO2OwwLxYe5IiSkaeBPYMoiiED+r9dKe3E08a01ihBT0DrqySk4SJ3xK+w81F494
         u8u4b6yD19gMu3Pdi7Hfa3AbTH2l16vF9xU90442de2nACiLUBI+WlNgtKCDkCaQBN1L
         h6Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUn1w2FB63BI/nZAjmA9oONYT4uLOI2CpLomaFwYkke2WP60Qos+WuwQikzHxX4AdvqTmjm1VhEteW/GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyE2BWmTl95Hq65ul2LFWSyPSs8ewhbm1UqGyJS+DPgJSF+L8Sl
	/AEM9dkyK+KHa3K1nR+c7d1gz2xyMBD2lBJihBTTroh1PxXQKSEq/mJb48rjrpTer6Z20KDWa2x
	MBTNbZlaQ9cCzPjrlA14hf8jdpPppuidIvy5Jz4di3g==
X-Gm-Gg: ASbGncstJeDf0UrUuQgW+7Pmxas+g1YNykOA5cca+cA9G0F0fd/oHDxp4bUj/ygjajq
	PtwzoYJMoz1MJIQD+l+fhuEovCzLKXz3NVuIw0r3BamzjjB3E5l2QNyMUOhkDz3T8sYRjPAx2NA
	wesXujjfGYCghiPCphH9xK4rXh1nqmTx0FybrYY9Rp3LbugecxbbwYv8jgeCNPv9JtIMmL9FhVi
	8xc2S/neq2DI01QTUTv
X-Google-Smtp-Source: AGHT+IFTBZLssAj4YEI3yGO9zckI6NIStV+ozblxy5fjUOhfU+lQN15HDXjbRdJYZmz9vJUW1Pms6o2MHeVJKPYWHtY=
X-Received: by 2002:a05:6402:5cd:b0:61d:1443:8599 with SMTP id
 4fb4d7f45d1cf-61d26ec6264mr18308728a12.32.1757042843053; Thu, 04 Sep 2025
 20:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-3-zong.li@sifive.com> <20250901133629.87310-1-ni_liqiang@126.com>
 <CANXhq0ra+yv-Wt_vKTN3+c4StsPQB1vR+=Kp3RVSh0g10Oogqw@mail.gmail.com>
In-Reply-To: <CANXhq0ra+yv-Wt_vKTN3+c4StsPQB1vR+=Kp3RVSh0g10Oogqw@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 5 Sep 2025 11:27:10 +0800
X-Gm-Features: Ac12FXxCOomRzLnISI4mSuIvWFVx9HD9ac2cyQivUPSI8ky_l1yBqci4E2RqAio
Message-ID: <CANXhq0oeUZb7161eJ2z-9aRXSDSmt8P9RpC7QSH4DZ0YvNp_7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/10] RISC-V IOMMU HPM and nested IOMMU support
To: niliqiang <ni_liqiang@126.com>
Cc: aou@eecs.berkeley.edu, iommu@lists.linux.dev, jgg@ziepe.ca, 
	joro@8bytes.org, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	chenruisust@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_202725_175289_C7D72AC7 
X-CRM114-Status: GOOD (  40.59  )
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

T24gVHVlLCBTZXAgMiwgMjAyNSBhdCAxMjowMeKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAxLCAyMDI1IGF0IDk6MzfigK9QTSBuaWxpcWlh
bmcgPG5pX2xpcWlhbmdAMTI2LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgWm9uZwo+ID4KPiA+IEZy
aSwgMTQgSnVuIDIwMjQgMjI6MjE6NDggKzA4MDAsIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gPiBUaGlzIHBhdGNoIGluaXRpYWxpemUgdGhlIHBtdSBzdHVmZiBh
bmQgdW5pbml0aWFsaXplIGl0IHdoZW4gZHJpdmVyCj4gPiA+IHJlbW92aW5nLiBUaGUgaW50ZXJy
dXB0IGhhbmRsaW5nIGlzIGFsc28gcHJvdmlkZWQsIHRoaXMgaGFuZGxlciBuZWVkIHRvCj4gPiA+
IGJlIHByaW1hcnkgaGFuZGxlciBpbnN0ZWFkIG9mIHRocmVhZCBmdW5jdGlvbiwgYmVjYXVzZSBw
dF9yZWdzIGlzIGVtcHR5Cj4gPiA+IHdoZW4gdGhyZWFkaW5nIHRoZSBJUlEsIGJ1dCBwdF9yZWdz
IGlzIG5lY2Vzc2FyeSBieSBwZXJmX2V2ZW50X292ZXJmbG93Lgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJp
dmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMv
aW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gPiBpbmRleCA4YjZhNjRjMWFkOGQuLjE3MTZiMjI1MWYz
OCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPiA+ICsr
KyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gPiBAQCAtNTQwLDYgKzU0MCw2MiBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgcmlzY3ZfaW9tbXVfZmx0cV9wcm9jZXNzKGludCBpcnEsIHZv
aWQgKmRhdGEpCj4gPiA+ICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gPiAgfQo+ID4gPgo+ID4g
PiArLyoKPiA+ID4gKyAqIElPTU1VIEhhcmR3YXJlIHBlcmZvcm1hbmNlIG1vbml0b3IKPiA+ID4g
KyAqLwo+ID4gPiArCj4gPiA+ICsvKiBIUE0gaW50ZXJydXB0IHByaW1hcnkgaGFuZGxlciAqLwo+
ID4gPiArc3RhdGljIGlycXJldHVybl90IHJpc2N2X2lvbW11X2hwbV9pcnFfaGFuZGxlcihpbnQg
aXJxLCB2b2lkICpkZXZfaWQpCj4gPiA+ICt7Cj4gPiA+ICsgc3RydWN0IHJpc2N2X2lvbW11X2Rl
dmljZSAqaW9tbXUgPSAoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqKWRldl9pZDsKPiA+ID4g
Kwo+ID4gPiArIC8qIFByb2Nlc3MgcG11IGlycSAqLwo+ID4gPiArIHJpc2N2X2lvbW11X3BtdV9o
YW5kbGVfaXJxKCZpb21tdS0+cG11KTsKPiA+ID4gKwo+ID4gPiArIC8qIENsZWFyIHBlcmZvcm1h
bmNlIG1vbml0b3JpbmcgaW50ZXJydXB0IHBlbmRpbmcgKi8KPiA+ID4gKyByaXNjdl9pb21tdV93
cml0ZWwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19JUFNSLCBSSVNDVl9JT01NVV9JUFNSX1BNSVAp
Owo+ID4gPiArCj4gPiA+ICsgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gPiArfQo+ID4gPiArCj4g
PiA+ICsvKiBIUE0gaW5pdGlhbGl6YXRpb24gKi8KPiA+ID4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9t
bXVfaHBtX2VuYWJsZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiA+ID4gK3sK
PiA+ID4gKyBpbnQgcmM7Cj4gPiA+ICsKPiA+ID4gKyBpZiAoIShpb21tdS0+Y2FwcyAmIFJJU0NW
X0lPTU1VX0NBUEFCSUxJVElFU19IUE0pKQo+ID4gPiArICAgICByZXR1cm4gMDsKPiA+ID4gKwo+
ID4gPiArIC8qCj4gPiA+ICsgICogcHRfcmVncyBpcyBlbXB0eSB3aGVuIHRocmVhZGluZyB0aGUg
SVJRLCBidXQgcHRfcmVncyBpcyBuZWNlc3NhcnkKPiA+ID4gKyAgKiBieSBwZXJmX2V2ZW50X292
ZXJmbG93LiBVc2UgcHJpbWFyeSBoYW5kbGVyIGluc3RlYWQgb2YgdGhyZWFkCj4gPiA+ICsgICog
ZnVuY3Rpb24gZm9yIFBNIElSUS4KPiA+ID4gKyAgKgo+ID4gPiArICAqIFNldCB0aGUgSVJRRl9P
TkVTSE9UIGZsYWcgYmVjYXVzZSB0aGlzIElSUSBtaWdodCBiZSBzaGFyZWQgd2l0aAo+ID4gPiAr
ICAqIG90aGVyIHRocmVhZGVkIElSUXMgYnkgb3RoZXIgcXVldWVzLgo+ID4gPiArICAqLwo+ID4g
PiArIHJjID0gZGV2bV9yZXF1ZXN0X2lycShpb21tdS0+ZGV2LAo+ID4gPiArICAgICAgICAgICAg
ICAgaW9tbXUtPmlycXNbcmlzY3ZfaW9tbXVfcXVldWVfdmVjKGlvbW11LCBSSVNDVl9JT01NVV9J
UFNSX1BNSVApXSwKPiA+ID4gKyAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X2hwbV9pcnFfaGFu
ZGxlciwgSVJRRl9PTkVTSE9UIHwgSVJRRl9TSEFSRUQsIE5VTEwsIGlvbW11KTsKPiA+ID4gKyBp
ZiAocmMpCj4gPiA+ICsgICAgIHJldHVybiByYzsKPiA+ID4gKwo+ID4gPiArIHJldHVybiByaXNj
dl9pb21tdV9wbXVfaW5pdCgmaW9tbXUtPnBtdSwgaW9tbXUtPnJlZywgZGV2X25hbWUoaW9tbXUt
PmRldikpOwo+ID4gPiArfQo+ID4gPiArCj4gPgo+ID4gV2hhdCBhcmUgdGhlIGJlbmVmaXRzIG9m
IGluaXRpYWxpemluZyB0aGUgaW9tbXUtcG11IGRyaXZlciBpbiB0aGUgaW9tbXUgZHJpdmVyPwo+
ID4KPiA+IEl0IG1pZ2h0IGJlIGJldHRlciBmb3IgdGhlIFJJU0MtViBJT01NVSBQTVUgZHJpdmVy
IHRvIGJlIGxvYWRlZCBhcyBhIHNlcGFyYXRlIG1vZHVsZSwgYXMgdGhpcyB3b3VsZCBhbGxvdyBn
cmVhdGVyIGZsZXhpYmlsaXR5IHNpbmNlIGRpZmZlcmVudCB2ZW5kb3JzIG1heSBuZWVkIHRvIGFk
ZCBjdXN0b20gZXZlbnRzLgo+ID4KPiA+IEFsc28sIEknbSBub3QgcXVpdGUgY2xlYXIgb24gaG93
IGN1c3RvbSBldmVudHMgc2hvdWxkIGJlIGFkZGVkIGlmIHRoZSBSSVNDLVYgaW9tbXUtcG11IGlz
IHBsYWNlZCB3aXRoaW4gdGhlIGlvbW11IGRyaXZlci4KPgo+IEhpIExpcWlhbmcsCj4gTXkgb3Jp
Z2luYWwgaWRlYSBpcyB0aGF0LCBzaW5jZSB0aGUgSU9NTVUgSFBNIGlzIG5vdCBhbHdheXMgcHJl
c2VudCwKPiBpdCBkZXBlbmRzIG9uIHRoZSBjYXBhYmlsaXR5LkhQTSBiaXQsIGlmIHdlIHNlcGFy
YXRlIEhQTSBpbnRvIGFuCj4gaW5kaXZpZHVhbCBtb2R1bGUsIEkgYXNzdW1lIHRoYXQgdGhlIFBN
VSBkcml2ZXIgbWF5IG5vdCBoYXZlIGFjY2VzcyB0bwo+IHRoZSBJT01NVSdzIGNvbXBsZXRlIE1N
SU8gcmVnaW9uLiBJ4oCZbSBub3Qgc3VyZSBob3cgd2Ugd291bGQgY2hlY2sgdGhlCj4gY2FwYWJp
bGl0eSByZWdpc3RlciBpbiB0aGUgUE1VIGRyaXZlciBhbmQgYXZvaWQgdGhlIGZvbGxvd2luZwo+
IHNpdHVhdGlvbjogY2FwYWJpbGl0eS5IUE0gaXMgemVybywgYnV0IHRoZSBJT01NVS1QTVUgZHJp
dmVyIGlzIHN0aWxsCj4gbG9hZGVkIGJlY2F1c2UgdGhlIFBNVSBub2RlIGlzIHByZXNlbnQgaW4g
dGhlIERUUy4gSXQgd2lsbCBiZSBoZWxwZnVsCj4gaWYgeW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
IG9uIHRoaXMuCj4KPiBSZWdhcmRpbmcgY3VzdG9tIGV2ZW50cywgc2luY2Ugd2UgZG9u4oCZdCBo
YXZlIHRoZSBkcml2ZXIgZGF0YSwgbXkKPiBjdXJyZW50IHJvdWdoIGlkZWEgaXMgdG8gYWRkIGEg
dmVuZG9yIGV2ZW50IG1hcCB0YWJsZSB0byBsaXN0IHRoZQo+IHZlbmRvciBldmVudHMgYW5kIHVz
ZSBLY29uZmlnIHRvIGRlZmluZSB0aGVtIHJlc3BlY3RpdmVseS4gVGhpcyBpcwo+IGp1c3QgYW4g
aW5pdGlhbCB0aG91Z2h0IGFuZCBtYXkgbm90IGJlIHRoZSBnb29kIHNvbHV0aW9uLCBzbyBmZWVs
IGZyZWUKPiB0byBzaGFyZSBhbnkgcmVjb21tZW5kYXRpb25zLiBPZiBjb3Vyc2UsIGlmIHdlIGV2
ZW50dWFsbHkgZGVjaWRlIHRvCj4gbW92ZSBpdCB0byBkcml2ZXJzL3BlcmYgYXMgYW4gaW5kaXZp
ZHVhbCBtb2R1bGUsIHRoZW4gd2UgY291bGQgdXNlIHRoZQo+IGRyaXZlciBkYXRhIGZvciBjdXN0
b20gZXZlbnRzLCBzaW1pbGFyIHRvIHdoYXQgQVJNIGRvZXMuCgpNYXliZSBsZXQncyB0cnkgYXV4
aWxpYXJ5IGRyaXZlciBmcmFtZXdvcmsgdG8gcmVzb2x2ZSB0aGlzIHRvcGljIGluCnRoZSBuZXh0
IHZlcnNpb24uCgo+Cj4gVGhhbmtzCj4KPiA+Cj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gTGlx
aWFuZwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
