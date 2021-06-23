Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A22C2B9F4
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 01:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D0761166
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 01:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4D0761166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmOlwS65VytC+Vd1nahL3TCTV/NDfYe5hvNC36Fp8BI=; b=Kj6tG9Y3qURJbu
	x7/l1+cDCJLzas6GNwJAwHmMo05ZkxcIceYfr+E9WsagD4nFGGaRCqjmx3r4Fgj/dvHul4otpZLIF
	GLqjf6ioMcc2bw1Pr4ztPVZ2XSVX+n+D0FIO9s19i5T0/dtbwc3zG0b5+v4h3KQra5G0Nsg9Opnc1
	+LtbICbE442Lskse6fk2t3gREfNo2aCFW8h6866dtNO2dGfVJT+mLncD/4IlAVxFnnpIqnLJjZQPP
	zw2C+I7ZQSSjY8GjfE0DHi8uagTGmPc73bwog0iq9HWC1HElUhDSux5xcLz8iP3dGAp2O5hwl4szF
	/h9i5wNODIOkSlXT9Arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvrU5-008v4h-Av; Wed, 23 Jun 2021 01:15:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvrU2-008v3r-C3
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 01:15:15 +0000
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3C85B20B6C14
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 18:15:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3C85B20B6C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1624410913;
 bh=l5w3e6a6uV45UCOPO09+HzRVeLGtrESc4iOLHXlLq40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eeYWpJspNWBJwXVAAozA8nBj+r/ixX8Dlm+JJh+n64jeFEUJ7S/qji3vdmFeyzQbt
 o2riDk6C172kqvkolzAULl0Prm52N4EhZD+iNa6WslrYt/Zk2nv49Tgs7oXLEOlbUM
 SA+1cOODscth8UflP4gI2UwYnyL9Sma4U9qTv0kk=
Received: by mail-pj1-f48.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso2794248pjv.4
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 18:15:13 -0700 (PDT)
X-Gm-Message-State: AOAM531CpU2ywhd4tNvO1pm7Lb1v6gG1JzRAg+GQYfHNM0N1cvuHkfTk
 443BqyuJNw6oYZkHlMd9/Ver897QFyZxX149VfY=
X-Google-Smtp-Source: ABdhPJzLLexTZpICwihNJqNqUYtS2rIt+NYxLY8qUvXTajsE+vUnH89AEaOgxElegimr8XtRQl94Vvtz1Ub5nK9dW5E=
X-Received: by 2002:a17:90a:650b:: with SMTP id
 i11mr6657767pjj.39.1624410912716; 
 Tue, 22 Jun 2021 18:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-4-mcroce@linux.microsoft.com>
 <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
 <d0f11655f21243ad983bd24381cdc245@AcuMS.aculab.com>
