Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270DAC04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dngum5V23JY6HWwZmPCNkWdDwFHf6HUbbFWDoA9JLcQ=; b=c1jDUiw5K2GoQx
	Ns+TNlIQrs/YDNgk+FoGBlCeFRz3OqshkPKRpXutYBDDriN18leyVm5SEg9mUe4/asnbm4JGmLGx6
	OZoukpr0Sav9trj4hHoFDgPOYmX2zp17NRUu9m5voPtRZAkJbCb///hu/jzMVt1ZHGVGLI2WvCIBm
	ZSHNBNo7j9sg9Bj+ZiZgR4p4nHOQ7Rrto8dRjul+c0sk6bZvHqL9PcHwYCK8h02ZeeEb56hOIKIQH
	F2cZUAbAzBpfU/65ur/3++YkQBzG53MM7brpZnPBqT8hpL36w0lBaVaZug4LDAFnN0atcn41TAqOS
	ngguOChk1iyLNsscOxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTlcd-005LoV-30;
	Wed, 09 Aug 2023 16:01:19 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTlca-005Ln9-0y
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 16:01:18 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso106688341fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691596871; x=1692201671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmgpwKweUBvnZQcPdFoC9MdkzhMuBI6uRHvN8TUCXgk=;
        b=v0emInrRUcUXckendWIFEAny0gpskG37JaiU/U/4wZhpwYxL2hUZgmWDSHRIQcbtjQ
         A+MD2II+LaHNTEorEV82vpnnt35GV6t6wLUI3SlIteG6j/AdaUASoUt8Vmg/5bkYxyTo
         vEwle83655BEXExn/pMnhQNd6XFMOWFfX58ooLptZajx6zfGAEk0R4Roam5b3+y9wgQ4
         0+npNFCqPJzyOQXHrbC6kBiNi/jtBwWU0as3k6udONDCP7Jkyo2ag4JAs5YTP7jHrbJX
         GlcAunwIA+sOX04kb2nsyBP2mJot7KTLbYDaNNPdLFMYu4fG4kp2RU2Atd3wS3K8caRf
         Ta6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691596871; x=1692201671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmgpwKweUBvnZQcPdFoC9MdkzhMuBI6uRHvN8TUCXgk=;
        b=iNnuy7e7dZe2M5mjjMaDe0v1aF2tYWyipRTxt4SsWci1iZ7ATNIWIZfxYsFuiMFvxp
         XFZQDY+/gz0oXGZ1RqmnYX+Sju71i3N15WryTzr3CjGXMhpQ+X5xaZQhUMZ7mnarLIoo
         h/Oy0JaYycWU204a7RnQdNQmE9mvKSNt1Q78s/PrZ+iG9XMr3gUopm98QR8plimw8Rws
         a1GApqmh6luOOrHwK6Q8KXMs9AHeykLrqM4ylzVAey0x5FB15HqZkDRemBuWkn5nso36
         Wg3FoUQD6PIDpRld5k4j9n/aaB+VsHC+iB75eTcN/OqY/YHsVLEBTapcFQ5Ikgx4nIrP
         WqfA==
X-Gm-Message-State: AOJu0YymjHHRLtITACK50dnqh9BjuEDGt4GpJ06AO1qUXdZF9Tu4ajLb
	yH9lwVuQmHbstnCrDIcnqt+mSb8980x9yg3/AquLpA==
X-Google-Smtp-Source: AGHT+IGS5WSW3qFItTpdAmiUWPvNTsezScWsUA0KZDshrBpAy3kNMUx7+vJk0BDKizkh0eyTnrfH1YU1TmrcXi7I9d0=
X-Received: by 2002:a2e:8953:0:b0:2b6:e651:8591 with SMTP id
 b19-20020a2e8953000000b002b6e6518591mr2328490ljk.37.1691596871254; Wed, 09
 Aug 2023 09:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230809115516.214537-8-ajones@ventanamicro.com> <20230809115516.214537-10-ajones@ventanamicro.com>
