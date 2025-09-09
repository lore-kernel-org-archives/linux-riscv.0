Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49235CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=midOo2XWa2VbQGE2q3F6Usn8k0JpGgYeRRrq4WfgVys=; b=qURSKx90pLpk85
	viUjVHLzjbRv5ar+wRJ9ejMCbS3kQIlm1w3hubbekVxApYZSvEn1SVfRZGhWOc9DV6nCEU4id+eKv
	rLxH1ih+HyVXLdJLjdyoc1NhV624AK3hAj+P5do/75LfktdDkEb5eFM2S80KJtesaVX1M1b5ta9Cr
	60+OZ5bhUD0RIIiBUHU87VP4tjU2FSAep2lF7VX4ydUdI8ICqJFZ6u6ERrfa11zw8nZ7I8RWQSCGQ
	HPeGdqici3lWZP2oQ5HR/OhmQaVMtCt2NECCj5UGW1h1XPtZYjDd6Burh9AUAaaUg+JnRnmTYYG7f
	DM7YCFcpSWtaN6A18f8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0nY-00000008NgG-2cX3;
	Tue, 09 Sep 2025 16:02:24 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy9u-00000007IhW-1BMk;
	Tue, 09 Sep 2025 13:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757423598; x=1788959598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L6CwOVwYJN4Y/x7PmC4SNNIsn1PcLQu+MvjuP9uomWU=;
  b=Z0TmpKDOWbawgXSfCmjAUFZLSBZ7l2PexLCjA2MLvHm4mUbnlrWFAJHw
   dEcKkVK3rWv9pwPt89Rf8CzKXFiV5+Z/T1hIOPYlzyn+S8k31G32T9x5Q
   AyA8YtrmeDeuSXIMUKAVX0hKRuFuKVABsQT3np7LzZv2ZbQFYNGePGeJe
   I7Zac8JA0wDMF/UEdeiwoTDqfMl5V7tu+HvFkWkGJRoWDfojT4MnwYjtC
   TCXm6sKdtu6hMNAHIxiaFCduE3UzzDUf2QB0FTmuac0W0Pm45NQeTUVIy
   JldNusRbmw4oPazgP5u5XzmIP8FXYbF6hefPvUfYPhy1L7urhnzPQ7UOL
   A==;
X-CSE-ConnectionGUID: 2BNCrMKFStu/Ten28RN6/A==
X-CSE-MsgGUID: i/WPkKfEQ0CwkdVItr+Yrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82295498"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82295498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:13:13 -0700
X-CSE-ConnectionGUID: uvql51LsTAqr3Q78sqHnqg==
X-CSE-MsgGUID: bZMIDd5nSnSWd1c35O6zLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="210237526"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:13:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvy9g-00000001Rlg-2b48;
	Tue, 09 Sep 2025 16:13:04 +0300
Date: Tue, 9 Sep 2025 16:13:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_061318_392355_25ED6F1C 
X-CRM114-Status: GOOD (  18.10  )
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

T24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDE6MzU6MDRQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBUdWUsIFNlcCA5LCAyMDI1IGF0IDE6MzHigK9QTSBBbmR5IFNoZXZj
aGVua28KPiA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPiB3cm90ZToKPiA+IE9uIFR1ZSwg
U2VwIDA5LCAyMDI1IGF0IDExOjE1OjQwQU0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3Jv
dGU6CgouLi4KCj4gPiA+ICsgICAgIGNvbmZpZyA9ICh0eXBlb2YoY29uZmlnKSl7Cj4gPgo+ID4g
VGhpcyBsb29rcyB1bnVzdWFsLiBXaHkgY2FuJ3QgcHJvcGVybHkgZm9ybWVkIGNvbXBvdW5kIGxp
dGVyYWwgYmUgdXNlZCBhcyBpbgo+ID4gbWFueSBvdGhlciBwbGFjZXMgaW4gdGhlIGtlcm5lbD8K
PiAKPiBJdCBpcyBjb3JyZWN0IEMKCklmIGl0IGNvbXBpbGVzLCBpdCBkb2Vzbid0IG1lYW4gaXQn
cyBjb3JyZWN0IEMsIGl0IG1pZ2h0IGJlIG5vbi1zdGFuZGFyZC4KSGF2ZSB5b3UgY2hlY2tlZCB3
aXRoIHRoZSBzdGFuZGFyZCAobm90ZSwgSSByZWFkIHRoYXQgcGFydCBpbiB0aGUgcGFzdCwKYnV0
IEkgbWF5IGZvcmdvdCB0aGUgZGV0YWlscywgc28gSSBkb24ndCBrbm93IHRoZSBhbnN3ZXIgdG8g
dGhpcyk/Cgo+IGFuZCBjaGVja3BhdGNoIGRvZXNuJ3QgcmFpc2UgYW55IHdhcm5pbmdzLgoKY2hl
Y2twYXRjaCBpcyBmYXIgZnJvbSBiZWluZyB1c2VmdWwgaW4gdGhlIHF1ZXN0aW9ucyBsaWtlIHRo
aXMuCkl0IGZhbHNlIHBvc2l0aXZlbHkgY29tcGxhaW5zIGZvciBmb3JfZWFjaCooKSBtYWNyb3Mg
YWxsIG92ZXIKdGhlIGtlcm5lbCwgZm9yIGV4YW1wbGUuCgo+IEl0J3MgdGhlCj4gc2FtZSBraW5k
IG9mIGFyZ3VtZW50IGFzIGJldHdlZW4ga21hbGxvYyhzaXplb2Yoc3RydWN0IGZvbykpIHZzCj4g
a21hbGxvYyhzaXplb2YoZikpLgoKTWF5YmUsIGJ1dCBpdCBpbnRyb2R1Y2VzIGEgbmV3IHN0eWxl
IHdoaWxlIGFsbCBvdGhlciBjYXNlcyB1c2UgdGhlIG90aGVyLApfZXN0YWJsaXNoZWRfIHN0eWxl
LiBTbyB3ZSBoYXZlIGEgcHJlY2VkZW50IGFuZCB0aGUgZm9ybSB0aGUgY29kZSBpcyB3cml0dGVu
CmluIGlzIGFnYWluc3QgdGhlIGRlIGZhY3RvIHVzYWdlIG9mIHRoZSBjb21wb3VuZCBsaXRlcmFs
cy4KCj4gSSBndWVzcyBpdCdzIHBlcnNvbmFsIHRhc3RlIGJ1dCBJIGxpa2UgdGhpcyB2ZXJzaW9u
IGJldHRlci4KCkluIGtlcm5lbCB3ZSBhbHNvIHRyeSB0byBiZSBjb25zaXN0ZW50LiBUaGlzIGFk
ZCBpbmNvbnNpc3RlbmN5LiBBbSBJIHdyb25nPwoKPiA+ID4gKyAgICAgICAgICAgICAuZGV2ID0g
JnBkZXYtPmRldiwKPiA+ID4gKyAgICAgICAgICAgICAuc3ogPSA0LAo+ID4gPiArICAgICAgICAg
ICAgIC5kYXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQSU5SLAo+ID4gPiArICAgICAgICAgICAg
IC5zZXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQT1VUUiwKPiA+ID4gKyAgICAgICAgICAgICAu
ZGlyb3V0ID0gc2QtPmdwaW9fcHViX2Jhc2UgKyBHUE9FUiwKPiA+ID4gKyAgICAgfTsKCi0tIApX
aXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
