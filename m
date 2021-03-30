Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD73C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 01:55:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30FDF6157F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 01:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30FDF6157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JPOdzgxibK8sQzGm3sAZULgfPfc5QAvdu8d556FcC5E=; b=FGbfaIPVLWZkLYcKGFfUUTgfy
	UgqLZIHkFFcOXJBvFZx6R4hPDGDWKR/Cq4JR2/ALVlOK9DPE//Gck8/JnkvhBt20OWeFeKevxa647
	vmvngw6TDa2pFPHuIx/2RKYNfAbliN9uwVEUUDL5MVwjeyITeIMXq5w6LRMqchPXNPGOK/vdyc7he
	3YrQYh17u6uO10dUErWlBw+NheSJd50vzHdMOXdPeN9DxzwWp8KlCemDiY8859TrQqDWg43BY8Tqq
	/zrHukl1dYr9BTq5u++D5UEebbeEocJfwL0j5Hkef2S107QKwlh4AobTLDlnXpDlgLl9hRy/GFbl1
	/mVw4BnPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR3ay-002O6j-SL; Tue, 30 Mar 2021 01:55:05 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR2cj-002Gc5-P8
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 00:52:54 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 12U0qONA066168
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 03:52:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617065539; x=1619657539;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ytp87wkA+alvM5YO/7dlXgP5/jZJBWXepwASfozGUU=;
 b=CXdKG8AeuRZiwZ+qSuU9itQVeS+S6jzZD+LSRTjBq4uIMwy1EtYl2LFohFQ3P0aL
 1snhQLBfGMnJPLlMUvta1R1ExG60xpMGjvqAzE108mPHfXrfMlKUizgfR2G3CWnj
 dKei0YP7+vI+q9xmsTyWmdWtYdS0hBwgkfMMp+y/DHsFRhQlCWvNoRqg2neDGsDy
 A/MbNsCxbPucEdxZvgGboLEud/obw/iKdEC8cDqcfAJRCeFRpho58PpEswmR8XMQ
 DBZlttMlmL7pkMgUDfZroBTVf9b7EC2+ikG/v595zLMuOGi9LkWZ5Pgiy0gLVEtB
 d2DVMQG/q9QvZWbAMsyDiw==;
X-AuditID: 8b5b014d-a4c337000000209f-f6-60627642ff7a
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 86.6D.08351.24672606; Tue, 30 Mar 2021 03:52:18 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 30 Mar 2021 03:52:17 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Rob Herring <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Andreas Schwab
 <schwab@linux-m68k.org>, Will Deacon <will@kernel.org>, Daniel Walker
 <danielwa@cisco.com>, Daniel Gimpelevich
 <daniel@gimpelevich.san-francisco.ca.us>, "open list:GENERIC INCLUDE/ASM
 HEADER FILES" <linux-arch@vger.kernel.org>, devicetree@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, microblaze
 <monstr@monstr.eu>, "open list:MIPS" <linux-mips@vger.kernel.org>, nios2
 <ley.foon.tan@intel.com>, Openrisc <openrisc@lists.librecores.org>,
 linux-hexagon@vger.kernel.org, linux-riscv
 <linux-riscv@lists.infradead.org>,
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org,
 SH-Linux <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, paul.walmsley@sifive.com
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
Organization: FORTH
In-Reply-To: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
 <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Message-ID: <3ae0c2faa08f76efb8a446f262b712df@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsXSHT1dWde5LCnB4AO/xZ1Jz9ktjh7vZbZo
 XriE2WL+kXOsFvd3NzJadOz6ymKx6fE1Vov3LTvYLC7vmsNm0blpK6PFts8tbBZz/kxhtlh5
 di27xe/v/1gtnnw8DVTceZnNom0Wv8X/PTvYLfqXdrBZNJxcwWrRcsfU4seGx6wOYh5Tfm9k
 9fh68xyTx/0Hz1k9Fu95yeSxaVUnm8ehwx2MHi8Obmf22Lyk3mP9hm2MHudnLGT0+Ns1hdnj
 UvN1do/Pm+QCeKO4bFJSczLLUov07RK4MpqW3GYuuMdT8eD2fOYGxrVcXYycHBICJhKb5j1j
 72Lk4hASOM4ocWFHFwtEwlRi9t5ORhCbV0BQ4uTMJ2BxZgELialX9jNC2PISzVtnM4PYLAKq
 Els+QMTZBDQl5l86CFYvIqAo8bttGivIAmaBz+wSj242AhVxcAgL2Essn2UHUsMvICzx6e5F
 VhCbUyBQ4uqL32wQB61hkjh69A8zxBEuEv8+TmeFOE5F4sPvB+wgc0SB7M1zlSYwCs5Ccuos
 JKfOQnLqAkbmVYwCiWXGepnJxXpp+UUlGXrpRZsYwRHN6LuD8fbmt3qHGJk4GA8xSnAwK4nw
 Ch9ITBDiTUmsrEotyo8vKs1JLT7EKM3BoiTOy6s3IV5IID2xJDU7NbUgtQgmy8TBKdXAZDF7
 Ibu7bpJ0S056lY5T1mb7vUI9xyRZInM7SjMP8ahbfi7Uu/0qNq1njospX8DU78dj3x2SfDtV
 xHr+FbGLEcWvzua/LQj7ONkr3DCLIUHfakKWSpDXwry3fhOKIt/ODEo56nXrAdt29SnP+nMU
 /0fe/8z4TdbTnDN88c+XOWxtenuYQhzmfH6zlLlrvXps4O6P71n8I2qa5vKWSe5VsPzLdTHu
 SsfRmr9zrF4xMis2pC6wc3hy+6X3kX3s6p2BTRKZ765un2UqyV7ZejbXdqbCqqDP7v8XdzH4
 y8tEl3xTvfqpobI9Nip3m3ir+7L5W7548iblXFzk8i1x838fU8lVvJ6yk1SXnTbzEFViKc5I
 NNRiLipOBAC7YhWKVwMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_015251_312155_C02AD57D 
