Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF5DE8784D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6xY8ztkB+NLv/bRlumBtVz6R03SLCAbLPVNCU4zb/c=; b=AgPI+fiMclPUc9
	ma5PVachCbh8KCNvItvgFNqWn1kguKOzVvV6kh2XCs9PCYKfoxkOK8fx0H5XkI3ETDkhwZudJoh0A
	CHyUNE2LQR0mI3W17MJoLAasHFmYqJbmetj1uAsszsFJ9jxXn921L0JCKZBaOfv5SF33bmWm3o0/D
	v/9NnM815eoSbdGZNa/5kqxEl0B31yhjpkz970nmYEacOLuxTgRd6KVKXDA38tIlt4E8bqIHwS0eE
	JK3GPdcxiRxcONBguP8aFaFYJrQmgPKzgHUVeq+WD54igeVCz2DZAkArMQYiMBKfWn0YFXpxNTNoo
	d6RAdEhlS9ffWHPRPY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJui-000000071OM-0XG6;
	Tue, 03 Feb 2026 17:10:08 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJuf-000000071Nz-2QQp
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 17:10:07 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-40418578e28so2191420fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 09:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770138604; cv=none;
        d=google.com; s=arc-20240605;
        b=PXG9ZVx4UwcXWkCdEOzh4XvNJaJg1Gd/EXmLEegUap10jIWvFOSNLzogu1FeJ+luZd
         KY20jXCc+P896bFGk/Z03EABty9NZq3jCgHE5T06HYzNsUGKuB83FjB3xyXc008vLCZj
         tgwIqyOYG9LUEe6SHkhf2/tvZh8jnYTrXyZyhkNPL5v/WTcT6m+A2K3j41kieCE1kyZp
         EMcHr3OaVJ10BYMaiFV7aAOuty8qe/QwnDIs7I2eegGGKLPf2LU//K4wMGfvW32lngnZ
         EQldm+Ba/AsDzEHZDBoQW4dDdKR7jrqbbXBZyVRKYRA1Xl4badcbYZ2M2GS3e4fKzZHF
         9Zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qOSBvF/Gy8UgB1/+p9KXQwVSwOA3fLDnHXnJJD/Vqgc=;
        fh=RR6i1FpaCOHNFqHZBnavwO4w4ygwLrYeSuey1zOwMy4=;
        b=dRIsgqsrvhGxE6J75vYoSu1BJseLE2OAhLabzEJecOQmbPmOZw+sLB24APsYa/JqLy
         TVKuOCvOjQuvIhZfjakKJRKWy9O2Uf24JYZOipe5EAhO72MlkVUAto9d0EO/Bz50QjDX
         eTHZi4VcDmukrojgjXWs7Ik+i9YrggrxPMxHFc+txqBo8lbfRDTCdC75QeLrZJTd1ZYR
         jJ1DDjWm02xhpU4DIgSbWywANKdBmhN1jc/3y2Q+WUgxpOPFkNmpney4JJrUoeX+UqzZ
         +RpiMyQqFPKCpRjdJRXfgwKCfs8DrwEN+uk3eyGPNi3bQfklywizCsQaoXASQ/gplmK6
         sNRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770138604; x=1770743404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOSBvF/Gy8UgB1/+p9KXQwVSwOA3fLDnHXnJJD/Vqgc=;
        b=YUB3hohHDgYszVoFdr+gIlSePfS7F2rrg0+CTmvn1j/3+t5TbSvkq4Dh//a4segh8t
         2N6RqeHnoHRZQoilocdciJ0TcPtZtQa3nYIeAiRQpkOyyOLWnd336PRmxKx3aKW+k60E
         vElwr9UV3Qrz9KnFEo99r3JmsWrcN6XG3U20E5w+XZLE1tz2wjTkWMBRZ4nQ6x9mCAMU
         EUeS6nTHytdqOVblV0L5fOilJawEk35frgkCUfdoskXTsWYfddAHwRqT/la4DHnK1Qv9
         6HwSVvf2Lpn7P1n27ZoMk7XnajjK61sVqkik2qzPyOBfFypXCpPAfuao9TZvpXUEkJUK
         jvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138604; x=1770743404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qOSBvF/Gy8UgB1/+p9KXQwVSwOA3fLDnHXnJJD/Vqgc=;
        b=XJp9sHkKVhdRPB/15qmwPCZQQ2DnZNr5wrdjSPraiE+MiY3mGlgfRtSlD7jhEyFHP/
         RGhNdupRQyacvm/IDPfl1o+ZrDgBF8oF+k7cQh1Fcdd4QIuvM1CTJXmwJtuIDLqJccZT
         V/mzuh5Wz4HRiTsKUCVsf3MCylbjlLCee38hdxYJxcvjFY4vwdF7SsF+EX5xaTBKkBYJ
         fib2lJhN16D4NHDjrziPEiVKI8njHa78BUuxT0ZwbFc5Xb1jbpD4ZroxDchLRO67QDpZ
         f1Rct4mffDeVplY8UKQ2LoZmtVTlvR3nJXmkCho88oBRlYW8Pxn+F/Lmrto7rnuLsA6E
         HwKw==
