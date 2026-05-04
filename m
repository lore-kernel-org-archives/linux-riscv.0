Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BCFFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3Biz7VQ657gVTAAZcDLGUwAgMfMCZV60XU/LQb9GFU=; b=2WJ8V4piMN8CfW
	gFFQpG2Rg2FgasmONppxZZhlJOiSbLSMupTuro/yyiM+vvk0VlijzZjR8TIr1VO8jNjHvS/MtpyD/
	bl5ssNJ5WDQ9u33hKrStxOqaDEs6TEJE+XsgxJv5rsWupVKvDYbA6z8eWjIuuc8d01P+0i912G9nG
	7Qg15B+R9AMUuGIsmR35VdKZYkaEbS9iSH8TuhbCKUbre7dM+fYkReMndWQnpc9M5BpAI9JBV14jJ
	o5IghnCPSJxnClLBLbj52eYBRmDHR0o9av7d78C2LBb6JOQRTbRvPfM+cLkMgnitqQMMf88dW9JBR
	CyJw+kJzZqz+7Diy11FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoru-0000000Ck5z-0pJj;
	Mon, 04 May 2026 08:41:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJors-0000000Ck5l-1lkN
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 08:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4692960125
	for <linux-riscv@lists.infradead.org>; Mon,  4 May 2026 08:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC2DC2BCB8
	for <linux-riscv@lists.infradead.org>; Mon,  4 May 2026 08:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777884090;
	bh=+UjdPXgx40aGDQmYPDjrReOVwgfO07rl3A8FxXfkg2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AdrSv4TWN8lvcDxoc1i8Njr8E3j/iJL2GQWDvt2jdR4Sh1WUwCH7qtXGYHnH/dpfb
	 fZx08dufJdeJuP8/Hi6+yj20J9pHG3/pkDiMCAaxTPZxmvWMFgkE+4EyvnVLmGMJhU
	 mwkysWUx9WkG4xizPltMPY8B+I3+AhtddA49e0fNXNLVd032W1qCHfH9mMQ05YbGBb
	 4CcutFrpIAqWSLHdJ8w5hPn/zQ+2Qgs0ZUYLIldQNc2igxVr+yiMjdPWdKyhXD3ruJ
	 CtK/N/Xy0Kn82MPao191aJfri7DU/okb8daoY9xK5tz+KVMdn6KtML9outiV22sUQ1
	 aJLfcB0GwFqMw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so6700361fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 01:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fDg/Ba6iSfa/vjh2v/C5nLUUr5bFdMo39bgifXzJyXvOScS9yfnKHX+PulLGNy0/ALyIOy7bsyNHIGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk5VpjOfvxdiog/mWgxmJj2ZYgrt0bdZ2Ei1TJV+fOTmiJL4rS
	dMTsEt39l5z8xMl7hycUe3TWecjbavRLjtiNUk5e2PAjZdzvx4YUNmzphSXsXazLMASK53nqOar
	/eW1QRnT/29tpf35HwCUny8fR7A5g8oc=
X-Received: by 2002:a05:6512:1193:b0:5a8:74c3:5d9b with SMTP id
 2adb3069b0e04-5a874c35f1emr460528e87.0.1777884088510; Mon, 04 May 2026
 01:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud> <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260428-hardhat-both-1c9aa594a45a@spud>
In-Reply-To: <20260428-hardhat-both-1c9aa594a45a@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 4 May 2026 10:41:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
X-Gm-Features: AVHnY4LuNknvAN1JKPIs7fCl3dSCfrsEmP8h88LbnEyxp4JJXZMfI_swQ2zu-2g
Message-ID: <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

