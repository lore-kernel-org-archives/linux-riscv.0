Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A2CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwF6DtFXXrlrfhUJAgnAvNbO/TSv1G7OHydUp6xfE4A=; b=TqPt/KtbFS4EIP
	IIJftVuv3XWFOSjKUWG9HWWXg3QZJGiF/c5N7F2lo863Ci7ODC4e4Aat0YPbhyzNK1zKyZ/XWR3np
	GB1uzCkb9YUTPBkg4LOu0rB/yZwkAUGB4BZNoChRWWo0jCkr0d/82Sib2fdJwKsN2VpzujwHNKJ4n
	fWiP4uy+YjRXYU0J5ScgpH2rncPWNXdqdWklaVyqHtYKJ+bu7SdicI99teSMJMRXEVJKCDNpndBP+
	2EGdtkTWVAbif86Upg1aBc7BkMFyUSsx8E8UqBseRjWWl5Lt6pO6PQt5jYqGiEDTzCYQqWBQg0Nu4
	U6T35vwCynN1cuK3Hh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZKM-00GJvS-0B;
	Wed, 28 Jun 2023 17:51:38 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZKI-00GJuI-2J
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:51:36 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69923a715so1589231fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687974691; x=1690566691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIfoyCpUUajyFpMhMqY2mJy3ksaLY6ORUfahwyFeKps=;
        b=PZhSyKn0rBq8tzcP5Bek1yLJg+XNjZNPiL4LicVXac8ZOnPsWOnWA/9I80VfEM4619
         g5ay6vTG1iOzQj4ZH+Ab5XNGun/Iazle8Ji9pUkAGLMi2e0llijrwn+V/yw5k+v/9Luh
         RzJbb8msOTGWs80BMmcTGN4oLQohW5sbBQId13ax1T8cACnTMXSM57HORJikYJABP05Y
         2AX9yXWr89Mwke4BESf25avuAOE7dLikndEcqN49udXL2cEUvH21ZM8j0MuNZ9J6gnou
         jI1RYyDbtxgC9SexfytFdTs6FJo2prck5CqbvHYZFhbG0bmUDr6FmBp4iMJnL9/K/rYm
         7JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687974691; x=1690566691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIfoyCpUUajyFpMhMqY2mJy3ksaLY6ORUfahwyFeKps=;
        b=FNnNruTah0dyQxxvLKCf1e98IoWXQseLUxAQONzgsO+JyL3f6CANK2cUPuuZYyydK/
         8joTy8PoHofw0xxcPWD9CDMXtJJABkzhbxeV9nrwS2dYt/vB5hi112t+gQbHrix8szX+
         atMj2bebvgjNydi1l9T9zAeWpXhJ56PwVeqeap/laWPKzM3FGPDfhx3vN2Iv9qJyPCiF
         SjSuchQQDXxJhE/0SwPKqf4JRgk6HHSeFX+EuOZTd5VPa8Gzq/7UNm7K2LXUsbC+umQE
         UofMZqPlo8oIuACVup59fPLmU783Q9OWCvRquagRo1n5CdjF44vqlN+Epto05YSO+Q2+
         Hm+A==
X-Gm-Message-State: AC+VfDxFzl1scOmxfmyAcZXBttmy5UIvIHSETVEsv2SLO3S04fYidqEo
	fSCScOla4m5oftxxaxaNBwS8mWXZMNpCTxbPHAywLg==
X-Google-Smtp-Source: ACHHUZ5owY13ULc/O32xrPfk+xUrhF3ccAD9wXq9jBAmvoET+2nZVQozOcdx0DwQxDw2S4OBcBUVCT2CQpLzucnAlkE=
X-Received: by 2002:a2e:3e08:0:b0:2b6:9ed0:46f4 with SMTP id
 l8-20020a2e3e08000000b002b69ed046f4mr8648646lja.23.1687974691162; Wed, 28 Jun
 2023 10:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230626-provable-angrily-81760e8c3cc6@wendy> <20230626-sensuous-clothing-124f7ae0aedf@wendy>
 <CALs-HstDV3PjBk_8WDecwuvVK9rno1CKFzT1+8ohoUXE7X0GwA@mail.gmail.com> <20230628-gizzard-trading-a5f9785128b5@spud>
