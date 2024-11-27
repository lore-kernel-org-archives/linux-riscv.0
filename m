Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E468D6ACF4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHK9HTxl/DamKe2+ypcCoezGR66Mppf1Lo5zF5AhNik=; b=Oe8z5dyzRI0oY2
	GoDwiThkO05r+ZK7PNfEGmUFoEgb4qhqEr5GAUh0DiFk5JTtaiX6Gx98O/gs0R/C69XErH69L8w4y
	h41cmjjC5+kBqYCpwKiT61YEO707RSiwc1oZAgdH5O1ZIlK1a0m9IlbWZiUw+OPLcLNRoqOp17EL3
	4duuU0wC2HIaWrxgaK43dKgNcRmyEDS7Kg0PK2Npi/xjM/C6w+sOqBJ1F3BR/b/Cz7bn7stKZElri
	G+XdBcuUvXLiic8o5SUx3AlNQv0TaChvk/Txvnos9ZoYcEYKDyG9OxJRMT9GGOqBqGE1lcfYMWbgP
	gN04bRQVJM4YamsTEoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9I-0000000Df94-2uun;
	Wed, 27 Nov 2024 16:44:20 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9F-0000000Df8G-2Dy4
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:19 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-841aa79be6bso137916439f.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 08:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1732725856; x=1733330656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EpuJKb4lN3c6p64SwypSlai/r++vtzKo1Jp0dkw7eE=;
        b=3VuExeG5uKjUuLEQXK+q208KdBbXrRrpAsldaGs80zE+9Z7FzhqOaLPRcHiu70D9UA
         RKT5oijO00wwsO0yGlot2wZhCJaiAmTorlSkr2iTNLST7LIW4XVCZy+Hv3AxdwMbXbwD
         Np26Ah7MPge48D/Qygo3lcIWGKJ0S98cNkRP9cqqPszdHVCyXfds//8E973JzvOZW64K
         NMO7PbEKHLpR2TAStRr7DaRJs5xf/GQCrb2Fjv7WagpA60bSCFOIekBOWIAI9WR/3vTn
         YNa4p+s5A+hlZBWBC+Y2hRylRKHtymNzIN6VNCVggYz5Zz4Pqem9SK1tJgwF6I/3kmvG
         GPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732725856; x=1733330656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EpuJKb4lN3c6p64SwypSlai/r++vtzKo1Jp0dkw7eE=;
        b=HpdEAj/9huvHT6gxYu3z1/z6mF6BYhdd1eAvN39II+N48ntXqym1yj4tREzCesSgrG
         tZnTFL85P8C2f58PmUYmTRKYDKS728q9NAmOtzAe3PhSDExk/8jDwNvNuZYb/hCWDQEo
         Xcl97IfNhMDiOaOUwlWTeV4B3oQnEiiDE1vxGlYG+zzRg8+r7R1nWgTlFU7pN2hiQZjB
         WkVi4DNYRLl/H35YnFGH2JsZRd2+/pfGQNY8C8uNHMQLT/AiaXq00/WERMyzXgIjP2Px
         l9INJeZLoVNjJjSlhGCTzpVv4xVKb1sL0s2RlCM7Bru2eXe37pICV05+fPR5npCpSOBJ
         l9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA/IqsV87fW5YkDlDGtc9FMI3e+TBMBKv1op01EQi6BlB7MHCaxCuti213oaeu+jQ1HukbHVFmLlobrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8FHKhFqngCLqbgqNy1Mxvx6Q0Ybx/cYTKVUKkIEe1BPQqei68
	A4Xzbe8eT60f8e6Dc2A8chqgEAF1Ua2UGvZ0H5V9G/vtgF4FxeCRkIgQjgZaaM4tK/Is2ShD6Nz
	hxABKGC5Dy08EdKIunSmZrUqbBrToBPUb5XQVDg==
X-Gm-Gg: ASbGnctNnOdVv7o/WH/4Uy/h2OIEPSDOIRX0EHuc4+0T0/4P9ToM86kCPLl6O+90CCE
	Gq13GeLZ/+pDtgQadjeq5xAskSyCunR6Nnw==
X-Google-Smtp-Source: AGHT+IHxUxNUsOs1nl8ukThM+AoCglHgXEuyKz8tFw8cz2YFunPkoBrCjLkUMhkrVVjQy6CRyKtZEdrCya6w1an4yS8=
X-Received: by 2002:a05:6602:160b:b0:83a:97e7:8bcf with SMTP id
 ca18e2360f4ac-843ecfeee7cmr369118839f.11.1732725856324; Wed, 27 Nov 2024
 08:44:16 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
In-Reply-To: <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Nov 2024 22:14:05 +0530
Message-ID: <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13, part #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084417_830216_9BD3C9E1 
X-CRM114-Status: GOOD (  22.28  )
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