X-Forwarded-Encrypted: i=1; AJvYcCVdDr71mZpAlPOh9LzDa+d6MhRK6AJyTn4Spt14bf/YeYA9GT4wDlXpWJOAAy6OrY3+Ygih+omPOio9qw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh39Px5eiGfL0Nx8OVXYzYsU8R2OPnJHrm1AE9upYPP0AkPjpF
	5ctIcSHkmKEjV9ucYZf3vAsi7Nmwb4/VzsMdCHUuq/7YkbUmCwuxrXRmd8WUUbFbNKowlq91dQy
	ZQglTnz7vpfGAI8Bsz2uEXGGqMe6kgTL87dbV4qEATQ==
X-Gm-Gg: AZuq6aLQmr8rH8NfOAznk0x8F1P7mTkU5mpi04K3Kltjm3uBY0vk22gqblfBFYE2vYP
	VmtjkdMMiBoa0JzgSYiNZw5EOKzt7au8BfIDZMU8EeNsKY0d+9fxnaW8baPBakPhduhbjgGYY1y
	5PGtiofJFuhHLBefwtpl70fSmtGaybXgZxuU3Zkpbnh216LuJz6m0ROrJkdiHBZ1mp2zGAGRczj
	i9o0jhKVRi9AEDbscfWiDcjBM+ilNXHy6WGH/kD1oL4TmrsYFf9iB8EM4Evd6d/Wbp15HeDYln6
	6Px6DeGWSywGpM2L3nODuj+owyRVyMf598P71iExlLKJqELaeDAEtdPHbQ==
X-Received: by 2002:a05:6820:1744:b0:662:f543:5d33 with SMTP id
 006d021491bc7-66a23cf2ffemr112433eaf.82.1770138603999; Tue, 03 Feb 2026
 09:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20260203080256.9401-2-yingjun.ni@riscv-computing.com> <87ecn23q6e.ffs@tglx>
In-Reply-To: <87ecn23q6e.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Feb 2026 22:39:51 +0530
X-Gm-Features: AZwV_QgH4drql13ZRy2bmwhFho_X95PYTMoyB78oljBfF46hqGoDaTenQkYAr0g
Message-ID: <CAAhSdy31dF1qHtaM1mqx+dG6ryb_3M+M63e8ujaCZBWDGUYeNg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix irq migration failure issue when
 cpu hotplug.
To: Thomas Gleixner <tglx@kernel.org>
Cc: Yingjun Ni <yingjun.ni@riscv-computing.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_091005_813267_1848DA5E 
X-CRM114-Status: GOOD (  30.86  )
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

