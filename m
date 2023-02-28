Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A64BC64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KWU+FBAgM8Yd8fiAVSwDwDQ37DGPH/oZNvvl4/sc+u4=; b=PB8sTEhCJXrXm6e2B1E8Q+UcXL
	B/KKHcQISZ2knm3ERQWmEomjUSRTh7mI4RdHXe1RQ6X589F7U3QqcsP+YBgTeAb3vZclfYCYg6cBK
	kxKXEDKY/sP9e0KmM+hzpNYtFzcChOsGB58TtZVcwoR4Z1HlQAl6dkx20xB0jpGCpvV/C/ht9l+wh
	dyfD3AK0XaVWKfbJE5cwapXihL54HaEiyGErebMUlllfRct16m1QGT7PKGqhiOG7pm5gEVHBSQvmb
	vNn7C/ChLCt7LBwsg4FqhzrLCKAN0yWh5qwtAY/Lki0ZxYcu5w11ccpRIqRUrT/12Y4aB/5AYWKXD
	X1M/zkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX80L-00EQ6i-MK; Tue, 28 Feb 2023 21:59:25 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX80H-00EQ39-K7
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 21:59:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id ay18so6745760pfb.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 13:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677621558;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcPXNEsEpksofsMgrJKoW+2Dw41GYFuZiABYuzNl9Gs=;
        b=za5fWNg2Nv2HD9fejIfGBhGN1pMgo+aOFuLl+8D0p02BS02PEImNrgQqCIrppjORuf
         Ivb6x0gnS0BZbVUteSyLJCe4dTk4zpZynrOz2UWb8qWvNDF+yf/sciJYzrRNEgvxLC9u
         E+F8Jm5xh8TCc/I/byatHLr26L45EWG8pwgxY8bbdXhQsB74QJZvbs2lRJR9Za0eJQrh
         P5GUabS7IWGFucgrRD6J0IOa6HasWQ1XTi4OIfCkZYZytf9vQdJlGOg3RL3s8CWEpn5/
         z2Z6M46w39AsDLnnsLxujw5xk3E+JuicdzOsa2t4XB/n/cM5AaEnJbKx5Syy42mM5qGb
         HD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677621558;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcPXNEsEpksofsMgrJKoW+2Dw41GYFuZiABYuzNl9Gs=;
        b=yRIAmoj0OvLuD7mgOgvPXFfAZMGAcwRI517tG/p3O/wPxcRlqYu21IlZLryzAOab8r
         l6Rl3e4rIgCcMcvcRd4qluQAdtHSq4VCuo+FN+r5xHJO0iKmYbMh+GPzscSdDvbG0wXE
         DlzJyPoIec7rVlSkheKWjo0tim70nO6iZ4EBdM64MkxAXOUvdqMvG2UwWdM3gmTSrUSo
         poigibh2y2iFlh8zGmRfAe+Amw6NJOtTEq9H9xXCjuAi1sRDXHb5q5rq5pN+xwJWFb19
         iAWzfw/y7fZJURivsEcwLtD0r6NS+U0pQSelRiYwfwCOUkZ5AtuCfwVQVjNUW65bySVE
         vjzA==
X-Gm-Message-State: AO0yUKW/z39SeERiuimD/6V85JDE/rCf4InPcZO4owbcbV5G9Vh2Op0h
	Vif0U17Sy7SB3uHICMIhL6qlpw==
X-Google-Smtp-Source: AK7set9MF/vBgDRK4NIoF28WqhT66X4p2Sfvcjoa4aaWatAUerjrnyBRKlu55zK+kgH1S0F08yes8A==
X-Received: by 2002:a62:1887:0:b0:5df:9809:2e3f with SMTP id 129-20020a621887000000b005df98092e3fmr2660388pfy.32.1677621558446;
        Tue, 28 Feb 2023 13:59:18 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e18-20020a656892000000b004fbd91d9716sm6185873pgt.15.2023.02.28.13.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:59:17 -0800 (PST)
Date: Tue, 28 Feb 2023 13:59:17 -0800 (PST)
X-Google-Original-Date: Tue, 28 Feb 2023 13:58:23 PST (-0800)
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
In-Reply-To: <20230227105941.2749193-1-suagrfillet@gmail.com>
CC: alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, leyfoon.tan@starfivetech.com, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, suagrfillet@gmail.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: suagrfillet@gmail.com, corbet@lwn.net
Message-ID: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_135921_881604_ACBEF9E8 
X-CRM114-Status: GOOD (  19.31  )
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

