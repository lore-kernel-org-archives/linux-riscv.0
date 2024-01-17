Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31080C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igz6Xgo9xBM7Chd/biy935MraZx+wgS4BikxSqjmPz0=; b=pJrZmC9slfGh+n
	cdejEQrgPHRDNBMsy39Y875p+49uLU+xEqyWoYd8MxlaS0S6K5HfzoKujTc71lfz6qlyCxoCrTw3u
	CMO+Cfu3ow9XzZJGCrRwV0xZ7N/fNOhU7MVl4WIAwS/x3h9Xb8GMXFH8eYb8ZY3syo9KrZ44myctK
	BjdX3ASCYRXO66VpsD7y0CmvkilDoZxKgXIUKtkDfpgJRadIa9wsiOoJHSJvxMBYfR8NiHBlDcXp9
	DM4KA5xjBnNx/rAEF3CmUUxGP5JeykjpjACoOrpkbrY1hJ6ONO5yc2PlQ357P/Vc+J7TRYb3KbUW1
	zaZJK2V0LzRQgZdpMkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2vO-00FELe-2r;
	Wed, 17 Jan 2024 10:13:34 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2vM-00FEL5-06
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 10:13:33 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-598d168f253so2731480eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 02:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705486348; x=1706091148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wMkS8Old4swOOf+36J4+LH8y/2w+i/lxZ0l3Z/+Jf0=;
        b=M5dyLFP2KnKX605pDEHpUqWC6PGHw4h+RNuNSbBiIOwiEF33EJO0gDOPcg2WxDHsiM
         giBiWdViOX3H54ynape+IiKYy9pvrSA1xVTgyxLhQerfBcQzWusZRrVAd6sh8yaH5/tw
         zM711r6En7nyH+UcyG5WA6mRFIGfA+qyJn7IUyE95fjIFCPYAPTx+TINDsAUJrZRrrCF
         otBQsRu1DR3lpFAGR0qja8JBru8GSonO2Yo5XwvjBPVoNlSIC3Nc9ly0m9WA+J2c2XEy
         BPpa+5qHJeeQkBe4II04FfPz1AJz/FO5njlEp58kDwIHMk2MGAfUB3yf9CGnb4k/kRN2
         UimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705486348; x=1706091148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wMkS8Old4swOOf+36J4+LH8y/2w+i/lxZ0l3Z/+Jf0=;
        b=RfZV897I2Tk7o+s12gUWpxqM8XHPx6FkAuqcSP8cxRhJfl2SvfCDmGFGlXy5N6lxOQ
         gqfLV1TFkPHYy0BHn1fUQVgJpv6ZlLwgyFxy8hBNGDa+/fskh3odBYZ/4VuAa5/3mkUP
         C37Q5BO8RBktdEGEu9gp7eN3v4WiaF2+5vB0sp8upVhfPXTkwAMTSvS9MMCIXrQc5pyx
         omqsugc5VB7wWHAmc88ckGrvfDQAllFwJftTY5pV4107KrOBeMEGrN5udwKB/lSz4+Q7
         HhjA+zAJfk7PVbft3FdOmkgXbUUQrfsNeZOsIM4e/oKqLtEQoZH+kEP1Dhn2TasG2Jgj
         RZDw==
X-Gm-Message-State: AOJu0Yx6uNJ1cvHAmxcM2ajieemVFZXjvxtSjBPFjy/Z8wLOyD1sgdZn
	LMaG45mDmebBlbU3y+FAaz+nsDhwkj9wPiidXCA=
X-Google-Smtp-Source: AGHT+IF/ytADASP9nv4mHvvrF7mO9vfM7hlPVt0HZrSx1nsXTuP/wjsW+A+zw3cZjYTk0Ae4cX99UmPkDFIpQD58DkI=
X-Received: by 2002:a4a:ac89:0:b0:595:518e:be8d with SMTP id
 b9-20020a4aac89000000b00595518ebe8dmr4679587oon.0.1705486348137; Wed, 17 Jan
 2024 02:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org> <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org> <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <20240116165356eaa221fe@mail.local> <CAJRtX8S9dQddoxWv9T36i852ZgX6x-kjYvrGvRNd-2cXD8B=wQ@mail.gmail.com>
 <2024011709010227b73d33@mail.local>