T24gVHVlLCBBcHIgMjgsIDIwMjYgYXQgODo1MeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBBcHIgMjgsIDIwMjYgYXQgMDE6Mjg6MDVBTSArMDAw
MCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToKCj4gPiBXZSB0aGluayB0aGF0IGltcGxlbWVudGlu
ZyB0aGlzIGluIHRoZSBwaW5tdXggd2lsbCBiZSByZWxhdGl2ZWx5IHNpbXBsZS4gSXQgYXZvaWRz
Cj4gPiB0aGUgbmVlZCB0byBjcmVhdGUgYSBsYXJnZSBudW1iZXIgb2YgbWFwcGluZyByZWxhdGlv
bnNoaXBzIGluIHRoZSBkcml2ZXIsIHdoaWNoCj4gPiBzaW1wbGlmaWVzIG91ciBkcml2ZXIgaW1w
bGVtZW50YXRpb24uIEknbSBub3Qgc3VyZSBpZiB5b3UnbGwgZmluZCB0aGlzIGV4cGxhbmF0aW9u
Cj4gPiBhY2NlcHRhYmxlLgo+Cj4gSSBkb24ndCByZWFsbHkgc2VlIGhvdyBwaW5zICsgZnVuY3Rp
b25zIHdvdWxkIHJlcXVpcmUgbG90cyBvZiAibWFwcGluZwo+IHJlbGF0aW9uc2hpcHMiLiBJbnN0
ZWFkIG9mIGhhdmluZwo+ICsvKiBwaW5jdHJsX3N5czIgcGFkIGZ1bmN0aW9uIHNlbGVjdGlvbiAq
Lwo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0NUUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX1JUUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0RDRCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0RTUiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0RUUiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX1JJICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMF9UWCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMF9SWCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMV9UWCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMV9S
WCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJU
Ml9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9V
QVJUMl9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lT
Ml9VQVJUM19UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNf
U1lTMl9VQVJUM19SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZV
TkNfU1lTMl9VQVJUNF9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5l
IEZVTkNfU1lTMl9VQVJUNF9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVm
aW5lIEZVTkNfU1lTMl9VQVJUNV9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsj
ZGVmaW5lIEZVTkNfU1lTMl9VQVJUNV9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+
ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUNl9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUNl9SWCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUN19UWCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUN19SWCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOF9UWCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOF9SWCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOV9UWCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOV9SWCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTBfVFggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTBfUlgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTFf
VFggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJU
MTFfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lTMl9V
QVJUMTJfVFggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNfU1lT
Ml9VQVJUMTJfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZVTkNf
U1lTMl9VQVJUMTNfVFggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIEZV
TkNfU1lTMl9VQVJUMTNfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5l
IEZVTkNfU1lTMl9VQVJUMTRfVFggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVm
aW5lIEZVTkNfU1lTMl9VQVJUMTRfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQo+IHlv
dSBqdXN0IGRlZmluZSBhIGZ1bmN0aW9uIGNhbGxlZCAidWFydCIgYW5kIGhhdmUgYSBzaW1wbGUg
bWFwIG9mCj4gdGhhdCBzdHJpbmcgdG8gdGhlIG51bWJlciAxLiBZb3UgZW5kIHVwIHdpdGggYSBz
aW5nbGUgYXJyYXkgd2l0aCB0aGUKPiByZWxhdGlvbnNoaXBzLCBub3QgbG90cy4KPgo+IEZyYW5r
bHksIHBpbm11eCBqdXN0IGRvZXMgbm90IHNlZW0gYXBwcm9wcmlhdGUgdG8gbWUgd2hlbiBpdCBs
b29rcyBsaWtlCj4gOTAlKyBvZiB0aGUgcGluIG1hcHBpbmdzIGZvciBhIHBlcmlwaGVyYWwgc2hh
cmUgdGhlIHNhbWUgZnVuY3Rpb24gdmFsdWUuCj4gVGhlcmUgYXBwZWFycyBvbmx5IHRvIGJlIGEg
cmFyZSBudW1iZXIgb2YgY2FzZXMgd2hlcmUgdGhhdCBkb2Vzbid0Cj4gYXBwbHksIGJ1dCB0aGF0
IGNvdWxkIGJlIGhhbmRsZWQgYnkgaGF2aW5nIHRoZW0gcmVwcmVzZW50ZWQgYnkgYQo+IGRpZmZl
cmVudCBncm91cC9waW5zIG5vZGUgd2l0aCBhIGRpZmZlcmVudCBmdW5jdGlvbi4KCkkgc2hhcmUg
Q29ub3JzIHZpZXcgb24gdGhlIG11eGluZyBoZXJlLiBVc2luZyBmdW5jdGlvbnMgKyBncm91cHMK
YXMgc3RyaW5ncyBsb29rcyBlYXNpZXIgZm9yIHRoaXMgaGFyZHdhcmUsIGFuZCB0aGUgZHJpdmVy
IG5lZWRzIG1hbnkKY2hhbmdlcyBhbnl3YXkgc28gSSB3b3VsZCBzYXkganVzdCBnZXQgdG8gaXQu
CgpBIGNvbW1vbiBwcm9ibGVtIGFtb25nIHVwc3RyZWFtIGNvbnRyaWJ1dG9ycyBpcyBwdXNoYmFj
ayB0aGF0IHNlZW1zCnRvIG1hc2sgdGhlIGZhY3QgdGhhdCB5b3VyIG9yZ2FuaXphdGlvbiBoYXMg
YWxyZWFkeSBkZWNpZGVkIHRvIHVzZSB0aGlzCnNjaGVtZSBiZWZvcmUgZGlzY3Vzc2luZyB0aGlu
Z3Mgd2l0aCB0aGUgY29tbXVuaXR5IChiYXNlZCBvbiBwcmV2aW91cwp3b3JrIGFuZCBhc3N1bXB0
aW9ucyB1c3VhbGx5KSwgYW5kIEknbSBub3QKaGFwcHkgYWJvdXQgc3VjaCBzaXR1YXRpb25zLCBz
byBwbGVhc2UgdGFrZSB0aGlzIHRpbWUgZm9yIGFuIGludGVybmFsCmRpc2N1c3Npb24gYWJvdXQg
Y29tbXVuaXR5IHdvcmsgaWYgdGhpcyBpcyB0aGUgY2FzZS4KCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
