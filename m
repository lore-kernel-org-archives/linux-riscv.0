Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB691C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xld7mpY+sj/rpBKEmz7K+gIdwteJGvzUzUB0GxtyiF0=; b=hpfwLDzNGc9GZd
	dEmOMWXBxft8mjTpiDQZhAj7JmtndTKVLn2WSYIHhjXaySEC3a1PYqjXlhumYK1uvcPgr+qZO6a1i
	Voc42lMvKjHq2zwnTTcIE8kwpAwBSMDcKzEfkTxKrXeMNLrj8gUSWyprFt//c4zAU2mZijWDMbhmM
	F9/5sLMED/7OeSu9kHyJimmz1JyVBh2WLYZvQp2H4E6D7bYvSzxDhGYOZ586CSuT6Mj43zy01iU30
	J1LlnVTL3vs3nKcxEoBOO92IMUVUqmp+raj7W8ma54909Raqb9q0gaBbLYlih/aCA9jAw7w5Vs1F2
	SCaWo9wLfx4fQCs6cm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqbB-00000003gQx-02Hg;
	Tue, 13 Aug 2024 12:26:01 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqb7-00000003gQ5-17LT
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 12:25:58 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-37636c3872bso24275005ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1723551955; x=1724156755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlpsPbvSqY1Guepb/+C8Hj4r/YthyFNML6v64qjLHgQ=;
        b=NZk6jUBCGMK25SN6+1oJyRKSoTal78Ip+ppedgDtDg0tT/oAqkow/6uWDmu7i/ckrc
         fN5v5pq8NXlUIJARf8ia3jv8IJ6MxnQrMGQ5ipAP9hQ4OKquSjvypO2urKWgjt2jygt/
         qX6SrHzeMN2UHVUAvBgf/2CRry5pdfxIhtEhdVCX8qV1+Nby8plfjsKmMOyLaCIxEQ6m
         42XIX3L/IUPbjUvLO3IGahkImiNfTGGYwtrsmixYv9mOu/xOYncI+oc6WTgFAMWIKUCF
         /ftf8UAgH98EbiS5V+Lfywmdmnj8AYe2YxG0N8JQ6erw8ua/86uKtzkikFuZrMg0HfdB
         baZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551955; x=1724156755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlpsPbvSqY1Guepb/+C8Hj4r/YthyFNML6v64qjLHgQ=;
        b=mNuxxnolpz6DPVxmoT6ZPs5T7vPMxeuGawt5dtjn50Hjdzg7s2RDKce8YKiOlnOPf3
         aCw+tfbWzAqN8myrVH8xjcMmttE+YGviPtZnBszr9ebn+gK6rjLmNWBZHvPEF5Sy+ASp
         2rT9YsRQE/4UX2mgE4eLfPzSB+NJeLJEjbuFvSmxsgYZPK4JmNSGo1+VxKM2c1uqZ5/a
         3GPOd2dQJcyupbpIHAScSL8yuQOrUg+GIX1BSVmpopjpzjAiT/GzkFy5Y5Jt1OWA4K6W
         tMF3/k7C1RX0OB97s4EO2n5M4uVdY5tph87wP8hN5vnkue8NutjgMbIxkA8WtF5IUZdf
         shew==
X-Forwarded-Encrypted: i=1; AJvYcCUMf3IXIK+sfsGmijdN5HVGRYxPj9jm66vTypduBdFxEKNf8L1AUvkiqkdOraJzs8Z2BM3EGjanyYbqxAzRRwN38c5ZX2C+Gj2ZoawcbPj1
X-Gm-Message-State: AOJu0YyJKXGIrKPFLqa5zTCragaxCBfhRL+3S9ew7hqJrCJye9hSgxCg
	2Qb0YqLdzJd4jAX7MuVoyQoyqTpwVdcl9c4b6NOUV0fm3B8BNrO0ypmbnonjfZCOeMeJNhI4n4g
	Nc0CcvI9j0Z0DNJN4z8JCbypGhQzBweaQa2nUGQ==
