Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6BC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbMLPDTSqhacidGzegfZNbaUoIBGq0ksnnmnwcH0gOU=; b=mUz8FqW7Ux6JJO
	U14pf0FZAF385Dp852gI0+5Q6Hk4AiO7nRmE1nk0tBDT02zHPjHCCq5UHbBvWeALN+3pV7dY3T8i/
	HaucHj4xfVKQ4pwEtFvzfcMssHCXXOlQmryRZdtbcXioHhrRraT4WcaLANIHQzvg/MX3hxXRIGrrA
	kerMbsZTDr9Y5Dc7sZBHbvwsGI74CyNhs6Yi/mmR2LuNth49sRFa5ogBoFpi3K3HYryy671xQcFRI
	N/0opbO/JGMZTfDPSPD3TmY3EEBAaaoRTCyIreiL1zyOQa9UEguRcuLZB7LdPWK/v1DP2zNQvPhNC
	VoARMlZ3BNm9N/nAKCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBXF-0006TY-Ew; Thu, 08 Sep 2022 07:01:13 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBX7-0006Qu-Cp
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 07:01:11 +0000
Received: by mail-qk1-f170.google.com with SMTP id a10so12191758qkl.13
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 00:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fqGh8aE73orRi3PD0A1JVDOgqPEzP/eUkgDD6hWkr2g=;
        b=uFL1Wxq7CGQLM+acepAYnOSKQQHSN7pfgbHbrVPivaLpzLtlMGk3gZzSNgQRLzG2yx
         LN/L+f/uC/GTiJx3PrUHT1VKUDwB+M4fEy6jJogPJNJricV7625cjDFjNUKsqzUt64xu
         nzFiCraVO/arV6xoe5+9QkJE7YUOlnHunzcfDZB2+OL3WomnVWt/rVQaod/J6z+By1h0
         GSF1vFSNVF5Ye0y2oAnuOoKlmXtXUqt/jAuiadRLhkgntfGT/k72mPBkjw98yvXQvuwS
         xVKOwSJCIpteQD4h9acFMo3YotFGNXlNAnMLCOzk3pC3pUshbDKOLph2GwjS3Pan/wFQ
         TKAA==
X-Gm-Message-State: ACgBeo1n4nqW0dhMnYsTvaditZMarAE/ptyreYzjr/jej1kOBJjKtcJr
	U55kJwJ5kxJZqvmvuzrjt0NlXb3T8iWfuA==
X-Google-Smtp-Source: AA6agR5SNio1NcDrFluOIqtcPZyj8MOwrshm37nAA7yUDpwuDc9DnGGTc35LfZdnO8P/MSPIF3sQnA==
X-Received: by 2002:a05:620a:c50:b0:6b9:6e6:428d with SMTP id u16-20020a05620a0c5000b006b906e6428dmr5375270qki.280.1662620462796;
        Thu, 08 Sep 2022 00:01:02 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id fe7-20020a05622a4d4700b00342fc6a8e25sm14428703qtb.50.2022.09.08.00.01.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 00:01:01 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 130so24988422ybw.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 00:01:01 -0700 (PDT)
X-Received: by 2002:a25:8247:0:b0:6a9:443a:cc0b with SMTP id
 d7-20020a258247000000b006a9443acc0bmr6067365ybn.89.1662620461133; Thu, 08 Sep
 2022 00:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
 <7423117.EvYhyI6sBW@kista> <84f28dc3-3b65-ea70-4fa4-765d0c773c28@microchip.com>
In-Reply-To: <84f28dc3-3b65-ea70-4fa4-765d0c773c28@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Sep 2022 09:00:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVcoHqPa5AqoPqvw=ZuHdqG7p5HWOHUx9ecNZvzUG4Xw@mail.gmail.com>
Message-ID: <CAMuHMdWVcoHqPa5AqoPqvw=ZuHdqG7p5HWOHUx9ecNZvzUG4Xw@mail.gmail.com>
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_000105_460092_F68FEB89 
X-CRM114-Status: GOOD (  21.41  )
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

