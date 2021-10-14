Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B560C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 01:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15AEB60FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 01:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15AEB60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5gBCv3sSmYOIYZj51+ZJNpYhi4d0k/k5LMpmw1mfa4=; b=CKxw7B6BI723/2
	raQMcdwRlXDFahC2YComNJfSmvvlDWTWrd9VAPoKHlKqAcBvlOlbDgiXVf/4Y/Y4VUmVr0Bz48qiw
	Hq66wnqSrRiwafyvUjxu0wgaCQktm/7HolGamurQoqiGvBBbSnv66g4vEclVMYIsehtd9xJOWvNEJ
	I58Dl+oTKk+DhooYdx+Yp1escSJvVvNK9BRdiOXnbS7PRh0+3K8AoFtgL7kkqj633Ip51ONdQGVtw
	8tCU8UuW6Jq4s5kDC+YU4XUudPW+ZSftS8/GYM4rbqxFAij2M6cJ6c7xo3w3+qULDPcpYQkFMmISz
	67TO+iXDL54WtHgp562g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mapzD-001EiE-CU; Thu, 14 Oct 2021 01:56:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mapz9-001EhR-Mr
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 01:56:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A70F161056
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 01:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634176602;
 bh=ZM1WtEcrPzwwxvHBTUjeSUaYDLGchqrWv7/MuM1+iKs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YyjHojCkCAxkJR/SZtzr1Aipoj61eaNEalKmcj/LdOc4ye5Ah0aT0XAqL9a+FYbUb
 Qrpoc0Xaxhw2bfOiLjSV60I5q2rfKxQ+srPDZ5N4e2DoyTIMnT6qfZsMd6Unj7wpXj
 O7MW5bAlE+EVC6F+p4xFZmg48hYPRni+SHggyUd5HVkEgx2fhjdXYyqMd2ke7kjL+N
 LXhti1QdovC5CMlbkpe79fwXqkdnmZnSQ1i5X6DWirqSVTjZpksGcwjtVhJsQeo6GP
 VG455Jz62tozaj4v6GB3G+SgHjpc1nmL09SR6B8/RPturncr3+2968getaD2WnMUEA
 Hzc4m5V2H3Xpg==
Received: by mail-ua1-f44.google.com with SMTP id e2so8355748uax.7
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 18:56:42 -0700 (PDT)
X-Gm-Message-State: AOAM531qA70QB+Qd8AOpe/bU1bRNYR7wI/e4z9fzsqqggC06ht+kJY4Y
 76kW1tDXb9ghX2Aj9QdzE0wkCmc1KM2h2KMHXR8=
X-Google-Smtp-Source: ABdhPJwcg3E1UNy8BxUoWk9DY2FjjSeWhM5YSg4jFs3PzAfzX0W3w/6AA7Jxy3ZvdjJonirUlFXWd42hmFT55xwPMic=
X-Received: by 2002:ab0:5b59:: with SMTP id v25mr3102685uae.57.1634176601756; 
 Wed, 13 Oct 2021 18:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <4027415.QZv1u5a1DM@diego>
 <CAJF2gTTDZ0QjY9JL=U61=ubWrGWVOe2VBbW6hgzsHqsePgN0Ww@mail.gmail.com>
 <21791128.ik6S1v3eFK@phil>
In-Reply-To: <21791128.ik6S1v3eFK@phil>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Oct 2021 09:56:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQiCMctaUkJPoJsAOGAHOtprquOJHRHyN-j_HWHyEdzuA@mail.gmail.com>
Message-ID: <CAJF2gTQiCMctaUkJPoJsAOGAHOtprquOJHRHyN-j_HWHyEdzuA@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: Heiko Stuebner <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_185643_806657_5A26A269 
X-CRM114-Status: GOOD (  36.94  )
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

