Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24FEC48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 06:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycE56isk1TqlMmFS3xRkUniEsgkBVxuO2yzq4xV4FAQ=; b=hxOQbt5o8gNjgZ
	nn0YSTrPvjxIqbXWCR8Ja0xClBSNYUq2SiRbuhRRil7wZIeOlxhcMeG+ffabV0OHIr9jAJA3gSHvg
	HLAVzZqcWsSmZSW7cw6M5ZrlaqDbDozOj9De9MB9OrkzlSWDcxmeI8TuauPoxHC8vI/KeomFW9Tk9
	9ZwFyRCa5g7esZeuLP+6umw+myLVLenzm20Wj3oPNPdcAh+iQXRC8wpuv1OtK4x+i9vNnyd/grhKQ
	sieZytx2+duuezcepv6mAIAgfCr3kzuDEMUL0y+XfO+98S6T/39kzJZHEMuB7li2ZUTIX1Y7PyjZ+
	HBM40VE0ojR7QjAq1OfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZm4h-00000008695-0YTv;
	Tue, 13 Feb 2024 06:15:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZm4d-0000000867Y-3sZR
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 06:15:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d8aadc624dso29248545ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 22:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707804918; x=1708409718; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJ45qOxQygjER8m1e9kp6gKBtLTSJcN85GoQ73Py9I0=;
        b=J9v19JAPh3iWfdVSbuScqP0hwwpNORtVCzovO2M7DkbadmLjfVo467XPiOSsT1Xb8p
         eciTO/WAj0BJzLixPxInxZV6CbulrCXwg3iyr8etoxl3hdmQ37uM+XrWAuOIbPO3+uXe
         ak/HMsUSDA/G8J8JUJn0rwjFh2+O0k+uTASP1tcjWwIWMgnoW9ygSRsdwNC5rDsLKQ3g
         k6C1dSjqXXC2Mgr9RL9ts5Li43FvRgkSw2O9f+JWo6bNy5muqfMrv8t0PrqxtNEuRfnx
         BTB4RzjR/uxKDiKHYYSnplDN6LLpyql6sbKM7T1HgChXfSBroSyWAIYFPKbSGYqRihpg
         i7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707804918; x=1708409718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ45qOxQygjER8m1e9kp6gKBtLTSJcN85GoQ73Py9I0=;
        b=knwy5AAXVEHRbAUQsryE1jSejpk+Gf73p3ad0qTKOCiWgM70vytQjVKp7MfxQJpezv
         wlEBIRG1rSCNjlphqvKjEx/Wo5ItPFO8b/MLARo2f/3HvBh5Jd9BOvvgKE6pk29lFp70
         NAxKclEP9o3SFfapJDlPgrdrsh5nNjL8Tl5xzBqH4gaLW9Hpq6/JGPgGTBex/noxFoXY
         cW7aTP45HItBRicFnLgiBRdKNg3Sf2eACBqiPcLyF41Gxje8ApBEE2iU4yNox9oYp4RK
         SsBUCTVsXiw6e5YjDrMAVwVb/oVkrOEHkxonGMeWP8ySWxPLmRYZ7Ofc5YpoETGE7W16
         fCog==
X-Forwarded-Encrypted: i=1; AJvYcCVyC66myPBdM9/RKGbvq2YyJ76z4XWQIr0i14oepYcoYMphMQrV/vnRRa5r+wu4PAops2RRNjBvSkO9VMRKI7B0ruYI18H2fWQeWLUzGkgg
X-Gm-Message-State: AOJu0YxV4WvDzUNuddpiw521sQUKGg/Ad1EEHWmIWzSF63UOKx4arbNL
	O7/o/ZzOXoQ491HAGdXsE1kicVtmviP7DmJYmzz7SkN/0qfDrpIB+4zoAmvC+mM=
