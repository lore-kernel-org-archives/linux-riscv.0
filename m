Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257C4C3ABA9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRxRlT1H80uMsFPfp/LSjCHlFiFAQVgDNC+kEOuIvmI=; b=Tsi8WH+BzQTRIM
	wgKq9dJLZbWP+fWzEUW6N0ZA5NMu1QiiBYvfHzX5Y/GLyAYbV20m+wEtRpeADlhQr7UIm92hJUiGJ
	2y5gshfu8h1mO2vgareury8/J8onaeI0jKvRhOkwXyu3Yjg3BO3E5fj4hlqz1cfwxVg1sgduot/o1
	ZmcNG5yvfsH2JCWAb7Sn/h+d6VMVNCn9TqE/WkkH9kVxmJyuX7B9CCR24+d0aqaYlPpZPc77O7iVi
	VYdJr0imIVvBftGUhpQ6FjvwGSRsbOGrVMnQNPDjlpbEf07R6yraSFm2XRx/fGoFTQanfy6hhB2cq
	RQ8b8fqpDCXalJbMJHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i0Z-00000009Gl9-2Tu3;
	Tue, 29 Apr 2025 10:16:11 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gpB-000000092kn-3RE8
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 09:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745917214; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CU1m58RfCOjQD6HAj0LxtIh1J2MxKzzYfGWGVh9AQinEm6q5PYuCNXLPPR7d3s+R140ho1SRXckR9Dp0zOsAHXa2pyEG1G7lvfiGT9R3m1XOzuOhkGh2YCLPLck0/O/lTbGz7VezbKlWwlRKVuirc1524wdFkDUnBEqxZGyrpSk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745917214; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fZQkV+LeKWISYkYSjblN43k3j75EsN/nAxXEFWfOGOc=; 
	b=COcBrzNN2fTjUXuVJH7yjzsCwQo28uPfAXfBYxuVA6Xw0TfozcROdUYiUK0TYlaYYJBliaIKSN/MmqmmBh1FdKTUoJXFLqrdqaRyAjISG4fSo+8tTb7fOYwbiYeRkTlkATA5lj1isTQRoTQBa1rbDmN36qut8TjeZvMqZI5ZVgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745917214;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=fZQkV+LeKWISYkYSjblN43k3j75EsN/nAxXEFWfOGOc=;
	b=SFVzEJFk1bX/oFi/F4bDcqwJC2MdR0FYySoJ2VXeBaKZL8q9yhRuOAO8J44D39m0
	TApkYhQppOsqeRV4PvrqJI2CIgiLXcsN+DNfXrh5WAYTapqes726Vy/iAAGyBa42MgM
	1TOjb++bg8VgbzgWXYr10XeMhkVg7Go6qC5q/cunTvbWNBKTojjgoYJti6tZxMcFw0Q
	pE5Lh2oysxb5p3Y6ED0dTI2V/uQyoS7Ug1M3dMKw3OXVsESWMkR9FHSlBzSBVD1F/FP
	zcE951ASj85fpW4Ac3V46T8ARINxGCqkNsOtWrPEk9yBHZ+eBtCQSBNwZQJvunQV0X/
	MmJU5JgCGA==
Received: by mx.zohomail.com with SMTPS id 1745917211373281.29103320839295;
	Tue, 29 Apr 2025 02:00:11 -0700 (PDT)
Message-ID: <4d0bf5b8e1dd00f4025b7643a746cd99010c08fc.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Tue, 29 Apr 2025 17:00:04 +0800
In-Reply-To: <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
	 <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
	 <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_020021_928271_9FB62DC1 
X-CRM114-Status: GOOD (  20.98  )
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

