Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E1C27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1Fvq87QPYj8J3hDLZCYPi9tdOH585VzxLb+nyKMhY8=; b=GfndPdA+AEiImx
	Ud7zAAHDZCZ0O2xPx5IyILlYunPDhPZ/2lTHVSusodVhAWhoUkJ1X5ZoB5Phu2Xp/fXIzsRinSTcI
	PZOqYVOka6TGdGrJ2My8HXMrUtYqml9XXSaBCd2l/Te0+soBQm0hFOkzRvf7YqNKQGne3w50/1kGi
	WScbOG8F9vQIV5NvIQp9Rt+rIfp1rq/WrSCeg+AQS6AnaYmR9L4IlVmNyNWkzKKVYJv6cmNriTr04
	H/ZDozSBVF9GKBBBBHhtVOEjQNWts5bS4ZzV8EbIZHHqLjU/3RdhG2ukUjTHBYcNsRRpAIuM7TOAV
	SHj2o45WevLe2yy6MI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHUH-00000003xBD-3mSQ;
	Wed, 29 May 2024 11:28:57 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHUC-00000003x8U-0Tp4
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 11:28:53 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2e716e302bdso21778261fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716982129; x=1717586929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLzGz8ZCVVO6lOpfLPlQp3f813FvHT+QtFRxJi4eyk4=;
        b=bigMyF+oOSojPSGqn0AKzWO/dhdwGktV94KLSMGHvabFKmrxcAC7wa0OAhaD0Rwb6Z
         boNbuxBiUuVknvSw4FaMxA91r/lPoRPhGgFZETOcFsSgAR31n7Q74dBytLviLGDXXu2v
         FAY7L6TupomNZ7nhhOF8vejQ5gXoGq4kAI6AC8QY7vEH3hYtNW+/8Fi2gNJq01xt7hXu
         iC6GFwiVFL5WQreLEjCBaYVYfusxJcRSHKA3xHxyfR2auKCkpX1CTzWtuMWXwRJIsDYd
         CmI9RCl9uZcV3pXzJWa2IOPyuKP2KgLb+G96LfBl5oiCV9KJ6j66Qftv3iQHzP3uq1FI
         qN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716982129; x=1717586929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLzGz8ZCVVO6lOpfLPlQp3f813FvHT+QtFRxJi4eyk4=;
        b=BisI1kMza71FBZZzihIvutKo9Un+Rk1rVCGjNtuKZELbOebX0hg8Pgs74LRIwLCSrr
         Gx1ZW1fYMufWRAGhfBCfADvBXqIZcRwNIBCb4T3yQJNM61+bwao6nFERGbqVw9QYoxU0
         JvQpm+ssuwd2ZSg/RnBIQObXIxZoTyhh7EXQ85qMTSG+DRoTV95hUkv3c6x8iv54bty8
         tE9acchmBq5lYhfbKRxlnT/wo7UChdWZ0XHRFwzxSgCXxHvSiv+1Z5iPD2IPZsGb3X4O
         o1lV82kqT65JXa03BqF17zNTkU4HA5vz3sEIHbX36PlTWqAKW7G7ECXmba5OVHu/vGIH
         pnSA==
X-Forwarded-Encrypted: i=1; AJvYcCWzfr7FIWZoLhgyDe7tcJttYe2O8R0ChlwDKeFV4XMHGJbSEg+jsOTqxYaqnd0C6xu5QmyPo6PxLKy35fx+JSUuKiDhdlrSGFrsmvs7AmwR
X-Gm-Message-State: AOJu0Yys7WLaI9sKb3VwChBCTkokWa8hIKQT7jESzTdFm9Iv2wbOwNmT
	F+zqlMPUMBC3h4F2pUWHjVksTNF4oF/RfCI773tnYqfAYu95HbfzwaDTpsvJDbUa93dii3i5MSF
	BAgwTKNjyKjtTONLv8GHb/bHNuKfUl9D31WFK5Q==
X-Google-Smtp-Source: AGHT+IG2FRfDgIBYznp0vX/GdwMe+FB13qOPo8Ip2JkZkrlYHIyl0PzJ+pURnCwMJsb6hGhYxNOHOf3hmCyJbtpJHrU=
X-Received: by 2002:a2e:bc08:0:b0:2d6:f69d:c74c with SMTP id
 38308e7fff4ca-2e95b256308mr100224821fa.38.1716982128754; Wed, 29 May 2024
 04:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240528164132.2451685-1-maz@kernel.org> <CAK9=C2XNPJP0X=pg5TSrQbsuouDD3jP-gy2Sm4BXNJp0ZiWp+A@mail.gmail.com>
 <86bk4pm8j1.wl-maz@kernel.org> <CAK9=C2XRx==OTPoGW_AHmjq4Th0bv4okwcq6-3L5JYwHwQp97A@mail.gmail.com>
 <86a5k8nbh1.wl-maz@kernel.org>
