Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56044EDEC4D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jodkp6COOipKtWbjS/1hJzV3qUKHR17pxo+AH74a+m4=; b=DuIprKD7/3Q67i
	LsIc9CcUbLc8r4oUNTWBJFooyb4hEzllrT/g9+22Tsg3tJ7MmMLAhzj4AwC/P9/QKPLRM4bJVy5QL
	a8YX9WEUvClb2XccUxskjzkvvlxKWQ8PPMj9O6SEyciYDzkF+rBcHE2S+5zU1Z3yckTp8h6FvvKRN
	IOWdNcOvh5+AWR0JOP9AGv0pKsq0c2/BVbx4B3cuMkTYUIdBSysqZb8Wvu8XW0Rwg1Ic+8llaJlIo
	3kruuJtvCPWk7Uerd9F6U96cUiIY6LthYHrAs8VWFjdSN7NOXQ9Og98KXIhs0inCHLp4Xjd7dkx/n
	/Y4FpvIiuC5f4khez60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgP6u-005sJr-2V;
	Wed, 13 Sep 2023 12:36:48 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgP6r-005sIE-0b
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 12:36:47 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59205f26e47so66156277b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 05:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694608601; x=1695213401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwtaANT9Ahfm5hnU8wwR0DNxicByDj4BLG+WrQta//U=;
        b=uaKJsfNpEZSVpzGlDkRRJgWqHQdsKB1EY+9ozMYmaFBiswRxbcAEhqQ9z/6QHicZLd
         BodVG+nQ1r4OHJezwJB3s9Z6tvRCa0SEkD+yVQ+fi32JeN9NyuCApYMMNRL7PaXx357q
         rdZrePJP1pYJVuBuztZhsVQRwt2BqKQW+G24WHISb8uii/OGNrZAVwjUaVEaa+zk60ZI
         Qa+9p7HRYTwmzc3n40FvIEdt2tqaTWnl6/pmHrXi3+qGezVHboUDxOYWYyR0nPGMkUry
         DTfhnKTfBVz4844nmX7t8KaXFa0I+ojLwt6Jl/Xm687LRSDjEg5I/srPmNZZ542RpKSJ
         lFiA==
X-Gm-Message-State: AOJu0Yzgvu8Epvj7Z5pSznZ+hjgilNRAvdWB4MEysSvi1jbfHXJOQVzV
	NgHCYhxOw9Rh2I5FNRJOxS2Hv68SeVoz4Q==
X-Google-Smtp-Source: AGHT+IGujz0vdKiq/lcbaVmDqhxGQrWgL5RgEOHreorFPSqcg0IUDgv2E/41urh86qemtJAOKlyQ4A==
X-Received: by 2002:a81:5d84:0:b0:594:e148:3c3a with SMTP id r126-20020a815d84000000b00594e1483c3amr1993945ywb.22.1694608601159;
        Wed, 13 Sep 2023 05:36:41 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id s66-20020a0dd045000000b0058419c57c66sm3122965ywd.4.2023.09.13.05.36.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 05:36:40 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-58cbdf3eecaso66480557b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 05:36:39 -0700 (PDT)
X-Received: by 2002:a25:7449:0:b0:d77:fc5c:cc0 with SMTP id
 p70-20020a257449000000b00d77fc5c0cc0mr2293089ybc.12.1694608599727; Wed, 13
 Sep 2023 05:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
In-Reply-To: <20230818194136.4084400-2-evan@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2023 14:36:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
Message-ID: <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: Evan Green <evan@rivosinc.com>
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
	Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_053645_224515_DBF7475D 
X-CRM114-Status: GOOD (  31.19  )
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