5ZyoIDIwMjUtMDQtMjnmmJ/mnJ/kuoznmoQgMDk6MzEgKzAyMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjgvMDQvMjAyNSAxMDo0MCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTA0LTI45pif5pyf5LiA55qEIDA5OjIwICswMjAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAwMjoyMDoxNVBN
IEdNVCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiBUaGUgSkg3MTEwIFNvQyBjb3VsZCBz
dXBwb3J0IGludGVybmFsIEdQSSBzaWduYWxzIHRvIGJlIHJvdXRlZAo+ID4gPiA+IHRvCj4gPiA+
ID4gbm90Cj4gPiA+ID4gZXh0ZXJuYWwgR1BJTyBidXQgaW50ZXJuYWwgbG93L2hpZ2ggbGV2ZWxz
Lgo+ID4gPiA+IAo+ID4gPiA+IEFkZCB0d28gbWFjcm9zLCBQQURfSU5URVJOQUxfTE9XIGFuZCBQ
QURfSU5URVJOQUxfSElHSCwgYXMgdHdvCj4gPiA+ID4gdmlydHVhbAo+ID4gPiA+ICJwYWRzIiB0
byByZXByZXNlbnQgaW50ZXJuYWwgR1BJIHNvdXJjZXMgd2l0aCBmaXhlZCBsb3cvaGlnaAo+ID4g
PiA+IGxldmVscy4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoGluY2x1ZGUvZHQtYmluZGlu
Z3MvcGluY3RybC9zdGFyZml2ZSxqaDcxMTAtcGluY3RybC5oIHwgNCArKysrCj4gPiA+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdGFyZml2ZSxqaDcxMTAtCj4gPiA+ID4g
cGluY3RybC5oCj4gPiA+ID4gYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3RhcmZpdmUs
amg3MTEwLXBpbmN0cmwuaAo+ID4gPiA+IGluZGV4IDM4NjVmMDEzOTYzOTUuLjNjY2E4NzRiMmJl
ZjcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0YXJm
aXZlLGpoNzExMC1waW5jdHJsLmgKPiA+ID4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bp
bmN0cmwvc3RhcmZpdmUsamg3MTEwLXBpbmN0cmwuaAo+ID4gPiA+IEBAIC0xMjYsNiArMTI2LDEw
IEBACj4gPiA+ID4gwqAjZGVmaW5lwqDCoMKgwqDCoMKgwqDCoFBBRF9HTUFDMF9UWEVOwqDCoMKg
wqDCoMKgwqDCoMKgwqAxOAo+ID4gPiA+IMKgI2RlZmluZcKgwqDCoMKgwqDCoMKgwqBQQURfR01B
QzBfVFhDwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDE5Cj4gPiA+ID4gwqAKPiA+ID4gPiArLyogdmly
dHVhbCBwaW5zIGZvciBmb3JjaW5nIEdQSSAqLwo+ID4gPiA+ICsjZGVmaW5lIFBBRF9JTlRFUk5B
TF9MT1fCoMKgwqDCoMKgwqDCoDI1NAo+ID4gPiA+ICsjZGVmaW5lIFBBRF9JTlRFUk5BTF9ISUdI
wqDCoMKgwqDCoMKgMjU1Cj4gPiA+IAo+ID4gPiBXaHkgdGhpcyBjYW5ub3QgYmUgMjAgYW5kIDIx
PyBUaGVzZSBhcmUgbm90IHZhbHVlcyBmb3IgcmVnaXN0ZXJzLAo+ID4gPiBidXQKPiA+ID4gYWJz
dHJhY3QgbnVtYmVycy4KPiA+IAo+ID4gVGhlIG51bWJlciBtdXN0IG5vdCBjb2xsaWRlIHdpdGgg
U1lTIEdQSU8gcGFkcyB0b28uCj4gCj4gVGhlcmUgYXJlIG5vIFNZUyBHUElPIHBhZHMgaGVyZS4g
RG8geW91IHVuZGVyc3RhbmQgdGhhdCB0aGlzIGlzIG5vdAo+IHZhbHVlIGZvciByZWdpc3RlcnM/
CgpZZXMgSSB1bmRlcnN0YW5kLgoKVGhlIHNpdHVhdGlvbiBpcyB0aGF0IEpINzExMCBoYXMgdHdv
IHNpbWlsYXIgcGluIG11eCBjb250cm9sbGVycywgb25lClNZU0dQSU8gYW5kIG9uZSBBT05HUElP
LiBEZXNwaXRlIEkgbGlzdGVkIHRoZSB2YWx1ZXMgYWZ0ZXIgdGhlIEFPTkdQSU8KcGFkIGxpc3Qs
IHRoZXNlIHZhbHVlcyBzaG91bGQgYXBwbHkgdG8gU1lTR1BJTyB0b28gKHVubGVzcyB5b3Ugd2Fu
dCB0bwpsZXQgdGhlbSBoYXZlIGRpZmZlcmVudCB2YWx1ZXMgZm9yIHRoZXNlIHR3byBwaW5tdXgg
Y29udHJvbGxlcnMpLCB3aGljaAppcyB0aGUgcGFydCB3aXRoIGNvbW1lbnQgInN5c19pb211eCBw
aW5zIi4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
