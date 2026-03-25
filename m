Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA1FFEA81A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOC58GIdD9069umGkvN4QNwpJFvyA/kKVsxL4jIdByI=; b=s2xRyYd6nv3lT5
	2V/4tS5HRK4dgMAjL07XsJS3/sgKViZj/FEzkNC5Qxf6r3iHv0z2LJtVTxpdwYpoZePsqBVodWsRu
	XSfhDyDcBad48vCpvobWUAZcgIF4AN7b8pC4Xm+QfQkLyXXae5PDLQQ+Plf+psUBFQ/Umn4Ke+AVs
	CX2ID2c522aZQrhGhA6QuEg/Cja3m1cxT/yBsXdOh1Ojbgb6nKRH/RAIB1tp9qBRbhXXvW3w6pv/P
	R3Ly4j4MGCTwHgEefwIym14QjC6dSOc6Amf0/WaqAthZBmEaxU5qs+Aso0fcvIkRvBylVPjwsaZTo
	k0sHZUVDKtGYJ7Ug6xcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ISG-00000002qeA-2AnL;
	Wed, 25 Mar 2026 07:15:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ISE-00000002qdW-00UF
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 07:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24B52423C5;
	Wed, 25 Mar 2026 07:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4FCC4CEF7;
	Wed, 25 Mar 2026 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774422901;
	bh=d1MOvz/OLE69hKxRkmCSGoPjCUiu+GDaR8jlcJGuUk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QY8M2dY9ccpjKxKPb9fNb6qLJ7f4btwZ+9CQTps+g4qoRY6Nd3nLbbVvKKLWTmCS5
	 LkQyzxD4C90GUSUwGRn/3H3QF6wwOyXePQJGtj3b0xadK1/5BUB6QWKR2H4ash/7HV
	 t0szAMV2HvqmjL7PpXUw043RG/pMMro69mqnWCUIxPPesNIdTnPnBcHcC1yY55U/Yj
	 QYRaDEkgZ9qZUh5e3j1tTUE3iZqsHeQD8c7VNUOMKfF/7xOG9U9kn8E8YPfTsxo28c
	 +uc7OceT/uHS5qc/uOUavODtmsAroGej8+iAjCbqLSenBzujs5vjRNC62MTTE9NM3p
	 N6fwzoaoDCpKQ==
Date: Wed, 25 Mar 2026 00:14:57 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 14/17] include: acpi: actbl2: Add
 structs for RQSC table
Message-ID: <acOLcRc2TWt2wV5f@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
 <CAEEQ3wnhvV03FYfqBqz8ihyFCcxKS5ztdvCHDF789ubSQAMw1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnhvV03FYfqBqz8ihyFCcxKS5ztdvCHDF789ubSQAMw1A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_001502_092755_F1278959 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMDk6NDg6MzdBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN0cnVjdHMg
