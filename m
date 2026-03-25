Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6259FEA818
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXuBmoq8dxGzsQq2gfirB2JT6ZMG88RAYZAfJNljbi4=; b=HwsiBiuzzA9DBs
	qySeRG1m6oE/Wu5uPapb9aiJ0dSbJWuUgY6ZVIkr8S4O4+XdcTk4L5NgJdTp5NEzWh1M2hFmBZZ5v
	sudbGcNl6djCD7r+ipDhB56MSbAzxfndNZV9elMfQ1tW6rsX5BpFG0tDXRhqkJbWJQb46iaOMBPOf
	G4S942wDu9yvV272YUlkCmIqi1ZO9YTM6KRqzQDUUFrdd6pYlZu/Za/vA+Uvh36jPi2Lh1nMvOUBG
	FqHjigHWpeJ4Q6I4OeArnW53krxfGwgGO2+HYapv1xRi/LpTzUA+MVUF3StG+tYG2KEAp9THTsuKp
	5LC8+QzykmNfwMRpFH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IN4-00000002pqY-2tp3;
	Wed, 25 Mar 2026 07:09:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IN1-00000002pqD-49tW
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 07:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42BA8438AF;
	Wed, 25 Mar 2026 07:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85219C4CEF7;
	Wed, 25 Mar 2026 07:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774422579;
	bh=mS4AlmtdQO5unW1ujVzPNe76jLRg5c+lEpiONNOY3YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWl1aj+hMh6h4t0m3jMjOf7MkAqJN3eJK3E/elgvAuwbcouB5b4f+qhY5/9VnMEcQ
	 b8t5gq/x8WDzj0tOcu0C6a3HGs4VDcK3+i0s5j6vJc/GXztxhfa9zvYcscfyjuUYBf
	 mozWwgqXkyKpKm/gapq4YtqGj2ofAOw284zknCE4658BBAWO5mdwbTkAgq71P0ZFEl
	 2yVKj1pFqmFiXgcpPTgzRy6D7nl3WHgFTsopwKdB+ZKMzMjgGxYfHq4tD+bmWHYOh/
	 Gd3Pj6W/1Nsc0uI1JmOQggcVbgizHBBXJ4fP3/usFxjD5amQmJqrj+uvQXyqO0BB1L
	 MJzlJDCmqPcbQ==
Date: Wed, 25 Mar 2026 00:09:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 14/17] include: acpi: actbl2: Add
 structs for RQSC table
Message-ID: <acOKMewjzc-KH3F1@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
 <CAEEQ3wm4vGcOChkj+z58nP3mjG8hvQmAhQLcLxqxwdvoo_8q6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wm4vGcOChkj+z58nP3mjG8hvQmAhQLcLxqxwdvoo_8q6Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_000940_069973_63796F2F 