In-Reply-To: <20230809115516.214537-10-ajones@ventanamicro.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 9 Aug 2023 09:00:35 -0700
Message-ID: <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_090116_561587_98A63B2D 
X-CRM114-Status: GOOD (  18.60  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCA0OjU14oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIFppY2JveiBpcyBwcmVzZW50LCBlbmFibGUg
aXRzIGluc3RydWN0aW9uIChjYm8uemVybykgaW4KPiB1c2VybW9kZSBieSBzZXR0aW5nIGl0cyBy
ZXNwZWN0aXZlIHNlbnZjZmcgYml0LiBXZSBkb24ndCBib3RoZXIKPiB0cnlpbmcgdG8gc2V0IHRo
aXMgYml0IHBlci10YXNrLCB3aGljaCB3b3VsZCBhbHNvIHJlcXVpcmUgYW4KPiBpbnRlcmZhY2Ug
Zm9yIHRhc2tzIHRvIHJlcXVlc3QgZW5hYmxpbmcgYW5kL29yIGRpc2FibGluZy4gSW5zdGVhZCwK
PiBwZXJtYW5lbnRseSBzZXQgdGhlIGJpdCBmb3IgZWFjaCBoYXJ0IHdoaWNoIGhhcyB0aGUgZXh0
ZW5zaW9uIHdoZW4KPiBicmluZ2luZyBpdCBvbmxpbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCB8ICAyICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmggICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAg
ICB8IDE2ICsrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
ICAgICAgfCAgNiArKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAg
fCAgNCArKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyAgICAgICAgIHwgIDQgKysr
Kwo+ICA2IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3B1ZmVhdHVyZS5oCj4gaW5kZXggMjNmZWQ1M2I4ODE1Li43ODhmZDU3NWMyMWEgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IEBAIC0zMCw0ICszMCw2IEBAIERFQ0xB
UkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7Cj4gIC8qIFBlci1jcHUg
SVNBIGV4dGVuc2lvbnMuICovCj4gIGV4dGVybiBzdHJ1Y3QgcmlzY3ZfaXNhaW5mbyBoYXJ0X2lz
YVtOUl9DUFVTXTsKPgo+ICt2b2lkIHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKTsKPiArCj4g
ICNlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IGluZGV4IDdiYWM0M2EzMTc2ZS4uZTE4N2U3NmUz
ZGY0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gQEAgLTI3Myw2ICsyNzMsNyBAQAo+ICAjZGVm
aW5lIENTUl9TSUUgICAgICAgICAgICAgICAgICAgICAgICAweDEwNAo+ICAjZGVmaW5lIENTUl9T
VFZFQyAgICAgICAgICAgICAgMHgxMDUKPiAgI2RlZmluZSBDU1JfU0NPVU5URVJFTiAgICAgICAg
IDB4MTA2Cj4gKyNkZWZpbmUgQ1NSX1NFTlZDRkcgICAgICAgICAgICAweDEwYQo+ICAjZGVmaW5l
IENTUl9TU0NSQVRDSCAgICAgICAgICAgMHgxNDAKPiAgI2RlZmluZSBDU1JfU0VQQyAgICAgICAg
ICAgICAgIDB4MTQxCj4gICNkZWZpbmUgQ1NSX1NDQVVTRSAgICAgICAgICAgICAweDE0Mgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKPiBpbmRleCBmMDQxYmZhN2Y2YTAuLjQ5MjlmYWVjYjc1ZiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBAQCAtNjYsNiArNjYsNyBAQAo+ICAjaWZuZGVmIF9f
QVNTRU1CTFlfXwo+Cj4gICNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4gKyNpbmNsdWRl
IDxhc20vY3B1ZmVhdHVyZS5oPgo+Cj4gIHVuc2lnbmVkIGxvbmcgcmlzY3ZfZ2V0X2VsZl9od2Nh
cCh2b2lkKTsKPgo+IEBAIC0xMzAsNiArMTMxLDIxIEBAIHJpc2N2X2hhc19leHRlbnNpb25fdW5s
aWtlbHkoY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAg
fQo+Cj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl90aGlzX2NwdV9oYXNfZXh0
ZW5zaW9uX2xpa2VseShjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKPiArewo+ICsgICAgICAgaWYg
KElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNjdl9oYXNfZXh0ZW5z
aW9uX2xpa2VseShleHQpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiArCj4gKyAg
ICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtzbXBf
cHJvY2Vzc29yX2lkKCldLmlzYSwgZXh0KTsKPiArfQo+ICsKPiArc3RhdGljIF9fYWx3YXlzX2lu
bGluZSBib29sIHJpc2N2X3RoaXNfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoY29uc3QgdW5z
aWduZWQgbG9uZyBleHQpCj4gK3sKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19SSVND
Vl9BTFRFUk5BVElWRSkgJiYgcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShleHQpKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiArCj4gKyAgICAgICByZXR1cm4gX19yaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtzbXBfcHJvY2Vzc29yX2lkKCldLmlzYSwg
ZXh0KTsKPiArfQoKQW5vdGhlciB3YXkgdG8gZG8gdGhpcyB3b3VsZCBiZSB0byBhZGQgYSBwYXJh
bWV0ZXIgdG8KcmlzY3ZfaGFzX2V4dGVuc2lvbl8qKCkgKGFzIHRoZXJlIGFyZSB2ZXJ5IGZldyB1
c2VycyksIHRoZW4gdGhlc2UgbmV3CmZ1bmN0aW9ucyBjYW4gdHVybiBhcm91bmQgYW5kIGNhbGwg
dGhvc2Ugd2l0aCB0aGUgbmV3IHBhcmFtZXRlciBzZXQgdG8KaGFydF9pc2Fbc21wX3Byb2Nlc3Nv
cl9pZCgpXS5pc2EuIEl0J3MgYSB0b3NzdXAsIHNvIHVwIHRvIHlvdS4gVGhlCm9ubHkgYWR2YW50
YWdlIHRvIGl0IEkgY2FuIGFyZ3VlIGlzIGl0IGtlZXBzIHRoZSBjb2RlIGZsb3dzIG1vcmUKdW5p
ZmllZC4KCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