T24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgMTA6MDjigK9QTSBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDI0IGF0IDE6NTXigK9Q
TSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBQYW9s
bywKPiA+Cj4gPiBBcyBtZW50aW9uZWQgaW4gdGhlIGxhc3QgUFIsIGhlcmUgYXJlIHRoZSByZW1h
aW5pbmcgS1ZNIFJJU0MtVgo+ID4gY2hhbmdlcyBmb3IgNi4xMyB3aGljaCBtYWlubHkgY29uc2lz
dHMgb2YgU3ZhZGUvU3ZhZHUgZXh0ZW5zaW9uCj4gPiBzdXBwb3J0IGZvciBIb3N0IGFuZCBHdWVz
dC9WTS4KPiA+Cj4gPiBQbGVhc2Ugbm90ZSB0aGF0IFBhbG1lciBoYXMgbm90IHlldCBzZW50IHRo
ZSBSSVNDLVYgUFIgZm9yIDYuMTMKPiA+IHNvIHRoZXNlIHBhdGNoZXMgd2lsbCBjb25mbGljdCB3
aXRoIHRoZSBSSVNDLVYgdHJlZS4KPgo+IFRoZSBSSVNDLVYgUFIgaGFzIG5vdCBiZWVuIG1lcmdl
ZCB5ZXQgKGhhcyBpdCBiZWVuIHNlbnQ/KSBhbmQgSSBhbSBub3QKPiBzdXJlIHdoYXQncyBoYXBw
ZW5pbmcgaGVyZS4gSWYgdGhlc2UgYXJlIG1lcmdlZCBmaXJzdCwgcHJlc3VtYWJseQo+IExpbnVz
IHdpbGwgYnVtcCB0aGUgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGNvbnN0YW50cyAt
LQo+IGxlYXZpbmcgU1ZBREUvU1ZBRFUgYXQgODcgYW5kIDg4IGFuZCBhZGp1c3RpbmcgdGhlIG90
aGVycy4gU2hvdWxkIEkgZG8KPiB0aGF0IG9yIGlzIGl0IGRlbGF5ZWQgdG8gNi4xNCBhdCB0aGlz
IHBvaW50PwoKWWVzLCBQYWxtZXIgc2VuZC1vdXQgUklTQy1WIFBSIG9uZSBob3VyIGFnby4KKHN1
YmplY3QgIltHSVQgUFVMTF0gUklTQy1WIFBhY2hlcyBmb3IgdGhlIDYuMTMgTWVyZ2UgV2luZG93
LCBQYXJ0IDEiKQooZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3Jpc2N2L2xpbnV4LmdpdAp0YWdzL3Jpc2N2LWZvci1saW51cy02LjEzLW13MSkKCldlIGhhdmUg
YWxyZWFkeSBza2lwcGVkIFN2YWRlICYgU3ZhZHUgc3VwcG9ydCBpbiB0aGUgNi4xMiBtZXJnZQp3
aW5kb3cuIElmIHBvc3NpYmxlIHBsZWFzZSB0YWtlIGl0IGluIHRoaXMgbWVyZ2Ugd2luZG93LgoK
UmVnYXJkcywKQW51cAoKPgo+IFBhb2xvCj4KPiA+IFBsZWFzZSBwdWxsLgo+ID4KPiA+IFJlZ2Fy
ZHMsCj4gPiBBbnVwCj4gPgo+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAz
MzJmYTRhODAyYjE2Y2NiNzI3MTk5ZGE2ODUyOTRmODVmOTg4MGNiOgo+ID4KPiA+ICAgcmlzY3Y6
IGt2bTogRml4IG91dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzICgyMDI0LTExLTA1IDEzOjI3OjMy
ICswNTMwKQo+ID4KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+
ID4KPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0t
cmlzY3YtNi4xMy0yCj4gPgo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGM3NGJm
ZTRmZmU4YzFjYTk0ZTNkNjBlYzdhZjA2Y2Y2NzllMjM1ODM6Cj4gPgo+ID4gICBLVk06IHJpc2N2
OiBzZWxmdGVzdHM6IEFkZCBTdmFkZSBhbmQgU3ZhZHUgRXh0ZW5zaW9uIHRvIGdldC1yZWctbGlz
dAo+ID4gdGVzdCAoMjAyNC0xMS0yMSAxNzo0MDoxNiArMDUzMCkKPiA+Cj4gPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
PiBLVk0vcmlzY3YgY2hhbmdlcyBmb3IgNi4xMyBwYXJ0ICMyCj4gPgo+ID4gLSBTdmFkZSBhbmQg
U3ZhZHUgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIEhvc3QgYW5kIEd1ZXN0L1ZNCj4gPgo+ID4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gWW9uZy1YdWFuIFdhbmcgKDQpOgo+ID4gICAgICAgUklTQy1WOiBBZGQgU3ZhZGUg
YW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydAo+ID4gICAgICAgZHQtYmluZGluZ3M6IHJpc2N2
OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEVudHJpZXMKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQg
U3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiA+ICAgICAg
IEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNpb24gdG8g
Z2V0LXJlZy1saXN0IHRlc3QKPiA+Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgYXJj
aC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAg
ICAgICAgICAgIHwgMTMgKysrKysrKysrLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaCAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysKPiA+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKysK
PiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAgICAgICAgICAgICB8
IDE1ICsrKysrKysrKysrKwo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYyAgIHwgIDggKysrKysrKwo+ID4gIDEwIGZpbGVzIGNoYW5nZWQsIDg1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
