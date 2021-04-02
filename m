Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A22C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:28:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D4861104
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D4861104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6G+O5XKX5vuJGwDZE4AVwx3X8Hm/B/SHlOr+pjXEOXo=; b=qwgAPlNC0vehOYNZ+BtvveROk
	16MpMtoFnU/R12grkC95ZaTHD11bxTcP3VODru0pjBlBJm3LrQ5Q5Ubsp32jem+aPH68/V7lFuren
	j2G4QAhrqidh446khFN7XvE4rI9MoaewsxnlrrQ56ciNi3qm3fU30+JbsknflfAfDuvLSS1ausKuB
	6F4LYL/9bqVoRk6G2BZCltC9AwbPnCsctSFJR6mZP0/7HU40Hz3mhGOn4OL4tjEPgp8kbLvv7O7aL
	Kp4Q210vIJloGtI8udpgGrq7uaHHudx0hcuNF1/yoww2VN3F1bhQK4YmxeZUjbOkTEU4PHn7chkRv
	1WhW1YK7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLia-00DJ2F-Li; Fri, 02 Apr 2021 15:28:16 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLe5-00DGKu-1Y; Fri, 02 Apr 2021 15:23:44 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkN2601bz9v2lr;
 Fri,  2 Apr 2021 17:23:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id omz2sWo61eF3; Fri,  2 Apr 2021 17:23:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkN25477z9v2lh;
 Fri,  2 Apr 2021 17:23:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A7DF98BB7C;
 Fri,  2 Apr 2021 17:23:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uhizq2EL8v5n; Fri,  2 Apr 2021 17:23:32 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D75E8BB6F;
 Fri,  2 Apr 2021 17:23:31 +0200 (CEST)
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
Message-ID: <53aa0b8c-4ee3-a6af-6fb8-2edc5cd79ea5@csgroup.eu>
Date: Fri, 2 Apr 2021 17:23:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_162338_182880_3D6B9F12 
X-CRM114-Status: GOOD (  25.23  )
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
aXMgZ2V0cyBzZXR0bGVkLgoKV2hlbiByZXdvcmtpbmcgRUZJLCBJIGZvdW5kIG91dCB0aGF0IHRo
ZXkgYXJlIGEgc2ltaWxhciBoYW5kbGluZywgd2hpY2ggaW4gYWRkaXRpb24gdGFrZXMgY2FyZSBv
ZiAKc3BhY2UgaW5zaWRlIHF1b3Rlcy4KCkkgYWRkZWQgc29tZXRoaW5nIHNpbWlsYXIgbm93IGlu
IGNtZGxpbmVfYnVpbGQoKSBmdW5jdGlvbi4KCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+PiB2MzoK
Pj4gLSBBZGRyZXNzZWQgY29tbWVudHMgZnJvbSBXaWxsCj4+IC0gQWRkZWQgY2FwYWJpbGl0eSB0
byBoYXZlIHNyYyA9PSBkc3QKPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9jbWRsaW5lLmggfCA1
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
bGludXgvY21kbGluZS5oCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NtZGxpbmUu
aCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uZGVhODdlZGQ0MWJlCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
aW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPj4gQEAgLTAsMCArMSw1NyBAQAo+PiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKyNpZm5kZWYgX0xJTlVYX0NNRExJTkVf
SAo+PiArI2RlZmluZSBfTElOVVhfQ01ETElORV9ICj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9z
dHJpbmcuaD4KPj4gKwo+PiArLyogQWxsb3cgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlkZSBzdHJs
Y2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJpbmdzIHNvIGVhcmx5ICovCj4+ICsjaWZuZGVmIGNt
ZGxpbmVfc3RybGNhdAo+PiArI2RlZmluZSBjbWRsaW5lX3N0cmxjYXQgc3RybGNhdAo+PiArI2Vu
ZGlmCj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgYXBwZW5kIG9yIHByZXBl
bmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAo+PiArICogbGluZSBwcm92
aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNhbiBiZSB1c2VkIHRvIGFs
dGVyCj4+ICsgKiB0aGUgYmVoYXZpb3Igb2YgdGhpcyBidWlsdGluIGNvbW1hbmQgbGluZS4KPj4g
KyAqIEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBwZW5kZWQvcHJlcGVuZGVk
IHN0cmluZy4KPj4gKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBpZiB0aGVy
ZSBpc24ndCBvbmUuCj4+ICsgKiBAbGVuOiB0aGUgbGVuZ3RoIG9mIGRlc3QgYnVmZmVyLgo+PiAr
ICovCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jbWRsaW5lX2J1aWxkKGNoYXIg
KmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3QgbGVuKQo+PiArewo+PiArICAgICAgIGlmICgh
bGVuIHx8IHNyYyA9PSBkc3QpCj4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4+ICsKPj4gKyAg
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9GT1JDRSkgfHwgIXNyYykgewo+PiAr
ICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPj4gKyAgICAgICAgICAgICAgIGNtZGxpbmVfc3Ry
bGNhdChkc3QsIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiArICAgICAgICAgICAgICAgcmV0dXJu
Owo+PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIGlmIChkc3QgIT0gc3JjKQo+PiArICAgICAg
ICAgICAgICAgZHN0WzBdID0gMDsKPj4gKwo+PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJ
R19DTURMSU5FX1BSRVBFTkQpKQo+PiArICAgICAgICAgICAgICAgY21kbGluZV9zdHJsY2F0KGRz
dCwgQ09ORklHX0NNRExJTkUgIiAiLCBsZW4pOwo+PiArCj4+ICsgICAgICAgY21kbGluZV9zdHJs
Y2F0KGRzdCwgc3JjLCBsZW4pOwo+PiArCj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklH
X0NNRExJTkVfRVhURU5EKSkKPiAKPiBTaG91bGQgYmUgQVBQRU5ELgo+IAo+PiArICAgICAgICAg
ICAgICAgY21kbGluZV9zdHJsY2F0KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiAr
fQo+PiArCj4+ICsjZGVmaW5lIGNtZGxpbmVfYnVpbGQoZHN0LCBzcmMsIGxlbikgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiBQZXJoYXBzIGEgY29tbWVudCB3aHkgd2Ug
bmVlZCB0aGlzIHRvIGJlIGEgZGVmaW5lLgo+IAo+PiArICAgICAgIGNoYXIgKl9fY19kc3QgPSAo
ZHN0KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAg
ICAgY29uc3QgY2hhciAqX19jX3NyYyA9IChzcmMpOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgIGlmIChfX2Nfc3JjID09
IF9fY19kc3QpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsg
ICAgICAgICAgICAgICBzdGF0aWMgY2hhciBfX2NfdG1wW0NPTU1BTkRfTElORV9TSVpFXSBfX2lu
aXRkYXRhID0gIiI7IFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAgY21k
bGluZV9zdHJsY2F0KF9fY190bXAsIF9fY19zcmMsIENPTU1BTkRfTElORV9TSVpFKTsgICBcCj4+
ICsgICAgICAgICAgICAgICBfX2NtZGxpbmVfYnVpbGQoX19jX2RzdCwgX19jX3RtcCwgKGxlbikp
OyAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICB9IGVsc2UgeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAg
X19jbWRsaW5lX2J1aWxkKF9fY19kc3QsIF9fY19zcmMsIChsZW4pKTsgICAgICAgICAgICAgICBc
Cj4+ICsgICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPj4gK30gd2hpbGUgKDApCj4+ICsKPj4gKyNlbmRpZiAvKiBf
TElOVVhfQ01ETElORV9IICovCj4+IC0tCj4+IDIuMjUuMAo+PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