X-Google-Smtp-Source: AGHT+IGUi3DzFtU5GCBI3jPrDosrmH0laHEfMHGNSX3/jONnrMeRzSaScuSFaMYurZ9SbwCiek8r+w==
X-Received: by 2002:a17:903:442:b0:1da:2c11:54af with SMTP id iw2-20020a170903044200b001da2c1154afmr4125403plb.63.1707804918640;
        Mon, 12 Feb 2024 22:15:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6p0I8t3iGuopuoBs6axX29J/x4aeFiOGMbt+F2tIsk5b7fad2JT8DgSpKvC0GKCuZaUqRzJOZ05Rdn7G9wy3AXz7OtJ5QpF7fdp09Ikx5EO4EzWLiTdm85xRhNJ5Sr/NgmyrivZmVvzG4i7h1pw2A3PVwh+XDuZORnVC+b9JFmAZn8JyAqjcv8ImGBFkdGN8wK7gEk1vpjJWOFZXZnR+FdWBJDb2PhzwvhjkXhpqIwT1Fi008FFS0253FdcI53uvsGrwP0gHPryoX3JEZtD1d0WMnljvwRaZyMeJKJaodWeisbRgCWe5R7phEZpsuYs0i5m32OS7jnH3p8iC+YrQ7IxpVqojA2WCKUe0/1bwN7WaC0eRGKMi5HuDsnPsbDFTeqP5p/lSRBHiKGQ0J2N4evDuhAeqUzzlRve8uXkm+8CYWqjv2Zwlkb1DfrqhizMhactkAICRceS0+IA==
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id jv13-20020a170903058d00b001da0ce93890sm1302529plb.152.2024.02.12.22.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 22:15:18 -0800 (PST)
Date: Tue, 13 Feb 2024 11:45:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <20240213061516.kbvwdyabw2p6egwr@vireshk-i7>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <CAJZ5v0iwV4mG40hbhomrTgiUoUpn_ocNH_5K84yseSpsZtviVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iwV4mG40hbhomrTgiUoUpn_ocNH_5K84yseSpsZtviVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_221520_173420_BED8BD9A 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish Kumar Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTItMDItMjQsIDE2OjI0LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiBPbiBUaHUsIEZl
YiA4LCAyMDI0IGF0IDQ6NDTigK9BTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgc3VwcG9ydCBmb3IgIkNv
bGxhYm9yYXRpdmUgUHJvY2Vzc29yIFBlcmZvcm1hbmNlCj4gPiBDb250cm9sIChDUFBDKSBvbiBB
Q1BJIGJhc2VkIFJJU0MtViBwbGF0Zm9ybXMuIEl0IGRlcGVuZHMgb24gdGhlCj4gPiBlbmNvZGlu
ZyBvZiBDUFBDIHJlZ2lzdGVycyBhcyBkZWZpbmVkIGluIFJJU0MtViBGRkggc3BlYyBbMl0uCj4g
Pgo+ID4gQ1BQQyBpcyBkZXNjcmliZWQgaW4gdGhlIEFDUEkgc3BlYyBbMV0uIFJJU0MtViBGRkgg
c3BlYyByZXF1aXJlZCB0bwo+ID4gZW5hYmxlIHRoaXMsIGlzIGF2YWlsYWJsZSBhdCBbMl0uCj4g
Pgo+ID4gWzFdIC0gaHR0cHM6Ly91ZWZpLm9yZy9zcGVjcy9BQ1BJLzYuNS8wOF9Qcm9jZXNzb3Jf
Q29uZmlndXJhdGlvbl9hbmRfQ29udHJvbC5odG1sI2NvbGxhYm9yYXRpdmUtcHJvY2Vzc29yLXBl
cmZvcm1hbmNlLWNvbnRyb2wKPiA+IFsyXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24t
aXNhL3Jpc2N2LWFjcGktZmZoL3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAuMC9yaXNjdi1mZmgucGRm
Cj4gPgo+ID4gVGhlIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgTFBJIHN1cHBvcnQgc2VyaWVzLgo+
ID4gQmFzZWQtb246IDIwMjQwMTE4MDYyOTMwLjI0NTkzNy0xLXN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbQo+ID4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAxMTgwNjI5MzAuMjQ1
OTM3LTEtc3VuaWx2bEB2ZW50YW5hbWljcm8uY29tLykKPiA+Cj4gPiBTdW5pbCBWIEwgKDMpOgo+
ID4gICBBQ1BJOiBSSVNDLVY6IEFkZCBDUFBDIGRyaXZlcgo+ID4gICBjcHVmcmVxOiBNb3ZlIENQ
UEMgY29uZmlncyB0byBjb21tb24gS2NvbmZpZyBhbmQgYWRkIFJJU0MtVgo+ID4gICBSSVNDLVY6
IGRlZmNvbmZpZzogRW5hYmxlIENPTkZJR19BQ1BJX0NQUENfQ1BVRlJFUQo+ID4KPiA+ICBhcmNo
L3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIHwgICAxICsKPiA+ICBkcml2ZXJzL2FjcGkvcmlzY3Yv
TWFrZWZpbGUgIHwgICAxICsKPiA+ICBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jICAgIHwgMTU3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9jcHVmcmVx
L0tjb25maWcgICAgICB8ICAyOSArKysrKysrCj4gPiAgZHJpdmVycy9jcHVmcmVxL0tjb25maWcu
YXJtICB8ICAyNiAtLS0tLS0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE4OCBpbnNlcnRpb25zKCsp
LCAyNiBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9hY3BpL3Jp
c2N2L2NwcGMuYwo+ID4KPiA+IC0tCj4gCj4gVGhpcyBpcyBmaW5lIHdpdGggbWUsIHNvCj4gCj4g
QWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4KPiAKPiBhbmQg
aXQgd291bGQgYmUgZ29vZCB0byBhc2sgVmlyZXNoICh3aG8gbWFpbnRhaW5zIHRoZSBDUFBDIGNw
dWZyZXEKPiBkcml2ZXIpIGZvciBhbiBBQ0suCgpJIGhhdmUgcHJvdmlkZWQgbXkgQWNrIG92ZXIg
dGhlIGNwdWZyZXEgcGF0Y2guIFRoYW5rcy4KCi0tIAp2aXJlc2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
