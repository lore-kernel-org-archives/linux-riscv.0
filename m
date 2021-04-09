Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF87C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:21:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D1261165
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19D1261165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sNSWaJYOti8hMLNJEdlXG2kDIlW5yH05vhAsl95QLa8=; b=CrcN/7/HBh0wY6+h0/5KoFZ/c
	wrsClqYu0qvyvPm/+D9LIU+dIR+ovOxrND3LxnKLT1jv22tqNUEcotbdJoRhhUt5sQVMJae35IFKT
	WIeUZn0TtJRrMQRZdbKnPGV8deXTambuqxva52cWXLnEQFBZYJT9nvuH/hX7v3f2trapWGqqlHLq4
	phxjiqMZGQzD3sQ3ldz32+n+Ua7iRV80kyjoWmSoZQIF8c1Bj9u5TJEO3Dfh5FF0nGZcnf0u7MzIk
	GBX0DlwkWlpu1AVFK+UHnuQzgnru0NX1HZkvhHQtx8d1f5cqGGCnS4sANBeaV/JChdetnQqsBUAzB
	uE1r4yogA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUoGO-000OTA-16; Fri, 09 Apr 2021 10:21:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoGB-000OPs-Nx; Fri, 09 Apr 2021 10:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=10PV9M163+85crXmKLCHMwhA0w7gzua/Yg/4Rt4C05A=; b=E5zIJoa6GUGcPCZdvhIL76sY9K
 ptzdXEyXyDRieefSbLX5LBC0lMvZTh+K+PdQLQfSLRItHWdH/ppgss2r/OVlXdK2F1RokRTELZgbL
 gwnjfiefRMZjw55u1xtUexb0OVGuzodJ+GwsY+GYw6tLBr8N5ijaV5L2VgvhpIdWyUt9LaP5Q4EJS
 GALfFvUMvciKQrX7ArHS3kvTI8nKpyZ+sAj2QJ1NFBl7lT/heVNcs+Pdi1s+C2+zs2ntl215cFnNe
 4k8G1O7rE36Edi9pj5EyytW1/S3f+a5gCL/N5WJSCLfeQYyidiW2qWOLX9ZZVqyfTOFXMSpiFi72P
 pli3zfMQ==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoG8-004FMQ-AQ; Fri, 09 Apr 2021 10:21:06 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGvKd22R6z9vBmN;
 Fri,  9 Apr 2021 12:20:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id U6kaT8vyPDk2; Fri,  9 Apr 2021 12:20:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGvKd0qpkz9vBmM;
 Fri,  9 Apr 2021 12:20:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 449288B7E3;
 Fri,  9 Apr 2021 12:20:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 20mYPqZcSrF8; Fri,  9 Apr 2021 12:20:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0866D8B7E1;
 Fri,  9 Apr 2021 12:20:52 +0200 (CEST)
Subject: Re: [PATCH v4 18/20] x86: Convert to GENERIC_CMDLINE
To: Rob Herring <robh@kernel.org>
Cc: will@kernel.org, danielwa@cisco.com,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
 <20210408194148.GB1724284@robh.at.kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <834c4850-5541-b5c2-0b7b-d7d960ab2629@csgroup.eu>
Date: Fri, 9 Apr 2021 12:20:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408194148.GB1724284@robh.at.kernel.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_032104_681366_3315ED0C 
X-CRM114-Status: GOOD (  15.07  )
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

