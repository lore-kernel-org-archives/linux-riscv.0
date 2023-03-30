Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3160C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avIrgbqIbH1xttXOyyTycoLtl+3gnpBMudAZ+4RUKeg=; b=LvURcfqZQgq0b6
	x8NE72S9Wpp3g+ddMkQvpKDZfh4jdbDleK8uEyZPCSkTAK32gNwpQg9SsSGE3askjvkja9h+ciO6K
	/uKF7MIy6zNFfPBAVVnGMjOmRQGPZfU3pSWAc0DF1Fz9bU1XRlDHMINHPC2jUjBveBYo7OSncoxI9
	6qqwGFZRwb5EqSNE/05ZX90k5DsvuYkuMkbD0OIf6erURV/z/HOAc80sFOb/IKyNsuJGIr6/O2eMY
	zMjFr3Eu4dVsyiUCBU4Q0+29a5iPD3bsFLCetbUuBEIXRaeyGyUMsKLa66FDugJh+y1d9iTdnAw0M
	I9W066t8Lu74wAyga21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phml7-002u54-1n;
	Thu, 30 Mar 2023 07:31:45 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phml4-002u2f-37
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 07:31:44 +0000
Received: by mail-yb1-f170.google.com with SMTP id p15so22347050ybl.9
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 00:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxN0r0AhgneifQhzqL4mjT7JfsmxnYyFrUEJ452tNfU=;
        b=o+/CFzkKQV+JoEtUXC9mLZvY0S7helT9oss7x2RQ0EHIkZ7kX3O1GhWBfFHni46Kng
         gkknuDwMfWK8FRUm4C9k9h9L5hyrA6LIY46E58/8Nzg++ejoZMLFKYRV9JR/i3/oJr0N
         VDyFAoL3EXXMBlujti+lZ9ufoBRnsxIkmMnXSvmGioewBB+ePOylM3kPNH4pEHW2A/Bp
         7q25/x0huI6M4u+Z0EvYiGIWoNvdgdZmW/iip/didHKm/u3Y2VVBxZ0n3beA1cxcM7M8
         U5Te5UBtTDweNSfTC6ls6iEuZeMzBCU4DocjNI0V48+ElN4IA75fL+sBhs5cuPi4nxaZ
         P4jw==
X-Gm-Message-State: AAQBX9fil7WjHcaV/1bgu822seUgHbW9/OU3B83XfGfOtWU+qR855mD9
	Bw+SkKCKB7TVYMuIf6C2/YL8Iw6lmcrSSQ==
X-Google-Smtp-Source: AKy350bbqQlEVlxm8jPN/fqJOCbW17rTndMJRBQxVSCPVNDH3J4OETxxDENUrdbyO1+C8IMrSA8XAA==
X-Received: by 2002:a25:541:0:b0:9ed:13e9:fe65 with SMTP id 62-20020a250541000000b009ed13e9fe65mr5616566ybf.19.1680161500181;
        Thu, 30 Mar 2023 00:31:40 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id r144-20020a257696000000b00b7a23b337eesm2734763ybc.27.2023.03.30.00.31.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:31:39 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j7so22390058ybg.4
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 00:31:39 -0700 (PDT)
X-Received: by 2002:a25:1185:0:b0:a27:3ecc:ffe7 with SMTP id
 127-20020a251185000000b00a273eccffe7mr2687305ybr.3.1680161499271; Thu, 30 Mar
 2023 00:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230330060105.29460-1-rdunlap@infradead.org> <e1b6f12a-899b-4985-8725-556bcb5d0991@spud>
In-Reply-To: <e1b6f12a-899b-4985-8725-556bcb5d0991@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Mar 2023 09:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2r1f7C_BdXn9BnDktLwHjBA_0Kvq6OeLJ1sZ7azhqkg@mail.gmail.com>
Message-ID: <CAMuHMdW2r1f7C_BdXn9BnDktLwHjBA_0Kvq6OeLJ1sZ7azhqkg@mail.gmail.com>
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	iommu@lists.linux.dev, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	geert+renesas@glider.be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_003143_003677_8C0AAA21 
X-CRM114-Status: GOOD (  31.04  )
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