In-Reply-To: <20230628-gizzard-trading-a5f9785128b5@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 28 Jun 2023 10:50:55 -0700
Message-ID: <CALs-HsvdXu+Ag50FpdCRthZamP+pzsqhxr2rnA+=Ko_sZ98z9A@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] RISC-V: add single letter extensions to riscv_isa_ext
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_105134_761028_BF115B80 
X-CRM114-Status: GOOD (  23.42  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTA6NDPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTA6MzM6MjBBTSAt
MDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDQ6MjHi
gK9BTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gU28gdGhhdCByaXNjdl9maWxsX2h3Y2FwKCkgY2FuIHVzZSByaXNjdl9pc2FfZXh0
IHRvIHByb2JlIGZvciBzaW5nbGUKPiA+ID4gbGV0dGVyIGV4dGVuc2lvbnMsIGFkZCB0aGVtIHRv
IGl0LiByaXNjdl9pc2FfZXh0X2RhdGEgZ3Jvd3MgYSBuZXcKPiA+ID4gbWVtYmVyLCBzaWduaWZ5
aW5nIHdoZXRoZXIgYW4gZXh0ZW5zaW9uIGlzIG11bHRpLWxldHRlciAmIHRodXMgcmVxdWlyaW5n
Cj4gPiA+IHNwZWNpYWwgaGFuZGxpbmcuCj4gPiA+IEFzIGEgcmVzdWx0LCB3aGF0IGdldHMgc3Bh
dCBvdXQgaW4gL3Byb2MvY3B1aW5mbyB3aWxsIGJlY29tZSBib3JrZWQsIGFzCj4gPiA+IHNpbmds
ZSBsZXR0ZXIgZXh0ZW5zaW9ucyB3aWxsIGJlIHByaW50ZWQgYXMgcGFydCBvZiB0aGUgYmFzZSBl
eHRlbnNpb25zCj4gPiA+IGFuZCB3aGlsZSBwcmludGluZyBmcm9tIHJpc2N2X2lzYV9hcnIuIFRh
a2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVuaWZ5IHRoZQo+ID4gPiBwcmludGluZyBvZiB0aGUgaXNh
IHN0cmluZywgdXNpbmcgdGhlIG5ldyBtZW1iZXIgb2YgcmlzY3ZfaXNhX2V4dF9kYXRhCj4gPiA+
IGluIHRoZSBwcm9jZXNzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCB8ICAxICsKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5j
ICAgICAgICB8IDM2ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyB8IDU2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0K
PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ID4gaW5kZXggYTM1YmVlMjE5ZGQ3
Li42YWQ4OTZkYzQzNDIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ID4g
QEAgLTc3LDYgKzc3LDcgQEAgdW5zaWduZWQgbG9uZyByaXNjdl9nZXRfZWxmX2h3Y2FwKHZvaWQp
Owo+ID4gPiAgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSB7Cj4gPiA+ICAgICAgICAgY29uc3Qg
dW5zaWduZWQgaW50IGlkOwo+ID4gPiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4gPiA+ICsg
ICAgICAgY29uc3QgYm9vbCBtdWx0aV9sZXR0ZXI7Cj4gPgo+ID4gSW5zdGVhZCBvZiBkZWZpbmlu
ZyBhIG5ldyBtZW1iZXIsIGNvdWxkIHdlIGp1c3QgaW5mZXIgdGhpcyBieSBtYWtpbmcgYQo+ID4g
bWFjcm8gbGlrZSAjZGVmaW5lIE1VTFRJX0xFVFRFUihuYW1lKSAobmFtZVswXSAmJiBuYW1lWzFd
KT8KPgo+IE9yIGRvbid0IGV2ZW4gdHJ5IHRvIGJlIGNsZXZlciBsaWtlIHRoaXMgYW5kIGp1c3Qg
Y2FsbCBzdHJubGVuIG9uIHRoZQo+IG5hbWUgJiBjaGVjayBpZiBpdCBpcyAxPyBJdCdzIG9ubHkg
dXNlZCBpbiAyIHBsYWNlcy4KClNvdW5kcyBnb29kIHRvIG1lIQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