In-Reply-To: <2024011709010227b73d33@mail.local>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 17 Jan 2024 18:12:17 +0800
Message-ID: <CAJRtX8QJsVGfTTBSsZu0p8Q_TWG6zBK82S5BQQi_Cn7S4dBXVw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_021332_069990_C6543867 
X-CRM114-Status: GOOD (  40.69  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgNTowMeKAr1BNIEFsZXhhbmRyZSBCZWxsb25pCjxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAxNy8wMS8yMDI0IDEwOjU0
OjA4KzA4MDAsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gT24gV2VkLCBKYW4gMTcsIDIwMjQgYXQg
MTI6NTPigK9BTSBBbGV4YW5kcmUgQmVsbG9uaQo+ID4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gMTcvMDEvMjAyNCAwMDoyOToyOCswODAwLCBK
aW5nYmFvIFFpdSB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEphbiAxNywgMjAyNCBhdCAxMjowM+KA
r0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA+ID4gPiA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiAxNi8wMS8yMDI0IDE2OjUxLCBK
aW5nYmFvIFFpdSB3cm90ZToKPiA+ID4gPiA+ID4+PiBDVjE4MDAgaXMgYSBSSVNDViBiYXNlZCBT
T0MgdGhhdCBpbmNsdWRlcyBhbiBSVEMgbW9kdWxlLiBUaGUgUlRDCj4gPiA+ID4gPiA+Pj4gbW9k
dWxlIGhhcyBhbiBPU0Mgb3NjaWxsYXRvcgo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+Cj4gPiA+
ID4gPiA+PiBJIGFtIG5vdCBnb2luZyB0byByZWFkIHBhZ2VzIG9mIGRlc2NyaXB0aW9uLiBQbGVh
c2Ugd3JpdGUgY29uY2lzZSByZXBsaWVzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGFua3Ms
IFdoYXQgSSBtZWFuIGlzIHRoYXQgdGhpcyBoYXJkd2FyZSBpbmNsdWRlcyB0d28gZnVuY3Rpb25z
LCBSVEMKPiA+ID4gPiA+ID4gYW5kIFBPUi4gSG93IHNob3VsZCBJIGRlc2NyaWJlIHRoZWlyIHJl
bGF0aW9uc2hpcD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZb3VyIFBPUiBkb2VzIG5vdCBuZWVkIHRv
IHRha2UgYW55IHJlc291cmNlcywgc28gbm8gbmVlZCB0byBkZXNjcmliZSBhbnkKPiA+ID4gPiA+
IHJlbGF0aW9uc2hpcC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+Pj4gWW91ciBzdWdnZXN0aW9uIGlzLCBmaXJzdGx5LCB0aGUgcG9yIHN1Ym1vZHVsZSBkb2Vz
IG5vdCBoYXZlIGFueQo+ID4gPiA+ID4gPj4+IHJlc291cmNlcywgc28gaXQgc2hvdWxkIGJlIGRl
bGV0ZWQuCj4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPj4gU28gd2hlcmUgZGlkIHlvdSBkZWxldGUg
aXQ/IEkgc3RpbGwgc2VlIGl0IGluIHRoaXMgcGF0Y2guCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRlIGhpbT8gSG93IGNhbiBhIHBvciBkcml2ZXIgb2J0
YWluIGRldmljZSBpbmZvcm1hdGlvbj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBEZWxldGUgY29tcGxl
dGVseS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBEZXZpY2UgaW5mb3JtYXRpb24/IFdoYXQgaXMgdGhp
cz8gV2UgYWxyZWFkeSBhZ3JlZWQgeW91IGRvbid0IGhhdmUgYW55Cj4gPiA+ID4gPiByZXNvdXJj
ZXMgZm9yIFBPUi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAuLi4uCj4gPiA+ID4gPgo+ID4gPiA+ID4g
Pj4gRGV2aWNlIGlzIG9ubHkgb25lIHRoaW5nLCBub3QgdHdvLgo+ID4gPiA+ID4gPj4KPiA+ID4g
PiA+ID4+PiAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDUwMjUwMDAgMHgyMDAwPjsKPiA+
ID4gPiA+ID4+PiAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVf
TEVWRUxfSElHSD47Cj4gPiA+ID4gPiA+Pj4gICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
Jm9zYz47Cj4gPiA+ID4gPiA+Pj4gfTsKPiA+ID4gPiA+ID4+PiBIb3dldmVyLCBpbiByZWFsaXR5
LCB0aGUgUE9SIHN1Ym1vZHVsZSBkb2VzIG5vdCB1c2UgSVJRIGFuZCBDTEsuCj4gPiA+ID4gPiA+
Pj4gUGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byB0ZWFjaC4gVGhhbmtzLgo+ID4gPiA+ID4gPj4K
PiA+ID4gPiA+ID4+IEkgZXhwZWN0IG9uZSBkZXZpY2Ugbm9kZS4gSG93IG1hbnkgZHJpdmVycyB5
b3UgaGF2ZSBkb2VzIG5vdCBtYXR0ZXI6IHlvdQo+ID4gPiA+ID4gPj4gY2FuIGluc3RhbnRpYXRl
IDEwMCBMaW51eCBkZXZpY2VzIGluIDEwMCBMaW51eCBkZXZpY2UgZHJpdmVycy4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIEEgZGV2aWNlIG5vZGUg
Y29ycmVzcG9uZHMgdG8gbXVsdGlwbGUgZHJpdmVycy4KPiA+ID4gPiA+ID4gU2hvdWxkIEkgY29t
cGxldGVseSBkZWxldGUgdGhlIFBPUiBkZXZpY2UgdHJlZSBub2RlIGFuZCBhZGQgaXQgd2hlbgo+
ID4gPiA+ID4gPiBzdWJtaXR0aW5nIHRoZSBQT1IgZHJpdmVyPwo+ID4gPiA+ID4KPiA+ID4gPiA+
ID8gSSB3cm90ZSBpdCBpbiBwcmV2aW91cyBtZXNzYWdlcyBhbmQgdHdpY2UgaW4gdGhpcyB0aHJl
YWQuIENvbXBsZXRlbHkKPiA+ID4gPiA+IGRlbGV0ZS4gWW91IGRvIG5vdCBhZGQgaXQgYmFjayEg
QmVjYXVzZSBpZiB5b3UgZXZlciBpbnRlbmRlZCB0byBhZGQgaXQKPiA+ID4gPiA+IGJhY2ssIGl0
IHNob3VsZCBiZSBhZGRlZCBzaW5jZSBiZWdpbm5pbmcuIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0
Cj4gPiA+ID4gPiBzdWJtaXR0aW5nIGxhdGVyIHdvdWxkIHNvbHZlLgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gSWYgdGhhdCdzIHRoZSBjYXNlLCBob3cgY2FuIEkgZXhwbGFpbiB0aGF0IHRoZSBydGMg
ZGV2aWNlIHRyZWUgbm9kZQo+ID4gPiA+ID4gPiB1c2VzIHRoZSBzeXNjb24gdGFnPwo+ID4gPiA+
ID4gPiBIb3cgY2FuIEkgZGVzY3JpYmUgYSBQT1IgZGV2aWNlIGluIERUUz8gUE9SIGlzIGEgc3Vi
bW9kdWxlIG9mIFJUQywgYW5kCj4gPiA+ID4gPiA+IGl0IGFsc28gaGFzIGNvcnJlc3BvbmRpbmcg
ZHJpdmVycy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHNhaWQsIHRoZXJlIGlzIG5vIG5lZWQgZm9y
IFBPUiBpbiBEVFMsIGJlY2F1c2UgeW91IGhhdmUgbm90aGluZyB0aGVyZS4KPiA+ID4gPiA+IFdo
eSBkbyB5b3UgaW5zaXN0IG9uIHB1dHRpbmcgaXQgb24gRFRTPwo+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gSXQncyBqdXN0IHRoYXQgaGlzIHJlc291cmNlcyBhcmUgb25seSBzaGFyZWQgd2l0aCBSVEMn
cyBSZWcuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hhdCByZXNvdXJjZXM/IFJlZz8gVGhhdCdzIG5v
dCBhIHNlcGFyYXRlIHJlc291cmNlLgo+ID4gPiA+Cj4gPiA+ID4gSSdtIHZlcnkgc29ycnkgYWJv
dXQgdGhpcy4KPiA+ID4gPiBCdXQgSSBmb3VuZCBhIGJpbmRpbmcgZmlsZSB0aGF0IG9ubHkgY29u
dGFpbnMgUmVnIGFuZCBDb21wYXRpYmxlLgo+ID4gPiA+Cj4gPiA+ID4gcnRjQDgwOTIwMDAwIHsK
PiA+ID4gPiBjb21wYXRpYmxlID0gImNpcnJ1cyxlcDkzMDEtcnRjIjsKPiA+ID4gPiByZWcgPSA8
MHg4MDkyMDAwMCAweDEwMD47Cj4gPiA+ID4gfTsKPiA+ID4gPgo+ID4gPiA+IExpbms6IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvY2lycnVzLGVwOTMwMS1ydGMueWFtbAo+
ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVG8gc3VtbWFyaXplOiBEcm9wIFBPUiBmcm9tIERU
UyBhbmQgbmV2ZXIgYnJpbmcgaXQgYmFjaywgdW5sZXNzIHlvdSBjb21lCj4gPiA+ID4gPiB3aXRo
IHNvbWUgZGlmZmVyZW50IGFyZ3VtZW50cywgd2hpY2ggeW91IGRpZCBub3Qgc2F5IGFscmVhZHku
Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gWW91IGFyZSByaWdodCwgaWYgdGhlcmUgaXMgbm8g
cG9yIGRldmljZSB0cmVlIG5vZGUsIGhvdyBjYW4gdGhlIHBvcgo+ID4gPiA+IGRyaXZlciBvYnRh
aW4gdGhlIFJlZz8KPiA+ID4KPiA+ID4gSSBndWVzcyB0aGUgcXVlc3Rpb24gaXMgd2h5IGRvbid0
IHlvdSByZWdpc3RlciBldmVyeXRoaW5nIGZyb20gdGhlIFJUQwo+ID4gPiBkcml2ZXI/Cj4gPgo+
ID4gVGhhbmtzLCBQT1IgcHJvdmlkZXMgcG93ZXIgb2ZmIGFuZCByZXN0YXJ0IGZ1bmN0aW9ucyBh
cyBhIGNoaWxkIG5vZGUgb2YgUlRDLgo+ID4gU28sIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHBsYWNl
ZCBpbiB0aGUgcG93ZXIvcmVzZXQgZGlyZWN0b3J5Lgo+Cj4gTm8gaXQgZG9lc24ndCwgaGF2ZSBh
IGxvb2sgYXQgdGhlIGp6NDc0MCBydGMgZHJpdmVyCgpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2Vz
dGlvbi4KCkJlc3QgcmVnYXJkcywKSmluZ2JhbyBRaXUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
