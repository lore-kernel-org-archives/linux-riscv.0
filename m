Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA2C61DBD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyaO8aVwApp34KDzlBIenUKhZomdi5Bh50CiLgwI2nk=; b=NSeykv+8VaTvds
	UY6wf3QQw/EWvuozfG8FtIkNCjuw7od3BbgaeMAVdm0e1Pa0XhzsgaqwIPhwkj1GbILLxu2n1uQgF
	dUsEYAIxBxf/vR8mFSnfpZt9QCStp7nNmBBpbj+jiwexVWbOO7Y23Pj/inWamGRkk57DCClPv7lVe
	sI8zkiQLeWlQunONVDyxn6P/s/Wm0CAejPRuxX64P+faE54y/2rcEBRSxC1fearfmJFQADG4nT6WI
	HRTMm3MFxr1hG46+srw6m5wnDOqhmHBIJW255/pZrrPcM5d1lP1BjFbeCDmRXO/yzhGNl7sZP5Nii
	PKWR0aVfEPTTjYKqUBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwdx-00000005p8s-41aX;
	Fri, 28 Aug 2026 13:29:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwdv-00000005p8N-3rYQ
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 13:29:17 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5b4afb31f42so158787e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 06:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923753; cv=none;
        d=google.com; s=arc-20260327;
        b=Ow5p7NlKB8uO5Z6lKexigaX8hUczP2ZnfM6v6nmBOttCrxWsxKhhIrapobLiQhS2Ox
         9ZOSYwRu6LdwoTw3lND78qzSnVbSzw6jr2WPLIdMmkJXzQmey5sQzeB07DozSZPGOCAM
         pyWUlVyEnJfnCVYeHx2Nn7lNOTp29kinppdZnj9wFUtcPgyyYStkLOv603MEr5bVZIKm
         2Xc26T9D2gG+zW3xJTE0Pg99++k8Iec7r6sYtSPI0XF+8J+JoyNBFyrFZRjSKgBoGdbI
         /J+BCheWkn0gyM+vFjB8/V5pnkRs/NYw1qtebYCuUkNLOud7exzw28ATQncaUHtBzNBN
         Cc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        fh=hl1/t5vLnw+V0P1EV1EQKmDozYNy1BLxwv+U6QmhJlw=;
        b=nDfiZyS/dT6J8k1kj8mGoTQ/LVRZaeIQ8dUww+NpNCMxqlt7BhfksTHpQ+VD4/v50Z
         xO/7+V9lQos7IRJT1FfGfYF3qN3/uNvsuNuxkQVA59d/fmLjZjyfCjKNOyJsLS76A5Kl
         aukikcTnQcCGPMBAsajMamgrfPlYGzLgOGpQ1fO8JRHGLs2Vl426B60uHsEhrDdW2XbC
         04O+mhEH9pdGJT0i0iHXvEoJRaaxzuPu/JvrexUfiPYeengc/sZzTAf67O8xO1DKb1zV
         k91qfmXjW6BrEx6ezsfnY3PBOC+9fOv0n09XaS8p/QbMuA40y3mdJn81jPRMKkKCl9Ay
         qirw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923753; x=1788528553; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=kIXiNW4s8lUL8joKcVCl1/eT4mYDHNzf5qMjX0JS0JYWayfE9AQoUSaNRa2N4uunyd
         2HHD1Y9Gg5jAXPR0lPYoEVKGuIOY6zfEKINblRCm1gibiV5MMK7TS4KYuWa86JwH/LAu
         PXNuHcJDBQZRZyC4p4rsykHNPxzUjW9fo14r0fGOjQzFo/P7ooobmIxjFtlrDX9e0BBl
         1ABbuyV9Kq1rGK7bp6otgUujI3xJJjT+aIe+8+jamb2AyPOKNx1R9oLisKeCaYbAjB3w
         Ro0wyOCQd8O7onrxot/UDtJHE5MIYW7lCmNaTv2f795aL44Rk9pB9sMg3oFRlmulP2aV
         /9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923753; x=1788528553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=VZUYjRcLbden8Ms1Mv5a5XERHvteHsaCuhYdjX+hPvwRIQAlstzYy5HfjdFp9cbKaa
         DaZH2ejf5PeaGlNZoP/V+n2zLzhPihb943qkvY3XacqC05ZLHFVarG9tz1PXa3nn60em
         JBuJ5IgtzB2EVTeRp+6s2zuBowHrwccLjZg8LNKbG7OISDmWP3Mqw9QQkE+6iTM/gWqe
         Nyz7ULeGrTaIvGA3xlk5WvsO373B4ekjN7p5GpWM54TQiqUEXjJtapQBDTLj8zYGork4
         oaMqEO43uBOl944isa2HPkUwWm2/cQ4Gys9JDr5JnRc7HJXwACNi5oWXC5D0tLq3ylYF
         ey5w==
