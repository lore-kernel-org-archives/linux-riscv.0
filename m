Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9856BC47422
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 07:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDPx6i6taeJbY8GgkhhxziI5FNmNsJm2gvPgCgd2yY8=; b=u0MRatJ0djBfqK
	R0yAmbRXCE2cvmFa3OakQkcyyyfrqmara0z6RO4Y+2PwSCYNfY6EUWAkVB4kDYfB2iHL7e8o/he1c
	7PR2lLkFJz4mrbznn0+YxeON5u3Y5cr0MeAG1Qob89vnAwGqDgdCijl6RP+22IAtYTvG+31iLX6zz
	iOdn742crwrEWSHXFMpN1BfXyIGSBBozjScSUVEnRsPOC8XpNHC3PtMpdW0shZlhW7++QlO6Fb+TW
	HSxU8WZxM4bH0XJIevmsDow1UsZdBtJpYFVtEdB20gGBLyFExD0t3ayNQiIA1yQpyKUxUwV29Gjfg
	dOCIj+Hc/x/EF+sNxjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0Xe-00Eiiv-0y;
	Wed, 17 Jan 2024 07:40:54 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0Xa-00Eihj-0m
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 07:40:52 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-210768048aaso565990fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705477184; x=1706081984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYD5zbvtfChyDlLcJIGs/Zw02fCfi4YRD1ZA/Szr5FU=;
        b=g16RmFIeCRAKiWK5joMKytNpInKug2klgGKSA7EC2SroEGTDfcpvU1jLu4siT4Z6yw
         t9R/2xtNWqqDdB1rZ5Ka/z6PaNZvILb4xX4pQIsbWrdE1CiH+BJbBgVT0U/86fOP2NHY
         wu8zPsHdDI/2jZSnlZ/X9XklfsEDwUtB/G7mD+tJdTcvYSqScFFKsESiqouoBuV/z7Nm
         Hn55lGTAzGo6etpVUwbcBZAF1WFczGNsjXIfeOMF1YK4OP/etkf9LHzhHys3vSkr0YwS
         vQo2UXO0U9WY0TujjOVTyEEidPRDXsecsuaNUkym9Tk/DI3ZfUKJlcyReHVb+vV/fHAK
         x5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705477184; x=1706081984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYD5zbvtfChyDlLcJIGs/Zw02fCfi4YRD1ZA/Szr5FU=;
        b=kCqXsABF6XiInL8wDGa2DrRSWL7rcyU+mdt/xwHyCSqllV4tHr0jNkz54y6x7vs4zL
         Ujp83mR+qpa6A8pd38KEi/jvJlNj24EanqF2jmAOOuf79EOTChEWbRH0b/uGrBi9OENo
         fgBEe/d8Da1o3cup1URQjBuZ/GtNVItW2ursYWPPnh1TfIZF1GQr9xug3Tmr3EuE69B+
         YJk3x4itFnCMBWEda3PwkpwEKeYTZSZ6WDDklHv1f3wtDcdc0IHxh3gD/9jO3riblvPD
         VtX4zdhn2Fb/Qh3NLr0SgBrne6IT6QShxHUYD+GvdZK9HLdpdiSaxPK9C4iHoL6aRleH
         lkmQ==
X-Gm-Message-State: AOJu0YxR+VdvhqbWaS+ROjqUSbSY7Xp8AZYgK1eWr+nZl7NQPHFeSI/t
	sKBGRK2CN/fZI6TTj6s3XBvAnXuD7EGe5CjnAitP7TIyazrxGI9raTVCsPbOwgBI4f5CfHYYM7F
	P+hsNY4xTQgsDneYGQfRZ8j9xC6c=
X-Google-Smtp-Source: AGHT+IEcv3FzT/Fdj+VChgYcLBpYuHIWnoLtDYE9bXNQy9SHNwddjEydJT1qGVRH//XUvd8Sg9X2k21JIKUSpQf70L0=
X-Received: by 2002:a05:6870:a7a1:b0:210:5f0c:ddfe with SMTP id
 x33-20020a056870a7a100b002105f0cddfemr148730oao.4.1705477183947; Tue, 16 Jan
 2024 23:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org> <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org> <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <f99da95d-a6ab-4646-8ad8-8245e275639e@linaro.org> <CAJRtX8Qxvpf_CTJG41U6JC3_qLL9raFxX3LD0LoPNhve=MDyFA@mail.gmail.com>
 <326dd12e-2d52-4d4c-8197-5d35a0c52cf5@linaro.org>
