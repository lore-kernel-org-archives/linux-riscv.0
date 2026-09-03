Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680DCC624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXbP/Kgig7ZNNC8rnKvK+JBIhB+QMYm2/qpbGvCHSFM=; b=FNYTL3qmOQy5bI
	5mRP8kakZ+aLtuOJcvSnxxQ/sfnXx2bPLpEb1PiCZmZnDHZ22AeVdZoyiiQEzTi9BSOtg49M9K6vr
	JE2urW1XJmcKGsxDIxTCIl877LOBKBPcAqtqGERtl0diJbEvQ18Bv/RtH52GI5qW+Bu4LCI3kst4t
	YUbmIH+N7EWjMh++DKVLTN5y13YKexlZeggai81WzFbW6S6+6WlyV1UGEoUxa59GKCHY2tVad35ny
	606lTDS77GNzGo9NekasV8EjI4eqCYNV2EU4ysy4oshxH5q8E3LLUQ0eGz52ee4N38W+UEqVPOV0Z
	ezcKiL+iIyQwIHPc11oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zck-0000000GMUI-1yRL;
	Thu, 03 Sep 2026 05:04:30 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zci-0000000GMTk-2zM9
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 05:04:29 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52e843c64b8so75281cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 22:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788411866; cv=none;
        d=google.com; s=arc-20260327;
        b=Rvbb19/XP9DBJr37Xfm038BLUR98EIT9Lb5uXAG9yMeUkzxJzaqzMY4la5vn3GcHr5
         YUTaG5NTMlbwMv0KSj3CnXkK5Q8BiRXFk7l+aZTmn50k+qKcFHb9GCTgue8GOSV/0rW5
         mjdg9ztOGovd5Ij0/BOCtxl1gHQ5+4jcGQ18ZZz9CG/aZbynECQzHy0UQJpuvlfppAJS
         dY+lk5nOTBISOFVpvLfnmMI/4UoRfuOGMuf6TmETlJTswkbGp4p9G6QP0oEq3ITXGEn6
         BuLfp93C2F+qyrO41G9WNftkfb7FEfYl8XcqZXKd0EUXTWE65MVYN+1c5WtaOfVPBWBB
         z8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KPklHbxXeJDxNdoiQqefpW644DYAeavucLCni6Pnx4I=;
        fh=B+8LZ7hBWpGkRC//bwLiyycFWZzleobGHnAUl+gDwSg=;
        b=nz7UeOa4iyl3yck+Drref+0xXc8o8C2LnFoUMs1NXSUEYYPaPTg6UK1dPNp2bcNMU5
         bUC0AWJlNGHmyikUDgmbMeuIj7wuT9+PyqCHTCrjQdExD/a18nGtO5Md84czDxVbHSWv
         AhBKpkjs8cTiJvihhb+5jYlKNN3Koe3SUF2X1z/yU+X76D60Re3Z+CUx7FzjtJk6Et7I
         uddHPKbtn6MjxBZv/rez14/YIO9u8zRJ7cYsfzTXJhH4PrwLRs1P1EXZ4N4Db2rmEQWF
         TTlE9pvEo7/nLPnYyu6y/NTzWL6Yf0XqgQ8Q4TXCz8m4hi61V1+M2s605zjTM+Ch9w5O
         sBOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788411866; x=1789016666; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KPklHbxXeJDxNdoiQqefpW644DYAeavucLCni6Pnx4I=;
        b=H4juQaOSWEZrRR2j6eG+k1ii0KxXWervLPYmkKnXrs4BPpQbaElN8uNOeVHNu7PP3Q
         NG50XiEJ9KDrI8tzL1me/GkiaRqYiL6N4C65wnR2ULaHOCChixXaWmFgd7q5IAVKxb8R
         mpJ3qEW58h3HCN/YefRuHWjqWHdGqlgh1oEKcSolSadzPpuH9Sv3mrHxHYffmcEhucMc
         vKzB/L0zxZgK9GHJkJS/WSSt5bwLL3V8XspsT+RcG75t3PHB+dm07nDZUBSKjMXb9FAr
         f7quBEPOJuplXE4L2gqNC5ml6W/3VBjZwHimxGQhickK5V61357kDSJ6bI/XTYdu2At8
         q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411866; x=1789016666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPklHbxXeJDxNdoiQqefpW644DYAeavucLCni6Pnx4I=;
        b=AMNAj7k1Qu3CUrW3X8VKjApcn4NWrPvZgJF4S3IS3skiLh+GyIGoDC1sTnpPTlqc7f
         wS2fRGsi8BNv433Ea43w7k+HkinQoXYfbIYzwCLwAgcK8NtZ61i26bb15rENHqoTUw4v
         HE/+1ppsIfm/vhgawuhp1yIwm6Hm+LUCtf7MFhFUr9sH2hCxK+AjgGRJodCs7ebLnCZP
         La1J8B71z2SZoah55B2MVnSXfyPLaKgnNXVm0wkrLRRbEu9Xu71FSTLoWBY7yWoMn5zs
         ny5Rw7+zO98MiLrcfnXzvLjLrWSx6FEMBRc2xGQkrjBr5F0mOCYuKYWBRcvRGzL+y1HL
         wRQA==
