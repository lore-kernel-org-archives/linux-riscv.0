Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF39F47CA9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNhLk0vqKIaGQLdzDXNl3/8d0BJZcr26ufbsxSZLEOA=; b=k83gk6OGoBn1iE
	Eg4VxOaa283q8Lse2hs1aJaXWFfmag3jBLfdLRz1C+Po7LlJ2fyIcyLWDo90NBO64yTCF6aBBD/xM
	LDFHJdJWDRhtAsfGrR0e4LGDBV1vxd5bBIzghRvPF0a+mddlAtN9pZVXEEaQN/kvzqnKl9xaL5DGf
	ZDytp+mqN7JyYjcFFxf5XjGF5KESHhohgVcmGyqthvrzH4K13995zVcu2pwnJTN+mX/1Suvr8Yi0M
	/Bk6LPSKorUMh7hzxERTNPBki3oKszE/hrQkeEoGOwKcvj2C3l3/z3DTcYtxl7yMd0QeeAFNNpkGY
	yXHRwlHALE59HqPiOGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDc4-00000002Ohr-1Sqx;
	Thu, 05 Mar 2026 18:39:56 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDc2-00000002Oh5-1Loe
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 18:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772735988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TCVDMS5l7/JU8614v0x4xbc3VFbhNGd+zjSLmQN4mbjMaReyx6S4kMNk79U/YdgFvPONMfk+mSlRzL8CBVrpoSJ91k2jFYFZz7vTbEmj6iDUhHPODiz1vcRMsnX1Jc7TNoqSvxmaM9ERnyk5zIAxVVCAlWs4O9Yw9ctDcFlBoz4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772735988; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JLvdkRD0v4LKaFHQ/l7/pYm3shGTD09NvVwR1bSsk0s=; 
	b=AGpMCStqSSezeDBF1Rde2eCUDZhMKp5ttqp821cWuWyJWUqpKonk4+WSw1UDeakc79WHOhQQLnE7CUU/ICZQKNPf/lYh/G0orxNhw4BGLD0zIVmUTJlq05kmlFEmigX75CDOXBhQWX978Nmq0eqxS3acTbYNpmDoKV2oqJRZGp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772735987;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=JLvdkRD0v4LKaFHQ/l7/pYm3shGTD09NvVwR1bSsk0s=;
	b=L4C/bYeEZPzuHjU8iiuW/htnr6e5A9jbZxPn6MYzYdnCjGDe2cnX58V2I01JElqq
	5B8s6jkPJKurH0E8pZ4QD0NBVRPD4sJrP/DPne1MHSZyHlJpQ952GATW09vSlsCj6RE
	Ua88RNIkF+zZAXcDU6nP9KPwY3cQ4ByBcxJoGe3UqUnbAk3/E+zpivORyGoFJ0favUm
	Qv8Wz01NfHimNx/pcaDyfOlxCwHq4p2l0TLI7MhdNle6EWMJH6cGODiNbLPajwVYJdX
	KKJFqZhtSQuklWIEOXoPs0jvpAG8oRa1WXSi4sinYm3oFJFzxqFLz7heFi7XiGdsOCF
	GhPWZJ9M+Q==
Received: by mx.zohomail.com with SMTPS id 1772735986441202.47650338489473;
	Thu, 5 Mar 2026 10:39:46 -0800 (PST)
Message-ID: <94d742d9ace2ce58ed31525a58973b3a13257577.camel@icenowy.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren
	 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rahul Tanwar
	 <rtanwar@maxlinear.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Fri, 06 Mar 2026 02:39:40 +0800
In-Reply-To: <aanNQSHxLh2OsbvK@x1>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
	 <20260305144044.44208-2-zhengxingda@iscas.ac.cn> <aanNQSHxLh2OsbvK@x1>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_103954_415176_3FA80EED 
X-CRM114-Status: GOOD (  20.42  )
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

