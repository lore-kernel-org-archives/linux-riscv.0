Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D19C7EE33
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNZM7C+iVxX8EZ8qs3P+yHBW+jN8rYnMtPhbl9xBdpc=; b=G4n6dMSolH9HB7
	zqQkRxrtJ9ZIqXumx/4RvBhYph5hyim3Bsr9/kwERNHznWLo2sfTOMrMoeVglG6ZTFCk+nokNkjOL
	ud+QNkUsU4eqk1lA6h/2PP+6/jxtgcBXWoJCK2n6OaBQ2SeKAquzRyD8XZrr8Azs6j1At01YsrDAz
	lRWbrh+YbG3Pex+5JRkr4mSfSnl2+/sFdGQH7VNuDesK4YajzH7wwNVQPLJNMxAr2mzn1fM4wDTN7
	i59M0MlFMxTCxIfE2Q0Dmu4Ce7IK7jv3jEE7wp+dKJ4M+S726MVAKS+A21YcXcNlG44/RyuNq0UTi
	r8s7CExxo9ke++FiK6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAL-000000027DI-1Gee;
	Mon, 23 Jun 2025 09:08:37 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTctZ-000000023wc-1Pp9
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668677; x=1782204677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pUTt++AaA3xZ/EEgqLRC2Xe4dn+oIgpfZgMfM0kN/E8=;
  b=lCpGfihk3dDlcGziFJsaFZXlfBTLvOoBQfkH1MpgS0LQLTXbYcAMlTgO
   5CV0S9TX6XRI3RUWx1172kkHLKmDEOgLkfMDXtE5Bp6k4/kRW6BTTqPOg
   xzhPCFkTwYN1gxGODjK6ewe+6BTf1hE2ivu/2CsHWgwTlx1dVbwqGFhG/
   duv21iKGArG22YUeUP/a+t3k+7vtur1xydaWEOLbXruCWhvk9cgXes957
   K7CfhHV7FtJLz7VBh1oPrR54PmWyZFpRZes2TMnpaKf5X+RAr8cySJx28
   ynukVhtJDbP3B3rlTmLsGqo7cHsMztWBio1ksDR7oqjLop8ieP5wCUW66
   Q==;
X-CSE-ConnectionGUID: dqx93oWkSEmbIC9ht/Js0w==
X-CSE-MsgGUID: BVzlQtqvQmKe62oDV3Hj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52941055"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52941055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:51:15 -0700
X-CSE-ConnectionGUID: STb68b2sR9CARqb+WPZ4jQ==
X-CSE-MsgGUID: 4MpMhRkRQBOcrFkdNlGbmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="182578435"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:51:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTctL-00000009788-3ffU;
	Mon, 23 Jun 2025 11:51:03 +0300
Date: Mon, 23 Jun 2025 11:51:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v6 00/23] Linux SBI MPXY and RPMI drivers
Message-ID: <aFkVdzxl5GhV_etE@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_015117_389416_3A2DD37F 
X-CRM114-Status: GOOD (  17.62  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdW4gMjIsIDIwMjUgYXQgMTE6MjY6MjFBTSAtMDUwMCwgSmFzc2kgQnJhciB3cm90
ZToKPiBPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCA3OjE04oCvQU0gQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBTQkkgdjMuMCAoTVBYWSBleHRl
bnNpb24pIFsxXSBhbmQgUlBNSSB2MS4wIFsyXSBzcGVjaWZpY2F0aW9ucwo+ID4gYXJlIGZyb3pl
biBhbmQgaW4gcHVibGljIHJldmlldyBhdCB0aGUgUklTQy1WIEludGVybmF0aW9uYWwuCj4gPgo+
ID4gQ3VycmVudGx5LCBtb3N0IG9mIHRoZSBSUE1JIGFuZCBNUFhZIGRyaXZlcnMgYXJlIGluIE9w
ZW5TQkkgd2hlcmVhcwo+ID4gTGludXggb25seSBoYXMgU0JJIE1QWFkgbWFpbGJveCBjb250cm9s
bGVyIGRyaXZlciwgUlBNSSBjbG9jayBkcml2ZXIKPiA+IGFuZCBSUE1JIHN5c3RlbSBNU0kgZHJp
dmVyIFRoaXMgc2VyaWVzIGFsc28gaW5jbHVkZXMgQUNQSSBzdXBwb3J0Cj4gPiBmb3IgU0JJIE1Q
WFkgbWFpbGJveCBjb250cm9sbGVyIGFuZCBSUE1JIHN5c3RlbSBNU0kgZHJpdmVycy4KPiA+Cj4g
PiBUaGVzZSBwYXRjaGVzIGNhbiBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfc2JpX21weHlfbWFpbGJv
eF92NiBicmFuY2gKPiA+IGF0OiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQK
PiA+Cj4gPiBUbyB0ZXN0IHRoZXNlIHBhdGNoZXMsIGJvb3QgTGludXggb24gInZpcnQscnBtaT1v
bixhaWE9YXBsaWMtaW1zaWMiCj4gPiBtYWNoaW5lIHdpdGggT3BlblNCSSBhbmQgUUVNVSBmcm9t
IHRoZSBkZXYtdXBzdHJlYW0gYnJhbmNoIGF0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3ZlbnRh
bmFtaWNyby9vcGVuc2JpLmdpdAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3ZlbnRhbmFtaWNyby9x
ZW11LmdpdAoKPiBJIGFtIG9rIHdpdGggdGhlIG1haWxib3ggcGF0Y2hlcy4gSG93IGFyZSB0aGVz
ZSB0byBiZSBwaWNrZWQgaW50bwo+IG1haWxib3ggYW5kIG90aGVyIHN1YnN5c3RlbXM/IE1heWJl
IHNjdWxwdCBvdXQgYSBzZXBhcmF0ZSBwYXRjaHNldCBmb3IKPiB0aGUgbWFpbGJveD8KCkkgaGF2
ZSBxdWVzdGlvbnMgLyBjb21tZW50cyB0byB0aGUgc2VyaWVzLCBpdCdzIGp1c3QgdG9vIGxvbmcg
dG8gZG8gaXQKaW4gb25lIGdvLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVu
a28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
