Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383FEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 16:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E063E60E73
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 16:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E063E60E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bluespec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6YWzxqb/q0zBtLfh+UDVettPgfUySrHPxD+J/rbFus=; b=N+LQyUxmrE+eWg
	IiXfXLHu5fysfFrh/RwW2VCsPQ/pRbPIX0a8+ESap1F9qTZOQocPH3Hf3lZhCVDmUR3nufwJSuh7n
	sMphe1afIaAOXopE4uDCQjmxFvVsyOrZh+72+L6DcTKOUQ0oU+a6fx/rXDWaTPKr4FKN9ERpPibCA
	rtSXlhypBkqvfqVHAmbEgScQBpc3yP2USdDt6E3T7T8Yn6xQOfQz1SGeqZFz7CGCVqHSgBMW+P2v7
	Pqac/Xd4UQTN3vbrZ8yQaAZfHTh81NjmDdtz34jlIgF782OLA6KJvFBbKsrvrJuPbElwP03rDhOA+
	kXE3xuyp/B1VOOr3zWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2jt-00H2Jt-8u; Mon, 25 Oct 2021 16:22:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2jq-00H2I3-Md
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 16:22:20 +0000
Received: by mail-qt1-x836.google.com with SMTP id y11so10754282qtn.13
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bluespec-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=hbJWWf4FCxKEG3z41+frjJKy4edqc7oi98ehb9FU6VM=;
 b=14ajX+lPb/EyUHnYs+euJOYIuL1yzSWFOEs8XuhcgDJn/G/c2FX+++CMUfe0rkIvHA
 HY9WNQcuStXcXD3ZuVUQdcQ330HlsUya/pCxxo+v5SacMSj0ZzU8ci+5tsEaQh7Js5xi
 HRd1fkD+S88jGDuzGJQcolQC+CtqCQpubMXj7oSU26cn+Xii/vjeg8Ye9XRh19QaBycC
 Xi8IG1Q9ymNbffP8gjnjoU4p7Z8cedmtA33KexFZnDf3M+V8QoASpzKJ1cLo1kFUn1s4
 44vUGYjNLYvni2HoCTIi7yD1Oxz6/nM102dnebit3f3eJIaspQIEWT0Vf3nP/cSeXUAq
 yv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=hbJWWf4FCxKEG3z41+frjJKy4edqc7oi98ehb9FU6VM=;
 b=04h1HT07tOqTTA58hM726P1GJwU5MBsWNlMPxzaFwCH2lL8zAONcHk580XF0lZ/0NE
 9fwuT4PgcQJqdI34fNkQmAsGQkObZYZ993ARoV+H9ff5Gzq50NWPi8Su5O6MJCeiAwsu
 zHaq845FBd+/uwgpidhMV1mZBy4dLOnE3wl6rTn4mJafTLeV0r4n+ZF2xcW0+GnYI9Jd
 zwUQlymp+6pO28hNBsPnT1oSqa6yweRU9moH5hJWKQvPK3r3WFJB24TnF525I8al06Pk
 HX76qU/k2ByGamcJNOJ8qZHl7WEDGW1U7Y7auSDcqv1xh/QwvJofZ+2kcFqce7CeX2+5
 YJ3g==
X-Gm-Message-State: AOAM530zsembTC/uVq3OakDlE5ahXXO5C6BgHYsI38uo/yki5oyzhC4h
 VcjxTIi/vzEd1Vn+SwhXTvka
X-Google-Smtp-Source: ABdhPJwu15xthVtruzXXDMRYWpUrz9Wa7XN1mAS+iMbgn8Qsj1+8cRAXRNCP3GFctpvfgTvPPFnWww==
X-Received: by 2002:a05:622a:1992:: with SMTP id
 u18mr19053107qtc.111.1635178936572; 
 Mon, 25 Oct 2021 09:22:16 -0700 (PDT)
Received: from bruce.bluespec.com ([154.3.44.94])
 by smtp.gmail.com with ESMTPSA id t19sm8639143qtn.26.2021.10.25.09.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 09:22:15 -0700 (PDT)
