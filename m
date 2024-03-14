Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC62C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSY5qpYTvhhm6s+RgagXDdOC+tLk8Ad8A5daq6Kwywo=; b=gDSVPDUIeouCiF
	4dkqpHsFrzBkEeK9U4JzZG42eIKXJK8Zwu0TUF4xwCRJQXJc+CGI39uSuprOwgl73neyuWb+7m7n9
	a1uBfqUP6SX4Bvj3IcgHcUkli2v4boLGpq+3eV0fp8aDdOrh1+yY9s95+jQjVRW9geB/gy/y3JXXd
	/6sRBtEsR4VnGjgdR61E4c9/2ezUSeX5OnYnoVhtlLzb/FC1dZPZ2txmrEAtCxm9jgKrShJVK6iTp
	bCS+Ao8EumEDMs3HdsYOVTQrgVJSJyz9xsJ56wBuMPBBr3JI/Q48fZCxdpRsAFfgxIq19RL+gHxTf
	+3/YBgCPETMzNI8MTQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rknki-0000000Eyri-1PGv;
	Thu, 14 Mar 2024 16:16:20 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rknkf-0000000EyrK-2wiJ
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 16:16:19 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a45d9d6d6aso265333eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710432975; x=1711037775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OigFCA6TWncj1dITIB+Ew0q0iS/FSFUD6r9Xvtt/yu4=;
        b=lgczAEu8je+VkaYkS4p1wCCxmH3qbEJ5vdDC/esYO1t5JBDCXnA7lrWN86KxOzdCNS
         uZGpSwW5OGzTMAPudMe1Xo/7HPreGjclhrF9zndKbaHEuBhx4oNchAkY5+yQFeTQGZ41
         KYFi2rRY62mYaF8/XhNw2kkbBAkdOoYeaHCKhOYpoWeScTssy3ZI/UGMQW5oQKvjEQA3
         qD19f11maO6aObdYUcyQqfCj81RWkkx0EAp5AQESGqdvjR0kenAw6tM9C0qogx6Ph2n9
         KvaiY1J3QVFHgDrk4Zqs6EgOX4Db8ARnuzSXy7guzwEZyLuhRdGk6PCurZlw30g58+KD
         OHXg==
X-Forwarded-Encrypted: i=1; AJvYcCWRdy/SuZdjPNg/A6UdtwpHzMrgTBU6QbTn4j/K9HLb08IduWL2lvwAmRUpwlQ56BavA5LBSDub8QXpmhU2NvYe9rLHEMhV7ul7Ou0wqy1o
X-Gm-Message-State: AOJu0YwSFZWYcJxMED/SE0HY1Jf1SEPyqryLLyOE6l735D3Fq9+56tOK
	TOuZY1NwTjgcPAMt0oqUqhPhcwSVm1baQiTkluTjHa7F2wPt96sAdrRf/n0eP3M=
X-Google-Smtp-Source: AGHT+IG67VorH251FMuuISsajqDMRRl2O5GXgrYMXPd/2PMedI174lcCPWxxqUl5ZJ3zDzmFLheqiw==
X-Received: by 2002:a05:6358:7f02:b0:17b:f464:e14b with SMTP id p2-20020a0563587f0200b0017bf464e14bmr2502845rwn.13.1710432975172;
        Thu, 14 Mar 2024 09:16:15 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g13-20020a25ef0d000000b00dc2310abe8bsm299229ybd.38.2024.03.14.09.16.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 09:16:14 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a0599f631so10451717b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 09:16:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeRiB0svpMILc4IJD7lNJU+VVyo4mkXPjDzSbKDOGCwiJ9Vqr2kZqlfN2GHoASSQsijPdRlqW+RcHg2RHiY7JJj8CPx2FIoXH6Siuzx/pL
X-Received: by 2002:a81:bf4a:0:b0:60a:66d3:c021 with SMTP id
 s10-20020a81bf4a000000b0060a66d3c021mr2336021ywk.22.1710432974719; Thu, 14
 Mar 2024 09:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
 <695ebdde-3dc3-41b1-b20b-f02c4ba1ae5d@sifive.com> <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
 <42c3d591-abe5-4343-9a94-f1705430dcea@sifive.com>
