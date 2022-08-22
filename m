Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2514CC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 11:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YahSnykIAomw0kg2saIuy8g92tCJTl07fM/KQfEJPCs=; b=ESSv7GvZAno2a3
	zhJJdr6+jKTx1NocS6p2byO0tmMUWJdTl28nDoGx9T9MYSukgp3m4IdZwiKDYHIh2Xwj4Jrff+p0H
	RgfEP/fqe2RHhizrLzJuydv9g5t0K2XVPBxFYRsTFjsit1RizDwsnmXI6WjGvv1zfqTGrBGdVlYEZ
	JKF6kd3btovyN5OUx89Mc/iacYtnt5OcM2XIhZXfSKT1kMrQCV4h3ItQ7oV60oMts5yNlj1qNJnxk
	9B6w/qjZAzrlJZbAtNA/sQD2CQPOwGVgyG4TCJk4bUMEtVzrJ1ffJ1tVY2MYRoPkEqA2WikO/YOeF
	opn0FQbCc/7SEN0jSLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5tk-008Tka-AN; Mon, 22 Aug 2022 11:47:16 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5tY-008Te0-B4
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 11:47:13 +0000
Received: by mail-qt1-f173.google.com with SMTP id h21so7620004qta.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=2XJZ/Imo2dVNd0H4SfuBgLAT9QYlxOPB6r7l1kGv5p8=;
        b=13i/yNgDrU2YpiqIfpzgnQwQSsUQ5/X40rEMfni6npBVvMfG0+j9gUSStBe2iU9o5j
         h7KdPUcY0AChwPMvVEFGmPmph7xvkU+A/waWKOZiKI/VU82//6X8kI3gcUnfoqEtKDEj
         WymNlWgzhByGvqZHo7pZFwO8OlGzuuvmoVcZn+xO7e4i/2rVLXIM8sXZT0e2I82hma5u
         3GID29NxvmZidQoW3ybkQYeJvc9Rel50xm9+oj6YogQFQ/DXOprJixTAH3v7wLS9HNVn
         /iYobBJPd2ONKvr8XiDphy9HDduQThWyAHMFg+pL0IYdTrDlDAaezer417RShfE7qOTR
         Jj7A==
X-Gm-Message-State: ACgBeo1deOg2tpciyidzGQApQ8cOpHBHNXNEHciRb1vxXPTjTWZlgCFt
	HmW0fChD2mFBE48D2OfOSRyiHmt9RFge4w==
X-Google-Smtp-Source: AA6agR6xQ5xSGHfuzfwYoS0an8J1yat3BCF9sYJOid2REPj5HY7t2oQ2W9fGPgLinMAnVkzbHOEihQ==
X-Received: by 2002:a05:622a:2d1:b0:343:6193:3348 with SMTP id a17-20020a05622a02d100b0034361933348mr14856630qtx.633.1661168820390;
        Mon, 22 Aug 2022 04:47:00 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id do15-20020a05620a2b0f00b006af3f3b385csm10903719qkb.98.2022.08.22.04.46.59
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 04:46:59 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-33365a01f29so285271687b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 04:46:59 -0700 (PDT)
X-Received: by 2002:a25:1f02:0:b0:695:92f8:5a58 with SMTP id
 f2-20020a251f02000000b0069592f85a58mr6143444ybf.604.1661168819290; Mon, 22
 Aug 2022 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com> <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org> <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me> <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
