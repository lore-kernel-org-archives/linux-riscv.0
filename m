Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A71C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s7KE059zNUSNpwPoumy7uYTIV1K1EELJykJPCHi3bg=; b=WiFC+4JCV1SR6M
	+Wnh2zQMJTsjcdQX18aKQIrvPeKKiLYkwQHHfd7gLAeBrmxizU8A2dceBMrPhDHptSKD7pvoYZTy+
	y+4smiXANdDItWaJInGqgaZRQRsL7FULGN2IigariFCmXP3GK2x6Ld+gmXurLYA1NaJ/CnhwRiKaW
	YA7Oh9CjlFfsVoBZiePHaAkktROnMuIFepJJx1edJxbHc+vYEg9778QtyuSTKDaTbJJFcHJDZ/yu+
	WB87h7jqW1OBQz04Ug6Hxiifwrl3Qg+uV0QvGoyJsl+NCod4Ck33EJ9d8dBdWGcGgpaACfB95wwHW
	mZvACRUsOCEVvhqGWD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWGg-00Fg98-PW; Fri, 25 Nov 2022 10:49:14 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyW4g-00FX0X-0i
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 10:36:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ha10so9425143ejb.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 02:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAA5+MTosfMlNvoe36JT1THP0OI7Tftg0ZLwKpzdNig=;
        b=deDNxf2lRCheq9V0vXDBA6reUMtumtqZcNEppvF215oH5eHmU2HzYSolGZUK/Pnipp
         ndLiI4v8j3Y7U1lrHi3O1y+0YOpYb+J11Lcr4O81WqM9mpYE7HAz1kWBNjHI8302hwe9
         2XBID3Dr0tUxMINLtQNaBey/kaAxgD8sYeI5JcqUJ7YuVHyBUiIfWe1YOIZgSngSCqjG
         zAgIa1VDH6JwZQCV9+r/JcZuv4lCaqCL097tAWQe2mJHBRJdNb6MryVOVIn/Edv6xyiG
         Hej2YtTIjQiAljHr6dpaQDLRrLMQzQIJIO9/O0d9zgVBibhtRQKFdU28bMjmeoGw9DRb
         vYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAA5+MTosfMlNvoe36JT1THP0OI7Tftg0ZLwKpzdNig=;
        b=1eMrIcGkLW8IoZmjkhO0DMKzDt3jkQ+vTas/2xuIdD72FkFISbD2lIwiN+7hAR3FcK
         qVxfEZbU/F0GzELDh1lSFll+IknLcZ/4nuCnP51XOIwrRFIQYBSWcl00DhrpbYEkv8kv
         M7AYA5Cw2nc5gFOXI4MHBkf8TBY1Kf+hTqsaMXfxGdUUemSHzCVn11CIQtVATmY2x0Cm
         GRG65n5jkuiMdUbnYZDtabsVo7o7GB16ZDKOohM4Lc1/MbrcbtCdoTkyznfvSvJqsFmp
         DwTXtyE4ftEgMVYJhatv1BFFNr0Gf9eJC7wnk3NGiS8UUbxTWOxlhEh03o1i9xmQIXBw
         j6WQ==
X-Gm-Message-State: ANoB5pn3SBQHS3bz+/tz0AdH/c6fTs26Bo+IdaY2Xj2/NChP/jftF4r8
	NgG13SOwQk+utOd+juyRGsOnKzJR+QtciCzgFIw=
X-Google-Smtp-Source: AA0mqf5v4s+UiXApNhf+ddpsOWAtYV+uHFxYvnI+gH7ytNyYHKGnV6H8idKdOR9FnvEhkFCHFEi45im9VjNaU3DDanQ=
X-Received: by 2002:a17:907:7650:b0:781:e568:294f with SMTP id
 kj16-20020a170907765000b00781e568294fmr17396469ejc.447.1669372607905; Fri, 25
 Nov 2022 02:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4801607.MHq7AAxBmi@diego> <CA+V-a8sT8VxpeM=eBgmDeojOka-LDmvP4JkhVfEDKi3D3VOsmw@mail.gmail.com>
 <3217756.bB369e8A3T@diego>
