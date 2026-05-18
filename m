Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2361FCD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QemN8PiEo0u8anqfJ9m7KQxEPI47Lr6fMdzQAgP7R2g=; b=L6GGabS3JlScF3
	BfLNJlO0YokN2AcSRwTxkJBOVMvxOLuIyypGDyxvSS7NVMQEN74x577EAjLBsI07Rzl/Czy9XBKG2
	4Dlnjcm+1OvxJgRdyr82+IUCAlWTSakOnAQ2ObxAO6DHrhylCBSVRygESGdVdlU0IGxxTf7vWHOED
	saG1cpVNE8co0DnYnF25JG03+ccS06ZSGU1qf36nomHf/ndNYcnUttKB1BAbAlhbQYTlSeKs3uUe1
	XlNpHFJ9iFcfxwb9xbjgQ42iriPYv+JzGOW/32z607ykfXaiq+kq25fx/Iw2f1Hj0zZW8QpZRwzcU
	F6Q9pLg9Zf0g8cpIsq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOte3-0000000Es9f-1tgg;
	Mon, 18 May 2026 08:48:15 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtdf-0000000Es5P-0dh3
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 08:48:14 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gJrzL552tz9v7Y;
	Mon, 18 May 2026 10:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779094062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlgVOaC185Vrws/963WnBHTcONduokD+jbAIjLcGsU0=;
	b=bbj+B+MRhSa8fFMr2AAd0F2ATSdCQS0S7e9bnjhpQdVICeI0aDR1I/DKWY8DPaDHQluakp
	gwy92Ql3tC9F0fSIRLcOTvK0/ceDXpKh0aDz32TESqF19i1LKdZSVj/eKP/3q6DwPlUuj1
	tXqFSOVJusgezXfrty1crLjjq2YdjDH/ZmAdNVEdZv906xklDJQsImlSz4QHDbxOhy8+bV
	IqcgbA5gV06p4f0DatnC+D0brpT0GEKQMy7e/J23EfwC2AwhXvuy83l4dSI/U6aTll3kDW
	yMB6H+DnXaufj/GVoA4PQFUvipRxmrdALASFF6HHz9yBoh2jhCI0MFe1/ZfLLw==
Mime-Version: 1.0
Date: Mon, 18 May 2026 16:46:55 +0800
Message-Id: <DILO6ZRWYPUO.3ULDGZ95JZ9SP@mailbox.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Anand Moon" <linux.amoon@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <devicetree@vger.kernel.org>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
 <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org>
 <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net> <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org>
 <aeevr6Zj3Pwm9wux@aurel32.net>
 <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
 <CANAwSgRFQiNEi1Ac+sCvJWkj1R+yEPGt0RCjZu-3ZiD0Ffm6Hg@mail.gmail.com>
In-Reply-To: <CANAwSgRFQiNEi1Ac+sCvJWkj1R+yEPGt0RCjZu-3ZiD0Ffm6Hg@mail.gmail.com>
X-MBO-RS-META: nx3ns7n3zttnticfsuooxwsz1st8cz3x
X-MBO-RS-ID: 516b02047a5133bc5ab
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_014751_386865_D6C9056B 
X-CRM114-Status: GOOD (  27.23  )
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

