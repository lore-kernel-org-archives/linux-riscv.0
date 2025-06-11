Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C3DC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOVr0G3fd+AFdTTVw4ZDYc1L9cSxHNK6+ZRkQqzDId4=; b=fc5Y8OBOrYZyL7
	kvYj+0EQRhNzxLAybYJMzOgSSDSOzu/pxVgxlJXOpt4780XfcnTgFcDS2ccd68R3aMQue0BSQbHCN
	BlMl4f4xGjrXq7xgbrcRZVRyfWr67+qrgWlw1hDdTIFcvPIf91WVZYU99lSJJ3pojdzaqGakjwohR
	jiHrfrbeW13fsFK5O2ffVqrHXsZirnQGvx27ONa7rQhiQmKbNJ7oisRukl3Hk9jE94iQR8rOx9XSq
	Ap/3WNDsfSzWGabeIe0Tc/b+t+rMwdYWzrjFsRY3pNzXqU8AmKm7NjlBVNuIYvw/WTf9nQqr0Y26y
	aulBGKYxiGkQKXKtvGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwI-00000009HtA-3fVK;
	Wed, 11 Jun 2025 08:36:06 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGkP-00000009Fzp-1P55
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749630229; x=1781166229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h7WpXxo70UJLYX5/Z3xfT7hyHwyHuDuPmHeLXuHqpV8=;
  b=CX66FWCbXZLbqz+O/Rt2t02CsFIwWFA+8nzMD79fFGTgnkdoW2NbkNsp
   ZZkf+8zlJnVOiDSNQEMMn/JGkcux/4L+WdkMrgvIDBm09I4SdJhlaJW4U
   Z+/ap6jNgC5fmK/aofjgR2PAVEiYJKZOmk0Jm+uFpje9XEFUeLYCUZE/U
   s7U/L6pI4dlXRqYNtmd9ZWSyt0b8Bkz/uyf72/oh9yAqoTzrCk+k27Usv
   4a2CEVfLdYbB7//OpuLLs9bNUgwmvkP6TvJtv2Mu+nnjRT6WOpjsvjaWm
   6LIgc5htIc0F2JLTzY7w4Rpxj4Ib4Xtfd7hHHVwa3hhsvKR58CPrAiQO0
   g==;
X-CSE-ConnectionGUID: wm9wF6TSSL+4/LOOT9PF6w==
X-CSE-MsgGUID: VUjkmTWJRJSzjwFAcAredw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63111653"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="63111653"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:23:49 -0700
X-CSE-ConnectionGUID: rmDENUhWStuVjFMmiFaTDg==
X-CSE-MsgGUID: YgxAeiPaQnyPDxy83xmGaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178040297"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:23:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGkE-00000005aFn-0c0H;
	Wed, 11 Jun 2025 11:23:38 +0300
Date: Wed, 11 Jun 2025 11:23:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aEk9CetUHxK9OqQV@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
 <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
 <aEc-SHvL187xdj-m@smile.fi.intel.com>
 <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
 <aEgBGup553Pki98e@smile.fi.intel.com>
 <CAK9=C2Ww0Mt91x_r0VTffse-AiWcOyBYvWpxxK7p5=+EDUEoMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2Ww0Mt91x_r0VTffse-AiWcOyBYvWpxxK7p5=+EDUEoMw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012349_384565_B98329DD 
