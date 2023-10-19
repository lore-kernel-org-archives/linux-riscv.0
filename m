Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434A8CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjKf/SFayT8jm+nDHhfmHzMBscX/DlRoGhSokN+SG54=; b=HnZGuYKHFeYHsF
	Gnu0gwtKqYPJeCgg7Fm2oV0FYllfxMJLJaH06YCpKskb1CxdtL6BTw78GboOnPTzkcPnd3mHrvtaG
	TlhfXuxQXb5rLNuDbtp5yemhj0Xxuc7RCaFzpgI2qHNT0vZiuw+CJ5df6L7vYgNShfOm1rPWJypU3
	pXJjl9+VbV9kEp9otnPsOoJeaa+mmPd4wfzNflOoZIKvy12kXhMyAGYQ95U9RzZzQSZOLLx1ltzMP
	mW1/QWSpx3lg+z+d2l7gQ/bXyZ341FB0Q2zwwNx+e82A/aXOmuy9ktP1+gj3v7uvG0p0RRkUTBqmd
	UoI9jJtJ8EcDvmIo7oAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMew-00GWMf-39;
	Thu, 19 Oct 2023 06:37:30 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMet-00GWLY-0b
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 06:37:28 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a87ac9d245so51099677b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 23:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697697444; x=1698302244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXEjMPe8j5c6Nski5KvbyugP8GZIC2bmURRJNkH6ZbQ=;
        b=mk0lZBa9l6iaciez8t2IkSivtiCCnhQUx7zG7ixy4NwxmQp4szlpxrSYF/AoxK7wBa
         BlaSRtwR6cCMqmDI/h8DYlg5pm3BJU26f9E+tUgJEz6ENFRLrWpgagv8WRxMdeucFQZI
         rvu+kQdYVaoW/+49TbvGq9P1DugWQjaRcCwCf2VlAxs4xcfIQ3+zKTBCLKaf0htX5F1p
         zu+P/00+nQmFqbPkRzozCSpSiulTyc4evNAjo3drnYWrzRRNRnuzicxttnyMu6qLv9EU
         81A6F8zFWeM9w89FfNOlrHBmQB/+LWiqf6XgPsFe6D+YYyUDeJEt6tH/SLcAD0SoQqaI
         5yaw==
X-Gm-Message-State: AOJu0YztGppv5TkeVklbV1bfq2YrEKlLe8K1JRL6VCqKRIBRAbLucGjt
	dKAGj8DsSTtpstS/r+GMd6df9aq0xPgNzQ==
X-Google-Smtp-Source: AGHT+IHM+R/h9hk/ggHq1EDLTDU0Ch8CExngV8zQRfSrEYxYjrna31Ij5dT+MSb2pKTec5vmX2fwXw==
X-Received: by 2002:a81:8454:0:b0:5a7:dad7:61dd with SMTP id u81-20020a818454000000b005a7dad761ddmr1452341ywf.20.1697697444395;
        Wed, 18 Oct 2023 23:37:24 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id r1-20020a818101000000b0059b50f126fbsm2178708ywf.114.2023.10.18.23.37.23
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 23:37:23 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7be88e9ccso95905147b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 23:37:23 -0700 (PDT)
X-Received: by 2002:a05:690c:97:b0:577:3d46:f90e with SMTP id
 be23-20020a05690c009700b005773d46f90emr1622261ywb.32.1697697443165; Wed, 18
 Oct 2023 23:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
 <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com> <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
In-Reply-To: <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Oct 2023 08:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG3SUVPJHSiNyQNzyqxiJpczUHhBxHN7YqEDcaWYwkFA@mail.gmail.com>
Message-ID: <CAMuHMdUG3SUVPJHSiNyQNzyqxiJpczUHhBxHN7YqEDcaWYwkFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Evan Green <evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_233727_228031_7D9DC163 
X-CRM114-Status: GOOD (  42.22  )
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