X-Forwarded-Encrypted: i=1; AHgh+RoWgUXleNHIvp+E04537tgsvlYaP4ttpY0l3Xkr+PxU2L20nHLVOw0Jez0IOXzxE0aFBUW5FXKeiMcDlw==@lists.infradead.org
X-Gm-Message-State: AFuF++nh7+ucMwBTzqW8YRMCKAD8mAtoShl7dh1kBU0+l0U79Q/zRusl
	g9NjUjx66kpcp8tcfNozFMlEXozLdc4my7lEhwVq/3aZaC7i3vBQFBIwMrC9YHtNjACOyGcyBc+
	U2VRsWM0iK/PWWJ3MwGrxNMy9s5y8V7w=
X-Gm-Gg: AR+sD102Tt/L8lnCdIXCOvqNX9FqwljYGrL7gGhBRMBt/Ie/4R7vut7E71UTfPnOTxS
	A5Zkw4XxX+0Z5IPLyLaxjScT9Tw4fYUboancGX91cMltNlQ7rf55lJLqQ1+8cmObVx4lI5EMDLR
	ONknAVRvJPklz8nXTmivH2ix7qBCuSCXJZWQZ/suvx26UDiV+IguVoZe7PHKnG1LaRMCgrkwvFI
	Jmy4LYik7o02HslUIU7mE4hw7WUiQSsoz5MKd8PxuzQ7Zg9touGf61MktMTcANIicKcrjT+AeeM
	s3TEa/E77oerTZ1flaBfesHAW/f8LktIKyUhLcJg1L3ddZsSgxJR7y0H4ULgzfjngf7qLPIV6qV
	4ZuLKwcDKrMRYhkE8dO4SvM5zK6Y=
X-Received: by 2002:a05:6512:2350:b0:5b5:e0e9:78c7 with SMTP id
 2adb3069b0e04-5b5e6b2d23amr860942e87.3.1787923752502; Fri, 28 Aug 2026
 06:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260803163323.74414-1-chenyou910331@gmail.com> <aokFbP7wArV58T9E@inochi.infowork>
In-Reply-To: <aokFbP7wArV58T9E@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:29:00 +0800
X-Gm-Features: AcwNN1Vyq3bOlIovVS7iwVPmCuDz9-szJAlLvnMYLT0vFzTw2H-zmqYHijMwS14
Message-ID: <CAKspUhJ-xxkptgSJMQUCNv4ADBJrSLOW4CzpKm8OoVy1ukT9qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_062915_993106_103F6588 
X-CRM114-Status: GOOD (  24.37  )
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

