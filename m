Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F60F9B5E0
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Si1buX2RU3/mam90h+ktQegZJILk+2Wmu6rzgABGAg=; b=ipzXqJVPCiaXmS
	p6y4412A5so+to5hkN59eyC6vr9+Ej5T7k3UzVoMlrnCSiSgy0B8oSyIluIKaevNyIxjXnW4w9YAm
	B91QsVHISg1t5JdcJ+bVNff99jl5bQJSsiD6oM+T1gukKGBUBWjwjFjzCXeZq9ITK1Jx4gNG3AThI
	Dfr+OxvFCcRQXUW9NR/VvlGEZP4ugvIIHfG590ajMMRwSqk85WAFt9a4nhHpFcb+uIdu2x+T7kflc
	djpQzQhCPK5pPMD35VvtbGPEwnhHFdVaqt2HikU3SN7DzGxD+/GWbxUCK0OdOj6EQGfIGWEzuvy2i
	rOuxWQf+AplcHS/G9L+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTEb-00000009nZR-1QUI;
	Wed, 22 Apr 2026 08:47:01 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTEZ-00000009nYm-0UnD
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 08:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776847619; x=1808383619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vM9sm12mnI72E842Q8bydmFKMswrt99MkGPaRQhHRH0=;
  b=VKsMleEWZWV0LVN/vJP1AHrrQy9rcBmVcaq/aOkxRZsSoySWkWhRTm0Y
   kKnK6hR7WwTaiEGdJYMZX+u9hJJV57CAfRKGTiNiNRUn6DGJa2d9boV6r
   E9tqom8U4fSCNl668reW0WHoz1tc2JM7GfP5RejLKvCBBaQkrTqZxU0HA
   hK6y4C7B3reiycylQTk7iryzN9JehTjWr8PyUq5czeZxq7/ygIO9ka9of
   jkmZq3EtptEALAlRA2sBIC0S+DMnSo/e21uSPYs0MtAi6ZGNXRedgbd77
   MajtlOOYsI1190Tm8n5qZDGLVH49U8AukQSMUKXj/9VsRQFMq7WBfjnPV
   Q==;
X-CSE-ConnectionGUID: DiEPMaAoTH2zVOnZ6IBtxg==
X-CSE-MsgGUID: 8wp1j6ItS8SLmatH4tvwcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77862005"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77862005"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:46:58 -0700
X-CSE-ConnectionGUID: 65oSOmPBSSis/42Og0oeyw==
X-CSE-MsgGUID: o6aT+++ZQ2ijp07hj/FQ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231410362"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:46:54 -0700
Date: Wed, 22 Apr 2026 11:46:51 +0300
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
Message-ID: <aeiK-350Uozq3pVa@ashevche-desk.local>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
 <177681947637.2697678.10937675549830278979.b4-reply@b4>
 <aeiKsv3bFPJ94InI@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aeiKsv3bFPJ94InI@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_014659_164874_3CECBA12 
X-CRM114-Status: GOOD (  16.31  )
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

T24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgMTE6NDU6NDRBTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgQXByIDIyLCAyMDI2IGF0IDA4OjU3OjU2QU0gKzA4MDAsIEppYSBX
YW5nIHdyb3RlOgoKLi4uCgo+ID4gSnVzdCB0byBjb25maXJtOiBzaW5jZSB5b3UgbWVudGlvbmVk
IHRoYXQgdGhlIHByZXBhcmF0b3J5IHBhdGNoIG1vdmluZwo+ID4gdGhlIERXX1VBUlQgcmVnaXN0
ZXIgZGVmaW5lcyBpcyBhbHJlYWR5IGluIHBsYWNlLCBJIGRvbid0IG5lZWQgdG8gbW92ZQo+ID4g
dGhlbSBhZ2FpbiwgY29ycmVjdD8KPiA+IAo+ID4gSSB3aWxsIHVwZGF0ZSBteSBwYXRjaCB0byB1
c2UgdGhlIERXX1VBUlRfQ1BSXyogbWFjcm9zIGFuZAo+ID4gRklFTERfUFJFUF9DT05TVCgpIGFj
Y29yZGluZ2x5LCBhbmQgSeKAmW0gaGFwcHkgdG8gYWRkIGEgc2VwYXJhdGUgcGF0Y2ggaW4KPiA+
IHRoZSBuZXh0IHJldmlzaW9uIHRvIGNvbnZlcnQgdGhlIFJlbmVzYXMgLmNwcl92YWx1ZSBhcyB3
ZWxsLgo+IAo+IE15IHVuZGVyc3RhbmRpbmcgdGhhdCB5b3Ugd2FudCB0byBzZW5kIGEgcGF0Y2gg
c2VyaWVzIG9mIDMgcGF0Y2hlczoKPiAtIG1vdmluZyBEV19VQVJUX0NQUl8qIHZhbHVlcyBmcm9t
IEMtZmlsZSB0byBoLWZpbGUKPiAtIG1vZGlmeSBleGlzdGluZyBSZW5lc2FzIGNhc2UKCi0gRFQg
YmluZGluZyBmb3IgbmV3IEhXIChwYXRjaCAxIG9mIHRoaXMgc2VyaWVzKQoKPiAtIGFkZCBzdXBw
b3J0IGZvciB5b3VyIEhXICh0aGlzIHBhdGNoIGluIHVwZGF0ZWQgZm9ybSkKCkFuZCBJIGZvcmdv
dCB0aGF0IHlvdSBoYXZlIGEgRFQgYmluZ2luZyBvbmUuLi4gU28gNCBwYXRjaGVzIGFmdGVyIGFs
bC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
