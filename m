Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C4C19F29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8F+Vqe6ICQAheNwHp7C086hXiCrKOpfr/iybE27d2MU=; b=oAAGmncY5nRakk
	bdCoYUNJQ93Ie4uY3oy2S/1ToS8Pt65r/tK0ovAhE5OvDQLgB5VfCHZWDEMQEOSOSUnOOTZ1bQ4h8
	ucSvv0uz/dwRV3X8mCAxf43leCfMqyJNDbahTOIzqxL+FCKQIVTUVvb7Vs3b5HigUySM+yftl5HIF
	frPn/v+g/LxNEHbzG6Vh4BtB045Cahddq+5ccrCMvUjytGl03MRw1s3rSpODdtRN3PuhsXb+h/XcH
	A4WR5maQS71f3Zporl2KJN578aiQuSFLHcsN6mjmEoGnx/28LhUryifVCufDxKD+hXQNKxBLr4bIS
	Dn6cksXOdaSG6wRE7kFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQJc-00DmOS-3l; Thu, 04 Aug 2022 02:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQJZ-00DmIo-2k
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 02:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50A146177E
	for <linux-riscv@lists.infradead.org>; Thu,  4 Aug 2022 02:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11F8C433B5
	for <linux-riscv@lists.infradead.org>; Thu,  4 Aug 2022 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659579019;
	bh=aos4nr+dtzFt6+Lm052jknDjKBTWPYtcY7YwyUOYPj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WZl6UN78qvLHW8FE+EnMxhqVI81/Fxs4sy8zr87dCCkh1Lj61LWcrhH6HaNjhC0uQ
	 B8oAT8tXiyyMBeEGORbRhTM0oAPifzGPGJ0NfhJwGlwt1XA8J7FTent/K+JTQKnaS8
	 Fq5YM4LZ40eLfcPm1h7VuhCx8Uvdyu7H76KYPKMSqJdfnuzBNMX5XuH37wrPHFrmsg
	 j0jQXnW88MOAh3Fjqki4ELOG5Q0Llk2zly7c3PusvyLtd6AmHvNDsbjpKCU+oPNsDx
	 FAmUawwOTLHxv+pPgJTueC0jlbfM6juSiGbI5cl0PyVkj0AyjJ15ILeDjE+uRzGavK
	 cCLmviopwGuwg==
Received: by mail-oi1-f177.google.com with SMTP id i4so21865385oif.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 19:10:19 -0700 (PDT)
X-Gm-Message-State: ACgBeo3VEjywc/d2NJ2nKPftM/J1rMmSgmdnJjFYu2lokLVCSAuX4NGx
	uRlRxPUFeEZ9o8nSrkJ24J6u1j0yld6NmDniO0I=
X-Google-Smtp-Source: AA6agR4tKOhfTMa8wkamlaYfmSOJJCRR2txdEupJqG9wDd7SQnyP89ZdfWXvXC5gce9oxdYNtydIOFtaS9M5oRVJC1o=
X-Received: by 2002:a05:6808:a10:b0:33a:d654:bf98 with SMTP id
 n16-20020a0568080a1000b0033ad654bf98mr2905634oij.112.1659579018934; Wed, 03
 Aug 2022 19:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220613013051.1741434-1-guoren@kernel.org> <5835624.lOV4Wx5bFT@diego>
In-Reply-To: <5835624.lOV4Wx5bFT@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Aug 2022 10:10:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSotQqmwCMq8Yvg11sZLhfBYONZviJqGBf0eJ9PXKEssg@mail.gmail.com>
Message-ID: <CAJF2gTSotQqmwCMq8Yvg11sZLhfBYONZviJqGBf0eJ9PXKEssg@mail.gmail.com>
Subject: Re: [PATCH] uapi: Fixup strace compile error
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Eugene Syromiatnikov <esyr@redhat.com>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_191021_249165_0FA376A3 
X-CRM114-Status: GOOD (  29.84  )
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

