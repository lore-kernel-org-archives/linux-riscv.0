Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB8C47077
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 02:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgGDbJFLuolm0NgF4nnogRpqTKigrAlAtpN0h9o7ofQ=; b=mnkYgb/yFuS7TT
	q29ajMNcZA4/tsmI5Qq5ybKu+RKpwdUXFf6XXkRVwyog+gAtsCKJlVhDYxPySbMlfcijFqE3VOBmA
	nrUQ8qA9sjn6nhQZThP2Mzaw2EfIZuHPr4VwhEb1kFfE3lBq6R1KKcPY+D5ynw0yYt2BnW/ebcXnW
	j+Cb/E0nO9urZG82f1HdgqEnWe2Th0I/gZb++ZZA5VVE2jiTfDH9yH3813gIMM8SKsGc6Q0rPPWpq
	lqtqZ9DkT5djjI1uaKIKSGtJC4WqrsIxfFg5FbpIYlqv9OWcPeFsBGwO6KbctE8GodX8T9wJUfQ8C
	KSuyMxZOSwrwgdJ6Q9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPw5O-00EGVi-1a;
	Wed, 17 Jan 2024 02:55:26 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPw5M-00EGTz-0i
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 02:55:25 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-59883168a83so2803282eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 18:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705460060; x=1706064860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVGBKHbsW+ID/DGxBqN0PHCQ5oLBwlOUaceCEBaO48g=;
        b=gq6Lj71TRAjUhYQG7AoB5DsCcpRUMW1z40pHmZ26IGVV1q4HdSvptaNSOOB5MKfnUQ
         +ROdRWP5NrETCi0h2OA39/YmhixdUYnF1bQMboYSNtmAKbFxslwUGRRTOUitqC06hI6s
         FbxhTRNmOReecg+ome80GWrMxqC6M2e40t35P8rAVoaMpXeV48XVwUFzkMQhCAyFhIz+
         A7Fa4lxn3hGt3vg7ee5I9PRuOztT30h5X3aM2iQbzwGjOf9RunycozdZxa8Yu0LgvT+l
         Hbcxw1QG4JIfImhonwbimn2UACcPr04xxAywXn8KP84aZ8MSQbmmSP/wpa+Zd5KLeWxG
         Fxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705460060; x=1706064860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVGBKHbsW+ID/DGxBqN0PHCQ5oLBwlOUaceCEBaO48g=;
        b=iRMfO6RCJ3os6B8NwMc1eQT7Z2nTXav5Fw2adxPUKfdrcxeKtFBbGMF98YFsUIUzft
         26wVkNyT/QSNqkJd02tqNcGZjRaVkIpDTvEzeBpnq5I/CP7VHyPyT7I7ithCrHPqDEhK
         dO/EU7t/0S6tcWkuIza0e+26W7MMtC4owzK7RX9NmYnlf0uyRztZTFEJkKMjmKySsU4Z
         0MphOYGAt/8kZtsOT2KzviwIr//qDMUW7Tjf+skrHcECr9XQ8ejUdPe9WCsy2/OdOlvf
         ZgIFZltg/ggOhDQ4961gKNG4QgfUOy4FHNX2SR5k72s4UBu5QmvfA5mLZ/emOVaYISrO
         9LlA==
X-Gm-Message-State: AOJu0YzbuzW5hcOtt/fBeK47C3A2//1VcL5Y7dWno6PG00abZMnQjdmt
	z7RvU20hm1gWGVYi2eYTNyecOd6eIVMcp0ckkZ8=
X-Google-Smtp-Source: AGHT+IFSGHRpCVQA62jHLl6m+lSQpDalayWj0ftExpE546suQA7WbA16GhWj8z2tzy33hf/KF4MJfnuQBLkmEcxqk2c=
X-Received: by 2002:a05:6870:d0ca:b0:210:9824:1335 with SMTP id
 k10-20020a056870d0ca00b0021098241335mr431492oaa.81.1705460059658; Tue, 16 Jan
 2024 18:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org> <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org> <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <20240116165356eaa221fe@mail.local>
