Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45569C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:55:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE17961A26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE17961A26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8OobDdprRRmPiXaWFGm2RePidczKVRYQzZN3kXfuf9M=; b=q9Mv601n93Ytpcid0RD40zFNA
	umtet/YGbxoCsE4zbKVE6rL/tVocixX+a75dffj/OmUUiuvIL3vYqyz2tfTWbtiUiVujapUlOEHYZ
	dudC2tNKlLb/m/fWanWJTZYULA3nrUCp6XXE5MB3CwZd9Q/m8jPCDKFjOWdgKAUtGKL39bduW/sb5
	Ruh5E0oUjRQshOFom2qrACsSsckS9jICQq7Glshcf1HIIwloEgTaJlmw6u2W7CEp2o6ApsGokI90q
	YtryFAn3pJXnTCw9RXv16Rb17KgkRhR88T3b9ZQ+QAK6K+RvfrDgMpEEW6NzGslbXIfbsHK9YH95o
	rYy9UvY+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPooK-003vH6-Si; Fri, 26 Mar 2021 15:55:44 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPoo9-003vGI-Fd; Fri, 26 Mar 2021 15:55:35 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6RQB6DtPz9v0Mx;
 Fri, 26 Mar 2021 16:55:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fRfLPhr5ARx4; Fri, 26 Mar 2021 16:55:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6RQB5JGZz9v0Mw;
 Fri, 26 Mar 2021 16:55:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 354458B8CF;
 Fri, 26 Mar 2021 16:55:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id o-ftwDSIO1we; Fri, 26 Mar 2021 16:55:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 249F98B8C7;
 Fri, 26 Mar 2021 16:55:31 +0100 (CET)
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Daniel Walker <danielwa@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, nios2 <ley.foon.tan@intel.com>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, X86 ML <x86@kernel.org>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <58834b01-aad5-fa1e-554e-6417b2357202@csgroup.eu>
Date: Fri, 26 Mar 2021 16:55:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_155533_678275_404EBD47 
X-CRM114-Status: GOOD (  24.46  )
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