SGkgQ29ub3IsCgpPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCA4OjI14oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBNYXIgMjksIDIw
MjMgYXQgMTE6MDE6MDVQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+ID4gT24gcmlzY3Y2
NCwgbGludXgtbmV4dC0yMDIzMzAzMCAoYW5kIGZvciBzZXZlcmFsIGRheXMgZWFybGllciksCj4g
PiB0aGVyZSBpcyBhIGtjb25maWcgd2FybmluZzoKPiA+Cj4gPiBXQVJOSU5HOiB1bm1ldCBkaXJl
Y3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBJT01NVV9JT19QR1RBQkxFX0xQQUUKPiA+ICAg
RGVwZW5kcyBvbiBbbl06IElPTU1VX1NVUFBPUlQgWz15XSAmJiAoQVJNIHx8IEFSTTY0IHx8IENP
TVBJTEVfVEVTVCBbPW5dKSAmJiAhR0VORVJJQ19BVE9NSUM2NCBbPW5dCj4gPiAgIFNlbGVjdGVk
IGJ5IFt5XToKPiA+ICAgLSBJUE1NVV9WTVNBIFs9eV0gJiYgSU9NTVVfU1VQUE9SVCBbPXldICYm
IChBUkNIX1JFTkVTQVMgWz15XSB8fCBDT01QSUxFX1RFU1QgWz1uXSkgJiYgIUdFTkVSSUNfQVRP
TUlDNjQgWz1uXQo+ID4KPiA+IGFuZCBidWlsZCBlcnJvcnM6Cj4gPgo+ID4gcmlzY3Y2NC1saW51
eC1sZDogZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAn
Ogo+ID4gaW8tcGd0YWJsZS1hcm0uYzooLmluaXQudGV4dCsweDFlOCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGFsbG9jX2lvX3BndGFibGVfb3BzJwo+ID4gcmlzY3Y2NC1saW51eC1sZDogZHJp
dmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5vOiBpbiBmdW5jdGlvbiBgLkwxNjgnOgo+ID4gaW8t
cGd0YWJsZS1hcm0uYzooLmluaXQudGV4dCsweGFiMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGZyZWVfaW9fcGd0YWJsZV9vcHMnCj4gPiByaXNjdjY0LWxpbnV4LWxkOiBkcml2ZXJzL2lvbW11
L2lwbW11LXZtc2EubzogaW4gZnVuY3Rpb24gYC5MMTQwJzoKPiA+IGlwbW11LXZtc2EuYzooLnRl
eHQrMHhiYzQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmcmVlX2lvX3BndGFibGVfb3BzJwo+
ID4gcmlzY3Y2NC1saW51eC1sZDogZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLm86IGluIGZ1bmN0
aW9uIGAuTDAgJzoKPiA+IGlwbW11LXZtc2EuYzooLnRleHQrMHgxNDVlKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgYWxsb2NfaW9fcGd0YWJsZV9vcHMnCj4gPgo+ID4gQWRkIFJJU0NWIGFzIGFu
IGFsbG93ZWQgQVJDSCBkZXBlbmRlbmN5IHRvIGZpeCB0aGVzZSBwcm9ibGVtcy4KPiA+Cj4gPiBG
aXhlczogZDI4NmE1OGJjOGY0ICgiaW9tbXU6IFRpZHkgdXAgaW8tcGd0YWJsZSBkZXBlbmRlbmNp
ZXMiKQo+ID4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+Cj4gPiBDYzogSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+Cj4gPiBDYzogV2lsbCBE
ZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KPiA+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPgo+ID4gQ2M6IGlvbW11QGxpc3RzLmxpbnV4LmRldgo+ID4gQ2M6IENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4KPiA+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11L0tjb25maWcgfCAgICAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLSBhL2RyaXZlcnMvaW9tbXUvS2NvbmZpZyBiL2RyaXZlcnMvaW9tbXUvS2NvbmZpZwo+ID4g
LS0tIGEvZHJpdmVycy9pb21tdS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2lvbW11L0tjb25m
aWcKPiA+IEBAIC0zMiw3ICszMiw3IEBAIGNvbmZpZyBJT01NVV9JT19QR1RBQkxFCj4gPiAgY29u
ZmlnIElPTU1VX0lPX1BHVEFCTEVfTFBBRQo+ID4gICAgICAgYm9vbCAiQVJNdjcvdjggTG9uZyBE
ZXNjcmlwdG9yIEZvcm1hdCIKPgo+IEknbSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0aGluZyBoZXJl
LCBidXQgd2h5IHdvdWxkIHdlIHdhbnQgdG8gZW5hYmxlCj4gIkFSTXY3L3Y4IExvbmcgRGVzY3Jp
cHRvciBGb3JtYXQiIG9uIFJJU0MtVj8KCkluZGVlZCwgd2Ugc2hvdWxkIG5vdCBlbmFibGUgaXQs
IHVubGVzcyBjb21waWxlLXRlc3RpbmcuCgo+IFdvdWxkIGl0IG5vdCBiZSBiZXR0ZXIgdG8gbWFr
ZSB0aGUgUmVuZXNhcyBkZXBlbmQgb24sIHJhdGhlciB0aGFuCj4gc2VsZWN0IHRoZSBvcHRpb24/
IEl0IGRvZXMgc2VlbSBoaWdobHkgYXJjaCBzcGVjaWZpYywgYW5kIEkgZmVlbCBsaWtlCj4gR2Vl
cnQgcHJldmlvdXNseSBtZW50aW9uZWQgdGhhdCB0aGUgUlovRml2ZSAodGhlaXIgUklTQy1WIG9m
ZmVyaW5nKQo+IGRpZG4ndCB1c2UgaXQuCgpJIHRoaW5rIHRoZSBJUE1NVV9WTVNBIGRlcGVuZGVu
Y3kgc2hvdWxkIGdhaW4KCiAgICAgICAgZGVwZW5kcyBvbiBBUk0gfHwgQVJNNjQgfHwgQ09NUElM
RV9URVNUCgo+ID4gICAgICAgc2VsZWN0IElPTU1VX0lPX1BHVEFCTEUKPiA+IC0gICAgIGRlcGVu
ZHMgb24gQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVAo+ID4gKyAgICAgZGVwZW5kcyBvbiBB
Uk0gfHwgQVJNNjQgfHwgUklTQ1YgfHwgQ09NUElMRV9URVNUCj4gPiAgICAgICBkZXBlbmRzIG9u
ICFHRU5FUklDX0FUT01JQzY0ICAgICMgZm9yIGNtcHhjaGc2NCgpCj4gPiAgICAgICBoZWxwCj4g
PiAgICAgICAgIEVuYWJsZSBzdXBwb3J0IGZvciB0aGUgQVJNIGxvbmcgZGVzY3JpcHRvciBwYWdl
dGFibGUgZm9ybWF0LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