T24gTW9uLCBKdW4gMTMsIDIwMjIgYXQgOTo1OCBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1vbnRhZywgMTMuIEp1bmkgMjAyMiwgMDM6MzA6NTEgQ0VT
VCBzY2hyaWViIGd1b3JlbkBrZXJuZWwub3JnOgo+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFRoZXJlIGlzIG5vIENPTkZJR182NEJJVCBpbiB1c2Vy
c3BhY2UsIHdlIHNob3VsZG4ndCBsaW1pdCBpdCB3aXRoCj4gPiBfX0JJVFNfUEVSX0xPTkcgPT0g
MzIgdG8gYnJlYWsgdGhlIGNvbXBhdGliaWxpdHkuIEp1c3QgZXhwb3J0IEZfKjY0Cj4gPiBkZWZp
bml0aW9ucyB0byB1c2Vyc3BhY2UgcGVybWFuZW50bHkuCj4gPgo+ID4gZ2NjLTExIC1ESEFWRV9D
T05GSUdfSCAgIC1JLi9saW51eC94ODZfNjQgLUkuLi8uLi8uLi9zcmMvbGludXgveDg2XzY0Cj4g
PiAtSS4vbGludXgvZ2VuZXJpYyAtSS4uLy4uLy4uL3NyYy9saW51eC9nZW5lcmljIC1JLiAtSS4u
Ly4uLy4uL3NyYwo+ID4gLURJTl9TVFJBQ0U9MSAgICAgIC1pc3lzdGVtIC9vcHQva2VybmVsL2lu
Y2x1ZGUgLVdhbGwgLVdleHRyYQo+ID4gLVduby1taXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyAt
V25vLXVudXNlZC1wYXJhbWV0ZXIgLVdkYXRlLXRpbWUKPiA+IC1XZm9ybWF0LXNlY3VyaXR5IC1X
aW1wbGljaXQtZmFsbHRocm91Z2g9NSAtV2luaXQtc2VsZiAtV2xvZ2ljYWwtb3AKPiA+IC1XbWlz
c2luZy1wcm90b3R5cGVzIC1XbmVzdGVkLWV4dGVybnMgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbgo+
ID4gLVd0cmFtcG9saW5lcyAtV3VuZGVmIC1Xd3JpdGUtc3RyaW5ncyAtV2Vycm9yICAgLWcgLU8y
IC1jIC1vCj4gPiBsaWJzdHJhY2VfYS1mZXRjaF9icGZfZnByb2cubyBgdGVzdCAtZiAnZmV0Y2hf
YnBmX2Zwcm9nLmMnIHx8IGVjaG8KPiA+ICcuLi8uLi8uLi9zcmMvJ2BmZXRjaF9icGZfZnByb2cu
Ywo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uLy4uLy4uL3NyYy9kZWZzLmg6NDA0LAo+ID4g
ICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uLy4uL3NyYy9mY250bC5jOjEyOgo+ID4gLi4vLi4v
Li4vc3JjL3hsYXQvZmNudGxjbWRzLmg6NTQ6NzogZXJyb3I6IOKAmEZfR0VUTEs2NOKAmSB1bmRl
Y2xhcmVkIGhlcmUKPiA+IChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhGX0dF
VExL4oCZPwo+ID4gICAgNTQgfCAgWExBVChGX0dFVExLNjQpLAo+ID4gICAgICAgfCAgICAgICBe
fn5+fn5+fn4KPiA+IC4uLy4uLy4uL3NyYy94bGF0Lmg6NjQ6NTQ6IG5vdGU6IGluIGRlZmluaXRp
b24gb2YgbWFjcm8g4oCYWExBVOKAmQo+ID4gICAgNjQgfCAjIGRlZmluZSBYTEFUKHZhbCkgICAg
ICAgICAgICAgICAgICAgICAgeyAodW5zaWduZWQpKHZhbCksICN2YWwKPiA+ICAgICAgIH0KPiA+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn4KPiA+IC4uLy4uLy4uL3NyYy94bGF0L2ZjbnRsY21kcy5oOjU3Ojc6IGVycm9yOiDi
gJhGX1NFVExLNjTigJkgdW5kZWNsYXJlZCBoZXJlCj4gPiAobm90IGluIGEgZnVuY3Rpb24pOyBk
aWQgeW91IG1lYW4g4oCYRl9TRVRMS+KAmT8KPiA+ICAgIDU3IHwgIFhMQVQoRl9TRVRMSzY0KSwK
PiA+ICAgICAgIHwgICAgICAgXn5+fn5+fn5+Cj4gPiAuLi8uLi8uLi9zcmMveGxhdC5oOjY0OjU0
OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFhMQVTigJkKPiA+ICAgIDY0IHwgIyBk
ZWZpbmUgWExBVCh2YWwpICAgICAgICAgICAgICAgICAgICAgIHsgKHVuc2lnbmVkKSh2YWwpLCAj
dmFsCj4gPiAgICAgICB9Cj4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+Cj4gPiAuLi8uLi8uLi9zcmMveGxhdC9mY250bGNt
ZHMuaDo2MDo3OiBlcnJvcjog4oCYRl9TRVRMS1c2NOKAmSB1bmRlY2xhcmVkIGhlcmUKPiA+IChu
b3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhGX1NFVExLV+KAmT8KPiA+ICAgIDYw
IHwgIFhMQVQoRl9TRVRMS1c2NCksCj4gPiAgICAgICB8ICAgICAgIF5+fn5+fn5+fn4KPiA+IC4u
Ly4uLy4uL3NyYy94bGF0Lmg6NjQ6NTQ6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCY
WExBVOKAmQo+ID4gICAgNjQgfCAjIGRlZmluZSBYTEFUKHZhbCkgICAgICAgICAgICAgICAgICAg
ICAgeyAodW5zaWduZWQpKHZhbCksICN2YWwKPiA+ICAgICAgIH0KPiA+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4KPiA+IG1h
a2VbNF06ICoqKiBbTWFrZWZpbGU6NTAxNzogbGlic3RyYWNlX2EtZmNudGwub10gRXJyb3IgMQo+
ID4KPiA+IGNvbW1lbnQgYnkgRXVnZW5lOgo+ID4gQWN0dWFsbHksIGl0J3MgcXVpdGUgdGhlIG9w
cG9zaXRlOiAiaWZuZGVmIiB1c2FnZSBtYWRlIGl0IHZhaWxhYmxlIGF0IGFsbAo+ID4gdGltZXMg
dG8gdGhlIHVzZXJzcGFjZSwgYW5kIHRoaXMgY2hhbmdlIGhhcyBhY3R1YWxseSBicm9rZW4gYnVp
bGRpbmcgc3RyYWNlCj4gPiB3aXRoIHRoZSBsYXRlc3Qga2VybmVsIGhlYWRlcnNbMV1bMl0uICBU
aGVyZSBjb3VsZCBiZSBzb21lIGRlYmF0ZSB3aGV0aGVyCj4gPiBoYXZpbmcgdGhlc2UgRl8qNjQg
ZGVmaW5pdGlvbnMgZXhwb3NlZCB0byB0aGUgdXNlciBzcGFjZSA2NC1iaXQKPiA+IGFwcGxpY2F0
aW9ucywgYnV0IGl0IHNlZW1zIHRoYXQgd2VyZSBubyBoYXJtIChhcyB0aGV5IHdlcmUgZXhwb3Nl
ZCBhbHJlYWR5Cj4gPiBmb3IgcXVpdGUgc29tZSB0aW1lKSwgYW5kIHRoZXkgYXJlIHVzZWZ1bCBh
dCBsZWFzdCBmb3Igc3RyYWNlIGZvciBjb21wYXQKPiA+IGFwcGxpY2F0aW9uIHRyYWNpbmcgcHVy
cG9zZXMuCj4gPgo+ID4gRml4ZXM6IDMwNmY3Y2MxZTkwNjEgInVhcGk6IGFsd2F5cyBkZWZpbmUg
Rl9HRVRMSzY0L0ZfU0VUTEs2NC9GX1NFVExLVzY0IGluIGZjbnRsLmgiCj4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBSZXBvcnRlZC1ieTog
RXVnZW5lIFN5cm9taWF0bmlrb3YgPGVzeXJAcmVkaGF0LmNvbT4KPiA+IENjOiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
Pgo+ID4gQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gPiBDYzogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3VhcGkv
YXNtLWdlbmVyaWMvZmNudGwuaCB8IDIgLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL2ZjbnRs
LmggYi9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvZmNudGwuaAo+ID4gaW5kZXggZjEzZDM3YjYw
Nzc1Li5jZDZiZDY1ZWMyNWQgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvYXNtLWdlbmVy
aWMvZmNudGwuaAo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL2ZjbnRsLmgKPiA+
IEBAIC0xMTYsMTMgKzExNiwxMSBAQAo+ID4gICNkZWZpbmUgRl9HRVRTSUcgICAgIDExICAgICAg
LyogZm9yIHNvY2tldHMuICovCj4gPiAgI2VuZGlmCj4gPgo+ID4gLSNpZiBfX0JJVFNfUEVSX0xP
TkcgPT0gMzIgfHwgZGVmaW5lZChfX0tFUk5FTF9fKQo+ID4gICNpZm5kZWYgRl9HRVRMSzY0Cj4g
PiAgI2RlZmluZSBGX0dFVExLNjQgICAgMTIgICAgICAvKiAgdXNpbmcgJ3N0cnVjdCBmbG9jazY0
JyAqLwo+ID4gICNkZWZpbmUgRl9TRVRMSzY0ICAgIDEzCj4gPiAgI2RlZmluZSBGX1NFVExLVzY0
ICAgMTQKPiA+ICAjZW5kaWYKPiA+IC0jZW5kaWYgLyogX19CSVRTX1BFUl9MT05HID09IDMyIHx8
IGRlZmluZWQoX19LRVJORUxfXykgKi8KPgo+IExvb2tzIGxpa2UgcHJ2aW91c2x5IHRoZXJlIHdl
cmUgYSBudW1iZXIgb2Ygd2F5cyB0aGVzZSBjb25zdGFudHMKPiB3ZXJlIGlmZGVmJ2QgLSBvciBu
b3QuIEEgbnVtYmVyIG9mIHBsYXRmb3JtcyBhbHJlYWR5IGhhZCBubyBpZmRlZiBvZgo+IGFueSBz
b3J0IGFyb3VuZCB0aGVtIGJlZm9yZSwgc28gdGhpcyBsb29rcyBsaWtlIHRoZSBzYW5lIHdheSB0
byBkbyBpdC4KPgo+IFRob3VnaCBpbiB0aGUgb3JpZ2luYWwgcGF0Y2ggdGhlIHNwZWNpYWwtbWlw
cy12YXJpYW50IGFsc28gZ2FpbmVkIHRoZQo+ICAgICAgICAgI2lmIF9fQklUU19QRVJfTE9ORyA9
PSAzMiAuLi4KPiBjb25kaXRpb25hbCBpbiBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9mY250
bC5oIC4KPiBTbywgaXMgaXQgYWxzbyBhZmZlY3RlZCBieSB0aGlzIGlzc3VlPwpOb3Qgc3VyZSBh
Ym91dCBtaXBzLgoKPgo+Cj4gSGVpa28KPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
