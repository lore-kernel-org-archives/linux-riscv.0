Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E28FCCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 04:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3l/Rkt7bEVfr1RVE7iRVWz/b6A16r1IGOpwPhataCog=; b=XcXsC6SLiRvBTF
	l+5aMlnmpj9KduRZEDiR7MYoTXP7Vmvnm/hgUQLjNIThIvBPh8lp7LK40dAoBtIGu4gjKVq86UqWM
	VQvAKsbrY2FXz4FdbIIMLHFwiqQ7LeU1TqjOe65hfqx+Tm/XeyMoRPVbCuS6NjffhuEqOaIrDfwaZ
	poCJc5xoHnF8+lPP+KUGowXPI1qhTMGpBfKiCf24VRXCrNUOO0nkXOLZpdrefnVsZh1SwKMVDKTdk
	jeIpoIiwZfBMcbHVCMcR/ATsTPMyZtNbr4nVctGeBrmu7j2sDYw6n2Jl72UoZb1fOM6HZx9Os+H6F
	703EXEnvrK1vecMaOxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8A5L-0000000CCHF-3BcV;
	Mon, 13 Oct 2025 04:22:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8A5I-0000000CCGu-3XT6
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 04:22:58 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-57e03279bfeso4717687e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 21:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760329375; x=1760934175; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIm07Frt6UqA8OnEbW7sIR30RcCER/YlhbGsaYO7atM=;
        b=lVwGA4Bsjp367LGK4gjCpVAZui3PI65/zIM+gWreDu+EIj08BgbZFSl+P+kgi2cFAJ
         hu6prU82pznuiQAoBecsHQ+gVY9Jis+V1aZkVDdi+9qJIrDbPq+D0ZvGK02mjjq+X7Hl
         ypeb1ATG3atuN30jUoqx4tPJcQngTabytLF13wvONx8F7Uht1lAS0K3d5GtteOua3wgx
         addDJSzk3ak//IvMurnJkI5EtHQUTkhT24yYlwgIr5cfxF+COW8zL6DdDsohhnfwcMsM
         dwwPa8OvBglYNCe8pLvGicHjxmTIEiX09CmAd/LbVzSgrp3vyEpoj7khWSeYmg97TNBv
         kjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760329375; x=1760934175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIm07Frt6UqA8OnEbW7sIR30RcCER/YlhbGsaYO7atM=;
        b=hhP/pQ946Y+W7qzmPF14aDwddQnIQn9/SGvg0qd+6dc7TTPeV8dobMZgPBoGng5hrm
         F62ETIl5W8CNGPHHPv9Pf27fu9ku1w2REI6cWVkk73ucvXw1+nXuCHazv0d8jrAJcDCi
         syeR5bsETf89ihvoF6Epe6YQDgUopZUiQVR8iX/QIpd8aSDSL4w1fQQ1EolVfi5oR7PT
         9xNPdq5JfjqKuF3l+/Poa1m9mecgVkEbMrmUfyyVuh04Q0eI5bRMZ2VgTR67D/my4mtF
         c42FS/9dyTjn2bolqEiOGS16BOhjB9oOuKs57n84acRSW9X0IhmeEssTP/MZFtruyFF7
         lSpg==
X-Forwarded-Encrypted: i=1; AJvYcCWTBypC5ucAFQTRAPtK++AAdhGMRhZkM23w+YDGWml7NGIJK3ch/FUbIqZUs/k2L+xABRkRIkUX7JwUBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx4q5KdZiy3WZc/9thfxkBboACaP1E0nP9Zw57WUKe/EPFFefE
	Amp7guxajDmjEuMdo4uhCjNG1W8U5vMS2Lf8DwIdbRrl7e/NRq6+IA3lpqlNia0XHoyCh3Ees0M
	E8WDtB7KljULoofdPMVzUQrGNFtW8xTPha8fFAnn3Hw==
X-Gm-Gg: ASbGnctoOYZM3vfm50HUpA9q7wALic+2rHp/n/XbUS0Q+dOn+BPSPSuJAMoQJmgdOSq
	kvqiDnw5VvWJZE3Qv3My7mBu2lGHk5qpuLEZ26ewKDmjL7YF+1fih6HhzyO1fBTDV3wPEter7lO
	74KXU6cd7PewT1VHLH4koJ8sVkSyR+/6dbvhRZdPJfCcvzA+soPDpkanAxsFuLBz7hT555OqMXT
	54Y3LQYKpKCUuaruIdsxR5i0tLXF2SAc70HIw==