T24gVGh1LCBPY3QgMTQsIDIwMjEgYXQgODoyNiBBTSBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpLAo+Cj4gQW0gTWl0dHdvY2gsIDEzLiBPa3RvYmVyIDIwMjEs
IDE0OjQ5OjU3IENFU1Qgc2NocmllYiBHdW8gUmVuOgo+ID4gT24gV2VkLCBPY3QgMTMsIDIwMjEg
YXQgNTo0MyBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiA+ID4K
PiA+ID4gQW0gTWl0dHdvY2gsIDEzLiBPa3RvYmVyIDIwMjEsIDExOjE5OjUzIENFU1Qgc2Nocmll
YiBBbnVwIFBhdGVsOgo+ID4gPiA+IE9uIFdlZCwgT2N0IDEzLCAyMDIxIGF0IDI6NDQgUE0gSGVp
a28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
QW0gTWl0dHdvY2gsIDEzLiBPa3RvYmVyIDIwMjEsIDExOjExOjI2IENFU1Qgc2NocmllYiBBbnVw
IFBhdGVsOgo+ID4gPiA+ID4gPiBPbiBXZWQsIE9jdCAxMywgMjAyMSBhdCAyOjI3IFBNIEhlaWtv
IFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gSGkgQW51cCwKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEFtIE1pdHR3b2NoLCAx
My4gT2t0b2JlciAyMDIxLCAwNzoxMTo0NiBDRVNUIHNjaHJpZWIgQW51cCBQYXRlbDoKPiA+ID4g
PiA+ID4gPiA+IE9uIFdlZCwgT2N0IDEzLCAyMDIxIGF0IDY6NTIgQU0gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiBBZGQgdGhlIGNvbXBhdGlibGUgc3RyaW5nICJ0aGVhZCxjOTAwLXBsaWMiIHRv
IHRoZSByaXNjdiBwbGljCj4gPiA+ID4gPiA+ID4gPiA+IGJpbmRpbmdzIHRvIHN1cHBvcnQgU09D
cyB3aXRoIHRoZWFkLGM5eHggcHJvY2Vzc29yIGNvcmVzLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPiA+ID4gPiA+ID4gPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+ID4gPiA+ID4gPiA+ID4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29v
Z2xlLmNvbT4KPiA+ID4gPiA+ID4gPiA+ID4gQ2M6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+Cj4gPiA+ID4gPiA+ID4gPiA+IENjOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2Rj
LmNvbT4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgVjM6Cj4gPiA+ID4gPiA+ID4g
PiA+ICAtIFJlbmFtZSAiYzl4eCIgdG8gImM5MDAiCj4gPiA+ID4gPiA+ID4gPiA+ICAtIEFkZCB0
aGVhZCxjOTAwLXBsaWMgaW4gdGhlIGRlc2NyaXB0aW9uIHNlY3Rpb24KPiA+ID4gPiA+ID4gPiA+
ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCAgICB8IDYgKysrKysrCj4gPiA+ID4gPiA+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxp
Yy0xLjAuMC55YW1sCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IDA4ZDVhNTdjZTAwZi4uODI2Mjk4
MzJlNWE1IDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFt
bAo+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gPiA+ID4g
PiA+ID4gPiBAQCAtMzUsNiArMzUsMTEgQEAgZGVzY3JpcHRpb246Cj4gPiA+ID4gPiA+ID4gPiA+
ICAgIGNvbnRhaW5zIGEgc3BlY2lmaWMgbWVtb3J5IGxheW91dCwgd2hpY2ggaXMgZG9jdW1lbnRl
ZCBpbiBjaGFwdGVyIDggb2YgdGhlCj4gPiA+ID4gPiA+ID4gPiA+ICAgIFNpRml2ZSBVNSBDb3Jl
cGxleCBTZXJpZXMgTWFudWFsIDxodHRwczovL3N0YXRpYy5kZXYuc2lmaXZlLmNvbS9VNTQtTUMt
UlZDb3JlSVAucGRmPi4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gKyAgV2hp
bGUgdGhlICJ0aGVhZCxjOTAwLXBsaWMiIHdvdWxkIG1hc2sgSVJRIHdpdGggcmVhZGwoY2xhaW0p
LCBzbyBpdCBuZWVkbid0Cj4gPiA+ID4gPiA+ID4gPiA+ICsgIG1hc2svdW5tYXNrIHdoaWNoIG5l
ZWRlZCBpbiBSSVNDLVYgUExJQy4gV2hlbiBpbiBJUlFTX09ORVNIT1QgJiBJUlFDSElQX0VPSV9U
SFJFQURFRAo+ID4gPiA+ID4gPiA+ID4gPiArICBwYXRoLCB1bm5lY2Vzc2FyeSBtYXNrIG9wZXJh
dGlvbiB3b3VsZCBjYXVzZSBhIGJsb2NraW5nIGlycSBidWcgaW4gdGhlYWQsYzkwMC1wbGljLgo+
ID4gPiA+ID4gPiA+ID4gPiArICBCZWNhdXNlIHdoZW4gSVJRIGlzIGRpc2FibGVkIGluIGM5MDAs
IHdyaXRlbChod2lycSwgY2xhaW0pIHdvdWxkIGJlIGludmFsaWQuCj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gVGhpcyBpcyBhIHRvdGFsbHkgaW5jb3JyZWN0IGRlc2NyaXB0aW9uIG9m
IHRoZSBlcnJhdGEgcmVxdWlyZWQgZm9yIEM5eHggUExJQy4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiBQbGVhc2UgZG9uJ3QgcHJvamVjdCBub24tY29tcGxpYW5jZSBhcyBhIGZlYXR1
cmUgb2YgQzl4eCBQTElDLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiAgbWFpbnRhaW5lcnM6Cj4gPiA+ID4gPiA+ID4gPiA+ICAgIC0gU2FnYXIg
S2FkYW0gPHNhZ2FyLmthZGFtQHNpZml2ZS5jb20+Cj4gPiA+ID4gPiA+ID4gPiA+ICAgIC0gUGF1
bCBXYWxtc2xleSAgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiA+ID4gPiA+ID4gPiA+ID4g
QEAgLTQ2LDYgKzUxLDcgQEAgcHJvcGVydGllczoKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgIC0g
ZW51bToKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAtIHNpZml2ZSxmdTU0MC1jMDAwLXBs
aWMKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAtIGNhbmFhbixrMjEwLXBsaWMKPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAtIHRoZWFkLGM5MDAtcGxpYwo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gd2Ugc3RpbGwgd2FudCBzcGVjaWZpYyBTb0MgbmFtZXMgaW4gdGhlIGNvbXBh
dGlibGUsIHRoZSAiYzkwMCIKPiA+ID4gPiA+ID4gPiBpcyBzdGlsbCBhIHNvcnQtb2YgcGxhY2Vo
b2xkZXIuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgd2UgbmVlZCAiYzkwMCIgY29tcGF0
aWJsZSBzdHJpbmcgYXMgd2VsbC4gVGhlICJjOXh4Igo+ID4gPiA+ID4gPiBjb21wYXRpYmxlIHN0
cmluZyBpcyBmb3IgdGhlIGN1c3RvbSBQTElDIHNwZWMgZm9sbG93ZWQgYnkgVC1IRUFELgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFdoYXQgSSBtZWFudCB3YXMgdGhhdCB0aGUgc29jLXNwZWNpZmljIHN0
cmluZyBzaG91bGQgbmFtZSB0aGUKPiA+ID4gPiA+IGFjdHVhbCBTb0MgKGM5MDYsIGM5MTApIGFu
ZCBub3Qgc29tZSBpbWFnaW5hcnkgY2hpcCA7LSkKPiA+ID4gPgo+ID4gPiA+IEFoaCwgeWVzLiBJ
dCBzaG91bGQgYmUgYW4gYWN0dWFsIHNvYyBuYW1lIGluIHRoZSBjb21wYXRpYmxlCj4gPiA+ID4g
c3RyaW5nLgo+ID4gPiA+Cj4gPiA+ID4gRm9yIGV4YW1wbGUsIFNpRml2ZSB1c2VzICJmdTU0MCIg
c3RyaW5nIHRvIGlkZW50aWZ5IHNvbWUgb2YgdGhlCj4gPiA+ID4gZGV2aWNlcyBvbiBib3RoIFNp
Rml2ZSB1bmxlYXNoZWQgYW5kIFNpRml2ZSB1bm1hdGNoZWQgYm9hcmRzLgo+ID4gPiA+Cj4gPiA+
ID4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCAiYzkwMCIgaXMgYW4gYWN0dWFsIFNv
QyBuYW1lLgo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBBbnVwCj4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBTZWUgZm9yIGV4YW1wbGUgbWFsaSBncHUgYmluZGluZ3MgZm9yIGEg
c2ltaWxhciByZWZlcmVuY2UKPiA+ID4gPiA+IGluIGRldmljZXRyZWUvYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLWJpZnJvc3QueWFtbCAuCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gICAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbGljLTEuMC4wCj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gVGhlIFBMSUMgRFQgbm9kZSByZXF1aXJlcyB0d28gY29tcGF0aWJsZSBz
dHJpbmc6Cj4gPiA+ID4gPiA+ID4gPiA8aW1wbGVtZW50YXRpb25fY29tcGF0PiwgPHNwZWNfY29t
cGF0Pgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFRoZSBDOXh4IFBMSUMgaXMgbm90
IFJJU0MtViBQTElDIHNvLCB0aGUgRFQgbm9kZSBzaG91bGQKPiA+ID4gPiA+ID4gPiA+IGJlOiAi
dGhlYWQsYzkwMC1wbGljIiwgInRoZWFkLGM5eHgtcGxpYyIKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiBZb3UgbmVlZCB0byBjaGFuZ2UgIi0gY29uc3Q6IHNpZml2ZSxwbGljLTEuMC4w
IiB0bwo+ID4gPiA+ID4gPiA+ID4gLSBlbnVtOgo+ID4gPiA+ID4gPiA+ID4gICAgIC0gc2lmaXZl
LHBsaWMtMS4wLjAKPiA+ID4gPiA+ID4gPiA+ICAgICAtIHRoZWFkLGM5eHgtcGxpYwo+ID4gPgo+
ID4gPiBpc24ndCBYdWFuVGllIHRoZSBzZXJpZXMgY29udGFpbmluZyB0aGUgYzkwNiBhbmQgYzkx
MD8KPiA+IFh1YW5UaWUgY29udGFpbiB0d28gQ1BVIHNlcmllczoKPiA+IHJpc2N2OiBjOTA2LCBj
OTEwCj4gPiBjc2t5OiBjODA3LCBjODEwLCBjODYwCj4gPgo+ID4gPiBTbyBtYXliZQo+ID4gPiAg
ICAgICAgIHRoZWFkLHh1YW50aWUtcGxpYwo+ID4gPiBmb3IgdGhlIHNwZWMgY29tcGF0aWJsZS4K
PiA+ID4KPiA+ID4gU28gZG9pbmcgaW4gZnVsbAo+ID4gPiAgICAgICAgIGNvbXBhdGlibGUgPSAi
dGhlYWQsYzkwNi1wbGljIiwgInRoZWFkLHh1YW50aWUtcGxpYyIKPiA+IEhvdyBhYm91dDoKPiA+
IGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLGQxLXBsaWMiLCAidGhlYWQsYzkwMC1wbGljIgo+Cj4g
VGhpcyBsb29rcyBzZW5zaWJsZS4KPgo+IC0gSSBndWVzcyB0aGUgcXVlc3Rpb24gaW4gZ2VuZXJh
bCBpcywgaXMgdGhlIFBMSUMgcGFydCBvZiB0aGUgY29yZSBzcGVjCj4gb3IgcGFydCBvZiB0aGUg
c29jLiBJbiBvdGhlciB3b3JkcyB3aWxsIGFsbCBTb0NzIHRoYXQgdXNlIEM5eHggY29yZXMsCj4g
dXNlIHRoaXMgc3BlY2lmaWMgUExJQyBjaGFyYWN0ZXJpc3RpYz8KWWVzLCB1bmxlc3Mgc29jIHdh
bnRzIHRvIGN1c3RvbWl6ZS4KCj4KPiAtIElmIGFsbCBDOXh4LWJhc2VkIFNvQ3Mgd2lsbCB1c2Ug
dGhpcyBQTElDLCBJIGd1ZXNzIHRoYXQgdGhlYWQsYzkwMC1wbGljCj4gICBpbiB5b3VyIGNvbXBh
dGlibGUgYWJvdmUgc291bmRzIHByZXR0eSBnb29kLgo+Cj4gLSBTaG91bGQgaXQgYmUgdGhlYWQs
KiBvciB0LWhlYWQsKiBmb3IgdGhlIHZlbmRvci1wcmVmaXg/ClQtSGVhZCBTZW1pY29uZHVjdG9y
IENvLiwgTHRkLgpyZWY6IGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaQoKU28gaXQncyAi
dGhlYWQiIGZvciB2ZW5kb3ItcHJlZml4Cgo+ICAgKGRvbWFpbiBzZWVtcyB0byBiZSB0LWhlYWQu
Y24pCj4KPgo+IEhlaWtvCj4KPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
