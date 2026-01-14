Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBF1D31A19
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPgyzobokKJeLrvoU8kxRn8vNgj5TVkTc3mGTE8a/00=; b=iiBnmn10U9LtNW
	RUU5qklYP0P+W+xoAxEGNoZ7RRHcs4mCk8MBEp9X2JbFxAZSeYIM30kUrJWeb38mJ6jI7RLUj7mKk
	N6DiqAV1vba5UF8kZ7uahtYz19qdXog10azGQqBeKc/DkgDev+MQ2pUYEYi7l+sfN8Ui43wRs1QhV
	bhZSsGU8e4LB0DrszJxb3oCEySbxYVTcZCbNyUKS9RKlGI/I19nLL++0rH9oR5Xsu2TcKN9wKAybP
	MrQMXudpnJEuyZ7skf4eAhGLotS8Itr6JVF/cJL/eTTUQNkOHsBTJfwp4cpO4Jzur1/tdgEPJExAX
	nb83lPOBpFnuGm3wMLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvBm-00000008BOR-2ZL2;
	Wed, 14 Jan 2026 07:21:10 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvBl-00000008BNx-0DV8
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 07:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768375269; x=1799911269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mmjY70xA4kJmtSvrt/yNudpzGyf32tcP39W+0SNo7So=;
  b=g27xVpLQhZy++mB0fAK/hCYbAWGWeuanAmHGl87R1Vl4tpqZaACWov2x
   /11q4uawgMHYVHifcZd46+r+ErWfSXxVN9Ou1Qly9sdVa/s3kLGaXQYd9
   HClrgXK97wD0i++jQbJeGslqKJHhGHG5xZ8dqKW94343+UF0EqU3F5Agt
   xBz1lzr7k/PJzoZ4cyHD8dS0DXBISs/90vFUO1NPdpwmlauDhKQB+JcRL
   NoLr0eVfwvo6BIoAxmQnU5mWB9YNf2VdGDrpyKRI3//5EmukMuYUBLXI3
   Von9pXpvXYuZvluMWOHqTslWt4z9ufE2/MMdYWBAIv2XkN94ybig0BdPR
   Q==;
X-CSE-ConnectionGUID: NuBEhrlvTviklgR3O1Iv9A==
X-CSE-MsgGUID: V4to41OVTO63ShU4M4hqOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81033878"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="81033878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:21:07 -0800
X-CSE-ConnectionGUID: /wvwk29fTw6Bl2yqMqnRbg==
X-CSE-MsgGUID: buH5lw+ZSYiWMRM4xlmZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204618101"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:21:03 -0800
Date: Wed, 14 Jan 2026 09:21:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, kees@kernel.org, andy@kernel.org,
	akpm@linux-foundation.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, ardb@kernel.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	samuel.holland@sifive.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for
 strlen()
Message-ID: <aWdD3N_jwnt_ncc1@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-9-jiangfeng@kylinos.cn>
 <aWYGWLEekWh3jJVf@smile.fi.intel.com>
 <b06e4a63-85c2-4420-8077-f4c059ef33fb@kylinos.cn>
 <a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232109_105301_45AE97E6 