X-Forwarded-Encrypted: i=1; AKwUvBxMdvM3UTSp7qvS4acPCCo7wgHnkTf+9hoCP0GS7omupz1BzortoulOWemolWh6lIzYzQ9AFz5b+jFTdg==@lists.infradead.org
X-Gm-Message-State: AFuF++lTAaYs/30btnMOezjknHdONPdhymC9aItABPlzwAO2JQMV4vSx
	9/DAhW5EzVKpByqzGqUTlrHvrcR+VRdWTEMYPSRMt26lVOCgftQO3wvphcbMEhLAIuBfxzOMqmQ
	hVGSEwEIUf859wmHfGUfRK3Epd1fm6NGpzBIdM4ek
X-Gm-Gg: AYBFou3ANqYMElh4IlgXbW4bTz15cSrssoIeXUb9To2/a+X5l8+i1hDQaQtPGphrPU8
	BDD92OTKub2tcmf5Mn2PqIihv8aYcDUcZNWb58x7/YnwXjjEu4CrcHTMg5ay1xWTqDH3dns4D/4
	4mUtRYCVvQzCJ9oMIq9/HTrlbZbri/esWZQXehZV4BZPrAYG8u5W3vl4EuQa+u6i6l/K8z4UchK
	+TSUiakRZ/LmXQGiMImmVUup34tHrHodZ+O9ZTkXjLVgoQvzVUo8aqU/vtvm27GsXMf7+9HGtyC
	euWh3D/Cs78IfP/kj7E6lwD6kBj6/DSPMsxzk98xiCM/rg==
X-Received: by 2002:a05:622a:a0c:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-53045879fdamr7780491cf.11.1788411865734; Wed, 02 Sep 2026
 22:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260902093210.3571958-1-nylon.chen@sifive.com>
In-Reply-To: <20260902093210.3571958-1-nylon.chen@sifive.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Sep 2026 22:04:14 -0700
X-Gm-Features: AcwNN1WOa23S96LNVp309j3VaLFfZ9MpfJyynTE8hrogcm-8TGXhXoba-fFjNmc
Message-ID: <CAP-5=fUzqFPfN+xH8uqERugK9xsauUoxZTVr+YLGGXVRi6UC9w@mail.gmail.com>
Subject: Re: [PATCH] perf bench futex: Define SYS_futex on 32-bit arches with
 64-bit time_t
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_220428_765290_A3A54ABC 
X-CRM114-Status: GOOD (  27.09  )
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

