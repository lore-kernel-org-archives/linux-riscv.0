Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3BFEE4996
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6CotSBaecM1gZAjkPzMcraNieHtMou6xGFrjdOdqRo=; b=H9HxJKYmJzqJrG
	ZbqqLP8dG5o/FFAK4DCP5WMxXjqzsnU/oUUSz3iOQfnlf/trBRqE9d2cRyPDlWvutD1+pqW6tfCwW
	cuP+U7RAAHqACHuFVCy6uXcjAbdETJY3kTQwrgr6B1isQhfwFOe461gq7FYqEh9JUgaYW9PK4vFAb
	6J/WdSmojBTi9xdU8293hTaVWVXs1SfFRi7NuMxwCZWNlCyjdHfFKFRzgSJs2I7TiTK0OgK/L+b44
	OlbkpINBcJU0L71LDcMXdjtQ68ZaFIfAS9g35iu5nH81S4YB7SVbi7ROpix24+CpEbsNbCA4/A1VE
	TzzjsEtWpk+t7XvuyIIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQWr-00Fu92-38;
	Tue, 22 Aug 2023 12:30:37 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQWo-00Fu7g-0g;
	Tue, 22 Aug 2023 12:30:35 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58c92a2c52dso49433047b3.2;
        Tue, 22 Aug 2023 05:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692707431; x=1693312231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEdxVNTi234IeBu9/mHN8tlhC03wKCbKIUsue9+Lnac=;
        b=cJcYQ3VXyCT0vRT7r9qFsZ4vOToEqlLpgjJCRlDhwQmkP66PTipyikwbKCMZ+gTLdm
         g6AvfqajUtPPFmzNpNwk60t0rnwlBgDPzwN4kz3CiDSrl3JYBXZdjvhwGVFKDDt/TFVK
         WG90dQFcdfusYnzSKKVJUh83XkoLNBL1RWMZq45SEutKFP3Q6ZYlt3Ntn0Grfz3jLOuO
         muHQXB9OxhhBy4VDhTSW2ukJnwpkKMKTIYrzgiz3sjNxU5SZI1lFBdVSmtdmJlbE8sBi
         CCvcXpJwV7cT/h1cdYIXp3LUAsdbKvtTmr0YlqddUCxOPc3Zk0EZrfpif77ZMCbBnlYx
         v92g==
X-Gm-Message-State: AOJu0YyuAECBS2aEaRutB3pN9H8MxPajtsOC3rKZGmbOVOnQfLgzctF9
	ZvmnW9G+FbCCZcHmLYGomhomH8dw91RRmQ==
X-Google-Smtp-Source: AGHT+IFZWN5hJp5ytcWlayZNlSU+CIIuqI9b9xDw85RtfKg6osA5U+F6ta9wUk9Q3LONB9OklhAGTw==
X-Received: by 2002:a0d:e305:0:b0:58e:a9d3:bf98 with SMTP id m5-20020a0de305000000b0058ea9d3bf98mr10589614ywe.27.1692707431358;
        Tue, 22 Aug 2023 05:30:31 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id x66-20020a81a045000000b0058390181d16sm2797688ywg.30.2023.08.22.05.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 05:30:28 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d73ee75a796so4302136276.0;
        Tue, 22 Aug 2023 05:30:28 -0700 (PDT)
X-Received: by 2002:a25:bcc7:0:b0:d52:f4d7:5587 with SMTP id
 l7-20020a25bcc7000000b00d52f4d75587mr9783496ybm.31.1692707427833; Tue, 22 Aug
 2023 05:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230721221552.1973203-2-contact@jookia.org> <20230721221552.1973203-6-contact@jookia.org>
In-Reply-To: <20230721221552.1973203-6-contact@jookia.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Aug 2023 14:30:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2m54UAH0X2dG7stEg=grFihrdsz4+o7=_DpBMhjTbkw@mail.gmail.com>
Message-ID: <CAMuHMdV2m54UAH0X2dG7stEg=grFihrdsz4+o7=_DpBMhjTbkw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] can: sun4i_can: Add support for the Allwinner D1
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_053034_251493_7A893B49 
X-CRM114-Status: GOOD (  23.02  )
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

