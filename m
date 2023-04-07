Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD16C77B61
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR6mbCmROFJmj6Nc+lX69wBbT7i8gkZPX0uuOKW69mY=; b=Bli7AlkFZ5gLi5
	AkxhQVo5B8I6SW0oRJg3TZVBUT+tlE4b+ZBe2tDGHmkj+h/lSEjh784fbdY3xiY/tu/9uCkyGAs9y
	EZ5POdVb4CuuhTBnd8BF8gNynlZ1ZZSmgkeilEFtIk4oWxUdpGL5ykVWx5FxNB2X5S2+bM13pdbtE
	i+m2K593O0Dl43LBXk5CE4pNwEKUsGOWzCXnpaYr5ri5MSKOuIUlBW0kwv/hrag4p8dISzV0JTbcC
	A2I+u23a3uifZoWqQl5U5nD1HAK78bsa2NRz4QW5VwHOo7N+eawKfo4tCQ1MIesM//sDd0yCgcN9O
	j6QNHVbYdmLIg1bw4Azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pknoP-00AalB-2g;
	Fri, 07 Apr 2023 15:15:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pknoM-00AakJ-2q
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 15:15:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F47364259
	for <linux-riscv@lists.infradead.org>; Fri,  7 Apr 2023 15:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790A1C433A0
	for <linux-riscv@lists.infradead.org>; Fri,  7 Apr 2023 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680880533;
	bh=vGlwy608C+Ds3GbvhDnhbpjMR3EUPj9t3k92oNr7CQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XMqQHa9R3z/+oLKPnwI14KxGJGT4kWe/i/ZIanhLOakD0qQvCIWWiu3r6h7xGq2yU
	 BZsh/XGxd7/qBWfIVmXrA3HIHl5wTfOkLlCgtmFRer5knqFP49GoJaxygsnc07G+5A
	 RQRUXCnwSFZ1sr+IUa5qbM3h3He7xKxOHU1JGlXGD/3PWpAkggj3b/Gneaz2i/OMAP
	 yOdU/xOztXn9a5QKvKisIdGSNwcB63CTvvsooBTYTvjctXwMxAjxE5U1ODsRNoFArx
	 m6qTkCTUVCbm6SdP/J/UsTvfJoeHvMPse54X1KJcB5f76p+rE8SaPiK2wzYetkopMj
	 oAu+5vaU0dxMQ==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17997ccf711so45971523fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 08:15:33 -0700 (PDT)
X-Gm-Message-State: AAQBX9emH6wDi2AY0TTkmFlonMwEyYJD0xnUZ5NtbXWTd7IlWtrd4KKk
	CQFcucVKurucqUiAzavkPNs4cpO6zAaeWTXeeUw=
X-Google-Smtp-Source: AKy350bSS6cueUUGxjORUIEpgEgnjuCl7Kvm9fMBzAHqjK/qQkvinz7XpylPEKFliZtBYuwmOhxGEZ4JWyZlfR9sGtg=
X-Received: by 2002:a05:6870:2050:b0:179:c3d1:42d0 with SMTP id
 l16-20020a056870205000b00179c3d142d0mr1316089oad.11.1680880532724; Fri, 07
 Apr 2023 08:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230326182120.194541-1-hi@alyssa.is>