T24gV2VkLCBTZXAgMiwgMjAyNiBhdCAyOjMy4oCvQU0gTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBz
aWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBrZXJuZWwgZG9lcyBub3QgcHJvdmlkZSBzeXNfZnV0
ZXgoKSBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyB0aGF0IGxhY2sKPiBhIDMyLWJpdCB0aW1lIHJl
cHJlc2VudGF0aW9uLCBzdWNoIGFzIHJpc2N2MzIuIENvbnNlcXVlbnRseSBnbGliYyBkb2VzIG5v
dAo+IGRlZmluZSBTWVNfZnV0ZXggdGhlcmUsIG9ubHkgU1lTX2Z1dGV4X3RpbWU2NCwgYW5kIHBl
cmYgYmVuY2gncyBmdXRleAo+IGJlbmNobWFya3MgZmFpbCB0byBidWlsZDoKPgo+ICAgYmVuY2gv
ZnV0ZXguaDogSW4gZnVuY3Rpb24gJ2Z1dGV4X3N5c2NhbGwnOgo+ICAgYmVuY2gvZnV0ZXguaDo3
NzoxODogZXJyb3I6ICdTWVNfZnV0ZXgnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKQo+Cj4gRGVmaW5lIFNZU19mdXRleCBhcyBTWVNfZnV0ZXhfdGltZTY0IHdoZW4gb25s
eSB0aGUgbGF0dGVyIGlzIGF2YWlsYWJsZS4KPiBUaGUgZ3VhcmQgYW5kIGl0cyBjb21tZW50IGFy
ZSB0YWtlbiB2ZXJiYXRpbSBmcm9tCj4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnV0ZXgvaW5j
bHVkZS9mdXRleHRlc3QuaCwgd2hlcmUgdGhleSB3ZXJlIGFkZGVkIGJ5Cj4gY29tbWl0IDA0ODUw
ODE5YzY1YyAoInNlbGZ0ZXN0cy9mdXRleDogRGVmaW5lIFNZU19mdXRleCBvbiAzMi1iaXQKPiBh
cmNoaXRlY3R1cmVzIHdpdGggNjQtYml0IHRpbWVfdCIpLCBrZWVwaW5nIHRoZSB0d28gZnV0ZXgg
dXNlcnNwYWNlIGhlYWRlcnMKPiBpbiBzeW5jLgo+Cj4gTm8gdGltZXNwZWMgY29udmVyc2lvbiBo
ZWxwZXIgaXMgbmVlZGVkIG9uIHRvcCBvZiB0aGlzLiBnbGliYyBsYXlzIG91dAo+IHN0cnVjdCB0
aW1lc3BlYyBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyB3aXRoIDY0LWJpdCB0aW1lX3QgYXMKPiB7
IGludDY0IHR2X3NlYzsgaW50MzIgdHZfbnNlYzsgMzItYml0IHBhZCB9LCB3aGljaCBpcyBjb21w
YXRpYmxlIHdpdGgKPiBzdHJ1Y3QgX19rZXJuZWxfdGltZXNwZWMsIGFuZCBldmVyeSBmdXRleF93
YWl0KCkvZnV0ZXhfbG9ja19waSgpLwo+IGZ1dGV4X3dhaXRfcmVxdWV1ZV9waSgpIGNhbGwgc2l0
ZSBpbiBwZXJmIGJlbmNoIHBhc3NlcyBhIE5VTEwgdGltZW91dAo+IGFueXdheSwgc28gbm8gdGlt
ZXNwZWMgZXZlciBjcm9zc2VzIHRoZSBzeXNjYWxsIGJvdW5kYXJ5IGhlcmUuCj4KPiBOb3RlIHRo
YXQgYW4gZWFybGllciBhbmQgbW9yZSBhbWJpdGlvdXMgYXR0ZW1wdCBhdCB0aGlzIHdhcwo+IGNv
bW1pdCBjMWZmMTJkYWM0NjUgKCJwZXJmIGJlbmNoIGZ1dGV4OiBBZGQgc3VwcG9ydCBmb3IgMzIt
Yml0IHN5c3RlbXMKPiB3aXRoIDY0LWJpdCB0aW1lX3QiKSwgcmV2ZXJ0ZWQgYnkKPiBjb21taXQg
YmE0MDI2YjA5ZDgzICgiUmV2ZXJ0ICJwZXJmIGJlbmNoIGZ1dGV4OiBBZGQgc3VwcG9ydCBmb3Ig
MzItYml0Cj4gc3lzdGVtcyB3aXRoIDY0LWJpdCB0aW1lX3QiIikgYmVjYXVzZSBpdCBpbmNsdWRl
ZCBsaW51eC90aW1lX3R5cGVzLmgsCj4gd2hpY2ggaXMgdW5hdmFpbGFibGUgb24gb2xkZXIgZGlz
dHJpYnV0aW9ucy4gVGhpcyBjaGFuZ2UgZGVsaWJlcmF0ZWx5Cj4gYXZvaWRzIHRoYXQgZGVwZW5k
ZW5jeSBhbmQgYWRkcyBvbmx5IHRoZSBvbmUgZ3VhcmQgbmVlZGVkIHRvIGZpeAo+IGNvbXBpbGF0
aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29t
PgoKUmV2aWV3ZWQtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KClRoYW5rcywK
SWFuCgo+IC0tLQo+ICB0b29scy9wZXJmL2JlbmNoL2Z1dGV4LmggfCAxMSArKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvYmVuY2gvZnV0ZXguaCBiL3Rvb2xzL3BlcmYvYmVuY2gvZnV0ZXguaAo+IGluZGV4IGZj
YjcyZDY4MmNmOC4uNmRmODgzN2IzNjViIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvYmVuY2gv
ZnV0ZXguaAo+ICsrKyBiL3Rvb2xzL3BlcmYvYmVuY2gvZnV0ZXguaAo+IEBAIC0xNCw2ICsxNCwx
NyBAQAo+ICAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9mdXRleC5o
Pgo+Cj4gKy8qCj4gKyAqIFNZU19mdXRleCBpcyBleHBlY3RlZCBmcm9tIHN5c3RlbSBDIGxpYnJh
cnksIGluIGdsaWJjIHNvbWUgMzItYml0Cj4gKyAqIGFyY2hpdGVjdHVyZXMgKGUuZy4gUlYzMikg
YXJlIHVzaW5nIDY0LWJpdCB0aW1lX3QsIHRoZXJlZm9yZSBpdCBkb2Vzbid0IGhhdmUKPiArICog
U1lTX2Z1dGV4IGRlZmluZWQgYnV0IGp1c3QgU1lTX2Z1dGV4X3RpbWU2NC4gRGVmaW5lIFNZU19m
dXRleCBhcwo+ICsgKiBTWVNfZnV0ZXhfdGltZTY0IGluIHRoaXMgc2l0dWF0aW9uIHRvIGVuc3Vy
ZSB0aGUgY29tcGlsYXRpb24gYW5kIHRoZQo+ICsgKiBjb21wYXRpYmlsaXR5Lgo+ICsgKi8KPiAr
I2lmICFkZWZpbmVkKFNZU19mdXRleCkgJiYgZGVmaW5lZChTWVNfZnV0ZXhfdGltZTY0KQo+ICsj
ZGVmaW5lIFNZU19mdXRleCBTWVNfZnV0ZXhfdGltZTY0Cj4gKyNlbmRpZgo+ICsKPiAgc3RydWN0
IGJlbmNoX2Z1dGV4X3BhcmFtZXRlcnMgewo+ICAgICAgICAgYm9vbCBzaWxlbnQ7Cj4gICAgICAg
ICBib29sIGZzaGFyZWQ7Cj4KPiBiYXNlLWNvbW1pdDogNjY0OThjNzViNGY4MDE3ZjYyZDcyMGQ5
YjU5Njc1YmRmM2FiY2U5MQo+IC0tCj4gMi40My43Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
