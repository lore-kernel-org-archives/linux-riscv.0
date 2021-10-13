Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D754FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ABCB603E7
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ABCB603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZP/eRAk3mQwpbFaOfAfomO+Pgwho3IUK/ASN0vQbiE=; b=AMoqN+oBaes2lJ
	VqOvwuV2wCnR2kxrUUG/7BpdvioYq65w98mXm/yfV2B8pPlDpEJJesoh1uiPMYvQZ7oie8Ug1qFGA
	wBeSJUPxkqEz5j9tlU4l05YD+Q7n3jdA7HmAD7dn2UYZKo358g/CwWTdrO0JqQR0ztt+s7L5ZA/bG
	bmCiOzpquslrm6ahSHzet7837DuHWyD7LGCofzwPLUUpXqLWMLlbJKJlATI18zjPZhqOOezSXysat
	6pyBvwxvLjquR9yVUgKc3JNON0r3ywPHT03Rm08xup70CsSQdpwxuBrogkeitu9lPaXlqZrR5YdEe
	8IcuWt/qIV8B69jQtY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mae5A-00GoGk-Ek; Wed, 13 Oct 2021 13:14:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1madT3-00GahU-5x
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 12:34:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B51E3610FB
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634128484;
 bh=JlEDbRIR5mybHqyx6SQLCFaW8BoVnGveOk9R4ZFD7zM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K9t6NAqdOEGZzMasWIlRt5fOEnzL+LmFFNeDVs21urg2VMs97F3D/NOu0l1x7Ohvl
 cCgNe4QJYOEgIt5UTstaCvU1AYpln/4twGOILue/3NOT4rQ963KsfdYo4Ri1Zcge9T
 4IfpGMouomb+OykZNrTZmL/kfHMk4vxc7zMt5k25f/Q30b7hUifeSGdjNEHkBGfapj
 aWKo2p3fWPgJiilcOt+kW8ZwuSFYdo6jHhSjxLvQLIqrHpzcWP0tNp7hFuxtFkAUYe
 eSlRF7GCD6guQIz8+kzxhYI/8GtKgWMIO2QF/urtCv/F0US8hjMd+5ozsJqx17fVhy
 fAj0w4v6OmWaw==
Received: by mail-vk1-f171.google.com with SMTP id j12so1731466vka.4
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 05:34:44 -0700 (PDT)
X-Gm-Message-State: AOAM530uVPw+b5KGahdwv2op+VPqc6es+34FK+IVRYHu8sy4ie5HcmXN
 W/PYDxx1CaMBfSsuzACUFMQYLVq6fsa9d0fmALU=
X-Google-Smtp-Source: ABdhPJyG0CYAXgVJwI3HxRrhPFgUh8fz6ejBECHvxddZ69z75kh9bvDLh3hS92Kduf5pciR1hzt0XY9NvHv/yHjzIcA=
X-Received: by 2002:a1f:1844:: with SMTP id 65mr32743708vky.3.1634128483719;
 Wed, 13 Oct 2021 05:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <CAAhSdy042JY_Vm2j_d5t4jweS3gf51h30j1O9LXDnE6KkB8AEg@mail.gmail.com>
 <4039032.XOxOlHldtI@diego>