In-Reply-To: <d0f11655f21243ad983bd24381cdc245@AcuMS.aculab.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 23 Jun 2021 03:14:36 +0200
X-Gmail-Original-Message-ID: <CAFnufp1XeKM-N1MdWsNpU6NnF-dYUgGXL1W9r_DDWazTMyRHVA@mail.gmail.com>
Message-ID: <CAFnufp1XeKM-N1MdWsNpU6NnF-dYUgGXL1W9r_DDWazTMyRHVA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: optimized memset
To: David Laight <David.Laight@aculab.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_181514_626295_BC64C8C4 
X-CRM114-Status: GOOD (  31.03  )
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMTA6MzggQU0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWln
aHRAYWN1bGFiLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBOaWNrIEtvc3NpZmlkaXMKPiA+IFNlbnQ6
IDIyIEp1bmUgMjAyMSAwMjowOAo+ID4KPiA+IM6jz4TOuc+CIDIwMjEtMDYtMTcgMTg6MjcsIE1h
dHRlbyBDcm9jZSDOrc6zz4HOsc+IzrU6Cj4gPiA+ICsKPiA+ID4gK3ZvaWQgKl9fbWVtc2V0KHZv
aWQgKnMsIGludCBjLCBzaXplX3QgY291bnQpCj4gPiA+ICt7Cj4gPiA+ICsgICB1bmlvbiB0eXBl
cyBkZXN0ID0geyAudTggPSBzIH07Cj4gPiA+ICsKPiA+ID4gKyAgIGlmIChjb3VudCA+PSBNSU5f
VEhSRVNIT0xEKSB7Cj4gPiA+ICsgICAgICAgICAgIGNvbnN0IGludCBieXRlc19sb25nID0gQklU
U19QRVJfTE9ORyAvIDg7Cj4gPgo+ID4gWW91IGNvdWxkIG1ha2UgJ2NvbnN0IGludCBieXRlc19s
b25nID0gQklUU19QRVJfTE9ORyAvIDg7Jwo+Cj4gV2hhdCBpcyB3cm9uZyB3aXRoIHNpemVvZiAo
bG9uZykgPwo+IC4uLgoKTm90aGluZywgSSBndWVzcyB0aGF0IEJJVFNfUEVSX0xPTkcgaXMganVz
dCAoc2l6ZW9mKGxvbmcpICogOCkgYW55d2F5Cgo+ID4gPiArICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGN1ID0gKHVuc2lnbmVkIGxvbmcpYzsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAvKiBD
b21wb3NlIGFuIHVsb25nIHdpdGggJ2MnIHJlcGVhdGVkIDQvOCB0aW1lcyAqLwo+ID4gPiArICAg
ICAgICAgICBjdSB8PSBjdSA8PCA4Owo+ID4gPiArICAgICAgICAgICBjdSB8PSBjdSA8PCAxNjsK
PiA+ID4gKyNpZiBCSVRTX1BFUl9MT05HID09IDY0Cj4gPiA+ICsgICAgICAgICAgIGN1IHw9IGN1
IDw8IDMyOwo+ID4gPiArI2VuZGlmCj4gPiA+ICsKPiA+Cj4gPiBZb3UgZG9uJ3QgaGF2ZSB0byBj
cmVhdGUgY3UgaGVyZSwgeW91J2xsIGZpbGwgZGVzdCBidWZmZXIgd2l0aCAnYycKPiA+IGFueXdh
eSBzbyBhZnRlciBmaWxsaW5nIHVwIGVub3VnaCAnYydzIHRvIGJlIGFibGUgdG8gZ3JhYiBhbiBh
bGlnbmVkCj4gPiB3b3JkIGZ1bGwgb2YgdGhlbSBmcm9tIGRlc3QsIHlvdSBjYW4ganVzdCBncmFi
IHRoYXQgd29yZCBhbmQga2VlcAo+ID4gZmlsbGluZyB1cCBkZXN0IHdpdGggaXQuCj4KPiBUaGF0
IHdpbGwgYmUgYSBsb3Qgc2xvd2VyIC0gZXNwZWNpYWxseSBpZiBydW4gb24gc29tZXRoaW5nIGxp
a2UgeDg2Lgo+IEEgd3JpdGUtcmVhZCBvZiB0aGUgc2FtZSBzaXplIGlzIG9wdGltaXNlZCBieSB0
aGUgc3RvcmUtbG9hZCBmb3J3YXJkZXIuCj4gQnV0IHRoZSBieXRlIHdyaXRlLCB3b3JkIHJlYWQg
d2lsbCBoYXZlIHRvIGdvIHZpYSB0aGUgY2FjaGUuCj4KPiBZb3UgY2FuIGp1c3Qgd3JpdGU6Cj4g
ICAgICAgICBjdSA9ICh1bnNpZ25lZCBsb25nKWMgKiAweDAxMDEwMTAxMDEwMTAxMDF1bGw7Cj4g
YW5kIGxldCB0aGUgY29tcGlsZXIgc29ydCBvdXQgdGhlIGJlc3Qgd2F5IHRvIGdlbmVyYXRlIHRo
ZSBjb25zdGFudC4KPgoKSW50ZXJlc3RpbmcuIEkgc2VlIHRoYXQgbW9zdCBjb21waWxlcnMgZG8g
YW4gaW50ZWdlciBtdWx0aXBsaWNhdGlvbiwKaXMgaXQgZmFzdGVyIHRoYW4gdGhyZWUgc2hpZnQg
YW5kIHRocmVlIG9yPwoKY2xhbmcgb24gcmlzY3YgZ2VuZXJhdGVzIGV2ZW4gbW9yZSBpbnN0cnVj
dGlvbnMgdG8gY3JlYXRlIHRoZSBpbW1lZGlhdGU6Cgp1bnNpZ25lZCBsb25nIHJlcGVhdF9zaGlm
dChpbnQgYykKewogIHVuc2lnbmVkIGxvbmcgY3UgPSAodW5zaWduZWQgbG9uZyljOwogIGN1IHw9
IGN1IDw8IDg7CiAgY3UgfD0gY3UgPDwgMTY7CiAgY3UgfD0gY3UgPDwgMzI7CgogIHJldHVybiBj
dTsKfQoKdW5zaWduZWQgbG9uZyByZXBlYXRfbXVsKGludCBjKQp7CiAgcmV0dXJuICh1bnNpZ25l
ZCBsb25nKWMgKiAweDAxMDEwMTAxMDEwMTAxMDF1bGw7Cn0KCnJlcGVhdF9zaGlmdDoKICBzbGxp
IGExLCBhMCwgOAogIG9yIGEwLCBhMCwgYTEKICBzbGxpIGExLCBhMCwgMTYKICBvciBhMCwgYTAs
IGExCiAgc2xsaSBhMSwgYTAsIDMyCiAgb3IgYTAsIGEwLCBhMQogIHJldAoKcmVwZWF0X211bDoK
ICBsdWkgYTEsIDQxMTIKICBhZGRpdyBhMSwgYTEsIDI1NwogIHNsbGkgYTEsIGExLCAxNgogIGFk
ZGkgYTEsIGExLCAyNTcKICBzbGxpIGExLCBhMSwgMTYKICBhZGRpIGExLCBhMSwgMjU3CiAgbXVs
IGEwLCBhMCwgYTEKICByZXQKCj4gPgo+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJQ0lF
TlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiArICAgICAgICAgICAvKiBGaWxsIHRoZSBidWZmZXIg
b25lIGJ5dGUgYXQgdGltZSB1bnRpbCB0aGUgZGVzdGluYXRpb24KPiA+ID4gKyAgICAgICAgICAg
ICogaXMgYWxpZ25lZCBvbiBhIDMyLzY0IGJpdCBib3VuZGFyeS4KPiA+ID4gKyAgICAgICAgICAg
ICovCj4gPiA+ICsgICAgICAgICAgIGZvciAoOyBjb3VudCAmJiBkZXN0LnVwdHIgJSBieXRlc19s
b25nOyBjb3VudC0tKQo+ID4KPiA+IFlvdSBjb3VsZCByZXVzZSAmIG1hc2sgaGVyZSBpbnN0ZWFk
IG9mICUgYnl0ZXNfbG9uZy4KPiA+Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgKmRlc3QudTgr
KyA9IGM7Cj4gPiA+ICsjZW5kaWYKPiA+Cj4gPiBJIG5vdGljZWQgeW91IGFsc28gdXNlZCBDT05G
SUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBvbiB5b3VyCj4gPiBtZW1jcHkgcGF0
Y2gsIGlzIGl0IHdvcnRoIGl0IGhlcmUgPyBUbyBiZWdpbiB3aXRoIHJpc2N2IGRvZXNuJ3Qgc2V0
IGl0Cj4gPiBhbmQgZXZlbiBpZiBpdCBkaWQgd2UgYXJlIHRhbGtpbmcgYWJvdXQgYSBsb29wIHRo
YXQgd2lsbCBydW4ganVzdCBhIGZldwo+ID4gdGltZXMgdG8gcmVhY2ggdGhlIGFsaWdubWVudCBi
b3VuZGFyeSAod29yc3QgY2FzZSBzY2VuYXJpbyBpdCdsbCBydW4gNwo+ID4gdGltZXMpLCBJIGRv
bid0IHRoaW5rIHdlIGdhaW4gbXVjaCBoZXJlLCBldmVuIGZvciBhcmNocyB0aGF0IGhhdmUKPiA+
IGVmZmljaWVudCB1bmFsaWduZWQgYWNjZXNzLgo+Cj4gV2l0aCBDT05GSUdfSEFWRV9FRkZJQ0lF
TlRfVU5BTElHTkVEX0FDQ0VTUyBpdCBwcm9iYWJseSBpc24ndCB3b3J0aAo+IGV2ZW4gY2hlY2tp
bmcgdGhlIGFsaWdubWVudC4KPiBXaGlsZSBhbGlnbmluZyB0aGUgY29weSB3aWxsIGJlIHF1aWNr
ZXIgZm9yIGFuIHVuYWxpZ25lZCBidWZmZXIgdGhleQo+IGFsbW9zdCBjZXJ0YWlubHkgZG9uJ3Qg
aGFwcGVuIG9mdGVuIGVub3VnaCB0byB3b3JyeSBhYm91dC4KPiBJbiBhbnkgY2FzZSB5b3UnZCB3
YW50IHRvIGRvIGEgbWlzYWxpZ25lZCB3b3JkIHdyaXRlIHRvIHRoZSBzdGFydAo+IG9mIHRoZSBi
dWZmZXIgLSBub3Qgc2VwYXJhdGUgYnl0ZSB3cml0ZXMuCj4gUHJvdmlkZWQgdGhlIGJ1ZmZlciBp
cyBsb25nIGVub3VnaCB5b3UgY2FuIGFsc28gZG8gYSBtaXNhbGlnbmVkIHdyaXRlCj4gdG8gdGhl
IGVuZCBvZiB0aGUgYnVmZmVyIGJlZm9yZSBmaWxsaW5nIGZyb20gdGhlIHN0YXJ0Lgo+CgpJIGRv
bid0IHVuZGVyc3RhbmQgdGhpcyBvbmUsIGEgbWlzYWxpZ25lZCB3cml0ZSBoZXJlIGlzIH4zMHgg
c2xvd2VyCnRoYW4gYW4gYWxpZ25lZCBvbmUgYmVjYXVzZSBpdCBnZXRzIHRyYXBwZWQgYW5kIGVt
dWxhdGVkIGluIFNCSS4KSG93IGNhbiB0aGlzIGJlIGNvbnZlbmllbnQ/Cgo+IEkgc3VzcGVjdCB5
b3UgbWF5IG5lZWQgZWl0aGVyIGJhcnJpZXIoKSBvciB1c2UgYSBwdHIgdG8gcGFja2VkCj4gdG8g
YXZvaWQgdGhlIHBlcnZlcnRlZCAndW5kZWZpbmVkIGJlaGF2aW91cicgZnViYXIuJwo+CgpXaGlj
aCBVQiBhcmUgeW91IHJlZmVycmluZyB0bz8KClJlZ2FyZHMsCi0tCnBlciBhc3BlcmEgYWQgdXBz
dHJlYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