SGkgQW5hbmQsCgpUaGFuayB5b3UgZm9yIHlvdXIgY29uc2lzdGVudCBhdHRlbnRpb24gYW5kIHBy
YWN0aWNhbCBzdWdnZXN0aW9ucy4KCk9uIFN1biBNYXkgMTcsIDIwMjYgYXQgMTI6MzUgUE0gQ1NU
LCBBbmFuZCBNb29uIHdyb3RlOgo+IEhpIFNodXdlaSwKPgo+IE9uIFdlZCwgMjIgQXByIDIwMjYg
YXQgMTE6NDQsIEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+
IEhpIFNodXdlaSwKPj4KPj4gT24gVHVlLCAyMSBBcHIgMjAyNiBhdCAyMjo0MSwgQXVyZWxpZW4g
SmFybm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0PiB3cm90ZToKPj4gPgo+PiA+IEhpLAo+PiA+Cj4+
ID4gT24gMjAyNi0wNC0yMSAxNjoxMCwgU2h1d2VpIFd1IHdyb3RlOgo+PiA+ID4gSGkgQXVyZWxp
ZW4sCj4+ID4gPgo+PiA+ID4gVGhhbmtzIGZvciB5b3VyIGFkZGl0aW9uLgo+PiA+ID4KPj4gPiA+
IE9uIFR1ZSBBcHIgMjEsIDIwMjYgYXQgNToxNiBBTSBDU1QsIEF1cmVsaWVuIEphcm5vIHdyb3Rl
Ogo+PiA+ID4gPiBIaSBBbmFuZCwKPj4gPiA+ID4KPj4gPiA+ID4gT24gMjAyNi0wNC0xNiAxNzow
NywgQW5hbmQgTW9vbiB3cm90ZToKPj4gPiA+ID4+IEFmdGVyIHJldmlld2luZyB0aGUgQmFuYW5h
IFBpIEYzIHNjaGVtYXRpY3MsIEkgY29uZmlybWVkIHRoYXQgQnVjazEgYW5kIEJ1Y2syCj4+ID4g
PiA+PiBCb3RoIHN1cHBseSB0aGUgQ09SRV8wVjkgd2l0aCAwLjlWwrExJSByYWlsLiBUbyByZXNv
bHZlIHRoZSByZXN0cmljdGlvbiBlcnJvcnMsCj4+ID4gPiA+PiBJIGV4cGFuZGVkIHRoZSB2b2x0
YWdlIHJhbmdlIGluIHRoZSBEVFMgdG8gNTAwLDAwMOKAkzk1MCwwMDAgwrVWLgo+PiA+ID4gPj4K
Pj4gc29ycnkgSSB3YXMgd3JvbmcgZnJvbSB0aGUgZG9jIGJlbG93IDEuMi4xIENPUkUgUG93ZXIg
RGVzaWduCj4+Cj4+IFRoZSB0eXBpY2FsIGNvcmUgdm9sdGFnZSBpcyAwLjkgViB0byAxLjA1IFYu
IEFjdHVhbCB2b2x0YWdlIGlzCj4+IGR5bmFtaWNhbGx5IHJlZ3VsYXRlZCBieQo+PiB0aGUgKipy
ZW1vdGUtc2Vuc2UgZHluYW1pYyB2b2x0YWdlKiogYWRqdXN0bWVudCBjaXJjdWl0IGluc2lkZSBQ
MS4KPj4gUDEgQlVDSzEgYW5kIEJVQ0syIG11c3QgYmUgY29tYmluZWQgdG8gc3VwcGx5IHRoZSBj
b3JlIHJhaWwuCj4+Cj4+IFsxXSBodHRwczovL3d3dy5zcGFjZW1pdC5jb20vY29tbXVuaXR5L2Rv
Y3VtZW50L2luZm8/bm9kZXBhdGg9aGFyZHdhcmUva2V5X3N0b25lL2sxL2sxX2h3L2sxX2h3X2Rl
c2lnbl9ndWlkZS5tZCZsYW5nPWVuCj4+Cj4+ID4gPiA+PiBBZGRpdGlvbmFsbHksIEkgdXBkYXRl
ZCB0aGUgRFRTIHRvIG1hcCB0aGUgc2Vjb25kIENQVSBjbHVzdGVyIChjb3JlcyA04oCTNykKPj4g
PiA+ID4+IHRvIEJ1Y2syIHRvIGJldHRlciBhbGlnbiB3aXRoIHRoZSBoYXJkd2FyZSdzIHBvd2Vy
IGRpc3RyaWJ1dGlvbi4KPj4gPiA+ID4KPj4gPiA+ID4gQWN0dWFsbHkgdGhlIG91dHB1dCBvZiBC
dWNrMSBhbmQgQnVjazIgYXJlIGNvbm5lY3RlZCB0b2dldGhlciwgc28gdGhleQo+PiA+ID4gPiBz
aG91bGQgYWx3YXlzIGJlIGNvbmZpZ3VyZWQgd2l0aCB0aGUgc2FtZSBvdXRwdXQgdm9sdGFnZS4g
QW5kIGJvdGgKPj4gPiA+ID4gY2x1c3RlcnMgc2hvdWxkIGJlIG1hcHBlZCB0byBib3RoIG91dHB1
dHMuCj4+ID4gPgo+PiA+ID4gWW91IGFyZSByaWdodCwgSSByZWNlaXZlZCB0aGUgc2FtZSByZXNw
b25zZSBmcm9tIHRoZSBvZmZpY2lhbCBkZXZlbG9wZXJzLgo+PiA+ID4KPj4gPiA+IFRoZXJlZm9y
ZSwgSSdtIHdvbmRlcmluZyBpZiBhbiBhZGRpdGlvbmFsIHJlZ3VsYXRvci1jb3VwbGVkLXdpdGg6
IHByb3BlcnR5Cj4+ID4gPiBkZWZpbml0aW9uIGlzIGFsc28gbmVlZGVkIGhlcmU/Cj4+ID4KPj4g
Y29ycmVjdC4KPj4gPiBZZXMsIEkgdGhpbmsgdGhpcyBpcyB0aGUgd2F5IHRvIGdvLiBJIGV2ZW4g
d29uZGVyIGlmIHRoaXMgc2hvdWxkbid0IGJlIGEKPj4gPiBmaXggd2l0aCBDYzogc3RhYmxlLiBU
aGlzIGFsc28gaGFzIHRvIGJlIGRvbmUgZm9yIHRoZSBNaWxrLVYgSnVwaXRlcgo+PiA+IGJvYXJk
LCBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgb3RoZXIgYm9hcmRzIHlldCwgYnV0IEkgZ3Vlc3MgdGhl
eSBhbGwgdXNlCj4+ID4gdGhlIHNhbWUgc2NoZW1hdGljcyBhdCB0aGF0IHRoZSBQTUlDIGxldmVs
Lgo+PiA+Cj4+ID4gUmVnYXJkcwo+PiA+IEF1cmVsaWVuCj4+ID4KPgo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyByZXNvbHZlIHRoZSB3YXJuaW5nIG9uIG15IHNldHVwLgo+IElmIHBvc3NpYmxlLCBw
bGVhc2UgaW50ZWdyYXRlIHRoZW0gaW50byB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+IGluZGV4IGMy
YTFiNzU5ZDQxZi4uODUxMmM3NDE3Zjk0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPiBAQCAtMTE2LDE5ICsxMTYsMTkgQEAgJmNw
dV8zIHsKPiAgfTsKPgo+ICAmY3B1XzQgewo+IC0gICAgICAgY3B1LXN1cHBseSA9IDwmYnVjazFf
M3Y0NT47Cj4gKyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1PjsKPiAgfTsKPgo+ICAm
Y3B1XzUgewo+IC0gICAgICAgY3B1LXN1cHBseSA9IDwmYnVjazFfM3Y0NT47Cj4gKyAgICAgICBj
cHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1PjsKPiAgfTsKPgo+ICAmY3B1XzYgewo+IC0gICAgICAg
Y3B1LXN1cHBseSA9IDwmYnVjazFfM3Y0NT47Cj4gKyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNr
Ml8zdjQ1PjsKPiAgfTsKPgo+ICAmY3B1Xzcgewo+IC0gICAgICAgY3B1LXN1cHBseSA9IDwmYnVj
azFfM3Y0NT47Cj4gKyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMl8zdjQ1PjsKPiAgfTsKPgo+
ICAmZW1tYyB7Cj4gQEAgLTI0OCwxNCArMjQ4LDE0IEBAIHBtaWNANDEgewo+ICAgICAgICAgICAg
ICAgICByZWd1bGF0b3JzIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBidWNrMV8zdjQ1OiBi
dWNrMSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA9IDw1MDAwMDA+Owo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzQ1MDAwMD47Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw5NTAwMDA+Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8NTAwMD47Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIH07Cj4KPiAtICAgICAgICAgICAgICAgICAgICAgICBidWNr
MiB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnVjazJfM3Y0NTogYnVjazIgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAw
MDAwPjsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWlj
cm92b2x0ID0gPDM0NTAwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTA1MDAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWd1bGF0b3ItcmFtcC1kZWxheSA9IDw1MDAwPjsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMtb247Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgfTsKCkFzIHByZXZpb3VzbHkgZGlzY3Vzc2VkLCBCdWNrMSBhbmQgQnVjazIgYXJl
IGNvbm5lY3RlZCBhbmQgbXVzdCBzaGFyZSB0aGUgc2FtZQp2b2x0YWdlLiBIb3dldmVyLCB5b3Ug
bm90IG9ubHkgc2VwYXJhdGVkIHRoZW0gYnV0IGFsc28gc2V0IHRoZWlyIHZvbHRhZ2UgcmFuZ2Vz
CnRvIGRpZmZlcmVudCB2YWx1ZXMsIHdoaWNoIHZpb2xhdGVzIHRoZSByZXF1aXJlbWVudC4KCkFk
ZGl0aW9uYWxseSwgaW4gdGhlIHNjaGVtYXRpYywgMC45ViByZXByZXNlbnRzIHRoZSBkZWZhdWx0
IG91dHB1dCB2b2x0YWdlLApub3QgdGhlIG1heGltdW0uCgpUaGUgcHJvYmxlbSB5b3Ugbm90ZWQg
bGlrZWx5IHN0ZW1zIGZyb20gZGlmZmVyZW50IGNsdXN0ZXJzIHNoYXJpbmcKdGhlIHNhbWUgdm9s
dGFnZSB3aGlsZSBoYXZpbmcgZGlmZmVyZW50IE9QUCB0YWJsZXMuCgpJbiB0aGUgbmV3IHBhdGNo
LCBJIHdpbGwgdW5pZnkgdGhlbSB0byB1c2UgdGhlIHNhbWUgT1BQIHRhYmxlLgoKPgo+IFRobmFr
cwo+IC1BbmFuZAoKLS0gCkJlc3QgcmVnYXJkcywKU2h1d2VpIFd1CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
