Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709FC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=H7TyRw3GVpviKVofQbCHEmwihIqJUVwNh2hXlgvufwo=; b=AWwDX7ix2QcQT6Ubh9PJhhDiUn
	sZyEDcHWlxNGV6DTYlvIsnQRGToNXrTkiayUG+kZw9i6FHO0lHO7EHSE/tG3zlam/zGKU6MDDkPgB
	qNLyEJi5J+gwpmvTt5A78GXvhVoWG4J1MIcg8ozHrQbZiQrvIO0ucwcbnfh2FJ/cFZizQQD9DD9Gv
	VDJg4cw7GiQfY1PpWDitcNg5JFl24bEnytscc0SbntYvXJzxVSUQmHQSpQaKq8LzLCV/2t6g9cevA
	5UbHS4WaoM7dru5zqSdE1YTXe0nhsz269b7LKAKP9m06uqe6f0J72ClcHq7xa5C1j+aM8I0TyqkQp
	W7kk9KkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE2Q-00000006UaN-0Q0q;
	Tue, 26 Mar 2024 21:08:54 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE2M-00000006UYQ-1WqH
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 21:08:52 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e0878b76f3so1987985ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711487329; x=1712092129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVy3Hz+QglZLXZjgfs9SD4hjFJzSIhc79fs9r0XUwbg=;
        b=ZdELHO5afF67X1c6azTGpwu0txiTNW+G7ycEbZmIFpUrkex3XYf2PS2pVcWKbKRQR0
         XVLD2UfSMszWg1s/ysbh0Jhl7wBs/TIEnPRSAdUoW4Or3Iu6+iLHXX/FU6X6EU7gxsjr
         pZRLoN1uHXJATvWFrBRP37gq7zfpxKXMIGzrVu31cQkXm8xWecWzSTDcfvJDtfdKT8x+
         QJHcosQes+/ouayFaIkyfQJXFw5aLXoMmV3LLJEazl+Aslu/N5BepTI9qxR3d455qQeD
         4UV/I+wOTLp3fnJY22FLJ713rV+13zkKArHQPn+vLwjf53c9QP0m7lPx8fcoS5m2oTVE
         gYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711487329; x=1712092129;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVy3Hz+QglZLXZjgfs9SD4hjFJzSIhc79fs9r0XUwbg=;
        b=n+wmBa2R0NuNNwGZEHjo6Q2lRNVDkBU1G+fKOumVM5MLs9phIA/siMgRqwwxA/Kskx
         4hjWZN/sRJKp4R8aK74cOiPRuGCiWReMINFbWSlnAcejYGgm0RkOBTREbpGn4Z/gAxzW
         NIm/6uYJ3JpOY+qW0aujMfYSptqmfKfQ/q79Wz388ppAUquVm8kr/MmtYuHzGMZzv3Yf
         b0IDzXcTsbVpPq8A7Cd0lHiYkjNOaRPU2NHkqIRPEDDRTgtZ8SS7L4R0qbI0HH/pqrsC
         lJgZLCEezy9lyzAMhhtditjpfuvKQr80C9rVOYbZURqfBAJGkPfIHUFAN2E3qpaImM8Z
         RU6A==
X-Forwarded-Encrypted: i=1; AJvYcCXbUel5nBfAu2px8b1N8f6ZXtnvcvygeqoX/od7exYAdnb+t0KhfqQ1qQCvFR+ZYHnfhQKZ/v/a2M6NNr4MWs/boUdGKc5x+FLt25XAQhUY
X-Gm-Message-State: AOJu0YzdknWSxDdkT6e6CT02nthmiHvUzj0Krqh9cyiOPbTkA3hkpkoK
	OUvnxDOrvWKqU6u8Y6QQn85TnB/xYNoLqEpeOGG4b+a00C+4pLL73UUXXsnjuLo=
