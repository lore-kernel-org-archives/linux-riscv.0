Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B77BC5B549
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 01:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oQKrtpUe5uJ/s8YoLjxMCpv8zaBE+OkXiXv3QfIR+w=; b=PpPq9Ko5GwXsdn
	1ozcLcTnrIk+XSh7rhKdu8ZW0FnzHxCalG9BovLCRIqHQ2qJrdqHdhLm3+p3Cet4fvqmlgj5KlVMC
	UrCJ+oyTwrDNo8JdCeTGC/OHYFOPTgTwTFl44PDcv2o+JFEgtdBBGseFE4eFs/ZSJDAzsIuHt5n1Q
	vlIqsfKagCT5xVoql5RT2W5Qzuo74gmmmRNZf+xpVCCn1KxzH5a6k9K6mbK5gNYqdSLl02qZ8Y8AJ
	ukQ6ZVzg0ksJLbleAcp6Fhe+QCuFhtgcxv1umMthbmHqmWg3sFfFyU6yVghipFM74uDDh0wcQEwqV
	gJYJA6tUvJdmXNdorvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMGlO-00000009VNP-196H;
	Tue, 03 Jun 2025 01:48:26 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMGlL-00000009VMu-1rgC
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 01:48:24 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-86a55400875so423557839f.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748915302; x=1749520102; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smS8EjzcSloRPTQYvaADW34JGEeBewBx/Qxmpo51PM0=;
        b=VosSbYgIMYYBi71Ib3z9eQwX2qOEdLZrpMZlk04L1NXmjbViKpV0ZAS4uLIXfVQ+H7
         IDwLZXLS/Sk77bNSSuE6p5+52Wjcb6ToOYPFxmcsdovpFcql/AOUXzN7FDqLg9iss4j2
         mUjvqT994Y2Hxpwgq1fBqvmt0TnhwML6m7M9fbPfbLK/Zb9fXxmeA3zeAMVg9omfzgIz
         Q/N8ZVGxtgNXxEvaINy4H3REdnG4XjwdqnTdi9C2QWRiDsz7EDRLsJ4XCPW+FaKe6ysX
         5hGjQlLXb8XqhvbVrP07JL+Xi242zdrLLJWlgAd2eeLL9RSsZtbmQ+zghYprvvHhoyje
         dZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748915302; x=1749520102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smS8EjzcSloRPTQYvaADW34JGEeBewBx/Qxmpo51PM0=;
        b=rUb9zECTNg6xuYJDz+o36fayZ3HWE9IJKmCjAGNoIQTaKmWzecyHeqKTpePXroS7mV
         OtSgcax4ggDu2O+D0m/qRnU3gMvLFoMj2pHOx/M/cXobxu2fEQrGWLQx10JvtYP1uwA7
         nFck4fht3z6OOVb+AviiclH9j9tVsjEgcKQJR577HhEL/ZhQqCT8tgYU9bbHelSCdMO7
         gGYtxhxrEOqZL61lD/dnJ2dLd11eMTgcBRhcu0igxRVszf9yW52H3xqYvlGUhpWcPSFc
         oKlV97TFAphzxjo3mpd9pyw5yK7uRW7kOB/wvS0YaZ3Gq+BxJSA0vnL+wCzcUSTj2do/
         GA7g==
X-Forwarded-Encrypted: i=1; AJvYcCVP89cV6au8YKS1j6S+Y/dRK5szC32msIqoXKsM5R7XscXRNFj+2tRV4F7oSFOH9rbaLwlbiPYTJ6R6rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFHD/mOciMeyxBZB4WyMfxm9trOYk//M8gEGSWS8YAdCQgdCfz
	qfA3kI/oUT1y+rxpdNN+o82XOnAitPq4n4SlrwQd+MONAkR9ckAJArmberAHeAqhB1By2scigHK
	dztnNC/AA35J2Qvx3cP8S8oXUJGEWE/2BX8H7yLS1jA==
X-Gm-Gg: ASbGncufZq6CxgUREA1JoAwk6Fxe9+TfVcjpTLUzifywZh31CMdGSqmq9TyyfbeNgGt
	FyL9wo9+ij1y6C5fWKsgAYz9Oo+70P3kG3DodJ6CwLFOClDvZCcsUGwZUnZ96n/Qgia0YDD8xhR
	2ihYMyP3ckrDUdwG/xpM6NfkB2cOccl01hVFurMUJClgqw3g==
X-Google-Smtp-Source: AGHT+IFuF/DDjoIRyOOg6n9S1MKOJe4FFEYA3jligAcELhRoJ6MxOU7E4D0SYHCcB1pFVLyWGxF3fvY4DpN/lsFVfjA=
X-Received: by 2002:a05:6602:4c85:b0:85a:e279:1ed6 with SMTP id
 ca18e2360f4ac-86d000fdd75mr1579564939f.11.1748915301709; Mon, 02 Jun 2025
 18:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250314092614.27372-1-zong.li@sifive.com> <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