In-Reply-To: <42c3d591-abe5-4343-9a94-f1705430dcea@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 17:16:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLuK=SvwW-MvmCc4hhPTChDzU6q6SPCFTzjGFe8oijig@mail.gmail.com>
Message-ID: <CAMuHMdWLuK=SvwW-MvmCc4hhPTChDzU6q6SPCFTzjGFe8oijig@mail.gmail.com>
Subject: Re: [PATCH] clk: starfive: jh7100: Use provided clocks instead of
 hardcoded names
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_091617_764342_1F0F12AE 
X-CRM114-Status: GOOD (  30.58  )
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

SGkgU2FtdWVsLAoKT24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMzo1NuKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiBPbiAyMDI0LTAzLTE0IDk6
NDggQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDE0LCAyMDI0
IGF0IDM6MzLigK9QTSBTYW11ZWwgSG9sbGFuZAo+ID4gPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5j
b20+IHdyb3RlOgo+ID4+IE9uIDIwMjQtMDMtMTQgNjowNSBBTSwgR2VlcnQgVXl0dGVyaG9ldmVu
IHdyb3RlOgo+ID4+PiBUaGUgU3RhcmZpdmUgSkg3MTAwIGNsb2NrIGRyaXZlciBkb2VzIG5vdCB1
c2UgdGhlIERUICJjbG9ja3MiIHByb3BlcnR5Cj4gPj4+IHRvIGZpbmQgaXRzIGV4dGVybmFsIGlu
cHV0IGNsb2NrcywgYnV0IGluc3RlYWQgcmVsaWVzIG9uIHRoZSBuYW1lcyBvZgo+ID4+PiB0aGUg
YWN0dWFsIGV4dGVybmFsIGNsb2NrIHByb3ZpZGVycy4gIFRoaXMgaXMgZnJhZ2lsZSwgYW5kIGNh
dXNlZAo+ID4+PiBicmVha2FnZSB3aGVuIHNhbml0aXppbmcgY2xvY2sgbmFtZXMgaW4gRFQuCj4g
Pj4+Cj4gPj4+IEZpeCB0aGlzIGJ5IG9idGFpbmluZyB0aGUgZXh0ZXJuYWwgaW5wdXQgY2xvY2tz
IHRocm91Z2ggdGhlIERUICJjbG9ja3MiCj4gPj4+IHByb3BlcnR5LCBhbmQgdXNpbmcgdGhlaXIg
Y2xrX2h3IG9iamVjdHMgb3IgY29ycmVzcG9uZGluZyBuYW1lLgo+ID4+Pgo+ID4+PiBGaXhlczog
ZjAzNjA2NDcwODg2ICgicmlzY3Y6IGR0czogc3RhcmZpdmU6IHJlcGxhY2UgdW5kZXJzY29yZXMg
aW4gbm9kZSBuYW1lcyIpCj4gPj4+IEZpeGVzOiA0MjEwYmU2NjhhMDllZTIwICgiY2xrOiBzdGFy
Zml2ZTogQWRkIEpINzEwMCBjbG9jayBnZW5lcmF0b3IgZHJpdmVyIikKPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+Cj4gPj4+
IC0tLSBhL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMDAuYwo+ID4+PiAr
KysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAwLmMKPiA+Cj4gPj4+
IEBAIC0yOTgsMTMgKzMxMSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBjbGtfc3RhcmZpdmVfamg3
MTAwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4+ICAgICAgIGlmIChJ
U19FUlIocHJpdi0+YmFzZSkpCj4gPj4+ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocHJp
di0+YmFzZSk7Cj4gPj4+Cj4gPj4+ICsgICAgIGZvciAoaWR4ID0gMDsgaWR4IDwgRVhUX05VTV9D
TEtTOyBpZHgrKykgewo+ID4+PiArICAgICAgICAgICAgIGNsayA9IGRldm1fY2xrX2dldCgmcGRl
di0+ZGV2LCBqaDcxMDBfZXh0X2Nsa1tpZHhdKTsKPiA+Pj4gKyAgICAgICAgICAgICBpZiAoSVNf
RVJSKGNsaykpCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjbGsp
Owo+ID4+PiArCj4gPj4+ICsgICAgICAgICAgICAgcHJpdi0+ZXh0W2lkeF0gPSBfX2Nsa19nZXRf
aHcoY2xrKTsKPiA+Pj4gKyAgICAgfQo+ID4+PiArCj4gPj4+ICsgICAgIG9zY19zeXMgPSBjbGtf
aHdfZ2V0X25hbWUocHJpdi0+ZXh0W0VYVF9DTEtfT1NDX1NZU10pOwo+ID4+PiArCj4gPj4+ICAg
ICAgIHByaXYtPnBsbFswXSA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rvcihwcml2
LT5kZXYsICJwbGwwX291dCIsCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAib3NjX3N5cyIsIDAsIDQwLCAxKTsKPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9zY19zeXMs
IDAsIDQwLCAxKTsKPiA+Pj4gICAgICAgaWYgKElTX0VSUihwcml2LT5wbGxbMF0pKQo+ID4+PiAg
ICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHByaXYtPnBsbFswXSk7Cj4gPj4+Cj4gPj4+ICAg
ICAgIHByaXYtPnBsbFsxXSA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rvcihwcml2
LT5kZXYsICJwbGwxX291dCIsCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAib3NjX3N5cyIsIDAsIDY0LCAxKTsKPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9zY19zeXMs
IDAsIDY0LCAxKTsKPiA+Pgo+ID4+IFRoZXNlIHNob3VsZCB1c2UgZGV2bV9jbGtfaHdfcmVnaXN0
ZXJfZml4ZWRfZmFjdG9yX3BhcmVudF9odygpLiAoT3IgeW91IGNvdWxkCj4gPgo+ID4gVGhhbmtz
LCBJIGRpZG4ndCBrbm93IGFib3V0IHRoYXQgZnVuY3Rpb24hCj4gPgo+ID4+IGRlZmluZSBhIGRl
dm1fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rvcl9md19uYW1lKCkgYW5kIGRyb3AgdGhlIG90
aGVyIGNoYW5nZXMuKQo+ID4KPiA+IFNvcnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3Ug
bWVhbiBoZXJlPwo+Cj4gSW4gdGhlIGxvb3AgYmVsb3csIHRoZSBwYXJlbnRzIGFyZSBhbHJlYWR5
IHJlZmVyZW5jZWQgdmlhIC5md19uYW1lLiBUaGF0IG1lYW5zCj4gdGhlIHN0cmluZyBpcyB0aGUg
RFQgY2xvY2stbmFtZXMgcHJvcGVydHkgdmFsdWUsIG5vdCB0aGUgTGludXgtaW50ZXJuYWwgY2xv
Y2sKPiBuYW1lIChzZWUgY2xrX2NvcmVfZ2V0KCkpLiBUaGVzZSB0d28gZnVuY3Rpb24gY2FsbHMg
YXJlIHRoZSBvbmx5IG9uZXMgdGhhdAo+IGRlcGVuZCBvbiB0aGUgaW50ZXJuYWwgY2xvY2sgbmFt
ZS4gSWYgeW91IGNoYW5nZSB0aGVtIHRvIHVzZSAuZndfbmFtZSBhcyB3ZWxsLAo+IHRoZSBjbGtf
Y29yZV9nZXQoKSB3aWxsIGRvIHRoZSByaWdodCB0aGluZywgYW5kIHlvdSBkb24ndCBuZWVkIHRv
IG1hbnVhbGx5IGNhbGwKPiBkZXZtX2Nsa19nZXQoKS4KClRoYW5rIHlvdSwgSSB3YXNuJ3QgYXdh
cmUgdGhlc2UgZndfbmFtZSBuYW1lcyB3ZXJlIGFjdHVhbGx5IGRvaW5nIHRoZQpyaWdodCB0aGlu
ZyA7LSkKClN0aWxsLCBsb29raW5nIHVwIGJ5IG5hbWUgaXMgbW9yZSBleHBlbnNpdmUgdGhhbiBq
dXN0IHVzaW5nIHRoZSBwYXNzZWQKY2xrX2h3LiAgQXMgdGhlcmUgYXJlIG11bHRpcGxlIG9jY3Vy
cmVuY2VzIG9mIHRoZSBmb3VyIGV4dGVybmFsCmNsb2NrcyBpbiB0aGUgY2xvY2tzIHRhYmxlLCB0
aHVzIGludm9sdmluZyBtdWx0aXBsZSBsb29rLXVwcywgSSB0aGluawppdCdzIGJldHRlciB0byB1
c2UgY2xrX2h3IGV2ZXJ5d2hlcmUuCgpJIHdpbGwgdXBkYXRlIGZvciB2Mi4uLgoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
