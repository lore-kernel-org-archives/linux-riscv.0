Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DDBEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez03SLNdeG9WK41HgLGeWsXT8CQbultEYLwPUhU1hZw=; b=V14pq7QKCVe7DR
	/f38vTMuo8PMbdTvY9dxib56h26b0b+I2xXtS1b5P3liZwwdA8pW9iDLAMyo8+voqHTwBRCsPZJbu
	wcfs6x/Zn+KNDuyI4iOmGmapuo0YIqnDPIjPAoMnj9oNs1icW+o4fEZSbkq24FKKD4lifDRXlkN/K
	a1/fnr07+m7zUGJf33KuZDckeZJWffaYqldXYSKzAsQLU6VzhkL/H4540MoBSI2VUJIastmVOJEG+
	L17TgB+4JQ38QxqFLu8TDs/3e0qjeDP42NW6enjY8vZAusuT7SdIQMZ3NIF4vhvcLrf1jRB/0rAr3
	8/SjOzK749V3hTfUmm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCjFt-0041An-0C;
	Fri, 23 Jun 2023 16:03:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCjFp-00419g-3C
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 16:03:23 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b46d4e1b0aso13789861fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687536198; x=1690128198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UUUtE/gOtOOjIJp13FnV3LETjhgWLdpmIzdJhfUTGs=;
        b=bgpuJMih2D6iVGs9Xa5gO+96mNDc14lvDPz0FcXhPj6i+71o9Y8XOK1/4zunB6U0ES
         pVIkfpaQlP/oavJ7LNyDxzlF81wUlZXStHvDxEQOsBHvoN792/suVDOQGNUu1K0CC2ej
         H4QhvVNvWhHzPd+DcvvBM0l/QezfgErqLTCHl2XL9WJmQUOllhryfx9fEDC5nNCBwNnP
         aeCN46z/bUoQnVEoWCQ3ZZWGVzhVAaKLLe/PUB5CRcGramM9GW7nl6j8Gddi7Xuajgir
         StLAN6Q1FZQIm/Tp/vC9rNlzbPpsQ/ukLlIN2tihbfr0PkjksUDK4wHDf4UicPwRsZmx
         JcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687536198; x=1690128198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UUUtE/gOtOOjIJp13FnV3LETjhgWLdpmIzdJhfUTGs=;
        b=S7ROGtdIlt1XjhrUE7DiB9VJs5+GtmefDrbYyrwMNH9H3l9WIYFO8qkcLuusRFAKMB
         XwtaSe3msQ0vxfJ3sjuOxscg3Qflc+wpez6BZYIWFOFJZQsNfp9ia02IEA/FhoPYKkIH
         hrkfHMokAy9pFCw22N9+6LRkoMSt112AWsOIJP32eoXJQTkxWfXK+8180Zv5i23WxeiM
         7Kgon2tIAPN84Fmz96n3/Q4iUrl5C4U8SSLvcnm4+wBodLO3D1QsgqvxQru03bXb8Ut/
         94U6fpnmsILGAo5KQm4zCkYzC1j9Q72OeyhH8jXX8ah8eq3GPj9t80qrW4gG/jbEZr5U
         AKeA==
X-Gm-Message-State: AC+VfDx6m5ipNVS7KB8bYEhYtSCgxqrEgfIaedNkaUSpvfnWEO0VhrOk
	T4eAfarmsh7xdoiIoQJY0PFk1o1tc7fCCQC5dKv6wA==
X-Google-Smtp-Source: ACHHUZ5gs63B4OgKe4Z9bhc9XG9nQHRewAACqLwt9yH/6emVAQY9Sd7+t/U547Rfa15qOqIHkxiE83q7UsHMNWYeVOk=
X-Received: by 2002:a2e:96d0:0:b0:2b4:7965:419f with SMTP id
 d16-20020a2e96d0000000b002b47965419fmr10755146ljj.40.1687536197874; Fri, 23
 Jun 2023 09:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-3-eric.lin@sifive.com>
 <20230616-revision-speed-a83dc926b334@wendy> <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
 <20230621-stupor-violin-930ccc7d7593@spud> <20230623132402.GA17369@willie-the-truck>
In-Reply-To: <20230623132402.GA17369@willie-the-truck>
From: Eric Lin <eric.lin@sifive.com>
Date: Sat, 24 Jun 2023 00:03:05 +0800
Message-ID: <CAPqJEFp0r5tZJZ48nLakRd92zNf1D93hbTeGUsTyVuF+JAsJEw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
To: Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org, 
	chenhuacai@kernel.org, baolu.lu@linux.intel.com, kan.liang@linux.intel.com, 
	nnac123@linux.ibm.com, pierre.gondois@arm.com, jgross@suse.com, 
	chao.gao@intel.com, maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, mark.rutland@arm.com, arnd@arndb.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_090322_087313_D554BBD3 