X-Google-Smtp-Source: AGHT+IF9GyRvwlY+za48jwaGLhv+GdYktcmtJpmyFrXoDuVmvzO8g9ax7WhUH0r6LKtiHHQUfIueiCU3VDqWez28w9s=
X-Received: by 2002:a05:6512:e85:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-5905e3a0d18mr5694186e87.28.1760329374581; Sun, 12 Oct 2025
 21:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250911124448.1771-1-cp0613@linux.alibaba.com>
In-Reply-To: <20250911124448.1771-1-cp0613@linux.alibaba.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 13 Oct 2025 09:52:40 +0530
X-Gm-Features: AS18NWDCorXyTJB5-3mUpzhGpHftDP0QKH89ou3pgO4FOSJeW6Ud31hlZ5sBN1M
Message-ID: <CAK9=C2VEKAy-pS8gy02E2AFifxBOmNPpgTodC+pyuU53Ts_0VA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] riscv: tarce: Implement riscv trace pmu driver
 and perf support
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	cp0613@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_212256_931765_AAE0E09E 
X-CRM114-Status: GOOD (  19.67  )
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

SGkgR3VvLAoKT24gVGh1LCBTZXAgMTEsIDIwMjUgYXQgNjoxNeKAr1BNIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGli
YWJhLmNvbT4KPgo+IFRoZSBSSVNDLVYgVHJhY2UgU3BlY2lmaWNhdGlvbiBkZWZpbmVzIGEgc3Rh
bmRhcmRpemVkIGZyYW1ld29yayBmb3IKPiBjYXB0dXJpbmcgYW5kIGFuYWx5emluZyB0aGUgZXhl
Y3V0aW9uIG9mIFJJU0MtViBwcm9jZXNzb3JzLiBJdHMgbWFpbgo+IHVzZXMgaW5jbHVkZTogaW5z
dHJ1Y3Rpb24gYW5kIGRhdGEgdHJhY2luZywgcmVhbC10aW1lIGRlYnVnZ2luZywgZXRjLgo+IFNp
bWlsYXIgdG8gSW50ZWwtUFQgYW5kIEFSTS1Db3JlU2lnaHQuCj4KPiBBY2NvcmRpbmcgdG8gdGhl
IFJJU0MtViBUcmFjZSBDb250cm9sIEludGVyZmFjZSBzcGVjaWZpY2F0aW9uIFsxXS4KPiBUaGVy
ZSBhcmUgdHdvIHN0YW5kYXJkIFJJU0MtViB0cmFjZSBwcm90b2NvbHMgd2hpY2ggd2lsbCB1dGls
aXplCj4gdGhpcyBSSVNDLVYgVHJhY2UgQ29udHJvbCBJbnRlcmZhY2U6Cj4gLSBSSVNDLVYgTi1U
cmFjZSAoTmV4dXMtYmFzZWQgVHJhY2UpIFNwZWNpZmljYXRpb24KPiAtIEVmZmljaWVudCBUcmFj
ZSBmb3IgUklTQy1WIFNwZWNpZmljYXRpb24KPiBTbywgdGhpcyBpcyBhIGNvbXBsZXRlIGd1aWRl
bGluZSBmb3IgYW55IHN0YW5kYXJkIFJJU0MtViB0cmFjZQo+IGltcGxlbWVudGF0aW9uLgo+Cj4g
VGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBpcyBtYWlubHkgdXNlZCB0byBzdGFydCByZWxhdGVkIHdv
cmsgYW5kCj4gY29tbXVuaWNhdGlvbi4gSXQgY29tcGxldGVzIHRoZSBmb2xsb3dpbmcgdGFza3M6
Cj4gMS4gZHQtYmluZGluZ3MgY29tcGxldGVzIHRoZSBiYXNpYyBkZWZpbml0aW9uIG9mIHJpc2N2
IHRyYWNlCj4gICAgY29tcG9uZW50IHByb3BlcnRpZXMsIGJ1dCBpcyBzdGlsbCBpbmNvbXBsZXRl
Lgo+IDIuIEltcGxlbWVudGVkIHRoZSBiYXNpYyBSSVNDLVYgVHJhY2UgUE1VIGRyaXZlciwgaW5j
bHVkaW5nCj4gICAgc3VwcG9ydCBmb3IgdGhlIGF1eCBidWZmZXIuCj4gMy4gSW1wbGVtZW50ZWQg
YmFzaWMgc3VwcG9ydCBmb3IgQVVYVFJBQ0UgaW50ZWdyYXRpb24gd2l0aCBwZXJmCj4gICAgdG9v
bHMuCj4KPiBUaGVyZSdzIHN0aWxsIG1vcmUgd29yayB0byBiZSBkb25lLCBzdWNoIGFzOgo+IDEu
IENvbXBsZXRlIFJJU0MtViBUcmFjZSBQTVUgaW1wbGVtZW50YXRpb24uCj4gMi4gVGhlIHBlcmYu
ZGF0YSBnZW5lcmF0aW9uIGFuZCBwYXJzaW5nIGluY2x1ZGluZyBBVVhUUkFDRSBldmVudHMuCj4g
My4gVGFraW5nIFJJU0MtViBOLVRyYWNlIGFzIGFuIGV4YW1wbGUsIGltcGxlbWVudCB0aGUgcGFy
c2luZyBvZgo+ICAgIE5leHVzIFRyYWNlIGRhdGEgZm9ybWF0LCBpbmNsdWRpbmcgc3VwcG9ydCBm
b3IgcGVyZiByZXBvcnQgYW5kCj4gICAgcGVyZiBzY3JpcHQgY29tbWFuZHMuCj4gV2UgYXJlIHN0
aWxsIHNvcnRpbmcgb3V0Lgo+Cj4gQW55IGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb25zIGFyZSB3ZWxj
b21lLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3RnLW5leHVzLXRy
YWNlLmdpdAo+Cj4gQ2hlbiBQZWkgKDQpOgo+ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgdHJh
Y2UgY29tcG9uZW50cyBkZXNjcmlwdGlvbgo+ICAgcmlzY3Y6IGV2ZW50OiBJbml0aWFsIHJpc2N2
IHRyYWNlIGRyaXZlciBzdXBwb3J0Cj4gICB0b29sczogcGVyZjogU3VwcG9ydCBwZXJmIHJlY29y
ZCB3aXRoIGF1eCBidWZmZXIgZm9yIHJpc2N2IHRyYWNlCj4gICByaXNjdjogdHJhY2U6IFN1cHBv
cnQgc2luayB1c2luZyBkbWEgYnVmZmVyCj4KPiAgLi4uL3Jpc2N2L3RyYWNlL3Jpc2N2LHRyYWNl
LGVuY29kZXIueWFtbCAgICAgIHwgIDQxICsrKwo+ICAuLi4vcmlzY3YvdHJhY2UvcmlzY3YsdHJh
Y2UsZnVubmVsLnlhbWwgICAgICAgfCAgNDYgKysrKwo+ICAuLi4vcmlzY3YvdHJhY2UvcmlzY3Ys
dHJhY2Usc2luay55YW1sICAgICAgICAgfCAgMzcgKysrCj4gIGFyY2gvcmlzY3YvS2J1aWxkICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3YvZXZlbnRzL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICB8ICAxMSArCj4gIGFyY2gvcmlzY3YvZXZlbnRzL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMyArCj4gIGFyY2gvcmlzY3YvZXZlbnRzL3Jp
c2N2X3RyYWNlLmMgICAgICAgICAgICAgICB8IDI1MyArKysrKysrKysrKysrKysrKysKPiAgYXJj
aC9yaXNjdi9ldmVudHMvcmlzY3ZfdHJhY2UuaCAgICAgICAgICAgICAgIHwgMTMzICsrKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2V2ZW50cy9yaXNjdl90cmFjZV9lbmNvZGVyLmMgICAgICAgfCAxMDkg
KysrKysrKysKPiAgYXJjaC9yaXNjdi9ldmVudHMvcmlzY3ZfdHJhY2VfZnVubmVsLmMgICAgICAg
IHwgMTYwICsrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvZXZlbnRzL3Jpc2N2X3RyYWNlX3Npbmsu
YyAgICAgICAgICB8IDEwMCArKysrKysrCj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1
aWxkICAgICAgICAgICAgICB8ICAgMyArCj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2F1
eHRyYWNlLmMgICAgICAgICB8ICAzMyArKysKPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwv
cG11LmMgICAgICAgICAgICAgIHwgIDE4ICsrCj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGls
L3Jpc2N2LXRyYWNlLmMgICAgICB8IDE4MyArKysrKysrKysrKysrCj4gIHRvb2xzL3BlcmYvYXJj
aC9yaXNjdi91dGlsL3RzYy5jICAgICAgICAgICAgICB8ICAxNSArKwo+ICB0b29scy9wZXJmL3V0
aWwvQnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICB0b29scy9wZXJmL3V0
aWwvYXV4dHJhY2UuYyAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+ICB0b29scy9wZXJmL3V0
aWwvYXV4dHJhY2UuaCAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICB0b29scy9wZXJmL3V0
aWwvcmlzY3YtdHJhY2UuYyAgICAgICAgICAgICAgICAgfCAxNjIgKysrKysrKysrKysKPiAgdG9v
bHMvcGVyZi91dGlsL3Jpc2N2LXRyYWNlLmggICAgICAgICAgICAgICAgIHwgIDE4ICsrCj4gIDIy
IGZpbGVzIGNoYW5nZWQsIDEzMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RyYWNlL3Jpc2N2LHRyYWNl
LGVuY29kZXIueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L3RyYWNlL3Jpc2N2LHRyYWNlLGZ1bm5lbC55YW1sCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvdHJh
Y2UvcmlzY3YsdHJhY2Usc2luay55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2V2ZW50cy9LY29uZmlnCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2V2ZW50cy9N
YWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ldmVudHMvcmlzY3ZfdHJh
Y2UuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ldmVudHMvcmlzY3ZfdHJhY2Uu
aAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ldmVudHMvcmlzY3ZfdHJhY2VfZW5j
b2Rlci5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2V2ZW50cy9yaXNjdl90cmFj
ZV9mdW5uZWwuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ldmVudHMvcmlzY3Zf
dHJhY2Vfc2luay5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3Yv
dXRpbC9hdXh0cmFjZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlz
Y3YvdXRpbC9wbXUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2
L3V0aWwvcmlzY3YtdHJhY2UuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNo
L3Jpc2N2L3V0aWwvdHNjLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvdXRpbC9y
aXNjdi10cmFjZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3V0aWwvcmlzY3Yt
dHJhY2UuaAo+Cj4gLS0KCkZldyBtb250aHMgYmFjayB3ZSAoVmVudGFuYSkgaGFkIGluZm9ybWVk
IGV2ZXJ5b25lCndpdGhpbiBSVkkgKHBhcnRpY3VsYXJseSBzZWxmLWhvc3RlZCB0cmFjZSBURykg
dGhhdCB3ZSBhcmUKd29ya2luZyBvbiBMaW51eCB0cmFjZSBmcmFtZXdvcmsgYW5kIGRyaXZlcnMg
Zm9yIHRoZSBSSVNDLVYKY29tbXVuaXR5IFsxXS4gVGhlcmUgYXJlIGFsc28gcHVibGljbHkgYWNj
ZXNzaWJsZSBSSVNFCnByb2plY3QgcGFnZXMgYWxyZWFkeSBhdmFpbGFibGUgZm9yIHRoZSB0cmFj
ZSBlZmZvcnRzIFsyXS4KClRoaXMgaXMgeWV0IGFub3RoZXIgaW5zdGFuY2Ugd2hlcmUgb25nb2lu
ZyBlZmZvcnRzIHdlcmUKdG90YWxseSBpZ25vcmVkLgoKLS0KQW51cAoKWzFdIGh0dHBzOi8vbGlz
dHMucmlzY3Yub3JnL2cvc2lnLWh5cGVydmlzb3JzL21lc3NhZ2UvNjQ4ClsyXSBodHRwczovL2xm
LXJpc2UuYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9IT01FL3BhZ2VzLzg1OTEyNTEvMjAyNSst
K0tlcm5lbCthbmQrVmlydHVhbGl6YXRpb24rUHJpb3JpdGllcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
