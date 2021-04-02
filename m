Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B903DC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:33:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D57A6113E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D57A6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PQIde+5C4OZf2wl5CeYV5tLR+wraKZmFlWTCWIGnJqE=; b=QGoaawTwW4Bbqjdyeq7+LmjnG
	PlACTwQZ5lKoOJr32CJikrAi6R+n8UEBr07UMnrc0ClPAYxj6PX3bvxTP6QhJvWqQzWmKUnFAykH0
	wopIYEh7sidTDhoC3iUpYVnGGqnGnkmObhtStIqDhiICNuRnrY4KnKuB2LYucYsnlv9wU83qk52Xk
	2l+6zxeGqAP0j0ZiZPKDN+OQmeJoA9fmOVwoJcnw+XBjk+OUtl4NSTZFXgAQx0ThgPSqPU1L/wfrY
	lYey7ou0OEeqWvU2mOcammKdV5TlUN687thB6JzOfU/U6tU+sxDGNiQ0OUIUrJSDn7jxxScOinB+b
	x8s4/zA5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLnb-00DLih-3V; Fri, 02 Apr 2021 15:33:27 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLnK-00DLfA-15; Fri, 02 Apr 2021 15:33:13 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkb71LDWz9v2m9;
 Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3l8bzcUaAS9w; Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkb70P7lz9v2m7;
 Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB14E8BB77;
 Fri,  2 Apr 2021 17:33:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9sXjhQ8q7Sww; Fri,  2 Apr 2021 17:33:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4BFB8BB6F;
 Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
To: Daniel Walker <danielwa@cisco.com>
Cc: will@kernel.org, robh@kernel.org, daniel@gimpelevich.san-francisco.ca.us, 
 linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, microblaze <monstr@monstr.eu>,
 linux-mips@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <20210330172714.GR109100@zorba>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9c74d82f-f58f-1ccb-bf22-8eb02a4cd55d@csgroup.eu>
Date: Fri, 2 Apr 2021 17:33:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330172714.GR109100@zorba>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_163310_219967_5651328D 
X-CRM114-Status: GOOD (  22.78  )
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

