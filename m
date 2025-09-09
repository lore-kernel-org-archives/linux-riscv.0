Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4E6CAC587
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L84egX4hoUYt9o8yn3Y5KjohfENv8XSap4pvth3Dtzc=; b=S6ikdzwX/C8zHV
	mxZpHr/EjlNcJIiS4kqA7XFf/XA3Kesey4o1v4/9OSkZl6KNgftiWbMYm6h5nSH5eDl0wWcNxtO+z
	JdCVRkucdUoVaBs1aOBP2m/U7Q2F9Q9/skrw9itqpahh3LV4KBwiMw2lm5YGMdwcFqFvfJi6NDSK3
	Q6uxNqOS2FG2D2S2UFvscxH6GQFwfDDuOpJoq6QixsFe6CCa/OyAyuZxBKEysVXST46llPJBp/9RB
	jndKZ1NaA2uWIKmvljw74FSz0GwoNRYeGNOUprpkQ2qcc4ivj8InCx5fy9qRcdwnuP55pDsEVSJX1
	By0q6td6JVDLpdouXWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0nr-00000008ODo-3ht1;
	Tue, 09 Sep 2025 16:02:43 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyfG-00000007Uhh-3ikN;
	Tue, 09 Sep 2025 13:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757425543; x=1788961543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cuvp1jqzP0KmBIeFPlYIHdueAMSWUkXNMbTb2SDREqQ=;
  b=UonzozE+plb8Cdd4HIY75ymdSUXVW4NlJt2uN5xOC/5YGjBCWFoFv/1f
   lFmmP80YSMsI6Xz0FyRVcnepwxnu8TxjVjDfEXYwo8SR2Oc3BDs01hy0Z
   Hk8Ugx4/vaRjvovXvV8PeUJbrtxqLvawUzMsOdHZI21B+Gu0YB4LUUm1b
   xIc14e+4nxXzUjJsqmpCUSPlCi4J/PhSMdodeqRMtY3fOhnsVeRW53Pe4
   Cgo+V0SeFJ4Mrl1PaKk1mpH7nguZZ6NGupXBeDZScJix8tDkp4kA8OIY1
   3t3NcYqDhW8WIzNjucmsqHN3EGKURnrtpqBrgp3lpnSQawnYPbK4YxKU7
   A==;
X-CSE-ConnectionGUID: 1je0Mm8BQJyKXYsM0fzzmQ==
X-CSE-MsgGUID: K8Dy0YV/ROafaNPd93OvHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77320978"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="77320978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:45:40 -0700
X-CSE-ConnectionGUID: YelEPzAPTVimIapPXZjDQA==
X-CSE-MsgGUID: DSSZAarXTPmifkvXgS2MQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="177436591"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:45:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvyf5-00000001S9X-2kkM;
	Tue, 09 Sep 2025 16:45:31 +0300
Date: Tue, 9 Sep 2025 16:45:31 +0300
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
Message-ID: <aMAve1MbONmKVjjg@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064542_941355_29B91281 
X-CRM114-Status: GOOD (  29.99  )
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