In-Reply-To: <4039032.XOxOlHldtI@diego>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 20:34:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSJaYqH-=QQgM+d6jMQh1i97Q2=O9MCu_8jS2w06q5fCg@mail.gmail.com>
Message-ID: <CAJF2gTSJaYqH-=QQgM+d6jMQh1i97Q2=O9MCu_8jS2w06q5fCg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_053445_301372_1BC2CAD5 
X-CRM114-Status: GOOD (  23.75  )
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

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgNDo1NyBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBBbSBNaXR0d29jaCwgMTMuIE9rdG9iZXIg
MjAyMSwgMDc6MTE6NDYgQ0VTVCBzY2hyaWViIEFudXAgUGF0ZWw6Cj4gPiBPbiBXZWQsIE9jdCAx
MywgMjAyMSBhdCA2OjUyIEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4KPiA+ID4gQWRk
IHRoZSBjb21wYXRpYmxlIHN0cmluZyAidGhlYWQsYzkwMC1wbGljIiB0byB0aGUgcmlzY3YgcGxp
Ywo+ID4gPiBiaW5kaW5ncyB0byBzdXBwb3J0IFNPQ3Mgd2l0aCB0aGVhZCxjOXh4IHByb2Nlc3Nv
ciBjb3Jlcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4
LmFsaWJhYmEuY29tPgo+ID4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+
ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gPiA+IENj
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gPiBDYzogQXRpc2ggUGF0cmEg
PGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiA+Cj4gPiA+IC0tLQo+ID4gPgo+ID4gPiBDaGFuZ2Vz
IHNpbmNlIFYzOgo+ID4gPiAgLSBSZW5hbWUgImM5eHgiIHRvICJjOTAwIgo+ID4gPiAgLSBBZGQg
dGhlYWQsYzkwMC1wbGljIGluIHRoZSBkZXNjcmlwdGlvbiBzZWN0aW9uCj4gPiA+IC0tLQo+ID4g
PiAgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlh
bWwgICAgfCA2ICsrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMt
MS4wLjAueWFtbAo+ID4gPiBpbmRleCAwOGQ1YTU3Y2UwMGYuLjgyNjI5ODMyZTVhNSAxMDA2NDQK
PiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEu
MC4wLnlhbWwKPiA+ID4gQEAgLTM1LDYgKzM1LDExIEBAIGRlc2NyaXB0aW9uOgo+ID4gPiAgICBj
b250YWlucyBhIHNwZWNpZmljIG1lbW9yeSBsYXlvdXQsIHdoaWNoIGlzIGRvY3VtZW50ZWQgaW4g
Y2hhcHRlciA4IG9mIHRoZQo+ID4gPiAgICBTaUZpdmUgVTUgQ29yZXBsZXggU2VyaWVzIE1hbnVh
bCA8aHR0cHM6Ly9zdGF0aWMuZGV2LnNpZml2ZS5jb20vVTU0LU1DLVJWQ29yZUlQLnBkZj4uCj4g
PiA+Cj4gPiA+ICsgIFdoaWxlIHRoZSAidGhlYWQsYzkwMC1wbGljIiB3b3VsZCBtYXNrIElSUSB3
aXRoIHJlYWRsKGNsYWltKSwgc28gaXQgbmVlZG4ndAo+ID4gPiArICBtYXNrL3VubWFzayB3aGlj
aCBuZWVkZWQgaW4gUklTQy1WIFBMSUMuIFdoZW4gaW4gSVJRU19PTkVTSE9UICYgSVJRQ0hJUF9F
T0lfVEhSRUFERUQKPiA+ID4gKyAgcGF0aCwgdW5uZWNlc3NhcnkgbWFzayBvcGVyYXRpb24gd291
bGQgY2F1c2UgYSBibG9ja2luZyBpcnEgYnVnIGluIHRoZWFkLGM5MDAtcGxpYy4KPiA+ID4gKyAg
QmVjYXVzZSB3aGVuIElSUSBpcyBkaXNhYmxlZCBpbiBjOTAwLCB3cml0ZWwoaHdpcnEsIGNsYWlt
KSB3b3VsZCBiZSBpbnZhbGlkLgo+ID4KPiA+IFRoaXMgaXMgYSB0b3RhbGx5IGluY29ycmVjdCBk
ZXNjcmlwdGlvbiBvZiB0aGUgZXJyYXRhIHJlcXVpcmVkIGZvciBDOXh4IFBMSUMuCj4gPgo+ID4g
UGxlYXNlIGRvbid0IHByb2plY3Qgbm9uLWNvbXBsaWFuY2UgYXMgYSBmZWF0dXJlIG9mIEM5eHgg
UExJQy4KPiA+Cj4gPiA+ICsKPiA+ID4gIG1haW50YWluZXJzOgo+ID4gPiAgICAtIFNhZ2FyIEth
ZGFtIDxzYWdhci5rYWRhbUBzaWZpdmUuY29tPgo+ID4gPiAgICAtIFBhdWwgV2FsbXNsZXkgIDxw
YXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gPiA+IEBAIC00Niw2ICs1MSw3IEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ICAgICAgICAtIGVudW06Cj4gPiA+ICAgICAgICAgICAgLSBzaWZpdmUsZnU1NDAt
YzAwMC1wbGljCj4gPiA+ICAgICAgICAgICAgLSBjYW5hYW4sazIxMC1wbGljCj4gPiA+ICsgICAg
ICAgICAgLSB0aGVhZCxjOTAwLXBsaWMKPgo+IHdlIHN0aWxsIHdhbnQgc3BlY2lmaWMgU29DIG5h
bWVzIGluIHRoZSBjb21wYXRpYmxlLCB0aGUgImM5MDAiCj4gaXMgc3RpbGwgYSBzb3J0LW9mIHBs
YWNlaG9sZGVyLgpjOTAwIGlzIG5vdCBhIFNPQyBuYW1lLCBidXQgYSBDUFUgbmFtZS4gRm9yIHNv
YyBuYW1lLCBpdCBzaG91bGQgYmUKImFsbHdpbm5lcixkMS1wbGljIi4KCj4KPgo+ID4gPiAgICAg
ICAgLSBjb25zdDogc2lmaXZlLHBsaWMtMS4wLjAKPiA+Cj4gPiBUaGUgUExJQyBEVCBub2RlIHJl
cXVpcmVzIHR3byBjb21wYXRpYmxlIHN0cmluZzoKPiA+IDxpbXBsZW1lbnRhdGlvbl9jb21wYXQ+
LCA8c3BlY19jb21wYXQ+Cj4gPgo+ID4gVGhlIEM5eHggUExJQyBpcyBub3QgUklTQy1WIFBMSUMg
c28sIHRoZSBEVCBub2RlIHNob3VsZAo+ID4gYmU6ICJ0aGVhZCxjOTAwLXBsaWMiLCAidGhlYWQs
Yzl4eC1wbGljIgo+ID4KPiA+IFlvdSBuZWVkIHRvIGNoYW5nZSAiLSBjb25zdDogc2lmaXZlLHBs
aWMtMS4wLjAiIHRvCj4gPiAtIGVudW06Cj4gPiAgICAgLSBzaWZpdmUscGxpYy0xLjAuMAo+ID4g
ICAgIC0gdGhlYWQsYzl4eC1wbGljCj4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1M
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