Zm9yIHRoZSBSUVNDIHRhYmxlIHdoaWNoIGRlc2NyaWJlcyB0aGUgcHJvcGVydGllcyBvZiB0aGUK
PiA+IFJJU0MtViBRb1MgY29udHJvbGxlcnMgKENCUVJJKSBpbiB0aGUgc3lzdGVtLiBUaGUgdGFi
bGUgYWxzbyBkZXNjcmliZXMKPiA+IHRoZSB0b3BvbG9naWNhbCBhcnJhbmdlbWVudCBvZiB0aGUg
UW9TIGNvbnRyb2xsZXJzIGFuZCByZXNvdXJjZXMgaW4gdGhlCj4gPiBzeXN0ZW0uIFRoZSB0b3Bv
bG9neSBpcyBleHByZXNzZWQgaW4gdGVybXMgb2YgdGhlIGxvY2F0aW9uIG9mIHRoZQo+ID4gcmVz
b3VyY2VzIHdpdGhpbiB0aGUgc3lzdGVtIGFuZCB0aGUgcmVsYXRpb24gYmV0d2VlbiB0aGUgUW9T
IENvbnRyb2xsZXIKPiA+IGFuZCB0aGUgcmVzb3VyY2UgaXQgbWFuYWdlcy4KPiA+Cj4gPiBMaW5r
OiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1jYnFyaS9yZWxlYXNlcy90
YWcvdjEuMAo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Yt
cnFzYy9ibG9iL21haW4vc3JjL2NoYXB0ZXIyLmFkb2MKPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcg
RnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9hY3BpL2Fj
dGJsMi5oIHwgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2FjdGJsMi5oIGIvaW5jbHVkZS9hY3BpL2FjdGJsMi5oCj4g
PiBpbmRleCBmNzI2YmNlM2ViODQuLjczNjc5OTAzNDllZSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvYWNwaS9hY3RibDIuaAo+ID4gKysrIGIvaW5jbHVkZS9hY3BpL2FjdGJsMi5oCj4gPiBAQCAt
NTMsNiArNTMsNyBAQAo+ID4gICNkZWZpbmUgQUNQSV9TSUdfUkdSVCAgICAgICAgICAgIlJHUlQi
IC8qIFJlZ3VsYXRvcnkgR3JhcGhpY3MgUmVzb3VyY2UgVGFibGUgKi8KPiA+ICAjZGVmaW5lIEFD
UElfU0lHX1JIQ1QgICAgICAgICAgICJSSENUIiAvKiBSSVNDLVYgSGFydCBDYXBhYmlsaXRpZXMg
VGFibGUgKi8KPiA+ICAjZGVmaW5lIEFDUElfU0lHX1JJTVQgICAgICAgICAgICJSSU1UIiAvKiBS
SVNDLVYgSU8gTWFwcGluZyBUYWJsZSAqLwo+ID4gKyNkZWZpbmUgQUNQSV9TSUdfUlFTQyAgICAg
ICAgICAgIlJRU0MiIC8qIFJJU0MtViBSSVNDLVYgUXVhbGl0eSBvZiBTZXJ2aWNlIENvbnRyb2xs
ZXIgKi8KPiA+ICAjZGVmaW5lIEFDUElfU0lHX1NCU1QgICAgICAgICAgICJTQlNUIiAvKiBTbWFy
dCBCYXR0ZXJ5IFNwZWNpZmljYXRpb24gVGFibGUgKi8KPiA+ICAjZGVmaW5lIEFDUElfU0lHX1NE
RUkgICAgICAgICAgICJTREVJIiAvKiBTb2Z0d2FyZSBEZWxlZ2F0ZWQgRXhjZXB0aW9uIEludGVy
ZmFjZSBUYWJsZSAqLwo+ID4gICNkZWZpbmUgQUNQSV9TSUdfU0RFViAgICAgICAgICAgIlNERVYi
IC8qIFNlY3VyZSBEZXZpY2VzIHRhYmxlICovCj4gPiBAQCAtMzE2NSw2ICszMTY2LDk3IEBAIGVu
dW0gYWNwaV9yZ3J0X2ltYWdlX3R5cGUgewo+ID4gICAgICAgICBBQ1BJX1JHUlRfVFlQRV9SRVNF
UlZFRCA9IDIgICAgIC8qIDIgYW5kIGdyZWF0ZXIgYXJlIHJlc2VydmVkICovCj4gPiAgfTsKPiA+
Cj4gPiArLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiA+ICsgKgo+ID4gKyAqIFJRU0MgLSBSSVND
LVYgUXVhbGl0eSBvZiBTZXJ2aWNlIENvbnRyb2xsZXIKPiA+ICsgKiAgICAgICAgVmVyc2lvbiAx
Cj4gPiArICoKPiA+ICsgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+ID4gKwo+ID4gK3N0cnVjdCBh
Y3BpX3RhYmxlX3Jxc2NfZmllbGRzX3JlcyB7Cj4gPiArICAgICAgIHU4IHR5cGU7ICAgICAgICAv
LyAxCj4gPiArICAgICAgIHU4IHJlc3Y7ICAgICAgICAvLyAxCj4gPiArICAgICAgIHUxNiBsZW5n
dGg7ICAgICAvLyAyCj4gPiArICAgICAgIHUxNiBmbGFnczsgICAgICAvLyAyCj4gPiArICAgICAg
IHU4IHJlc3YyOyAgICAgICAvLyAxCj4gPiArICAgICAgIHU4IGlkX3R5cGU7ICAgICAvLyAxCj4g
PiArICAgICAgIHU2NCBpZDE7ICAgICAgICAvLyA4Cj4gPiArICAgICAgIHUzMiBpZDI7ICAgICAg
ICAvLyA0Cj4gPiArfTsKPiA+ICsKPiA+ICtzdHJ1Y3QgYWNwaV90YWJsZV9ycXNjX2ZpZWxkcyB7
Cj4gPiArICAgICAgIHU4IHR5cGU7ICAgICAgICAvLyAgMQo+ID4gKyAgICAgICB1OCByZXN2OyAg
ICAgICAgLy8gIDEKPiA+ICsgICAgICAgdTE2IGxlbmd0aDsgICAgIC8vICAyCj4gPiArICAgICAg
IHUzMiByZWdbM107ICAgICAvLyAxMgo+ID4gKyAgICAgICB1MzIgcmNpZDsgICAgICAgLy8gIDQK
PiA+ICsgICAgICAgdTMyIG1jaWQ7ICAgICAgIC8vICA0Cj4gCj4gVGhlIHNwZWMgYXBwZWFycyB0
byBzcGVjaWZ5IGEgbGVuZ3RoIG9mIDIgYnl0ZXMgZm9yIHRoaXMgZmllbGQ/CgpZZXMsIHRoaXMg
d2FzIGEgYnVnLiBJIGhhdmUgY2hhbmdlZCByY2lkIGFuZCBtY2lkIHRvIHUxNjoKCmh0dHBzOi8v
Z2l0aHViLmNvbS90dC1mdXN0aW5pL2xpbnV4L2Jsb2IvYjQvc3Nxb3NpZC1jYnFyaS9pbmNsdWRl
L2FjcGkvYWN0YmwyLmgKClRoYW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