X-CRM114-Status: GOOD (  12.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wMy0yNiAxNzoyNiwgUm9iIEhlcnJpbmcgzq3Os8+BzrHPiM61Ogo+IE9u
IEZyaSwgTWFyIDI2LCAyMDIxIGF0IDg6MjAgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+PiAKPj4gCj4+IAo+PiBMZSAyNi8wMy8yMDIx
IMOgIDE1OjA4LCBBbmRyZWFzIFNjaHdhYiBhIMOpY3JpdCA6Cj4+ID4gT24gTcOkciAyNiAyMDIx
LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+PiA+Cj4+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+PiA+PiBpbmRl
eCBmOGYxNTMzMmNhYTIuLmU3YzkxZWU0NzhkMSAxMDA2NDQKPj4gPj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc2V0dXAuYwo+PiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+
ID4+IEBAIC0yMCw2ICsyMCw3IEBACj4+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3N3aW90bGIuaD4K
Pj4gPj4gICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L2Vm
aS5oPgo+PiA+PiArI2luY2x1ZGUgPGxpbnV4L2NtZGxpbmUuaD4KPj4gPj4KPj4gPj4gICAjaW5j
bHVkZSA8YXNtL2NwdV9vcHMuaD4KPj4gPj4gICAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAu
aD4KPj4gPj4gQEAgLTIyOCwxMCArMjI5LDggQEAgc3RhdGljIHZvaWQgX19pbml0IHBhcnNlX2R0
Yih2b2lkKQo+PiA+PiAgICAgIH0KPj4gPj4KPj4gPj4gICAgICBwcl9lcnIoIk5vIERUQiBwYXNz
ZWQgdG8gdGhlIGtlcm5lbFxuIik7Cj4+ID4+IC0jaWZkZWYgQ09ORklHX0NNRExJTkVfRk9SQ0UK
Pj4gPj4gLSAgICBzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBDT05GSUdfQ01ETElORSwgQ09N
TUFORF9MSU5FX1NJWkUpOwo+PiA+PiArICAgIGNtZGxpbmVfYnVpbGQoYm9vdF9jb21tYW5kX2xp
bmUsIE5VTEwsIENPTU1BTkRfTElORV9TSVpFKTsKPj4gPj4gICAgICBwcl9pbmZvKCJGb3JjaW5n
IGtlcm5lbCBjb21tYW5kIGxpbmUgdG86ICVzXG4iLCBib290X2NvbW1hbmRfbGluZSk7Cj4+ID4K
Pj4gPiBTaG91bGRuJ3QgdGhhdCBtZXNzYWdlIGJlY29tZSBjb25kaXRpb25hbCBpbiBzb21lIHdh
eT8KPj4gPgo+PiAKPj4gWW91IGFyZSByaWdodCwgSSBkaWQgc29tZXRoaW5nIHNpbWlsYXIgb24g
QVJNIGJ1dCBsb29rcyBsaWtlIEkgbWlzc2VkIAo+PiBpdCBvbiBSSVNDVi4KPiAKPiBIb3cgaXMg
dGhpcyBodW5rIGV2ZW4gdXNlZnVsPyBVbmRlciB3aGF0IGNvbmRpdGlvbnMgY2FuIHlvdSBib290
Cj4gd2l0aG91dCBhIERUQj8gRXZlbiB3aXRoIGEgYnVpbHQtaW4gRFRCLCB0aGUgRFQgY21kbGlu
ZSBoYW5kbGluZyB3b3VsZAo+IGJlIGNhbGxlZC4KPiAKPiBSb2IKPiAKCmNjZWQgUGF1bCB3aG8g
aW50cm9kdWNlZCB0aGlzOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9yaXNjdi9saW51eC5naXQvY29tbWl0L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmM/
aWQ9OGZkNmUwNWM3NDYzYjYzNWU1MWVjN2RmMGExODU4YzFiNWE2ZTM1MAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
