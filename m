Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C0CD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ma0NxxkfNCIHWqZq1Sg65UyKi2YiMoAaYre/pHipe9s=; b=LxwotvBF+S/BK+
	7/QX108ZeAqUEn5SLsZiXDwkMfPXFeEaoGimG+2eBalm8cXIpAUOucDKzUZrVTf2Wys9lCIWskyO+
	a+w9JQtNxFKj+kTSc4Y7FK3np3l+ool91WSZWbRCkFdnvG0boaXBMOVJZV5ilD5UQ9zhr3F0mufoL
	2u5Finlwu1POGkih7jqVGe62ktU/Am297RzvBdSchuKZv6AyzZXe7Plf40U1c2YnQLH11rHE463JQ
	DVhygUCiDXTzSDvTfES0h+ullwIZrwP5id6o4hHf9m97jfhyyRFSR0Q5ozDsTdq5iIsbKN3x4oAls
	KaycRxI6mvL8Y9tvrbvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjrN-0000000EmfM-1aFC;
	Mon, 08 Apr 2024 07:56:09 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjrI-0000000EmbN-0Ryp
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 07:56:07 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso3537713a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1712562960; x=1713167760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlRAgbUK4c4fePugXsYs1YBYiCmPZ//5mHvUyF++Wpg=;
        b=FwtiuR5eU94poPKEgLoSlCRdSxyYDlcnR/UmvfsJBigD9D2ggLTg/fCdWw2x2p183y
         h7C62XYbrF2/lP2s7XoB1Q0h3C9SH+sy8aDLMCnte3ET/q2CycW1ybozWz1dePg+7+Hl
         eIleKQRhXM9QRp5ZbZOdVe10nLZZmti0kAV5mfpr2YpVmxsc/CSgxc+PbabuBfLod5Gi
         EFs1sXCEDpCPoN899wq/gQCsEnXsT9jLNSiKfoIjewcHiR6ieRSsacSNQbZ5xXhESbLP
         yqQQbQg/0+0HSJ7JVjCZ0JinvO3r1/98+nigpaRIK9HX/ZTgsxERWUAEzXPZjhN2xZIR
         P85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562960; x=1713167760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlRAgbUK4c4fePugXsYs1YBYiCmPZ//5mHvUyF++Wpg=;
        b=uefgaGeiArhBGGcHUs1Vq+OFSQLaHS8X5kAveHaxpZiUg+Ws+Me0AkeVjakVulrwyc
         WDfk25Ww/yBkAP6iAK3kipoR2gAmG9vn5fMBAm3N4cYMTP49HXcag9AkkXnBIDqkE72C
         A6KjzIZxmlUFPvev682CpAgQ1+IHulzT1tecGehdJ0lVfNKenWFEo1huLnowBYMq/ed7
         Ad1mDoMoftpDTZr/HOtqgsayfsYkFaQkbiCEOdnZRuLwdILnoLyyEZ1o5qfUNgyY6jNI
         hduF8GvwJd6Gjo9IztkIDSaNmZTQo+KKDZ6LCBDD0D943fH45dKfzlFDubN/34H8q8Im
         P+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6jjxj+D440VX70hfMYPu9IQ1oppL8uNXbB4WItetLINByBhN3njLheob+CGl2h7+QZj9ULgQACOOhQTKNtK3FOpr92J6luzS65Ziz3eek
X-Gm-Message-State: AOJu0YwoueH+hE8Xqa8urTOyAtXDdDY42TWsQYJeQY6I273byKPvwMbc
	bSyRGdSdK6kfKSqvwxBOWLTUnzqj992zh6MCaZNZdlfbHfN6v1tUAWgYiMs4O+STnQuAV99J0yh
	3zrDVGlYnVJ1rp44oE4ZdZP5uWDGuuVH5J2dE8A==