T24gVHVlLCBGZWIgMywgMjAyNiBhdCA3OjA14oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMDMgMjAyNiBhdCAxNjowMiwgWWluZ2p1
biBOaSB3cm90ZToKPiA+IEFkZCBhIG51bGwgcG9pbnRlciBjaGVjayBmb3IgaXJxX3dyaXRlX21z
aV9tc2cgdG8gZml4IE5VTEwgcG9pbnRlcgo+ID4gZGVyZWZlcmVuY2UgaXNzdWUgd2hlbiBtaWdy
YXRpbmcgaXJxLgo+ID4KPiA+IE1vZGlmeSB0aGUgcmV0dXJuIHZhbHVlIG9mIGltc2ljX2lycV9z
ZXRfYWZmaW5pdHkgdG8gbGV0IHRoZSBzdWJkb21haW4KPiA+IFBDSS1NU0lYIG1pZ3JhdGUgdGhl
IGlycSB0byBhIG5ldyBjcHUgd2hlbiBjcHUgaG90cGx1Zy4KPiA+Cj4gPiBEb24ndCBzZXQgdmVj
LT5tb3ZlX25leHQgaW4gaW1zaWNfdmVjdG9yX21vdmVfdXBkYXRlIHdoZW4gdGhlIGNwdSBpcwo+
ID4gb2ZmbGluZSwgYmVjYXVzZSBpdCB3aWxsIG5ldmVyIGJlIGNsZWFyZWQuCj4KPiBZb3UgY29t
cGxldGVseSBmYWlsIHRvIGV4cGxhaW4gdGhlIGFjdHVhbCBwcm9ibGVtIGFuZCB0aGUgcm9vdAo+
IGNhdXNlLiBTZWUKPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3By
b2Nlc3MvbWFpbnRhaW5lci10aXAuaHRtbCNjaGFuZ2Vsb2cKPgo+ID4gIGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYyB8IDggKysrKysrLS0KPiA+ICBkcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgICAgfCA1ICsrKysrCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiA+IGluZGV4IDY0M2M4ZTQ1OTYx
MS4uMTMxZTRmMmI1NDMxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbXNpYy1wbGF0Zm9ybS5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXBsYXRmb3JtLmMKPiA+IEBAIC05Myw5ICs5MywxMyBAQCBzdGF0aWMgdm9pZCBpbXNpY19p
cnFfY29tcG9zZV9tc2coc3RydWN0IGlycV9kYXRhICpkLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+
ID4gIHN0YXRpYyB2b2lkIGltc2ljX21zaV91cGRhdGVfbXNnKHN0cnVjdCBpcnFfZGF0YSAqZCwg
c3RydWN0IGltc2ljX3ZlY3RvciAqdmVjKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBtc2lfbXNn
IG1zZyA9IHsgfTsKPiA+ICsgICAgIHN0cnVjdCBpcnFfY2hpcCAqaXJxX2NoaXAgPSBpcnFfZGF0
YV9nZXRfaXJxX2NoaXAoZCk7Cj4gPiArCj4gPiArICAgICBpZiAoIWlycV9jaGlwLT5pcnFfd3Jp
dGVfbXNpX21zZykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gSSBoYXZlIG5vIGlkZWEg
aG93IHRoaXMgZXZlciB3b3JrZWQuIFRoZSBpcnFfZGF0YSBwb2ludGVyIGJlbG9uZ3MgdG8gdGhl
Cj4gSU1TSUMgYmFzZSBkb21haW4sIHdoaWNoIGRlZmluaXRlbHkgZG9lcyBub3QgaGF2ZSBhIGly
cV93cml0ZV9tc2lfbXNnKCkKPiBjYWxsYmFjayBhbmQgbmV2ZXIgY2FuIGhhdmUgb25lLgoKVGhl
IGltc2ljX2lycV9zZXRfYWZmaW5pdHkoKSBwYXNzZXMgaXJxX2dldF9pcnFfZGF0YShkLT5pcnEp
IGFzCmlycV9kYXRhIHBvaW50ZXIgdG8gaW1zaWNfbXNpX3VwZGF0ZV9tc2coKSBleHBlY3Rpbmcg
aXQgdG8gYmUKdGhlIHRvcC1sZXZlbCBpcnFfZGF0YS4gVGhlIGltc2ljX21zaV91cGRhdGVfbXNn
KCkgYXNzdW1lcwp0aGF0IHRoZSB0b3AtbGV2ZWwgaXJxX2RhdGEgYWx3YXlzIGhhcyBpcnFfd3Jp
dGVfbXNpX21zZygpIGJ1dCBpZgp0aGlzIGFzc3VtcHRpb24gaXMgbm90IGNvcnJlY3QgdGhlbiB3
ZSBuZWVkIGFuIGlmLWNoZWNrIG92ZXIgaGVyZS4KCj4KPiBUaGUgd3JpdGUgbWVzc2FnZSBjYWxs
YmFjayBpcyBhbHdheXMgaW1wbGVtZW50ZWQgYnkgdGhlIHRvcCBtb3N0IGRvbWFpbiwKPiBpbiB0
aGlzIGNhc2UgdGhlIFBDSS9NU0lbeF0gcGVyIGRldmljZSBkb21haW4uCj4KPiBTbyB0aGlzIGNv
ZGUgaXMgc2ltcGx5IGJyb2tlbiBhbmQgeW91ciBOVUxMIHBvaW50ZXIgY2hlY2sganVzdCBtYWtl
cyBpdAo+IGRpZmZlcmVudGx5IGJyb2tlbi4KPgo+ID4gICAgICAgaW1zaWNfaXJxX2NvbXBvc2Vf
dmVjdG9yX21zZyh2ZWMsICZtc2cpOwo+ID4gLSAgICAgaXJxX2RhdGFfZ2V0X2lycV9jaGlwKGQp
LT5pcnFfd3JpdGVfbXNpX21zZyhkLCAmbXNnKTsKPiA+ICsgICAgIGlycV9jaGlwLT5pcnFfd3Jp
dGVfbXNpX21zZyhkLCAmbXNnKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBpbnQgaW1zaWNfaXJx
X3NldF9hZmZpbml0eShzdHJ1Y3QgaXJxX2RhdGEgKmQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpt
YXNrX3ZhbCwKPiA+IEBAIC0xNzMsNyArMTc3LDcgQEAgc3RhdGljIGludCBpbXNpY19pcnFfc2V0
X2FmZmluaXR5KHN0cnVjdCBpcnFfZGF0YSAqZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKm1hc2sK
PiA+ICAgICAgIC8qIE1vdmUgc3RhdGUgb2YgdGhlIG9sZCB2ZWN0b3IgdG8gdGhlIG5ldyB2ZWN0
b3IgKi8KPiA+ICAgICAgIGltc2ljX3ZlY3Rvcl9tb3ZlKG9sZF92ZWMsIG5ld192ZWMpOwo+ID4K
PiA+IC0gICAgIHJldHVybiBJUlFfU0VUX01BU0tfT0tfRE9ORTsKPiA+ICsgICAgIHJldHVybiBJ
UlFfU0VUX01BU0tfT0s7Cj4KPiBIYXZlIHlvdSBhY3R1YWxseSBsb29rZWQgYXQgdGhlIGNvbnNl
cXVlbmNlcyBvZiB0aGlzIGNoYW5nZT8KCkkgYWdyZWUuIFRoaXMgc2VlbXMgdW5yZWxhdGVkIGFu
ZCB0aGVyZSBpcyBubyBleHBsYW5hdGlvbgppbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLgoKPgo+
ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHZvaWQgaW1zaWNfaXJxX2ZvcmNlX2NvbXBsZXRlX21vdmUo
c3RydWN0IGlycV9kYXRhICpkKQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtc3RhdGUuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuYwo+ID4gaW5kZXggYjZjZWJmZWU5NDYxLi5jZDFiZjk1MTY4NzggMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiA+ICsrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ID4gQEAgLTM2Miw2ICszNjIsMTAg
QEAgc3RhdGljIGJvb2wgaW1zaWNfdmVjdG9yX21vdmVfdXBkYXRlKHN0cnVjdCBpbXNpY19sb2Nh
bF9wcml2ICpscHJpdiwKPiA+ICAgICAgIC8qIFVwZGF0ZSBlbmFibGUgYW5kIG1vdmUgZGV0YWls
cyAqLwo+ID4gICAgICAgZW5hYmxlZCA9IFJFQURfT05DRSh2ZWMtPmVuYWJsZSk7Cj4gPiAgICAg
ICBXUklURV9PTkNFKHZlYy0+ZW5hYmxlLCBuZXdfZW5hYmxlKTsKPiA+ICsKPiA+ICsgICAgIGlm
ICghY3B1X29ubGluZSh2ZWMtPmNwdSkgJiYgaXNfb2xkX3ZlYykKPiA+ICsgICAgICAgICAgICAg
Z290byBvdXQ7Cj4KPiBUaGlzIGlzIGRlZmluaXRlbHkgbm90IGNvcnJlY3QgYXMgdGhpcyBzaG91
bGQgc3RpbGwgY2xlYW51cCBzb2Z0d2FyZQo+IHN0YXRlLCBubz8KPgo+IFRoYW5rcywKPgo+ICAg
ICAgICAgdGdseAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
