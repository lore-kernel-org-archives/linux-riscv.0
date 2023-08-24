Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373D4C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBJwZGJNm3CMvOqeDMh9WWbkcpgG7O5QZGJlw3BZqNc=; b=tgHf2p6FVbTmqo
	hgwSj8C9X028xJo8mHRcx50TIvFijZF6ab0T4b6SnpWoJ9U65YCaoXOHyvmpkg7vTZ+buFAOCqTL+
	8afQvQZFbPbrRTPziZxucXMHUvWv4cLNv596qVy+otfAg9mmR2RiT4YQCBbOqhvLR3KBGan1l7OD0
	ajRahFw84euxMXSfQQ8qBA3N6Lz8gDrH3Yu0yp0kdE004nRfhZiiTsAgzHmsO19/m3wAwpV9AE8Ip
	MnaRO0wxEeqk+GyiymXyu1loWUWrQ4TlXEvqq8wR7l9xKTNMWU3DLo+cCmmi9I/JQgqWPwKz0Tmsq
	VlJbeWaMBul09w8bFJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZJ68-003wt3-0u;
	Thu, 24 Aug 2023 22:46:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZJ63-003wsa-39
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 22:46:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5009969be25so466285e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692917193; x=1693521993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCYNyYJU7vy6f7+4m3Y1Z8s/5IyvH+iRHdLo0oYTHwQ=;
        b=RhSm8Ww1H4fdAzH92XRAPITF5WO8VuxzhR6L+9bzkQ/vN5ImXhCszgR0zS+XBTP0CZ
         zOECgGy6mkfeldcWXNpGKsTAkoEFGOdKoM+y46Y5Sy/zQRhiFoCmt3EfDRYN2LL9RZIq
         zLuprtdJhaOPh05ZgQfhmfHMWSSZc/tsIVmm46WgoQgYItqZX/Fz0/MdpDY/vvP7omPY
         ZnSLMQrc5NeFH6md7KKi61m15Q5jzqQPTv7kSEug9Sai7CyhUANZvhl/ag30Vmx3RUHc
         YoAf5KSwAbnyyvC/LiJTPUtNocux6fQss2iiGY6eehyp124iFOp+SHdw4mBY3TI9Cm4k
         rg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692917193; x=1693521993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCYNyYJU7vy6f7+4m3Y1Z8s/5IyvH+iRHdLo0oYTHwQ=;
        b=ORbgyn40ywREtFjEGJgkun4lrA6J2fjJ6Fvhb0RJyr1W0XGeRy6jWZmzsCCyNE+AkT
         gb5hlPDOI83ibPYkbR/npj95wNQfJ9ck4QH6qImcevGQyKAprgHYAC3+64LNj9+b/iLB
         TU0jBSYW7uaHUuxOHUi8W/hCZ0+3ZAL2bU6yOg9r/XKe3ip/8jnCa4eSE8olAFQuGNQy
         5Lr5K7riSQgEzGetFzpS04z1MRCOr3cvxbA+2ijV/3hY6GCOjKUycAYaswiKICW8v41g
         IqC06g+OXlOFYP/iaVj8UV6txpt8Zb3Fbubmohcy58H3bHPkaBSdBaJ0tHCHgIVL2W8A
         ZxjQ==
X-Gm-Message-State: AOJu0YzF3T5cGSHxhliNwRJWqTZRaAdXDhgc0SVYAvYhaY4Ca5mODuQu
	kk3ZnDdxE1exycuILcG014tF/o3LYRPH521RizcP4A==
X-Google-Smtp-Source: AGHT+IGjUvhXZF3UrB6wnTyiM21PdNuE5x48UmMtDL6ByEOKmcfwpNgwI1gzumwtML5+FjMz1Rb3BQyPCujzqOLacIc=
X-Received: by 2002:ac2:4c92:0:b0:4f4:dbcc:54da with SMTP id
 d18-20020ac24c92000000b004f4dbcc54damr10170585lfl.27.1692917193533; Thu, 24
 Aug 2023 15:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201831.2695097-1-evan@rivosinc.com> <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
 <20230824-exploit-spectacle-ecedd91e9075@spud> <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
 <20230824-sizing-booth-e1068c6d033f@spud>
