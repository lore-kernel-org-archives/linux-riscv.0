Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1BDC47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AmpGAde5RmYNxcwaWcVCs3GSyKKiP108cdnDHPUyBk=; b=3LNwADjFUrX8LY
	uTmUbeA1a1q9jgFWWij0h0bjghyOektdoeWyDR5TgcI4s9bpkLmSXLT0Ye6RkYcy0hdhTf/M7Sl+x
	6YlniANjmVVSWbO/I/wFZ6f62rZY0K95xutP+APa6VP1f158WWTRGpmscjDN3cga9c6Bc0JyvXF0r
	LT/w8k8c35hbQg5+PLg73xZnbiJkuMotQBy5ErkHc3osds2Lm/OlzRuL8c6YNdL00uJ6ybolFZUWq
	5TVvDS/x3cCGYZvIuid3OCxZAuA6kssXcjCfJAfCavFhNONa8A0jmQiCqYZIz0Fd2R8JKbOyQDQQP
	qJkvhhUu/+/Scu2kihsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvPL-007Okl-2z;
	Thu, 25 Jan 2024 08:48:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvPI-007Ojs-1E
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 08:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A56C06213C;
	Thu, 25 Jan 2024 08:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C75C43390;
	Thu, 25 Jan 2024 08:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706172499;
	bh=WEbO64N/RmnNRPLXNfI9QQWt4WdGLQ0o/XwARVfsNcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rDtcfwquf21WLdYSRVQSuChE53Q9rddnixjycGT5AcX2jLKdi3sBLdLBtpQvPQsRf
	 aLSEBUTqg8joHfxLCNEOLImL00k6ahtS2CpigSt3yVvm+dPIRHscen26VoryYRFOVx
	 pnf7NfW1XhT+2mslKdIUcGAw+rbhmeKuAFKTSIHIkh5XHB96aTqt7GO9sNotce6TPT
	 IFQChfSE6wZkrJPUEB4XjnjaZqRxnpD479vpzO6X/c9dj5FgNwlD6lqTp0GL1rAfVJ
	 kkdIS3I48jS3V8FAB2xIOn09DgEsDbkKqiU9asWE7ZJIm7z4/3+4NgOlwLDJDGFzsa
	 RoqgFV0E+86Tg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, Christoph =?utf-8?Q?M=C3=BCllner?=
 <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Conor Dooley
 <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: qemu riscv, thead c906, Linux boot regression
In-Reply-To: <08188a93-0d5b-40bf-aefb-ac74d9c3d0be@ventanamicro.com>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
 <78107c83-7035-414c-9a44-af5e234fd5c2@ventanamicro.com>
 <87wmryr0rx.fsf@all.your.base.are.belong.to.us>
 <08188a93-0d5b-40bf-aefb-ac74d9c3d0be@ventanamicro.com>
Date: Thu, 25 Jan 2024 09:48:16 +0100
Message-ID: <87y1cd4x4f.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_004820_523086_ABF86D28 
X-CRM114-Status: GOOD (  13.15  )
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

RGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgPGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+IHdyaXRl
czoKCj4gT24gMS8yNC8yNCAxNjoyNiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gRGFuaWVsIEhl
bnJpcXVlIEJhcmJvemEgPGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKPj4gCj4+
PiBPbiAxLzI0LzI0IDA5OjQ5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4+IEhpIQo+Pj4+Cj4+
Pj4gSSBidW1wZWQgdGhlIFJJU0MtViBMaW51eCBrZXJuZWwgQ0kgdG8gdXNlIHFlbXUgOC4yLjAs
IGFuZCByZWFsaXplZCB0aGF0Cj4+Pj4gdGhlYWQgYzkwNiBkaWRuJ3QgYm9vdCBhbnltb3JlLiBC
aXNlY3Rpb24gcG9pbnRzIHRvIGNvbW1pdCBkNmE0MjdlMmMwYjIKPj4+PiAoInRhcmdldC9yaXNj
di9jcHUuYzogcmVzdHJpY3QgJ21hcmNoaWQnIHZhbHVlIikKPj4+Pgo+Pj4+IFJldmVydGluZyB0
aGF0IGNvbW1pdCwgb3IgdGhlIGhhY2sgYmVsb3cgc29sdmVzIHRoZSBib290IGlzc3VlOgo+Pj4+
Cj4+Pj4gLS04PC0tCj4+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9jcHUuYyBiL3Rhcmdl
dC9yaXNjdi9jcHUuYwo+Pj4+IGluZGV4IDhjYmZjN2U3ODFhZC4uZTE4NTk2YzhhNTVhIDEwMDY0
NAo+Pj4+IC0tLSBhL3RhcmdldC9yaXNjdi9jcHUuYwo+Pj4+ICsrKyBiL3RhcmdldC9yaXNjdi9j
cHUuYwo+Pj4+IEBAIC01MDUsNiArNTA1LDkgQEAgc3RhdGljIHZvaWQgcnY2NF90aGVhZF9jOTA2
X2NwdV9pbml0KE9iamVjdCAqb2JqKQo+Pj4+ICAgICAgICBjcHUtPmNmZy5leHRfeHRoZWFkc3lu
YyA9IHRydWU7Cj4+Pj4gICAgCj4+Pj4gICAgICAgIGNwdS0+Y2ZnLm12ZW5kb3JpZCA9IFRIRUFE
X1ZFTkRPUl9JRDsKPj4+PiArICAgIGNwdS0+Y2ZnLm1hcmNoaWQgPSAoKFFFTVVfVkVSU0lPTl9N
QUpPUiA8PCAxNikgfAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAoUUVNVV9WRVJTSU9O
X01JTk9SIDw8IDgpICB8Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIChRRU1VX1ZFUlNJ
T05fTUlDUk8pKTsKPj4+PiAgICAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkKPj4+PiAgICAgICAg
c2V0X3NhdHBfbW9kZV9tYXhfc3VwcG9ydGVkKGNwdSwgVk1fMV8xMF9TVjM5KTsKPj4+PiAgICAj
ZW5kaWYKPj4+PiAtLTg8LS0KPj4+Pgo+Pj4+IEknbSB1bnN1cmUgd2hhdCB0aGUgY29ycmVjdCBx
ZW11IHdheSBvZiBhZGRpbmcgYSBkZWZhdWx0IHZhbHVlIGlzLAo+Pj4+IG9yIGlmIGM5MDYgc2hv
dWxkIGhhdmUgYSBwcm9wZXIgbWFyY2hpZC4KPj4+Cj4+PiBJbiBjYXNlIHlvdSBuZWVkIHRvIHNl
dCBhICdtYXJjaGlkJyBkaWZmZXJlbnQgdGhhbiB6ZXJvIGZvciBjOTA2LCB0aGlzIGhhY2sgd291
bGQKPj4+IGJlIGEgcHJvcGVyIGZpeC4gQXMgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbXNnIG9m
IHRoZSBwYXRjaCB5b3UgbWVudGlvbmVkOgo+Pj4KPj4+ICJOYW1lZCBDUFVzIHNob3VsZCBzZXQg
J21hcmNoaWQnIHRvIGEgbWVhbmluZ2Z1bCB2YWx1ZSBpbnN0ZWFkLCBhbmQgZ2VuZXJpYwo+Pj4g
ICAgQ1BVcyBjYW4gc2V0IHRvIGFueSB2YWxpZCB2YWx1ZS4iCj4+Pgo+Pj4gVGhhdCBtZWFucyB0
aGF0IGFueSBzcGVjaWZpYyBtYXJjaGlkIHZhbHVlIHRoYXQgdGhlIENQVSB1c2VzIG11c3QgdG8g
YmUgc2V0Cj4+PiBpbiBpdHMgb3duIGNwdV9pbml0KCkgZnVuY3Rpb24uCj4+IAo+PiBHb3QgaXQu
IFRoYW5rcywgRGFuaWVsIQo+PiAKPj4gRm9yIGNvbXBsZXRlbmVzcyAoc2luY2UgaXQgY2FtZSB1
cCBvbiB0aGUgd2Vla2x5IFBXIGNhbGwpOyBDb25vciBwb2ludGVkCj4+IG91dCB0aGF0IHplcm8g
KmlzKiBpbmRlZWQgdGhlIHJpZ2h0IG1hcmNoaWQgZm9yIGM5MDYsIGFuZCBpbiBmYWN0LCB0aGUK
Pj4gbm9uLXplcm8gbWFyY2hpZCBwcmUgY29tbWl0IGQ2YTQyN2UyYzBiMiB3YXMgaW5jb3JyZWN0
Lgo+PiAKPj4gUG9zdCBjb21taXQgZDZhNDI3ZTJjMGIyLCB0aGUgY29ycmVjdCBhbHRlcm5hdGl2
ZSBpcyBwaWNrZWQgdXAsIGFuZAo+PiBFUlJBVEFfVEhFQURfUEJNVCAodXNpbmcgbm9uLXN0YW5k
YXJkIG1lbW9yeSB0eXBlIGJpdHMgaW4KPj4gcGFnZS10YWJsZS1lbnRyaWVzKSBraWNrcyBpbi4g
QUZBSVUsIHRoYXQncyBub3QgaW1wbGVtZW50ZWQgYnkgcWVtdSdzCj4+IGM5MDYgc3VwcG9ydCwg
d2hpY2ggdGhlbiB0cmFwcy4KPgo+Cj4gVGhpcyBsb29rcyBsaWtlIGEgdmVyeSBnb29kIHJlYXNv
biB0byBhY3R1YWxseSBwdXNoIHdoYXQgeW91IGNhbGxlZCAnaGFjaycgYXMKPiBhIGZpeC4gWWVh
aCwgaW4gdGhlb3J5IHRoYXQgY29tbWl0IGRpZCBub3RoaW5nIHdyb25nLCBidXQgdGhlIHNpZGUg
ZWZmZWN0Cj4gKG1pc3Npbmcgc3VwcG9ydCBmb3Igbm9uLXN0YW5kYXJkIG1lbW9yeSB0eXBlIGJp
dHMpIGlzIGtpbmQgb2YgYSBRRU1VIHByb2JsZW0uCgpGb3IgbWUsIGl0J2QgYmUgd2VpcmQgdG8g
YWRkIHRoZSBoYWNrIChzZXR0aW5nIG1hcmNoaWQgdG8gbm9uLXplcm8pLgpDbGFpbWluZyB0aGF0
IGl0J3MgYSAidGhlYWQtYzkwNiBlbXVsYXRpb24iIGluIHFlbXUsIGJ1dCB3L28gdGhlIHByb3Bl
cgpwYWdlLWJpdCBzdXBwb3J0LiBUaGF0J3MganVzdCBjcHUgcnY2NCBwbHVzIHNvbWUgZXh0cmEg
aW5zdHJ1Y3Rpb25zIC0tCm5vdCB0aGUgYzkwNi4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