In-Reply-To: <20230326182120.194541-1-hi@alyssa.is>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Apr 2023 00:14:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAnLyZrDdMbfp3nKz+5M0BXrNUPRAagXhYtYQpEpfOyg@mail.gmail.com>
Message-ID: <CAK7LNARAnLyZrDdMbfp3nKz+5M0BXrNUPRAagXhYtYQpEpfOyg@mail.gmail.com>
Subject: Re: [PATCH v2] purgatory: fix disabling debug info
To: Alyssa Ross <hi@alyssa.is>
Cc: Nick Cao <nickcao@nichi.co>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Tom Rix <trix@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_081535_015580_9C020B1A 
X-CRM114-Status: GOOD (  16.96  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMzoyM+KAr0FNIEFseXNzYSBSb3NzIDxoaUBhbHlzc2Eu
aXM+IHdyb3RlOgo+Cj4gU2luY2UgMzJlZjllNTA1NGVjLCAtV2EsLWdkd2FyZi0yIGlzIG5vIGxv
bmdlciB1c2VkIGluIEtCVUlMRF9BRkxBR1MuCj4gSW5zdGVhZCwgaXQgaW5jbHVkZXMgLWcsIHRo
ZSBhcHByb3ByaWF0ZSAtZ2R3YXJmLSogZmxhZywgYW5kIGFsc28gdGhlCj4gLVdhIHZlcnNpb25z
IG9mIGJvdGggb2YgdGhvc2UgaWYgYnVpbGRpbmcgd2l0aCBDbGFuZyBhbmQgR05VIGFzLiAgQXMg
YQo+IHJlc3VsdCwgZGVidWcgaW5mbyB3YXMgYmVpbmcgZ2VuZXJhdGVkIGZvciB0aGUgcHVyZ2F0
b3J5IG9iamVjdHMsIGV2ZW4KPiB0aG91Z2ggdGhlIGludGVudGlvbiB3YXMgdGhhdCBpdCBub3Qg
YmUuCj4KPiBGaXhlczogMzJlZjllNTA1NGVjICgiTWFrZWZpbGUuZGVidWc6IHJlLWVuYWJsZSBk
ZWJ1ZyBpbmZvIGZvciAuUyBmaWxlcyIpCj4gU2lnbmVkLW9mZi1ieTogQWx5c3NhIFJvc3MgPGhp
QGFseXNzYS5pcz4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+Cj4gRGlmZmVy
ZW5jZSBmcm9tIHYyOiByZXBsYWNlIGVhY2ggQUZMQUdTX1JFTU9WRV8qIGFzc2lnbm1lbnQgd2l0
aCBhCj4gc2luZ2xlIGFmbGFncy1yZW1vdmUteSBsaW5lLCBhbmQgdXNlIGZvcmVhY2ggdG8gYWRk
IHRoZSAtV2EgdmVyc2lvbnMsCj4gYXMgc3VnZ2VzdGVkIGJ5IE1hc2FoaXJvIFlhbWFkYS4KCgpB
cHBsaWVkIHRvIGxpbnV4LWtidWlsZC9maXhlcy4KVGhhbmtzLgoKCj4gIGFyY2gvcmlzY3YvcHVy
Z2F0b3J5L01ha2VmaWxlIHwgNyArLS0tLS0tCj4gIGFyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmls
ZSAgIHwgMyArLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUgYi9h
cmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZQo+IGluZGV4IGQxNmJmNzE1YTU4Ni4uNTczMDc5
N2E2YjQwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L01ha2VmaWxlCj4gKysr
IGIvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKPiBAQCAtODQsMTIgKzg0LDcgQEAgQ0ZM
QUdTX3N0cmluZy5vICAgICAgICAgICAgICAgICAgICAgICs9ICQoUFVSR0FUT1JZX0NGTEFHUykK
PiAgQ0ZMQUdTX1JFTU9WRV9jdHlwZS5vICAgICAgICAgICs9ICQoUFVSR0FUT1JZX0NGTEFHU19S
RU1PVkUpCj4gIENGTEFHU19jdHlwZS5vICAgICAgICAgICAgICAgICArPSAkKFBVUkdBVE9SWV9D
RkxBR1MpCj4KPiAtQUZMQUdTX1JFTU9WRV9lbnRyeS5vICAgICAgICAgICs9IC1XYSwtZ2R3YXJm
LTIKPiAtQUZMQUdTX1JFTU9WRV9tZW1jcHkubyAgICAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAt
QUZMQUdTX1JFTU9WRV9tZW1zZXQubyAgICAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAtQUZMQUdT
X1JFTU9WRV9zdHJjbXAubyAgICAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAtQUZMQUdTX1JFTU9W
RV9zdHJsZW4ubyAgICAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAtQUZMQUdTX1JFTU9WRV9zdHJu
Y21wLm8gICAgICAgICAgICAgICAgKz0gLVdhLC1nZHdhcmYtMgo+ICthc2ZsYWdzLXJlbW92ZS15
ICAgICAgICAgICAgICAgKz0gJChmb3JlYWNoIHgsIC1nIC1nZHdhcmYtNCAtZ2R3YXJmLTUsICQo
eCkgLVdhLCQoeCkpCj4KPiAgJChvYmopL3B1cmdhdG9yeS5ybzogJChQVVJHQVRPUllfT0JKUykg
Rk9SQ0UKPiAgICAgICAgICAgICAgICAgJChjYWxsIGlmX2NoYW5nZWQsbGQpCj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmlsZSBiL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtl
ZmlsZQo+IGluZGV4IDE3ZjA5ZGMyNjM4MS4uODJmZWM2NmQ0NmQyIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gveDg2L3B1cmdhdG9yeS9NYWtlZmlsZQo+ICsrKyBiL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtl
ZmlsZQo+IEBAIC02OSw4ICs2OSw3IEBAIENGTEFHU19zaGEyNTYubyAgICAgICAgICAgICAgICAg
ICAgICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTKQo+ICBDRkxBR1NfUkVNT1ZFX3N0cmluZy5vICAg
ICAgICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTX1JFTU9WRSkKPiAgQ0ZMQUdTX3N0cmluZy5vICAg
ICAgICAgICAgICAgICAgICAgICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTKQo+Cj4gLUFGTEFHU19S
RU1PVkVfc2V0dXAteDg2XyQoQklUUykubyAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAtQUZMQUdT
X1JFTU9WRV9lbnRyeTY0Lm8gICAgICAgICAgICAgICAgICAgICAgICArPSAtV2EsLWdkd2FyZi0y
Cj4gK2FzZmxhZ3MtcmVtb3ZlLXkgICAgICAgICAgICAgICArPSAkKGZvcmVhY2ggeCwgLWcgLWdk
d2FyZi00IC1nZHdhcmYtNSwgJCh4KSAtV2EsJCh4KSkKPgo+ICAkKG9iaikvcHVyZ2F0b3J5LnJv
OiAkKFBVUkdBVE9SWV9PQkpTKSBGT1JDRQo+ICAgICAgICAgICAgICAgICAkKGNhbGwgaWZfY2hh
bmdlZCxsZCkKPgo+IGJhc2UtY29tbWl0OiBkYThlN2RhMTFlNGJhNzU4Y2FmNGMxNDljYzhkOGNk
NTU1YWVmZTVmCj4gLS0KPiAyLjM3LjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFt
YWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