CgpMZSAyNi8wMy8yMDIxIMOgIDE2OjQyLCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgTWFyIDI2LCAyMDIxIGF0IDc6NDQgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pgo+PiBUaGlzIGNvZGUgcHJvdmlkZXMgYXJjaGl0
ZWN0dXJlcyB3aXRoIGEgd2F5IHRvIGJ1aWxkIGNvbW1hbmQgbGluZQo+PiBiYXNlZCBvbiB3aGF0
IGlzIGJ1aWx0IGluIHRoZSBrZXJuZWwgYW5kIHdoYXQgaXMgaGFuZGVkIG92ZXIgYnkgdGhlCj4+
IGJvb3Rsb2FkZXIsIGJhc2VkIG9uIHNlbGVjdGVkIGNvbXBpbGUtdGltZSBvcHRpb25zLgo+IAo+
IE5vdGUgdGhhdCBJIGhhdmUgdGhpcyBwYXRjaCBwZW5kaW5nOgo+IAo+IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjEwMzE2
MTkzODIwLjMxMzctMS1hbGV4QGdoaXRpLmZyLwo+IAo+IEl0J3MgZ29pbmcgdG8gbmVlZCB0byBi
ZSBhZGFwdGVkIGZvciB0aGlzLiBJJ3ZlIGhlbGQgb2ZmIGFwcGx5aW5nIHRvCj4gc2VlIGlmIHRo
aXMgZ2V0cyBzZXR0bGVkLgoKZ29vZCBwb2ludC4KCkhvcGUgd2UgY2FuJ3QgaGF2ZSB0aGluZ3Mg
bGlrZQoKCW9wdGlvbj0iYmVhdXRpZnVsIHdlYXRoZXIiCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+
PiB2MzoKPj4gLSBBZGRyZXNzZWQgY29tbWVudHMgZnJvbSBXaWxsCj4+IC0gQWRkZWQgY2FwYWJp
bGl0eSB0byBoYXZlIHNyYyA9PSBkc3QKPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9jbWRsaW5l
LmggfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvbGludXgvY21kbGluZS5oCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Nt
ZGxpbmUuaCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZGVhODdlZGQ0MWJlCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPj4gQEAgLTAsMCArMSw1NyBAQAo+PiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKyNpZm5kZWYgX0xJTlVYX0NN
RExJTkVfSAo+PiArI2RlZmluZSBfTElOVVhfQ01ETElORV9ICj4+ICsKPj4gKyNpbmNsdWRlIDxs
aW51eC9zdHJpbmcuaD4KPj4gKwo+PiArLyogQWxsb3cgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlk
ZSBzdHJsY2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJpbmdzIHNvIGVhcmx5ICovCj4+ICsjaWZu
ZGVmIGNtZGxpbmVfc3RybGNhdAo+PiArI2RlZmluZSBjbWRsaW5lX3N0cmxjYXQgc3RybGNhdAo+
PiArI2VuZGlmCj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgYXBwZW5kIG9y
IHByZXBlbmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAo+PiArICogbGlu
ZSBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNhbiBiZSB1c2Vk
IHRvIGFsdGVyCj4+ICsgKiB0aGUgYmVoYXZpb3Igb2YgdGhpcyBidWlsdGluIGNvbW1hbmQgbGlu
ZS4KPj4gKyAqIEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBwZW5kZWQvcHJl
cGVuZGVkIHN0cmluZy4KPj4gKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBp
ZiB0aGVyZSBpc24ndCBvbmUuCj4+ICsgKiBAbGVuOiB0aGUgbGVuZ3RoIG9mIGRlc3QgYnVmZmVy
Lgo+PiArICovCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jbWRsaW5lX2J1aWxk
KGNoYXIgKmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3QgbGVuKQo+PiArewo+PiArICAgICAg
IGlmICghbGVuIHx8IHNyYyA9PSBkc3QpCj4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4+ICsK
Pj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9GT1JDRSkgfHwgIXNyYykg
ewo+PiArICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPj4gKyAgICAgICAgICAgICAgIGNtZGxp
bmVfc3RybGNhdChkc3QsIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIGlmIChkc3QgIT0gc3JjKQo+PiAr
ICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPj4gKwo+PiArICAgICAgIGlmIChJU19FTkFCTEVE
KENPTkZJR19DTURMSU5FX1BSRVBFTkQpKQo+PiArICAgICAgICAgICAgICAgY21kbGluZV9zdHJs
Y2F0KGRzdCwgQ09ORklHX0NNRExJTkUgIiAiLCBsZW4pOwo+PiArCj4+ICsgICAgICAgY21kbGlu
ZV9zdHJsY2F0KGRzdCwgc3JjLCBsZW4pOwo+PiArCj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQo
Q09ORklHX0NNRExJTkVfRVhURU5EKSkKPiAKPiBTaG91bGQgYmUgQVBQRU5ELgoKTm90IHlldC4g
Rm9yIHRoZSB0aW1lIGJlaW5nIGFsbCBhcmNoaXRlY3R1cmVzIHVzZSBFWFRFTkQgb25seS4KCklu
IHBhdGNoIDMgaXQgaXMgY2hhbmdlZCB0bzoKCi0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0NNRExJ
TkVfRVhURU5EKSkKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpIHx8IElT
X0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQVBQRU5EKSkKClRoZW4gaW4gbGFzdCBwYXRjaCwgSSBm
b3Jnb3QgYnV0IEkgc2hvdWxkIGhhdmUgZG9uZToKCi0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0NN
RExJTkVfRVhURU5EKSB8fCBJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0FQUEVORCkpCisJaWYg
KElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQVBQRU5EKSkKCgo+IAo+PiArICAgICAgICAgICAg
ICAgY21kbGluZV9zdHJsY2F0KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiArfQo+
PiArCj4+ICsjZGVmaW5lIGNtZGxpbmVfYnVpbGQoZHN0LCBzcmMsIGxlbikgZG8geyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiBQZXJoYXBzIGEgY29tbWVudCB3aHkgd2UgbmVl
ZCB0aGlzIHRvIGJlIGEgZGVmaW5lLgoKUHJvYmFibHkgd2UgZG9uJ3QgbmVlZCBhbnltb3JlIGFz
IEkgZmluYWxseSBkZWNpZGVkIHRvIHVzZSBDT01NQU5EX0xJTkVfU0laRSBpbnN0ZWFkIG9mICds
ZW4nIGFzIHRoZSAKc2l6ZSBvZiB0aGUgdGVtcG9yYXJ5IGJ1ZmZlci4KCj4gCj4+ICsgICAgICAg
Y2hhciAqX19jX2RzdCA9IChkc3QpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4gKyAgICAgICBjb25zdCBjaGFyICpfX2Nfc3JjID0gKHNyYyk7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAg
ICAgaWYgKF9fY19zcmMgPT0gX19jX2RzdCkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAgIHN0YXRpYyBjaGFyIF9fY190bXBbQ09NTUFO
RF9MSU5FX1NJWkVdIF9faW5pdGRhdGEgPSAiIjsgXAo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsg
ICAgICAgICAgICAgICBjbWRsaW5lX3N0cmxjYXQoX19jX3RtcCwgX19jX3NyYywgQ09NTUFORF9M
SU5FX1NJWkUpOyAgIFwKPj4gKyAgICAgICAgICAgICAgIF9fY21kbGluZV9idWlsZChfX2NfZHN0
LCBfX2NfdG1wLCAobGVuKSk7ICAgICAgICAgICAgICAgXAo+PiArICAgICAgIH0gZWxzZSB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
ICsgICAgICAgICAgICAgICBfX2NtZGxpbmVfYnVpbGQoX19jX2RzdCwgX19jX3NyYywgKGxlbikp
OyAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArfSB3aGlsZSAoMCkKPj4g
Kwo+PiArI2VuZGlmIC8qIF9MSU5VWF9DTURMSU5FX0ggKi8KPj4gLS0KPj4gMi4yNS4wCj4+CgpD
aHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