X-Google-Smtp-Source: AGHT+IFGXH9CgjzygL7g3RDaOsqnAK33JqVcOhvpwIdCpz6B+gc9aLg3nRsdV3kEWWplMIgXfa25m+7yEXgutZ/dNUQ=
X-Received: by 2002:a17:90a:1307:b0:2a2:b097:dabc with SMTP id
 h7-20020a17090a130700b002a2b097dabcmr7611521pja.31.1712562960261; Mon, 08 Apr
 2024 00:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240407213236.2121592-3-christoph.muellner@vrull.eu>
 <tencent_CF232CDF85208DF6BFA3076E73CC4E087306@qq.com> <CAEg0e7h0F_LaeMoS6Co1UjgLM6ML8SXtTfHW5+OQS6yedjdZPQ@mail.gmail.com>
 <tencent_459BC09115173E0624A4A0F19D2F43704F05@qq.com>
In-Reply-To: <tencent_459BC09115173E0624A4A0F19D2F43704F05@qq.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 8 Apr 2024 09:55:48 +0200
Message-ID: <CAEg0e7jW=Sfc3tcc0eJwbTx=vb0HM49ZWpda972E-t=Fj1PG+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: T-Head: Test availability bit before
 enabling MAE errata
To: Yangyu Chen <cyy@cyyself.name>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, alistair.francis@wdc.com, 
	Albert Ou <aou@eecs.berkeley.edu>, bjorn@kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
	cooper.qu@linux.alibaba.com, dbarboza@ventanamicro.com, 
	Qingfang Deng <dqfext@gmail.com>, eric.huang@linux.alibaba.com, heiko@sntech.de, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, philipp.tomsich@vrull.eu, 
	samuel.holland@sifive.com, zhiwei_liu@linux.alibaba.com, 
	Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_005604_292625_615CB76C 