In-Reply-To: <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 3 Jun 2025 09:48:08 +0800
X-Gm-Features: AX0GCFs480sGOOGNrguQ_lvoEsdO09nxDNbdUj7rtRkPH6awWaFU0LfDZJKnIyY
Message-ID: <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com>
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_184823_550184_6EA397FD 
X-CRM114-Status: GOOD (  22.72  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCAxMjo1MOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFpvbmcsCj4KPiBUaGFua3MgZm9yIHRha2luZyB0aGUg
aW5pdGlhdGl2ZSBmb3IgbWFraW5nIGNmaSB3b3JrIHdpdGggdXByb2JlLgo+IEFuZCBzb3JyeSBm
b3Igbm90IG5vdGljaW5nIHRoZSBwYXRjaCBlYXJsaWVyLgo+IEZldyBjb21tZW50cyBpbmxpbmUu
Cj4KPgo+IE9uIEZyaSwgTWFyIDE0LCAyMDI1IGF0IDA1OjI2OjE0UE0gKzA4MDAsIFpvbmcgTGkg
d3JvdGU6Cj4gPkhhbmRsZSB0aGUgdXByb2JlIGV2ZW50IGZpcnN0IGJlZm9yZSBoYW5kbGluZyB0
aGUgQ0ZJIHZpb2xhdGlvbiBpbgo+ID5zb2Z0d2FyZS1jaGVjayBleGNlcHRpb24gaGFuZGxlci4g
QmVjYXVzZSB3aGVuIHRoZSBsYW5kaW5nIHBhZCBpcwo+ID5hY3RpdmF0ZWQsIGlmIHRoZSB1cHJv
YmUgcG9pbnQgaXMgc2V0IGF0IHRoZSBscGFkIGluc3RydWN0aW9uIGF0Cj4gPnRoZSBiZWdpbm5p
bmcgb2YgYSBmdW5jdGlvbiwgdGhlIHN5c3RlbSB0cmlnZ2VycyBhIHNvZnR3YXJlLWNoZWNrCj4g
PmV4Y2VwdGlvbiBpbnN0ZWFkIG9mIGFuIGVicmVhayBleGNlcHRpb24gZHVlIHRvIHRoZSBleGNl
cHRpb24KPiA+cHJpb3JpdHksIHRoZW4gdXByb2JlIGNhbid0IHdvcmsgc3VjY2Vzc2Z1bGx5Lgo+
ID4KPiA+Q28tZGV2ZWxvcGVkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4K
PiA+U2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gPlNp
Z25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+LS0tCj4gPgo+ID5U
aGlzIHBhdGNoIGlzIGJhc2VkIG9uIHRvcCBvZiB0aGUgZm9sbG93aW5nIHNlcmllcwo+ID5bUEFU
Q0ggdjExIDAwLzI3XSByaXNjdiBjb250cm9sLWZsb3cgaW50ZWdyaXR5IGZvciB1c2VybW9kZQo+
ID4KPiA+IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCA5ICsrKysrKy0tLQo+ID4gMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Ywo+ID5pbmRleCAzZjc3MDlmNDU5NWEuLmVmNWE5MjExMWVlMSAxMDA2NDQKPiA+LS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4rKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
Cj4gPkBAIC0zODYsOSArMzg2LDEyIEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0
aW9uIHZvaWQgZG9fdHJhcF9zb2Z0d2FyZV9jaGVjayhzdHJ1Y3QgcHRfcmVncyAqCj4gPiAgICAg
ICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPiAgICAgICAgICAgICAgIGlycWVudHJ5X2VudGVy
X2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+ID4KPiA+LSAgICAgICAgICAgICAgLyogbm90IGEgY2Zp
IHZpb2xhdGlvbiwgdGhlbiBtZXJnZSBpbnRvIGZsb3cgb2YgdW5rbm93biB0cmFwIGhhbmRsZXIg
Ki8KPiA+LSAgICAgICAgICAgICAgaWYgKCFoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHJlZ3Mp
KQo+ID4tICAgICAgICAgICAgICAgICAgICAgIGRvX3RyYXBfdW5rbm93bihyZWdzKTsKPiA+KyAg
ICAgICAgICAgICAgLyogaGFuZGxlIHVwcm9iZSBldmVudCBmcmlzdCAqLwo+ID4rICAgICAgICAg
ICAgICBpZiAoIXByb2JlX2JyZWFrcG9pbnRfaGFuZGxlcihyZWdzKSkgewo+Cj4gSWYgdGFzayBo
YXMgdXByb2JlIGVuYWJsZWQgYW5kIHRoZXJlIGlzIGEgY2ZpIHZpb2xhdGlvbiBkdWUgdG8gbWlz
bWF0Y2ggaW4KPiByZXR1cm4gYWRkcmVzcyBvbiBzaGFkb3cgc3RhY2sgYW5kIHJlZ3VsYXIgc3Rh
Y2ssIHRoZW4gaXQgd291bGQgYmUgYSBjZmkKPiBieXBhc3MsIHJpZ2h0Pwo+IFBlcmhhcHMgd2Ug
c2hvdWxkIGJlIGRvaW5nIHRoaXMgb25seSB3aGVuIHdlIG1hdGNoIHRoYXQgc3cgY2hlY2sgZXhj
ZXB0aW9uCj4gaXMgZHVlIHRvIGZvcndhcmQgY2ZpIHZpb2xhdGlvbj8KPgo+IERvIHlvdSBhZ3Jl
ZT8KClllcywgbGV0IG1lIGFkZCBhIGNvbmRpdGlvbiBmb3IgZm9yd2FyZCBjZmkgdmlvbGF0aW9u
IGhlcmUuIFRoYW5rcyBmb3IKcG9pbnRpbmcgaXQgb3V0LgoKPgo+ID4rICAgICAgICAgICAgICAg
ICAgICAgIC8qIG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9mIHVu
a25vd24gdHJhcCBoYW5kbGVyICovCj4gPisgICAgICAgICAgICAgICAgICAgICAgaWYgKCFoYW5k
bGVfdXNlcl9jZmlfdmlvbGF0aW9uKHJlZ3MpKQo+ID4rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZG9fdHJhcF91bmtub3duKHJlZ3MpOwo+ID4rICAgICAgICAgICAgICB9Cj4gPgo+ID4g
ICAgICAgICAgICAgICBpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKPiA+ICAgICAg
IH0gZWxzZSB7Cj4gPi0tCj4gPjIuMTcuMQo+ID4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
