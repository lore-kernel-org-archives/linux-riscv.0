Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A0AEE01FD
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+y3GTUFVWpO5jfxYuKvPNrMO1cFQbLRRPkaEjrUAwyg=; b=zly2k7TOR9KOwW
	hka9Mnl/8c5NJulD/L7YUrrfdlm2IsocMUy71+1PN9HmasbsU918/+WlBnh637XMGW4i26XWtUMlf
	EfR4zhiwkasraeYojsgPdawjyChA/yH4EjOVT8IbRQGvpjbf8t3Z8wf1VGwVXK8JEeVq7NxRceYPL
	6d/ii91q/USpGKgNfBrTxmin0YNuwGDmKhRacXq9BoFrQuu9fnwj0tuMZiXpTmUIbQTseMNI3K/6v
	3C+cT06/Kie/V3sFa5o2/JbROZXzBo/vXjcvNQ7tbTzpGIigNUS5pU0z9i6CucbjTVjQhxvnkEKhf
	tcoNxaNv9ib3U7tRRXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgTx1-006VWY-2g;
	Wed, 13 Sep 2023 17:46:55 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgTwx-006VVt-2D
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 17:46:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-501bd164fbfso96655e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 10:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694627209; x=1695232009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaTGM+r0T4ix55Ks/rV8r7oM4itiRsvvp6UH3VlxOdQ=;
        b=dyNuxVWL6e2GtoNxMNjkk/Lq/B6BgQcOou3dVqMTiLm+w7a52JWWLhICDYLXALXUUY
         b3xu/JNgY9jSjLYY+L8FjGKJqVMNHjtBBF2dfQsUO5y8qVs5mzTFfQgEsMHafb39vyMw
         Tuko5PgtCeJMa9P7mFfvVuRSWPihzJHgVE9ed/K62M7X1oY6DSnsXWWUmBC6sjZ4vhba
         GjHEBLfcqI7mEnPp4py3u6RlZpBghTtb/uu88ZrOFR8CW9HfOMLCca4nApTfUZiE1kV3
         AzFiMX01fePr5AD63o2ScxNyltcgLcs8a6Fut7+Y4J+v/UlSpQVw2DpYvdHa29qoRbCZ
         ynTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694627209; x=1695232009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaTGM+r0T4ix55Ks/rV8r7oM4itiRsvvp6UH3VlxOdQ=;
        b=JXY5hq8hum9YYcKkApLZYVbbcWgsGhiH3iD5D1aOtIZKGIJbknmwhwC8XhM9V8c6CC
         45PO6hDiGg4cHqid1z8OmEIxIGWf8VAgi96UzRIT+oN17ablrmnZ+ZHt3Ov/KL9ggM75
         EO+Ze/pnFvGOJ+jf6fRWPvjezsL2CE8tET8aX9vP9h4HSTnvxScMPsT/tz1ZZNOwmciN
         EsxhBL15gPsKneLKldhcvIFzdEGpE7DWyqXPI18GFZoeAZQqwJy/iYZzLV0dEMnh+jas
         8uG18tJcB599zrgoahlLCrSyzJL7mpHl+Q8Hi59aEC/pFlW9p4dgcjNxic8FBD9G5+HK
         FWXg==
X-Gm-Message-State: AOJu0Yyzw/d5T4jJ4JXl28pNl4oPpQtQp6nHF/k1Hl+1HsgTXQKW7v94
	9QFL7Bqa0dASR8vH3qO/m+FQV4DFtOhgsSwl9O8eDA==
X-Google-Smtp-Source: AGHT+IE8E3aGdajd07Jo/Ih9J3B6jb58k/6rIP3DKaSrxVurSVnQGYrTxs5UZkMcis8uKeqpgsLkQQJT1GTPpmQeX2Q=
X-Received: by 2002:a05:6512:3e26:b0:4fd:ddbc:1577 with SMTP id
 i38-20020a0565123e2600b004fdddbc1577mr3100760lfv.2.1694627209317; Wed, 13 Sep
 2023 10:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 13 Sep 2023 10:46:13 -0700