T24gTW9uLCAyNyBGZWIgMjAyMyAwMjo1OTo0MSBQU1QgKC0wODAwKSwgc3VhZ3JmaWxsZXRAZ21h
aWwuY29tIHdyb3RlOgo+IFRoaXMgY29tbWl0IDdkMjA3ODMxMGNiZiAoImR0LWJpbmRpbmdzOiBh
cm06IG1vdmUgY3B1LWNhcGFjaXR5IHRvIGEKPiBzaGFyZWQgbG9hdGlvbiIpIHVwZGF0ZXMgc29t
ZSByZWZlcmVuY2VzIGFib3V0IGNhcGFjaXR5LWRtaXBzLW1oego+IHByb3BlcnR5IGluIHRoaXMg
ZG9jdW1lbnQuCj4KPiBUaGUgbGlzdCBvZiBhcmNoaXRlY3R1cmVzIHVzaW5nIGNhcGFjaXR5LWRt
aXBzLW1oeiBvbWl0cyBSSVNDLVYsIHNvCj4gc3VwcGxlbWVudHMgaXQgaGVyZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0ICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3Nj
aGVkLWNhcGFjaXR5LnJzdCB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9zY2hlZHVs
ZXIvc2NoZWQtY2FwYWNpdHkucnN0IGIvRG9jdW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2Fw
YWNpdHkucnN0Cj4gaW5kZXggOGUyYjg1MzhiYzJiLi5lMmMxY2Y3NDMxNTggMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0Cj4gQEAgLTI1OCw3ICsyNTgs
NyBAQCBMaW51eCBjYW5ub3QgY3VycmVudGx5IGZpZ3VyZSBvdXQgQ1BVIGNhcGFjaXR5IG9uIGl0
cyBvd24sIHRoaXMgaW5mb3JtYXRpb24gdGh1cwo+ICBuZWVkcyB0byBiZSBoYW5kZWQgdG8gaXQu
IEFyY2hpdGVjdHVyZXMgbXVzdCBkZWZpbmUgYXJjaF9zY2FsZV9jcHVfY2FwYWNpdHkoKQo+ICBm
b3IgdGhhdCBwdXJwb3NlLgo+Cj4gLVRoZSBhcm0gYW5kIGFybTY0IGFyY2hpdGVjdHVyZXMgZGly
ZWN0bHkgbWFwIHRoaXMgdG8gdGhlIGFyY2hfdG9wb2xvZ3kgZHJpdmVyCj4gK1RoZSBhcm0sIGFy
bTY0LCBhbmQgUklTQy1WIGFyY2hpdGVjdHVyZXMgZGlyZWN0bHkgbWFwIHRoaXMgdG8gdGhlIGFy
Y2hfdG9wb2xvZ3kgZHJpdmVyCj4gIENQVSBzY2FsaW5nIGRhdGEsIHdoaWNoIGlzIGRlcml2ZWQg
ZnJvbSB0aGUgY2FwYWNpdHktZG1pcHMtbWh6IENQVSBiaW5kaW5nOyBzZWUKPiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NwdS9jcHUtY2FwYWNpdHkudHh0Lgo+Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1j
YXBhY2l0eS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIv
c2NoZWQtY2FwYWNpdHkucnN0Cj4gaW5kZXggZTA3ZmZkZDM5MWQzLi44Y2JhMTM1ZGNkMWEgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3Nj
aGVkLWNhcGFjaXR5LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3NjaGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QKPiBAQCAtMjMxLDcgKzIzMSw3IEBAIENGU+iw
g+W6puexu+WfuuS6juWunuS9k+i0n+i9vei3n+i4quacuuWItu+8iFBlci1FbnRpdHkgTG9hZCBU
cmFja2luZywgUEVMVO+8iQo+ICDlvZPliY3vvIxMaW51eOaXoOazleWHreiHqui6q+eul+WHukNQ
Veeul+WKm++8jOWboOatpOW/hemhu+imgeacieaKiui/meS4quS/oeaBr+S8oOmAkue7mUxpbnV4
55qE5pa55byP44CC5q+P5Liq5p625p6E5b+F6aG75Li65q2kCj4gIOWumuS5iWFyY2hfc2NhbGVf
Y3B1X2NhcGFjaXR5KCnlh73mlbDjgIIKPgo+IC1hcm3lkoxhcm02NOaetuaehOebtOaOpeaKiui/
meS4quS/oeaBr+aYoOWwhOWIsGFyY2hfdG9wb2xvZ3npqbHliqjnmoRDUFUgc2NhbGluZ+aVsOaN
ruS4re+8iOivkeazqO+8muWPguiAgwo+ICthcm3jgIFhcm02NOWSjFJJU0MtVuaetuaehOebtOaO
peaKiui/meS4quS/oeaBr+aYoOWwhOWIsGFyY2hfdG9wb2xvZ3npqbHliqjnmoRDUFUgc2NhbGlu
Z+aVsOaNruS4re+8iOivkeazqO+8muWPguiAgwo+ICBhcmNoX3RvcG9sb2d5LmjnmoRwZXJjcHXl
j5jph49jcHVfc2NhbGXvvInvvIzlroPmmK/ku45jYXBhY2l0eS1kbWlwcy1taHogQ1BVIGJpbmRp
bmfkuK3ooY3nlJ/orqHnrpcKPiAg5Ye65p2l55qE44CC5Y+C6KeBRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2NwdS9jcHUtY2FwYWNpdHkudHh044CCCgpSZXZpZXdlZC1ieTogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ICMgRW5nbGlzaApBY2tlZC1ieTogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpIYXBweSB0byB0YWtlIHRoaXMgdGhy
b3VnaCB0aGUgUklTQy1WIHRyZWUsIGJ1dCBJJ2xsIGhvbGQgb2ZmIGZvciBhIGJpdCAKYW5kIGxl
dCB0aGUgZG9jIGZvbGtzIGhhdmUgYSBjaGFuY2UgdG8gY2hpbWUgaW4gKG9yIGp1c3QgcGljayBp
dCB1cCkuICAKSSdtIHBsYW5uaW5nIG9uIHNlbmRpbmcgc29tZXRoaW5nIGxhdGVyIHRoaXMgd2Vl
ayBlaXRoZXIgd2F5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
