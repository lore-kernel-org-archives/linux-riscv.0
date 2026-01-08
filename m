Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A52D148A3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kP1M9Lw5y0N/xiB341thpnYrBtDhFqTnCzjlNLykCP0=; b=y2zH/PnB+AH95z
	nnYEPceASJ/E2nCKKRUX68JJXxwaDqGS9cLsxUdF7XIFOlJFQhRxOeJffnpNtkixZOika2+4Ih5Vg
	lPXv7RwBzNTxyGLckYzLLUbOMtnzQL44yhwqj3xpoxiH3jHZLPhKy2AGC9UKdUb80C9V3wFvJnrGY
	X/xHRjt2b94eIO2qO4hFJAzhec5Ep4UCbMFTdFl9WlPhoCJEuSu4BrWoiSRIPV10DWwTc/fTrBhPS
	8BHLHpJyy4Q+pA2fJRyTJvorbSrsBQgn3+KignsBObpd3d9p88/zhezKhdDEVF/sWFnK/1DVWCr4p
	bdg26SSW/q558RtuwNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkQL-0000000G5gb-09dS;
	Thu, 08 Jan 2026 07:27:13 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkQI-0000000G5g0-1jaj
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 07:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767857231; x=1799393231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ezvxUHWQBwSHLY7nprbyc8zfDEUzlsl6pwpslP0nMw8=;
  b=KT98rXCq7+5a2A87bScXjEMK4tlaHIfCJXdgBdBFGBnEKowfc/0lxzkL
   vlLqMC5mW8XtFrZ7estzXEFfNF3rjYZwrNEOdl160CvwjRPN5UrlUWnCA
   kMrgtel0gJ64slUFpefguBfF7TdFnWe/UqIfRe0PKfvILkONGoQK8Ejqs
   6uV/aQ4rHdgpabQ82B1ywoh134OT4haOAZrtfln3fbjo01qECJce4zvZV
   prEQ57rrjLFXteg4cpxeEtdwTK6oiJtjL8fWBY3WYm68+oc+S773wmJkL
   NZcFA2faS2v6F9yP4FMaIkMf4MtjocJTiypbOobkAD7CmyFiuhAuYMUio
   Q==;
X-CSE-ConnectionGUID: SPq2i+w6TIe4PzVaI/pWtg==
X-CSE-MsgGUID: DPZn8ZwZQFega6u39t5VBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72866333"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72866333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 23:27:06 -0800
X-CSE-ConnectionGUID: TqqKpd65Q9GsbikxeX6Zhw==
X-CSE-MsgGUID: R6aR2w4qSyyuCRBBKN3grg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="208199114"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 23:27:01 -0800
Date: Thu, 8 Jan 2026 09:26:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	kees@kernel.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, Jason@zx2c4.com,
	conor.dooley@microchip.com, samuel.holland@sifive.com,
	charlie@rivosinc.com, ajones@ventanamicro.com, nathan@kernel.org,
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/5] lib/string_kunit: add test case for strnlen
Message-ID: <aV9cQ2QMA-jwFNUO@smile.fi.intel.com>
References: <20260107023517.46840-1-jiangfeng@kylinos.cn>
 <20260107023517.46840-3-jiangfeng@kylinos.cn>
 <CAHp75VfxT+K1QRc5ayZGc4joB9vFJrk7kjQ4gAgUHOT1boFbmA@mail.gmail.com>
 <b419c6db-0f3f-4666-8f7c-156f7eda2b5b@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b419c6db-0f3f-4666-8f7c-156f7eda2b5b@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_232710_596035_2D3135CF 
X-CRM114-Status: GOOD (  12.78  )
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

T24gVGh1LCBKYW4gMDgsIDIwMjYgYXQgMDI6NTM6NThQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90
ZToKPiBPbiAyMDI2LzEvNyAxOTo1NiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gT24gV2Vk
LCBKYW4gNywgMjAyNiBhdCA0OjM14oCvQU0gRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3Mu
Y24+IHdyb3RlOgoKLi4uCgo+ID4+IEFkZCBhIEtVbml0IHRlc3QgZm9yIHN0cm5sZW4oKSB0byB2
ZXJpZnkgY29ycmVjdG5lc3MgYWNyb3NzCj4gPj4gZGlmZmVyZW50IHN0cmluZyBsZW5ndGhzIGFu
ZCBtZW1vcnkgYWxpZ25tZW50cy4KPiA+IAo+ID4gU2FtZSBjb21tZW50IGFzIHBlciBwYXRjaCAx
IChpdCB3b3VsZCBwcm9iYWJseSByZXF1aXJlIHRvIGNhbGwgZm9yCj4gPiBhcmNoX3N0cm5sZW4o
KSBvciBzb21ldGhpbmcgbGlrZSB0aGlzKS4KPiAKPiBUaGFua3MsIG1ha2VzIHNlbnNlLgo+IAo+
IEknbGwgYWRkIHRoZSBwZXJmb3JtYW5jZSBiZW5jaG1hcmtpbmcgKHJhbmRvbSBmaWxsaW5nICsg
dGltaW5nKSBpbiBWMi4KPiAKPiBTaW5jZSBzdHJpbmcgZnVuY3Rpb25zIGFyZSB0eXBpY2FsbHkg
ZXhwb3J0ZWQgZGlyZWN0bHkgYnkgZWFjaCBhcmNoaXRlY3R1cmUKPiB3aXRob3V0IGFuIGFyY2hf
IHByZWZpeCwgSSdsbCBpbnRyb2R1Y2UgYSBnZW5lcmljX3N0cm5sZW4oKSAoYmFzZWQgb24KPiBs
aWIvc3RyaW5nLmMpIHdpdGhpbiB0aGUgdGVzdCBmb3IgY29tcGFyaXNvbi4KClByb2JhYmx5IHlv
dSB3YW50IHRvIG1ha2UgdGhlIGV4aXN0aW5nIG9uZSB0byBoYXZlIHRoYXQgbmFtZSBhbmQgdXNl
IGl0IGluc2lkZQp0aGUgdGVzdCBhbmQgaW4gdGhlIGZhbGxiYWNrIHdyYXBwZXIuIFdlIGRvbid0
IHdhbnQgdG8gaGF2ZSBkdXBsaWNhdGUgY29kZSwgaXQKaXMgYmFkIGZyb20gbWFpbnRlbmFuY2Ug
cGVyc3BlY3RpdmUuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