SGkgUHJhYmFoa2FyLAoKT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgOTozMuKAr0FNIEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDEz
LCAyMDIzIGF0IDc6NDbigK9QTSBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4gPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCA1OjM24oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXVnIDE4LCAyMDIz
IGF0IDk6NDTigK9QTSBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gUmF0aGVyIHRoYW4gZGVmZXJyaW5nIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgZGV0ZXJtaW5h
dGlvbnMgdG8gYSB2ZW5kb3IKPiA+ID4gPiBmdW5jdGlvbiwgbGV0J3MgcHJvYmUgdGhlbSBhbmQg
ZmluZCBvdXQgaG93IGZhc3QgdGhleSBhcmUuIElmIHdlCj4gPiA+ID4gZGV0ZXJtaW5lIHRoYXQg
YW4gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzIGZhc3RlciB0aGFuIE4gYnl0ZSBhY2Nlc3NlcywK
PiA+ID4gPiBtYXJrIHRoZSBoYXJkd2FyZSdzIHVuYWxpZ25lZCBhY2Nlc3MgYXMgImZhc3QiLiBP
dGhlcndpc2UsIHdlIG1hcmsKPiA+ID4gPiBhY2Nlc3NlcyBhcyBzbG93Lgo+ID4gPiA+Cj4gPiA+
ID4gVGhlIGFsZ29yaXRobSBpdHNlbGYgcnVucyBmb3IgYSBmaXhlZCBhbW91bnQgb2YgamlmZmll
cy4gV2l0aGluIGVhY2gKPiA+ID4gPiBpdGVyYXRpb24gaXQgYXR0ZW1wdHMgdG8gdGltZSBhIHNp
bmdsZSBsb29wLCBhbmQgdGhlbiBrZWVwcyBvbmx5IHRoZSBiZXN0Cj4gPiA+ID4gKGZhc3Rlc3Qp
IGxvb3AgaXQgc2F3LiBUaGlzIGFsZ29yaXRobSB3YXMgZm91bmQgdG8gaGF2ZSBsb3dlciB2YXJp
YW5jZSBmcm9tCj4gPiA+ID4gcnVuIHRvIHJ1biB0aGFuIG15IGZpcnN0IGF0dGVtcHQsIHdoaWNo
IGNvdW50ZWQgdGhlIHRvdGFsIG51bWJlciBvZgo+ID4gPiA+IGl0ZXJhdGlvbnMgdGhhdCBjb3Vs
ZCBiZSBkb25lIGluIHRoYXQgZml4ZWQgYW1vdW50IG9mIGppZmZpZXMuIEJ5IHRha2luZwo+ID4g
PiA+IG9ubHkgdGhlIGJlc3QgaXRlcmF0aW9uIGluIHRoZSBsb29wLCBhc3N1bWluZyBhdCBsZWFz
dCBvbmUgbG9vcCB3YXNuJ3QKPiA+ID4gPiBwZXJ0dXJiZWQgYnkgYW4gaW50ZXJydXB0LCB3ZSBl
bGltaW5hdGUgdGhlIGVmZmVjdHMgb2YgaW50ZXJydXB0cyBhbmQKPiA+ID4gPiBvdGhlciAid2Fy
bSB1cCIgZmFjdG9ycyBsaWtlIGJyYW5jaCBwcmVkaWN0aW9uLiBUaGUgb25seSBkb3duc2lkZSBp
cyBpdAo+ID4gPiA+IGRlcGVuZHMgb24gaGF2aW5nIGFuIHJkdGltZSBncmFudWxhciBhbmQgYWNj
dXJhdGUgZW5vdWdoIHRvIG1lYXN1cmUgYQo+ID4gPiA+IHNpbmdsZSBjb3B5LiBJZiB3ZSBldmVy
IG1hbmFnZSB0byBjb21wbGV0ZSBhIGxvb3AgaW4gMCByZHRpbWUgdGlja3MsIHdlCj4gPiA+ID4g
bGVhdmUgdGhlIHVuYWxpZ25lZCBzZXR0aW5nIGF0IFVOS05PV04uCj4gPiA+ID4KPiA+ID4gPiBU
aGVyZSBpcyBhIHNsaWdodCBjaGFuZ2UgaW4gdXNlci12aXNpYmxlIGJlaGF2aW9yIGhlcmUuIFBy
ZXZpb3VzbHksIGFsbAo+ID4gPiA+IGJvYXJkcyBleGNlcHQgdGhlIFRIZWFkIEM5MDYgcmVwb3J0
ZWQgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgb2YKPiA+ID4gPiBVTktOT1dOLiBDOTA2IHJlcG9y
dGVkIEZBU1QuIFdpdGggdGhpcyBjaGFuZ2UsIHNpbmNlIHdlJ3JlIG5vdyBtZWFzdXJpbmcKPiA+
ID4gPiBtaXNhbGlnbmVkIGFjY2VzcyBzcGVlZCBvbiBlYWNoIGhhcnQsIGFsbCBSSVNDLVYgc3lz
dGVtcyB3aWxsIGhhdmUgdGhpcwo+ID4gPiA+IGtleSBzZXQgYXMgZWl0aGVyIEZBU1Qgb3IgU0xP
Vy4KPiA+ID4gPgo+ID4gPiA+IEN1cnJlbnRseSwgd2UgZG9uJ3QgaGF2ZSBhIHdheSB0byBjb25m
aWRlbnRseSBtZWFzdXJlIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4KPiA+ID4gPiBTTE9XIGFuZCBF
TVVMQVRFRCwgc28gd2UgbGFiZWwgYW55dGhpbmcgbm90IGZhc3QgYXMgU0xPVy4gVGhpcyB3aWxs
Cj4gPiA+ID4gbWlzbGFiZWwgc29tZSBzeXN0ZW1zIHRoYXQgYXJlIGFjdHVhbGx5IEVNVUxBVEVE
IGFzIFNMT1cuIFdoZW4gd2UgZ2V0Cj4gPiA+ID4gc3VwcG9ydCBmb3IgZGVsZWdhdGluZyBtaXNh
bGlnbmVkIGFjY2VzcyB0cmFwcyB0byB0aGUga2VybmVsIChhcyBvcHBvc2VkCj4gPiA+ID4gdG8g
dGhlIGZpcm13YXJlIHF1aWV0bHkgaGFuZGxpbmcgaXQpLCB3ZSBjYW4gZXhwbGljaXRseSB0ZXN0
IGluIExpbnV4IHRvCj4gPiA+ID4gc2VlIGlmIHVuYWxpZ25lZCBhY2Nlc3NlcyB0cmFwLiBUaG9z
ZSBzeXN0ZW1zIHdpbGwgc3RhcnQgdG8gcmVwb3J0Cj4gPiA+ID4gRU1VTEFURUQsIHRob3VnaCBv
bGRlciAodG9kYXkncykgc3lzdGVtcyB3aXRob3V0IHRoYXQgbmV3IFNCSSBtZWNoYW5pc20KPiA+
ID4gPiB3aWxsIGNvbnRpbnVlIHRvIHJlcG9ydCBTTE9XLgo+ID4gPiA+Cj4gPiA+ID4gSSd2ZSB1
cGRhdGVkIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aG9zZSBod3Byb2JlIHZhbHVlcyB0byByZWZs
ZWN0Cj4gPiA+ID4gdGhpcywgc3BlY2lmaWNhbGx5OiBTTE9XIG1heSBvciBtYXkgbm90IGJlIGVt
dWxhdGVkIGJ5IHNvZnR3YXJlLCBhbmQgRkFTVAo+ID4gPiA+IHJlcHJlc2VudHMgbWVhbnMgYmVp
bmcgZmFzdGVyIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiBUaGUgY2hhbmdlCj4gPiA+
ID4gaW4gZG9jdW1lbnRhdGlvbiBpcyBhY2N1cmF0ZSB3aXRoIHJlc3BlY3QgdG8gYm90aCB0aGUg
Zm9ybWVyIGFuZCBjdXJyZW50Cj4gPiA+ID4gYmVoYXZpb3IuCj4gPiA+ID4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiBBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+ID4KPiA+ID4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDU4NGVhNjU2NGJjYWVh
ZDIgKCJSSVNDLVY6Cj4gPiA+IFByb2JlIGZvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIikgaW4g
djYuNi1yYzEuCj4gPiA+Cj4gPiA+IE9uIHRoZSBib2FyZHMgSSBoYXZlLCBJIGdldDoKPiA+ID4K
PiA+ID4gICAgIHJ6Zml2ZToKPiA+ID4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2Vz
cyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+ID4gPiAxLjA1LCB1bmFsaWduZWQg
YWNjZXNzZXMgYXJlIGZhc3QKPiA+Cj4gPiBIcm0sIEknbSBhIGxpdHRsZSBzdXJwcmlzZWQgdG8g
YmUgc2VlaW5nIHRoaXMgbnVtYmVyIGNvbWUgb3V0IHNvIGNsb3NlCj4gPiB0byAxLiBJZiB5b3Ug
cmVib290IGEgZmV3IHRpbWVzLCB3aGF0IGtpbmQgb2YgdmFyaWFuY2UgZG8geW91IGdldCBvbgo+
ID4gdGhpcz8KPgo+IFJvY2stc29saWQgYXQgMS4wNSAoZXZlbiB3aXRoIGluY3JlYXNlZCByZXNv
bHV0aW9uOiAxLjA1ODUzIG9uIDMgdHJpZXMpCgpBZnRlciB1cGdyYWRpbmcgdGhlIGZpcm13YXJl
IGZyb20gWzFdIHRvIFsyXSwgdGhpcyBjaGFuZ2VkIHRvCiIwLjAwLCB1bmFsaWduZWQgYWNjZXNz
ZXMgYXJlIHNsb3ciLgoKWzFdIFJaLUZpdmUtRVRICiAgICBVLUJvb3QgMjAyMC4xMC1nNjExYzY1
N2U0MyAoQXVnIDI2IDIwMjIgLSAxMToyOTowNiArMDEwMCkKClsyXSBPcGVuU0JJIHYxLjMtNzUt
ZzNjZjBlYTQKICAgIFUtQm9vdCAyMDIzLjAxLTAwMjA5LWcxODA0YzhhYjE3IChPY3QgMDQgMjAy
MyAtIDEzOjE4OjAxICswMTAwKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