SGkgSm9obiwKCk9uIFNhdCwgSnVsIDIyLCAyMDIzIGF0IDEyOjE44oCvQU0gSm9obiBXYXR0cyA8
Y29udGFjdEBqb29raWEub3JnPiB3cm90ZToKPiBUaGUgY29udHJvbGxlcnMgcHJlc2VudCBpbiB0
aGUgRDEgYXJlIGV4dHJlbWVseSBzaW1pbGFyIHRvIHRoZSBSNDAKPiBhbmQgcmVxdWlyZSB0aGUg
c2FtZSByZXNldCBxdWlya3MsIGJ1dCBBbiBleHRyYSBxdWlyayBpcyBuZWVkZWQgdG8gc3VwcG9y
dAo+IHJlY2VpdmluZyBwYWNrZXRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBXYXR0cyA8Y29u
dGFjdEBqb29raWEub3JnPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29t
bWl0IDhhYmI5NTI1MGFlNmFmMmQgKCJjYW46CnN1bjRpX2NhbjogQWRkIHN1cHBvcnQgZm9yIHRo
ZSBBbGx3aW5uZXIgRDEiKSBpbiBsaW51eC1jYW4tbmV4dC9tYXN0ZXIuCgo+IC0tLSBhL2RyaXZl
cnMvbmV0L2Nhbi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9uZXQvY2FuL0tjb25maWcKPiBAQCAt
MTg1LDEwICsxODUsMTAgQEAgY29uZmlnIENBTl9TTENBTgo+Cj4gIGNvbmZpZyBDQU5fU1VONEkK
PiAgICAgICAgIHRyaXN0YXRlICJBbGx3aW5uZXIgQTEwIENBTiBjb250cm9sbGVyIgo+IC0gICAg
ICAgZGVwZW5kcyBvbiBNQUNIX1NVTjRJIHx8IE1BQ0hfU1VON0kgfHwgQ09NUElMRV9URVNUCj4g
KyAgICAgICBkZXBlbmRzIG9uIE1BQ0hfU1VONEkgfHwgTUFDSF9TVU43SSB8fCBSSVNDViB8fCBD
T01QSUxFX1RFU1QKClRoaXMgbWFrZXMgdGhpcyBxdWVzdGlvbiBwb3AgdXAgd2hlbiBjb25maWd1
cmluZyBhIGtlcm5lbCBmb3IgYW55IFJJU0MtVgpwbGF0Zm9ybSwgbm90IGp1c3QgZm9yIEFsbHdp
bm5lciBSSVNDLVYgcGxhdGZvcm1zLgoKSW4gY29tcGFyaXNvbiwgZHJpdmVycy9jbGsvc3VueGkt
bmcvS2NvbmZpZyBkb2VzIGhhdmUgc29tZQoKICAgIGRlcGVuZHMgb24gTUFDSF9TVU48Zm9vPkkg
fHwgUklTQ1YgfHwgQ09NUElMRV9URVNUCgpidXQgdGhlc2UgYXJlIGdhdGVkIGJ5IEFSQ0hfU1VO
WEkgYXQgdGhlIHRvcCBvZiB0aGUgZmlsZS4KCkknbSBub3Qgc3VyZSB3aGF0J3MgdGhlIGJlc3Qg
d2F5IHRvIGZpeCB0aGlzOgogIC0gUmVwbGFjZSBSSVNDViBieSBBUkNIX1NVTlhJPwogICAgVGhp
cyB3b3VsZCBleHBvc2UgaXQgb24gbW9yZSBBUk0gc3VuPGZvbz5pIHBsYXRmb3JtcywgbWFraW5n
IHRoZQogICAgTUFDSF9TVU40SSB8fCBNQUNIX1NVTjdJIHN1cGVyZmx1b3VzPwogIC0gUmVwbGFj
ZSBSSVNDViBieSBSSVNDViAmJiBBUkNIX1NVTlhJPwoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRz
IQoKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byB1
c2UgQ0FOIGNvbnRyb2xsZXIgZm91bmQgb24gQWxsd2lubmVyCj4gLSAgICAgICAgIEExMC9BMjAg
U29Dcy4KPiArICAgICAgICAgQTEwL0EyMC9EMSBTb0NzLgo+Cj4gICAgICAgICAgIFRvIGNvbXBp
bGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUgd2ls
bAo+ICAgICAgICAgICBiZSBjYWxsZWQgc3VuNGlfY2FuLgoKR3J7b2V0amUsZWV0aW5nfXMsCgog
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
