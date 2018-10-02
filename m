Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3BEC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 15:22:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F113C20666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 15:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nnmaph3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F113C20666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sig+xG8LPNaceteUmQ6ZKUfTTr+epAVvXnVTr15zZAw=; b=Nnmaph3v/xm6Xki6SLFjYEnmo
	zN6LJeAL78VNhXGmZ3YIx4KJfpN5OMYaLi4nBLIxiiAnggnzFTvLpXwhGGkKF2vpSzvyvJyEaS78p
	yT7wY6i16O2Mmkl4QwPJXZk2h990cbk0NuTl1hEQGRSGhxlPPGyti1xVcYwcGK3Bjzg2IJTQ1BYAB
	puaj7Bf6KiWNafiQXC3lMIEpc9YQDsCxkGTI+6EWPsTnaVKbMSt9aBx4sZVjLdJI1iSf+7//WB5RK
	D4ShJIN8OYvxI2FficZVNDiRtG0NxH2dX0P9VPIrRo4XgLX9VM8wvdatSWcaYMAsVUBgjSYh83eh1
	na49qGShA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7MUw-0007A0-TI; Tue, 02 Oct 2018 15:22:06 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7MUu-0006yZ-EP
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 15:22:06 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w92FLRbJ038590; Tue, 2 Oct 2018 18:21:29 +0300 (EEST)
X-AuditID: 8b5b9d4d-91bff70000000e62-37-5bb38cf7444c
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 14.F7.03682.7FC83BB5; Tue,  2 Oct 2018 18:21:27 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id w92FLQVo030216; Tue, 2 Oct 2018 18:21:26 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 02 Oct 2018 18:21:26 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] RISC-V: Implement built-in command line feature
Organization: FORTH
In-Reply-To: <20181002143455.GA1476@infradead.org>
References: <20181002140449.24147-1-mick@ics.forth.gr>
 <20181002143455.GA1476@infradead.org>
Message-ID: <a425c3cc9507782d305f802232704077@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsXSHc2orPu9Z3O0wenFnBZbf89itzg9YRGT
 xbbPLWwWze/OsVtsnrCA1YHV43DHF3aPh5suMXlsXqHlsXlJvcel5uvsAaxRXDYpqTmZZalF
 +nYJXBm3d11nLZgsUnF3+jz2BsZNAl2MnBwSAiYSq7f0s3YxcnEICRxllGjYM4kdwjnIKPFo
 xUcmiCpTidl7OxlBbF4BQYmTM5+wgNjMAhYSU6/sZ4Sw5SWat85mBrFZBFQlbk08DNbLJqAp
 Mf/SQbB6ESD71vJ2Zoj6aonNr86zgtjCAi4Sy74+A5vDLyAs8enuRbA4p4CRRP+U62wgtpBA
 nMSFDY/ZIW5wkTj48B47xG0qEh9+PwCzRQWUJV6cmM46gVFoFpJTZyE5dRaSUxcwMq9iFEgs
 M9bLTC7WS8svKsnQSy/axAgO+7m+OxjPLbA/xCjAwajEw8sgvylaiDWxrLgy9xCjBAezkghv
 X+LmaCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8h1+EBwkJpCeWpGanphakFsFkmTg4pRoY1UuO
 zmLh8N6d/GqdV9Xh7R/VA1f/OX9j+/7fLbcC7zmuq36XsuvrX/MjuxOtJt9hYJzJH8jh0q+l
 qx2UXXlQZGX9501LDoU8uHmhfXvJs4dfTHRvJoaq9U811phhVjwvf+l/jrdXZz5f1nnhJkOJ
 W2xYWNIq/7O/N/TxHjTjUfa/KFG7eUZFtxJLcUaioRZzUXEiANLLynN3AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_082204_920456_3EE20DC4 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 palmer@sifive.com, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002152126.dMVDPCbPNg92Q2rJblDOgo_mtjs8dkOzXr8yn6FghdA@z>