X-Google-Smtp-Source: AGHT+IF2HPw5BzRQJFPhKRUTLLZBWnEaNhZE1YFQ07t8V46j4F5D2XT2+2Uu9b87tXUa1tSe4tum4w==
X-Received: by 2002:a17:902:da88:b0:1e0:b5f1:aac2 with SMTP id j8-20020a170902da8800b001e0b5f1aac2mr3519934plx.10.1711487328512;
        Tue, 26 Mar 2024 14:08:48 -0700 (PDT)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id v13-20020a170902f0cd00b001e09c35e058sm7324705pla.195.2024.03.26.14.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 14:08:46 -0700 (PDT)
Date: Tue, 26 Mar 2024 14:08:46 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Mar 2024 14:08:39 PDT (-0700)
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
In-Reply-To: <1a1bf141-9fbf-4d30-bdd3-fd20f6170c3f@ghiti.fr>
CC: masahiroy@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-db45f75f-4c54-4ade-9c88-cfd6015a9203@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_140850_572307_18A36822 
X-CRM114-Status: GOOD (  23.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxOCBNYXIgMjAyNCAxMzo1Mzo0MiBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSBNYXNhaGlybywKPgo+IE9uIDE1LzAzLzIwMjQgMDU6MDYsIE1hc2FoaXJvIFlh
bWFkYSB3cm90ZToKPj4gT24gVGh1LCBNYXIgNywgMjAyNCBhdCA1OjEy4oCvQU0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+IEhpIE1hc2FoaXJvLAo+Pj4KPj4+IE9u
IDI0LzAyLzIwMjQgMDQ6MzcsIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPj4+PiBQaW5nIHggMiA/
Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IE9uIFN1biwgSmFuIDIxLCAyMDI0IGF0IDY6
NDjigK9BTSBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPj4+
Pj4gT24gRnJpLCBOb3YgMTcsIDIwMjMgYXQgOTo1OOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFz
YWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4gJ21ha2UgdmRzb19pbnN0YWxsJyBpbnN0
YWxscyBkZWJ1ZyB2ZHNvIGZpbGVzIHRvIC9saWIvbW9kdWxlcy8qL3Zkc28vLgo+Pj4+Pj4KPj4+
Pj4+IE9ubHkgZm9yIHRoZSBjb21wYXQgdmRzbyBvbiByaXNjdiwgdGhlIGluc3RhbGxhdGlvbiBk
ZXN0aW5hdGlvbiBkaWZmZXJzOwo+Pj4+Pj4gY29tcGF0X3Zkc28uc28uZGJnIGlzIGluc3RhbGxl
ZCB0byAvbGliL21vZHVsZS8qL2NvbXBhdF92ZHNvLy4KPj4+Pj4+Cj4+Pj4+PiBUbyBmb2xsb3cg
dGhlIHN0YW5kYXJkIGluc3RhbGwgZGVzdGluYXRpb24gYW5kIHNpbXBsaWZ5IHRoZSB2ZHNvX2lu
c3RhbGwKPj4+Pj4+IGxvZ2ljLCBjaGFuZ2UgdGhlIGluc3RhbGwgZGVzdGluYXRpb24gdG8gc3Rh
bmRhcmQgL2xpYi9tb2R1bGVzLyovdmRzby8uCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
TWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KPj4+Pj4+IC0tLQo+Pj4+PiBQ
aW5nPwo+Pj4+PiAoaW4gY2FzZSAieWV0IG1vcmUgUklTQy1WIHVwZGF0ZXMiIGhhcHBlbnMpCj4+
Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+PiAgICBhcmNoL3Jpc2N2L01ha2VmaWxlIHwgMiAr
LQo+Pj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jp
c2N2L01ha2VmaWxlCj4+Pj4+PiBpbmRleCBhNzRiZTc4Njc4ZWIuLjVjYmU1OTYzNDVjMSAxMDA2
NDQKPj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4+Pj4+ICsrKyBiL2FyY2gvcmlz
Y3YvTWFrZWZpbGUKPj4+Pj4+IEBAIC0xNDYsNyArMTQ2LDcgQEAgZW5kaWYKPj4+Pj4+ICAgIGVu
ZGlmCj4+Pj4+Pgo+Pj4+Pj4gICAgdmRzby1pbnN0YWxsLXkgICAgICAgICAgICAgICAgICs9IGFy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5zby5kYmcKPj4+Pj4+IC12ZHNvLWluc3RhbGwtJChD
T05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vY29tcGF0X3Zk
c28uc28uZGJnOi4uL2NvbXBhdF92ZHNvL2NvbXBhdF92ZHNvLnNvCj4+Pj4+PiArdmRzby1pbnN0
YWxsLSQoQ09ORklHX0NPTVBBVCkgICs9IGFyY2gvcmlzY3Yva2VybmVsL2NvbXBhdF92ZHNvL2Nv
bXBhdF92ZHNvLnNvLmRiZwo+Pj4+Pj4KPj4+Pj4+ICAgIGlmbmVxICgkKENPTkZJR19YSVBfS0VS
TkVMKSx5KQo+Pj4+Pj4gICAgaWZlcSAoJChDT05GSUdfUklTQ1ZfTV9NT0RFKSQoQ09ORklHX0FS
Q0hfQ0FOQUFOKSx5eSkKPj4+Pj4+IC0tCj4+Pj4+PiAyLjQwLjEKPj4+Pj4+Cj4+Pj4+IC0tCj4+
Pj4+IEJlc3QgUmVnYXJkcwo+Pj4+PiBNYXNhaGlybyBZYW1hZGEKPj4+Pgo+Pj4+IC0tCj4+Pj4g
QmVzdCBSZWdhcmRzCj4+Pj4gTWFzYWhpcm8gWWFtYWRhCj4+Pj4KPj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+Pj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+Pgo+Pj4g
Q291bGRuJ3QgY2hhbmdpbmcgdGhpcyBsaWJyYXJ5IGluc3RhbGwgcGF0aCBicmVhayBzb21lIGV4
aXN0aW5nCj4+PiBhcHBsaWNhdGlvbj8gSSBtZWFuIGl0IGtpbmQgb2YgYnJlYWtzIHdoZXJlIHRo
ZSBsaWJyYXJ5IGlzIGV4cGVjdGVkIHRvCj4+PiBiZSByaWdodD8KPj4KPj4gRG8geW91IGhhdmUg
YSBwYXJ0aWN1bGFyIGxpYnJhcnkgaW4gbWluZD8KPgo+Cj4gTm9uZSBpbiBwYXJ0aWN1bGFyLgo+
Cj4KPj4KPj4KPj4gUklTVi1WIGlzIHRoZSBvbmx5IGFyY2hpdGVjdHVyZSB0aGF0IGluc3RhbGxz
IGEgZGVidWcgdmRzbwo+PiB0byBhIGRpZmZlcmVudCBsb2NhdGlvbiB0aGFuIHRoZQo+PiBzdGFu
ZGFyZCBsaWIvbW9kdWxlcy8qL3Zkc28vLgo+Pgo+Pgo+PiBJIHJlZ2FyZCB0aGlzIGFzIGEgZml4
Lgo+Cj4KPiBZb3UncmUgcHJvYmFibHkgcmlnaHQsIEkgZG9uJ3Qgc2VlIHdoeSB0aGUgc2VhcmNo
IHBhdGggd291bGQgYmUKPiBkaWZmZXJlbnQgb24gcmlzY3YsIHVubGVzcyBpdCB3YXMgZml4ZWQg
aW4gdXNlcnNwYWNlIGJ1dCBJIHRoaW5rIHRoaXMgaXMKPiB0aGUgcmlnaHQgdGhpbmcgdG8gZG8s
IHNvOgoKV2UgZG8gaGF2ZSBzb21lIHdlaXJkbmVzcyB3aXRoIG11bHRsaWIgcGF0aHMsIGJ1dCBJ
IGRvbid0IHRoaW5rIHRoYXQncyAKcmVsYXRlZCB0byB0aGUgVkRTTyBwYXRocy4KCj4KPiBSZXZp
ZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Cj4gVGhh
bmtzLAo+Cj4gQWxleAo+Cj4KPj4KPj4KPj4KPj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
