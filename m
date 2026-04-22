Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3625FF9B5E1
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXY3eKNtTQ6ioRhAT3vaDUu5VvEBjsmPYjzjx+gFEJg=; b=R8ThYE5aUSIDca
	7Iz5GAlkNf1h8T4SdJavyOy7cZPm2El1Hr4sXkTYUS24VynJcr1gfRSe3DkIBgfeni3no7BrV5XsJ
	WjZSB8hRNe0Kzqi4raGgQCIePTAxKipTAb5hhHtVfvZR97/jNj2P8AicsV1FzwqLUpAOo6fR6JUyS
	3fYahUQVJ3jv3ltE9wCrHWkofm4VD0iILrGqCPALnY6SAPDz4hVFLjSeimw6TDnXlDh2U65WwdnPq
	Z2osrc0aOyGFy0604ygNgriuRg5yK8sC3E0LMlH+R6e24qypg3W3JdjYdu4PSFWsDlq2aYSwQi9SH
	xEhNRp6nkDXICSkX8fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTDQ-00000009nRB-46ff;
	Wed, 22 Apr 2026 08:45:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTDN-00000009nQg-2kWH
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 08:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776847546; x=1808383546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kAZKGbEkF2qeX8pzpvk4+B4omyz2ngu8foo9/1Gq4O0=;
  b=X7HBsDVQ1kYM8anVO/z+5gzkcmF0VshfI3vD1B5N7up41+XIuyBeHLh/
   LdmRd8+Ef6eTq2nDwF2+d/dcMYSoKNclGenAEOr7mFwSlaYAJ67bfiGxP
   b+jbqpmtbp3F8ZHNW0ZUoNb1itDTvq48oO3lur4F53ohrSRAAd/Eqm7qu
   kHZgUQw9dC3sm1wPzwI+XJa3pSOMT+DCp37vbdRO78o+qG+b0XtsFpM+6
   d1B0S+DfZMIyYqvFO8etpcCNb6YAlNhtoyoHVJtOq+MnsSimK53d87gJ3
   Syd8amkw1ZozRIU0YoT5GYAGpd/seyGdMCHIrFEgT6lU/vnhe4M1hdm/U
   Q==;
X-CSE-ConnectionGUID: uxrWUoDHR16Q3oYkH9KHmg==
X-CSE-MsgGUID: iXpBVROySLSMaYuIwLF8NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77980676"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77980676"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:45:44 -0700
X-CSE-ConnectionGUID: Zo5CQ7RfTUyM4hs6DgTCow==
X-CSE-MsgGUID: g4Nkvgz1RXOHPSJj0XIlTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="225805165"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:45:40 -0700
Date: Wed, 22 Apr 2026 11:45:38 +0300
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
Message-ID: <aeiKsv3bFPJ94InI@ashevche-desk.local>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
 <177681947637.2697678.10937675549830278979.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177681947637.2697678.10937675549830278979.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_014546_221058_A05E669C 
X-CRM114-Status: GOOD (  22.12  )
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

T24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgMDg6NTc6NTZBTSArMDgwMCwgSmlhIFdhbmcgd3JvdGU6
Cj4gT24gMjAyNi0wNC0yMSAxNToxOCArMDMwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gPiBP
biBUdWUsIDIxIEFwciAyMDI2LCBKaWEgV2FuZyB3cm90ZToKCi4uLgoKPiA+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEgZHc4MjUwX3VsdHJhcmlzY19kcDEwMDBf
ZGF0YSA9IHsKPiA+ID4gKwkudXNyX3JlZyA9IERXX1VBUlRfVVNSLAo+ID4gPiArCS5jcHJfdmFs
dWUgPSAweDAwMDIyMDIyLAo+ID4gCj4gPiBQbGVhc2UgY29uc3RydWN0IHRoZSBjcHJfdmFsdWUg
YnkgT1JpbmcgRFdfVUFSVF9DUFJfKiBkZWZpbmVzIHRvZ2V0aGVyLgo+ID4gRm9yIGZpZWxkcywg
RklFTERfUFJFUF9DT05TVCgpIG1heSBiZSB1c2VmdWwuCj4gPiAKPiA+IEluIG9yZGVyIHRvIGJl
IGFibGUgdG8gdXNlIHRoZSBEV19VQVJUX0NQUl8qIGRlZmluZXMsIHRoZXkgbmVlZCB0byBiZSAK
PiA+IG1vdmVkIGludG8gODI1MF9kd2xpYi5oIChJJ2QgbW92ZSBhbGwgRFdfVUFSVCByZWdpc3Rl
ciBkZWZpbmVzIGluIGEgCj4gPiBwcmVwYXJhdG9yeSBwYXRjaCkuCj4gPiAKPiA+IEkga25vdyB0
aGUgZXhpc3RpbmcgUmVuZXNhcycgLmNwcl92YWx1ZSBkb2Vzbid0IGZvbGxvdyB0aGlzIGNvbnZl
bnRpb24gYnV0IAo+ID4gdGhhdCBjb3VsZCBiZSBjb252ZXJ0ZWQgYXMgd2VsbCAoaW4gYW5vdGhl
ciBwYXRjaCwgb3IgbGVhdmUgdGhlIFJlbmVzYXMgCj4gPiBlbnRyeSBjb252ZXJzaW9uIHRvIG1l
IGlmIHlvdSBkb24ndCB3YW50IHRvIGRvIHRoYXQpLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHJldmll
dy4KPiAKPiBKdXN0IHRvIGNvbmZpcm06IHNpbmNlIHlvdSBtZW50aW9uZWQgdGhhdCB0aGUgcHJl
cGFyYXRvcnkgcGF0Y2ggbW92aW5nCj4gdGhlIERXX1VBUlQgcmVnaXN0ZXIgZGVmaW5lcyBpcyBh
bHJlYWR5IGluIHBsYWNlLCBJIGRvbid0IG5lZWQgdG8gbW92ZQo+IHRoZW0gYWdhaW4sIGNvcnJl
Y3Q/Cj4gCj4gSSB3aWxsIHVwZGF0ZSBteSBwYXRjaCB0byB1c2UgdGhlIERXX1VBUlRfQ1BSXyog
bWFjcm9zIGFuZAo+IEZJRUxEX1BSRVBfQ09OU1QoKSBhY2NvcmRpbmdseSwgYW5kIEnigJltIGhh
cHB5IHRvIGFkZCBhIHNlcGFyYXRlIHBhdGNoIGluCj4gdGhlIG5leHQgcmV2aXNpb24gdG8gY29u
dmVydCB0aGUgUmVuZXNhcyAuY3ByX3ZhbHVlIGFzIHdlbGwuCgpNeSB1bmRlcnN0YW5kaW5nIHRo
YXQgeW91IHdhbnQgdG8gc2VuZCBhIHBhdGNoIHNlcmllcyBvZiAzIHBhdGNoZXM6Ci0gbW92aW5n
IERXX1VBUlRfQ1BSXyogdmFsdWVzIGZyb20gQy1maWxlIHRvIGgtZmlsZQotIG1vZGlmeSBleGlz
dGluZyBSZW5lc2FzIGNhc2UKLSBhZGQgc3VwcG9ydCBmb3IgeW91ciBIVyAodGhpcyBwYXRjaCBp
biB1cGRhdGVkIGZvcm0pCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