In-Reply-To: <20240116165356eaa221fe@mail.local>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 17 Jan 2024 10:54:08 +0800
Message-ID: <CAJRtX8S9dQddoxWv9T36i852ZgX6x-kjYvrGvRNd-2cXD8B=wQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_185524_255760_42FF8A6C 
X-CRM114-Status: GOOD (  39.54  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6NTPigK9BTSBBbGV4YW5kcmUgQmVsbG9uaQo8YWxl
eGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMTcvMDEvMjAyNCAwMDoy
OToyOCswODAwLCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDE3LCAyMDI0IGF0
IDEyOjAz4oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDE2LzAxLzIwMjQgMTY6NTEsIEppbmdi
YW8gUWl1IHdyb3RlOgo+ID4gPiA+Pj4gQ1YxODAwIGlzIGEgUklTQ1YgYmFzZWQgU09DIHRoYXQg
aW5jbHVkZXMgYW4gUlRDIG1vZHVsZS4gVGhlIFJUQwo+ID4gPiA+Pj4gbW9kdWxlIGhhcyBhbiBP
U0Mgb3NjaWxsYXRvcgo+ID4gPiA+Pgo+ID4gPiA+Pgo+ID4gPiA+PiBJIGFtIG5vdCBnb2luZyB0
byByZWFkIHBhZ2VzIG9mIGRlc2NyaXB0aW9uLiBQbGVhc2Ugd3JpdGUgY29uY2lzZSByZXBsaWVz
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzLCBXaGF0IEkgbWVhbiBpcyB0aGF0IHRoaXMgaGFyZHdh
cmUgaW5jbHVkZXMgdHdvIGZ1bmN0aW9ucywgUlRDCj4gPiA+ID4gYW5kIFBPUi4gSG93IHNob3Vs
ZCBJIGRlc2NyaWJlIHRoZWlyIHJlbGF0aW9uc2hpcD8KPiA+ID4KPiA+ID4gWW91ciBQT1IgZG9l
cyBub3QgbmVlZCB0byB0YWtlIGFueSByZXNvdXJjZXMsIHNvIG5vIG5lZWQgdG8gZGVzY3JpYmUg
YW55Cj4gPiA+IHJlbGF0aW9uc2hpcC4KPiA+ID4KPiA+ID4gLi4uCj4gPiA+Cj4gPiA+ID4+PiBZ
b3VyIHN1Z2dlc3Rpb24gaXMsIGZpcnN0bHksIHRoZSBwb3Igc3VibW9kdWxlIGRvZXMgbm90IGhh
dmUgYW55Cj4gPiA+ID4+PiByZXNvdXJjZXMsIHNvIGl0IHNob3VsZCBiZSBkZWxldGVkLgo+ID4g
PiA+Pgo+ID4gPiA+PiBTbyB3aGVyZSBkaWQgeW91IGRlbGV0ZSBpdD8gSSBzdGlsbCBzZWUgaXQg
aW4gdGhpcyBwYXRjaC4KPiA+ID4gPgo+ID4gPiA+IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRl
IGhpbT8gSG93IGNhbiBhIHBvciBkcml2ZXIgb2J0YWluIGRldmljZSBpbmZvcm1hdGlvbj8KPiA+
ID4KPiA+ID4gRGVsZXRlIGNvbXBsZXRlbHkuCj4gPiA+Cj4gPiA+IERldmljZSBpbmZvcm1hdGlv
bj8gV2hhdCBpcyB0aGlzPyBXZSBhbHJlYWR5IGFncmVlZCB5b3UgZG9uJ3QgaGF2ZSBhbnkKPiA+
ID4gcmVzb3VyY2VzIGZvciBQT1IuCj4gPiA+Cj4gPiA+IC4uLi4KPiA+ID4KPiA+ID4gPj4gRGV2
aWNlIGlzIG9ubHkgb25lIHRoaW5nLCBub3QgdHdvLgo+ID4gPiA+Pgo+ID4gPiA+Pj4gICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHg1MDI1MDAwIDB4MjAwMD47Cj4gPiA+ID4+PiAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPiA+
ID4+PiAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmb3NjPjsKPiA+ID4gPj4+IH07Cj4g
PiA+ID4+PiBIb3dldmVyLCBpbiByZWFsaXR5LCB0aGUgUE9SIHN1Ym1vZHVsZSBkb2VzIG5vdCB1
c2UgSVJRIGFuZCBDTEsuCj4gPiA+ID4+PiBQbGVhc2UgZG8gbm90IGhlc2l0YXRlIHRvIHRlYWNo
LiBUaGFua3MuCj4gPiA+ID4+Cj4gPiA+ID4+IEkgZXhwZWN0IG9uZSBkZXZpY2Ugbm9kZS4gSG93
IG1hbnkgZHJpdmVycyB5b3UgaGF2ZSBkb2VzIG5vdCBtYXR0ZXI6IHlvdQo+ID4gPiA+PiBjYW4g
aW5zdGFudGlhdGUgMTAwIExpbnV4IGRldmljZXMgaW4gMTAwIExpbnV4IGRldmljZSBkcml2ZXJz
Lgo+ID4gPiA+Cj4gPiA+ID4gSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIEEgZGV2aWNlIG5v
ZGUgY29ycmVzcG9uZHMgdG8gbXVsdGlwbGUgZHJpdmVycy4KPiA+ID4gPiBTaG91bGQgSSBjb21w
bGV0ZWx5IGRlbGV0ZSB0aGUgUE9SIGRldmljZSB0cmVlIG5vZGUgYW5kIGFkZCBpdCB3aGVuCj4g
PiA+ID4gc3VibWl0dGluZyB0aGUgUE9SIGRyaXZlcj8KPiA+ID4KPiA+ID4gPyBJIHdyb3RlIGl0
IGluIHByZXZpb3VzIG1lc3NhZ2VzIGFuZCB0d2ljZSBpbiB0aGlzIHRocmVhZC4gQ29tcGxldGVs
eQo+ID4gPiBkZWxldGUuIFlvdSBkbyBub3QgYWRkIGl0IGJhY2shIEJlY2F1c2UgaWYgeW91IGV2
ZXIgaW50ZW5kZWQgdG8gYWRkIGl0Cj4gPiA+IGJhY2ssIGl0IHNob3VsZCBiZSBhZGRlZCBzaW5j
ZSBiZWdpbm5pbmcuIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0Cj4gPiA+IHN1Ym1pdHRpbmcgbGF0
ZXIgd291bGQgc29sdmUuCj4gPiA+Cj4gPiA+ID4gSWYgdGhhdCdzIHRoZSBjYXNlLCBob3cgY2Fu
IEkgZXhwbGFpbiB0aGF0IHRoZSBydGMgZGV2aWNlIHRyZWUgbm9kZQo+ID4gPiA+IHVzZXMgdGhl
IHN5c2NvbiB0YWc/Cj4gPiA+ID4gSG93IGNhbiBJIGRlc2NyaWJlIGEgUE9SIGRldmljZSBpbiBE
VFM/IFBPUiBpcyBhIHN1Ym1vZHVsZSBvZiBSVEMsIGFuZAo+ID4gPiA+IGl0IGFsc28gaGFzIGNv
cnJlc3BvbmRpbmcgZHJpdmVycy4KPiA+ID4KPiA+ID4gSSBzYWlkLCB0aGVyZSBpcyBubyBuZWVk
IGZvciBQT1IgaW4gRFRTLCBiZWNhdXNlIHlvdSBoYXZlIG5vdGhpbmcgdGhlcmUuCj4gPiA+IFdo
eSBkbyB5b3UgaW5zaXN0IG9uIHB1dHRpbmcgaXQgb24gRFRTPwo+ID4gPgo+ID4gPiA+IEl0J3Mg
anVzdCB0aGF0IGhpcyByZXNvdXJjZXMgYXJlIG9ubHkgc2hhcmVkIHdpdGggUlRDJ3MgUmVnLgo+
ID4gPgo+ID4gPiBXaGF0IHJlc291cmNlcz8gUmVnPyBUaGF0J3Mgbm90IGEgc2VwYXJhdGUgcmVz
b3VyY2UuCj4gPgo+ID4gSSdtIHZlcnkgc29ycnkgYWJvdXQgdGhpcy4KPiA+IEJ1dCBJIGZvdW5k
IGEgYmluZGluZyBmaWxlIHRoYXQgb25seSBjb250YWlucyBSZWcgYW5kIENvbXBhdGlibGUuCj4g
Pgo+ID4gcnRjQDgwOTIwMDAwIHsKPiA+IGNvbXBhdGlibGUgPSAiY2lycnVzLGVwOTMwMS1ydGMi
Owo+ID4gcmVnID0gPDB4ODA5MjAwMDAgMHgxMDA+Owo+ID4gfTsKPiA+Cj4gPiBMaW5rOiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL2NpcnJ1cyxlcDkzMDEtcnRjLnlhbWwK
PiA+Cj4gPiA+Cj4gPiA+IFRvIHN1bW1hcml6ZTogRHJvcCBQT1IgZnJvbSBEVFMgYW5kIG5ldmVy
IGJyaW5nIGl0IGJhY2ssIHVubGVzcyB5b3UgY29tZQo+ID4gPiB3aXRoIHNvbWUgZGlmZmVyZW50
IGFyZ3VtZW50cywgd2hpY2ggeW91IGRpZCBub3Qgc2F5IGFscmVhZHkuCj4gPiA+Cj4gPgo+ID4g
WW91IGFyZSByaWdodCwgaWYgdGhlcmUgaXMgbm8gcG9yIGRldmljZSB0cmVlIG5vZGUsIGhvdyBj
YW4gdGhlIHBvcgo+ID4gZHJpdmVyIG9idGFpbiB0aGUgUmVnPwo+Cj4gSSBndWVzcyB0aGUgcXVl
c3Rpb24gaXMgd2h5IGRvbid0IHlvdSByZWdpc3RlciBldmVyeXRoaW5nIGZyb20gdGhlIFJUQwo+
IGRyaXZlcj8KClRoYW5rcywgUE9SIHByb3ZpZGVzIHBvd2VyIG9mZiBhbmQgcmVzdGFydCBmdW5j
dGlvbnMgYXMgYSBjaGlsZCBub2RlIG9mIFJUQy4KU28sIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHBs
YWNlZCBpbiB0aGUgcG93ZXIvcmVzZXQgZGlyZWN0b3J5LgoKQmVzdCByZWdhcmRzLApKaW5nYmFv
IFFpdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