Date: Mon, 25 Oct 2021 12:22:13 -0400
From: Darius Rad <darius@bluespec.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
Message-ID: <YXbZtTR7TBHvdqck@bruce.bluespec.com>
Mail-Followup-To: Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
 <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
 <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
 <CABvJ_xjMyZ3HDLinMvY88HtKywb=cwhQNOOCZYTEeL407Gyz2A@mail.gmail.com>
 <YXKVLtT2U2g3JDrm@bruce.bluespec.com>
 <CAHCEehKpA=d1phuAM1tdeyrp-CYQRmFxGTpvuJqWNMjRCMpWfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCEehKpA=d1phuAM1tdeyrp-CYQRmFxGTpvuJqWNMjRCMpWfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_092218_817462_0BECD70E 
X-CRM114-Status: GOOD (  53.05  )
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

T24gTW9uLCBPY3QgMjUsIDIwMjEgYXQgMTI6NDc6NDlQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdy
b3RlOgo+IERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5jb20+IOaWvCAyMDIx5bm0MTDmnIgy
MuaXpSDpgLHkupQg5LiL5Y2INjo0MOWvq+mBk++8mgo+ID4KPiA+IE9uIEZyaSwgT2N0IDIyLCAy
MDIxIGF0IDExOjUyOjAxQU0gKzA4MDAsIFZpbmNlbnQgQ2hlbiB3cm90ZToKPiA+ID4gT24gVGh1
LCBPY3QgMjEsIDIwMjEgYXQgNjo1MCBQTSBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29t
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgT2N0IDIwLCAyMDIxIGF0IDA2OjAxOjMx
UE0gLTA3MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gPiA+ID4gPiBIZWxsbyBEYXJpdXMsCj4g
PiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCA1IE9jdCAyMDIxLCBEYXJpdXMgUmFkIHdyb3RlOgo+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gTW9uLCBPY3QgMDQsIDIwMjEgYXQgMDg6MzY6MzBQTSAr
MDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gPiA+ID4gPiA+IERhcml1cyBSYWQgPGRhcml1
c0BibHVlc3BlYy5jb20+IOaWvCAyMDIx5bm0OeaciDI55pelIOmAseS4iSDkuIvljYg5OjI45a+r
6YGT77yaCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gT24gVHVlLCBTZXAgMjgsIDIw
MjEgYXQgMTA6NTY6NTJQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gPiA+ID4gPiA+
ID4gPiBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29tPiDmlrwgMjAyMeW5tDnmnIgxM+aX
pSDpgLHkuIAg5LiL5Y2IODoyMeWvq+mBk++8mgo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gT24gOS84LzIxIDE6NDUgUE0sIEdyZWVudGltZSBIdSB3cm90ZToKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyB0YXNrIHN3aXRjaCBzdXBwb3J0IGZvciB2
ZWN0b3IuIEl0IHN1cHBvcnRzIHBhcnRpYWwgbGF6eQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gc2F2
ZSBhbmQgcmVzdG9yZSBtZWNoYW5pc20uIEl0IGFsc28gc3VwcG9ydHMgYWxsIGxlbmd0aHMgb2Yg
dmxlbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBbIC4uLiBdCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiA+IFNvIHRoaXMgd2lsbCB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlIHZlY3RvciBpbnN0cnVj
dGlvbnMsIGFuZCBhbGxvY2F0ZQo+ID4gPiA+ID4gPiA+ID4gPiA+IG1lbW9yeSBmb3IgdmVjdG9y
IHN0YXRlLCBmb3IgYWxsIHByb2Nlc3NlcywgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHZlY3Rvcgo+
ID4gPiA+ID4gPiA+ID4gPiA+IGluc3RydWN0aW9ucyBhcmUgdXNlZD8KPiA+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ID4gWWVzLCBpdCB3aWxsIGVuYWJsZSB2ZWN0b3IgaWYgaGFzX3Zl
Y3RvcigpIGlzIHRydWUuIFRoZSByZWFzb24gdGhhdCB3ZQo+ID4gPiA+ID4gPiA+ID4gPiBjaG9v
c2UgdG8gZW5hYmxlIGFuZCBhbGxvY2F0ZSBtZW1vcnkgZm9yIHVzZXIgc3BhY2UgcHJvZ3JhbSBp
cyBiZWNhdXNlCj4gPiA+ID4gPiA+ID4gPiA+IHdlIGFsc28gaW1wbGVtZW50IHNvbWUgY29tbW9u
IGZ1bmN0aW9ucyBpbiB0aGUgZ2xpYmMgc3VjaCBhcyBtZW1jcHkKPiA+ID4gPiA+ID4gPiA+ID4g
dmVjdG9yIHZlcnNpb24gYW5kIGl0IGlzIGNhbGxlZCB2ZXJ5IG9mdGVuIGJ5IGV2ZXJ5IHByb2Nl
c3MuIFNvIHRoYXQKPiA+ID4gPiA+ID4gPiA+ID4gd2UgYXNzdW1lIGlmIHRoZSB1c2VyIHByb2dy
YW0gaXMgcnVubmluZyBpbiBhIENQVSB3aXRoIHZlY3RvciBJU0EKPiA+ID4gPiA+ID4gPiA+ID4g
d291bGQgbGlrZSB0byB1c2UgdmVjdG9yIGJ5IGRlZmF1bHQuIElmIHdlIGRpc2FibGUgaXQgYnkg
ZGVmYXVsdCBhbmQKPiA+ID4gPiA+ID4gPiA+ID4gbWFrZSBpdCB0cmlnZ2VyIHRoZSBpbGxlZ2Fs
IGluc3RydWN0aW9uLCB0aGF0IG1pZ2h0IGJlIGEgYnVyZGVuIHNpbmNlCj4gPiA+ID4gPiA+ID4g
PiA+IGFsbW9zdCBldmVyeSBwcm9jZXNzIHdpbGwgdXNlIHZlY3RvciBnbGliYyBtZW1jcHkgb3Ig
c29tZXRoaW5nIGxpa2UKPiA+ID4gPiA+ID4gPiA+ID4gdGhhdC4KPiA+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gPiBEbyB5b3UgaGF2ZSBhbnkgZXZpZGVuY2UgdG8gc3VwcG9ydCB0aGUgYXNz
ZXJ0aW9uIHRoYXQgYWxtb3N0IGV2ZXJ5IHByb2Nlc3MKPiA+ID4gPiA+ID4gPiA+IHdvdWxkIHVz
ZSB2ZWN0b3Igb3BlcmF0aW9ucz8gIE9uZSBjb3VsZCBlYXNpbHkgYXJndWUgdGhhdCB0aGUgY29u
dmVyc2UgaXMKPiA+ID4gPiA+ID4gPiA+IHRydWU6IG5vIGV4aXN0aW5nIHNvZnR3YXJlIHVzZXMg
dGhlIHZlY3RvciBleHRlbnNpb24gbm93LCBzbyBtb3N0IGxpa2VseSBhCj4gPiA+ID4gPiA+ID4g
PiBwcm9jZXNzIHdpbGwgbm90IGJlIHVzaW5nIGl0Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gR2xpYmMgdXN0cmVhbWluZyBpcyBqdXN0IHN0YXJ0aW5nIHNvIHlvdSBkaWRuJ3Qgc2VlIHNv
ZnR3YXJlIHVzaW5nIHRoZQo+ID4gPiA+ID4gPiA+IHZlY3RvciBleHRlbnNpb24gbm93IGFuZCB0
aGlzIHBhdGNoc2V0IGlzIHRlc3RpbmcgYmFzZWQgb24gdGhvc2UKPiA+ID4gPiA+ID4gPiBvcHRp
bWl6ZWQgZ2xpYmMgdG9vLiBWaW5jZW50IENoZW4gaXMgd29ya2luZyBvbiB0aGUgZ2xpYmMgdmVj
dG9yCj4gPiA+ID4gPiA+ID4gc3VwcG9ydCB1cHN0cmVhbWluZyBhbmQgd2Ugd2lsbCBhbHNvIHVw
c3RyZWFtIHRoZSB2ZWN0b3IgdmVyc2lvbiBnbGliYwo+ID4gPiA+ID4gPiA+IG1lbWNweSwgbWVt
Y21wLCBtZW1jaHIsIG1lbW1vdmUsIG1lbXNldCwgc3RyY21wLCBzdHJsZW4uIFRoZW4gd2Ugd2ls
bAo+ID4gPiA+ID4gPiA+IHNlZSBwbGF0Zm9ybSB3aXRoIHZlY3RvciBzdXBwb3J0IGNhbiB1c2Ug
dmVjdG9yIHZlcnNpb24gbWVtKiBhbmQgc3RyKgo+ID4gPiA+ID4gPiA+IGZ1bmN0aW9ucyBhdXRv
bWF0aWNhbGx5IGJhc2VkIG9uIGlmdW5jIGFuZCBwbGF0Zm9ybSB3aXRob3V0IHZlY3Rvcgo+ID4g
PiA+ID4gPiA+IHdpbGwgdXNlIHRoZSBvcmlnaW5hbCBvbmUgYXV0b21hdGljYWxseS4gVGhlc2Ug
Y291bGQgYmUgZG9uZSB0byBzZWxlY3QKPiA+ID4gPiA+ID4gPiB0aGUgY29ycmVjdCBvcHRpbWl6
ZWQgZ2xpYmMgZnVuY3Rpb25zIGJ5IGlmdW5jIG1lY2hhbmlzbS4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBJbiB5b3VyIHJlcGx5LCBJIG5vdGljZWQgdGhhdCB5b3UgZGlkbid0IGFkZHJlc3MgR3JlZW50
aW1lJ3MgcmVzcG9uc2UKPiA+ID4gPiA+IGhlcmUuICBCdXQgdGhpcyBsb29rcyBsaWtlIHRoZSBr
ZXkgaXNzdWUuICBJZiBjb21tb24gbGlicmFyeSBmdW5jdGlvbnMgYXJlCj4gPiA+ID4gPiB2ZWN0
b3ItYWNjZWxlcmF0ZWQsIHdvdWxkbid0IGl0IG1ha2Ugc2Vuc2UgdGhhdCBhbG1vc3QgZXZlcnkg
cHJvY2VzcyB3b3VsZAo+ID4gPiA+ID4gd2luZCB1cCB1c2luZyB2ZWN0b3IgaW5zdHJ1Y3Rpb25z
PyAgQW5kIHRodXMgdGhlcmUgd291bGRuJ3QgYmUgbXVjaCBwb2ludAo+ID4gPiA+ID4gdG8gc2tp
cHBpbmcgdGhlIHZlY3RvciBjb250ZXh0IG1lbW9yeSBhbGxvY2F0aW9uPwo+ID4gPiA+ID4KPiA+
ID4gPgo+ID4gPiA+IFRoaXMgaXNzdWUgd2FzIGFkZHJlc3NlZCBpbiB0aGUgdGhyZWFkIHJlZ2Fy
ZGluZyBJbnRlbCBBTVggSSBsaW5rZWQgdG8gaW4gYQo+ID4gPiA+IHByZXZpb3VzIG1lc3NhZ2Uu
ICBJIGRvbid0IGFncmVlIHRoYXQgdGhpcyBpcyB0aGUga2V5IGlzc3VlOyBpdCBpcyBvbmUgb2Yg
YQo+ID4gPiA+IG51bWJlciBvZiBpc3N1ZXMuICBXaGF0IGlmIEkgZG9uJ3Qgd2FudCB0byB0YWtl
IHRoZSBwb3RlbnRpYWwKPiA+ID4gPiBwb3dlci9mcmVxdWVuY3kgaGl0IGZvciB0aGUgdmVjdG9y
IHVuaXQgZm9yIGEgd29ya2xvYWQgdGhhdCwgYXQgYmVzdCwgdXNlcwo+ID4gPiA+IGl0IGZvciB0
aGUgb2NjYXNpb25hbCBtZW1jcHk/ICBXaGF0IGlmIHRoZSBhbGxvY2F0aW9uIGZhaWxzLCBob3cg
d2lsbCB0aGF0Cj4gPiA+Cj4gPiA+IEhpIERhcml1cywKPiA+ID4gVGhlIG1lbWNweSBmdW5jdGlv
biBzZWVtcyBub3QgdG8gYmUgb2NjYXNpb25hbGx5IHVzZWQgaW4gdGhlIHByb2dyYW1zCj4gPiA+
IGJlY2F1c2UgbWFueSBmdW5jdGlvbnMgaW4gR2xpYmMgdXNlIG1lbWNweSgpIHRvIGNvbXBsZXRl
IHRoZSBtZW1vcnkKPiA+ID4gY29weS4gSSB1c2UgdGhlIGZvbGxvd2luZyBzaW1wbGUgY2FzZSBh
cyBhbiBleGFtcGxlLgo+ID4gPiB0ZXN0LmMKPiA+ID4gdm9pZCBtYWluKHZvaWQpIHsKPiA+ID4g
ICAgIHJldHVybjsKPiA+ID4gfQo+ID4gPiBUaGVuLCB3ZSBjb21waWxlIGl0IGJ5ICJnY2MgdGVz
dC5jIC1vIGEub3V0IiBhbmQgZXhlY3V0ZSBpdC4gSW4gdGhlCj4gPiA+IGV4ZWN1dGlvbiwgdGhl
IG1lbWNweSgpIGhhcyBiZWVuIGNhbGxlZCB1bmV4cGVjdGVkbHkuIEl0IGlzIGJlY2F1c2UKPiA+
ID4gbWFueSBsaWJjIGluaXRpYWxpemVkIGZ1bmN0aW9ucyB3aWxsIGJlIGV4ZWN1dGVkIGJlZm9y
ZSBlbnRlcmluZyB0aGUKPiA+ID4gdXNlci1kZWZpbmVkIG1haW4gZnVuY3Rpb24uIE9uZSBvZiB0
aGUgZXhhbXBsZSBpcyBfX2xpYmNfc2V0dXBfdGxzKCksCj4gPiA+IHdoaWNoIGlzIGNhbGxlZCBi
eSBfX2xpYmNfc3RhcnRfbWFpbigpLiBUaGUgX19saWJjX3NldHVwX3RscygpIHdpbGwKPiA+ID4g
dXNlIG1lbWNweSgpIGR1cmluZyB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyB0aGUgRHluYW1pYyBU
aHJlYWQgVmVjdG9yCj4gPiA+IChEVFYpLgo+ID4gPgo+ID4gPiBUaGVyZWZvcmUsIEkgdGhpbmsg
dGhlIG1lbWNweSgpIGlzIHdpZGVseSB1c2VkIGluIG1vc3QgcHJvZ3JhbXMuCj4gPiA+Cj4gPgo+
ID4gWW91J3JlIG1pc3NpbmcgbXkgcG9pbnQuICBOb3QgZXZlcnkgKGFueT8pIHByb2dyYW0gc3Bl
bmRzIGEgbWFqb3JpdHkgb2YgdGhlCj4gPiB0aW1lIGRvaW5nIG1lbWNweSgpLCBhbmQgZXZlbiBp
ZiBhIHByb2dyYW0gZGlkLCBhbGwgb2YgbXkgcG9pbnRzIGFyZSBzdGlsbAo+ID4gdmFsaWQuCj4g
Pgo+ID4gUGxlYXNlIHJlYWQgdGhlIGRpc2N1c3Npb24gaW4gdGhlIHRocmVhZCBJIHJlZmVyZW5j
ZWQgYW5kIHRoZSBxdWVzdGlvbnMgaW4KPiA+IG15IHByaW9yIG1lc3NhZ2UuCj4gPgo+IAo+IEhp
IERhcml1cywKPiAKPiBBcyBJIG1lbnRpb25lZCBiZWZvcmUsIHdlIHdhbnQgdG8gdHJlYXQgdmVj
dG9yIElTQSBsaWtlIGEgZ2VuZXJhbCBJU0EKPiBpbnN0ZWFkIG9mIGEgc3BlY2lmaWMgSVAuIFVz
ZXIgcHJvZ3JhbSBzaG91bGQgYmUgYWJsZSB0byB1c2UgaXQKPiB0cmFuc3BhcmVudGx5IGp1c3Qg
bGlrZSBGUFUuCj4gSXQgc2VlbXMgdGhhdCB0aGUgdXNlIGNhc2UgeW91IHdhbnQgaXMgYXNraW5n
IHVzZXIgdG8gdXNlIHZlY3RvciBsaWtlCj4gYSBzcGVjaWZpYyBJUCwgdXNlciBwcm9ncmFtIHNo
b3VsZCBhc2sga2VybmVsIGJlZm9yZSB0aGV5IHVzZSBpdCBhbmQKPiB0aGF0IGlzIG5vdCB3aGF0
IHdlIHdhbnQgdG8gZG8gaW4gdGhpcyBwYXRjaHNldC4KPiAKCkhpIEdyZWVudGltZSwKClJpZ2h0
LgoKQnV0IGJleW9uZCB3aGF0IEkgd2FudCB0byBkbyBvciB3aGF0IHlvdSB3YW50IHRvIGRvLCBp
cyB3aGF0ICpzaG91bGQqIExpbnV4CmRvPyAgSSBoYXZlIGF0dGVtcHRlZCB0byBwcm92aWRlIGV2
aWRlbmNlIHRvIHN1cHBvcnQgbXkgcG9zaXRpb24uICBZb3UgaGF2ZQpub3QgcmVzcG9uZGVkIHRv
IG9yIGFkZHJlc3NlZCB0aGUgbWFqb3JpdHkgb2YgbXkgcXVlc3Rpb25zLCB3aGljaCBpcwpjb25j
ZXJuaW5nIHRvIG1lLgoKLy8gZGFyaXVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