In-Reply-To: <86a5k8nbh1.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 29 May 2024 16:58:34 +0530
Message-ID: <CAK9=C2Ugq=0y8M86CD75mQccBo=TBLBomb4rqC4i1naKy2LyWQ@mail.gmail.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
To: Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_042852_478295_42E726FB 
X-CRM114-Status: GOOD (  45.12  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgNDoxNeKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyOSBNYXkgMjAyNCAxMToxNjozMCArMDEwMCwKPiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2Vk
LCBNYXkgMjksIDIwMjQgYXQgMTI6MDPigK9QTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCAyOSBNYXkgMjAyNCAwNjoxNTo1MiArMDEwMCwK
PiA+ID4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+
Cj4gPiA+ID4gT24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgMTA6MTHigK9QTSBNYXJjIFp5bmdpZXIg
PG1hekBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBDb21taXQgZDk3NmM2
ZjRiMzJjICgib2Y6IHByb3BlcnR5OiBBZGQgZndfZGV2bGluayBzdXBwb3J0IGZvcgo+ID4gPiA+
ID4gaW50ZXJydXB0LW1hcCBwcm9wZXJ0eSIpIHRyaWVkIHRvIGRvIHdoYXQgaXQgc2F5cyBvbiB0
aGUgdGluLAo+ID4gPiA+ID4gYnV0IGZhaWxlZCBvbiBhIGNvdXBsZSBvZiBwb2ludHM6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gLSBpdCBjb25mdXNlcyBieXRlcyBhbmQgY2VsbHMuIE5vdCBhIGh1Z2Ug
ZGVhbCwgZXhjZXB0IHdoZW4gaXQKPiA+ID4gPiA+ICAgY29tZXMgdG8gcG9pbnRlciBhcml0aG1l
dGljCj4gPiA+ID4gPgo+ID4gPiA+ID4gLSBpdCBkb2Vzbid0IHJlYWxseSBoYW5kbGUgYW55dGhp
bmcgYnV0IGludGVycnVwdC1tYXBzIHRoYXQgaGF2ZQo+ID4gPiA+ID4gICB0aGVpciBwYXJlbnQg
I2FkZHJlc3MtY2VsbHMgc2V0IHRvIDAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgY29tYmluYXRp
b25zIG9mIHRoZSB0d28gbGVhZHMgdG8gc29tZSBzZXJpb3VzIGZ1biBvbiBteSBNMQo+ID4gPiA+
ID4gYm94LCB3aXRoIHBsZW50eSBvZiBXQVJOLU9OKCkgZmlyaW5nIGFsbCBvdmVyIHRoZSBzaG9w
LCBhbmQKPiA+ID4gPiA+IGFtdXNpbmcgdmFsdWVzIGJlaW5nIGdlbmVyYXRlZCBmb3IgaW50ZXJy
dXB0IHNwZWNpZmllcnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWRkcmVzcyBib3RoIGlzc3VlcyBz
byB0aGF0IEkgY2FuIGJvb3QgbXkgbWFjaGluZXMgYWdhaW4uCj4gPiA+ID4gPgo+ID4gPiA+ID4g
Rml4ZXM6IGQ5NzZjNmY0YjMyYyAoIm9mOiBwcm9wZXJ0eTogQWRkIGZ3X2Rldmxpbmsgc3VwcG9y
dCBmb3IgaW50ZXJydXB0LW1hcCBwcm9wZXJ0eSIpCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+ID4gPiA+ID4gQ2M6IEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+ID4gQ2M6IFNhcmF2YW5hIEthbm5hbiA8c2Fy
YXZhbmFrQGdvb2dsZS5jb20+Cj4gPiA+ID4gPiBDYzogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhA
a2VybmVsLm9yZz4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGZpeCBwYXRjaCBidXQg
dW5mb3J0dW5hdGVseSBpdCBicmVha3MgZm9yIFJJU0MtVi4KPiA+ID4gPgo+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwgMTYgKysrKysrKysrKysrKystLQo+
ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMg
Yi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+ID4gPiA+IGluZGV4IDFjODNlNjhmODA1Yi4uOWFk
ZWJjNjNiZWE5IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4g
PiA+ID4gPiArKysgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+ID4gPiA+IEBAIC0xMzIyLDcg
KzEzMjIsMTMgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfaW50ZXJydXB0X21h
cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gPiA+ID4gICAgICAgICBhZGRyY2VsbHMgPSBv
Zl9idXNfbl9hZGRyX2NlbGxzKG5wKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIGltYXAg
PSBvZl9nZXRfcHJvcGVydHkobnAsICJpbnRlcnJ1cHQtbWFwIiwgJmltYXBsZW4pOwo+ID4gPiA+
ID4gLSAgICAgICBpZiAoIWltYXAgfHwgaW1hcGxlbiA8PSAoYWRkcmNlbGxzICsgaW50Y2VsbHMp
KQo+ID4gPiA+ID4gKyAgICAgICBpbWFwbGVuIC89IHNpemVvZigqaW1hcCk7Cj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiArICAgICAgIC8qCj4gPiA+ID4gPiArICAgICAgICAqIENoZWNrIHRoYXQgd2Ug
aGF2ZSBlbm91Z2ggcnVud2F5IGZvciB0aGUgY2hpbGQgdW5pdCBpbnRlcnJ1cHQKPiA+ID4gPiA+
ICsgICAgICAgICogc3BlY2lmaWVyIGFuZCBhIHBoYW5kbGUuIFRoYXQncyB0aGUgYmFyZSBtaW5p
bXVtIHdlIGNhbiBleHBlY3QuCj4gPiA+ID4gPiArICAgICAgICAqLwo+ID4gPiA+ID4gKyAgICAg
ICBpZiAoIWltYXAgfHwgaW1hcGxlbiA8PSAoYWRkcmNlbGxzICsgaW50Y2VsbHMgKyAxKSkKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ID4gPiA+ICAgICAgICAgaW1h
cF9lbmQgPSBpbWFwICsgaW1hcGxlbjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBAQCAtMTM0Niw4ICsx
MzUyLDE0IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnNlX2ludGVycnVwdF9tYXAo
c3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAoIWlu
ZGV4KQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHN1cF9hcmdzLm5w
Owo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBvZl9ub2RlX3B1dChzdXBfYXJn
cy5ucCk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgLyoKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgKiBBY2NvdW50IGZvciB0aGUgZnVsbCBwYXJlbnQgdW5pdCBpbnRlcnJ1cHQgc3BlY2lm
aWVyCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICogKGFkZHJlc3MgY2VsbHMsIGludGVycnVw
dCBjZWxscywgYW5kIHBoYW5kbGUpLgo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIGltYXAgKz0gb2ZfYnVzX25fYWRkcl9jZWxscyhzdXBfYXJn
cy5ucCk7Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIGJyZWFrcyBmb3IgUklTQy1WIGJlY2F1c2Ugd2Ug
ZG9uJ3QgaGF2ZSAiI2FkZHJlc3MtY2VsbHMiCj4gPiA+ID4gcHJvcGVydHkgaW4gaW50ZXJydXB0
IGNvbnRyb2xsZXIgRFQgbm9kZSBhbmQgb2ZfYnVzX25fYWRkcl9jZWxscygpCj4gPiA+ID4gcmV0
cmlldmVzICIjYWRkcmVzcy1jZWxscyIgZnJvbSB0aGUgcGFyZW50IG9mIGludGVycnVwdCBjb250
cm9sbGVyLgo+ID4gPgo+ID4gPiBUaGF0J3MgYSBmZWF0dXJlLCBub3QgYSBidWcuICNhZGRyZXNz
LWNlbGxzLCBBRkFJQ1QsIGFwcGxpZXMgdG8gYWxsCj4gPiA+IGNoaWxkIG5vZGVzIHVudGlsIHlv
dSBzZXQgaXQgb3RoZXJ3aXNlLgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhlIG9mX2lycV9wYXJz
ZV9yYXcoKSBsb29rcyBmb3IgIiNhZGRyZXNzLWNlbGxzIiBwcm9wZXJ0eQo+ID4gPiA+IGluIHRo
ZSBpbnRlcnJ1cHQgY29udHJvbGxlciBEVCBub2RlIG9ubHkgc28gd2Ugc2hvdWxkIGRvIGEKPiA+
ID4gPiBzaW1pbGFyIHRoaW5nIGhlcmUgYXMgd2VsbC4KPiA+ID4KPiA+ID4gVGhpcyBsb29rcyBt
b3JlIGxpa2UgYSBvZl9pcnFfcGFyc2VfcmF3KCkgYnVnIHRoYW4gYW55dGhpbmcgZWxzZS4KPiA+
Cj4gPiBJZiB3ZSBjaGFuZ2Ugb2ZfaXJxX3BhcnNlX3JhdygpIHRvIHVzZSBvZl9idXNfbl9hZGRy
X2NlbGxzKCkKPiA+IHRoZW4gaXQgd291bGQgc3RpbGwgYnJlYWsgZm9yIFJJU0MtVi4KPgo+IEkn
bSBub3QgdHJ5aW5nIHRvICJmaXgiIHJpc2N2LiBJJ20gbWVyZWx5IG91dGxpbmluZyB0aGF0IHlv
dSBhcmUKPiByZWx5aW5nIG9uIGJvdGggYnJva2VuIERUcyBhbmQgYSBidWdneSBPUy4KPgo+ID4K
PiA+IFVzaW5nIG9mX2J1c19uX2FkZHJfY2VsbHMoKSBvdmVyIGhlcmUgZm9yY2VzIGludGVycnVw
dCBjb250cm9sbGVyCj4gPiBEVCBub2RlcyB0byBoYXZlIGEgIiNhZGRyZXNzLWNlbGxzIiBEVCBw
cm9wZXJ0eS4gVGhlcmUgYXJlIG1hbnkKPiA+IGludGVycnVwdCBjb250cm9sbGVyIChlLmcuIFJJ
U0MtViBQTElDIG9yIFJJU0MtViBBUExJQykgd2hlcmUgdGhlCj4gPiBEVCBiaW5kaW5ncyBkb24n
dCByZXF1aXJlICIjYWRkcmVzcy1jZWxscyIgRFQgcHJvcGVydHkgYW5kIGV4aXN0aW5nCj4gPiBE
VFMgZmlsZXMgd2l0aCBzdWNoIGludGVycnVwdCBjb250cm9sbGVycyBkb24ndCBoYXZlIGl0IGVp
dGhlci4KPgo+IEl0IGZvcmNlcyB5b3UgdG8gc2V0ICNhZGRyZXNzLWNlbGxzICppZiB5b3UgcmVs
eSBvbiBhIGRpZmZlcmVudAo+IHZhbHVlIGluIGEgY2hpbGQgbm9kZSouIEl0J3Mgbm90IGxpa2Ug
dGhlIHNlbWFudGljcyBhcmUgbmV3LgoKV2UgZG9uJ3QgaGF2ZSBjaGlsZCBub2RlcyB1bmRlciB0
aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgRFQgbm9kZQooZm9yIGJvdGggUklTQy1WIFBMSUMgYW5k
IEFQTElDKSBzbyB3ZSBjZXJ0YWlubHkgZG9uJ3QgcmVxdWlyZSB0aGUKIiNhZGRyZXNzLWNlbGxz
IiBwcm9wZXJ0eSBpbiB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgRFQgbm9kZS4KCj4KPiA+Cj4g
PiBJbiB0aGUgUklTQy1WIHdvcmxkLCB0aGVyZSBoYXZlIGJlZW4gcXVpdGUgYSBmZXcgUUVNVSBy
ZWxlYXNlcwo+ID4gd2hlcmUgdGhlIGdlbmVyYXRlZCBEVCBub2RlIG9mIHRoZSBpbnRlcnJ1cHQg
Y29udHJvbGxlciBkb2VzIG5vdAo+ID4gaGF2ZSB0aGUgIiNhZGRyZXNzLWNlbGxzIiBwcm9wZXJ0
eS4gVGhpcyBwYXRjaCBicmVha3MgdGhlIGtlcm5lbAo+ID4gZm9yIGFsbCBzdWNoIFFFTVUgcmVs
ZWFzZXMuCj4KPiBDb25ncmF0dWxhdGlvbnMsIHlvdSd2ZSBmb3JrZWQgRFQuIE5ld3MgYXQgMTEu
CgpDYW4geW91IGVsYWJvcmF0ZSBob3cgPwoKPgo+ID4KPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIGFs
aWduIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBwYXJzZV9pbnRlcnJ1cHRfbWFwKCkKPiA+IHdpdGgg
b2ZfaXJxX3BhcnNlX3JhdygpIGFuZCB1c2Ugb2ZfcHJvcGVydHlfcmVhZF91MzIoKSBpbnN0ZWFk
IG9mCj4gPiBvZl9idXNfbl9hZGRyX2NlbGxzKCkuCj4KPiBJIHRoaW5rIHdlIHNob3VsZCBmaXgg
dGhlIGtlcm5lbCBhbmQgcXVpcmsgcmlzY3YgYXMgYnJva2VuLCBqdXN0IGxpa2UKPiBQUEMgb3Ig
c3BhcmMuCj4KPiAgICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhl
IG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
