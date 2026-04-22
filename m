Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CEF9B5FE
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqnPwdadOGz/zL+10X9lxvRXe0m1WP8WkSJ8Z4gvmpo=; b=bhzv46O/JTtyn9
	6gQSRdZawxeeq5BUKQjNHJW8GjuMsGFlZr8SeDc7sJIuZFrEkrtyYRo0VdPiTPEMEe3PVa51P3KHx
	Oobb/MD6jkQIoEHTRBwz8or+BKDuhXD/Yf+zsCf1FwvMtvP9O6QiWcmpCIxUGEUyCrlpVAPVJ/zGI
	nbVOShrWlKCGOonxYzyKQxDyrfY7N3eBaBfTonVQQfJJ1jLCPA57HDjSkqDXnKSIHRssBbBswju5D
	7bxXRXA8Zulub3DRkCaUk6ffOa/Fw2vFStWArLxfkvtTb5XUGR6bqJnRQ1MoHAXS/pbwmneHk1FBI
	UvrRFsXEn8Jpr1YADHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFU75-00000009sMA-0Fez;
	Wed, 22 Apr 2026 09:43:19 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFU71-00000009sLj-3hAq
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 09:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776850996; x=1808386996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NwhBpvrMjhcZ1QYHuKrPIn3Ne+/ARK1VGhWOT4LsTZc=;
  b=lcTyv95TQMomdWacXh2PVK35/A7HxDNRrV390ImlbKxuPEfZJ4ugV8KL
   Jolj1inMZ319vXXjK9wi463LITA27imso1YMHtM9n0vqnWypN+UHGetCV
   DQ9YRP/TZRtIGWWTnLEhrZil/MMa1d7h0Pn/8LynFUKhbxRsOyoSjEGzq
   m824a9PDPmVSMjGCJ6v5hb/jzRcD3RHY68ufzLphDZa1eKvNKlyikELSK
   t/hMycEAuJ2s3mOvJ++KO1c+bMLL0QfuMcxNzVnrlMtxNBP9P6ZXT6m2O
   +NKRDbk5bmOqH5TQ4rPnZ3ppn0Ir9JGHDnGU6P9BmfhcEfoPByIvFEA5n
   A==;
X-CSE-ConnectionGUID: WL3llPYLSmOD0kJn9zKQrQ==
X-CSE-MsgGUID: ZIyfbDkdT92p0t7Zs8/jHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95211712"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="95211712"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:43:14 -0700
X-CSE-ConnectionGUID: bgH3XRWkQnamXjtfWhOBSw==
X-CSE-MsgGUID: wo1U15vESyCRvqZgl38CJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232172466"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:43:10 -0700
Date: Wed, 22 Apr 2026 12:43:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
Message-ID: <aeiYLLXTprlzmcpF@ashevche-desk.local>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
 <177681947637.2697678.10937675549830278979.b4-reply@b4>
 <aeiKsv3bFPJ94InI@ashevche-desk.local>
 <aeiK-350Uozq3pVa@ashevche-desk.local>
 <177685078199.768471.14774992461649696859.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177685078199.768471.14774992461649696859.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024315_982620_72FC003C 
X-CRM114-Status: GOOD (  20.56  )
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

T24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgMDU6Mzk6NDFQTSArMDgwMCwgSmlhIFdhbmcgd3JvdGU6
Cj4gT24gMjAyNi0wNC0yMiAxMTo0NiArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4g
T24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgMTE6NDU6NDRBTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEFwciAyMiwgMjAyNiBhdCAwODo1Nzo1NkFNICswODAwLCBK
aWEgV2FuZyB3cm90ZToKCi4uLgoKPiA+ID4gPiBKdXN0IHRvIGNvbmZpcm06IHNpbmNlIHlvdSBt
ZW50aW9uZWQgdGhhdCB0aGUgcHJlcGFyYXRvcnkgcGF0Y2ggbW92aW5nCj4gPiA+ID4gdGhlIERX
X1VBUlQgcmVnaXN0ZXIgZGVmaW5lcyBpcyBhbHJlYWR5IGluIHBsYWNlLCBJIGRvbid0IG5lZWQg
dG8gbW92ZQo+ID4gPiA+IHRoZW0gYWdhaW4sIGNvcnJlY3Q/Cj4gPiA+ID4gCj4gPiA+ID4gSSB3
aWxsIHVwZGF0ZSBteSBwYXRjaCB0byB1c2UgdGhlIERXX1VBUlRfQ1BSXyogbWFjcm9zIGFuZAo+
ID4gPiA+IEZJRUxEX1BSRVBfQ09OU1QoKSBhY2NvcmRpbmdseSwgYW5kIEnigJltIGhhcHB5IHRv
IGFkZCBhIHNlcGFyYXRlIHBhdGNoIGluCj4gPiA+ID4gdGhlIG5leHQgcmV2aXNpb24gdG8gY29u
dmVydCB0aGUgUmVuZXNhcyAuY3ByX3ZhbHVlIGFzIHdlbGwuCj4gPiA+IAo+ID4gPiBNeSB1bmRl
cnN0YW5kaW5nIHRoYXQgeW91IHdhbnQgdG8gc2VuZCBhIHBhdGNoIHNlcmllcyBvZiAzIHBhdGNo
ZXM6Cj4gPiA+IC0gbW92aW5nIERXX1VBUlRfQ1BSXyogdmFsdWVzIGZyb20gQy1maWxlIHRvIGgt
ZmlsZQo+ID4gPiAtIG1vZGlmeSBleGlzdGluZyBSZW5lc2FzIGNhc2UKPiA+IAo+ID4gLSBEVCBi
aW5kaW5nIGZvciBuZXcgSFcgKHBhdGNoIDEgb2YgdGhpcyBzZXJpZXMpCj4gPiAKPiA+ID4gLSBh
ZGQgc3VwcG9ydCBmb3IgeW91ciBIVyAodGhpcyBwYXRjaCBpbiB1cGRhdGVkIGZvcm0pCj4gCj4g
WWVzLCBJIHdpbGwgZm9sbG93IHRoaXMgb3JkZXIgYW5kIHJlc2VuZCB0aGUgc2VyaWVzIGluIHY0
LgoKVGhhbmtzLCBhbmQgc2luY2UgSWxwbyBtZW50aW9uZWQsIG1vdmUgYWxsIERXX1VBUlRfKiBy
ZWdpc3RlciBvZmZzZXRzL2JpdGZpZWxkcwp0byB0aGUgaGVhZGVyIGZpbGUgKGluIHBhdGNoIDEg
b2YgYSBuZXcgc2VyaWVzKS4KCj4gPiBBbmQgSSBmb3Jnb3QgdGhhdCB5b3UgaGF2ZSBhIERUIGJp
bmdpbmcgb25lLi4uIFNvIDQgcGF0Y2hlcyBhZnRlciBhbGwuCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