zqPPhM65z4IgMjAxOC0xMC0wMiAxNzozNCwgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+PiArI2lmZGVmIENPTkZJR19DTURMSU5FX0JPT0wKPj4gKyNpZmRlZiBDT05GSUdfQ01ETElO
RV9GT1JDRQo+PiArCXN0YXRpYyBjb25zdCBjaGFyIGZpeGVkX2NtZGxpbmVbXSBfX2luaXRjb25z
dCA9IENPTkZJR19DTURMSU5FOwo+PiArI2Vsc2UKPj4gKwlzdGF0aWMgY2hhciBidWlsdGluX2Nt
ZGxpbmVbXSBfX2luaXRkYXRhID0gQ09ORklHX0NNRExJTkU7Cj4+ICsjZW5kaWYKPj4gKyNlbmRp
Zgo+IAo+IFdoeSBkbyB5b3UgbmVlZCB0d28gdmFyaWFibGVzIGhlcmU/ICB4ODYsIHdoZXJlIHRo
aXMgc2FtZSBsb2dpYyBpcyB1c2VkCj4gc2VlbXMgdG8gZ2V0IGF3YXkgd2l0aCBqdXN0IGEgYnVp
bHRpbl9jbWRsaW5lIGNvbW1hbmQgbGluZSBvbmUuCj4gCgp4ODYgYWN0dWFsbHkgdXNlcyBhbiBl
eHRyYSBidWZmZXIgbmFtZWQgY29tbWFuZF9saW5lLCBjb3BpZXMgCmJvb3RfY29tbWFuZF9saW5l
CnRoZXJlIGFuZCByZXR1cm5zIGEgcG9pbnRlciB0byBjb21tYW5kX2xpbmUgKGluc3RlYWQgb2Yg
anVzdCByZXR1cm5pbmcgYSAKcG9pbnRlcgp0byBib290X2NvbW1hbmRfbGluZSkuIFdoYXQgSSBk
byBoZXJlIGlzIGluIGNhc2Ugd2UgaGF2ZSBhIGZvcmNlZCAKY29tbWFuZCBsaW5lLApJIHByZWZl
ciBoYXZpbmcgaXQgYXMgY29uc3QgKHNpbmNlIHRoZSBidWZmZXIgd29uJ3QgZ2V0IG1vZGlmaWVk
KSAKaW5zdGVhZCBvZgpoYXZpbmcgaXQgYXMgcncuIEkgYmVsaWV2ZSBpdCdzIGNsZWFuZXIgYW5k
IHRoZSBuYW1lIGlzIG1vcmUgCnJlcHJlc2VudGF0aXZlLgoKPiBBbHNvIHBsZWFzZSBkb24ndCBp
bmRlbnQgY29kZSBpbnNpZGUgY3BwIGNvbmRpdGlvbmFscy4KPiAKCkFDSyAoYWx0aG91Z2ggdGhl
cmUgaXMgbm90aGluZyBhZ2FpbnN0IGl0IG9uIHRoZSBrZXJuZWwgY29kaW5nIApndWlkZWxpbmVz
KQoKPj4gKwkvKiBXaGVuIHdlIHJldHVybiwgY21kbGluZV9wIHNob3VsZCBwb2ludCB0byBhIHRl
bXBvcmFyeQo+IAo+IFRoaXMgaXMgbm90IHRoZSBub3JtYWwga2VybmVsIGNvbW1lbnQgc3R5bGUu
ICBQbGVhc2Uga2VlcCB0aGUKPiAvKiBvbiBhIGxpbmUgb2YgaXRzIG93bi4KPiAKCkl0IGlzIGZv
ciBkcml2ZXJzL25ldCB3aGVyZSBJJ3ZlIG1vc3RseSB3b3JrZWQgKGRyaXZlcnMvbmV0L3dpcmVs
ZXNzKSAKYnV0IHlvdSBhcmUKcmlnaHQsIEknbGwgZml4IGl0IGFuZCByZS1zZW5kLgoKPj4gKyNp
ZmRlZiBDT05GSUdfQ01ETElORV9CT09MCj4+ICsjaWZkZWYgQ09ORklHX0NNRExJTkVfRk9SQ0UK
Pj4gKwkvKiBCdWlsdC1pbiBhcmdzIG92ZXJyaWRlIGJvb3QgbG9hZGVyIGFyZ3MgYW5kCj4+ICsJ
ICogYm9vdCBsb2FkZXIgYXJncyBhcmUgYmVpbmcgaWdub3JlZC4KPj4gKwkgKi8KPj4gKwlzdHJs
Y3B5KGJvb3RfY29tbWFuZF9saW5lLCBmaXhlZF9jbWRsaW5lLCBDT01NQU5EX0xJTkVfU0laRSk7
Cj4+ICsjZWxzZQo+PiArCS8qIEJvb3QgbG9hZGVyIGFyZ3Mgb3ZlcnJpZGUgYnVpbHQtaW4gYXJn
cyBzbyB3ZQo+PiArCSAqIG5lZWQgdG8gcHV0IGJ1aWx0LWluIGFyZ3MgYmVmb3JlIGJvb3QgbG9h
ZGVyIGFyZ3MuCj4+ICsJICovCj4+ICsJaWYgKGJ1aWx0aW5fY21kbGluZVswXSkgewo+PiArCQlz
dHJsY2F0KGJ1aWx0aW5fY21kbGluZSwgIiAiLCBDT01NQU5EX0xJTkVfU0laRSk7Cj4+ICsJCXN0
cmxjYXQoYnVpbHRpbl9jbWRsaW5lLCBib290X2NvbW1hbmRfbGluZSwgQ09NTUFORF9MSU5FX1NJ
WkUpOwo+PiArCQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBidWlsdGluX2NtZGxpbmUsIENP
TU1BTkRfTElORV9TSVpFKTsKPj4gKwl9Cj4+ICsjZW5kaWYKPj4gKyNlbmRpZgo+IAo+IEV2ZW4g
aWYgdGhpcyBzZWVtcyBtb3N0bHkgY29waWVkIC0gaXQgcHJvYmFibHkgc2hvdWxkIGJlICNpZi8j
ZWxpZgo+IGluc3RlYWQgb2YgdGhpcyBjb252b2x1dGVkIG1hZ2ljOgo+IAo+ICNpZiBkZWZpbmVk
KENPTkZJR19DTURMSU5FX0ZPUkNFKQo+IAlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBidWls
dGluX2NtZGxpbmUsIENPTU1BTkRfTElORV9TSVpFKTsKPiAjZWxpZiBkZWZpbmVkKENPTkZJR19D
TURMSU5FX0JPT0wpCj4gCWlmIChidWlsdGluX2NtZGxpbmVbMF0pIHsKPiAJCXN0cmxjYXQoYnVp
bHRpbl9jbWRsaW5lLCAiICIsIENPTU1BTkRfTElORV9TSVpFKTsKPiAJCXN0cmxjYXQoYnVpbHRp
bl9jbWRsaW5lLCBib290X2NvbW1hbmRfbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+IAkJc3Ry
bGNweShib290X2NvbW1hbmRfbGluZSwgYnVpbHRpbl9jbWRsaW5lLCBDT01NQU5EX0xJTkVfU0la
RSk7Cj4gCX0KPiAjZW5kaWYKClRoZXJlIGlzIGEgcmVhc29uIGJlaGluZCB0aGlzICJtYWdpYyIg
SU1ITywgaW4geW91ciBhcHByb2FjaCB0aGUgcmVhZGVyIApkb2Vzbid0IHJlYWxpemUKdGhhdCBD
T05GSUdfQ01ETElORV9GT1JDRSBkZXBlbmRzIG9uIENPTkZJR19DTURMSU5FX0JPT0wuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
