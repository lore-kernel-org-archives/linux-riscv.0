Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAF8CD4935
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 22:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxvCwvVa0V9rTUha4y2BA4K4MYNfFjqvZJ7VpAz/wJw=; b=wFRUWhsNXi9oce
	iPNb3PLX62fSOXKACL+JtcoIwesEIhcCZ7XsQhCEezYk/CKgrO2cDvy2IwoAro/i2VdabgAgfO3ZN
	9WC47vuOzifHKs1o+mk0T5juckwxQnLbaPR+XbBqthxsd3laUx3Ff9Ehf95x8U/t+HmuOkGUhsRkE
	ueArRFxjtxP8p1e757F7qknn6FGSaB1VqPtEp/b5EeDgQqDsGx9PNfi1C5bUHxUCXIQlFnIE0J5dD
	ItRWPpPBbJYrhYwcJFaS34/2zBmnTzpNtbyw3j/OCdVgxIbvObquHjUHIgapOw0tkn2NxtuF9YAfK
	OZRoeBm/SUA3Uzz8AAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj68x-004PNp-39;
	Wed, 20 Sep 2023 22:58:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj68t-004PN0-33
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 22:58:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so660355e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695250677; x=1695855477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1cBIT5Yco0eHGaUNXSX4VGLYc2r6/KPjUSzBBXiGE8=;
        b=Sv+O5/53kHI9kkCaxdYWj21LTyWJnLhwncigaglUduPu+K/p9fwDdw+LQnQic56TaK
         RgfyK7bk2hdLUflY7NpBBUnz4jiJD43Vw4X6G4BmwfEeqnZhvaAGktuwNGGfnwpRZ/hx
         xlyRXMXirSDXpOQwANe3aZNxkRJSL9vA4U8Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695250677; x=1695855477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1cBIT5Yco0eHGaUNXSX4VGLYc2r6/KPjUSzBBXiGE8=;
        b=RNL2zf7OOANHiYtZ/9fkd99pQLO1tfGQaIVRppiWh9tv1k3elssDalBrI9ZYdHpawj
         NCMlhhewOuRnDUW78RaSEDQ5OmwOxsuEnD2gsUnQjtaEBW4AcGa3O2racGNHkTOHem8d
         at1+/kOmgvXEUULRLTRJJ+e559PrYI9romxQcNYm0lvwWxf1ymQ7SEDLPcvgXvrJNdm2
         812RxRlKPi4M6jvxS3c7o3PvIhEoOZIISh0R2Zw3JfyhGAYaMiwp5GFPp6pKPKkF1pqL
         FVXVEXku0FzRyrQ8OcFQe5x6Q90lDFPcoA8tMqdByXjRcxfEJjnwxZhCUsXJ0OAGBLTc
         OT2g==
X-Gm-Message-State: AOJu0YwO2sN1JfEMFuPE05nU09jiPKspu7RH1VkhitflqVmHOk8lq2DU
	Ra/kRTwo6nRPpX06Re/VnNoV9/CPT6iRck0GpV5AOrr1/mhNzSEIbQ==
X-Google-Smtp-Source: AGHT+IHMS5qJEXG4QOosLZfm7Qei6OXOcyhGsg2b5veFXMbwab1Qw9dyi0D1zgeQoXu0HJn66PVYbM+dDMy7t31PDVI=
X-Received: by 2002:a05:6512:34d2:b0:501:a5de:afed with SMTP id
 w18-20020a05651234d200b00501a5deafedmr2733833lfr.37.1695250676641; Wed, 20
 Sep 2023 15:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230920193801.3035093-1-evan@rivosinc.com> <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com> <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
