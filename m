Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1F6E668A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 02:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/lBc8oKeT2/weyU/ucN7kDMEwQiG2i5QviWp3v4IW8=; b=SGVxSb6HbRlio3
	mDSw6aBPPSbYnB8QTnUFCxL1rZvDelvnTndv6Zz8hxvBF4uv2jXMHKaWKl7pX7qNdWVlROnz5gMJ8
	6DabcKRPY82EkQh6CG+QyCbo6QUJpa4o3tH5d8CBztHDe3bXgTclBR6jyYnNwncowW5ZPcxvqcMQJ
	LveX7cUHDY6TNmip00Ml1olS+t7ftFN+W9gUHg8eFHNpCUq29TjaCzIqxkRHJ78riKrx0fAeNYhAW
	92YTWwg0SYbJ4PCMiq3xBGwdMrOtBqIRRqlWKdLBJJ/t/t2XQAOuNZaN2TO2Jd+F6zB3i+BFRy5C6
	T3/HAlQJUFuxOIql+5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWn1d-0000000BDj1-0QuW;
	Sat, 20 Dec 2025 02:48:57 +0000
Received: from mail87.out.titan.email ([209.209.25.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWn1a-0000000BDie-1tiT
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 02:48:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dY8440vgrz2xCv;
	Sat, 20 Dec 2025 02:48:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=9hs/mZnXRigs3cVOr+/B8POWZbewDtqV2rmBsfTbDWM=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=cc:subject:date:from:references:in-reply-to:to:message-id:mime-version:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766198932; v=1;
	b=M/f85/qfW08nQRYIBpNbEjp184VrhycoRo3YXYO38q7f3n7nA//0VcqX6P/J9dnUzGg7tnxO
	OZbcKlq9JtraIdn5MVcsNpMbYnukrAmaF2FSHLFM3s3csWhorlZTS34g0fHsaT+aHTFFEeQlJ+3
	Z+epGopsLFMpYwU6lW0HACvA=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dY83v45t9z2xB2;
	Sat, 20 Dec 2025 02:48:43 +0000 (UTC)
Date: Sat, 20 Dec 2025 02:48:34 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
Message-ID: <aUYOgl8ffcJ0Xfwg@pie>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
 <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766198931978633735.27573.7898649982977667917@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=69460e93
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=VwQbUJbxAAAA:8
	a=jDTaAnbEAQuvd0Yd3F0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_184854_560947_A656987F 
X-CRM114-Status: GOOD (  22.66  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTA6MDM6MjRBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBIaSwgQ29ub3IgYW5kIEhlaW5yaWNoCj4gCj4gT24gVGh1LCBEZWMgMTgsIDIwMjUgYXQg
ODo1NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gV2VkLCBEZWMgMTcsIDIwMjUgYXQgMDk6MDc6MTRBTSArMDEwMCwgSGVpbnJpY2ggU2NodWNo
YXJkdCB3cm90ZToKPiA+ID4gT24gMTIvMTcvMjUgMDg6MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4g
Pgo+ID4gPiA+IFNwZWNpZmljYWxseSwgSSBtdXN0IGFkaGVyZSB0bwo+ID4gPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgKGFuZCBjcHVz
LnlhbWwgZm9yCj4gPiA+ID4gcHJvcGVydGllcyBsaWtlICdyaXNjdixzdjM5JyB3aGljaCBzdGFu
ZHMgZm9yIHRoZSBleHRlbnNpb24gU3YzOSkuIElmIEkKPiA+ID4gPiBhZGQgZXh0ZW5zaW9uIHN0
cmluZ3MgdGhhdCBhcmUgbm90IHlldCBkZWZpbmVkIGluIHRoZXNlIHNjaGVtYXMsIHN1Y2ggYXMK
PiA+ID4gPiBzdXBtLCBydW5uaW5nICdtYWtlIGR0YnNfY2hlY2sgVz0zJyBmYWlscyB3aXRoOiAn
c3VwbScgaXMgbm90IG9uZSBvZgo+ID4gPiA+IFsnaScsICdtJywgJ2EnLCAuLi5dLCBmb2xsb3dl
ZCBieSAiVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQuIgo+ID4gPgo+ID4g
PiBJZiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIGlzIGluY29tcGxldGUKPiA+ID4gd2l0aCByZXNwZWN0IHRvIHJhdGlmaWVkIGV4dGVuc2lv
bnMsIEkgZ3Vlc3MgdGhlIHJpZ2h0IGFwcHJvYWNoIGlzIHRvIGFtZW5kCj4gPiA+IGl0IGFuZCBu
b3QgdG8gY3VydGFpbCB0aGUgQ1BVIGRlc2NyaXB0aW9uLgo+ID4KPiA+IEFic29sdXRlbHkuIElm
IHRoZSBjcHUgc3VwcG9ydHMgc29tZXRoaW5nIHRoYXQgaXMgbm90IGRvY3VtZW50ZWQsIHRoZW4K
PiA+IHBsZWFzZSBkb2N1bWVudCBpdCByYXRoZXIgdGhhbiBvbWl0IGZyb20gdGhlIGRldmljZXRy
ZWUuCj4gCgouLi4KCj4gU3RyaWN0bHkgZGVzY3JpYmluZyB0aGUgU3BhY2VtaVQgWDEwMC9LMyAo
b3IgYW55IGNvcmUpIGFzIFJWQTIzLWNvbXBsaWFudAo+IHJlcXVpcmVzIGFkZGluZyB0aGVzZSBl
eHRlbnNpb25zIHRoYXQgYXJlIGN1cnJlbnRseSBtaXNzaW5nIGZyb20KPiB0aGUga2VybmVsIGJp
bmRpbmdzOgo+IFJWQTIzVTY0OiBaaWNjaWYsIFppY2NhbW9hLCBaaWNjbHNtLCBaYTY0cnMKPiBS
VkEyM1M2NDogU3MxcDEzLCBTc2NjcHRyLCBTc3R2ZWNkLCBTc3R2YWxhLCBTc2NvdW50ZXJlbncs
IFNzdTY0eGwsCj4gICAgICAgICAgIFNoYSwgU2hjb3VudGVyZW53LCBTaHZzdHZhbGEsIFNodHZh
bGEsIFNodnN0dmVjZCwgU2h2c2F0cGEsIFNoZ2F0cGEKPiBQbHVzICdTdXBtJywgJ1ppYzY0Yics
ICdTc3N0YXRlZW4nLCAnQicgd2hlcmUgdGhlIGtlcm5lbCBzdXBwb3J0cyB0aGVtIGJ1dAoKUGxl
YXNlIG5vdGUgQiBpcyBqdXN0IHRoZSBhYmJyZXZpYXRpb24gb2YgInpiYSIsICJ6YmIiLCBhbmQg
InpicyIsIGFsbApvZiB0aGVtIGhhdmUgYmVlbiBkb2N1bWVudGVkIGluIGV4dGVuc2lvbnMueWFt
bC4KCj4gdGhleSBhcmUgbm90IGxpdGVyYWxseSBkb2N1bWVudGVkIGluIHlhbWwuCj4gCj4gSXMg
dGhpcyBhcHByb2FjaCBhY2NlcHRhYmxlIHRvIHlvdT8gSWYgc28sIEkgd2lsbCBwcm9jZWVkIHdp
dGggc3VibWl0dGluZyB0aGVtLgo+IAo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2guCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEd1b2RvbmcgWHUKPiAKClJlZ2FyZHMsCllhbyBaaQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
