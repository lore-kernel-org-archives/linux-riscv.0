Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F24D2FEF5
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 22:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRZWz65BVUY6i5SAhQ18tG5iXmFBKGXuMa2xvxzRLv0=; b=Q81yiTE1r17PTO
	Ct1kviwj6SYCPQ5m1sfDXP1vLNbdM9FJz6FL3BGZbrFvCdf5QokwcmDAfQlWdcGkBrgy2np3w8jOc
	xPTdeRLEFwMAKDsVu+Y2E+fTJ4xaG1qOl68m1EHeueRcwFSPkg0wCxv3lsi4VP265ldltaGZE4Wae
	KlDftLwDYnVmxa1woKL+iAfXxN1rGfqFIRWMTEjSzhHF15IqKto5TYWnjJ/h0kfOIPAm4K45jjFMp
	Gw75FcJfb6KXUroVMahnGWsxDm779XcCz+mHY0M9vf6ykWyyiD85MfOZcWsxE1OfQK9nr988UbRo4
	zSMo38p3lXgzDTEmXHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrGV-0000000F5en-3hMA;
	Tue, 27 Jan 2026 22:10:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrGT-0000000F5e0-2bRy
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 22:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 243BA408DE;
	Tue, 27 Jan 2026 22:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7BBC116C6;
	Tue, 27 Jan 2026 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769551824;
	bh=T1bfZ5aiqTQ/sFSevXZf16ujCOKTGhTUPz9xxVI+OQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asPY2b0P6PTxKcgn4M/EQv/eeC1mZP3TX0FYuO7SbRXPsYEaEM/LfHs4TtxZSRKZe
	 xDQLyWtCJUluiWJd+ja/iK5bZTl2zLJCDWSLht/9SVQakZyMl1mzjL55OCIyvlMssf
	 G9aHp9VaACCCCysb3hCy/ctc9+ej1Hby4dxXZwxjJC7leJlxqKdyUfzbfEysYyaZVc
	 Y7UlCk3OUwxepQx1YU1F5cD0nUbQT7TeDR8+0psU/AuSN3tsl4Mf5uyxl/ipycliU+
	 awcN419Rv3urC4pBbrj11ub5xYPS3Zogq9x9jDFIbu8neFnBRsZnPCO4zVuRpF4stI
	 CepEPah88+eXg==
Date: Tue, 27 Jan 2026 14:10:22 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Atish Patra <atish.patra@linux.dev>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Dave Martin <Dave.Martin@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org
Subject: Re: [External] [PATCH RFC 08/19] RISC-V: QoS: add resctrl interface
 for CBQRI controllers
Message-ID: <aXk3zq26cU8r/COG@x1>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
 <20260119-ssqosid-cbqri-v1-8-aa2a75153832@kernel.org>
 <CAEEQ3w=fnq5Rsv0A49LSOqVS8hYQExSOSRQ6C8e8v5k4jBWOow@mail.gmail.com>
 <aXfWVPg7YTToDKcQ@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXfWVPg7YTToDKcQ@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_141025_701886_85820FDB 
X-CRM114-Status: GOOD (  18.81  )
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