5ZyoIDIwMjYtMDMtMDXlm5vnmoQgMTA6MzYgLTA4MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUaHUsIE1hciAwNSwgMjAyNiBhdCAxMDo0MDo0M1BNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhlIEcgYW5kIEogY29lZmZpY2llbnRzIHByb3ZpZGVkIGJ5IFQtSGVhZCBU
SDE1MjAgbWFudWFsICh3aGljaAo+ID4gY2FsbHMKPiA+IHRoZW0gQSBhbmQgQyBjb2VmZmljaWVu
dHMgYW5kIGNhbGxzIEggY29lZmZpY2llbnQgaW4gdGhlIGJpbmRpbmcgYXMKPiA+IEIpCj4gPiBo
YXMgdGhlIDEvMTAwIGRlZ3JlZSBDZWxzaXVzIGJpdCAodGhlIHZhbHVlcyBhcmUgNDIuNzQgYW5k
IC0wLjE2Cj4gPiBjb3JyZXNwb25kaW5nbHkpLCBob3dldmVyIHRoZSBiaW5kaW5nIGN1cnJlbnRs
eSBvbmx5IGFsbG93cwo+ID4gY29mZmljaWVudHMKPiA+IGFzIHByZWNpc2UgYXMgMTAwIG1pbGxp
LUNlbHNpdXMgKDEvMTAgZGVncmVlIENlbHNpdXMpLgo+ID4gCj4gPiBDaGFuZ2UgdGhlIG11bHRp
cGxlT2YgdmFsdWUgb2YgdGhlc2UgdHdvIGNvZmZpY2llbnRzIHRvIDEwIChpbiB0aGUKPiA+IHVu
aXQKPiA+IG9mIG1pbGxpLUNlbHNpdXMpIHRvIHNhdGlzZnkgdGhlIG5lZWQgb2YgVEgxNTIwLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5h
Yy5jbj4KPiA+IC0tLQo+ID4gTmV3IHBhdGNoIGluIHYyLgo+ID4gCj4gPiDCoERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9tb29ydGVjLG1yNzUyMDMueWFtbCB8IDQKPiA+
ICsrLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdAo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaHdtb24vbW9vcnRlYyxtcjc1MjAzLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2h3bW9uL21vb3J0ZWMsbXI3NTIwMy55YW1sCj4gPiBpbmRleCA1NmRi
MjI5MmYwNjJkLi43ZDU3YzI5MzRhOGExIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL21vb3J0ZWMsbXI3NTIwMy55YW1sCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vbW9vcnRlYyxtcjc1MjAzLnlh
bWwKPiA+IEBAIC0xMDUsNyArMTA1LDcgQEAgcHJvcGVydGllczoKPiA+IMKgwqDCoMKgwqDCoCBH
IGNvZWZmaWNpZW50IGZvciB0ZW1wZXJhdHVyZSBlcXVhdGlvbi4KPiA+IMKgwqDCoMKgwqDCoCBE
ZWZhdWx0IGZvciBzZXJpZXMgNSA9IDYwMDAwCj4gPiDCoMKgwqDCoMKgwqAgRGVmYXVsdCBmb3Ig
c2VyaWVzIDYgPSA1NzQwMAo+ID4gLcKgwqDCoCBtdWx0aXBsZU9mOiAxMDAKPiA+ICvCoMKgwqAg
bXVsdGlwbGVPZjogMTAKPiA+IMKgwqDCoMKgIG1pbmltdW06IDEwMDAKPiA+IMKgwqDCoMKgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gwqAKPiA+IEBA
IC0xMzEsNyArMTMxLDcgQEAgcHJvcGVydGllczoKPiA+IMKgwqDCoMKgwqDCoCBKIGNvZWZmaWNp
ZW50IGZvciB0ZW1wZXJhdHVyZSBlcXVhdGlvbi4KPiA+IMKgwqDCoMKgwqDCoCBEZWZhdWx0IGZv
ciBzZXJpZXMgNSA9IC0xMDAKPiA+IMKgwqDCoMKgwqDCoCBEZWZhdWx0IGZvciBzZXJpZXMgNiA9
IDAKPiA+IC3CoMKgwqAgbXVsdGlwbGVPZjogMTAwCj4gPiArwqDCoMKgIG11bHRpcGxlT2Y6IDEw
Cj4gPiDCoMKgwqDCoCBtYXhpbXVtOiAwCj4gPiDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy9pbnQzMgo+ID4gwqAKPiA+IC0tIAo+ID4gMi41Mi4wCj4gPiAK
PiAKPiBJIGFtIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBhbnkgYmFja3dhcmRzIGNvbXBhdGliaWxp
dHkgaXNzdWUgYnV0Cj4gdGhlcmUKPiBhcmUgbm8gb3RoZXIgdXNlcnMgb2YgdGhpcyBjb21wYXRp
YmxlIGluIG1haW5saW5lIG90aGVyIHRoYW4gdGgxNTIwLgo+IFRoZXJlIGlzIGFsc28gdGhlIHBy
ZWNlbmRlbnQgMDMwZDJhMGNlNWRjICgiZHQtYmluZGluZ3M6IGh3bW9uOgo+IG1vb3J0ZWMsbXI3
NTIwMzogZml4IG11bHRpcGxlT2YgZm9yIGNvZWZmaWNpZW50cyIpIGhhdmluZyBjaGFuZ2UgdGhl
Cj4gcHJvcGVydHkuIEkgc3VwcG9zZSBpdCBpcyBhIG5vdCBhIHByb2JsZW0gdW5sZXNzIG90aGVy
IHBlb3BsZSBvbiB0aGUKPiBsaXN0IHJhaXNlIGFuIG9iamVjdGlvbi4KCldlbGwgbWF0aGVtYXRp
Y2FsbHkgYW55IG51bWJlciB0aGF0IGlzIGEgbXVsdGlwbGUgb2YgMTAwIGlzIGEgbXVsdGlwbGUK
b2YgMTA/CgpTbyB0aGVvcmV0aWNhbGx5IHRoZXJlIHNob3VsZCBiZSBubyBjb21wYXRpYmlsaXR5
IGlzc3VlLgoKVGhhbmtzCkljZW5vd3kKCj4gCj4gVGhhbmtzLAo+IERyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