In-Reply-To: <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 13:46:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
Message-ID: <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: Conor Dooley <Conor.Dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_044710_745800_E13548C6 
X-CRM114-Status: GOOD (  36.52  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsIEFuZHJlLAoKT24gU3VuLCBBdWcgMjEsIDIwMjIgYXQgMTI6MDcgUE0gPENvbm9y
LkRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiBPbiAyMS8wOC8yMDIyIDA3OjQ1LCBJY2Vu
b3d5IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjItMDgtMjDmmJ/mnJ/lha3nmoQgMTc6MjkgKzAw
MDDvvIxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbeWGmemBk++8mgo+ID4+IE9uIDIwLzA4LzIw
MjIgMTg6MjQsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4+PiBPbiA4LzE1LzIyIDEyOjAxIFBN
LCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPiA+Pj4+IE9uIDE1LzA4LzIwMjIg
MTQ6MTEsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+ID4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MKPiA+Pj4+PiB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlCj4gPj4+Pj4KPiA+Pj4+PiBPbiBNb24sIDE1IEF1ZyAyMDIy
IDAwOjA4OjA5IC0wNTAwCj4gPj4+Pj4gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5v
cmc+IHdyb3RlOgo+ID4+Pj4+Cj4gPj4+Pj4gSGksCj4gPj4+Pj4KPiA+Pj4+PiB0aGFua3MgZm9y
IGFsbCB0aGUgZWZmb3J0cyBpbiBnZXR0aW5nIHRob3NlIFNvQyBwZXJpcGhlcmFscwo+ID4+Pj4+
IHN1cHBvcnRlZCEKPiA+Pj4+Pgo+ID4+Pj4+PiBEMSBpcyBhIFNvQyBjb250YWluaW5nIGEgc2lu
Z2xlLWNvcmUgVC1IRUFEIFh1YW50aWUgQzkwNiBDUFUsCj4gPj4+Pj4+IGFzIHdlbGwgYXMKPiA+
Pj4+Pj4gb25lIEhpRmkgNCBEU1AuIFRoZSBTb0MgaXMgYmFzZWQgb24gYSBkZXNpZ24gdGhhdAo+
ID4+Pj4+PiBhZGRpdGlvbmFsbHkgY29udGFpbmVkCj4gPj4+Pj4+IGEgcGFpciBvZiBDb3J0ZXgg
QTcncy4gRm9yIHRoYXQgcmVhc29uLCBzb21lIHBlcmlwaGVyYWxzIGFyZQo+ID4+Pj4+PiBkdXBs
aWNhdGVkLgo+ID4+Pj4+Cj4gPj4+Pj4gU28gYmVjYXVzZSBvZiB0aGlzLCB0aGUgQWxsd2lubmVy
IFI1MjggYW5kIFQxMTMgU29DcyB3b3VsZAo+ID4+Pj4+IHNoYXJlIGFsbW9zdAo+ID4+Pj4+IGV2
ZXJ5dGhpbmcgaW4gdGhpcyBmaWxlLiBXb3VsZCBpdCBiZSB1c2VmdWwgdG8gYWxyZWFkeSBzcGxp
dAo+ID4+Pj4+IHRoaXMgRFQgdXA/Cj4gPj4+Pj4gVG8gaGF2ZSBhIGJhc2UgLmR0c2ksIGJhc2lj
YWxseSB0aGlzIGZpbGUgd2l0aG91dCAvY3B1cyBhbmQKPiA+Pj4+PiAvc29jL3BsaWMsCj4gPj4+
Pj4gdGhlbiBoYXZlIGEgUklTQy1WIHNwZWNpZmljIGZpbGUgd2l0aCBqdXN0IHRob3NlLCBpbmNs
dWRpbmcgdGhlCj4gPj4+Pj4gYmFzZT8KPiA+Pj4+PiBUaGVyZSBpcyBwcmVjZWRlbmNlIGZvciB0
aGlzIGFjcm9zcy1hcmNoKC1kaXJlY3Rvcmllcykgc2hhcmluZwo+ID4+Pj4+IHdpdGggdGhlCj4g
Pj4+Pj4gUmFzcGJlcnJ5IFBpIGFuZCBBbGx3aW5uZXIgSDMvSDUgU29Dcy4KPiA+Pj4+Cj4gPj4+
PiBGb3IgdGhvc2UgcGxheWluZyBhbG9uZyBhdCBob21lLCBvbmUgZXhhbXBsZSBpcyB0aGUgYXJt
NjQKPiA+Pj4+IGJhbmFuYXBpIG0yCj4gPj4+PiBkdHMgd2hpY2ggbG9va3MgbGlrZToKPiA+Pj4+
PiAvZHRzLXYxLzsKPiA+Pj4+PiAjaW5jbHVkZSAic3VuNTBpLWg1LmR0c2kiCj4gPj4+Pj4gI2lu
Y2x1ZGUgInN1bjUwaS1oNS1jcHUtb3BwLmR0c2kiCj4gPj4+Pj4gI2luY2x1ZGUgPGFybS9zdW54
aS1iYW5hbmFwaS1tMi1wbHVzLXYxLjIuZHRzaT4KPiA+Pj4+Pgo+ID4+Pj4+IC8gewo+ID4+Pj4+
ICAgICAgICAgbW9kZWwgPSAiQmFuYW5hIFBpIEJQSS1NMi1QbHVzIHYxLjIgSDUiOwo+ID4+Pj4+
ICAgICAgICAgY29tcGF0aWJsZSA9ICJiYW5hbmFwaSxicGktbTItcGx1cy12MS4yIiwKPiA+Pj4+
PiAiYWxsd2lubmVyLHN1bjUwaS1oNSI7Cj4gPj4+Pj4gfTsKPiA+Pj4+Cj4gPj4+PiBJIHRoaW5r
IHRoaXMgaXMgYSBwcmV0dHkgZ29vZCBpZGVhLCBhbmQgcHV0dGluZyBpbiB0aGUgbW9kdWxhcml0
eQo+ID4+Pj4gdXAKPiA+Pj4+IGZyb250IHNlZW1zIGxvZ2ljYWwgdG8gbWUsIHNvIHdoZW4gdGhl
IGFybSBvbmUgZG9lcyBldmVudHVhbGx5Cj4gPj4+PiBnZXQKPiA+Pj4+IGFkZGVkIGl0IGNhbiBi
ZSBkb25lIGJ5IG9ubHkgdG91Y2hpbmcgYSBzaW5nbGUgYXJjaC4KPiA+Pj4KPiA+Pj4gVGhpcyBp
cyBub3QgZmVhc2libGUsIGR1ZSB0byB0aGUgZGlmZmVyZW50ICNpbnRlcnJ1cHQtY2VsbHMuIFNl
ZQo+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQU11SE1kWEhTTWNy
Vk9IK3ZjcmRSUkYraTJUa01jRmlzR3hITUJQVUVhOG5UTUZwendAbWFpbC5nbWFpbC5jb20vCj4g
Pj4+Cj4gPj4+IEV2ZW4gaWYgd2Ugc2hhcmUgc29tZSBmaWxlIGFjcm9zcyBhcmNoaXRlY3R1cmVz
LCB5b3Ugc3RpbGwgaGF2ZSB0bwo+ID4+PiB1cGRhdGUgZmlsZXMKPiA+Pj4gaW4gYm90aCBwbGFj
ZXMgdG8gZ2V0IHRoZSBpbnRlcnJ1cHRzIHByb3BlcnRpZXMgY29ycmVjdC4KPiA+Pj4KPiA+Pj4g
SSBnZXQgdGhlIGRlc2lyZSB0byBkZWR1cGxpY2F0ZSB0aGluZ3MsIGJ1dCB3ZSBhbHJlYWR5IGRl
YWwgd2l0aAo+ID4+PiB1cGRhdGluZyB0aGUKPiA+Pj4gc2FtZS9zaW1pbGFyIG5vZGVzIGFjcm9z
cyBzZXZlcmFsIFNvQ3MsIHNvIHRoYXQgaXMgbm90aGluZyBuZXcuIEkKPiA+Pj4gdGhpbmsgaXQg
d291bGQKPiA+Pj4gYmUgbW9yZSBjb25mdXNpbmcvY29tcGxpY2F0ZWQgdG8gaGF2ZSBhbGwgb2Yg
dGhlIGludGVycnVwdHMKPiA+Pj4gcHJvcGVydGllcwo+ID4+PiBvdmVycmlkZGVuIGluIGEgc2Vw
YXJhdGUgZmlsZS4KPiA+Pgo+ID4+IFllYWgsIHNob3VsZCBtYXliZSBoYXZlIGNpcmNsZWQgYmFj
ayBhZnRlciB0aGF0IGNvbnZlcnNhdGlvbiwgd291bGQKPiA+PiBoYXZlIGJlZW4KPiA+PiBuaWNl
IGJ1dCBpZiB0aGUgRFRDIGNhbid0IGRvIGl0IG5pY2VseSB0aGVuIHcvZS4KPiA+Cj4gPiBXZWxs
LCBtYXliZSB3ZSBjYW4gb3ZlcnVzZSB0aGUgZmFjaWxpdHkgb2YgQyBwcmVwcm9jZXNzb3I/Cj4g
Pgo+ID4gZS5nLgo+ID4KPiA+IGBgYAo+ID4gLy8gRm9yIEFSTQo+ID4gI2RlZmluZSBTT0NfUEVS
SVBIRVJBTF9JUlEobikgR0lDX1NQSSBuCj4gPiAvLyBGb3IgUklTQy1WCj4gPiAjZGVmaW5lIFNP
Q19QRVJJUEhFUkFMX0lSUShuKSBuCj4gPiBgYGAKPiA+Cj4KPiBHZWVydCBwb2ludGVkIG91dCB0
aGF0IHRoaXMgaXMgbm90IHBvc3NpYmxlIChhdCBsZWFzdCBvbiB0aGUgUmVuZXNhcwo+IHN0dWZm
KSBiZWNhdXNlIHRoZSBHSUMgaW50ZXJydXB0IG51bWJlcnMgYXJlIG5vdCB0aGUgc2FtZSBhcyB0
aGUKPiBQTElDJ3MgJiB0aGUgRFRDIGlzIG5vdCBhYmxlIHRvIGhhbmRsZSB0aGUgYWRkaXRpb246
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FNdUhNZFhIU01jclZPSCt2
Y3JkUlJGK2kyVGtNY0Zpc0d4SE1CUFVFYThuVE1GcHp3QG1haWwuZ21haWwuY29tLwoKV2l0aG91
dCB0aGUgYWJpbGl0eSB0byBkbyBhZGRpdGlvbnMgaW4gRFRDLCB3ZSBjb3VsZCBlLmcuIGxpc3Qg
Ym90aAppbnRlcnJ1cHRzIGluIHRoZSBtYWNybywgbGlrZToKCiAgICAvLyBGb3IgQVJNCiAgICAj
ZGVmaW5lIFNPQ19QRVJJUEhFUkFMX0lSUShuYSwgbnIpIEdJQ19TUEkgbmEKICAgIC8vIEZvciBS
SVNDLVYKICAgICNkZWZpbmUgU09DX1BFUklQSEVSQUxfSVJRKG5hLCBucikgbnIKCk9uIE1vbiwg
QXVnIDIyLCAyMDIyIGF0IDEyOjUyIFBNIEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBh
cm0uY29tPiB3cm90ZToKPiBUaGVyZSBhcmUgaW50ZXJydXB0LW1hcHMgZm9yIHRoYXQ6Cj4gc3Vu
OGktcjUyOC5kdHNpOgo+ICAgICAgICAgc29jIHsKPiAgICAgICAgICAgICAgICAgI2ludGVycnVw
dC1jZWxscyA9IDwxPjsKPiAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW1hcCA9IDwwICAxOCAm
Z2ljIEdJQ19TUEkgIDIgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8MCAgMTkgJmdpYyBHSUNfU1BJICAzIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+Cj4gc3VuMjBpLWQxLmR0
c2k6Cj4gICAgICAgICBzb2Mgewo+ICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0g
PDE+Owo+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbWFwID0gPDAgIDE4ICZwbGljICAxOCBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDww
ICAxOSAmcGxpYyAgMTkgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4KPiB0aGVuLCBpbiB0aGUgc2hh
cmVkIC5kdHNpOgo+ICAgICAgICAgICAgICAgICB1YXJ0MDogc2VyaWFsQDI1MDAwMDAgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgLi4uCj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwxOD47CgpOaWNlISBCdXQgaXQncyBnb25uYSBiZSBhIHZlcnkgbGFyZ2UgaW50
ZXJydXB0LW1hcC4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