CgpMZSAwOC8wNC8yMDIxIMOgIDIxOjQxLCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgQXByIDAyLCAyMDIxIGF0IDAzOjE4OjIwUE0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6Cj4+IFRoaXMgY29udmVydHMgdGhlIGFyY2hpdGVjdHVyZSB0byBHRU5FUklDX0NNRExJTkUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4KPj4gLS0tCj4+ICAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgfCA0NSArKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIGFyY2gveDg2L2tlcm5l
bC9zZXR1cC5jIHwgMTcgKystLS0tLS0tLS0tLS0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4+IGluZGV4IGEyMDY4NGQ1NmI0Yi4uNjZiMzg0
MjI4Y2EzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4+ICsrKyBiL2FyY2gveDg2
L0tjb25maWcKPj4gQEAgLTEwNCw2ICsxMDQsNyBAQCBjb25maWcgWDg2Cj4+ICAgCXNlbGVjdCBB
UkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCj4+ICAgCXNlbGVjdCBBUkNIX1VTRV9TWU1fQU5OT1RB
VElPTlMKPj4gICAJc2VsZWN0IEFSQ0hfV0FOVF9CQVRDSEVEX1VOTUFQX1RMQl9GTFVTSAo+PiAr
CXNlbGVjdCBBUkNIX1dBTlRfQ01ETElORV9QUkVQRU5EX0JZX0RFRkFVTFQKPiAKPiBTZWVtcyB0
byBiZSBub24tZXhpc3RlbnQga2NvbmZpZyBvcHRpb24uCgpPb3BzLiBBZGRlZCBpbiB2NS4KCj4+
IEBAIC04ODMsMTggKzg4MSw3IEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxp
bmVfcCkKPj4gICAJYnNzX3Jlc291cmNlLnN0YXJ0ID0gX19wYV9zeW1ib2woX19ic3Nfc3RhcnQp
Owo+PiAgIAlic3NfcmVzb3VyY2UuZW5kID0gX19wYV9zeW1ib2woX19ic3Nfc3RvcCktMTsKPj4g
ICAKPj4gLSNpZmRlZiBDT05GSUdfQ01ETElORV9CT09MCj4+IC0jaWZkZWYgQ09ORklHX0NNRExJ
TkVfRk9SQ0UKPj4gLQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBidWlsdGluX2NtZGxpbmUs
IENPTU1BTkRfTElORV9TSVpFKTsKPj4gLSNlbHNlCj4+IC0JaWYgKGJ1aWx0aW5fY21kbGluZVsw
XSkgewo+PiAtCQkvKiBhcHBlbmQgYm9vdCBsb2FkZXIgY21kbGluZSB0byBidWlsdGluICovCj4+
IC0JCXN0cmxjYXQoYnVpbHRpbl9jbWRsaW5lLCAiICIsIENPTU1BTkRfTElORV9TSVpFKTsKPj4g
LQkJc3RybGNhdChidWlsdGluX2NtZGxpbmUsIGJvb3RfY29tbWFuZF9saW5lLCBDT01NQU5EX0xJ
TkVfU0laRSk7Cj4+IC0JCXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsIGJ1aWx0aW5fY21kbGlu
ZSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+PiAtCX0KPj4gLSNlbmRpZgo+PiAtI2VuZGlmCj4+ICsJ
Y21kbGluZV9idWlsZChib290X2NvbW1hbmRfbGluZSwgYm9vdF9jb21tYW5kX2xpbmUpOwo+PiAg
IAo+PiAgIAlzdHJsY3B5KGNvbW1hbmRfbGluZSwgYm9vdF9jb21tYW5kX2xpbmUsIENPTU1BTkRf
TElORV9TSVpFKTsKPj4gICAJKmNtZGxpbmVfcCA9IGNvbW1hbmRfbGluZTsKPiAKPiBPbmNlIHRo
aXMgaXMgYWxsIGRvbmUsIEkgd29uZGVyIGlmIHdlIGNhbiBnZXQgcmlkIG9mIHRoZSBzdHJsY3B5
IGFuZAo+IHBlcmhhcHMgYWxzbyBjbWRsaW5lX3AuCj4gCgpJdCBzZWVtcyByYXRoZXIgY29tcGxp
Y2F0ZWQsIGluIGluaXQvbWFpbi5jIHlvdSBoYXZlIGhlYXZ5IG1hbmlwdWxhdGlvbnMgb2YgY29t
bWFuZCBsaW5lcyB3aGljaCAKc2VlbXMgdG8gYmUgZG9uZSBpbiBzZXR1cF9jb21tYW5kX2xpbmUo
KSB3aGljaCBzZWVtcyB0byBhZGQgc3R1ZmYgaW4gZnJvbnQgb2YgY29tbWFuZCBsaW5lcywgYXQg
dGhlIAplbmQgd2UgZW5kIHVwIHdpdGggc2V2ZXJhbCBjb21tYW5kIGxpbmVzOgoKLyogVW50b3Vj
aGVkIHNhdmVkIGNvbW1hbmQgbGluZSAoZWcuIGZvciAvcHJvYykgKi8KY2hhciAqc2F2ZWRfY29t
bWFuZF9saW5lOwovKiBDb21tYW5kIGxpbmUgZm9yIHBhcmFtZXRlciBwYXJzaW5nICovCnN0YXRp
YyBjaGFyICpzdGF0aWNfY29tbWFuZF9saW5lOwovKiBVbnRvdWNoZWQgZXh0cmEgY29tbWFuZCBs
aW5lICovCnN0YXRpYyBjaGFyICpleHRyYV9jb21tYW5kX2xpbmU7CgpTb21lIG9mIHRoZW0gY29t
ZSBmcm9tIHRoZSBjbWRsaW5lX3Agd2hpY2ggb3RoZXJzIGFyZSBmcm9tIGJvb3RfY29tbWFuZF9s
aW5lLgoKSSB0aGluayBhIGNsZWFudXAgb24gYWxsIHRoYXQgc3R1ZmYgd291bGQgYmUgd29ydGgg
aXQgYXMgYSBmdXJ0aGVyIHN0ZXAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
