Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6E1C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VuBGAgJh2fA9h5DvQjy4S2KUCW3QmJnbQPms39Mmsc=; b=kE7NL0FbE6HUUB
	fcpbgKNOh2cOvbcGm3ROga3B/FibsTv4mcHaZvaJ4wSxgD22VlJUmZ8urcJEM1aQky5i9g2fUO5YD
	yQBcAqNetUwLOlGEw2wkfAzR5rXe3ClUl/8aRvsXIeCSkNwz7uOoKlm/rch+ZWvf/Z0IgFxDH5H+4
	Hx0G9hWzaje4iEbvvn9pWsBOPQdbJLwqEEmrziA6Xgvtjaw/5X7HAzpEquJv7jxMp/jSFuoTNxmH6
	1HU6H56shdVeZM8NAtRNq7HoHrxKnCKDjBWfs4+Al9SDBCVlkS7eedJ/PFQYgrVu3+5jZo0ViT09p
	KCUIAgZh42nAdOYv8uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRwY-00FQLt-1F;
	Wed, 13 Dec 2023 16:18:42 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRwU-00FQK3-2o
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 16:18:41 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5de93b677f4so51740727b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 08:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484317; x=1703089117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLKu1P2+s5HPJe4aX+Y8g8yeSmcwgqyYxJynBDMhKCY=;
        b=IVDGFsMkycMhIe/xf0HktEJ/mkTweCEBHo0vdo/zH4cmopF0YyoRSnpmQ5h2SP/7b6
         0cDMZ9IKCGXM8f3yOvm7Jn5ayW/gTCBQEUW/Gzt4eyDfM+W/FT5pRisZES5UWu3ZNKqg
         iJYqRderhqLDveE6Lrvh2bEYaps718rsssouYZIWZpDFk0XXsUhgjbvhywg7vnv79eyX
         nb8kSFE+xxt/KKxrbhQODAhTyJlrIr+TS3SjVRWXKPBbjFQPu5aoMxHR72wRMr0pA+u0
         nQLzNOzx0HNvHpQ7qEPSoJbBRWAxw9wuukAxFyhG/ryCQkAK64LUKrBTDn0bRdWFKKnO
         iIVg==
X-Gm-Message-State: AOJu0YxLk+QAYoKnegkruI+RRFwg2WDzLg0a91E3Pk7fyol6kPfGnz+/
	fz3ISF912Fss52jYsDydROwKAreo99Vl9w==
X-Google-Smtp-Source: AGHT+IFhEY2aM5rtvuQpwovTsAEAQDQcw9h/MaE3bBo7e+TmomBYWjfgmsz8taJ1gor0s6vxPIfbfA==
X-Received: by 2002:a0d:dfd1:0:b0:5e2:859f:63f4 with SMTP id i200-20020a0ddfd1000000b005e2859f63f4mr1420312ywe.33.1702484316861;
        Wed, 13 Dec 2023 08:18:36 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v126-20020a818584000000b005a7aef2c1c3sm4777040ywf.132.2023.12.13.08.18.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 08:18:36 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbcd4637b05so544939276.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 08:18:36 -0800 (PST)
X-Received: by 2002:a25:bec3:0:b0:db5:49d8:bcd1 with SMTP id
 k3-20020a25bec3000000b00db549d8bcd1mr5064654ybm.55.1702484315962; Wed, 13 Dec
 2023 08:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20231211-primate-arbitrate-fbcd307a0b00@spud> <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
 <20231212-ambition-karma-4834afd4eb16@wendy>