In-Reply-To: <20230824-sizing-booth-e1068c6d033f@spud>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 24 Aug 2023 15:45:57 -0700
Message-ID: <CALs-HsuA+g+YA707hPHwvTk8Tn6D9iwu8EmkM-f75gqTeum-5g@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_154636_226897_F8B1B7D3 
X-CRM114-Status: GOOD (  51.80  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMzoyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCAwMzowNjo1M1BNIC0w
NzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTA6Mjni
gK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBUaHUs
IEF1ZyAyNCwgMjAyMyBhdCAwOToxODoxNkFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4g
PiA+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDU6MjDigK9BTSBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVsIDExLCAy
MDIzIGF0IDAxOjE4OjMwUE0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4KPiA+ID4gPiA+ID4g
KyJpc2EiIHZzICJoYXJ0IGlzYSIgbGluZXMgaW4gL3Byb2MvY3B1aW5mbwo+ID4gPiA+ID4gPiAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gK1RoZSAiaXNhIiBsaW5lIGluIC9wcm9jL2NwdWluZm8gZGVzY3JpYmVzIHRo
ZSBsb3dlc3QgY29tbW9uIGRlbm9taW5hdG9yIG9mCj4gPiA+ID4gPiA+ICtSSVNDLVYgSVNBIGV4
dGVuc2lvbnMgdW5kZXJzdG9vZCBieSB0aGUga2VybmVsIGFuZCBpbXBsZW1lbnRlZCBvbiBhbGwg
aGFydHMuIFRoZQo+ID4gPiA+ID4gPiArImhhcnQgaXNhIiBsaW5lLCBpbiBjb250cmFzdCwgZGVz
Y3JpYmVzIHRoZSBzZXQgb2YgZXh0ZW5zaW9ucyB1bmRlcnN0b29kIGJ5IHRoZQo+ID4gPiA+ID4g
PiAra2VybmVsIG9uIHRoZSBwYXJ0aWN1bGFyIGhhcnQgYmVpbmcgZGVzY3JpYmVkLCBldmVuIGlm
IHRob3NlIGV4dGVuc2lvbnMgbWF5IG5vdAo+ID4gPiA+ID4gPiArYmUgcHJlc2VudCBvbiBhbGwg
aGFydHMgaW4gdGhlIHN5c3RlbS4gVGhlICJoYXJ0IGlzYSIgbGluZSBpcyBjb25zaXN0ZW50IHdp
dGgKPiA+ID4gPiA+ID4gK3doYXQncyByZXR1cm5lZCBieSBfX3Jpc2N2X2h3cHJvYmUoKSB3aGVu
IHF1ZXJ5aW5nIGZvciB0aGF0IHNwZWNpZmljIENQVS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlu
a2luZyBhYm91dCB0aGlzIGFnYWluLCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdHJ1ZS4gaHdwcm9i
ZSB1c2VzCj4gPiA+ID4gPiBoYXNfZnB1KCksIGhhc192ZWN0b3IoKSBldGMgdGhhdCBpbnRlcmFj
dCB3aXRoIEtjb25maWcgb3B0aW9ucyBidXQgdGhlCj4gPiA+ID4gPiBwZXJjcHUgaXNhIGJpdG1h
cCBpc24ndCBhZmZlY3RlZCBieSB0aGVzZS4KPiA+ID4gPgo+ID4gPiA+IFVnaCB5ZWFoIGl0J3Mg
a2luZCBvZiBhIG1pc2htYXNoIGlzbid0IGl0LiBod3Byb2JlX2lzYV9leHQwKCkgdXNlcyB0aGUK
PiA+ID4gPiBsb3dlc3QgY29tbW9uIGRlbm9taW5hdG9yIGZvciBGRCwgQywgViwgYnV0IHBlci1o
YXJ0IGluZm8gZm9yCj4gPiA+ID4gWmJhLFpiYixaYnMuIEdpdmVuIHRoZSBpbnRlcmZhY2UsIHBl
ci1oYXJ0IGluZm8gc2VlbXMgbGlrZSB3aGF0IHdlCj4gPiA+ID4gc2hvdWxkIGhhdmUgZG9uZSB0
aGVyZSwgYW5kIHRoZSBGRCwgQywgYW5kIFYgd2VyZSBteSBiYWQuIFRoZSBnb29kCj4gPiA+ID4g
bmV3cyBpcyB3ZSBjYW4gZGVmaW5lIG5ldyBiaXRzIHRoYXQgZG8gdGhlIHJpZ2h0IHRoaW5nLCB0
aG91Z2ggbWF5YmUKPiA+ID4gPiB3ZSBzaG91bGQgd2FpdCB1bnRpbCBzb21lb25lIGFjdHVhbGx5
IHdhbnRzIHRoZW0uIEZvciB0aGlzIHBhdGNoIHdlCj4gPiA+ID4gc2hvdWxkIGp1c3QgcmVtb3Zl
IHRoaXMgc2VudGVuY2UuIFdlIGNhbiBhbHNvIGNvcnJlY3QgdGhlCj4gPiA+ID4gZG9jdW1lbnRh
dGlvbiBpbiBod3Byb2JlIHRvIG1lbnRpb24gdGhlIHNob3J0Y29taW5nIGluIEZELEMsVi4KPiA+
ID4KPiA+ID4gSSdtIG5vdCByZWFsbHkgc3VyZSBpdCdzIGFsbCB0aGF0IG11Y2ggb2YgYSBzaG9y
dGNvbWluZyBmb3IgViBvciBGRCwKPiA+ID4gc2luY2Ugd2l0aG91dCB0aGUga2VybmVsIHN1cHBv
cnQgeW91IHNob3VsZG4ndCBiZSB1c2luZyB0aG9zZSBleHRlbnNpb25zCj4gPiA+IGFueXdheS4g
QSBod3Byb2JlIHRoaW5nIGZvciB0aGF0IHNvdW5kcyBsaWtlIGEgZm9vdGd1biB0byBtZSAmIEkg
dGhpbmsKPiA+ID4gdGhlIGN1cnJlbnQgYmVoYXZpb3VyIGlzIGhvdyBpdCBzaG91bGQgYmUgZm9y
IHRoZXNlIGV4dGVuc2lvbnMuCj4gPiA+IEl0IG5vdCBiZWluZyBwZXItY3B1IGlzIGFyZ3VhYmx5
IGEgYnVnIEkgc3VwcG9zZT8gQnV0IEkgd291bGQgY29udGVuZAo+ID4KPiA+IFllYWggaXQgd2Fz
IG1vc3RseSB0aGUgbm90IGJlaW5nIHBlci1jcHUgSSB3YXMgcG9pbnRpbmcgdG8gaW4gbXkgcHJl
dmlvdXMgZW1haWwuCj4gPgo+ID4gPiB0aGF0IHdlIGFyZSBjb252ZXlpbmcgc3VwcG9ydCBmb3Ig
dGhlIGV4dGVuc2lvbiBvbiBhIHBlci1oYXJ0IGxldmVsLAo+ID4gPiB3aXRoIGl0IHRoZW4gYWxz
byBnYXRlZCBieSB0aGUga2VybmVsIHN1cHBvcnRpbmcgViBvciBGRCwgd2hpY2ggaXMgb24gYQo+
ID4gPiBzeXN0ZW0td2lkZSBiYXNpcy4KPiA+ID4gQW55IG90aGVyIGV4dGVuc2lvbnMgdGhhdCBy
ZXF1aXJlIEtjb25maWctZ2F0ZWQga2VybmVsIHN1cHBvcnQgc2hvdWxkCj4gPiA+IGFsc28gbm90
IHJlcG9ydCB2aWEgaHdwcm9iZSB0aGF0IHRoZSBleHRlbnNpb24gaXMgc3VwcG9ydGVkIHdoZW4g
dGhlCj4gPiA+IEtjb25maWcgb3B0aW9uIGlzIGRpc2FibGVkLiBJdCBqdXN0IHNvIGhhcHBlbnMg
dGhhdCB0aGUgc2V0IG9mCj4gPiA+IGV4dGVuc2lvbnMgdGhhdCBod3Byb2JlIHN1cHBvcnRzIHRo
YXQgYXJlIEtjb25maWctZ2F0ZWQgYW5kIHRob3NlIHRoYXQKPiA+ID4gcmVxdWlyZSBhbGwtaGFy
dCBzdXBwb3J0IGFyZSBvbmUgYW5kIHRoZSBzYW1lIHJpZ2h0IG5vdywgc28gd2UgY2FuIGtpbmRh
Cj4gPiA+IGp1c3QgY29uZmxhdGUgdGhlIHR3byAmIHVzZSBoYXNfdmVjdG9yKCkgZXQgYWwgdGhh
dCBoYW5kbGVzIGJvdGgKPiA+ID4ga2NvbmZpZy1nYXRpbmcgYW5kIGFsbC1oYXJ0IHN1cHBvcnQu
IFVudGlsIHNvbWV0aGluZyBjb21lcyBhbG9uZyB0aGF0IG5lZWRzCj4gPiA+IGFueXRoaW5nIGRp
ZmZlcmVudCwgSSdkIGxlYXZlIHdlbGwgZW5vdWdoIGFsb25lIGZvciBod3Byb2JlLi4uCj4gPgo+
ID4gU291bmRzIGdvb2QuCj4gPgo+ID4gPgo+ID4gPiA+IFBhbG1lciwgZG8geW91IHdhbnQgYSBz
cGluIG9mIHRoaXMgcGF0Y2ggb3IgYSBmb2xsb3d1cCBvbiB0b3AgdG8KPiA+ID4gPiByZW1vdmUg
dGhlIGFib3ZlIHNlbnRlbmNlPwo+ID4gPgo+ID4gPiBJdCdzIG5vdCBhY3R1YWxseSBiZWVuIGFw
cGxpZWQgeWV0LCByaWdodD8KPiA+ID4KPiA+ID4gRG8geW91IHdhbnQgdG8gaGF2ZSB0aGlzIG5l
dyB0aGluZyBpbiBjcHVpbmZvIHRlbGwgdGhlIHVzZXIgInRoaXMgaGFydAo+ID4gPiBoYXMgeHl6
IGV4dGVuc2lvbnMgdGhhdCBhcmUgc3VwcG9ydGVkIGJ5IGEga2VybmVsLCBidXQgbWF5YmUgbm90
IHRoaXMKPiA+ID4ga2VybmVsIiBvciB0byB0ZWxsIHRoZSB1c2VyICJ0aGlzIGhhcnQgaGFzIHh5
eiBleHRlbnNpb25zIHRoYXQgYXJlCj4gPiA+IHN1cHBvcnRlZCBieSB0aGlzIGtlcm5lbCI/IFlv
dXIgdGV4dCBhYm92ZSBzYXlzICJ1bmRlcnN0b29kIGJ5IHRoZQo+ID4gPiBrZXJuZWwiLCBidXQg
SSB0aGluayB0aGF0J3MgYSBwb29yIGRlZmluaXRpb24gdGhhdCBuZWVkcyB0byBiZSBpbXByb3Zl
ZAo+ID4gPiB0byBzcGVsbCBvdXQgZXhhY3RseSB3aGF0IHlvdSBtZWFuLiBJT1cgZG9lcyAidW5k
ZXJzdG9vZCIgbWVhbiB0aGUKPiA+ID4ga2VybmVsIHdpbGwgcGFyc2UgdGhlbSBpbnRvIGEgc3Ry
dWN0dXJlLCBvciBkb2VzIGl0IG1lYW4gInllcyB5b3UgY2FuCj4gPiA+IHVzZSB0aGlzIGV4dGVu
c2lvbiBvbiB0aGlzIHBhcnRpY3VsYXIgaGFydCIuCj4gPgo+ID4gSSdtIGltYWdpbmluZyAvcHJv
Yy9jcHVpbmZvIGJlaW5nIGNsb3NlciB0byAidGhlIENQVSBoYXMgaXQgYW5kIHRoZQo+ID4ga2Vy
bmVsIGF0IGxlYXN0IHZhZ3VlbHkgdW5kZXJzdGFuZHMgaXQsIGJ1dCBtYXkgbm90IGhhdmUgZnVs
bCBzdXBwb3J0Cj4gPiBmb3IgaXQgZW5hYmxlZCIuIEknbSBhc3N1bWluZyAvcHJvYy9jcHVpbmZv
IGlzIG1vc3RseSB1c2VkIGJ5IDEpCj4gPiBodW1hbnMgd2FudGluZyB0byBrbm93IGlmIHRoZXkg
aGF2ZSBoYXJkd2FyZSBzdXBwb3J0IGZvciBhIGZlYXR1cmUsCj4gPiBhbmQgMikgYWRtaW5pc3Ry
YXRvcnMgY29sbGVjdGluZyB0ZWxlbWV0cnkgdG8gbWFuYWdlIGZsZWV0cyAoaWUgZG8gSQo+ID4g
aGF2ZSBhbnkgaGFyZHdhcmUgZGVwbG95ZWQgdGhhdCBzdXBwb3J0cyBYKS4gUHJvZ3JhbW1lcnMg
bG9va2luZyB0bwo+ID4gc2VlICJpcyB0aGUga2VybmVsIHN1cHBvcnQgZm9yIHRoaXMgZmVhdHVy
ZSByZWFkeSByaWdodCBub3ciIHdvdWxkCj4gPiBpZGVhbGx5IG5vdCBiZSBwYXJzaW5nIC9wcm9j
L2NwdWluZm8gdGV4dCwgYXMgbW9yZSBkaXJlY3QgbWVjaGFuaXNtcwo+ID4gbGlrZSBzcGVjaWZp
YyBod3Byb2JlIGJpdHMgZm9yICJhbSBJIGZ1bGx5IHJlYWR5IHRvIGdvIiB3b3VsZCBiZQo+ID4g
ZWFzaWVyIHRvIHdvcmsgd2l0aC4gRmVlbCBmcmVlIHRvIHllbGwgYXQgbWUgaWYgdGhpcyBvdmVy
YWxsIHZpc2lvbgo+ID4gc2VlbXMgZmxhd2VkLgo+ID4KPiA+IEkgdHJpZWQgdG8gbG9vayB0byBz
ZWUgaWYgdGhlcmUgd2FzIGNvbnNlbnN1cyBhbW9uZyB0aGUgb3RoZXIKPiA+IGFyY2hpdGVjdHVy
ZXMuIEFhcmNoNjQgc2VlbXMgdG8gZ28gd2l0aCAic3VwcG9ydGVkIGFuZCBmdWxseSBlbmFibGVk
IiwKPiA+IGFzIHRoZWlyIGNwdV9oYXNfZmVhdHVyZSgpIGRpcmVjdGx5IHRlc3RzIGVsZl9od2Nh
cCwgYW5kIGVsZW1lbnRzIGluCj4gPiBhcm02NF9lbGZfaHdjYXBzW10gYXJlIEtjb25maWcgZ2F0
ZWQuIFg4NiBpcyBjb21wbGljYXRlZCwgYnV0IElJUkMgaXMKPiA+IG1vcmUgYWxvbmcgdGhlIGxp
bmVzIG9mICJoYXJkd2FyZSBoYXMgaXQiLiBUaGV5IGhhdmUgdHdvIG1hY3JvcywKPiA+IGNwdV9o
YXMoKSBmb3IgInJhdyBjYXBhYmlsaXR5IiBhbmQgY3B1X2ZlYXR1cmVfZW5hYmxlZCgpIGZvciAi
a2VybmVsCj4gPiBjYW4gZG8gaXQgdG9vIiwgYW5kIHRoZXkgdXNlIGNwdV9oYXMoKSBmb3IgL3By
b2MvY3B1aW5mbyBmbGFncy4KPgo+IEknbSBmaW5lIHdpdGggdGhlIHBlci1jcHUgc3R1ZmYgbWVh
bmluZyAidGhlIGhhcmR3YXJlIGhhcyBpdCBhbmQgYSBrZXJuZWwsCj4gYnV0IG5vdCBuZWNlc3Nh
cmlseSB0aGlzIG9uZSwgc3VwcG9ydHMgaXQiIC0ganVzdCBwbGVhc2UgbWFrZSB0aGUKPiBkb2N1
bWVudGF0aW9uIGNsZWFyIGFib3V0IGl0LgoKU291bmRzIGdvb2QsIHdpbGwgc3Bpbi4KLUV2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
