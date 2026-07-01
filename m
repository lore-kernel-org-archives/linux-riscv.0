Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463B1C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZpAY1fv0sqfnmQQzUo/fmfAWocT8g8DI63mvbJi9E0=; b=utbUfSbKTVi80o
	7RwFo0CLhW9bEDuQhiSINQjEEd13a7uQssCKZZO0CP1LvgCeq/yndIGiUHaSzIuFsUwppOktZ62yG
	igfJJLj78CLlVr/ZtfnkMZoDr+e1IEp9SzNvM7FUYk6tyeqvmlEpOeEBTa5kxSZYEwdeZwnkp7Efa
	2t/1Ro5aapzjP8mGBHOlQj1pWPVyZVrobsJcxOj2Fl1u2NsjhwDfaiuROb4HFQNStoP2Rim8Qiw0q
	qH7h9BrTc6AIj+pm/Son5M9y2Chk5bg2smPACS5TLIlDDmaVaCtP594k87NEV6vimLGbcTsNVIDq1
	3lHK1Apoqs2exs5bPQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wejz9-00000000Sgr-2J4o;
	Wed, 01 Jul 2026 01:43:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wejz8-00000000Sgf-0n8f
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 01:43:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FF3A440B3
	for <linux-riscv@lists.infradead.org>; Wed,  1 Jul 2026 01:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D99F1F00A3A
	for <linux-riscv@lists.infradead.org>; Wed,  1 Jul 2026 01:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782870207;
	bh=pgwo5Y2YVtSU5NJkiPPhD+usOSDvizU2sfk4E7Z4ajQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lUh2xsP7XV2H7rUr1KR28PmQbzhA2WM9r7gPWMLbUkWpcU9DUD0h+YFbmbJ95+C+0
	 O8lGO22mRrFTqwW53h0Ri3YMZWPtektXcmtOyAp37lRpVSnXKJbcaoXF7qi5YZkv+t
	 y5qnKIx1PW8fPqma7HfpJY53VCfAdcBzzE/fBFoYkhg0TBFZCCjB8+HjY2a92+PhCq
	 7sDdyGIfMpiq/QxyDWh4O17YZMVXVZqyddEbObXUzAlEO0lTqwduRlvEJZ8L8o99dB
	 1smK7PQNIE8fAMtK5QNCCt1vpAaV8fc4mS3IW8CY07/IgkgP4eKRp1N1Qneo6o9x95
	 7zbcxJl5fsSPw==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso80128f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 18:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNPNsQZjamRNflSe0Kr1F7h8tIHDCISST4pXBfNmq6Kr8kc/XIh8PE0+8sgEW9KMIOh3k5LjTcfVf38w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAQVNtLSijzJFuJjP+q4UPwfbs/vJgqbnBeWIqgALJdQVkK7DQ
	0Whi+H6/EIB57lbMOcs6yOHDrb+UJG77R5q2gCYhBa3W6Q2M8x/gdzbucL97jufu84cEK6WHwN7
	QlxeFFnYP0TkJLVIoN+KsDYUnNPTBcfc=
X-Received: by 2002:adf:e011:0:10b0:46e:8226:96ba with SMTP id
 ffacd0b85a97d-476582f5260mr3272401f8f.13.1782870205832; Tue, 30 Jun 2026
 18:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260630083833.1275837-1-zong.li@sifive.com> <20260630083833.1275837-3-zong.li@sifive.com>