X-Google-Smtp-Source: AGHT+IGfc1hlnSw9m1j0prPgIWYWO3SpEZp9zrnyAvAWqBu+fTcn7+WZsmM/0bL31M4eersVd96dOZoC9Kz1EGd0ycA=
X-Received: by 2002:a05:6e02:1fce:b0:375:c473:4a78 with SMTP id
 e9e14a558f8ab-39c478f783emr40305315ab.23.1723551955377; Tue, 13 Aug 2024
 05:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240813081324.3205944-1-nick.hu@sifive.com>
In-Reply-To: <20240813081324.3205944-1-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Aug 2024 17:55:44 +0530
Message-ID: <CAAhSdy0W5mSVp79dF63BJkDCE_tMxrxWOxqwaTHghztX6dEm2w@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Allow cpuidle pd used by other devices
To: Nick Hu <nick.hu@sifive.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_052557_539598_A1EE8CAD 
X-CRM114-Status: GOOD (  25.51  )
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

T24gVHVlLCBBdWcgMTMsIDIwMjQgYXQgMTo0M+KAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBUbyBwcmV2ZW50IHRoZSBwcm9iZSBvZiBjb25zdW1lciBkZXZpY2Vz
IGJlaW5nIGRlZmVycmVkLCBjcmVhdGUgdGhlCj4gcGxhdGZvcm0gZGV2aWNlcyBmb3IgZWFjaCBw
ZCBub2RlIHVuZGVyICcvY3B1cy9wb3dlci1kb21haW5zJyBhbmQgbW92ZSB0aGUKPiBkcml2ZXIg
aW5pdGFpbGl6YXRpb24gdG8gdGhlIGFyY2hfaW5pdGNhbGwuCgpUbyBwcmV2ZW50IHRoZSBwcm9i
ZSBkZWZlcnJhbCBvZiBjb25zdW1lciBkZXZpY2VzLCB5b3UgY2FuIHNpbXBseSB1c2UKZndub2Rl
X2Rldl9pbml0aWFsaXplZCgpIGluc3RlYWQgb2YgY3JlYXRpbmcgYSBkdW1teSBwbGF0Zm9ybSBk
ZXZpY2UuCgo+IFRoZSBjb25zdW1lciBkZXZpY2VzIHRoYXQgaW5zaWRlIHRoZSBjcHUvY2x1c3Rl
ciBwb3dlciBkb21haW4gbWF5IHJlZ2lzdGVyCj4gdGhlIGdlbnBkIG5vdGlmaWVyIHdoZXJlIHRo
ZWlyIHBvd2VyIGRvbWFpbnMgYXJlIHBvaW50IHRvIHRoZSBwZCBub2Rlcwo+IHVuZGVyICcvY3B1
cy9wb3dlci1kb21haW5zJy4gSWYgdGhlIGNwdWlkbGUub2ZmPT0xLCB0aGUgZ2VucGQgbm90aWZp
ZXIKPiB3aWxsIGZhaWwgZHVlIHRvIHNiaV9jcHVpZGxlX3BkX2FsbG93X2RvbWFpbl9zdGF0ZSBp
cyBub3Qgc2V0LiBXZSBhbHNvCj4gbmVlZCB0aGUgc2JpX2NwdWlkbGVfY3B1aHBfdXAvZG93biB0
byBpbnZva2UgdGhlIGNhbGxiYWNrcy4gVGhlcmVmb3JlLAo+IGFkZCBhIGNwdWlkbGVfZGlzYWJs
ZWQoKSBjaGVjayBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGNwdWlkbGUgZHJpdmVyIHRvCj4gYWRk
cmVzcyB0aGUgaXNzdWUuCgpJIHRoaW5rIGRlYWxpbmcgd2l0aCBjcHVpZGxlLm9mZj09MSBjYXNl
IHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgoKPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUg
PG5pY2suaHVAc2lmaXZlLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjQwMjI2MDY1MTEzLjE2OTA1MzQtMS1uaWNrLmh1QHNpZml2ZS5jb20vCj4gU3VnZ2VzdGVk
LWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgYi9kcml2
ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IGluZGV4IGE2ZTEyM2RmZTM5NC4uZDZi
MDFmYzY0Zjk0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNi
aS5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiBAQCAtMTYs
NiArMTYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9v
Zl9wbGF0Zm9ybS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbV9kb21haW4uaD4KPiBA
QCAtMjUsNiArMjYsNyBAQAo+ICAjaW5jbHVkZSA8YXNtL3NtcC5oPgo+ICAjaW5jbHVkZSA8YXNt
L3N1c3BlbmQuaD4KPgo+ICsjaW5jbHVkZSAiY3B1aWRsZS5oIgo+ICAjaW5jbHVkZSAiZHRfaWRs
ZV9zdGF0ZXMuaCIKPiAgI2luY2x1ZGUgImR0X2lkbGVfZ2VucGQuaCIKPgo+IEBAIC0zMzYsNiAr
MzM4LDkgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9pbml0X2NwdShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIGludCBjcHUpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4K
PiArICAgICAgIGlmIChjcHVpZGxlX2Rpc2FibGVkKCkpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ICsKPiAgICAgICAgIHJldCA9IGNwdWlkbGVfcmVnaXN0ZXIoZHJ2LCBOVUxMKTsKPiAg
ICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZGVpbml0Owo+IEBAIC0zODAs
MjAgKzM4NSwyNiBAQCBzdGF0aWMgaW50IHNiaV9jcHVpZGxlX3BkX3Bvd2VyX29mZihzdHJ1Y3Qg
Z2VuZXJpY19wbV9kb21haW4gKnBkKQo+ICBzdHJ1Y3Qgc2JpX3BkX3Byb3ZpZGVyIHsKPiAgICAg
ICAgIHN0cnVjdCBsaXN0X2hlYWQgbGluazsKPiAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZTsKPiArICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4gIH07Cj4KPiAg
c3RhdGljIExJU1RfSEVBRChzYmlfcGRfcHJvdmlkZXJzKTsKPgo+ICBzdGF0aWMgaW50IHNiaV9w
ZF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gIHsKPiArICAgICAgIHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXY7Cj4gICAgICAgICBzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKnBk
Owo+ICAgICAgICAgc3RydWN0IHNiaV9wZF9wcm92aWRlciAqcGRfcHJvdmlkZXI7Cj4gICAgICAg
ICBzdHJ1Y3QgZGV2X3Bvd2VyX2dvdmVybm9yICpwZF9nb3Y7Cj4gICAgICAgICBpbnQgcmV0ID0g
LUVOT01FTTsKPgo+ICsgICAgICAgcGRldiA9IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobnAs
IG5wLT5uYW1lLCBOVUxMKTsKPiArICAgICAgIGlmICghcGRldikKPiArICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4gKwo+ICAgICAgICAgcGQgPSBkdF9pZGxlX3BkX2FsbG9jKG5wLCBzYmlfZHRf
cGFyc2Vfc3RhdGVfbm9kZSk7Cj4gICAgICAgICBpZiAoIXBkKQo+IC0gICAgICAgICAgICAgICBn
b3RvIG91dDsKPiArICAgICAgICAgICAgICAgZ290byBmcmVlX3BkZXY7Cj4KPiAgICAgICAgIHBk
X3Byb3ZpZGVyID0ga3phbGxvYyhzaXplb2YoKnBkX3Byb3ZpZGVyKSwgR0ZQX0tFUk5FTCk7Cj4g
ICAgICAgICBpZiAoIXBkX3Byb3ZpZGVyKQo+IEBAIC00MTksNiArNDMwLDcgQEAgc3RhdGljIGlu
dCBzYmlfcGRfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICAgICAgICAgICAgICAgICBn
b3RvIHJlbW92ZV9wZDsKPgo+ICAgICAgICAgcGRfcHJvdmlkZXItPm5vZGUgPSBvZl9ub2RlX2dl
dChucCk7Cj4gKyAgICAgICBwZF9wcm92aWRlci0+cGRldiA9IHBkZXY7Cj4gICAgICAgICBsaXN0
X2FkZCgmcGRfcHJvdmlkZXItPmxpbmssICZzYmlfcGRfcHJvdmlkZXJzKTsKPgo+ICAgICAgICAg
cHJfZGVidWcoImluaXQgUE0gZG9tYWluICVzXG4iLCBwZC0+bmFtZSk7Cj4gQEAgLTQzMCw2ICs0
NDIsOCBAQCBzdGF0aWMgaW50IHNiaV9wZF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4g
ICAgICAgICBrZnJlZShwZF9wcm92aWRlcik7Cj4gIGZyZWVfcGQ6Cj4gICAgICAgICBkdF9pZGxl
X3BkX2ZyZWUocGQpOwo+ICtmcmVlX3BkZXY6Cj4gKyAgICAgICBvZl9wbGF0Zm9ybV9kZXZpY2Vf
ZGVzdHJveSgmcGRldi0+ZGV2LCBOVUxMKTsKPiAgb3V0Ogo+ICAgICAgICAgcHJfZXJyKCJmYWls
ZWQgdG8gaW5pdCBQTSBkb21haW4gcmV0PSVkICVwT0ZcbiIsIHJldCwgbnApOwo+ICAgICAgICAg
cmV0dXJuIHJldDsKPiBAQCAtNDQ3LDYgKzQ2MSw3IEBAIHN0YXRpYyB2b2lkIHNiaV9wZF9yZW1v
dmUodm9pZCkKPiAgICAgICAgICAgICAgICAgaWYgKCFJU19FUlIoZ2VucGQpKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGtmcmVlKGdlbnBkKTsKPgo+ICsgICAgICAgICAgICAgICBvZl9wbGF0
Zm9ybV9kZXZpY2VfZGVzdHJveSgmcGRfcHJvdmlkZXItPnBkZXYtPmRldiwgTlVMTCk7Cj4gICAg
ICAgICAgICAgICAgIG9mX25vZGVfcHV0KHBkX3Byb3ZpZGVyLT5ub2RlKTsKPiAgICAgICAgICAg
ICAgICAgbGlzdF9kZWwoJnBkX3Byb3ZpZGVyLT5saW5rKTsKPiAgICAgICAgICAgICAgICAga2Zy
ZWUocGRfcHJvdmlkZXIpOwo+IEBAIC01NDgsNyArNTYzLDEwIEBAIHN0YXRpYyBpbnQgc2JpX2Nw
dWlkbGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIC8qIFNl
dHVwIENQVSBob3RwbHV0IG5vdGlmaWVycyAqLwo+ICAgICAgICAgc2JpX2lkbGVfaW5pdF9jcHVo
cCgpOwo+Cj4gLSAgICAgICBwcl9pbmZvKCJpZGxlIGRyaXZlciByZWdpc3RlcmVkIGZvciBhbGwg
Q1BVc1xuIik7Cj4gKyAgICAgICBpZiAoY3B1aWRsZV9kaXNhYmxlZCgpKQo+ICsgICAgICAgICAg
ICAgICBwcl9pbmZvKCJjcHVpZGxlIGlzIGRpc2FibGVkXG4iKTsKPiArICAgICAgIGVsc2UKPiAr
ICAgICAgICAgICAgICAgcHJfaW5mbygiaWRsZSBkcml2ZXIgcmVnaXN0ZXJlZCBmb3IgYWxsIENQ
VXNcbiIpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPgo+IEBAIC01OTIsNCArNjEwLDQgQEAgc3Rh
dGljIGludCBfX2luaXQgc2JpX2NwdWlkbGVfaW5pdCh2b2lkKQo+Cj4gICAgICAgICByZXR1cm4g
MDsKPiAgfQo+IC1kZXZpY2VfaW5pdGNhbGwoc2JpX2NwdWlkbGVfaW5pdCk7Cj4gK2FyY2hfaW5p
dGNhbGwoc2JpX2NwdWlkbGVfaW5pdCk7Cj4gLS0KPiAyLjM0LjEKPgoKUmVnYXJkcywKQW51cAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