X-CRM114-Status: GOOD (  20.79  )
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDM6MDQ6NThQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90
ZToKPiBPbiAyMDI2LzEvMTQgMTQ6MTQsIEZlbmcgSmlhbmcgd3JvdGU6Cj4gPiBPbiAyMDI2LzEv
MTMgMTY6NDYsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKCi4uLgoKPiA+IFRoYW5rIHlvdSBmb3Ig
dGhlIGNhdGNoLiBZb3UgYXJlIGFic29sdXRlbHkgY29ycmVjdOKAlHRoZSAyNTAweCBmaWd1cmUg
aXMgaGVhdmlseQo+ID4gZGlzdG9ydGVkIGFuZCBkb2VzIG5vdCByZWZsZWN0IHJlYWwtd29ybGQg
cGVyZm9ybWFuY2UuCj4gPiAKPiA+IEkndmUgZm91bmQgdGhhdCBieSB1c2luZyBhIHZvbGF0aWxl
IGZ1bmN0aW9uIHBvaW50ZXIgdG8gY2FsbCB0aGUgaW1wbGVtZW50YXRpb25zCj4gPiAoaW5zdGVh
ZCBvZiBkaXJlY3QgY2FsbHMpLCB0aGUgcmVzdWx0cyByZXR1cm5lZCB0byBhIHJlYWxpc3RpYyBy
YW5nZS4gSXQgYXBwZWFycwo+ID4gdGhlIHByZXZpb3VzIGJlbmNobWFyayBsb2dpYyBhbGxvd2Vk
IHRoZSBjb21waWxlciB0byBvdmVyLW9wdGltaXplIHRoZSB0ZXN0IGxvb3AKPiA+IGluIHdheXMg
dGhhdCBza2V3ZWQgdGhlIGRhdGEuCj4gPiAKPiA+IEkgd2lsbCByZWZhY3RvciB0aGUgYmVuY2ht
YXJrIGxvZ2ljIGluIHYzLCBzcGVjaWZpY2FsbHkgcmVmZXJlbmNpbmcgdGhlIGNyYzMyCj4gPiBL
VW5pdCBpbXBsZW1lbnRhdGlvbiAoZS5nLiwgdXNpbmcgd2FybS11cCBsb29wcyBhbmQgYWRkaW5n
IHByZWVtcHRfZGlzYWJsZSgpCj4gPiB0byBlbGltaW5hdGUgY29udGV4dC1zd2l0Y2ggaW50ZXJm
ZXJlbmNlKSB0byBlbnN1cmUgdGhlIGRhdGEgaXMgcm9idXN0IGFuZCBhY2N1cmF0ZS4KPiA+IAo+
IAo+IEp1c3QgYSBxdWljayBmb2xsb3ctdXA6IEkndmUgYWxzbyB2ZXJpZmllZCB0aGF0IHVzaW5n
IGEgdm9sYXRpbGUgdmFyaWFibGUgdG8gc3RvcmUKPiB0aGUgcmV0dXJuIHZhbHVlIChhcyBzZWVu
IGluIGNyY19iZW5jaG1hcmsoKSkgaXMgZXF1YWxseSBlZmZlY3RpdmUgYXQgcHJldmVudGluZwo+
IHRoZSBvcHRpbWl6YXRpb24uCj4gCj4gVGhlIGNvcmUgY2hhbmdlIGlzIGFzIGZvbGxvd3M6Cj4g
Cj4gICAgIHZvbGF0aWxlIHNpemVfdCBsZW47Cj4gICAgIC4uLgo+ICAgICBmb3IgKHVuc2lnbmVk
IGludCBqID0gMDsgaiA8IGl0ZXJzOyBqKyspIHsKPiAgICAgICAgIE9QVElNSVpFUl9ISURFX1ZB
UihidWYpOwo+ICAgICAgICAgbGVuID0gc3RybGVuKGJ1Zik7CgpCdXQgcGxlYXNlLCBjaGVjayBm
b3Igc3VyZSB0aGlzIGlzIExpbnV4IGtlcm5lbCBnZW5lcmljIGltcGxlbWVudGF0aW9uIChiZWZv
cmUpCmFuZCBub3QgX19idWlsdGluX3N0cmxlbigpIGZyb20gR0NDLiAoT1RPSCwgaXQgd291bGQg
YmUgbmljZSB0byBiZW5jaG1hcmsgdGhhdApvbmUgYXMgd2VsbCwgYWx0aG91Z2ggSSB0aGluayB0
aGF0IF9fYnVpbHRpbl9zdHJsZW4oKSBpbiBnZW5lcmFsIG1heWJlIHNsaWdodGx5CmJldHRlciBj
aG9pY2UgdGhhbiBMaW51eCBrZXJuZWwgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4pIEkuby53LiBi
ZSBzdXJlICp3aGF0Kgp5b3UgdGVzdC4KCj4gICAgIH0KCk9yIHVzaW5nIFdSSVRFX09OQ0UoKSA6
LSkgQnV0IHRoYXQgb25lIHdpbGwgcHJvYmFibHkgYmUgY29uZnVzaW5nIGFzIGl0IHVzdWFsbHkK
c2hvdWxkIGJlIHBhaXJlZCB3aXRoIFJFQURfT05DRSgpIHNvbWV3aGVyZSBlbHNlIGluIHRoZSBj
b2RlLiBTbywgSSBhZ3JlZSBvbgpjcmNfYmVuY2htYXJrKCkgYXBwcm9hY2ggdGFrZW4uCgo+IFBy
ZWxpbWluYXJ5IHJlc3VsdHMgd2l0aCB0aGlzIGNoYW5nZSBsb29rIG11Y2ggbW9yZSByZWFzb25h
YmxlOgo+IAo+ICAgICBvayA0IHN0cmluZ190ZXN0X3N0cmxlbgo+ICAgICAjIHN0cmluZ190ZXN0
X3N0cmxlbl9iZW5jaDogc3RybGVuIHBlcmZvcm1hbmNlIChzaG9ydCwgbGVuOiA4LCBpdGVyczog
MTAwMDAwKToKPiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgYXJjaC1vcHRpbWl6
ZWQ6IDQ3Njc1MDAgbnMKPiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgZ2VuZXJp
YyBDOiAgICAgIDU4MTU4MDAgbnMKPiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAg
c3BlZWR1cDogICAgICAgIDEuMjF4Cj4gICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiBz
dHJsZW4gcGVyZm9ybWFuY2UgKG1lZGl1bSwgbGVuOiA2NCwgaXRlcnM6IDEwMDAwMCk6Cj4gICAg
ICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIGFyY2gtb3B0aW1pemVkOiA2NTczNjAwIG5z
Cj4gICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIGdlbmVyaWMgQzogICAgICAxNjM0
MjUwMCBucwo+ICAgICAjIHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaDogICBzcGVlZHVwOiAgICAg
ICAgMi40OHgKPiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6IHN0cmxlbiBwZXJmb3Jt
YW5jZSAobG9uZywgbGVuOiAyMDQ4LCBpdGVyczogMTAwMDApOgo+ICAgICAjIHN0cmluZ190ZXN0
X3N0cmxlbl9iZW5jaDogICBhcmNoLW9wdGltaXplZDogNzkzMTAwMCBucwo+ICAgICAjIHN0cmlu
Z190ZXN0X3N0cmxlbl9iZW5jaDogICBnZW5lcmljIEM6ICAgICAgMzUzNDczMDAgbnMKPiAgICAg
IyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgc3BlZWR1cDogICAgICAgIDQuNDV4Cj4gICAg
IG9rIDUgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoCj4gCj4gSSB3aWxsIGFkb3B0IHRoaXMgcGF0
dGVybiBpbiB2MywgYWxvbmcgd2l0aCBjYWNoZSB3YXJtLXVwIGFuZCBwcmVlbXB0X2Rpc2FibGUo
KSwKPiB0byBzdGF5IGNvbnNpc3RlbnQgd2l0aCBleGlzdGluZyBrZXJuZWwgYmVuY2htYXJrcyBh
bmQgZW5zdXJlIHJvYnVzdCBtZWFzdXJlbWVudHMuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFu
ZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