In-Reply-To: <20231212-ambition-karma-4834afd4eb16@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 17:18:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUS4zjgZp4r1CwE-sO7Ggdk2D=fgfHHqaCpW7dR4Prx6A@mail.gmail.com>
Message-ID: <CAMuHMdUS4zjgZp4r1CwE-sO7Ggdk2D=fgfHHqaCpW7dR4Prx6A@mail.gmail.com>
Subject: Re: [PATCH v1] soc: renesas: make ARCH_R9A07G043 depend on !DMA_DIRECT_REMAP
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_081838_910409_F423061B 
X-CRM114-Status: GOOD (  28.49  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgOTo0M+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDA5OjE5
OjMyQU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIE1vbiwgRGVjIDEx
LCAyMDIzIGF0IDExOjA24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiA+ID4KPiA+ID4gUmFuZHkgcmVwb3J0ZWQgeWV0IGFub3RoZXIgYnVpbGQgaXNzdWUgd2l0aCBy
YW5kY29uZmlncyBvbiBydjMyOgo+ID4gPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5j
aWVzIGRldGVjdGVkIGZvciBETUFfR0xPQkFMX1BPT0wKPiA+ID4gICBEZXBlbmRzIG9uIFtuXTog
IUFSQ0hfSEFTX0RNQV9TRVRfVU5DQUNIRUQgWz1uXSAmJiAhRE1BX0RJUkVDVF9SRU1BUCBbPXld
Cj4gPiA+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ID4gPiAgIC0gQVJDSF9SOUEwN0cwNDMgWz15XSAm
JiBTT0NfUkVORVNBUyBbPXldICYmIFJJU0NWIFs9eV0gJiYgTk9OUE9SVEFCTEUgWz15XSAmJiBS
SVNDVl9BTFRFUk5BVElWRSBbPXldICYmICFSSVNDVl9JU0FfWklDQk9NIFs9bl0gJiYgUklTQ1Zf
U0JJIFs9eV0KPiA+ID4KPiA+ID4gVGhpcyBoYXBwZW5zIHdoZW4gRE1BX0RJUkVDVF9SRU1BUCBp
cyBzZWxlY3RlZCBieSB0aGUgVC1IZWFkIENNTyBlcnJhdHVtCj4gPgo+ID4gb3IgYnkgdGhlIFpp
Y2JvbSBleHRlbnNpb24gc3VwcG9ydD8KPgo+IFByb2JhYmx5LCB5ZWFoLiBUaGF0IHdhcyBqdXN0
IHRoZSBjb25kaXRpb25zIGZvciB0aGlzIHBhcnRpY3VsYXIKPiByYW5kY29uZmlnIElJUkMuCj4K
PiA+ID4gb3B0aW9uIGFuZCBETUFfR0xPQkFMX1BPT0wgaXMgc2VsZWN0ZWQgYnkgdGhlIEFuZGVz
IENNTyBlcnJhdHVtLiBCbG9jawo+ID4gPiBzZWxlY3RpbmcgdGhlIFJaL0ZpdmUgY29uZmlnIG9w
dGlvbiwgYW5kIGJ5IGV4dGVuc2lvbiBETUFfR0xPQkFMX1BPT0wsCj4gPiA+IGlmIERNQV9ESVJF
Q1RfUkVNQVAgaGFzIGFscmVhZHkgYmVlbiBlbmFibGVkLgo+ID4gPgo+ID4gPiBGaXhlczogNDg0
ODYxZTA5ZjNlICgic29jOiByZW5lc2FzOiBLY29uZmlnOiBTZWxlY3QgdGhlIHJlcXVpcmVkIGNv
bmZpZ3MgZm9yIFJaL0ZpdmUgU29DIikKPiA+ID4gUmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+ID4gPiBUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1
bmxhcEBpbmZyYWRlYWQub3JnPiAjIGJ1aWxkLXRlc3RlZAo+ID4gPiBDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yNDk0MmI0ZC1kMTZhLTQ2M2YtYjM5YS1mOWRmY2I4OWQ3NDJA
aW5mcmFkZWFkLm9yZy8KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5l
c2FzLWRldmVsIGZvciB2Ni44Lgo+ID4KPiA+IE9yIHNob3VsZCB0aGlzIGJlIHF1ZXVlZCBhcyBh
IGZpeCBmb3IgdjYuNyBpbnN0ZWFkPwo+Cj4gRGVwZW5kcyBvbiB5b3VyIG9waW5pb24gb24gaG93
IGNyaXRpY2FsIHN1Y2ggYSBmaXggaXMgSSBzdXBwb3NlLgo+Cj4gPiA+IC0tLQo+ID4gPiBJIGRv
bid0IGtub3cgd2hhdCB0aGUgZXhhY3QgZml4ZXMgdGFnIGhlcmUgaXMgYXMgSSBkaWQgbm90IGJp
c2VjdCB3aXRoCj4gPiA+IHRoZSByYW5kY29uZmlnLCBzbyBJIGJsYW1lZCB0aGUgb25lIHRoYXQg
YWRkZWQgRE1BX0dMT0JBTF9QT09MLgo+ID4KPiA+IEJpc2VjdGlvbiBsZWFkcyB0byBjb21taXQg
ZGEzMjNkNDY0MDcwNDAwMSAoImRtYS1kaXJlY3Q6IGFkZAo+ID4gZGVwZW5kZW5jaWVzIHRvIENP
TkZJR19ETUFfR0xPQkFMX1BPT0wiKSBpbiB2Ni43LXJjMSwgYnV0IHRoYXQgaXMKPiA+IG1lcmVs
eSBtYWtpbmcgdmlzaWJsZSB0aGUgc3ltcHRvbXMsIHNvIEkgdGhpbmsgeW91ciBGaXhlcyB0YWcg
aXMgZmluZS4KCkFjdHVhbGx5IHRoaXMgY2hhbmdlIGNhbm5vdCBiZSBhcHBsaWVkIChieSBoYW5k
KSB0byB0aGUgY29tbWl0IGluCnRoZSBGaXhlcyB0YWcsIGFzIGF0IHRoYXQgdGltZSBSSVNDVl9E
TUFfTk9OQ09IRVJFTlQgc3RpbGwgc2VsZWN0ZWQKRE1BX0RJUkVDVF9SRU1BUCwgdGh1cyBjYXVz
aW5nIGEgcmVjdXJzaXZlIGRlcGVuZGVuY3kgOi0oClNvIEknbSBnb25uYSBkcm9wIHRoZSBGaXhl
cyB0YWcsIGFuZCBqdXN0IHF1ZXVlIGl0IGZvciB2Ni44LiAgQWZ0ZXIgYWxsCml0J3MgImp1c3Qg
YSByYW5kY29uZmlnIGZhaWx1cmUiLCBhbmQgSSBkb24ndCB3YW50IGFueW9uZSB0byBlbmNvdXJh
Z2UKYmFja3BvcnRpbmcgYW55IG9mIHRoaXMgTk9OUE9SVEFCTEUgbWVzcyB0byBvbGRlciBzdGFi
bGUga2VybmVscy4uLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