SGkgRXZhbiwKCk9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDk6NDTigK9QTSBFdmFuIEdyZWVuIDxl
dmFuQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gUmF0aGVyIHRoYW4gZGVmZXJyaW5nIHVuYWxpZ25l
ZCBhY2Nlc3Mgc3BlZWQgZGV0ZXJtaW5hdGlvbnMgdG8gYSB2ZW5kb3IKPiBmdW5jdGlvbiwgbGV0
J3MgcHJvYmUgdGhlbSBhbmQgZmluZCBvdXQgaG93IGZhc3QgdGhleSBhcmUuIElmIHdlCj4gZGV0
ZXJtaW5lIHRoYXQgYW4gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzIGZhc3RlciB0aGFuIE4gYnl0
ZSBhY2Nlc3NlcywKPiBtYXJrIHRoZSBoYXJkd2FyZSdzIHVuYWxpZ25lZCBhY2Nlc3MgYXMgImZh
c3QiLiBPdGhlcndpc2UsIHdlIG1hcmsKPiBhY2Nlc3NlcyBhcyBzbG93Lgo+Cj4gVGhlIGFsZ29y
aXRobSBpdHNlbGYgcnVucyBmb3IgYSBmaXhlZCBhbW91bnQgb2YgamlmZmllcy4gV2l0aGluIGVh
Y2gKPiBpdGVyYXRpb24gaXQgYXR0ZW1wdHMgdG8gdGltZSBhIHNpbmdsZSBsb29wLCBhbmQgdGhl
biBrZWVwcyBvbmx5IHRoZSBiZXN0Cj4gKGZhc3Rlc3QpIGxvb3AgaXQgc2F3LiBUaGlzIGFsZ29y
aXRobSB3YXMgZm91bmQgdG8gaGF2ZSBsb3dlciB2YXJpYW5jZSBmcm9tCj4gcnVuIHRvIHJ1biB0
aGFuIG15IGZpcnN0IGF0dGVtcHQsIHdoaWNoIGNvdW50ZWQgdGhlIHRvdGFsIG51bWJlciBvZgo+
IGl0ZXJhdGlvbnMgdGhhdCBjb3VsZCBiZSBkb25lIGluIHRoYXQgZml4ZWQgYW1vdW50IG9mIGpp
ZmZpZXMuIEJ5IHRha2luZwo+IG9ubHkgdGhlIGJlc3QgaXRlcmF0aW9uIGluIHRoZSBsb29wLCBh
c3N1bWluZyBhdCBsZWFzdCBvbmUgbG9vcCB3YXNuJ3QKPiBwZXJ0dXJiZWQgYnkgYW4gaW50ZXJy
dXB0LCB3ZSBlbGltaW5hdGUgdGhlIGVmZmVjdHMgb2YgaW50ZXJydXB0cyBhbmQKPiBvdGhlciAi
d2FybSB1cCIgZmFjdG9ycyBsaWtlIGJyYW5jaCBwcmVkaWN0aW9uLiBUaGUgb25seSBkb3duc2lk
ZSBpcyBpdAo+IGRlcGVuZHMgb24gaGF2aW5nIGFuIHJkdGltZSBncmFudWxhciBhbmQgYWNjdXJh
dGUgZW5vdWdoIHRvIG1lYXN1cmUgYQo+IHNpbmdsZSBjb3B5LiBJZiB3ZSBldmVyIG1hbmFnZSB0
byBjb21wbGV0ZSBhIGxvb3AgaW4gMCByZHRpbWUgdGlja3MsIHdlCj4gbGVhdmUgdGhlIHVuYWxp
Z25lZCBzZXR0aW5nIGF0IFVOS05PV04uCj4KPiBUaGVyZSBpcyBhIHNsaWdodCBjaGFuZ2UgaW4g
dXNlci12aXNpYmxlIGJlaGF2aW9yIGhlcmUuIFByZXZpb3VzbHksIGFsbAo+IGJvYXJkcyBleGNl
cHQgdGhlIFRIZWFkIEM5MDYgcmVwb3J0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgb2YKPiBV
TktOT1dOLiBDOTA2IHJlcG9ydGVkIEZBU1QuIFdpdGggdGhpcyBjaGFuZ2UsIHNpbmNlIHdlJ3Jl
IG5vdyBtZWFzdXJpbmcKPiBtaXNhbGlnbmVkIGFjY2VzcyBzcGVlZCBvbiBlYWNoIGhhcnQsIGFs
bCBSSVNDLVYgc3lzdGVtcyB3aWxsIGhhdmUgdGhpcwo+IGtleSBzZXQgYXMgZWl0aGVyIEZBU1Qg
b3IgU0xPVy4KPgo+IEN1cnJlbnRseSwgd2UgZG9uJ3QgaGF2ZSBhIHdheSB0byBjb25maWRlbnRs
eSBtZWFzdXJlIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4KPiBTTE9XIGFuZCBFTVVMQVRFRCwgc28g
d2UgbGFiZWwgYW55dGhpbmcgbm90IGZhc3QgYXMgU0xPVy4gVGhpcyB3aWxsCj4gbWlzbGFiZWwg
c29tZSBzeXN0ZW1zIHRoYXQgYXJlIGFjdHVhbGx5IEVNVUxBVEVEIGFzIFNMT1cuIFdoZW4gd2Ug
Z2V0Cj4gc3VwcG9ydCBmb3IgZGVsZWdhdGluZyBtaXNhbGlnbmVkIGFjY2VzcyB0cmFwcyB0byB0
aGUga2VybmVsIChhcyBvcHBvc2VkCj4gdG8gdGhlIGZpcm13YXJlIHF1aWV0bHkgaGFuZGxpbmcg
aXQpLCB3ZSBjYW4gZXhwbGljaXRseSB0ZXN0IGluIExpbnV4IHRvCj4gc2VlIGlmIHVuYWxpZ25l
ZCBhY2Nlc3NlcyB0cmFwLiBUaG9zZSBzeXN0ZW1zIHdpbGwgc3RhcnQgdG8gcmVwb3J0Cj4gRU1V
TEFURUQsIHRob3VnaCBvbGRlciAodG9kYXkncykgc3lzdGVtcyB3aXRob3V0IHRoYXQgbmV3IFNC
SSBtZWNoYW5pc20KPiB3aWxsIGNvbnRpbnVlIHRvIHJlcG9ydCBTTE9XLgo+Cj4gSSd2ZSB1cGRh
dGVkIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aG9zZSBod3Byb2JlIHZhbHVlcyB0byByZWZsZWN0
Cj4gdGhpcywgc3BlY2lmaWNhbGx5OiBTTE9XIG1heSBvciBtYXkgbm90IGJlIGVtdWxhdGVkIGJ5
IHNvZnR3YXJlLCBhbmQgRkFTVAo+IHJlcHJlc2VudHMgbWVhbnMgYmVpbmcgZmFzdGVyIHRoYW4g
ZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiBUaGUgY2hhbmdlCj4gaW4gZG9jdW1lbnRhdGlvbiBp
cyBhY2N1cmF0ZSB3aXRoIHJlc3BlY3QgdG8gYm90aCB0aGUgZm9ybWVyIGFuZCBjdXJyZW50Cj4g
YmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNv
bT4KPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
ClRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCA1ODRlYTY1NjRiY2Fl
YWQyICgiUklTQy1WOgpQcm9iZSBmb3IgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCIpIGluIHY2LjYt
cmMxLgoKT24gdGhlIGJvYXJkcyBJIGhhdmUsIEkgZ2V0OgoKICAgIHJ6Zml2ZToKICAgICAgICBj
cHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBp
cwoxLjA1LCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIGZhc3QKCiAgICBpY2ljbGU6CgogICAgICAg
IGNwdTE6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNz
IGlzCjAuMDAsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwogICAgICAgIGNwdTI6IFJhdGlv
IG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCjAuMDAsIHVu
YWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwogICAgICAgIGNwdTM6IFJhdGlvIG9mIGJ5dGUgYWNj
ZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCjAuMDAsIHVuYWxpZ25lZCBhY2Nl
c3NlcyBhcmUgc2xvdwoKICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRv
IHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwowLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNs
b3cKCiAgICBrMjEwOgoKICAgICAgICBjcHUxOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRv
IHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwowLjAyLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNs
b3cKICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3
b3JkIGFjY2VzcyBpcwowLjAyLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKCiAgICBzdGFy
bGlnaHQ6CgogICAgICAgIGNwdTE6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGln
bmVkIHdvcmQgYWNjZXNzIGlzCjAuMDEsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwogICAg
ICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNj
ZXNzIGlzCjAuMDIsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwoKICAgIHZleHJpc2N2L29y
YW5nZWNyYWI6CgogICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5h
bGlnbmVkIHdvcmQgYWNjZXNzIGlzCjAuMDAsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwoK
SSBhbSBhIGJpdCBzdXJwcmlzZWQgYnkgdGhlIG5lYXItemVybyB2YWx1ZXMuICBBcmUgdGhlc2Ug
ZXhwZWN0ZWQ/ClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
