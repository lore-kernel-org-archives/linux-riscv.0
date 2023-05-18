Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008AEC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGEBf2TZMheTMDvsTqprMImzGL6mVnnQerq3WOxuFRs=; b=LEzhAscvE4gWW2
	tEW85d8cnVdYD0NANOp76kw7xVEb8Pc2/oiK2pZ29mKowrzfLep3y9mXgwBOfwFQ3Tsh4my1r5f9e
	CwCCN7glSUtonHP3Ax2eMQRM5js/k9nsDaR9gz79mZiv/XXdAPFDUWh/YZLcMhv9/t/YytVS0tF3T
	xqGescLmrtch9WgreuFGBVIuivyo1sc/291fQfHNHpv9sHRcG0AQCm/ja/6/BQSpBUvUwZySiuGdD
	vywLuAzSpogLRP3Mxs5okkoPpwL0B8/QOKOg9EbHOJzNPmumnOqJ5DGY2MDYKmn3zbJj6Sv4qpP11
	qTLDQ6ohexGJT1f0i6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXWl-00C8Jd-0D;
	Thu, 18 May 2023 06:54:19 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXWh-00C8I7-1y
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 06:54:17 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96649b412easo263701466b.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1684392852; x=1686984852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZMbvGRBSSGMaxz0Ghtb36uIgcR+JrOIXpj+Zni7fqo=;
        b=3L4pvmOEEs2FgzUIm6H/6fQNVBImOK5ubFHPOSw0n3vR6leMEjiYFcXh5XSsVR9Maq
         TXmlvVzOP/xi7cooFahpE4iKSwyjTnAQGQ35FHzVreg2OjvK5pGt8UMbzgcbDiG2xYnk
         pndW/bxeUi45jdmmVlC3Gjj6o80lqZDE+Z+RGvtjXqZ2q8vUrI4Z+B5fcg00KFKiOlrj
         USqaJxXNihWYCoZeR41H26l7DXYqRC1k4rZ/5+g3LI6gXblP+f661m6Ek78Jbws3g+Ir
         qrSD++DAdJaLABMqvC0M7z74b2hMVXttiDeAcEYirU4PwWoGwOGQfAJd6mjq8+dqInuI
         7tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684392852; x=1686984852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZMbvGRBSSGMaxz0Ghtb36uIgcR+JrOIXpj+Zni7fqo=;
        b=h8ms0Nzv3JuQ+MxMWZIWwtPS3liEcywhwQNW+teG3bS88vhfvelZ2Qu4giwHcMJ2Yn
         KFti1W/V/Fd+JL3BW/+tmsuE2hEEXmgi3pfqBdaFbLOUwcgqZDTeLHzR54QcWCJOuXEE
         OtI9eYseOIv9RCfSqPPdwHj8lThn4uY+FKuCk39QbEF6FVY7nISqNn2vUJtjG7R2Gun6
         TVVsNWd3PffBojEXmF847q4we7UZtJlhAB/Y+7ZkxFQRF8+8TS2Q2tkOrR733P/EhLl4
         GfrdSMjKJsFs004Yik7GqE3B2RqK8NSe6/o9sRbrLAuAXpokJbFB03ZIbftXi+/H7tcC
         a6jQ==
X-Gm-Message-State: AC+VfDx6gE1SjhGhpiO+I9/5QIDUYfmId4o09XABqJHF30dljoNX1EFi
	qGFxHqDEDkSSTJSsK4Uw/xwAHDwBDrLzPDlLYCKtDg==
X-Google-Smtp-Source: ACHHUZ5uWmYXNgFp+u3x+RXg6LSOgTAIVd4YLNPiugpvW7aS+PfPMwwDj04xk9VognXxFCoCji2yesKhXdgH9zReuHs=
X-Received: by 2002:a17:907:8694:b0:96a:1c2a:5a38 with SMTP id
 qa20-20020a170907869400b0096a1c2a5a38mr28043720ejc.11.1684392852058; Wed, 17
 May 2023 23:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy> <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