X-CRM114-Status: GOOD (  31.19  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMTA6NTE6MTVBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIEp1biAxMCwgMjAyNSBhdCAzOjI14oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBUdWUsIEp1
biAxMCwgMjAyNSBhdCAxMDowNToyN0FNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiBP
biBUdWUsIEp1biAxMCwgMjAyNSBhdCAxOjM04oCvQU0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+IDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwg
SnVuIDA5LCAyMDI1IGF0IDA1OjU5OjQwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+
ID4gPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCA0OjIz4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4g
PiA+ID4gPiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4g
PiA+ID4gT24gU3VuLCBNYXkgMjUsIDIwMjUgYXQgMDI6MTY6NTRQTSArMDUzMCwgQW51cCBQYXRl
bCB3cm90ZToKCi4uLgoKPiA+ID4gPiA+ID4gPiArICAgICBpZiAobWJveC0+bXNpX2NvdW50KQo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJcyB0aGlzIGNoZWNrIHJlYWxseSBuZWVkZWQ/Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gTVNJcyBhcmUgb3B0aW9uYWwgZm9yIHRoZSBTQkkgTVBYWSBtYWlsYm94
IHNvIHdlIHNob3VsZCBvbmx5IHVzZQo+ID4gPiA+ID4gcGxhdGZvcm1fZGV2aWNlX21zaV94eXoo
KSBBUElzIG9ubHkgd2hlbiBNU0lzIGFyZSBhdmFpbGFibGUuCj4gPiA+ID4KPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgIHBsYXRmb3JtX2RldmljZV9tc2lfZnJlZV9pcnFzX2FsbChtYm94LT5k
ZXYpOwo+ID4gPiA+Cj4gPiA+ID4gSG1tLi4uIEkgYW0gbm90IHN1cmUgd2h5LiBEbyB5b3UgaGF2
ZSBhbnkgT29wcyBvciB3YXJuaW5ncyBpZiB0aGUgY2hlY2sKPiA+ID4gPiBpcyBub3QgdGhlcmUg
YW5kIG5vIE1TSSBwcm92aWRlZD8KPiA+ID4KPiA+ID4gV2UgZG9uJ3Qgc2VlIGFueSBvb3BzIG9y
IHdhcm5pbmdzLiBUaGlzIGNoZWNrIGlzIHRvIGF2b2lkIHVubmVjZXNzYXJ5Cj4gPiA+IHdvcmsg
KHN1Y2ggYXMgYWNxdWlyaW5nIGxvY2ssIGNoZWNraW5nIGRlZmF1bHQgZG9tYWluLCBldGMpIGlu
IHRoZQo+ID4gPiBtc2lfZG9tYWluX2ZyZWVfaXJxc19hbGwoKSBjYWxsZWQgYnkgcGxhdGZvcm1f
ZGV2aWNlX21zaV9mcmVlX2lycXNfYWxsKCkuCj4gPiA+Cj4gPiA+IEkgZG9uJ3QgbWluZCBkcm9w
cGluZyB0aGUgY2hlY2sgc28gSSB3aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KPiA+
Cj4gPiBQZXJoYXBzIHlvdSBjYW4gcmF0aGVyIGFkZCB0aGlzIGNoZWNrIGludG8gdGhlIGNhbGxl
ZT8gU2VlbXMgdG8gbWUgdGhhdAo+ID4geW91IGhhdmUgYSBqdXN0aWZpY2F0aW9uIGZvciBpdC4g
VXN1YWwgcGF0dGVybiBpbiB0aGUga2VybmVsIHRoYXQgZnJlZWluZwo+ID4gcmVzb3VyY2VzIHNo
b3VsZCBiZSBhd2FyZSBvZiB0aGUgTlVMTCBwb2ludGVycyBvciBvcHRpb25hbCByZXNvdXJjZXMK
PiA+IHNvIHdlIG1heSBjYWxsIGl0IHVuY29uZGl0aW9uYWxseSBmcm9tIHRoZSB1c2VyKHMpLgo+
ID4KPiAKPiBVbmNvbmRpdGlvbmFsbHkgY2FsbGluZyBwbGF0Zm9ybV9kZXZpY2VfbXNpX2ZyZWVf
aXJxc19hbGwoKSB3aGVuIHRoZXJlCj4gd2VyZSBubyBNU0lzIGFsbG9jYXRlZCBjYXVzZXMgdGhl
IGJlbG93IGNyYXNoIGJlY2F1c2UgImRldi0+bXNpLmRhdGEiCj4gaXMgbm9uLU5VTEwgb25seSB3
aGVuOgo+IAo+IFsgICAgMS4zNTU3MzVdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZSBhdAo+IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDA4Cj4g
WyAgICAxLjM1ODIxMl0gQ3VycmVudCBzd2FwcGVyLzAgcGd0YWJsZTogNEsgcGFnZXNpemUsIDU3
LWJpdCBWQXMsCj4gcGdkcD0weDAwMDAwMDAwODFhMmIwMDAKPiBbICAgIDEuMzYwNjMyXSBbMDAw
MDAwMDAwMDAwMDAwOF0gcGdkPTAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDEuMzYzMTMyXSBPb3Bz
IFsjMV0KPiBbICAgIDEuMzYzNzQ4XSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICAgIDEuMzY0NzY4
XSBDUFU6IDMgVUlEOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKPiA2LjE2
LjAtcmMxLTAwMDM3LWdhYjU1ZTFjMWQ5N2EtZGlydHkgIzcgTk9ORQo+IFsgICAgMS4zNjgzMjVd
IGVwYyA6IG11dGV4X2xvY2srMHgwLzB4MjgKPiBbICAgIDEuMzY5Nzk2XSAgcmEgOiBfX21zaV9s
b2NrX2Rlc2NzKzB4MzIvMHgzYwo+IFsgICAgMS4zNzAyMzRdIGVwYyA6IGZmZmZmZmZmODBhZjk2
ZTggcmEgOiBmZmZmZmZmZjgwMDAzOGU2IHNwIDoKPiBmZjIwMDAwMDAwMDRiYTkwCj4gWyAgICAx
LjM3MjQxMl0gIGdwIDogZmZmZmZmZmY4MTgxOWMwMCB0cCA6IGZmNjAwMDAwMDFkYzAwMDAgdDAg
Ogo+IDY5MDAwMDAwMDAwMDAwMDAKPiBbICAgIDEuMzczNTI3XSAgdDEgOiAwMDAwMDAwMDAwMDAw
MDcyIHQyIDogNjk2MjczMmQ3NjYzNzM2OSBzMCA6Cj4gZmYyMDAwMDAwMDA0YmFiMAo+IFsgICAg
MS4zNzY2MjhdICBzMSA6IGZmNjAwMDAwMDI0MWM0MTAgYTAgOiAwMDAwMDAwMDAwMDAwMDA4IGEx
IDoKPiBmZmZmZmZmZjgxNjhjYTU4Cj4gWyAgICAxLjM3OTExMF0gIGEyIDogMDAwMDAwMDAwMDAw
MDAxMCBhMyA6IDAwMDAwMDAwMDAwMDAwYTMgYTQgOgo+IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAg
IDEuMzgwNDEwXSAgYTUgOiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBh
NyA6Cj4gMDAwMDAwMDA0NDQyNDM0ZQo+IFsgICAgMS4zODEwMTldICBzMiA6IDAwMDAwMDAwMDAw
MDAwMDAgczMgOiBmZjYwMDAwMDNmZmYzMGEwIHM0IDoKPiBmZjYwMDAwMDAyNDFjNDEwCj4gWyAg
ICAxLjM4MTU3OV0gIHM1IDogZmY2MDAwMDAwMzlmOTMyMCBzNiA6IGZmNjAwMDAwMDI0MWM0MDAg
czcgOgo+IDAwMDAwMDAwMDAwMDAwMDIKPiBbICAgIDEuMzgyMjQyXSAgczggOiBmZmZmZmZmZjgx
ODIxZmEwIHM5IDogMDAwMDAwMDAwMDAwMDAwMCBzMTA6Cj4gMDAwMDAwMDAwMDAwMDAwMAo+IFsg
ICAgMS4zODQwMThdICBzMTE6IDAwMDAwMDAwMDAwMDAwMDAgdDMgOiBmZmZmZmZmZjgxODMwYTM3
IHQ0IDoKPiBmZmZmZmZmZjgxODMwYTM3Cj4gWyAgICAxLjM4NTk1OF0gIHQ1IDogZmZmZmZmZmY4
MTgzMGEzOCB0NiA6IGZmMjAwMDAwMDAwNGI3YzgKPiBbICAgIDEuMzg3MzA2XSBzdGF0dXM6IDAw
MDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwOAo+IGNhdXNlOiAwMDAwMDAw
MDAwMDAwMDBkCj4gWyAgICAxLjM4ODQwN10gWzxmZmZmZmZmZjgwYWY5NmU4Pl0gbXV0ZXhfbG9j
aysweDAvMHgyOAo+IFsgICAgMS4zODkzMzNdIFs8ZmZmZmZmZmY4MDAwM2RiYT5dIG1zaV9kb21h
aW5fZnJlZV9pcnFzX2FsbCsweDJhLzB4NDgKPiBbICAgIDEuMzkwMjc1XSBbPGZmZmZmZmZmODA3
MTRlODY+XSBwbGF0Zm9ybV9kZXZpY2VfbXNpX2ZyZWVfaXJxc19hbGwrMHgxNi8weDJjCj4gWyAg
ICAxLjM5MTcxNV0gWzxmZmZmZmZmZjgwOGQ4MTE0Pl0gbXB4eV9tYm94X3Byb2JlKzB4NmRjLzB4
NzUwCj4gWyAgICAxLjM5MjUyMl0gWzxmZmZmZmZmZjgwNmYxNzA2Pl0gcGxhdGZvcm1fcHJvYmUr
MHg0ZS8weGI0Cj4gWyAgICAxLjM5MzE2OV0gWzxmZmZmZmZmZjgwNmVlZjU4Pl0gcmVhbGx5X3By
b2JlKzB4ODQvMHgyMzAKPiBbICAgIDEuMzkzNzg5XSBbPGZmZmZmZmZmODA2ZWYxNjA+XSBfX2Ry
aXZlcl9wcm9iZV9kZXZpY2UrMHg1Yy8weGRjCj4gWyAgICAxLjM5NDI4Ml0gWzxmZmZmZmZmZjgw
NmVmMmE0Pl0gZHJpdmVyX3Byb2JlX2RldmljZSsweDJjLzB4ZjgKPiBbICAgIDEuMzk2NTc3XSBb
PGZmZmZmZmZmODA2ZWY0YWM+XSBfX2RyaXZlcl9hdHRhY2grMHg2Yy8weDE1Ywo+IFsgICAgMS4z
OTc2MzRdIFs8ZmZmZmZmZmY4MDZlZDE0Nj5dIGJ1c19mb3JfZWFjaF9kZXYrMHg2Mi8weGIwCj4g
WyAgICAxLjM5OTA2MF0gWzxmZmZmZmZmZjgwNmVlYTlhPl0gZHJpdmVyX2F0dGFjaCsweDFhLzB4
MjQKPiBbICAgIDEuMzk5NzkyXSBbPGZmZmZmZmZmODA2ZWUzMWU+XSBidXNfYWRkX2RyaXZlcisw
eGNlLzB4MWQ4Cj4gWyAgICAxLjQwMDM2M10gWzxmZmZmZmZmZjgwNmYwMjBjPl0gZHJpdmVyX3Jl
Z2lzdGVyKzB4NDAvMHhkYwo+IFsgICAgMS40MDA4MzJdIFs8ZmZmZmZmZmY4MDZmMTQxND5dIF9f
cGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKzB4MWMvMHgyNAo+IFsgICAgMS40MDE1NTFdIFs8ZmZm
ZmZmZmY4MGMzZGY3ZT5dIG1weHlfbWJveF9kcml2ZXJfaW5pdCsweDFhLzB4MjQKPiBbICAgIDEu
NDAyMzI4XSBbPGZmZmZmZmZmODAwMTA4YjI+XSBkb19vbmVfaW5pdGNhbGwrMHg1Ni8weDFkOAo+
IFsgICAgMS40MDM2NzRdIFs8ZmZmZmZmZmY4MGMwMTIzNj5dIGtlcm5lbF9pbml0X2ZyZWVhYmxl
KzB4MjY2LzB4MmQwCj4gWyAgICAxLjQwNDk1Nl0gWzxmZmZmZmZmZjgwYWY1NDlhPl0ga2VybmVs
X2luaXQrMHgxZS8weDEzYwo+IFsgICAgMS40MDU0MjJdIFs8ZmZmZmZmZmY4MDAxMjI2Nj5dIHJl
dF9mcm9tX2Zvcmtfa2VybmVsKzB4ZS8weGNjCj4gWyAgICAxLjQwNTg3MF0gWzxmZmZmZmZmZjgw
YWZmMDQyPl0gcmV0X2Zyb21fZm9ya19rZXJuZWxfYXNtKzB4MTYvMHgxOAo+IAo+IEl0IGlzIGJl
dHRlciB0byBoYXZlIHRoZSBjaGVjayBvbiAibWJveC0+bXNpX2NvdW50IiBiZWZvcmUgY2FsbGlu
Zwo+IHBsYXRmb3JtX2RldmljZV9tc2lfZnJlZV9pcnFzX2FsbCgpLgoKUmlnaHQsIHRoYW5rcyBm
b3IgY29uZmlybWluZy4gQnV0IG15IHBvaW50IHRoYXQgdGhpcyBjaGVjayBzaG91bGQgYmUgbWFk
ZQppbnNpZGUgdGhlIGNhbGxlZSBhbmQgbm90IHRoZSBjYWxsZXIuIENhbiBpdCBiZSBkb25lIG9u
Y2UgZm9yIGFsbD8KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