Message-ID: <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20230913_104651_974197_214EB31C 
X-CRM114-Status: GOOD (  36.95  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgNTozNuKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgRXZhbiwKPgo+IE9uIEZyaSwgQXVnIDE4
LCAyMDIzIGF0IDk6NDTigK9QTSBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4gPiBSYXRoZXIgdGhhbiBkZWZlcnJpbmcgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBkZXRlcm1p
bmF0aW9ucyB0byBhIHZlbmRvcgo+ID4gZnVuY3Rpb24sIGxldCdzIHByb2JlIHRoZW0gYW5kIGZp
bmQgb3V0IGhvdyBmYXN0IHRoZXkgYXJlLiBJZiB3ZQo+ID4gZGV0ZXJtaW5lIHRoYXQgYW4gdW5h
bGlnbmVkIHdvcmQgYWNjZXNzIGlzIGZhc3RlciB0aGFuIE4gYnl0ZSBhY2Nlc3NlcywKPiA+IG1h
cmsgdGhlIGhhcmR3YXJlJ3MgdW5hbGlnbmVkIGFjY2VzcyBhcyAiZmFzdCIuIE90aGVyd2lzZSwg
d2UgbWFyawo+ID4gYWNjZXNzZXMgYXMgc2xvdy4KPiA+Cj4gPiBUaGUgYWxnb3JpdGhtIGl0c2Vs
ZiBydW5zIGZvciBhIGZpeGVkIGFtb3VudCBvZiBqaWZmaWVzLiBXaXRoaW4gZWFjaAo+ID4gaXRl
cmF0aW9uIGl0IGF0dGVtcHRzIHRvIHRpbWUgYSBzaW5nbGUgbG9vcCwgYW5kIHRoZW4ga2VlcHMg
b25seSB0aGUgYmVzdAo+ID4gKGZhc3Rlc3QpIGxvb3AgaXQgc2F3LiBUaGlzIGFsZ29yaXRobSB3
YXMgZm91bmQgdG8gaGF2ZSBsb3dlciB2YXJpYW5jZSBmcm9tCj4gPiBydW4gdG8gcnVuIHRoYW4g
bXkgZmlyc3QgYXR0ZW1wdCwgd2hpY2ggY291bnRlZCB0aGUgdG90YWwgbnVtYmVyIG9mCj4gPiBp
dGVyYXRpb25zIHRoYXQgY291bGQgYmUgZG9uZSBpbiB0aGF0IGZpeGVkIGFtb3VudCBvZiBqaWZm
aWVzLiBCeSB0YWtpbmcKPiA+IG9ubHkgdGhlIGJlc3QgaXRlcmF0aW9uIGluIHRoZSBsb29wLCBh
c3N1bWluZyBhdCBsZWFzdCBvbmUgbG9vcCB3YXNuJ3QKPiA+IHBlcnR1cmJlZCBieSBhbiBpbnRl
cnJ1cHQsIHdlIGVsaW1pbmF0ZSB0aGUgZWZmZWN0cyBvZiBpbnRlcnJ1cHRzIGFuZAo+ID4gb3Ro
ZXIgIndhcm0gdXAiIGZhY3RvcnMgbGlrZSBicmFuY2ggcHJlZGljdGlvbi4gVGhlIG9ubHkgZG93
bnNpZGUgaXMgaXQKPiA+IGRlcGVuZHMgb24gaGF2aW5nIGFuIHJkdGltZSBncmFudWxhciBhbmQg
YWNjdXJhdGUgZW5vdWdoIHRvIG1lYXN1cmUgYQo+ID4gc2luZ2xlIGNvcHkuIElmIHdlIGV2ZXIg
bWFuYWdlIHRvIGNvbXBsZXRlIGEgbG9vcCBpbiAwIHJkdGltZSB0aWNrcywgd2UKPiA+IGxlYXZl
IHRoZSB1bmFsaWduZWQgc2V0dGluZyBhdCBVTktOT1dOLgo+ID4KPiA+IFRoZXJlIGlzIGEgc2xp
Z2h0IGNoYW5nZSBpbiB1c2VyLXZpc2libGUgYmVoYXZpb3IgaGVyZS4gUHJldmlvdXNseSwgYWxs
Cj4gPiBib2FyZHMgZXhjZXB0IHRoZSBUSGVhZCBDOTA2IHJlcG9ydGVkIG1pc2FsaWduZWQgYWNj
ZXNzIHNwZWVkIG9mCj4gPiBVTktOT1dOLiBDOTA2IHJlcG9ydGVkIEZBU1QuIFdpdGggdGhpcyBj
aGFuZ2UsIHNpbmNlIHdlJ3JlIG5vdyBtZWFzdXJpbmcKPiA+IG1pc2FsaWduZWQgYWNjZXNzIHNw
ZWVkIG9uIGVhY2ggaGFydCwgYWxsIFJJU0MtViBzeXN0ZW1zIHdpbGwgaGF2ZSB0aGlzCj4gPiBr
ZXkgc2V0IGFzIGVpdGhlciBGQVNUIG9yIFNMT1cuCj4gPgo+ID4gQ3VycmVudGx5LCB3ZSBkb24n
dCBoYXZlIGEgd2F5IHRvIGNvbmZpZGVudGx5IG1lYXN1cmUgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
bgo+ID4gU0xPVyBhbmQgRU1VTEFURUQsIHNvIHdlIGxhYmVsIGFueXRoaW5nIG5vdCBmYXN0IGFz
IFNMT1cuIFRoaXMgd2lsbAo+ID4gbWlzbGFiZWwgc29tZSBzeXN0ZW1zIHRoYXQgYXJlIGFjdHVh
bGx5IEVNVUxBVEVEIGFzIFNMT1cuIFdoZW4gd2UgZ2V0Cj4gPiBzdXBwb3J0IGZvciBkZWxlZ2F0
aW5nIG1pc2FsaWduZWQgYWNjZXNzIHRyYXBzIHRvIHRoZSBrZXJuZWwgKGFzIG9wcG9zZWQKPiA+
IHRvIHRoZSBmaXJtd2FyZSBxdWlldGx5IGhhbmRsaW5nIGl0KSwgd2UgY2FuIGV4cGxpY2l0bHkg
dGVzdCBpbiBMaW51eCB0bwo+ID4gc2VlIGlmIHVuYWxpZ25lZCBhY2Nlc3NlcyB0cmFwLiBUaG9z
ZSBzeXN0ZW1zIHdpbGwgc3RhcnQgdG8gcmVwb3J0Cj4gPiBFTVVMQVRFRCwgdGhvdWdoIG9sZGVy
ICh0b2RheSdzKSBzeXN0ZW1zIHdpdGhvdXQgdGhhdCBuZXcgU0JJIG1lY2hhbmlzbQo+ID4gd2ls
bCBjb250aW51ZSB0byByZXBvcnQgU0xPVy4KPiA+Cj4gPiBJJ3ZlIHVwZGF0ZWQgdGhlIGRvY3Vt
ZW50YXRpb24gZm9yIHRob3NlIGh3cHJvYmUgdmFsdWVzIHRvIHJlZmxlY3QKPiA+IHRoaXMsIHNw
ZWNpZmljYWxseTogU0xPVyBtYXkgb3IgbWF5IG5vdCBiZSBlbXVsYXRlZCBieSBzb2Z0d2FyZSwg
YW5kIEZBU1QKPiA+IHJlcHJlc2VudHMgbWVhbnMgYmVpbmcgZmFzdGVyIHRoYW4gZXF1aXZhbGVu
dCBieXRlIGFjY2Vzc2VzLiBUaGUgY2hhbmdlCj4gPiBpbiBkb2N1bWVudGF0aW9uIGlzIGFjY3Vy
YXRlIHdpdGggcmVzcGVjdCB0byBib3RoIHRoZSBmb3JtZXIgYW5kIGN1cnJlbnQKPiA+IGJlaGF2
aW9yLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29t
Pgo+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgNTg0ZWE2NTY0
YmNhZWFkMiAoIlJJU0MtVjoKPiBQcm9iZSBmb3IgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCIpIGlu
IHY2LjYtcmMxLgo+Cj4gT24gdGhlIGJvYXJkcyBJIGhhdmUsIEkgZ2V0Ogo+Cj4gICAgIHJ6Zml2
ZToKPiAgICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVk
IHdvcmQgYWNjZXNzIGlzCj4gMS4wNSwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBmYXN0CgpIcm0s
IEknbSBhIGxpdHRsZSBzdXJwcmlzZWQgdG8gYmUgc2VlaW5nIHRoaXMgbnVtYmVyIGNvbWUgb3V0
IHNvIGNsb3NlCnRvIDEuIElmIHlvdSByZWJvb3QgYSBmZXcgdGltZXMsIHdoYXQga2luZCBvZiB2
YXJpYW5jZSBkbyB5b3UgZ2V0IG9uCnRoaXM/Cgo+Cj4gICAgIGljaWNsZToKPgo+ICAgICAgICAg
Y3B1MTogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3Mg
aXMKPiAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiAgICAgICAgIGNwdTI6IFJh
dGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4gMC4w
MCwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4gICAgICAgICBjcHUzOiBSYXRpbyBvZiBi
eXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+IDAuMDAsIHVuYWxp
Z25lZCBhY2Nlc3NlcyBhcmUgc2xvdwo+Cj4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFj
Y2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+IDAuMDAsIHVuYWxpZ25lZCBh
Y2Nlc3NlcyBhcmUgc2xvdwo+Cj4gICAgIGsyMTA6Cj4KPiAgICAgICAgIGNwdTE6IFJhdGlvIG9m
IGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4gMC4wMiwgdW5h
bGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFj
Y2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+IDAuMDIsIHVuYWxpZ25lZCBh
Y2Nlc3NlcyBhcmUgc2xvdwo+Cj4gICAgIHN0YXJsaWdodDoKPgo+ICAgICAgICAgY3B1MTogUmF0
aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPiAwLjAx
LCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiAgICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5
dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4gMC4wMiwgdW5hbGln
bmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4KPiAgICAgdmV4cmlzY3Yvb3JhbmdlY3JhYjoKPgo+ICAg
ICAgICAgY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBh
Y2Nlc3MgaXMKPiAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPgo+IEkgYW0gYSBi
aXQgc3VycHJpc2VkIGJ5IHRoZSBuZWFyLXplcm8gdmFsdWVzLiAgQXJlIHRoZXNlIGV4cGVjdGVk
Pwo+IFRoYW5rcyEKClRoaXMgY291bGQgYmUgZXhwZWN0ZWQsIGlmIGZpcm13YXJlIGlzIHRyYXBw
aW5nIHRoZSB1bmFsaWduZWQgYWNjZXNzZXMKYW5kIGNvbWluZyBvdXQgPjEwMHggc2xvd2VyIHRo
YW4gYSBuYXRpdmUgYWNjZXNzLiBJZiB5b3UncmUgaW50ZXJlc3RlZAppbiBnZXR0aW5nIGEgbGl0
dGxlIG1vcmUgcmVzb2x1dGlvbiwgeW91IGNvdWxkIHRyeSB0byBwcmludCBhIGZldyBtb3JlCmRl
Y2ltYWwgcGxhY2VzIHdpdGggc29tZXRoaW5nIGxpa2UgKHNvcnJ5IGdtYWlsIG1hbmdsZXMgdGhl
IHdoaXRlc3BhY2UKb24gdGhpcyk6CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDFjZmJiYTY1
ZDExYS4uMmMwOTQwMzc2NThhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC02MzIsMTEgKzYz
MiwxMSBAQCB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoaW50IGNwdSkKICAgICAgICBpZiAo
d29yZF9jeWNsZXMgPCBieXRlX2N5Y2xlcykKICAgICAgICAgICAgICAgIHNwZWVkID0gUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX0ZBU1Q7CgotICAgICAgIHJhdGlvID0gZGl2X3U2NCgoYnl0ZV9j
eWNsZXMgKiAxMDApLCB3b3JkX2N5Y2xlcyk7Ci0gICAgICAgcHJfaW5mbygiY3B1JWQ6IFJhdGlv
IG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQKYWNjZXNzIGlzICVkLiUwMmQs
IHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgJXNcbiIsCisgICAgICAgcmF0aW8gPSBkaXZfdTY0KChi
eXRlX2N5Y2xlcyAqIDEwMDAwMCksIHdvcmRfY3ljbGVzKTsKKyAgICAgICBwcl9pbmZvKCJjcHUl
ZDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZAphY2Nlc3MgaXMg
JWQuJTA1ZCwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSAlc1xuIiwKICAgICAgICAgICAgICAgIGNw
dSwKLSAgICAgICAgICAgICAgIHJhdGlvIC8gMTAwLAotICAgICAgICAgICAgICAgcmF0aW8gJSAx
MDAsCisgICAgICAgICAgICAgICByYXRpbyAvIDEwMDAwMCwKKyAgICAgICAgICAgICAgIHJhdGlv
ICUgMTAwMDAwLAogICAgICAgICAgICAgICAgKHNwZWVkID09IFJJU0NWX0hXUFJPQkVfTUlTQUxJ
R05FRF9GQVNUKSA/ICJmYXN0IiA6ICJzbG93Iik7CgogICAgICAgIHBlcl9jcHUobWlzYWxpZ25l
ZF9hY2Nlc3Nfc3BlZWQsIGNwdSkgPSBzcGVlZDsKCklmIHlvdSBkaWQsIEknZCBiZSBpbnRlcmVz
dGVkIHRvIHNlZSB0aGUgcmVzdWx0cy4KLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
