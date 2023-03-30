Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B94C761A6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vA3r3oU1pQSVVvsTdm0SF1sU4t1+iDofMn0LkbdtHd0=; b=m69g/UsvLX0QCN
	/5J7Fk+KytjH3iGPPEgO1YRzn8sN3v0J9Ph5O+pUXMIc9P0XMp7yHpWhJKDt/SXacxofbFOspbk44
	87V+kZDeaZO2InvAuQeKA+oCGWfOcwcJvTyAT26NP17hIDXJGhunbk2/XggXlLceXFmr16J0MKPUY
	ahSdbAsg2QKiGhtrSZrNunueIrKv4TpT7OiuRvSxevUv3Bb0AlRXQui3gzliNr8Nf3qmkY3wxbudc
	Ens2kbr1ng/Ky/BSfyZY00LnPIkAAXQzZNhtHSUIy3DpMoG3V4ibDFuSzA4mH96Z4QqjQnUTgpOjB
	2zCO/zCk0Gp+FC81yoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phusu-004QdV-30;
	Thu, 30 Mar 2023 16:12:20 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phuss-004QZv-0G
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 16:12:19 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54601d90118so207751587b3.12
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 09:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680192721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ASMwRAXSxQ56uzRQV9rpj0YNrKR/hLF/lFweUlSAcY=;
        b=bxO20JcI/Zkx/g5N5IYs8yXs0x7RPdEWCE7eLDMHagUaK0eHZZK3sQRVPICd4XM5U4
         lMsEO0qiunE0fWgLsQXQGr6Q5GRZPkoI0KkOLSZgAtvMASEX/YHHGiDb+KHDz9EeHiEh
         mpUNt/BLrEAzWw6hQQOfrIVQWA9GznhJ6PK5xOv3wIUNpW0Kaz6nt5hKnP6IQNMBDOxn
         dHcxaO0xJEHTIOrSvmYfKRd5EFKU6xKq1xq3FU+JTxBCRDR+8G24BJJ+jKK+1UJ0a5mJ
         oRxpJdfT7W3CurxdPO7CxoPlrpYQmK7pzT+itZXlz9HmAcUfqXxI1qgElQGgmpwR8dIz
         jhLg==
X-Gm-Message-State: AAQBX9fwSeZ4Qiuv+7MbZqk02yWOV5iBsE9FQumSog6h1Dj/vLTHE8Vz
	DD4H6WEjIQL0eRxEL4fv8a1S3YtkztdCld7x
X-Google-Smtp-Source: AKy350YknMZzUFVkQF2/EOuxX2N3oKTMSFWz/Lxc7GN/0Q7DeRy0GFtiho0X3QLPuQ2LJfJveJjP5g==
X-Received: by 2002:a0d:d786:0:b0:535:e3b7:cbd4 with SMTP id z128-20020a0dd786000000b00535e3b7cbd4mr22532939ywd.28.1680192720837;
        Thu, 30 Mar 2023 09:12:00 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c1-20020a811c01000000b00545a081848fsm3627229ywc.31.2023.03.30.09.11.59
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:12:00 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-545e907790fso247411897b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 09:11:59 -0700 (PDT)
X-Received: by 2002:a81:b65f:0:b0:545:611c:8d19 with SMTP id
 h31-20020a81b65f000000b00545611c8d19mr12055261ywk.4.1680192719618; Thu, 30
 Mar 2023 09:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330060105.29460-1-rdunlap@infradead.org> <e1b6f12a-899b-4985-8725-556bcb5d0991@spud>
 <CAMuHMdW2r1f7C_BdXn9BnDktLwHjBA_0Kvq6OeLJ1sZ7azhqkg@mail.gmail.com> <b712f5c8-9486-8e4a-63cd-6b176572244f@infradead.org>
In-Reply-To: <b712f5c8-9486-8e4a-63cd-6b176572244f@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Mar 2023 18:11:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_=T9EB=rE_p9XO2-MtaV3jNkX76_PxYd9wi17NhaYHQ@mail.gmail.com>
Message-ID: <CAMuHMdX_=T9EB=rE_p9XO2-MtaV3jNkX76_PxYd9wi17NhaYHQ@mail.gmail.com>
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	iommu@lists.linux.dev, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	geert+renesas@glider.be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_091218_118542_B075009E 
X-CRM114-Status: GOOD (  34.43  )
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

SGkgUmFuZHksCgpPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCA1OjQ44oCvUE0gUmFuZHkgRHVubGFw
IDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+IE9uIDMvMzAvMjMgMDA6MzEsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDMwLCAyMDIzIGF0IDg6MjXigK9B
TSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+PiBP
biBXZWQsIE1hciAyOSwgMjAyMyBhdCAxMTowMTowNVBNIC0wNzAwLCBSYW5keSBEdW5sYXAgd3Jv
dGU6Cj4gPj4+IE9uIHJpc2N2NjQsIGxpbnV4LW5leHQtMjAyMzMwMzAgKGFuZCBmb3Igc2V2ZXJh
bCBkYXlzIGVhcmxpZXIpLAo+ID4+PiB0aGVyZSBpcyBhIGtjb25maWcgd2FybmluZzoKPiA+Pj4K
PiA+Pj4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgSU9N
TVVfSU9fUEdUQUJMRV9MUEFFCj4gPj4+ICAgRGVwZW5kcyBvbiBbbl06IElPTU1VX1NVUFBPUlQg
Wz15XSAmJiAoQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVCBbPW5dKSAmJiAhR0VORVJJQ19B
VE9NSUM2NCBbPW5dCj4gPj4+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ID4+PiAgIC0gSVBNTVVfVk1T
QSBbPXldICYmIElPTU1VX1NVUFBPUlQgWz15XSAmJiAoQVJDSF9SRU5FU0FTIFs9eV0gfHwgQ09N
UElMRV9URVNUIFs9bl0pICYmICFHRU5FUklDX0FUT01JQzY0IFs9bl0KPiA+Pj4KPiA+Pj4gYW5k
IGJ1aWxkIGVycm9yczoKPiA+Pj4KPiA+Pj4gcmlzY3Y2NC1saW51eC1sZDogZHJpdmVycy9pb21t
dS9pby1wZ3RhYmxlLWFybS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAnOgo+ID4+PiBpby1wZ3RhYmxl
LWFybS5jOiguaW5pdC50ZXh0KzB4MWU4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYWxsb2Nf
aW9fcGd0YWJsZV9vcHMnCj4gPj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZlcnMvaW9tbXUvaW8t
cGd0YWJsZS1hcm0ubzogaW4gZnVuY3Rpb24gYC5MMTY4JzoKPiA+Pj4gaW8tcGd0YWJsZS1hcm0u
YzooLmluaXQudGV4dCsweGFiMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGZyZWVfaW9fcGd0
YWJsZV9vcHMnCj4gPj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZlcnMvaW9tbXUvaXBtbXUtdm1z
YS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAnOgo+ID4+PiBpcG1tdS12bXNhLmM6KC50ZXh0KzB4YmM0
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZnJlZV9pb19wZ3RhYmxlX29wcycKPiA+Pj4gcmlz
Y3Y2NC1saW51eC1sZDogZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLm86IGluIGZ1bmN0aW9uIGAu
TDAgJzoKPiA+Pj4gaXBtbXUtdm1zYS5jOigudGV4dCsweDE0NWUpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBhbGxvY19pb19wZ3RhYmxlX29wcycKPiA+Pj4KPiA+Pj4gQWRkIFJJU0NWIGFzIGFu
IGFsbG93ZWQgQVJDSCBkZXBlbmRlbmN5IHRvIGZpeCB0aGVzZSBwcm9ibGVtcy4KPiA+Pj4KPiA+
Pj4gRml4ZXM6IGQyODZhNThiYzhmNCAoImlvbW11OiBUaWR5IHVwIGlvLXBndGFibGUgZGVwZW5k
ZW5jaWVzIikKPiA+Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+Cj4gPj4+IENjOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz4KPiA+Pj4g
Q2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gPj4+IENjOiBSb2JpbiBNdXJwaHkg
PHJvYmluLm11cnBoeUBhcm0uY29tPgo+ID4+PiBDYzogaW9tbXVAbGlzdHMubGludXguZGV2Cj4g
Pj4+IENjOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4gPj4+IENjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4+IC0tLQo+ID4+PiAgZHJpdmVycy9pb21tdS9L
Y29uZmlnIHwgICAgMiArLQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS0gYS9kcml2ZXJzL2lvbW11L0tjb25maWcg
Yi9kcml2ZXJzL2lvbW11L0tjb25maWcKPiA+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9LY29uZmln
Cj4gPj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvS2NvbmZpZwo+ID4+PiBAQCAtMzIsNyArMzIsNyBA
QCBjb25maWcgSU9NTVVfSU9fUEdUQUJMRQo+ID4+PiAgY29uZmlnIElPTU1VX0lPX1BHVEFCTEVf
TFBBRQo+ID4+PiAgICAgICBib29sICJBUk12Ny92OCBMb25nIERlc2NyaXB0b3IgRm9ybWF0Igo+
ID4+Cj4gPj4gSSdtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5nIGhlcmUsIGJ1dCB3aHkgd291
bGQgd2Ugd2FudCB0byBlbmFibGUKPiA+PiAiQVJNdjcvdjggTG9uZyBEZXNjcmlwdG9yIEZvcm1h
dCIgb24gUklTQy1WPwo+ID4KPiA+IEluZGVlZCwgd2Ugc2hvdWxkIG5vdCBlbmFibGUgaXQsIHVu
bGVzcyBjb21waWxlLXRlc3RpbmcuCj4gPgo+ID4+IFdvdWxkIGl0IG5vdCBiZSBiZXR0ZXIgdG8g
bWFrZSB0aGUgUmVuZXNhcyBkZXBlbmQgb24sIHJhdGhlciB0aGFuCj4gPj4gc2VsZWN0IHRoZSBv
cHRpb24/IEl0IGRvZXMgc2VlbSBoaWdobHkgYXJjaCBzcGVjaWZpYywgYW5kIEkgZmVlbCBsaWtl
Cj4gPj4gR2VlcnQgcHJldmlvdXNseSBtZW50aW9uZWQgdGhhdCB0aGUgUlovRml2ZSAodGhlaXIg
UklTQy1WIG9mZmVyaW5nKQo+ID4+IGRpZG4ndCB1c2UgaXQuCj4gPgo+ID4gSSB0aGluayB0aGUg
SVBNTVVfVk1TQSBkZXBlbmRlbmN5IHNob3VsZCBnYWluCj4gPgo+ID4gICAgICAgICBkZXBlbmRz
IG9uIEFSTSB8fCBBUk02NCB8fCBDT01QSUxFX1RFU1QKPgo+IHNvIGxpa2UgdGhpcz8KPiBPciBk
aWQgeW91IG1lYW4gdG8gZHJvcCB0aGUgQVJDSF9SRU5FU0FTIHBhcnQgYWxzbz8KPgo+Cj4gIGNv
bmZpZyBJUE1NVV9WTVNBCj4gICAgICAgICBib29sICJSZW5lc2FzIFZNU0EtY29tcGF0aWJsZSBJ
UE1NVSIKPiAtICAgICAgIGRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVAo+
ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQVJNIHx8IEFSTTY0IHx8IENPTVBJ
TEVfVEVTVAoKTm8sIHlvdSB3YW50ICJkZXBlbmRzIG9uIChBUkNIX1JFTkVTQVMgJiYgKEFSTSB8
fCBBUk02NCkpIHx8IENPTVBJTEVfVEVTVCIsCndoaWNoIGlzIGEgYml0IGhhcmQgdG8gcmVhZC4K
CkhlbmNlIEkgcmVhbGx5IG1lYW50IGFkZGluZyB0aGF0IGxpbmUsIGkuZS46CgogICAgIGNvbmZp
ZyBJUE1NVV9WTVNBCiAgICAgICAgICAgYm9vbCAiUmVuZXNhcyBWTVNBLWNvbXBhdGlibGUgSVBN
TVUiCiAgICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUCiAg
ICArICAgICAgZGVwZW5kcyBvbiBBUk0gfHwgQVJNNjQgfHwgQ09NUElMRV9URVNUCgo+Cj4gVGhl
IGZhaWxpbmcgY29uZmlnIGZpbGUgaGFzIEFSQ0hfUkVORVNBUz15LiAgQWZ0ZXIgdGhlIGNoYW5n
ZSBhYm92ZSwgSSBzdGlsbCBnZXQ6Cj4KPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5j
aWVzIGRldGVjdGVkIGZvciBJT01NVV9JT19QR1RBQkxFX0xQQUUKPiAgIERlcGVuZHMgb24gW25d
OiBJT01NVV9TVVBQT1JUIFs9eV0gJiYgKEFSTSB8fCBBUk02NCB8fCBDT01QSUxFX1RFU1QgWz1u
XSkgJiYgIUdFTkVSSUNfQVRPTUlDNjQgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ICAgLSBJ
UE1NVV9WTVNBIFs9eV0gJiYgSU9NTVVfU1VQUE9SVCBbPXldICYmIChBUkNIX1JFTkVTQVMgWz15
XSB8fCBBUk0gfHwgQVJNNjQgfHwgQ09NUElMRV9URVNUIFs9bl0pICYmICFHRU5FUklDX0FUT01J
QzY0IFs9bl0KLS0gCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