T24gU2F0LCBBdWcgMjIsIDIwMjYgYXQgMTA6MTU6WFggKzA4MDAsIElub2NoaSBBbWFvdG8gd3Jv
dGU6Cj4gVGhpcyBpcyBub3QgYWNjZXB0YWJsZSwgSSBhZ3JlZSB3aXRoIHNvbWV0aGluZyBsaWtl
IERUIG92ZXJsYXkgZm9yCj4gc3VwcG9ydCBleHRlcm5hbCBJTyBib2FyZCB0byBlbmFibGUgdGhp
cy4gQnV0IHlvdSBzaG91bGQgbm90IGVuYWJsZQo+IHRoaXMgYnkgZGVmYXVsdC4gQXMgb3RoZXIg
bWF5IHdhbnQgdG8gdXNlIHRoaXMgYXMgR1BJTy4KCllvdSBhcmUgcmlnaHQsIGFuZCBJIHNob3Vs
ZCBoYXZlIGNhdWdodCB0aGlzIG15c2VsZiAtLSB0aGUgc2lnbmFscyBvbmx5CmdvIHRvIHRoZSBS
SjQ1IG9uIHRoZSBvcHRpb25hbCBJTyBib2FyZCwgc28gZW5hYmxpbmcgdGhlbSBpbiB0aGUgYm9h
cmQKRFRTIHRha2VzIHRoZSBwaW5zIGF3YXkgZnJvbSBhbnlvbmUgd2hvIHdhbnRzIHRoZW0gYXMg
R1BJTy4gVGhhbmtzIGZvcgpzdG9wcGluZyBpdC4KCkkgd2lsbCByZXdvcmsgdGhpcyBhcyBhIERU
IG92ZXJsYXkgZm9yIHYyOiB0aGUgYm9hcmQgRFRTIGtlZXBzIHRoZSBHTUFDCmFuZCBNRElPIG11
eCBkaXNhYmxlZCwgYW5kIGEgc2VwYXJhdGUgLmR0c28gZW5hYmxlcyB0aGVtIGZvciB0aGUgVVNC
ICYKRXRoZXJuZXQgSU8gYm9hcmQgWzFdLgoKT25lIHRoaW5nIGJlZm9yZSBJIHNlbmQgaXQ6IEkg
ZG8gbm90IGhhdmUgdGhlIElPIGJvYXJkIHlldCwgd2hpY2ggaXMgd2h5CnYxIHNhaWQgbGluay11
cCB3YXMgdW52ZXJpZmllZC4gSSBoYXZlIG9yZGVyZWQgb25lLCBzbyB2MiB3aWxsIGNvbWUgd2l0
aAphbiBhY3R1YWwgbGluay11cCBhbmQgaXBlcmYzIHJlc3VsdCByYXRoZXIgdGhhbiBqdXN0ICJ0
aGUgUEhZIGlzCmRldGVjdGVkIi4gSSB3b3VsZCByYXRoZXIgc2VuZCBpdCB0ZXN0ZWQgdGhhbiBz
ZW5kIGl0IHNvb24uCgpbMV0gaHR0cHM6Ly9taWxrdi5pby9kb2NzL2R1by9pby1ib2FyZC91c2It
ZXRoZXJuZXQtaW9iCgpDaGVuLVl1CgpJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29t
PiDmlrwgMjAyNuW5tDjmnIgyMuaXpemAseWFrSDkuIrljYgxMDoxM+Wvq+mBk++8mgo+Cj4gT24g
VHVlLCBBdWcgMDQsIDIwMjYgYXQgMTI6MzM6MThBTSArMDgwMCwgQ2hlbi1ZdSBZZWggd3JvdGU6
Cj4gPiBUaGUgU0cyMDAyIGhhcyBhbiBpbnRlcm5hbCBldGhlcm5ldCBQSFksIGJ1dCBvbiB0aGUg
TWlsay1WIER1byAyNTZNIHRoZQo+ID4gZXRoZXJuZXQgc2lnbmFscyBhcmUgb25seSByb3V0ZWQg
dG8gdGhlIFJKNDUgY29ubmVjdG9yIG9mIHRoZSBvcHRpb25hbAo+ID4gSU8gYm9hcmQuCj4gPgo+
ID4gRW5hYmxlIHRoZSBHTUFDIGFuZCB0aGUgTURJTyBtdWx0aXBsZXhlciBzbyB0aGF0IHRoZSBp
bnRlcmZhY2UgaXMgdXNhYmxlCj4gPiB3aGVuIHN1Y2ggYSBib2FyZCBpcyBhdHRhY2hlZC4KPiA+
Cj4gPiBUZXN0ZWQgb24gYWN0dWFsIE1pbGstViBEdW8gMjU2TSBoYXJkd2FyZTogdGhlIEdNQUMg
cHJvYmVzLCB0aGUgTURJTwo+ID4gbXVsdGlwbGV4ZXIgc2VsZWN0cyB0aGUgaW50ZXJuYWwgYnVz
IGFuZCB0aGUgaW50ZXJuYWwgRVBIWSBpcyBkZXRlY3RlZAo+ID4gYXQgYWRkcmVzcyAxOgo+ID4K
PiA+ICAgZXRoMDogUEhZIFttZGlvX211eC0wLjA6MDFdIGRyaXZlciBbR2VuZXJpYyBQSFldCj4g
Pgo+Cj4gPiBMaW5rLXVwIHdhcyBub3QgdmVyaWZpZWQgZm9yIGxhY2sgb2YgdGhlIElPIGJvYXJk
Lgo+ID4KPgo+IFRoaXMgaXMgbm90IGFjY2VwdGFibGUsIEkgYWdyZWUgd2l0aCBzb21ldGhpbmcg
bGlrZSBEVCBvdmVybGF5IGZvcgo+IHN1cHBvcnQgZXh0ZXJuYWwgSU8gYm9hcmQgdG8gZW5hYmxl
IHRoaXMuIEJ1dCB5b3Ugc2hvdWxkIG5vdCBlbmFibGUKPiB0aGlzIGJ5IGRlZmF1bHQuIEFzIG90
aGVyIG1heSB3YW50IHRvIHVzZSB0aGlzIGFzIEdQSU8uCj4KPiBSZWdhcmRzLAo+IElub2NoaQo+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5jb20+
Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDItbWlsa3YtZHVv
MjU2bS5kdHMgfCA4ICsrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDIt
bWlsa3YtZHVvMjU2bS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDItbWls
a3YtZHVvMjU2bS5kdHMKPiA+IGluZGV4IGEyNzk3YzBiZDc2Ny4uMTQ2MmE5NmExYzEyIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAyLW1pbGt2LWR1bzI1
Nm0uZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDItbWlsa3Yt
ZHVvMjU2bS5kdHMKPiA+IEBAIC00OSw2ICs0OSwxNCBAQCBjb3Byb2Nlc3Nvcl9ydG9zOiByZWdp
b25AOGZlMDAwMDAgewo+ID4gICAgICAgfTsKPiA+ICB9Owo+ID4KPiA+ICsmZ21hYzAgewo+ID4g
KyAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiArJm1kaW8gewo+ID4gKyAg
ICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiAgJm9zYyB7Cj4gPiAgICAgICBj
bG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ID4gIH07Cj4gPgo+ID4gYmFzZS1jb21taXQ6
IDExODgxMDQxYjc0NWI0NDRlNGY2Yzg3YTI3NDhmMTk1MWNmMDI3NDIKPiA+IC0tCj4gPiAyLjQz
LjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