T24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgMDE6MDI6MTJQTSAtMDgwMCwgRHJldyBGdXN0aW5pIHdy
b3RlOgo+IE9uIE1vbiwgSmFuIDI2LCAyMDI2IGF0IDA5OjAxOjMwUE0gKzA4MDAsIHl1bmh1aSBj
dWkgd3JvdGU6Cj4gPiBIaSBEcmV3LAo+ID4gCj4gPiBPbiBUdWUsIEphbiAyMCwgMjAyNiBhdCAx
MjoxNeKAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gQWRkIGludGVyZmFjZSBmb3IgQ0JRUkkgY29udHJvbGxlciBkcml2ZXJzIHRvIG1ha2Ug
dXNlIG9mIHRoZSByZXNjdHJsCj4gPiA+IGZpbGVzeXN0ZW0uCj4gPiA+Cj4gPiA+IENvLWRldmVs
b3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5bGlicmUuY29t
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4K
PiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwuYyB8IDEx
OTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMTkxIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcW9zL3Fvc19y
ZXNjdHJsLmMKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi41ZTNhNjUzNDJlOWIKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwuYwpbLi5dCj4gPiA+ICsgICAgICAgY2FzZSBSRFRf
UkVTT1VSQ0VfTUJBOgo+ID4gPiArICAgICAgICAgICAgICAgLyogQ2FwYWNpdHkgcmVhZCBsaW1p
dCBvcGVyYXRpb24gZm9yIFJDSUQgKGNsb3NpZCkgKi8KPiA+ID4gKyAgICAgICAgICAgICAgIGVy
ciA9IGNicXJpX2JjX2FsbG9jX29wKGN0cmwsIENCUVJJX0NDX0FMTE9DX0NUTF9PUF9SRUFEX0xJ
TUlULCBjbG9zaWQpOwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGVyciA8IDApIHsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCIlcygpOiBvcGVyYXRpb24gZmFpbGVkOiBl
cnIgPSAlZCIsIF9fZnVuY19fLCBlcnIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTzsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAg
ICAgICAgICAgaHdfZG9tLT5jdHJsX3ZhbFtjbG9zaWRdID0gY2JxcmlfZ2V0X3Jid2IoY3RybCk7
Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIC8qIENvbnZlcnQgZnJvbSBiYW5kd2lkdGgg
YmxvY2tzIHRvIHBlcmNlbnQgKi8KPiA+ID4gKyAgICAgICAgICAgICAgIHJid2IgPSBod19kb20t
PmN0cmxfdmFsW2Nsb3NpZF07Cj4gPiA+ICsgICAgICAgICAgICAgICByYndiICo9IDEwMDsKPiA+
ID4gKyAgICAgICAgICAgICAgIHBlcmNlbnQgPSByYndiIC8gY3RybC0+YmMubmJ3YmxrczsKPiA+
ID4gKyAgICAgICAgICAgICAgIGlmIChyYndiICUgY3RybC0+YmMubmJ3YmxrcykKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGVyY2VudCsrOwo+ID4gCj4gPiBzZXQ6IDEwLCBnZXQgMTEg
Pwo+IAo+IFRoZSBpbnRlbnRpb24gd2FzIHRvIGhhbmRsZSByb3VuZGluZyB1cCBidXQgSSBjYW4g
ZHJvcCB0aGlzIGluY3JlbWVudC4KCkFjdHVhbGx5LCB0aGlzIGluY3JlbWVudCBvZiBvbmUgaXMg
bmVjZXNzYXJ5LiBXaXRob3V0IGl0LCB0aGUgZGVmYXVsdAp2YWx1ZSBvZiA4MCUgd2lsbCBiZSBk
aXNwbGF5ZWQgYXMgNzklLiBBbmQgd3JpdGluZyBhIHZhbHVlIGxpa2UgNTUlIHdpbGwKcmVzdWx0
IGluIDU0JS4KCiMgbW91bnQgLXQgcmVzY3RybCByZXNjdHJsIC9zeXMvZnMvcmVzY3RybAojIGNk
IC9zeXMvZnMvcmVzY3RybAojIGNhdCBzY2hlbWF0YQpNQjowPTc5OzE9Nzk7Mj03OQpMMjo0PWZm
Zjs1PWZmZgpMMzozPWZmZmYKCiMgZWNobyAnTUI6Mj01NScgPiBzY2hlbWF0YQojIGNhdCBzY2hl
bWF0YQpNQjowPTc5OzE9Nzk7Mj01NApMMjo0PWZmZjs1PWZmZgpMMzozPWZmZmYKCiMgZWNobyAn
TUI6Mj04MCcgPiBzY2hlbWF0YQojIGNhdCBzY2hlbWF0YQpNQjowPTc5OzE9Nzk7Mj03OQpMMjo0
PWZmZjs1PWZmZgpMMzozPWZmZmYKClRoYW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