In-Reply-To: <3217756.bB369e8A3T@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 10:36:21 +0000
Message-ID: <CA+V-a8uXxCupvW9eQGs4=XnertvZUfi_KVAF5SUcmqmPHT_+xA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_023650_171520_9BCF9469 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgSGVpa28sCgpPbiBGcmksIE5vdiAyNSwgMjAyMiBhdCAxMDoyMCBBTSBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEFtIEZyZWl0YWcsIDI1LiBOb3ZlbWJlciAy
MDIyLCAxMTowMjoyMSBDRVQgc2NocmllYiBMYWQsIFByYWJoYWthcjoKPiA+IEhpIEhlaWtvLAo+
ID4KPiA+IE9uIFRodSwgTm92IDI0LCAyMDIyIGF0IDc6NTggUE0gSGVpa28gU3TDvGJuZXIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFtIERvbm5lcnN0YWcsIDI0LiBOb3Zl
bWJlciAyMDIyLCAyMDo1MjozMyBDRVQgc2NocmllYiBDb25vciBEb29sZXk6Cj4gPiA+ID4gT24g
VGh1LCBOb3YgMjQsIDIwMjIgYXQgMDU6MjI6MDFQTSArMDAwMCwgUHJhYmhha2FyIHdyb3RlOgo+
ID4gPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEludHJvZHVjZSBBTFRFUk5BVElWRV8z
KCkgbWFjcm8uCj4gPiA+ID4KPiA+ID4gPiBCaXQgcGVyZnVuY3RvcnkgSSB0aGluayEgVGhlcmUn
cyBhIGxvdmVseSBjb21tZW50IGRvd24gYmVsb3cgdGhhdCB3b3VsZAo+ID4gPiA+IG1ha2UgZm9y
IGEgYmV0dGVyIGNvbW1pdCBtZXNzYWdlIGlmIHlvdSB3ZXJlIHRvIHlvaW5rIGl0Lgo+ID4gPiA+
IENvbnRlbnQgbG9va3MgYWJvdXQgd2hhdCBJJ2QgZXhwZWN0IHRvIHNlZSB0aG91Z2guCj4gPiA+
Cj4gPiA+IEFsc28gYm90aCB0aGUgY29tbWVudCBvbiB0aGUgb3JpZ2luYWwgQUxURVJOQVRJVkVf
MiBhbmQgdGhlIG5ldyBBTFRFUk5BVElWRV8zCj4gPiA+IHNob3VsZCBwcm9iYWJseSBiZSBtZXJn
ZWQgaW50byBhIHNpbmdsZSBjb21tZW50IGV4cGxhaW5pbmcgdGhpcyBvbmNlIGZvciBhbGwKPiA+
ID4gQUxURVJOQVRJVkVfeCB2YXJpYW50cy4KPiA+ID4KPiA+ID4gRXNwZWNpYWxseSB3aXRoIHRo
ZSBkbWEgc3R1ZmYsIEknbSBwcmV0dHkgc3VyZSB3ZSdsbCBnZXQgYXQgbGVhc3QgYW4gQUxURVJO
QVRJVkVfNAo+ID4gPiBpZiBub3QgZXZlbiBtb3JlIDstKSAuIFNvIHdlIGRlZm5pdGx5IGRvbid0
IHdhbnQgdG8gcmVwZWF0IHRoaXMgbXVsdGlwbGUgdGltZXMuCj4gPiA+Cj4gPiBEbyBhZ3JlZS4g
SG93IGFib3V0IHRoZSBiZWxvdz8KPiA+Cj4gPiAvKgo+ID4gICogU2ltaWxhciB0byB3aGF0IEFM
VEVSTkFUSVZFXzIoKSBtYWNybyBkb2VzIGJ1dCB3aXRoIGFuIGFkZGl0aW9uYWwKPiA+ICAqIHZl
bmRvciBjb250ZW50Lgo+ID4gICovCj4gPgo+ID4gU28gdGhlIG90aGVyIEFMVEVSTkFUSVZFXzIr
KCkgbWFjcm9zIHdpbGwga2VlcCBvbiBidWlsZGluZyBvbiBpdC4KPgo+IE15IGlkZWEgd2FzIG1v
cmUgbGlrZSBoYXZpbmcgX29uZV8gY29tbWVudCBibG9jayBvZiBzb21ldGhpbmcgbGlrZQo+Cj4g
LS0tLS0KPiAvKgo+ICAqIEFMVEVSTkFUSVZFX3ggbWFjcm9zIGFsbG93IHByb3ZpZGluZyBtdWx0
aXBsZSByZXBsYWNlbWVudCBvcHRpb25zCj4gICogZm9yIGFuIEFMVEVSTkFUSVZFIGNvZGUgc2Vj
dGlvbi4gVGhpcyBpcyBoZWxwZnVsIGlmIG11bHRpcGxlCj4gICogaW1wbGVtZW50YXRpb24gdmFy
aWFudHMgZm9yIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgZXhpc3QgZm9yCj4gICogZGlmZmVyZW50
IGNwdSBjb3Jlcy4KPiAgKgo+ICAqIFVzYWdlOgo+ICAqICAgQUxURVJOQVRJVkVfeChvbGRfY29u
dGVudCwKPiAgKiAgICAgIG5ld19jb250ZW50MSwgdmVuZG9yX2lkMSwgZXJyYXRhX2lkMSwgQ09O
RklHX2sxLAo+ICAqICAgICAgbmV3X2NvbnRlbnQyLCB2ZW5kb3JfaWQyLCBlcnJhdGFfaWQyLCBD
T05GSUdfazIsCj4gICogICAgICAuLi4KPiAgKiAgICAgIG5ld19jb250ZW50eCwgdmVuZG9yX2lk
eCwgZXJyYXRhX2lkeCwgQ09ORklHX2t4KQo+ICAqLwo+Cj4gI2RlZmluZSBBTFRFUk5BVElWRV8y
KC4uLikKPiAjZGVmaW5lIEFMVEVSTkFUSVZFXzMoLi4uKQo+IGV0Ywo+IC0tLS0tCj4KTEdUTSwg
SSdsbCBpbmNsdWRlIHRoZSBhYm92ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiBTbyB0aGlzIHdv
dWxkIGluY2x1ZGUgZHJvcHBpbmcgdGhlIG9sZCBjb21tZW50IG92ZXIgQUxURVJOQVRJVkUyCj4K
QWdyZWVkLCBJJ2xsIGRyb3AgaXQgaW4gdGhlIHNhbWUgcGF0Y2guCgpDaGVlcnMsClByYWJoYWth
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
