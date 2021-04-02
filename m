Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24503C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:27:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E0E661151
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E0E661151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LGJtFohMYWirS58lQRsW8T/SjVBvIVCBYmhrYir6OzQ=; b=mquSJiv94553qrMovEPJCGQXQ
	A/nGXEL9BJItDBvk13W732Toi1tW3f9X2t4choAKOnkdEKXTuZu1NFuN7hNLvRyuQmH8dqS+Uh9eB
	ikQjqkvDmCI0ZiDYLMIib0/6oCYH/pkc/1QQMFPYNdjUZJqUCjVOelhuE4lLxhZKubtAA/GOvpkPv
	C1qsyo3EBgYYK6PXzykANtUtocTW9/61luOmPP+770AaLUi04kb4pK9sYRa8qAmhh8U3fAMElGaCl
	5Bi+MHg562fO3IPvQEMwOndFdcgzhFY4XTIa7rJlERkpE5mg9XvZ/TEUW8ypqSAJ/YTX2uLd0SNys
	HIXbeQ7yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLhk-00DIeJ-1Y; Fri, 02 Apr 2021 15:27:24 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLcO-00DFLl-3D; Fri, 02 Apr 2021 15:21:57 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkL51pq3z9v2lh;
 Fri,  2 Apr 2021 17:21:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OssVJYy-p_xH; Fri,  2 Apr 2021 17:21:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkL50gT0z9v2lf;
 Fri,  2 Apr 2021 17:21:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 155BE8BB7D;
 Fri,  2 Apr 2021 17:21:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6n2Gg89KkRnV; Fri,  2 Apr 2021 17:21:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C4F58BB7C;
 Fri,  2 Apr 2021 17:21:50 +0200 (CEST)
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
To: Rob Herring <robh@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Will Deacon <will@kernel.org>,
 Daniel Walker <danielwa@cisco.com>,
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
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
 <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d71c83a8-cc10-b435-5a28-70ca4df6fdf9@csgroup.eu>
Date: Fri, 2 Apr 2021 17:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_162152_644545_4750A9E5 
X-CRM114-Status: GOOD (  11.74  )
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

CgpMZSAyNi8wMy8yMDIxIMOgIDE2OjI2LCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgTWFyIDI2LCAyMDIxIGF0IDg6MjAgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBMZSAyNi8wMy8yMDIxIMOgIDE1
OjA4LCBBbmRyZWFzIFNjaHdhYiBhIMOpY3JpdCA6Cj4+PiBPbiBNw6RyIDI2IDIwMjEsIENocmlz
dG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4+IGluZGV4IGY4ZjE1MzMy
Y2FhMi4uZTdjOTFlZTQ3OGQxIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+Pj4gQEAgLTIwLDYg
KzIwLDcgQEAKPj4+PiAgICAjaW5jbHVkZSA8bGludXgvc3dpb3RsYi5oPgo+Pj4+ICAgICNpbmNs
dWRlIDxsaW51eC9zbXAuaD4KPj4+PiAgICAjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4+Pj4gKyNp
bmNsdWRlIDxsaW51eC9jbWRsaW5lLmg+Cj4+Pj4KPj4+PiAgICAjaW5jbHVkZSA8YXNtL2NwdV9v
cHMuaD4KPj4+PiAgICAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KPj4+PiBAQCAtMjI4
LDEwICsyMjksOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4+Pj4gICAg
ICAgfQo+Pj4+Cj4+Pj4gICAgICAgcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxc
biIpOwo+Pj4+IC0jaWZkZWYgQ09ORklHX0NNRExJTkVfRk9SQ0UKPj4+PiAtICAgIHN0cmxjcHko
Ym9vdF9jb21tYW5kX2xpbmUsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVfU0laRSk7Cj4+
Pj4gKyAgICBjbWRsaW5lX2J1aWxkKGJvb3RfY29tbWFuZF9saW5lLCBOVUxMLCBDT01NQU5EX0xJ
TkVfU0laRSk7Cj4+Pj4gICAgICAgcHJfaW5mbygiRm9yY2luZyBrZXJuZWwgY29tbWFuZCBsaW5l
IHRvOiAlc1xuIiwgYm9vdF9jb21tYW5kX2xpbmUpOwo+Pj4KPj4+IFNob3VsZG4ndCB0aGF0IG1l
c3NhZ2UgYmVjb21lIGNvbmRpdGlvbmFsIGluIHNvbWUgd2F5Pwo+Pj4KPj4KPj4gWW91IGFyZSBy
aWdodCwgSSBkaWQgc29tZXRoaW5nIHNpbWlsYXIgb24gQVJNIGJ1dCBsb29rcyBsaWtlIEkgbWlz
c2VkIGl0IG9uIFJJU0NWLgo+IAo+IEhvdyBpcyB0aGlzIGh1bmsgZXZlbiB1c2VmdWw/IFVuZGVy
IHdoYXQgY29uZGl0aW9ucyBjYW4geW91IGJvb3QKPiB3aXRob3V0IGEgRFRCPyBFdmVuIHdpdGgg
YSBidWlsdC1pbiBEVEIsIHRoZSBEVCBjbWRsaW5lIGhhbmRsaW5nIHdvdWxkCj4gYmUgY2FsbGVk
Lgo+IAoKRG9uJ3Qga25vdywgSSB3YW50ZWQgdG8ga2VlcCBhcyBpcyB0b2RheS4KCkRvIHlvdSB0
aGluayB0aGUgaHVuayBzaG91bGQgYmUgY29tcGxldGVseSByZW1vdmVkID8KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