In-Reply-To: <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 20 Sep 2023 15:57:43 -0700
Message-ID: <CAOnJCU+YNOzw39JMjWmJFHY5QjcRrKEwULo+d9WhPfv7TejpbQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_155800_238607_D5CCA642 
X-CRM114-Status: GOOD (  47.81  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMzowN+KAr1BNIEV2YW4gR3JlZW4gPGV2YW5Acml2b3Np
bmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDI6MjfigK9QTSBBdGlz
aCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIFNl
cCAyMCwgMjAyMyBhdCAyOjA04oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gWW8sCj4gPiA+Cj4gPiA+IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0
IDEyOjM4OjAxUE0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+ID4gUHJvYmluZyBmb3Ig
bWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgdGFrZXMgYWJvdXQgMC4wNiBzZWNvbmRzLiBPbiBhCj4g
PiA+ID4gc3lzdGVtIHdpdGggNjQgY29yZXMsIGRvaW5nIHRoaXMgaW4gc21wX2NhbGxpbigpIG1l
YW5zIGl0J3MgZG9uZQo+ID4gPiA+IHNlcmlhbGx5LCBleHRlbmRpbmcgYm9vdCB0aW1lIGJ5IDMu
OCBzZWNvbmRzLiBUaGF0J3MgYSBsb3Qgb2YgYm9vdCB0aW1lLgo+ID4gPiA+Cj4gPiA+ID4gSW5z
dGVhZCBvZiBtZWFzdXJpbmcgZWFjaCBDUFUgc2VyaWFsbHksIGxldCdzIGRvIHRoZSBtZWFzdXJl
bWVudHMgb24KPiA+ID4gPiBhbGwgQ1BVcyBpbiBwYXJhbGxlbC4gSWYgd2UgZGlzYWJsZSBwcmVl
bXB0aW9uIG9uIGFsbCBDUFVzLCB0aGUKPiA+ID4gPiBqaWZmaWVzIHN0b3AgdGlja2luZywgc28g
d2UgY2FuIGRvIHRoaXMgaW4gc3RhZ2VzIG9mIDEpIGV2ZXJ5Ym9keQo+ID4gPiA+IGV4Y2VwdCBj
b3JlIDAsIHRoZW4gMikgY29yZSAwLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIG1lYXN1cmVtZW50IGNh
bGwgaW4gc21wX2NhbGxpbigpIHN0YXlzIGFyb3VuZCwgYnV0IGlzIG5vdwo+ID4gPiA+IGNvbmRp
dGlvbmFsaXplZCB0byBvbmx5IHJ1biBpZiBhIG5ldyBDUFUgc2hvd3MgdXAgYWZ0ZXIgdGhlIHJv
dW5kIG9mCj4gPiA+ID4gaW4tcGFyYWxsZWwgbWVhc3VyZW1lbnRzIGhhcyBydW4uIFRoZSBnb2Fs
IGlzIHRvIGhhdmUgdGhlIG1lYXN1cmVtZW50Cj4gPiA+ID4gY2FsbCBub3QgcnVuIGR1cmluZyBi
b290IG9yIHN1c3BlbmQvcmVzdW1lLCBidXQgb25seSBvbiBhIGhvdHBsdWcKPiA+ID4gPiBhZGRp
dGlvbi4KPiA+ID4gPgo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
bWhuZy05MzU5OTkzZC02ODcyLTQxMzQtODNjZS1jOTdkZWJlMWNmOWFAcGFsbWVyLXJpLXgxYzkv
VC8jbWFlOWI4ZjQwMDE2ZjlkZjQyODgyOWQzMzM2MDE0NGRjNTAyNmJjYmYKPiA+ID4gPiBGaXhl
czogNTg0ZWE2NTY0YmNhICgiUklTQy1WOiBQcm9iZSBmb3IgdW5hbGlnbmVkIGFjY2VzcyBzcGVl
ZCIpCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+
Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5j
b20+Cj4gPiA+ID4gVGVzdGVkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgo+ID4gPiA+Cj4gPiA+ID4gLS0tCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+
ID4gPiA+ICAtIFJlbW92ZWQgbmV3IGdsb2JhbCwgdXNlZCBzeXN0ZW1fc3RhdGUgPT0gU1lTVEVN
X1JVTk5JTkcgaW5zdGVhZAo+ID4gPiA+ICAgIChKaXNoZW5nKQo+ID4gPiA+ICAtIEFkZGVkIHRh
Z3MKPiA+ID4gPgo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCB8
ICAyICstCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgIHwgMjIg
KysrKysrKysrKysrKysrKystLS0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290
LmMgICAgICAgICB8IDExICsrKysrKysrKystCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjgg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+ID4gaW5kZXggZDAzNDViZDY1OWM5Li5iMTM5Nzk2Mzky
ZDAgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJl
LmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4g
PiA+IEBAIC0zMCw2ICszMCw2IEBAIERFQ0xBUkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCk7Cj4gPiA+ID4gIC8qIFBlci1jcHUgSVNBIGV4dGVuc2lvbnMuICovCj4gPiA+
ID4gIGV4dGVybiBzdHJ1Y3QgcmlzY3ZfaXNhaW5mbyBoYXJ0X2lzYVtOUl9DUFVTXTsKPiA+ID4g
Pgo+ID4gPiA+IC12b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoaW50IGNwdSk7Cj4gPiA+ID4g
K2ludCBjaGVja191bmFsaWduZWRfYWNjZXNzKHZvaWQgKnVudXNlZCk7Cj4gPiA+ID4KPiA+ID4g
PiAgI2VuZGlmCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gPiA+IGluZGV4IDFjZmJi
YTY1ZDExYS4uNDBiYjg1NGZjYjk2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYwo+ID4gPiA+IEBAIC01NTYsOCArNTU2LDkgQEAgdW5zaWduZWQgbG9uZyByaXNjdl9nZXRf
ZWxmX2h3Y2FwKHZvaWQpCj4gPiA+ID4gICAgICAgcmV0dXJuIGh3Y2FwOwo+ID4gPiA+ICB9Cj4g
PiA+ID4KPiA+ID4gPiAtdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzKGludCBjcHUpCj4gPiA+
ID4gK2ludCBjaGVja191bmFsaWduZWRfYWNjZXNzKHZvaWQgKnVudXNlZCkKPiA+ID4gPiAgewo+
ID4gPiA+ICsgICAgIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gPiA+ID4gICAgICAg
dTY0IHN0YXJ0X2N5Y2xlcywgZW5kX2N5Y2xlczsKPiA+ID4gPiAgICAgICB1NjQgd29yZF9jeWNs
ZXM7Cj4gPiA+ID4gICAgICAgdTY0IGJ5dGVfY3ljbGVzOwo+ID4gPiA+IEBAIC01NzEsNyArNTcy
LDcgQEAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzKGludCBjcHUpCj4gPiA+ID4gICAgICAg
cGFnZSA9IGFsbG9jX3BhZ2VzKEdGUF9OT1dBSVQsIGdldF9vcmRlcihNSVNBTElHTkVEX0JVRkZF
Ul9TSVpFKSk7Cj4gPiA+ID4gICAgICAgaWYgKCFwYWdlKSB7Cj4gPiA+ID4gICAgICAgICAgICAg
ICBwcl93YXJuKCJDYW4ndCBhbGxvYyBwYWdlcyB0byBtZWFzdXJlIG1lbWNweSBwZXJmb3JtYW5j
ZSIpOwo+ID4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gPiA+Cj4gPiA+IER1bWIgcXVlc3Rpb24gbWF5YmUsIGJ1dCBJIGFtIGxpbWl0
ZWQgc2V0dXAgd2lzZSBhdCB0aGUgbW9tZW50IGR1ZSB0bwo+ID4gPiBhIGhhcmR3YXJlIGZhaWx1
cmUgd2hpY2ggbWFrZXMgY2hlY2tpbmcgc3R1ZmYgaGFyZCwgd2h5IHRoZSBzaWduYXR1cmUKPiA+
ID4gY2hhbmdlPyBSZXF1aXJlbWVudCBmb3Igb25fZWFjaF9jcHUoKT8KPiA+ID4KPiA+Cj4gPiBS
ZXF1aXJlbWVudCBmb3Igc21wX2NhbGxfb25fY3B1Lgo+Cj4gUmlnaHQuCj4KPiA+Cj4gPiA+ID4g
ICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gICAgICAgLyogTWFrZSBhbiB1bmFsaWduZWQgZGVzdGlu
YXRpb24gYnVmZmVyLiAqLwo+ID4gPiA+IEBAIC02NDMsMTUgKzY0NCwyNiBAQCB2b2lkIGNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3MoaW50IGNwdSkKPiA+ID4gPgo+ID4gPiA+ICBvdXQ6Cj4gPiA+ID4g
ICAgICAgX19mcmVlX3BhZ2VzKHBhZ2UsIGdldF9vcmRlcihNSVNBTElHTkVEX0JVRkZFUl9TSVpF
KSk7Cj4gPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4g
K3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfbm9uYm9vdF9jcHUodm9pZCAqcGFy
YW0pCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBpZiAoc21wX3Byb2Nlc3Nvcl9pZCgpICE9IDAp
Cj4gPiA+ID4gKyAgICAgICAgICAgICBjaGVja191bmFsaWduZWRfYWNjZXNzKHBhcmFtKTsKPiA+
ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gLXN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19ib290X2NwdSh2b2lkKQo+ID4gPiA+ICtzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfYWxsX2NwdXModm9pZCkKPiA+ID4gPiAgewo+ID4gPiA+IC0gICAgIGNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3MoMCk7Cj4gPiA+ID4gKyAgICAgLyogQ2hlY2sgZXZlcnlib2R5IGV4Y2VwdCAwLCB3
aG8gc3RheXMgYmVoaW5kIHRvIHRlbmQgamlmZmllcy4gKi8KPiA+ID4gPiArICAgICBvbl9lYWNo
X2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX25vbmJvb3RfY3B1LCBOVUxMLCAxKTsKPiA+ID4g
PiArCj4gPiA+ID4gKyAgICAgLyogQ2hlY2sgY29yZSAwLiAqLwo+ID4gPiA+ICsgICAgIHNtcF9j
YWxsX29uX2NwdSgwLCBjaGVja191bmFsaWduZWRfYWNjZXNzLCBOVUxMLCB0cnVlKTsKPiA+ID4g
PiAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gV2h5IGRvZXMgdGhpcyBmdW5jdGlvbiByZXR1
cm4gYW4gaW50IGlmIGl0IGNhbiBvbmx5IHJldHVybiAwPwo+ID4gPgo+Cj4gVGhpcyBpcyBhIHJl
cXVpcmVtZW50IG9uIHRoZSBpbml0Y2FsbF90IGZ1bmN0aW9uIHBvaW50ZXIgdHlwZS4KPgo+ID4K
PiA+IFNob3VsZCB3ZSBkZWZpbmUgYSBjaGVja191bmFsaWduZWRfYWNjZXNzX2Jvb3RfY3B1IHRv
IGF2b2lkIHRoZSByZXR1cm4KPiA+IHR5cGUgY2hhbmdlID8KPiA+IFdlIGNhbiBhbHNvIGdldCBy
aWQgb2YgdGhlIHVudXNlZCBwYXJhbWV0ZXIgaW4gdGhlCj4gPiBjaGVja191bmFsaWduZWRfYWNj
ZXNzIGZ1bmN0aW9uLgo+Cj4gSSBkb24ndCB0aGluayBpdCBtYXR0ZXJzIHRvbyBtdWNoIGVpdGhl
ciB3YXkuIEluIG15IG1pbmQgaXQgc29ydGEKPiBzaGlmdHMgdGhlIGJhbGxhc3QgYXJvdW5kIGJ1
dCBkb2Vzbid0IHJlYWxseSBkZWNyZWFzZSBpdC4KPgoKWWVhaC4gQnV0IGl0IGlzIGp1c3QgYSBi
aXQgY2xlYW5lciB0byBhdm9pZCB1bnVzZWQgYXJndW1lbnRzIGlmIHdlIGNhbi4KCj4gPgo+ID4g
SSBhbHNvIG5vdGljZWQgb25fZWFjaF9jcHUgaW52b2tlcyB0aGUgZnVuY3Rpb24gd2l0aGluIHBy
ZWVtcHRfZGlzYWJsZS9lbmFibGUuCj4gPiBjaGVja191bmFsaWduZWRfYWNjZXNzIHdpbGwgaW52
b2tlIGl0IGFnYWluLiBJdCdzIHByb2JhYmx5IGhhcm1sZXNzCj4gPiBidXQgdGhlcmUgaXMgbm8g
bmVlZCBmb3Igbm9uLWJvb3QgY3B1cy4KPiA+Cj4gPiBXZSBjYW4ganVzdCBoYXZlIHByZWVtcHRf
ZGlzYWJsZS9lbmFibGUgYXJvdW5kIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MKPiA+IGluIHRoZSBj
aGVja191bmFsaWduZWRfYWNjZXNzX2Jvb3RfY3B1IGZ1bmN0aW9uLgo+Cj4gSXQgaXMgaGFybWxl
c3MuIEkgaGF2ZW4ndCB3YWxrZWQgZnVsbHkgdGhyb3VnaCBzbXBfY2FsbF9vbl9jcHUoKSwgYnV0
Cj4gSSdkIGJlIGludHVpdGl2ZWx5IHF1aXRlIHN1cnByaXNlZCBpZiBwcmVlbXB0aW9uIHdlcmUg
ZW5hYmxlZCBvbiB0aG9zZQo+IGNhbGxiYWNrcyB0b28gKGFzIHlvdSdkIGJlIHNheWluZyAicnVu
IG15IGZ1bmN0aW9uIG9uIHRoaXMgY3B1LCBidXQgbm8KPiBndWFyYW50ZWUgaXQgd2lsbCBzdGF5
IHRoZXJlISIpLiBTbyBpbiB0aGVvcnkgSSBzaG91bGQgYmUgYWJsZSB0bwoKSSBkaWRuJ3Qgc2Vl
IGFueXRoaW5nIGV4cGxpY2l0bHkgZGlzYWJsZS9lbmFibGUgcHJlZW1wdGlvbiBvbiBzbXBfY2Fs
bF9vbl9jcHUuCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCB5b3VyIHF1ZXVlZCBmdW5jdGlvbiBp
cyBndWFyYW50ZWVkIHRvIHJ1biBvbiB0aGF0IGNwdQphcyBpdCBpcyBxdWV1ZWQgb24gdGhlIGNw
dSBzcGVjaWZpYyB3cSBidXQgaXQgbWF5IGJlIHByZWVtcHRlZCBieQpzb21ldGhpbmcgZWxzZS4K
CkZvciBwcm9iaW5nIGFsaWdubWVudCBzcGVlZCwgeW91IGp1c3QgY2FyZSBhYm91dCBydW5uaW5n
IGl0IG9uIHRoYXQKY3B1LiBDb3JyZWN0ID8KCj4gcmVtb3ZlIHRoZSBwcmVlbXB0X2Rpc2FibGUv
ZW5hYmxlIGVudGlyZWx5LiBBcyBhIHNpZGUgbm90ZTogSSBhZGRlZAo+IHRoZSBzbXBfY2FsbF9v
bl9jcHUoKSBiZWNhdXNlIEkgY291bGRuJ3QgY29udmluY2UgbXlzZWxmIHRoZSBpbml0Y2FsbHMK
PiB3b3VsZCBzdGF5IG9uIGNwdSAwLiBJbiBwcmFjdGljZSB0aGV5IGFsd2F5cyBzZWVtIHRvIGJl
Lgo+CgpJIHRoaW5rIHRoYXQncyB0aGUgY29ycmVjdCB3YXkgdG8gZG8gaXQgYXMgdGhlIHNjaGVk
dWxlciBpcyBhY3RpdmUKbm93LiBUaGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdAppdCB3aWxsIHN0
YXkgb24gY3B1MCBhcyB5b3UgbWVudGlvbmVkLgoKPgo+IC1FdmFuCgoKCi0tIApSZWdhcmRzLApB
dGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
