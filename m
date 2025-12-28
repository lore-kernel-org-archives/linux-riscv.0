Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F456E92722
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 00:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DtbO049ORJT8kyL1slgMeSYF2PJz9eI9/wbShPqalU=; b=VLx3vIKoDWWl5v
	sEShpUTVwFu6uAuo+yHoqi/rky/Pmg4UsHxnAcBlzyTz4gucIwcxe5+sKTK6eqq3Tu7auYHKgJ0+U
	Q8ohBj4uwPTea86VXPjBNPBYbRPsK8qdzxA/loutrcgZ8qI8vNs3u0GB5p/wT8TNjx9PgBtGYsBIv
	dA01kFVetVkgf4d8okScs2mb6UppexcGIQIcGgTUpWI8FkZd7H+HVxy6Ku5Bq7t8IcxFmb2JOoWwI
	cEJAs2a6S/do6xSLZxYUIwB9fpGgH6fXkYxgVtBcBT5JZWwrVmPvw3yi4Tg2jGFpwtuW3oF4pHdA1
	aEXQAOaWFLAMaLVPFkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZesA-00000002Ize-3mz8;
	Sun, 28 Dec 2025 00:43:02 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZes8-00000002IzF-0u46
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 00:43:01 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78fc520433aso48471837b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 16:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766882579; x=1767487379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwhU6tz2IAJuOhbctHFHYJBwk5gc+cswNffBuQKQ3CU=;
        b=Lo97B5ejbfeRlhTNUXeNorOEo8V4Q1YNIxq3NydBcQ+6TNDdPKnsigO6DNp8rbbU4X
         eueBBkBkHaZk+BSIjExRSaE2qpazfiMnps389s6PpcMxEq4x0sNVFcjRH7P+3Y4nyeYF
         e7Ufwb/VApJdSGdVdZfvQrmCrMeJuU7lQMLTp61T5xfUrSI9DMvmbEzX0vzl04ebuV7c
         sfZAuSbROPSkR9q9scAQytgBeRcoBirFxCUHQ/NIxB1yLvBgsJYEvC0ZwcTfHI/N4E97
         jN3U5mNekPSKJUwDbXDkPc8FVf/Rz0F0gRgygpGJhA70NyWhMNIXmBG/cAibaS0mqXFH
         QsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766882579; x=1767487379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwhU6tz2IAJuOhbctHFHYJBwk5gc+cswNffBuQKQ3CU=;
        b=PlI0dKbMFLhEk72fixH6gZB5l3d+6uh9qA131nwLDuTEIAjf9PoN04UjRMgfe/5J74
         fZcw760BBqbE/jEMCj5EalF5LiQFWkZza7vDUz4STYJ/J/ViQwbmL7SvRh2InG8q+ghK
         vkq2GyTs1OYVqiB82/8qqrCUvcGzK9CTCrHzyqaANQDBv/+UM+Cv69xSGexAWlDip71v
         V73qOEW6ZBznZ8M42Qq/WoOr/C5r+0ekGr5x1GxGeRDB+1QcCnBwBwc4lV1RgWTJPqPa
         Y0B64y/k4nh/qhFSRvhYBzkHGNheoQN/wc9H0MpODPdcOVFIaV5Y4vLKn4YIVVb18NH6
         kydw==
X-Forwarded-Encrypted: i=1; AJvYcCX0fRdi9fdr467od3sWjoeMy7ku6snvhuw86qaZ/p90ynjTIfabeGi/CY0oHYjHp4qhHSE1o/j9eiBKZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7lwX4xFQR6L37SulAyd+Q/rkT4932vCykKByeHRNtOrnXJ0SY
	cXC5NrYojwc1o8DfGoU41EyCrK5LWHDAJC8XB7/aNJHrgTG24WopwiBbeeZ+c+v0TTciJcwor+1
	hF1/Kt+h20owK3jK6uLasbaWFbFNeCC2hS9LdP0wSCQ==
X-Gm-Gg: AY/fxX4Vu7s4rjPHoXu6TsTFZlxPzMAYHKXG8B5ydcSWgdkPWEtBjcEHndtT+DUqvl7
	+EA2AO48QIlqEXfa9tqsiabBE0Ge9MY2cB9Bxn815F4Ksxx+xJTDRXQfQZxrND8c2FbPmlWK4UP
	J51ZQFMZs5pC4mQLfh9yfOyPkYIJC7MrIDOi+4qaoeCfkH/TANpXZbpIqd6+LyZBQPXxdCNY/Fv
	robGkmikTQxc6VRbdzRJ0A8b7tlqXkcHBlQ3HDtcFSL8ozHxVNJ8F2o4k03/cLXJ6Djvpr0WPnu
	m3lB5H5o34lZvmiMN0kaPbCBsrNPlEd78DQLCsVdF2seUh0caHJ587Y=
X-Google-Smtp-Source: AGHT+IErlcXBgMih7zxAEH5xWwRllR/TKu/x3r4n41MRYEc1IKi6ZvbVG+UxUtBlusdkfkmh4FvWruwadgCeYqiXZ8Y=
X-Received: by 2002:a53:b178:0:b0:644:7712:ed72 with SMTP id
 956f58d0204a3-6466a874977mr19597372d50.43.1766882578983; Sat, 27 Dec 2025
 16:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com> <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com> <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