X-CRM114-Status: GOOD (  23.79  )
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

SGkgV2lsbCwKCk9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDk6MjTigK9QTSBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIGZvbGtzLAo+Cj4gT24gV2VkLCBKdW4gMjEs
IDIwMjMgYXQgMDQ6MTc6MjRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVHVl
LCBKdW4gMjAsIDIwMjMgYXQgMTE6MTQ6MzJBTSArMDgwMCwgRXJpYyBMaW4gd3JvdGU6Cj4gPiA+
IE9uIEZyaSwgSnVuIDE2LCAyMDIzIGF0IDY6MTPigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEp1biAxNiwgMjAyMyBh
dCAwMjozMjowOVBNICswODAwLCBFcmljIExpbiB3cm90ZToKPiA+ID4gPiA+ICBkcml2ZXJzL3Nv
Yy9zaWZpdmUvS2NvbmZpZyAgICAgICAgICAgIHwgICA5ICsKPiA+ID4gPiA+ICBkcml2ZXJzL3Nv
Yy9zaWZpdmUvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiA+ID4gPiA+ICBkcml2ZXJzL3Nv
Yy9zaWZpdmUvc2lmaXZlX3BsMi5oICAgICAgIHwgIDIwICsKPiA+ID4gPiA+ICBkcml2ZXJzL3Nv
Yy9zaWZpdmUvc2lmaXZlX3BsMl9jYWNoZS5jIHwgIDE2ICsKPiA+ID4gPiA+ICBkcml2ZXJzL3Nv
Yy9zaWZpdmUvc2lmaXZlX3BsMl9wbXUuYyAgIHwgNjY5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiA+ID4KPiA+ID4gPiBQZXJmIGRyaXZlcnMgc2hvdWxkIGJlIGluIGRyaXZlcnMvcGVy
Ziwgbm8/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gQnV0IEkgZ3JlcCBwZXJmX3BtdV9yZWdpc3Rlcigp
LCBpdCBzZWVtcyBub3QgYWxsIHRoZSBwbXUgZHJpdmVycyBhcmUKPiA+ID4gaW4gZHJpdmVycy9w
ZXJmIGFzIGJlbG93Ogo+ID4gPgo+ID4gPiBhcmNoL2FybS9tYWNoLWlteC9tbWRjLmM6NTE3OiAg
IHJldCA9Cj4gPiA+IHBlcmZfcG11X3JlZ2lzdGVyKCYocG11X21tZGMtPnBtdSksIG5hbWUsIC0x
KTsKPiA+ID4gYXJjaC9hcm0vbW0vY2FjaGUtbDJ4MC1wbXUuYzo1NTI6ICAgICAgIHJldCA9Cj4g
PiA+IHBlcmZfcG11X3JlZ2lzdGVyKGwyeDBfcG11LCBsMngwX25hbWUsIC0xKTsKPiA+ID4gLi4u
Cj4gPiA+IGRyaXZlcnMvZG1hL2lkeGQvcGVyZm1vbi5jOjYyNzogcmMgPSBwZXJmX3BtdV9yZWdp
c3RlcigmaWR4ZF9wbXUtPnBtdSwKPiA+ID4gaWR4ZF9wbXUtPm5hbWUsIC0xKTsKPiA+ID4gZHJp
dmVycy9mcGdhL2RmbC1mbWUtcGVyZi5jOjkwNDpzdGF0aWMgaW50Cj4gPiA+IGZtZV9wZXJmX3Bt
dV9yZWdpc3RlcihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ID4gPiBkcml2ZXJzL2Zw
Z2EvZGZsLWZtZS1wZXJmLmM6OTI5OiAgICAgICAgcmV0ID0gcGVyZl9wbXVfcmVnaXN0ZXIocG11
LCBuYW1lLCAtMSk7Cj4gPiA+IC4uLgo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG11LmM6NTQ5OiAgICByZXQgPQo+ID4gPiBwZXJmX3BtdV9yZWdpc3RlcigmcG11X2Vu
dHJ5LT5wbXUsIHBtdV9uYW1lLCAtMSk7Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
cG11LmM6MTE5MDogICByZXQgPQo+ID4gPiBwZXJmX3BtdV9yZWdpc3RlcigmcG11LT5iYXNlLCBw
bXUtPm5hbWUsIC0xKTsKPiA+ID4gZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdo
dC1ldG0tcGVyZi5jOjkwNzogICByZXQgPQo+ID4gPiBwZXJmX3BtdV9yZWdpc3RlcigmZXRtX3Bt
dSwgQ09SRVNJR0hUX0VUTV9QTVVfTkFNRSwgLTEpOwo+ID4gPiBkcml2ZXJzL2h3dHJhY2luZy9w
dHQvaGlzaV9wdHQuYzo4OTU6ICAgcmV0ID0KPiA+ID4gcGVyZl9wbXVfcmVnaXN0ZXIoJmhpc2lf
cHR0LT5oaXNpX3B0dF9wbXUsIHBtdV9uYW1lLCAtMSk7Cj4gPiA+IGRyaXZlcnMvaW9tbXUvaW50
ZWwvcGVyZm1vbi5jOjU3MDogICAgICByZXR1cm4KPiA+ID4gcGVyZl9wbXVfcmVnaXN0ZXIoJmlv
bW11X3BtdS0+cG11LCBpb21tdV9wbXUtPnBtdS5uYW1lLCAtMSk7Cj4gPiA+IGRyaXZlcnMvbnZk
aW1tL25kX3BlcmYuYzozMDk6ICAgcmMgPSBwZXJmX3BtdV9yZWdpc3RlcigmbmRfcG11LT5wbXUs
Cj4gPiA+IG5kX3BtdS0+cG11Lm5hbWUsIC0xKTsKPiA+ID4gLi4uCj4gPiA+Cj4gPiA+IEkganVz
dCB3b25kZXJpbmcgd2hhdCBraW5kIG9mIHBtdSBkcml2ZXJzIHNob3VsZCBiZSBpbiBkcml2ZXJz
L3BlcmYKPiA+ID4gYW5kIHdoYXQga2luZCBvZiBwbXUgZHJpdmVycyBzaG91bGQgbm90IGJlIGlu
IGRyaXZlcnMvcGVyZi4KPiA+ID4gVGhhbmtzLgo+ID4KPiA+IFRvIGJlIHF1aXRlIGhvbmVzdCwg
SSBoYXZlIG5vIGlkZWEuCj4gPiBJJ20ganVzdCBhIHdlZSBiaXQgd2FyeSBvZiB0YWtpbmcgYW55
dGhpbmcgdGhhdCBhcHBlYXJzIHRvIGhhdmUgYW5vdGhlcgo+ID4gaG9tZSB2aWEgZHJpdmVycy9z
b2MuIEknZCByYXRoZXIgYnJlYWsgZHJpdmVycyBvdXQsIHVzaW5nIHRoZSBhdXggYnVzIG9yCj4g
PiBzaW1pbGFyIGlmIG5lZWQgYmUsIHNvIHRoYXQgcGVvcGxlIHdobyBhcmUga25vd2xlZGdlYWJs
ZSBpbiBhbiBhcmVhIGFyZQo+ID4gQ0NlZCBvbiBwYXRjaGVzLgo+ID4gSG9wZWZ1bGx5IEFybmQg
b3IgdGhlIFBlcmYgcGVvcGxlIGNhbiBvZmZlciBzb21lIGd1aWRhbmNlIGhlcmUuIElmIGl0Cj4g
PiBkb2VzIGdvIGludG8gZHJpdmVycy9zb2MsIGl0J2xsIG5lZWQgYSByZXZpZXcgZnJvbSBzb21l
b25lIGtub3dsZWRnZWFibGUKPiA+IG9mIHBlcmYgYW55d2F5Lgo+Cj4gSSdtIG5vdCB0ZXJyaXRv
cmlhbCBhYm91dCB0aGUgcGVyZiBkcml2ZXJzIGF0IGFsbCwgYnV0IEwyQ0MgUE1VcyBsaWtlIHRo
aXMKPiBvbmUgcHJvYmFibHkgZml0IHByZXR0eSB3ZWxsIGluIGRyaXZlcnMvcGVyZi4gVGhlIHVz
dWFsIHJlYXNvbiBmb3IgcHV0dGluZwo+IGRyaXZlcnMgZWxzZXdoZXJlIGlzIGlmIHRoZSBQTVUg
aXMgdGlnaHRseSBjb3VwbGVkIHdpdGggc29tZSBvdGhlciBJUCB3aGljaAo+IGlzIGhhbmRsZWQg
YnkgYW5vdGhlciBzdWJzeXN0ZW0gKGUuZy4gR1BVKS4KPgpUaGFua3MgZm9yIHRoZSBleHBsYW5h
dGlvbi4gT0ssIEknbGwgcHV0IHRoZSBwbDIgY2FjaGUgUE1VIGRyaXZlciBpbgpkcml2ZXJzL3Bl
cmYuCgpCZXN0IFJlZ2FyZHMsCkVyaWMgTGluLgoKPiBXaWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