X-CRM114-Status: GOOD (  21.41  )
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

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMDk6NDM6MDdBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
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
PiA+ICsgICAgICAgdTMyIG1jaWQ7ICAgICAgIC8vICA0Cj4gPiArICAgICAgIHUxNiBmbGFnczsg
ICAgICAvLyAgMgo+ID4gKyAgICAgICB1MTYgbnJlczsgICAgICAgLy8gIDIKPiA+ICsgICAgICAg
c3RydWN0IGFjcGlfdGFibGVfcnFzY19maWVsZHNfcmVzIHJlczsgLy8gMjAKPiA+ICt9Owo+ID4g
Kwo+ID4gK3N0cnVjdCBhY3BpX3RhYmxlX3Jxc2Mgewo+ID4gKyAgICAgICBzdHJ1Y3QgYWNwaV90
YWJsZV9oZWFkZXIgaGVhZGVyOyAgICAgICAgLyogQ29tbW9uIEFDUEkgdGFibGUgaGVhZGVyICov
Cj4gPiArICAgICAgIHUzMiBudW07Cj4gPiArICAgICAgIHN0cnVjdCBhY3BpX3RhYmxlX3Jxc2Nf
ZmllbGRzIGZbNl07Cj4gCj4gSXMgYSBmaXhlZCBhcnJheSBmWzZdIGFwcHJvcHJpYXRlIGhlcmUg
PwoKVGhpcyB3YXMgYSBmbGF3IGluIHRoZSBwcm9vZiBvZiBjb25jZXB0IHdoZXJlIGl0IGFzc3Vt
ZWQgNiBjb250cm9sbGVycy4KTXkgd29yay1pbi1wcm9ncmVzcyBoYXMgc29sdmVkIHRoYXQgcHJv
YmxlbToKaHR0cHM6Ly9naXRodWIuY29tL3R0LWZ1c3RpbmkvbGludXgvYmxvYi9iNC9zc3Fvc2lk
LWNicXJpL2luY2x1ZGUvYWNwaS9hY3RibDIuaAoKPiA+ICt9Owo+ID4gKwo+ID4gKy8qIFJRU0Mg
RmxhZ3MgKi8KPiA+ICsjZGVmaW5lIEFDUElfUlFTQ19USU1FUl9DQU5OT1RfV0FLRVVQX0NQVSAg
ICAgICAoMSkKPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFJRU0Mgc3VidGFibGVzCj4gPiArICovCj4g
PiArc3RydWN0IGFjcGlfcnFzY19ub2RlX2hlYWRlciB7Cj4gPiArICAgICAgIHUxNiB0eXBlOwo+
ID4gKyAgICAgICB1MTYgbGVuZ3RoOwo+ID4gKyAgICAgICB1MTYgcmV2aXNpb247Cj4gPiArfTsK
PiA+ICsKPiA+ICsvKiBWYWx1ZXMgZm9yIFJRU0Mgc3VidGFibGUgVHlwZSBhYm92ZSAqLwo+ID4g
K2VudW0gYWNwaV9ycXNjX25vZGVfdHlwZSB7Cj4gPiArICAgICAgIEFDUElfUlFTQ19OT0RFX1RZ
UEVfSVNBX1NUUklORyA9IDB4MDAwMCwKPiA+ICsgICAgICAgQUNQSV9SUVNDX05PREVfVFlQRV9D
TU8gPSAweDAwMDEsCj4gPiArICAgICAgIEFDUElfUlFTQ19OT0RFX1RZUEVfTU1VID0gMHgwMDAy
LAo+ID4gKyAgICAgICBBQ1BJX1JRU0NfTk9ERV9UWVBFX1JFU0VSVkVEID0gMHgwMDAzLAo+ID4g
KyAgICAgICBBQ1BJX1JRU0NfTk9ERV9UWVBFX0hBUlRfSU5GTyA9IDB4RkZGRiwKPiA+ICt9Owo+
ID4gKwo+ID4gKy8qCj4gPiArICogUlFTQyBub2RlIHNwZWNpZmljIHN1YnRhYmxlcwo+ID4gKyAq
Lwo+ID4gKwo+ID4gKy8qIElTQSBzdHJpbmcgbm9kZSBzdHJ1Y3R1cmUgKi8KPiA+ICtzdHJ1Y3Qg
YWNwaV9ycXNjX2lzYV9zdHJpbmcgewo+ID4gKyAgICAgICB1MTYgaXNhX2xlbmd0aDsKPiA+ICsg
ICAgICAgY2hhciBpc2FbXTsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0cnVjdCBhY3BpX3Jxc2NfY21v
X25vZGUgewo+ID4gKyAgICAgICB1OCByZXNlcnZlZDsgICAgICAgICAgICAvKiBNdXN0IGJlIHpl
cm8gKi8KPiA+ICsgICAgICAgdTggY2JvbV9zaXplOyAgICAgICAgICAgLyogQ0JPTSBzaXplIGlu
IHBvd2Vyb2YgMiAqLwo+ID4gKyAgICAgICB1OCBjYm9wX3NpemU7ICAgICAgICAgICAvKiBDQk9Q
IHNpemUgaW4gcG93ZXJvZiAyICovCj4gPiArICAgICAgIHU4IGNib3pfc2l6ZTsgICAgICAgICAg
IC8qIENCT1ogc2l6ZSBpbiBwb3dlcm9mIDIgKi8KPiA+ICt9Owo+ID4gKwo+ID4gK3N0cnVjdCBh
Y3BpX3Jxc2NfbW11X25vZGUgewo+ID4gKyAgICAgICB1OCByZXNlcnZlZDsgICAgICAgICAgICAv
KiBNdXN0IGJlIHplcm8gKi8KPiA+ICsgICAgICAgdTggbW11X3R5cGU7ICAgICAgICAgICAgLyog
VmlydHVhbCBBZGRyZXNzIFNjaGVtZSAqLwo+ID4gK307Cj4gPiArCj4gPiArZW51bSBhY3BpX3Jx
c2NfbW11X3R5cGUgewo+ID4gKyAgICAgICBBQ1BJX1JRU0NfTU1VX1RZUEVfU1YzOSA9IDAsCj4g
PiArICAgICAgIEFDUElfUlFTQ19NTVVfVFlQRV9TVjQ4ID0gMSwKPiA+ICsgICAgICAgQUNQSV9f
TU1VX1RZUEVfU1Y1NyA9IDIKPiAKPiBBQ1BJX1JRU0NfTU1VX1RZUEVfU1Y1NyA9IDIgID8KClRo
ZXNlIGZpZWxkcyB3ZXJlIGFsbCBpbmNsdWRlZCBieSBtaXN0YWtlLiBUaGUgb25seSBzdHJ1Y3Rz
IHRoYXQgcnFzYwpuZWVkcyBhcmU6IGFjcGlfdGFibGVfcnFzY19maWVsZHNfcmVzLCBzdHJ1Y3Qg
YWNwaV90YWJsZV9ycXNjX2ZpZWxkcyBhbmQKc3RydWN0IGFjcGlfdGFibGVfcnFzYwoKVGhhbmtz
LApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