In-Reply-To: <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 08:42:47 +0800
X-Gm-Features: AQt7F2opxPHnMSK_AxzmQeemtfy8x4nXYU2M7Wsw2w8qZ6_eughd9bfR4C5SjDk
Message-ID: <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_164300_513312_EF817E8B 
X-CRM114-Status: GOOD (  16.35  )
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

SGksIEFuZGkKCk9uIFN1biwgRGVjIDI4LCAyMDI1IGF0IDM6MjbigK9BTSBBbmRpIFNoeXRpIDxh
bmRpLnNoeXRpQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgR3VvZG9uZywKPgo+IE9uIEZyaSwg
RGVjIDI2LCAyMDI1IGF0IDA3OjM4OjIyQU0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBP
biBGcmksIERlYyAyNiwgMjAyNSBhdCA1OjAx4oCvQU0gQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiArICAgICByc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2VydGVkKGRldiwgTlVMTCk7Cj4gPiA+ID4gKyAg
ICAgaWYgKElTX0VSUihyc3QpKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCBQVFJfRVJSKHJzdCksCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiZmFpbGVkIHRvIGFjcXVpcmUgZGVhc3NlcnRlZCByZXNldFxuIik7Cj4gPiA+
Cj4gPiA+IElmIHRoaXMgaXMgb3B0aW9uYWwsIHdoeSBhcmUgd2UgcmV0dXJuaW5nIHdpdGggZXJy
b3I/Cj4gPiA+Cj4gPgo+ID4gQWNjb3JkaW5nIHRvIGluY2x1ZGUvbGludXgvcmVzZXQuaCwgaWYg
dGhlIHJlcXVlc3RlZCByZXNldCBpcyBub3QKPiA+IHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRy
ZWUsIHRoaXMgZnVuY3Rpb24gcmV0dXJucyBOVUxMIGluc3RlYWQgb2YKPiA+IGFuIGVycm9yLiBU
aGVyZWZvcmUsIElTX0VSUihyc3QpIHdpbGwgb25seSBiZSB0cnVlIGZvciBhY3R1YWwKPiA+IGVy
cm9ycyAoZS5nIHByb2JlIGRlZmVycmFsKS4KPgo+IEFuZCB0aGlzIGlzIHF1aXRlIG9idmlvdXMs
IGJ1dCB5b3UgaGF2ZW4ndCBhbnN3ZXJlZCBteSBxZXN0aW9uLgo+Cj4gV2h5IGRvIHdlIGNhcmUg
b2YgaW50ZXJuYWwgZmFpbHVyZXMgaW4gcmVzZXQ/IElmIHJlc2V0IGZhaWxzIG9uCj4gYW4gb3B0
aW9uYWwgcmVzZXQgY29udHJvbCBmdW5jdGlvbiB3aHkgc2hvdWxkIHdlIGtpbGwgb3VyIGRyaXZl
cj8KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEkgc2VlIHlvdXIgcG9pbnQgbm93LgoK
TXkgcmVhc29uaW5nIGlzIHRoYXQgaWYgdGhlIHJlc2V0cyBwcm9wZXJ0eSBpcyBleHBsaWNpdGx5
IGxpc3RlZCBpbiB0aGUKRGV2aWNlIFRyZWUsIHRoZSBkcml2ZXIgbXVzdCByZXNwZWN0IGl0LiBJ
ZiB0aGUgcHJvcGVydHkgaXMgcHJlc2VudCBidXQKd2UgZW5jb3VudGVyIGFuIGVycm9yIChsaWtl
IC1FUFJPQkVfREVGRVIpLCBpZ25vcmluZyB0aGF0IGZhaWx1cmUgY291bGQKcHV0IHRoZSBoYXJk
d2FyZSBpbiBhbiB1bmRlZmluZWQgb3IgZGlydHkgc3RhdGUuCgo+IEp1c3QgaWdub3JlIHRoZSBl
cnJvciBhbmQgbW92ZSBmb3J3YXJkIGFzIHdlIGhhdmUgZG9uZSB1bnRpbCBub3cuCgpJIHdhbnQg
dG8gZG91YmxlLWNoZWNrIHdoYXQgeW91IG1lYW4uCgpJIGNoZWNrZWQgb3RoZXIgZHJpdmVycyBp
biBkcml2ZXJzL2kyYy9idXNzZXMgKGUuZy4gaTJjLXJpaWMuYywgaTJjLW12NjR4eHguYywKaTJj
LWRlc2lnbndhcmUtcGxhdGRydi5jKSwgYW5kIHRoZXkgc2VlbSB0byBmb2xsb3cgdGhpcyBwYXR0
ZXJuIG9mIHJldHVybmluZwplcnJvcnMgZXZlbiBmb3Igb3B0aW9uYWwgcmVzZXRzLgoKQlIsCkd1
b2RvbmcKCj4KPiBJZiB0aGUga2VybmVsIGlzIHN1ZmZlcmluZyBmcm9tIGludGVybmFsIGZhaWx1
cmVzIChzYXkgRU5PTUVNKSwKPiBpdCB3aWxsIGZhaWwgYW55d2F5IG9yLCB3aXRoIHNvbWUgbHVj
aywgcmVjb3Zlci4KPgo+IEFuZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
