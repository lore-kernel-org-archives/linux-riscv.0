Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC71CAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9ZhbghdohHA2wKI3kl7bdHjxvCYNAi+Ch6ToyvW62Y=; b=TrrtzzNObpxDM1
	JiFVFS/bwAE9nzuwSpLpvANXEQ/3rdKQ4ZTLpQ1bxdLshYtTNmASS4xDdmfwmCnOABZbkYCpSVgdH
	RuvfvP156uFxrKb65HV4JMDED+N0jQrXaFhzmyQWBcIKlpx8dqEz9+uFdQGkWSKWdhZApbvdosdwC
	UsDFnlQvX5qFtbDim1Lh+1WJUkGOnc6s9mZ8EasL7LgRYCRXBYvQDt7Xx2VUeZvM4C4CRkLgqiulc
	OjS5saPZOt+skrWBSKIgLeBrsio06xm1kH5JNKXhYpmEwchvUkn3upo2N+MI8lGXvngPkHhoCpCnl
	joYh/HMaVFh2wYGLi+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20o-00000008vd1-2BC5;
	Tue, 09 Sep 2025 17:20:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvygo-00000007V7J-466I;
	Tue, 09 Sep 2025 13:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757425639; x=1788961639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SgpPAjADQzC6Aebwe3Gl5hrmCduvtTFHZe4sNN8KxNA=;
  b=afi/oQteyENWif8VddaYBfQQyFACWn05DsDvJmxyt7CdOUFG5woOIaQ7
   CsCKJKQHappCtoEsttNlN5cw1MXj+ukewN0YPkH5rOdMw4vbCxdWhcfla
   Wy5JcYuSTYKzl8BIk+6bSbfH8R8LubdNPEzmfKTGGcEFKEEaGs7HMxNj9
   ZEVdhRKYZ6npQvSZArj6c6BeXZJBY4Tw3R9aXT2llsUux4YKJLODKhgft
   tf5HV5wWl9/r3Lvxbuodf1lXFPY5gfST9PTPCS16wl1Lwalxa5oDzK84H
   Y1Y7azDCTFKrYoqCQhO7yBgbw6257/FTsz3fzgJLJkh8Vyu8yxMDGHyPC
   w==;
X-CSE-ConnectionGUID: KTFuYRbmQRGQGKw/KFwHvg==
X-CSE-MsgGUID: xuktrs+lTpaR7E3N8HgeFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="85156561"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="85156561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:47:18 -0700
X-CSE-ConnectionGUID: aQJ5SNjrRiC9oY5or5hmCw==
X-CSE-MsgGUID: IvhvaCp3Shak7FgkN3F39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173207838"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:47:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvygf-00000001SBf-44Rc;
	Tue, 09 Sep 2025 16:47:09 +0300
Date: Tue, 9 Sep 2025 16:47:09 +0300
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
Message-ID: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMAve1MbONmKVjjg@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064719_029837_94B93E80 
X-CRM114-Status: GOOD (  35.53  )
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