In-Reply-To: <20260630083833.1275837-3-zong.li@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 1 Jul 2026 09:43:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQfFEHp5BZtKRE4on-FMRuwBHZEtDn=g=L8=GaPH0uEyQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfcy5cWO9H4sDPMuveM9pp9eeEvl4ZKMfbR2jpOIiJoFwyXdryNTJq0UMs
Message-ID: <CAJF2gTQfFEHp5BZtKRE4on-FMRuwBHZEtDn=g=L8=GaPH0uEyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iommu/riscv: create a auxiliary device for HPM
To: Zong Li <zong.li@sifive.com>
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	andrew.jones@oss.qualcomm.com, david.laight.linux@gmail.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgNDozOOKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBDcmVhdGUgYW4gYXV4aWxpYXJ5IGRldmljZSBmb3IgSFBNIHdoZW4g
dGhlIElPTU1VIHN1cHBvcnRzIGEKPiBoYXJkd2FyZSBwZXJmb3JtYW5jZSBtb25pdG9yLgo+Cj4g
U3VnZ2VzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lv
bW11L3Jpc2N2L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBpbmRleCBj
ZWMzZGRkN2FiMTAuLjM2YWQ0YWE4MTQ2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBAQCAtMTQs
NiArMTQsNyBAQAo+Cj4gICNpbmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9hY3BpX3JpbXQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2F1eGlsaWFyeV9idXMuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcmFzaF9kdW1wLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gQEAgLTU2NSw2ICs1NjYsMjEgQEAgc3RhdGlj
IGlycXJldHVybl90IHJpc2N2X2lvbW11X2ZsdHFfcHJvY2VzcyhpbnQgaXJxLCB2b2lkICpkYXRh
KQo+ICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ICB9Cj4KPiArLyoKPiArICogSU9NTVUg
SGFyZHdhcmUgcGVyZm9ybWFuY2UgbW9uaXRvcgo+ICsgKi8KPiArc3RhdGljIGludCByaXNjdl9p
b21tdV9ocG1fZW5hYmxlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ICt7Cj4g
KyAgICAgICBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4ZGV2Owo+ICsKPiArICAgICAgIGF1
eGRldiA9IF9fZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0ZShpb21tdS0+ZGV2LCBLQlVJTERf
TU9ETkFNRSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAicG11IiwgaW9tbXUsIDApOwoKVXNpbmcgYW4gYXV4aWxpYXJ5IGRldmljZSBtYWtlcyBzZW5z
ZSBoZXJlIOKAlCBpdCBrZWVwcyBwZXJmIFBNVSBsb2dpYwpvdXQgb2YgdGhlIElPTU1VIGRyaXZl
ciBhbmQgbGV0cyBhIGRlZGljYXRlZCBkcml2ZXIgaGFuZGxlCnBlcmZfcG11X3JlZ2lzdGVyKCkg
aW5kZXBlbmRlbnRseS4gVGhlIGRldm0tbWFuYWdlZCBjcmVhdGlvbiBhbHNvIHRpZXMKdGhlIGF1
eGlsaWFyeSBkZXZpY2UgbGlmZXRpbWUgdG8gdGhlIHBhcmVudCBJT01NVSBkZXZpY2UsIHNvIG5v
CmV4cGxpY2l0IHRlYXJkb3duIGlzIG5lZWRlZC4KClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KCgo+ICsgICAgICAgaWYgKCFhdXhkZXYpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRU5PREVWOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICAvKiBM
b29rdXAgYW5kIGluaXRpYWxpemUgZGV2aWNlIGNvbnRleHQgaW5mbyBzdHJ1Y3R1cmUuICovCj4g
IHN0YXRpYyBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGMgKnJpc2N2X2lvbW11X2dldF9kYyhzdHJ1Y3Qg
cmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGRldmlkKQo+IEBAIC0xNjEzLDYgKzE2
MjksOSBAQCBpbnQgcmlzY3ZfaW9tbXVfaW5pdChzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICpp
b21tdSkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfcmVtb3ZlX3N5c2ZzOwo+ICAgICAgICAg
fQo+Cj4gKyAgICAgICBpZiAoaW9tbXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNf
SFBNKQo+ICsgICAgICAgICAgICAgICByaXNjdl9pb21tdV9ocG1fZW5hYmxlKGlvbW11KTsKPiAr
Cj4gICAgICAgICByZXR1cm4gMDsKPgo+ICBlcnJfcmVtb3ZlX3N5c2ZzOgo+IC0tCj4gMi40My43
Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