X-CRM114-Status: GOOD (  48.07  )
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCA5OjM34oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+Cj4KPgo+ID4gT24gQXByIDgsIDIwMjQsIGF0IDE0OjAwLCBDaHJpc3Rv
cGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4gd3JvdGU6Cj4gPgo+ID4g
T24gTW9uLCBBcHIgOCwgMjAyNCBhdCAzOjU44oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjAyNC80LzggMDU6MzIsIENocmlzdG9waCBNw7xs
bG5lciB3cm90ZToKPiA+Pj4gVC1IZWFkJ3MgbWVtb3J5IGF0dHJpYnV0ZSBleHRlbnNpb24gKFhU
aGVhZE1hZSkgKG5vbi1jb21wYXRpYmxlCj4gPj4+IGVxdWl2YWxlbnQgb2YgUlZJJ3MgU3ZwYm10
KSBpcyBjdXJyZW50bHkgYXNzdW1lZCBmb3IgYWxsIFQtSGVhZCBoYXJ0cy4KPiA+Pj4gSG93ZXZl
ciwgUUVNVSByZWNlbnRseSBkZWNpZGVkIHRvIGRyb3AgYWNjZXB0YW5jZSBvZiBndWVzdHMgdGhh
dCB3cml0ZQo+ID4+PiByZXNlcnZlZCBiaXRzIGluIFBURXMuCj4gPj4+IEFzIFhUaGVhZE1hZSB1
c2VzIHJlc2VydmVkIGJpdHMgaW4gUFRFcyBhbmQgTGludXggYXBwbGllcyB0aGUgTUFFIGVycmF0
YQo+ID4+PiBmb3IgYWxsIFQtSGVhZCBoYXJ0cywgdGhpcyBicm9rZSB0aGUgTGludXggc3RhcnR1
cCBvbiBRRU1VIGVtdWxhdGlvbnMKPiA+Pj4gb2YgdGhlIEM5MDYgZW11bGF0aW9uLgo+ID4+Pgo+
ID4+PiBUaGlzIHBhdGNoIGF0dGVtcHRzIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBieSB0ZXN0aW5n
IHRoZSBNQUUtZW5hYmxlIGJpdAo+ID4+PiBpbiB0aGUgdGguc3hzdGF0dXMgQ1NSLiBUaGlzIENT
UiBpcyBhdmFpbGFibGUgaW4gSFcgYW5kIGNhbiBiZQo+ID4+PiBlbXVsYXRlZCBpbiBRRU1VLgo+
ID4+Pgo+ID4+PiBUaGlzIHBhdGNoIGFsc28gbWFrZXMgdGhlIFhUaGVhZE1hZSBwcm9iaW5nIG1l
Y2hhbmlzbSByZWxpYWJsZSwgYmVjYXVzZQo+ID4+PiBhIHRlc3QgZm9yIHRoZSByaWdodCBjb21i
aW5hdGlvbiBvZiBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaW1waWQKPiA+Pj4gaXMgbm90IHN1
ZmZpY2llbnQgdG8gZW5hYmxlIE1BRS4KPiA+Pj4KPiA+Pj4gUmV2aWV3ZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+ID4+PiAtLS0K
PiA+Pj4gIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIHwgMTQgKysrKysrKysrKy0t
LS0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRh
LmMgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+ID4+PiBpbmRleCA2ZTdlZTFm
MTZiZWUuLmJmNmEwYTYzMThlZSAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEv
dGhlYWQvZXJyYXRhLmMKPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRh
LmMKPiA+Pj4gQEAgLTE5LDYgKzE5LDkgQEAKPiA+Pj4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD5m
Cj4gPj4+ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcmlkX2xpc3QuaD4KPiA+Pj4KPiA+Pj4gKyNkZWZp
bmUgQ1NSX1RIX1NYU1RBVFVTICAgICAgICAgICAgICAweDVjMAo+ID4+PiArI2RlZmluZSBTWFNU
QVRVU19NQUVFICAgICAgICAgICAgICAgIF9BQygweDIwMDAwMCwgVUwpCj4gPj4+ICsKPiA+Pj4g
IHN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9tYWUodW5zaWduZWQgaW50IHN0YWdlLAo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJjaF9pZCwgdW5zaWduZWQg
bG9uZyBpbXBpZCkKPiA+Pj4gIHsKPiA+Pj4gQEAgLTI4LDExICszMSwxNCBAQCBzdGF0aWMgYm9v
bCBlcnJhdGFfcHJvYmVfbWFlKHVuc2lnbmVkIGludCBzdGFnZSwKPiA+Pj4gICAgICBpZiAoYXJj
aF9pZCAhPSAwIHx8IGltcGlkICE9IDApCj4gPj4+ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gPj4+Cj4gPj4KPiA+PiBJIHdvdWxkIHJhaXNlIGEgbGl0dGxlIGNvbmNlcm4gYWJvdXQga2Vl
cGluZyB0aGlzICJpZiIgc3RhdGVtZW50IGZvcgo+ID4+IGFyY2hfaWQgYW5kIGltcF9pZCBhZnRl
ciB3ZSBoYXZlIHByb2JlZCBpdCBpbiB0aGlzIENTUiB3YXkuIEkgd291bGQgbGlrZSB0bwo+ID4+
IHJlbW92ZSBpdCBhbmQgbW92ZSB0aGUgQ1NSIHByb2JlIGVhcmxpZXIgdGhhbiBSSVNDVl9BTFRF
Uk5BVElWRVMuCj4gPj4KPiA+PiBJIGFkZGVkIENDIHRvIGd1b3JlbiBmb3IgbW9yZSBvcGluaW9u
cy4KPiA+Pgo+ID4+IEV2ZW4gVC1IZWFkIEM5MDggY29tZXMgaW4gMjAyMywgd2hpY2ggc3VwcG9y
dHMgUlZWIDEuMCBhbmQgYWxzbyBrZWVwcyBNQUVFLgo+ID4+IEJ1dCBpdCBhbHNvIHN1cHBvcnRz
IFN2cGJtdCwgYW5kIHdlIGNhbiBwZXJmb3JtIHRoZSBzd2l0Y2ggYnkgY2xlYXJpbmcgdGhlCj4g
Pj4gTUFFRSBiaXQgaW4gQ1NSX1RIX01YU1RBVFVTIGluIE0tTW9kZSBTb2Z0d2FyZS4KPiA+Pgo+
ID4+IE1vcmVvdmVyLCBULUhlYWQgTUFFRSBtYXkgbm90IGJlIHJlbW92ZWQgaW4gdGhlIGZ1dHVy
ZSBvZiBULUhlYWQgQ1BVcy4gV2UKPiA+PiBjYW4gc2VlIHNvbWV0aGluZyBmcm9tIHRoZSBULUhl
YWQgQzkwOCBVc2VyIE1hbnVhbCB0aGF0IGFkZHMgYSBTZWN1cml0eSBiaXQKPiA+PiB0byBNQUVF
LiBTbywgaXQgbWlnaHQgdXNlZCBpbiB0aGVpciBvd24gVEVFIGltcGxlbWVudGF0aW9uIGFuZCB3
aWxsIG5vdCBiZQo+ID4+IHJlbW92ZWQuCj4gPj4KPiA+PiBIb3dldmVyLCBDOTA4IGhhcyBhcmNo
X2lkIGFuZCBpbXBpZCwgd2hpY2ggYXJlIG5vdCBlcXVhbCB0byB6ZXJvLiBZb3UgY2FuCj4gPj4g
c2VlIGl0IGZyb20gdGhlIEM5MDggYm9vdCBsb2cgWzJdIGZyb20gbXkgcGF0Y2ggdG8gc3VwcG9y
dCBLMjMwIFszXS4gU28sIGlmCj4gPj4gd2UgaGF2ZSBwcm9iZWQgTUFFRSB1c2luZyBDU1IsIHlv
dSBjb25maXJtZWQgdGhhdCB0aGlzIGJpdCB3aWxsIGFsc28gYmUgc2V0Cj4gPj4gaW4gdGhlIEM5
MDYgY29yZS4gV2UgY2FuIG9ubHkgcHJvYmUgaXQgdGhpcyB3YXkgYW5kIG5vIGxvbmdlciB1c2Ug
YXJjaF9pZAo+ID4+IGFuZCBpbXBfaWQuIEFuZCBpZiB0aGUgYXJjaF9pZCBhbmQgaW1wX2lkIHBy
b2JlcyBnZXQgcmVtb3ZlZCwgd2Ugc2hvdWxkCj4gPj4gYWxzbyBtb3ZlIHRoZSBjc3IgcHJvYmUg
ZWFybGllciB0aGFuIHJpc2N2IGFsdGVybmF0aXZlcy4KPiA+Cj4gPiBXZSBrZWVwIHRoZSBwcm9i
aW5nIHZpYSBhcmNoX2lkPT0wJiZpbXBpZD09MCBiZWNhdXNlIHdlIGhhZCB0aGF0Cj4gPiBhbHJl
YWR5IGluIHRoZSBrZXJuZWwgYW5kIGRvbid0IHdhbnQgdG8gYnJlYWsgZXhpc3RpbmcgZnVuY3Rp
b25hbGl0eS4KPiA+Cj4gPiBGcm9tIHRoZSBkaXNjdXNzaW9ucyB0aGF0IHdlIGhhZCBhYm91dCB0
aGUgdjEgYW5kIHYyIG9mIHRoaXMgc2VyaWVzLAo+ID4gbXkgaW1wcmVzc2lvbiBpcyB0aGF0IHdl
IHNob3VsZCB1c2UgRFQgcHJvcGVydGllcyBpbnN0ZWFkIG9mIHByb2JpbmcKPiA+IGFyY2hfaWQg
YW5kIGltcGlkLiBTbywgaWYgQzkwOCBzdXBwb3J0IGlzIG5lZWRlZCwgdGhpcyBzaG91bGQgcHJv
YmFibHkKPiA+IGJlIGludHJvZHVjZWQgdXNpbmcgRFQgcHJvcGVydGllcy4gVGhlIGxvZ2ljIHdv
dWxkIHRoZW4gYmU6Cj4gPiAqIGlmIGFyY2hfaWQgPT0gMCBhbmQgaW1waWQgPT0gMCB0aGVuIGRl
Y2lkZSBiYXNlZCBvbiB0aC5zeHN0YXR1cy5NQUVFCj4gPiAqIGVsc2UgdGVzdCBpZiAieHRoZWFk
bWFlIiBpcyBpbiB0aGUgRFQKPiA+Cj4gPgo+Cj4gSSBrbm93IGFib3V0IGl0LCBhbmQgQ29ub3Ig
YWxzbyBtZW50aW9uZWQgYWRkaW5nIHRoaXMgcHJvcGVydHkgdG8gRFQgYSBmZXcKPiBtb250aHMg
YWdvLiBJIGFncmVlIHdpdGggdGhpcyBhdCB0aGF0IHRpbWUuIEJ1dCBmb3Igbm93LCB5b3UgaGF2
ZSBmb3VuZCB0aGUKPiBULUhlYWQgZG9jdW1lbnQgZGVzY3JpcHRpb24gYWJvdXQgdGhpcywgYW5k
IHdlIGNhbiBwcm9iZSBNQUUgdXNpbmcgQ1NSIGV2ZW4KPiBvbiBDOTA2LiBJIHRoaW5rIG9ubHkg
cHJvYmluZyBpbiBDU1Igd2lsbCBiZSBhIGJldHRlciB3YXkgdG8gZG8gdGhhdC4gSXQKPiBjYW4g
bWFpbnRhaW4gY29tcGF0aWJpbGl0eSB3aXRoIHNvbWUgZWFybHkgY29yZXMsIHN1Y2ggYXMgQzkw
Ni4gQW5kIHdpbGwKPiBhbHNvIHN1cHBvcnQgc29tZSBuZXcgY29yZXMgd2l0aCBub24temVybyBh
cmNoX2lkIGFuZCBpbXBsX2lkIGJ1dCBtYXkgaGF2ZQo+IE1BRSBlbmFibGVkLCBzdWNoIGFzIEM5
MDguCj4KPiBGb3IgZnV0dXJlIGNvbmNlcm5zLCBULUhlYWQgc2FpZCBmcm9tIHRoZWlyIGRvY3Vt
ZW50YXRpb24gdGhhdAo+ICJBdmFpbGFiaWxpdHk6IFRoZSB0aC5zeHN0YXR1cyBDU1IgaXMgYXZh
aWxhYmxlIG9uIGFsbCBzeXN0ZW1zIHdob3NlCj4gbXZlbmRvcmlkIENTUiBob2xkcyBhIHZhbHVl
IG9mIDB4NUI3LiIgWzFdIGFuZCB0aGlzIGV4dGVuc2lvbiBpcyBmcm96ZW4gYW5kCj4gc3RhYmxl
LiBJIHRoaW5rIGl0J3Mgb2theSB0byBoYXZlIE1BRSBlcnJhcmEgZm9yIHNvbWUgY3B1cyB3aG9z
ZSBpbXBsX2lkCj4gYW5kIGFyY2hfaWQgYXJlIG5vbi16ZXJvLiBBbmQgVC1IZWFkIG1heSBoYXZl
IHVzZWQgdGhpcyBmb3IgdGhlaXIgVEVFLCBzbwo+IGl0IG1pZ2h0IG5ldmVyIGJlIHJlbW92ZWQu
CgpJIHdyb3RlIHRoYXQgc3BlY2lmaWNhdGlvbi4gQW5kIHllcywgVC1IZWFkIHJldmlld2VkIHRo
YXQgcGFydC4KQnV0IHRoZXJlIGlzIG5vIGd1YXJhbnRlZSBmb3IgZnV0dXJlIGNvcmVzLgoKVGhl
IHF1ZXN0aW9uIGlzOiB3aHkgc2hvdWxkIHRoZSBrZXJuZWwgaGF2ZSB0byBjYXJlIGFib3V0IHRo
YXQ/ClRoaXMgY2FuIGFsbCBiZSBhZGRyZXNzZWQgKGhpZGRlbikgaW4gRlcsIHdoZXJlIGNvcmUt
c3BlY2lmaWMKcm91dGluZXMgY2FuIHRlc3QgdGhlIHJlcXVpcmVkIGJpdHMgaW4gdmVuZG9yIENT
UnMgYW5kIHNldCBEVCBwcm9wZXJ0aWVzCnRoYXQgbWF0Y2ggdGhlIGNvcmUncyBjb25maWd1cmF0
aW9uLgoKPiBTaW5jZSBpdCBtaWdodCBuZXZlciBiZSByZW1vdmVkLCBpZiBzb21lIHZlbmRvciB1
c2VzIGl0IGFuZCBtYWtlcyBpdCBoYXJkCj4gdG8gcnVuIHRoZSBtYWlubGluZSBrZXJuZWwgc2lu
Y2UgaXQgcmVxdWlyZXMgc2V0dGluZyBDU1IgaW4gTS1Nb2RlIHNvZnR3YXJlCj4gb3IgY2hhbmdp
bmcgdGhlIERULCB0aGV5IG1heSBiZSBoYXJkIHRvIGNoYW5nZSBmb3Igc29tZSBzZWN1cml0eSBy
ZWFzb25zCj4gZm9yIFRFRSwgSSB0aGluayBpdCdzIG5vdCByaWdodC4KPgo+IEknbSBhbHNvIHdh
aXRpbmcgZm9yIENvbm9yJ3Mgb3BpbmlvbiBhYm91dCB0aGlzLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9ULWhlYWQtU2VtaS90aGVhZC1leHRlbnNpb24tc3BlYy9ibG9iL21hc3Rlci94dGhl
YWRzeHN0YXR1cy5hZG9jCj4KPiBUaGFua3MsCj4gWWFuZ3l1IENoZW4KPgo+ID4KPiA+Cj4gPj4K
PiA+PiBbMV0gaHR0cHM6Ly9vY2MtaW50bC1wcm9kLm9zcy1hcC1zb3V0aGVhc3QtMS5hbGl5dW5j
cy5jb20vcmVzb3VyY2UvLzE2OTkyNjgzNjkzNDcvWHVhblRpZS1DOTA4LVVzZXJNYW51YWwucGRm
Cj4gPj4gWzJdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2N5eXNlbGYvYjk0NDVmMzhjYzNiYTEw
OTQ5MjRiZDQxYzkwODYxNzYKPiA+PiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvdGVuY2VudF9EMTE4MDU0MUI0QjMxQzAzNzFEQjYzNEE0MjY4MUE1QkY4MDlAcXEuY29t
Lwo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+IFlhbmd5dSBDaGVuCj4gPj4KPiA+Pj4gLSAgICAgaWYg
KHN0YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UIHx8Cj4gPj4+IC0gICAgICAg
ICBzdGFnZSA9PSBSSVNDVl9BTFRFUk5BVElWRVNfTU9EVUxFKQo+ID4+PiAtICAgICAgICAgICAg
IHJldHVybiB0cnVlOwo+ID4+PiArICAgICBpZiAoc3RhZ2UgIT0gUklTQ1ZfQUxURVJOQVRJVkVT
X0VBUkxZX0JPT1QgJiYKPiA+Pj4gKyAgICAgICAgIHN0YWdlICE9IFJJU0NWX0FMVEVSTkFUSVZF
U19NT0RVTEUpCj4gPj4+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+Pgo+ID4+PiAt
ICAgICByZXR1cm4gZmFsc2U7Cj4gPj4+ICsgICAgIGlmICghKGNzcl9yZWFkKENTUl9USF9TWFNU
QVRVUykgJiBTWFNUQVRVU19NQUVFKSkKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gPj4+ICsKPiA+Pj4gKyAgICAgcmV0dXJuIHRydWU7Cj4gPj4+ICB9Cj4gPj4+Cj4gPj4+ICAv
Kgo+ID4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