T24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDQ6NDU6MzFQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDA5LCAyMDI1IGF0IDA4OjI0OjIzQU0gLTA1MDAsIEJhcnRv
c3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBPbiBUdWUsIDkgU2VwIDIwMjUgMTU6MTM6MDQgKzAy
MDAsIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gc2Fp
ZDoKPiA+ID4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDE6MzU6MDRQTSArMDIwMCwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiA+ID4+IE9uIFR1ZSwgU2VwIDksIDIwMjUgYXQgMTozMeKA
r1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4g
d3JvdGU6Cj4gPiA+PiA+IE9uIFR1ZSwgU2VwIDA5LCAyMDI1IGF0IDExOjE1OjQwQU0gKzAyMDAs
IEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6CgouLi4KCj4gPiA+PiA+ID4gKyAgICAgY29uZmln
ID0gKHR5cGVvZihjb25maWcpKXsKPiA+ID4+ID4KPiA+ID4+ID4gVGhpcyBsb29rcyB1bnVzdWFs
LiBXaHkgY2FuJ3QgcHJvcGVybHkgZm9ybWVkIGNvbXBvdW5kIGxpdGVyYWwgYmUgdXNlZCBhcyBp
bgo+ID4gPj4gPiBtYW55IG90aGVyIHBsYWNlcyBpbiB0aGUga2VybmVsPwo+ID4gPj4KPiA+ID4+
IEl0IGlzIGNvcnJlY3QgQwo+ID4gPgo+ID4gPiBJZiBpdCBjb21waWxlcywgaXQgZG9lc24ndCBt
ZWFuIGl0J3MgY29ycmVjdCBDLCBpdCBtaWdodCBiZSBub24tc3RhbmRhcmQuCj4gPiA+IEhhdmUg
eW91IGNoZWNrZWQgd2l0aCB0aGUgc3RhbmRhcmQgKG5vdGUsIEkgcmVhZCB0aGF0IHBhcnQgaW4g
dGhlIHBhc3QsCj4gPiA+IGJ1dCBJIG1heSBmb3Jnb3QgdGhlIGRldGFpbHMsIHNvIEkgZG9uJ3Qg
a25vdyB0aGUgYW5zd2VyIHRvIHRoaXMpPwo+ID4gCj4gPiBJdCdzIGEgR05VIGV4dGVuc2lvbiBh
bHJpZ2h0Cj4gCj4gY2xhbmcsIEkgc3VwcG9zZSwgYWxzbyBva2F5IHdpdGggdGhpcz8KPiAKPiA+
IGJ1dCBpdCdzIHN1cHBvcnRlZCBpbiB0aGUga2VybmVsIGFzIGl0IGV2YWx1YXRlcwo+ID4gdG8g
YSBzaW1wbGUgY2FzdC4KPiAKPiBUaGVyZSBpcyBubyBjYXN0LiBBbmQgdGhhdCdzIG1ha2UgYSBi
aWcgZGlmZmVyZW5jZSB0byB3aGF0IHRoZSBjb2RlIHRyaWVzIHRvIGRvLgo+IAo+ID4gPj4gYW5k
IGNoZWNrcGF0Y2ggZG9lc24ndCByYWlzZSBhbnkgd2FybmluZ3MuCj4gPiA+Cj4gPiA+IGNoZWNr
cGF0Y2ggaXMgZmFyIGZyb20gYmVpbmcgdXNlZnVsIGluIHRoZSBxdWVzdGlvbnMgbGlrZSB0aGlz
Lgo+ID4gPiBJdCBmYWxzZSBwb3NpdGl2ZWx5IGNvbXBsYWlucyBmb3IgZm9yX2VhY2gqKCkgbWFj
cm9zIGFsbCBvdmVyCj4gPiA+IHRoZSBrZXJuZWwsIGZvciBleGFtcGxlLgo+ID4gPgo+ID4gPj4g
SXQncyB0aGUKPiA+ID4+IHNhbWUga2luZCBvZiBhcmd1bWVudCBhcyBiZXR3ZWVuIGttYWxsb2Mo
c2l6ZW9mKHN0cnVjdCBmb28pKSB2cwo+ID4gPj4ga21hbGxvYyhzaXplb2YoZikpLgo+ID4gPgo+
ID4gPiBNYXliZSwgYnV0IGl0IGludHJvZHVjZXMgYSBuZXcgc3R5bGUgd2hpbGUgYWxsIG90aGVy
IGNhc2VzIHVzZSB0aGUgb3RoZXIsCj4gPiA+IF9lc3RhYmxpc2hlZF8gc3R5bGUuIFNvIHdlIGhh
dmUgYSBwcmVjZWRlbnQgYW5kIHRoZSBmb3JtIHRoZSBjb2RlIGlzIHdyaXR0ZW4KPiA+ID4gaW4g
aXMgYWdhaW5zdCB0aGUgZGUgZmFjdG8gdXNhZ2Ugb2YgdGhlIGNvbXBvdW5kIGxpdGVyYWxzLgo+
ID4gCj4gPiBJdCBtYXkgbm90IGJlICp2ZXJ5KiBjb21tb24gYnV0IGl0J3MgaGFyZGx5IG5ldyBz
dHlsZToKPiAKPiBJIHRoaW5rIHlvdXIgc3RhdGVtZW50IGlzIGluY29ycmVjdCBzZWUgYmVsb3cg
d2h5Lgo+IAo+ID4gJCBnaXQgZ3JlcCAtUCAiXCh0eXBlb2ZcKC4qXClcKSA/XHsiIHwgd2MKPiA+
ICAgICAxMDggICAgIDUyOSAgICA3MzE1Cj4gCj4gTm90IGNvcnJlY3QuIFRoZSBjb3JyZWN0IG91
dHB1dCB3aWxsIGJlIGNsb3NlciB0bwo+IAo+ICQgZ2l0IGdyZXAgLWwgLVAgIlwodHlwZW9mXCgu
KlwpXCkgP1x7IiB8IHdjIC1sCj4gMTUKPiAKPiBBbmQgaWYgeW91IGxvb2tlZCBhdCB0aGUgb3V0
cHV0IGNhcmVmdWxseSwgeW91IHNlZSB0aGUgYnVnIGluIHRoZSBSRSB5b3UgdXNlZC4KPiAKPiBT
bywgZXZlbiBjbG9zZXIgd2lsbCBiZSB0aGlzIG9uZToKPiAKPiAkIGdpdCBncmVwIC1sIC1QICI9
W1s6c3BhY2U6XV0rXCh0eXBlb2ZcKC4qXClcKSA/XHsiIHwgd2MgLWwKPiA3Cj4gCj4gMiBvdXQg
b2Ygd2hpY2ggYXJlIHJlbGF0ZWQgdG8gbGliZXRoLCBlZmZlY3RpdmVseSBtYWtlcyB0aGlzIDYu
CgpUQkgsIEkgdGhpbmsgdGhvc2UgNiBhbGwgbWFkZSB0aGUgc2FtZSBtaXN0YWtlLCBpLmUuIHRo
aW5raW5nIG9mIHRoZSBjb21wb3VuZApsaXRlcmFsIGFzIGEgY2FzdC4gV2hpY2ggaXMgbm90IQoK
PiBObywgdGhpcyBpcyBjb21wbGV0ZWx5IG5vbi1zdGFuZGFyZCBhbmQgdW51c3VhbCB0aGluZyBp
biB0aGUga2VybmVsLgo+IAo+ID4gPj4gSSBndWVzcyBpdCdzIHBlcnNvbmFsIHRhc3RlIGJ1dCBJ
IGxpa2UgdGhpcyB2ZXJzaW9uIGJldHRlci4KPiA+ID4KPiA+ID4gSW4ga2VybmVsIHdlIGFsc28g
dHJ5IHRvIGJlIGNvbnNpc3RlbnQuIFRoaXMgYWRkIGluY29uc2lzdGVuY3kuIEFtIEkgd3Jvbmc/
Cj4gPiA+Cj4gPiA+PiA+ID4gKyAgICAgICAgICAgICAuZGV2ID0gJnBkZXYtPmRldiwKPiA+ID4+
ID4gPiArICAgICAgICAgICAgIC5zeiA9IDQsCj4gPiA+PiA+ID4gKyAgICAgICAgICAgICAuZGF0
ID0gc2QtPmdwaW9fcHViX2Jhc2UgKyBHUElOUiwKPiA+ID4+ID4gPiArICAgICAgICAgICAgIC5z
ZXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQT1VUUiwKPiA+ID4+ID4gPiArICAgICAgICAgICAg
IC5kaXJvdXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQT0VSLAo+ID4gPj4gPiA+ICsgICAgIH07
CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