In-Reply-To: <326dd12e-2d52-4d4c-8197-5d35a0c52cf5@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 17 Jan 2024 15:39:33 +0800
Message-ID: <CAJRtX8RB9F9zm+1rEspv_ryREZKcM-8dvAPFjLDHGJcHEJuaZg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_234050_280132_5E7BD61B 
X-CRM114-Status: GOOD (  48.51  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMzoyOOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNy8wMS8yMDI0IDA0
OjI0LCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDE3LCAyMDI0IGF0IDEyOjU4
4oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAxNi8wMS8yMDI0IDE3OjI5LCBKaW5nYmFvIFFpdSB3
cm90ZToKPiA+Pj4gT24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6MDPigK9BTSBLcnp5c3p0b2Yg
S296bG93c2tpCj4gPj4+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+
ID4+Pj4KPiA+Pj4+IE9uIDE2LzAxLzIwMjQgMTY6NTEsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4+
Pj4+Pj4gQ1YxODAwIGlzIGEgUklTQ1YgYmFzZWQgU09DIHRoYXQgaW5jbHVkZXMgYW4gUlRDIG1v
ZHVsZS4gVGhlIFJUQwo+ID4+Pj4+Pj4gbW9kdWxlIGhhcyBhbiBPU0Mgb3NjaWxsYXRvcgo+ID4+
Pj4+Pgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIGFtIG5vdCBnb2luZyB0byByZWFkIHBhZ2VzIG9mIGRl
c2NyaXB0aW9uLiBQbGVhc2Ugd3JpdGUgY29uY2lzZSByZXBsaWVzLgo+ID4+Pj4+Cj4gPj4+Pj4g
VGhhbmtzLCBXaGF0IEkgbWVhbiBpcyB0aGF0IHRoaXMgaGFyZHdhcmUgaW5jbHVkZXMgdHdvIGZ1
bmN0aW9ucywgUlRDCj4gPj4+Pj4gYW5kIFBPUi4gSG93IHNob3VsZCBJIGRlc2NyaWJlIHRoZWly
IHJlbGF0aW9uc2hpcD8KPiA+Pj4+Cj4gPj4+PiBZb3VyIFBPUiBkb2VzIG5vdCBuZWVkIHRvIHRh
a2UgYW55IHJlc291cmNlcywgc28gbm8gbmVlZCB0byBkZXNjcmliZSBhbnkKPiA+Pj4+IHJlbGF0
aW9uc2hpcC4KPiA+Pj4+Cj4gPj4+PiAuLi4KPiA+Pj4+Cj4gPj4+Pj4+PiBZb3VyIHN1Z2dlc3Rp
b24gaXMsIGZpcnN0bHksIHRoZSBwb3Igc3VibW9kdWxlIGRvZXMgbm90IGhhdmUgYW55Cj4gPj4+
Pj4+PiByZXNvdXJjZXMsIHNvIGl0IHNob3VsZCBiZSBkZWxldGVkLgo+ID4+Pj4+Pgo+ID4+Pj4+
PiBTbyB3aGVyZSBkaWQgeW91IGRlbGV0ZSBpdD8gSSBzdGlsbCBzZWUgaXQgaW4gdGhpcyBwYXRj
aC4KPiA+Pj4+Pgo+ID4+Pj4+IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRlIGhpbT8gSG93IGNh
biBhIHBvciBkcml2ZXIgb2J0YWluIGRldmljZSBpbmZvcm1hdGlvbj8KPiA+Pj4+Cj4gPj4+PiBE
ZWxldGUgY29tcGxldGVseS4KPiA+Pj4+Cj4gPj4+PiBEZXZpY2UgaW5mb3JtYXRpb24/IFdoYXQg
aXMgdGhpcz8gV2UgYWxyZWFkeSBhZ3JlZWQgeW91IGRvbid0IGhhdmUgYW55Cj4gPj4+PiByZXNv
dXJjZXMgZm9yIFBPUi4KPiA+Pj4+Cj4gPj4+PiAuLi4uCj4gPj4+Pgo+ID4+Pj4+PiBEZXZpY2Ug
aXMgb25seSBvbmUgdGhpbmcsIG5vdCB0d28uCj4gPj4+Pj4+Cj4gPj4+Pj4+PiAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDUwMjUwMDAgMHgyMDAwPjsKPiA+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiA+Pj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvc2M+Owo+ID4+Pj4+Pj4gfTsKPiA+Pj4+
Pj4+IEhvd2V2ZXIsIGluIHJlYWxpdHksIHRoZSBQT1Igc3VibW9kdWxlIGRvZXMgbm90IHVzZSBJ
UlEgYW5kIENMSy4KPiA+Pj4+Pj4+IFBsZWFzZSBkbyBub3QgaGVzaXRhdGUgdG8gdGVhY2guIFRo
YW5rcy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSBleHBlY3Qgb25lIGRldmljZSBub2RlLiBIb3cgbWFu
eSBkcml2ZXJzIHlvdSBoYXZlIGRvZXMgbm90IG1hdHRlcjogeW91Cj4gPj4+Pj4+IGNhbiBpbnN0
YW50aWF0ZSAxMDAgTGludXggZGV2aWNlcyBpbiAxMDAgTGludXggZGV2aWNlIGRyaXZlcnMuCj4g
Pj4+Pj4KPiA+Pj4+PiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gQSBkZXZpY2Ugbm9kZSBj
b3JyZXNwb25kcyB0byBtdWx0aXBsZSBkcml2ZXJzLgo+ID4+Pj4+IFNob3VsZCBJIGNvbXBsZXRl
bHkgZGVsZXRlIHRoZSBQT1IgZGV2aWNlIHRyZWUgbm9kZSBhbmQgYWRkIGl0IHdoZW4KPiA+Pj4+
PiBzdWJtaXR0aW5nIHRoZSBQT1IgZHJpdmVyPwo+ID4+Pj4KPiA+Pj4+ID8gSSB3cm90ZSBpdCBp
biBwcmV2aW91cyBtZXNzYWdlcyBhbmQgdHdpY2UgaW4gdGhpcyB0aHJlYWQuIENvbXBsZXRlbHkK
PiA+Pj4+IGRlbGV0ZS4gWW91IGRvIG5vdCBhZGQgaXQgYmFjayEgQmVjYXVzZSBpZiB5b3UgZXZl
ciBpbnRlbmRlZCB0byBhZGQgaXQKPiA+Pj4+IGJhY2ssIGl0IHNob3VsZCBiZSBhZGRlZCBzaW5j
ZSBiZWdpbm5pbmcuIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0Cj4gPj4+PiBzdWJtaXR0aW5nIGxh
dGVyIHdvdWxkIHNvbHZlLgo+ID4+Pj4KPiA+Pj4+PiBJZiB0aGF0J3MgdGhlIGNhc2UsIGhvdyBj
YW4gSSBleHBsYWluIHRoYXQgdGhlIHJ0YyBkZXZpY2UgdHJlZSBub2RlCj4gPj4+Pj4gdXNlcyB0
aGUgc3lzY29uIHRhZz8KPiA+Pj4+PiBIb3cgY2FuIEkgZGVzY3JpYmUgYSBQT1IgZGV2aWNlIGlu
IERUUz8gUE9SIGlzIGEgc3VibW9kdWxlIG9mIFJUQywgYW5kCj4gPj4+Pj4gaXQgYWxzbyBoYXMg
Y29ycmVzcG9uZGluZyBkcml2ZXJzLgo+ID4+Pj4KPiA+Pj4+IEkgc2FpZCwgdGhlcmUgaXMgbm8g
bmVlZCBmb3IgUE9SIGluIERUUywgYmVjYXVzZSB5b3UgaGF2ZSBub3RoaW5nIHRoZXJlLgo+ID4+
Pj4gV2h5IGRvIHlvdSBpbnNpc3Qgb24gcHV0dGluZyBpdCBvbiBEVFM/Cj4gPj4+Pgo+ID4+Pj4+
IEl0J3MganVzdCB0aGF0IGhpcyByZXNvdXJjZXMgYXJlIG9ubHkgc2hhcmVkIHdpdGggUlRDJ3Mg
UmVnLgo+ID4+Pj4KPiA+Pj4+IFdoYXQgcmVzb3VyY2VzPyBSZWc/IFRoYXQncyBub3QgYSBzZXBh
cmF0ZSByZXNvdXJjZS4KPiA+Pgo+ID4+IEkgbWVhbnQsIHNlcGFyYXRlIGZyb20gdGhlIFJUQy4g
SSBoYWQgaW1wcmVzc2lvbiB0aGF0IElPIHNwYWNlIGlzIHNoYXJlZAo+ID4+IG9yIG1peGVkIHdp
dGggUlRDPyBJZiBpdCBpcyBzZXBhcmF0ZSwgd2h5IGl0IHdhc24ndCBsaXN0ZWQ/Cj4gPj4KPiA+
Pj4KPiA+Pj4gSSdtIHZlcnkgc29ycnkgYWJvdXQgdGhpcy4KPiA+Pj4gQnV0IEkgZm91bmQgYSBi
aW5kaW5nIGZpbGUgdGhhdCBvbmx5IGNvbnRhaW5zIFJlZyBhbmQgQ29tcGF0aWJsZS4KPiA+Pj4K
PiA+Pj4gcnRjQDgwOTIwMDAwIHsKPiA+Pj4gY29tcGF0aWJsZSA9ICJjaXJydXMsZXA5MzAxLXJ0
YyI7Cj4gPj4+IHJlZyA9IDwweDgwOTIwMDAwIDB4MTAwPjsKPiA+Pj4gfTsKPiA+Pj4KPiA+Pj4g
TGluazogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9jaXJydXMsZXA5MzAx
LXJ0Yy55YW1sCj4gPj4KPiA+PiBBbmQ/Cj4gPj4KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBUbyBzdW1t
YXJpemU6IERyb3AgUE9SIGZyb20gRFRTIGFuZCBuZXZlciBicmluZyBpdCBiYWNrLCB1bmxlc3Mg
eW91IGNvbWUKPiA+Pj4+IHdpdGggc29tZSBkaWZmZXJlbnQgYXJndW1lbnRzLCB3aGljaCB5b3Ug
ZGlkIG5vdCBzYXkgYWxyZWFkeS4KPiA+Pj4+Cj4gPj4+Cj4gPj4+IFlvdSBhcmUgcmlnaHQsIGlm
IHRoZXJlIGlzIG5vIHBvciBkZXZpY2UgdHJlZSBub2RlLCBob3cgY2FuIHRoZSBwb3IKPiA+Pj4g
ZHJpdmVyIG9idGFpbiB0aGUgUmVnPwo+ID4+Cj4gPj4gVGhlIHNhbWUgYXMgY3VycmVudGx5LiBE
b2VzIHlvdXIgUE9SIG5vZGUgaGFzIHJlZz8gTm8sIHNvIGFjY29yZGluZyB0bwo+ID4+IHlvdXIg
bG9naWMgaXQgY2Fubm90IG9idGFpbiBhZGRyZXNzIHNwYWNlLgo+ID4+Cj4gPj4gQ2hpbGRyZW4g
TGludXggZGV2aWNlcyBzaGFyZSByZWdtYXAgd2l0aCBwYXJlbnQgZGV2aWNlLgo+ID4+Cj4gPgo+
ID4gVGhhbmtzLCBQb3dlci1Pbi1SZXNldC9QT1IgZHJpdmVyIHJlcXVpcmVzIFJlZyB0byBjb21w
bGV0ZSBpdHMgZnVuY3Rpb25zLgo+ID4gVGhlIGNvbXBhdGlibGUgb2YgUE9SIGlzIHJlcXVpcmVk
IGluIERUUyB0byBsb2FkIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZlci4KPgo+IE5vLCBpdCBpcyBu
b3QgbmVlZGVkLiBJIGFsc28gd3JvdGUgdG8gaW4gcHJldmlvdXMgbWVzc2FnZXMgdG8ga2VlcAo+
IGRyaXZlcnMgb3V0IG9mIHRoaXMuIFRoZXkgYXJlIG5vdCByZWxhdGVkIHRvIHRoaXMgdG9waWMg
YW5kIGRvbid0IHVzZQo+IHRoZW0gYXMgYXJndW1lbnRzLgo+Cj4KPiA+IFRoZSBQT1IgZHJpdmVy
IHdhcyBub3Qgc3VibWl0dGVkIGluIHRoZSBwYXRjaC4gSG93ZXZlciwgdGhpcyBwYXRjaCByZXF1
aXJlcwo+ID4gdGhlIGFkZGl0aW9uIG9mIFJUQyBpbiBEVFMuIENvbnNpZGVyaW5nIHRoZSBmdXR1
cmUgYWRkaXRpb24gb2YgUE9SCj4KPiBOby4gQmluZGluZ3MgKk1VU1QgQkUgQ09NUExFVEUqLCBu
b3QgZGVwZW5kIG9uIHNvbWUgb3RoZXIgZHJpdmVycy4KPiBTdWJtaXQgKkNPTVBMRVRFKiBiaW5k
aW5ncyBmb3IgZW50aXJlIGhhcmR3YXJlLiBUaGVuIHN1Ym1pdCBjb21wbGV0ZQo+IERUUy4gSSBk
b24ndCBjYXJlIGFib3V0IHRoZSBkcml2ZXJzIGFuZCB0aGV5IGRvIG5vdCBoYXZlIHRvIGJlIGNv
bXBsZXRlLgo+Cj4KPiA+IGRyaXZlciwgSSBhZGRlZCBhIFBPUiBub2RlLgo+ID4gSSdtIG5vdCBz
dXJlIHdoeSB0aGUgUE9SIG5vZGUgbmVlZHMgdG8gYmUgZGVsZXRlZCwganVzdCBiZWNhdXNlIGl0
Cj4gPiBvbmx5IGhhcyB0aGUgY29tcGF0aWJsZSBhdHRyaWJ1dGU/Cj4KPiBUaGlzIGlzIGxpa2Ug
YSB0ZW50aCBtZXNzYWdlIGFuZCBJIHdhcyBleHBsYWluaW5nIGl0IG11bHRpcGxlIHRpbWVzLiBH
bwo+IGJhY2sgdG8gcHJldmlvdXMgZW1haWxzLgo+Cj4gPiBPciBtYXliZSBpdCdzIGJlY2F1c2Ug
SSBkaWRuJ3Qgc3VibWl0IHRoZSBQT1IgZHJpdmVyLCBzbyBJIG5lZWQgdG8KPiA+IGRlbGV0ZSB0
aGUgUE9SIG5vZGUuCj4KPiBQbGVhc2UgZG9uJ3QgbWVudGlvbiBkcml2ZXJzIGFueW1vcmUgaW4g
dGhpcyBkaXNjdXNzaW9ucy4gSXQgb25seQo+IGNvbmZ1c2VzIHlvdS4KPgo+ID4gSSBmb3VuZCBh
biBleGFtcGxlLgo+ID4KPiA+IHN0OiB0aW1lckBmZmZmZmQwMCB7Cj4gPiAgICAgY29tcGF0aWJs
ZSA9ICJhdG1lbCxhdDkxcm05MjAwLXN0IiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsKPiA+ICAg
ICByZWcgPSA8MHhmZmZmZmQwMCAweDEwMD47Cj4gPiAgICAgaW50ZXJydXB0cyA9IDwxIElSUV9U
WVBFX0xFVkVMX0hJR0ggNz47Cj4gPiAgICAgY2xvY2tzID0gPCZzbG93X3h0YWw+Owo+ID4gICAg
IHdhdGNoZG9nIHsKPiA+ICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5MXJtOTIwMC13ZHQi
Owo+ID4gICAgIH07Cj4gPiB9Owo+ID4KPiA+IExpbms6YXJjaC9hcm0vYm9vdC9kdHMvbWljcm9j
aGlwL2F0OTFybTkyMDAuZHRzaToxMTQKPiA+Cj4gPiBMaWtlIHRoaXMsIHdoZW4gdGhlIHBvciBk
cml2ZXIgaW5zbW9kIGlzIGFjdGl2YXRlZCwgdGhlIHBvciBkcml2ZXIgY2FuCj4gPiBvYnRhaW4g
dGhlIHJlZ3Mgb2YgdGhlIHBhcmVudCBkZXZpY2UuCj4KPiBFeGFtcGxlIG9mIHdoYXQ/IFdoYXQg
aXMgdGhlIHF1ZXN0aW9uPyBJIGZvdW5kIGEgYnVnIGluIExpbnV4LCBzbyBjYW4gSQo+IGNyZWF0
ZSBzdWNoIGJ1ZyBhZ2Fpbj8KPgo+IFRoaXMgZGlzY3Vzc2lvbiBpcyBmcnVpdGxlc3MgYW5kIHRp
cmVzb21lLiBZb3UgYXJlIHJlcGVhdGluZyB0aGUgc2FtZQo+IGlzc3VlcyBhbmQgYXNraW5nIHRo
ZSBzYW1lIHF1ZXN0aW9ucy4KPgoKVGhhbmsgeW91LCBJIGhhdmUgYmVlbiBtaXNsZWQgYnkgaGlz
dG9yaWNhbCBsZWdhY3kgY29kZS4KSSB3aWxsIGNvbXBsZXRlbHkgZGVsZXRlIFBPUi4gU29ycnkg
YWdhaW4gZm9yIHdhc3RpbmcgeW91cgp0aW1lIG9uIHJlcGV0aXRpdmUgZGlzY3Vzc2lvbnMuCgpC
ZXN0IHJlZ2FyZHMsCkppbmdiYW8gUWl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