CgpMZSAzMC8wMy8yMDIxIMOgIDE5OjI3LCBEYW5pZWwgV2Fsa2VyIGEgw6ljcml0wqA6Cj4gT24g
RnJpLCBNYXIgMjYsIDIwMjEgYXQgMDE6NDQ6NDhQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToKPj4gVGhpcyBjb2RlIHByb3ZpZGVzIGFyY2hpdGVjdHVyZXMgd2l0aCBhIHdheSB0byBi
dWlsZCBjb21tYW5kIGxpbmUKPj4gYmFzZWQgb24gd2hhdCBpcyBidWlsdCBpbiB0aGUga2VybmVs
IGFuZCB3aGF0IGlzIGhhbmRlZCBvdmVyIGJ5IHRoZQo+PiBib290bG9hZGVyLCBiYXNlZCBvbiBz
ZWxlY3RlZCBjb21waWxlLXRpbWUgb3B0aW9ucy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+PiAtLS0KPj4gdjM6Cj4+
IC0gQWRkcmVzc2VkIGNvbW1lbnRzIGZyb20gV2lsbAo+PiAtIEFkZGVkIGNhcGFiaWxpdHkgdG8g
aGF2ZSBzcmMgPT0gZHN0Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvY21kbGluZS5oIHwgNTcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xp
bnV4L2NtZGxpbmUuaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgg
Yi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmRlYTg3ZWRkNDFiZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvY21kbGluZS5oCj4+IEBAIC0wLDAgKzEsNTcgQEAKPj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+ICsjaWZuZGVmIF9MSU5VWF9DTURMSU5FX0gK
Pj4gKyNkZWZpbmUgX0xJTlVYX0NNRExJTkVfSAo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvc3Ry
aW5nLmg+Cj4+ICsKPj4gKy8qIEFsbG93IGFyY2hpdGVjdHVyZXMgdG8gb3ZlcnJpZGUgc3RybGNh
dCwgcG93ZXJwYyBjYW4ndCB1c2Ugc3RyaW5ncyBzbyBlYXJseSAqLwo+PiArI2lmbmRlZiBjbWRs
aW5lX3N0cmxjYXQKPj4gKyNkZWZpbmUgY21kbGluZV9zdHJsY2F0IHN0cmxjYXQKPj4gKyNlbmRp
Zgo+PiArCj4+ICsvKgo+PiArICogVGhpcyBmdW5jdGlvbiB3aWxsIGFwcGVuZCBvciBwcmVwZW5k
IGEgYnVpbHRpbiBjb21tYW5kIGxpbmUgdG8gdGhlIGNvbW1hbmQKPj4gKyAqIGxpbmUgcHJvdmlk
ZWQgYnkgdGhlIGJvb3Rsb2FkZXIuIEtjb25maWcgb3B0aW9ucyBjYW4gYmUgdXNlZCB0byBhbHRl
cgo+PiArICogdGhlIGJlaGF2aW9yIG9mIHRoaXMgYnVpbHRpbiBjb21tYW5kIGxpbmUuCj4+ICsg
KiBAZHN0OiBUaGUgZGVzdGluYXRpb24gb2YgdGhlIGZpbmFsIGFwcGVuZGVkL3ByZXBlbmRlZCBz
dHJpbmcuCj4+ICsgKiBAc3JjOiBUaGUgc3RhcnRpbmcgc3RyaW5nIG9yIE5VTEwgaWYgdGhlcmUg
aXNuJ3Qgb25lLgo+PiArICogQGxlbjogdGhlIGxlbmd0aCBvZiBkZXN0IGJ1ZmZlci4KPj4gKyAq
Lwo+IAo+IEFwcGVuZCBvciBwcmVwZW5kID8gQ2lzY28gcmVxdWlyZXMgYm90aCBhdCB0aGUgc2Ft
ZSB0aW1lLiBUaGlzIGlzIHdoeSBteQo+IGltcGxlbWVudGF0aW9uIHByb3ZpZGVzIGJvdGguIEkg
Y2FuJ3QgdXNlIHRoaXMgd2l0aCBib3RoIGF0IG9uY2UuCj4gCgpJIHRoaW5rIGl0IGNhbiBiZSBh
ZGRlZCBhcyBhIHNlY29uZCBzdGVwIGlmIGRpbW1lZCBuZWNlc3NhcnkuIFRoZSBmZWVsaW5nIEkg
aGF2ZSBmcm9tIGFsbCB0aGUgCmRpc2N1c3Npb24gaXMgdGhhdCBpdCdzIG5vdCB3aGF0IHBlb3Bs
ZSBmcm9tIHRoZSBjb21tdW5pdHkgYXJlIGxvb2tpbmcgZm9yIGF0IHRoZSBtb21lbnQuCgpBbnl3
YXksIG9uY2UgYWxsIGFyY2hpdGVjdHVyZXMgYXJlIG1vdmVkIHRvIGdlbmVyaWMgaGFuZGxpbmcs
IEkgYmVsaWV2ZSBpdCBpcyB0aGVuIGVhc2llciB0byBzcGxpdCAKQ09ORklHX0NNRExJTkUgaW4g
dHdvIGNvbmZpZ3VyYXRpb24gaXRlbXMgaW4gb3JkZXIgdG8gcHJvdmlkZSBib3RoIGFwcGVuZGlu
ZyBhbmQgcHJlcGVuZGluZyBhdCB0aGUgCnNhbWUgdGltZS4KCkkgc2VlIHNvbWUgY29uY2VybnMg
YWJvdXQgcmlzayBvZiBkb3VibGUgY2hhbmdlcywgYnV0IEkgaGF2ZSBmb2N1c3NlZCBpbiBjaGFu
Z2luZyBhcyBsaXR0bGUgYXMgCnBvc3NpYmxlIHRoZSBleGlzdGluZyBjb25maWd1cmF0aW9uIGl0
ZW1zLCBpbiBvcmRlciB0byBtaW5pbWlzZSB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