T24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDg6MjQ6MjNBTSAtMDUwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBUdWUsIDkgU2VwIDIwMjUgMTU6MTM6MDQgKzAyMDAsIEFuZHkgU2hl
dmNoZW5rbwo+IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHNhaWQ6Cj4gPiBPbiBUdWUs
IFNlcCAwOSwgMjAyNSBhdCAwMTozNTowNFBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+ID4+IE9uIFR1ZSwgU2VwIDksIDIwMjUgYXQgMTozMeKAr1BNIEFuZHkgU2hldmNoZW5r
bwo+ID4+IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4+ID4gT24gVHVl
LCBTZXAgMDksIDIwMjUgYXQgMTE6MTU6NDBBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToKCi4uLgoKPiA+PiA+ID4gKyAgICAgY29uZmlnID0gKHR5cGVvZihjb25maWcpKXsKPiA+
PiA+Cj4gPj4gPiBUaGlzIGxvb2tzIHVudXN1YWwuIFdoeSBjYW4ndCBwcm9wZXJseSBmb3JtZWQg
Y29tcG91bmQgbGl0ZXJhbCBiZSB1c2VkIGFzIGluCj4gPj4gPiBtYW55IG90aGVyIHBsYWNlcyBp
biB0aGUga2VybmVsPwo+ID4+Cj4gPj4gSXQgaXMgY29ycmVjdCBDCj4gPgo+ID4gSWYgaXQgY29t
cGlsZXMsIGl0IGRvZXNuJ3QgbWVhbiBpdCdzIGNvcnJlY3QgQywgaXQgbWlnaHQgYmUgbm9uLXN0
YW5kYXJkLgo+ID4gSGF2ZSB5b3UgY2hlY2tlZCB3aXRoIHRoZSBzdGFuZGFyZCAobm90ZSwgSSBy
ZWFkIHRoYXQgcGFydCBpbiB0aGUgcGFzdCwKPiA+IGJ1dCBJIG1heSBmb3Jnb3QgdGhlIGRldGFp
bHMsIHNvIEkgZG9uJ3Qga25vdyB0aGUgYW5zd2VyIHRvIHRoaXMpPwo+IAo+IEl0J3MgYSBHTlUg
ZXh0ZW5zaW9uIGFscmlnaHQKCmNsYW5nLCBJIHN1cHBvc2UsIGFsc28gb2theSB3aXRoIHRoaXM/
Cgo+IGJ1dCBpdCdzIHN1cHBvcnRlZCBpbiB0aGUga2VybmVsIGFzIGl0IGV2YWx1YXRlcwo+IHRv
IGEgc2ltcGxlIGNhc3QuCgpUaGVyZSBpcyBubyBjYXN0LiBBbmQgdGhhdCdzIG1ha2UgYSBiaWcg
ZGlmZmVyZW5jZSB0byB3aGF0IHRoZSBjb2RlIHRyaWVzIHRvIGRvLgoKPiA+PiBhbmQgY2hlY2tw
YXRjaCBkb2Vzbid0IHJhaXNlIGFueSB3YXJuaW5ncy4KPiA+Cj4gPiBjaGVja3BhdGNoIGlzIGZh
ciBmcm9tIGJlaW5nIHVzZWZ1bCBpbiB0aGUgcXVlc3Rpb25zIGxpa2UgdGhpcy4KPiA+IEl0IGZh
bHNlIHBvc2l0aXZlbHkgY29tcGxhaW5zIGZvciBmb3JfZWFjaCooKSBtYWNyb3MgYWxsIG92ZXIK
PiA+IHRoZSBrZXJuZWwsIGZvciBleGFtcGxlLgo+ID4KPiA+PiBJdCdzIHRoZQo+ID4+IHNhbWUg
a2luZCBvZiBhcmd1bWVudCBhcyBiZXR3ZWVuIGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBmb28pKSB2
cwo+ID4+IGttYWxsb2Moc2l6ZW9mKGYpKS4KPiA+Cj4gPiBNYXliZSwgYnV0IGl0IGludHJvZHVj
ZXMgYSBuZXcgc3R5bGUgd2hpbGUgYWxsIG90aGVyIGNhc2VzIHVzZSB0aGUgb3RoZXIsCj4gPiBf
ZXN0YWJsaXNoZWRfIHN0eWxlLiBTbyB3ZSBoYXZlIGEgcHJlY2VkZW50IGFuZCB0aGUgZm9ybSB0
aGUgY29kZSBpcyB3cml0dGVuCj4gPiBpbiBpcyBhZ2FpbnN0IHRoZSBkZSBmYWN0byB1c2FnZSBv
ZiB0aGUgY29tcG91bmQgbGl0ZXJhbHMuCj4gCj4gSXQgbWF5IG5vdCBiZSAqdmVyeSogY29tbW9u
IGJ1dCBpdCdzIGhhcmRseSBuZXcgc3R5bGU6CgpJIHRoaW5rIHlvdXIgc3RhdGVtZW50IGlzIGlu
Y29ycmVjdCBzZWUgYmVsb3cgd2h5LgoKPiAkIGdpdCBncmVwIC1QICJcKHR5cGVvZlwoLipcKVwp
ID9ceyIgfCB3Ywo+ICAgICAxMDggICAgIDUyOSAgICA3MzE1CgpOb3QgY29ycmVjdC4gVGhlIGNv
cnJlY3Qgb3V0cHV0IHdpbGwgYmUgY2xvc2VyIHRvCgokIGdpdCBncmVwIC1sIC1QICJcKHR5cGVv
ZlwoLipcKVwpID9ceyIgfCB3YyAtbAoxNQoKQW5kIGlmIHlvdSBsb29rZWQgYXQgdGhlIG91dHB1
dCBjYXJlZnVsbHksIHlvdSBzZWUgdGhlIGJ1ZyBpbiB0aGUgUkUgeW91IHVzZWQuCgpTbywgZXZl
biBjbG9zZXIgd2lsbCBiZSB0aGlzIG9uZToKCiQgZ2l0IGdyZXAgLWwgLVAgIj1bWzpzcGFjZTpd
XStcKHR5cGVvZlwoLipcKVwpID9ceyIgfCB3YyAtbAo3CgoyIG91dCBvZiB3aGljaCBhcmUgcmVs
YXRlZCB0byBsaWJldGgsIGVmZmVjdGl2ZWx5IG1ha2VzIHRoaXMgNi4KCk5vLCB0aGlzIGlzIGNv
bXBsZXRlbHkgbm9uLXN0YW5kYXJkIGFuZCB1bnVzdWFsIHRoaW5nIGluIHRoZSBrZXJuZWwuCgo+
ID4+IEkgZ3Vlc3MgaXQncyBwZXJzb25hbCB0YXN0ZSBidXQgSSBsaWtlIHRoaXMgdmVyc2lvbiBi
ZXR0ZXIuCj4gPgo+ID4gSW4ga2VybmVsIHdlIGFsc28gdHJ5IHRvIGJlIGNvbnNpc3RlbnQuIFRo
aXMgYWRkIGluY29uc2lzdGVuY3kuIEFtIEkgd3Jvbmc/Cj4gPgo+ID4+ID4gPiArICAgICAgICAg
ICAgIC5kZXYgPSAmcGRldi0+ZGV2LAo+ID4+ID4gPiArICAgICAgICAgICAgIC5zeiA9IDQsCj4g
Pj4gPiA+ICsgICAgICAgICAgICAgLmRhdCA9IHNkLT5ncGlvX3B1Yl9iYXNlICsgR1BJTlIsCj4g
Pj4gPiA+ICsgICAgICAgICAgICAgLnNldCA9IHNkLT5ncGlvX3B1Yl9iYXNlICsgR1BPVVRSLAo+
ID4+ID4gPiArICAgICAgICAgICAgIC5kaXJvdXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQT0VS
LAo+ID4+ID4gPiArICAgICB9OwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVu
a28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