SGkgQ29ub3IsCgpDQyBzb2MgcGVvcGxlCgpPbiBXZWQsIFNlcCA3LCAyMDIyIGF0IDEwOjQzIFBN
IDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gT24gMDYvMDkvMjAyMiAyMToy
OSwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+ID4gRG5lIMSNZXRydGVrLCAwMS4gc2VwdGVtYmVy
IDIwMjIgb2IgMjA6MTA6MTMgQ0VTVCBqZSBQYWxtZXIgRGFiYmVsdCBuYXBpc2FsKGEpOgo+ID4+
IE9uIFN1biwgMTQgQXVnIDIwMjIgMjI6MDg6MDMgUERUICgtMDcwMCksIHNhbXVlbEBzaG9sbGFu
ZC5vcmcgd3JvdGU6Cj4gPj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGkt
ZDEtY2xvY2t3b3JrcGktdjMuMTQuZHRzIGNyZWF0ZQo+ID4+PiAgbW9kZSAxMDA2NDQKPiA+Pj4g
IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1jb21tb24tcmVndWxhdG9y
cy5kdHNpIGNyZWF0ZQo+ID4+PiAgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VuMjBpLWQxLWRldnRlcm0tdjMuMTQuZHRzCj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQKPiA+Pj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1kb25nc2hh
bi1uZXpoYS1zdHUuZHRzIGNyZWF0ZQo+ID4+PiAgbW9kZSAxMDA2NDQKPiA+Pj4gIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1saWNoZWUtcnYtODYtcGFuZWwtNDgwcC5k
dHMKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VuMjBpLWQxLWxpY2hlZS1ydi04Ni1wYW5lbC03MjBwLmR0cwo+ID4+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0Cj4gPj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4y
MGktZDEtbGljaGVlLXJ2LTg2LXBhbmVsLmR0c2kgY3JlYXRlCj4gPj4+ICBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LWRvY2suZHRz
Cj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIv
c3VuMjBpLWQxLWxpY2hlZS1ydi5kdHMKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4+PiAg
YXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLW1hbmdvcGktbXEtcHJvLmR0
cyBjcmVhdGUgbW9kZQo+ID4+PiAgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bjIwaS1kMS1uZXpoYS5kdHMgY3JlYXRlIG1vZGUKPiA+Pj4gIDEwMDY0NCBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEuZHRzaQo+ID4+Cj4gPj4gSSdtIGFzc3VtaW5n
IHRoZXNlIGFyZSBhaW1lZCBhdCB0aGUgUklTQy1WIHRyZWU/ICBJJ20gZ2VuZXJhbGx5IE9LIHdp
dGgKPiA+PiB0aGF0LCB0aG91Z2ggdGhlIERUIGZvbGtzIGhhdmUgcG9pbnRlZCBvdXQgYSBoYW5k
ZnVsIG9mIGlzc3VlcyB0aGF0IGxvb2sKPiA+PiBwcmV0dHkgcmVhc29uYWJsZSB0byBtZS4KPiA+
Cj4gPiBEVCBjaGFuZ2VzIGZvciBBbGx3aW5uZXIgQVJNIFNvQ3MgZ28gdHJvdWdoIHN1bnhpIHRy
ZWUuIFNob3VsZCB0aGlzIGJlIGhhbmRsZWQKPiA+IGRpZmZlcmVudGx5IGZvciBSSVNDLVY/Cj4K
PiBNaWNyb2NoaXAgUklTQy1WIERUIGdvIHZpYSBhIE1pY3JvY2hpcCB0cmVlIHRvIFBhbG1lci4g
VGhlIG90aGVyIHN0dWZmIGdldHMKPiBwaWNrZWQgZGlyZWN0bHkgYnkgaGltIGFzIGl0IGhhcyBu
byBjbGVhciAib3duZXIiLiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UKPiB0byBiZSBjb25zaXN0
ZW50IGZvciB0aGUgbmV3IHtyZW5lc2FzLHN1bnhpfSBzdHVmZiBhbmQgc2VuZCB0aG9zZSB2aWEg
dmVuZG9yCj4gdHJlZXMgdG8gUGFsbWVyIHRvby4gSnVzdCBteSAyIGNlbnRzLi4uCgpXYXNuJ3Qg
dGhlIGludGVudGlvbiBiZWhpbmQgdGhlIHJlbmFtZSBzL2FybS1zb2Mvc29jLyB0byBzdGFydAph
Y2NlcHRpbmcgUFJzIGZvciBub24tYXJtIERULCB0b28/CkVzcGVjaWFsbHkgaWYgd2Ugc3RhcnQg
aGF2aW5nIGRlcGVuZGVuY2llcyBkdWUgdG8gcmlzY3YgRFRTIGZpbGVzCmluY2x1ZGluZyBhcm02
NCBEVFMgc25pcHBldHMgdGhyb3VnaCBzY3JpcHRzL2R0Yy9pbmNsdWRlLXByZWZpeGVzL2FybTY0
Ly4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