In-Reply-To: <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 May 2023 12:23:59 +0530
Message-ID: <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Song Shuai <suagrfillet@gmail.com>, robh@kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, palmer@rivosinc.com, jeeheng.sia@starfivetech.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_235415_875472_820ED756 
X-CRM114-Status: GOOD (  40.23  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgODoyNuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAxOjI4
4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGV5IEFsZXgsCj4gPgo+ID4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMTA6NTg6MDJB
TSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE1heSAxNiwgMjAy
MyBhdCAxOjEy4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3
cm90ZToKPiA+Cj4gPiA+ID4gT24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgMTE6MjTigK9BTSBTb25n
IFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IEkgYWN0dWFsbHkg
cmVtb3ZlZCB0aGlzIGZsYWcgYSBmZXcgeWVhcnMgYWdvLCBhbmQgSSBoYXZlIHRvIGFkbWl0IHRo
YXQKPiA+ID4gPiBJIG5lZWQgdG8gY2hlY2sgaWYgdGhhdCdzIG5lY2Vzc2FyeTogdGhlIGdvYWwg
b2YgY29tbWl0IDMzMzUwNjhmODcyMQo+ID4gPiA+ICgicmlzY3Y6IFVzZSBQVUQvUDREL1BHRCBw
YWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nIikgaXMgdG8gZXhwb3NlCj4gPiA+ID4gdGhlICJy
aWdodCIgc3RhcnQgb2YgRFJBTSBzbyB0aGF0IHdlIGNhbiBhbGlnbiB2aXJ0dWFsIGFuZCBwaHlz
aWNhbAo+ID4gPiA+IGFkZHJlc3NlcyBvbiBhIDFHQiBib3VuZGFyeS4KPiA+ID4gPgo+ID4gPiA+
IFNvIEkgaGF2ZSB0byBjaGVjayBpZiBhIG5vbWFwIHJlZ2lvbiBpcyBhY3R1YWxseSBhZGRlZCBh
cyBhCj4gPiA+ID4gbWVtYmxvY2subWVtb3J5LnJlZ2lvbnNbXSBvciBub3Q6IGlmIHllcywgdGhh
dCdzIHBlcmZlY3QsIGxldCdzIGFkZAo+ID4gPiA+IHRoZSBub21hcCBhdHRyaWJ1dGVzIHRvIHRo
ZSBQTVAgcmVnaW9ucywgb3RoZXJ3aXNlLCBJIGRvbid0IHRoaW5rIHRoYXQKPiA+ID4gPiBpcyBh
IGdvb2Qgc29sdXRpb24uCj4gPiA+Cj4gPiA+IFNvIGhlcmUgaXMgdGhlIGN1cnJlbnQgbGluZWFy
IG1hcHBpbmcgd2l0aG91dCBub21hcCBpbiBvcGVuU0JJOgo+ID4gPgo+ID4gPiAtLS1bIExpbmVh
ciBtYXBwaW5nIF0tLS0KPiA+ID4gMHhmZjYwMDAwMDAwMDAwMDAwLTB4ZmY2MDAwMDAwMDIwMDAw
MCAgICAweDAwMDAwMDAwODAwMDAwMDAgICAgICAgICAyTQo+ID4gPiBQTUQgICAgIEQgQSBHIC4g
LiBXIFIgVgo+ID4gPiAweGZmNjAwMDAwMDAyMDAwMDAtMHhmZjYwMDAwMDAwZTAwMDAwICAgIDB4
MDAwMDAwMDA4MDIwMDAwMCAgICAgICAgMTJNCj4gPiA+IFBNRCAgICAgRCBBIEcgLiAuIC4gUiBW
Cj4gPiA+Cj4gPiA+IEFuZCBiZWxvdyB0aGUgbGluZWFyIG1hcHBpbmcgd2l0aCBub21hcCBpbiBv
cGVuU0JJOgo+ID4gPgo+ID4gPiAtLS1bIExpbmVhciBtYXBwaW5nIF0tLS0KPiA+ID4gMHhmZjYw
MDAwMDAwMDgwMDAwLTB4ZmY2MDAwMDAwMDIwMDAwMCAgICAweDAwMDAwMDAwODAwODAwMDAgICAg
ICAxNTM2Swo+ID4gPiBQVEUgICAgIEQgQSBHIC4gLiBXIFIgVgo+ID4gPiAweGZmNjAwMDAwMDAy
MDAwMDAtMHhmZjYwMDAwMDAwZTAwMDAwICAgIDB4MDAwMDAwMDA4MDIwMDAwMCAgICAgICAgMTJN
Cj4gPiA+IFBNRCAgICAgRCBBIEcgLiAuIC4gUiBWCj4gPiA+Cj4gPiA+IFNvIGFkZGluZyBub21h
cCBkb2VzIG5vdCBtaXNhbGlnbiB2aXJ0dWFsIGFuZCBwaHlzaWNhbCBhZGRyZXNzZXMsIGl0Cj4g
PiA+IHByZXZlbnRzIHRoZSB1c2FnZSBvZiAxR0IgcGFnZSBmb3IgdGhpcyBhcmVhIHRob3VnaCwg
c28gdGhhdCdzIGEKPiA+ID4gc29sdXRpb24sIHdlIGp1c3QgbG9zZSB0aGlzIDFHQiBwYWdlIGhl
cmUuCj4gPiA+Cj4gPiA+IEJ1dCBldmVuIHRob3VnaCB0aGF0IG1heSBiZSB0aGUgZml4LCBJIHRo
aW5rIHdlIGFsc28gbmVlZCB0byBmaXggdGhhdAo+ID4gPiBpbiB0aGUga2VybmVsIGFzIGl0IHdv
dWxkIGJyZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBjZXJ0YWluIHZlcnNpb25zIG9mCj4gPiA+IG9w
ZW5TQkkgKmlmKiB3ZSBmaXggb3BlblNCSS4uLlNvIGhlcmUgYXJlIGEgZmV3IHNvbHV0aW9uczoK
PiA+ID4KPiA+ID4gMS4gd2UgY2FuIG1hcmsgYWxsICJtbW9kZV9yZXN2IiBub2RlcyBpbiB0aGUg
ZGV2aWNlIHRyZWUgYXMgbm9tYXAsCj4gPiA+IGJlZm9yZSB0aGUgbGluZWFyIG1hcHBpbmcgaXMg
ZXN0YWJsaXNoZWQgKElJVUMsIHRob3NlIG5vZGVzIGFyZSBhZGRlZAo+ID4gPiBieSBvcGVuU0JJ
IHRvIGFkdmVydGlzZSBQTVAgcmVnaW9ucykKPiA+ID4gICAgIC0+IFRoaXMgYW1vdW50cyB0byB0
aGUgc2FtZSBmaXggYXMgb3BlbnNiaSBhbmQgd2UgbG9zZSB0aGUgMUdCIGh1Z2VwYWdlLgo+ID4K
PiA+IEFGQUlVLCBsb3NpbmcgdGhlIDEgR0IgaHVnZXBhZ2UgaXMgYSByZWdyZXNzaW9uLCB3aGlj
aCB3b3VsZCBtYWtlIHRoaXMKPiA+IG5vdCBhbiBvcHRpb24sIHJpZ2h0Pwo+Cj4gTm90IHN1cmUg
dGhpcyBpcyBhIHJlYWwgcmVncmVzc2lvbiwgSSdkIHJhdGhlciBhdm9pZCBpdCwgYnV0IGFzCj4g
bWVudGlvbmVkIGluIG15IGZpcnN0IGFuc3dlciwgTWlrZSBSYXBvcG9ydCBzaG93ZWQgdGhhdCBp
dCB3YXMgbWFraW5nCj4gbm8gZGlmZmVyZW5jZSBwZXJmb3JtYW5jZS13aXNlLi4uCj4KPiA+Cj4g
PiA+IDIuIHdlIGNhbiB0d2VhayBwZm5faXNfbm9zYXZlIGZ1bmN0aW9uIHRvICpub3QqIHNhdmUg
cGZuIGNvcnJlc3BvbmRpbmcKPiA+ID4gdG8gUE1QIHJlZ2lvbnMKPiA+ID4gICAgIC0+IFdlIGRv
bid0IGxvc2UgdGhlIDFHQiBodWdlcGFnZSBcby8KPiA+ID4gMy4gd2UgY2FuIHVzZSByZWdpc3Rl
cl9ub3NhdmVfcmVnaW9uKCkgdG8gbm90IHNhdmUgdGhlICJtbW9kZV9yZXN2Igo+ID4gPiByZWdp
b25zICh4ODYgZG9lcyB0aGF0Cj4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjQtcmMxL3NvdXJjZS9hcmNoL3g4Ni9rZXJuZWwvZTgyMC5jI0w3NTMpCj4gPiA+ICAgICAt
PiBXZSBkb24ndCBsb3NlIHRoZSAxR0IgaHVnZXBhZ2UgXG8vCj4gPiA+IDQuIEdpdmVuIEplZUhl
bmcgcG9pbnRlciB0bwo+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40
LXJjMS9zb3VyY2Uva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMjTDEzNDAsCj4gPiA+IHdlIGNhbiBt
YXJrIHRob3NlIHBhZ2VzIGFzIG5vbi1yZWFkYWJsZSBhbmQgbWFrZSB0aGUgaGliZXJuYXRpb24K
PiA+ID4gcHJvY2VzcyBub3Qgc2F2ZSB0aG9zZSBwYWdlcwo+ID4gPiAgICAgLT4gVmVyeSBsYXRl
LWluLXRoZS1kYXkgaWRlYSwgbm90IHN1cmUgd2hhdCBpdCdzIHdvcnRoLCB3ZSBhbHNvCj4gPiA+
IGxvc2UgdGhlIDFHQiBodWdlcGFnZS4uLgo+ID4KPiA+IERpdHRvIGhlcmUgcmU6IGludHJvZHVj
aW5nIGFub3RoZXIgcmVncmVzc2lvbi4KPiA+Cj4gPiA+IFRvIG1lLCB0aGUgYmVzdCBzb2x1dGlv
biBpcyAzIGFzIGl0IHdvdWxkIHByZXBhcmUgZm9yIG90aGVyIHNpbWlsYXIKPiA+ID4gaXNzdWVz
IGxhdGVyLCBpdCBpcyBzaW1pbGFyIHRvIHg4NiBhbmQgaXQgYWxsb3dzIHVzIHRvIGtlZXAgMUdC
Cj4gPiA+IGh1Z2VwYWdlcy4KPiA+ID4KPiA+ID4gSSBoYXZlIGJlZW4gdGhpbmtpbmcsIGFuZCB0
byBtZSBub21hcCBkb2VzIG5vdCBwcm92aWRlIGFueXRoaW5nIHNpbmNlCj4gPiA+IHRoZSBrZXJu
ZWwgc2hvdWxkIG5vdCBhZGRyZXNzIHRoaXMgbWVtb3J5IHJhbmdlLCBzbyBpZiBpdCBkb2VzLCB3
ZQo+ID4gPiBtdXN0IGZpeCB0aGUga2VybmVsLgo+ID4gPgo+ID4gPiBMZXQgbWUga25vdyB3aGF0
IHlvdSBhbGwgdGhpbmssIEknbGwgYmUgcHJlcGFyaW5nIGEgUG9DIG9mIDMgaW4gdGhlIG1lYW50
aW1lIQo+ID4KPiA+ICMzIHdvdWxkIHByb2JhYmx5IGdldCBteSB2b3RlIHRvby4gSXQgc2VlbXMg
bGlrZSB5b3UgY291bGQgdXNlIGl0Cj4gPiBkeW5hbWljYWxseSBpZiB0aGVyZSB3YXMgdG8gYmUg
YSBmdXR1cmUgb3RoZXIgcHJvdmlkZXIgb2YgIm1tb2RlX3Jlc3YiCj4gPiByZWdpb25zLCByYXRo
ZXIgdGhhbiBkb2luZyBzb21ldGhpbmcgbG9jYXRpb24tc3BlY2lmaWMuCj4gPgo+ID4gV2Ugc2hv
dWxkIHByb2JhYmx5IGRvY3VtZW50IHRoZXNlIG9wZW5zYmkgcmVzZXJ2ZWQgbWVtb3J5IG5vZGVz
IHRob3VnaAo+ID4gaW4gYSBkdC1iaW5kaW5nIG9yIHcvZSBpZiB3ZSBhcmUgZ29pbmcgdG8gYmUg
cmVseWluZyBvbiB0aGVtIHRvIG5vdAo+ID4gY3Jhc2ghCgpEZXBlbmRpbmcgb24gYSBwYXJ0aWN1
bGFyIG5vZGUgbmFtZSBpcyBmcmFnaWxlLiBJZiB3ZSByZWFsbHkgbmVlZAppbmZvcm1hdGlvbiBm
cm9tIERUIHRoZW4gSSBzdWdnZXN0IGFkZGluZyAibm8tc2F2ZS1yZXN0b3JlIiBEVApwcm9wZXJ0
eSBpbiByZXNlcnZlZCBtZW1vcnkgbm9kZXMuCgo+Cj4gWWVzLCB5b3UncmUgcmlnaHQsIGxldCdz
IHNlZSB3aGF0IEF0aXNoIGFuZCBBbnVwIHRoaW5rIQoKSSB0aGluayB3ZSBoYXZlIHR3byBwb3Nz
aWJsZSBhcHByb2FjaGVzOgoKMSkgVXBkYXRlIE9wZW5TQkkgdG8gc2V0ICJuby1tYXAiIERUIHBy
b3BlcnR5IGZvciBmaXJtd2FyZQogICAgcmVzZXJ2ZWQgcmVnaW9ucy4gV2Ugd2VyZSBkb2luZyB0
aGlzIHByZXZpb3VzbHkgYnV0IHJlbW92ZWQKICAgIGl0IGxhdGVyIGZvciBwZXJmb3JtYW5jZSBy
ZWFzb25zIG1lbnRpb25lZCBieSBBbGV4LiBJdCBpcyBhbHNvCiAgICB3b3J0aCBtZW50aW9uaW5n
IHRoYXQgQVJNIFRydXN0ZWQgRmlybXdhcmUgYWxzbyBzZXRzICJuby1tYXAiCiAgICBEVCBwcm9w
ZXJ0eSBmb3IgZmlybXdhcmUgcmVzZXJ2ZWQgcmVnaW9ucy4KCjIpIEFkZCBhIG5ldyAibm8tc2F2
ZS1yZXN0b3JlIiBEVCBwcm9wZXJ0eSBpbiB0aGUgcmVzZXJ2ZWQKICAgIG1lbW9yeSBEVCBiaW5k
aW5ncy4gVGhlIGhpYmVybmF0ZSBzdXBwb3J0IG9mIExpbnV4IGFyY2gvcmlzY3YKICAgIHdpbGwg
dXNlIHRoaXMgRFQgcHJvcGVydHkgdG8gZXhjbHVkZSBtZW1vcnkgcmVnaW9ucyBmcm9tCiAgICBz
YXZlLXJlc3RvcmUuIFRoZSBFRkkgaW1wbGVtZW50YXRpb24gb2YgRURLMiBhbmQgVS1Cb290CiAg
ICBzaG91bGQgZG8gdGhlIGZvbGxvd2luZzoKICAgIDEpIFRyZWF0IGFsbCBtZW1vcnkgaGF2aW5n
ICJuby1tYXAiIERUIHByb3BlcnR5IGFzIEVGSQogICAgICAgIHJlc2VydmVkIG1lbW9yeQogICAg
MikgVHJlYXQgYWxsIG1lbW9yeSBub3QgaGF2aW5nICJuby1tYXAiIERUIHByb3BlcnR5IGFuZAog
ICAgICAgIG5vdCBoYXZpbmcgIm5vLXNhdmUtcmVzdG9yZSIgRFQgcHJvcGVydHkgYXMgRWZpQm9v
dFNlcnZpY2VzRGF0YQogICAgMykgVHJlYXQgYWxsIG1lbW9yeSBub3QgaGF2aW5nICJuby1tYXAi
IERUIHByb3BlcnR5IGFuZAogICAgICAgICBoYXZpbmcgIm5vLXNhdmUtcmVzdG9yZSIgRFQgcHJv
cGVydHkgYXMgRWZpUnVudGltZVNlcnZpY2VEYXRhCiAgICAgICAgIChSZWZlciwKaHR0cHM6Ly9k
ZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIz
LWRldmljZW5vZGVzLmh0bWwjcmVzZXJ2ZWQtbWVtb3J5LWFuZC11ZWZpKQoKUGVyc29uYWxseSwg
SSBhbSBsZWFuaW5nIHRvd2FyZHMgYXBwcm9hY2gjMSBzaW5jZSBhcHByb2FjaCMyCndpbGwgcmVx
dWlyZSBjaGFuZ2luZyBEZXZpY2VUcmVlIHNwZWNpZmljYXRpb24gYXMgd2VsbC4KClJlZ2FyZHMs
CkFudXAKCj4KPiBUaGFua3MgZm9yIHlvdXIgcXVpY2sgYW5zd2VycyBDb25vciBhbmQgU29uZywg
cmVhbGx5IGFwcHJlY2lhdGVkIQo+Cj4gQWxleAo+Cj4gPgo+ID4gVGhhbmtzIGZvciB3b3JraW5n
IG9uIHRoaXMsCj4gPiBDb25vci4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
