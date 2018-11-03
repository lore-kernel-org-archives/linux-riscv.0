Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD06CC6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 09:25:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A175C2082D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 09:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmSvUr8l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A175C2082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kot-begemot.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D/+KK7/rd/jzSRShQNiLPwZfU69plBxjxiEgB45AoAg=; b=pmSvUr8lsqt8wC3JZLUUfCFfU
	JN50n3/5/pOxH3Vbh59QQdD0Ouygn1ZaxDJ8YBRibBjOraRNkSUbkpHfcfZuHgrtHaeTJVIklB/my
	ox8XEafS/mZ+VWhPGsCvOhNZPXWGfnPFOnKl7YdEER8YmmUNYPhqYO5Z4cerBTh9eF/1UVaRvtC/L
	Xbyra7zd5KTaYaQ487Q82AvH2P4+YEGSn9CbGVS4W0U/GbUgLQnfNv/cwnzRUGoE+EbuON2AJPeoq
	TmQrMjrh4mP10HJm/klR6nLg2Tk+Xki1IINYNOJgPt99b29W9keiFWSU7SeBS93xsGlZm4gvqWe1H
	yaYUZTWEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIsB0-0005qQ-Gt; Sat, 03 Nov 2018 09:25:06 +0000
Received: from ivanoab6.miniserver.com ([5.153.251.140]
 helo=www.kot-begemot.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIsAt-0005JT-09; Sat, 03 Nov 2018 09:25:04 +0000
Received: from [192.168.17.6] (helo=smaug.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <anton.ivanov@kot-begemot.co.uk>)
 id 1gIsA2-0004dx-Ls; Sat, 03 Nov 2018 09:24:06 +0000
Received: from wyvern.kot-begemot.co.uk ([192.168.3.72])
 by smaug.kot-begemot.co.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <anton.ivanov@kot-begemot.co.uk>)
 id 1gIsA2-00028s-8O; Sat, 03 Nov 2018 09:24:06 +0000
Subject: Re: [PATCH -next 0/3] Add support for fast mremap
To: Richard Weinberger <richard@nod.at>,
 Joel Fernandes <joel@joelfernandes.org>
References: <20181103040041.7085-1-joelaf@google.com>
 <6886607.O3ZT5bM3Cy@blindfold>
From: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Message-ID: <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
Date: Sat, 3 Nov 2018 09:24:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6886607.O3ZT5bM3Cy@blindfold>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181103_022502_500008_812ACD09 
X-CRM114-Status: GOOD (  18.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joel Fernandes <joelaf@google.com>, linux-mips@linux-mips.org,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-ia64@vge,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 r.kernel.org@lithops.sigma-star.at, hughd@google.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 pantin@google.com, linux-kernel@vger.kernel.org, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181103092405.oqjycupSG3tO3GwGLGO82a66-bWa5ZdkoTwrFOjQUiw@z>

T24gMDMvMTEvMjAxOCAwOToxNSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IEpvZWwsCj4K
PiBBbSBTYW1zdGFnLCAzLiBOb3ZlbWJlciAyMDE4LCAwNTowMDozOCBDRVQgc2NocmllYiBKb2Vs
IEZlcm5hbmRlczoKPj4gSGksCj4+IEhlcmUgaXMgdGhlIGxhdGVzdCAiZmFzdCBtcmVtYXAiIHNl
cmllcy4gVGhpcyBqdXN0IGEgcmVwb3N0IHdpdGggS2lyaWxsJ3MKPj4gQWNrZWQtYnlzIGFkZGVk
LiBJIHdvdWxkIGxpa2UgdGhpcyB0byBiZSBjb25zaWRlcmVkIGZvciBsaW51eCAtbmV4dC4gIEkg
YWxzbwo+PiBkcm9wcGVkIHRoZSBDT05GSUcgZW5hYmxlbWVudCBwYXRjaCBmb3IgYXJtNjQgc2lu
Y2UgSSBhbSB5ZXQgdG8gdGVzdCBpdCB3aXRoCj4+IHRoZSBuZXcgVExCIGZsdXNoaW5nIGNvZGUg
dGhhdCBpcyBpbiB2ZXJ5IHJlY2VudCBrZXJuZWwgcmVsZWFzZXMuIChOb25lIG9mIG15Cj4+IGFy
bTY0IGRldmljZXMgcnVuIG1haW5saW5lIHJpZ2h0IG5vdy4pIHNvIEkgd2lsbCBwb3N0IHRoZSBh
cm02NCBlbmFibGVtZW50IG9uY2UKPj4gSSBnZXQgdG8gdGhhdC4gVGhlIHBlcmZvcm1hbmNlIG51
bWJlcnMgaW4gdGhlIHNlcmllcyBhcmUgZm9yIHg4Ni4KPj4KPj4gTGlzdCBvZiBwYXRjaGVzIGlu
IHNlcmllczoKPj4KPj4gKDEpIG1tOiBzZWxlY3QgSEFWRV9NT1ZFX1BNRCBpbiB4ODYgZm9yIGZh
c3RlciBtcmVtYXAKPj4KPj4gKDIpIG1tOiBzcGVlZCB1cCBtcmVtYXAgYnkgMjB4IG9uIGxhcmdl
IHJlZ2lvbnMgKHY0KQo+PiB2MS0+djI6IEFkZGVkIHN1cHBvcnQgZm9yIHBlci1hcmNoIGVuYWJs
ZW1lbnQgKEtpcmlsbCBTaHV0ZW1vdikKPj4gdjItPnYzOiBVcGRhdGVkIGNvbW1pdCBtZXNzYWdl
IHRvIHN0YXRlIHRoZSBvcHRpbWl6YXRpb24gbWF5IGFsc28KPj4gCXJ1biBmb3Igbm9uLXRocCB0
eXBlIG9mIHN5c3RlbXMgKERhbmllbCBDb2wpLgo+PiB2My0+djQ6IFJlbW92ZSB1c2VsZXNzIHBt
ZF9sb2NrIGNoZWNrIChLaXJpbGwgU2h1dGVtb3YpCj4+IAlSZWJhc2VkIG9udG9wIG9mIExpbnVz
J3MgbWFzdGVyLCB1cGRhdGVkIHBlcmYgcmVzdWx0cyBiYXNlZAo+PiAgICAgICAgICBvbiB4ODYg
dGVzdGluZy4gQWRkZWQgS2lyaWxsJ3MgQWNrcy4KPj4KPj4gKDMpIG1tOiB0cmVld2lkZTogcmVt
b3ZlIHVudXNlZCBhZGRyZXNzIGFyZ3VtZW50IGZyb20gcHRlX2FsbG9jIGZ1bmN0aW9ucyAodjIp
Cj4+IHYxLT52MjogZml4IGFyY2gvdW0vIHByb3RvdHlwZSB3aGljaCB3YXMgbWlzc2VkIGluIHYx
IChBbnRvbiBJdmFub3YpCj4+ICAgICAgICAgIHVwZGF0ZSBjaGFuZ2Vsb2cgd2l0aCBtYW51YWwg
Zml4dXBzIGZvciBtNjhrIGFuZCBtaWNyb2JsYXplLgo+Pgo+PiBub3QgaW5jbHVkZWQgLSAoNCkg
bW06IHNlbGVjdCBIQVZFX01PVkVfUE1EIGluIGFybTY0IGZvciBmYXN0ZXIgbXJlbWFwCj4+ICAg
ICAgVGhpcyBwYXRjaCBpcyBkcm9wcGVkIHNpbmNlIGxhc3QgcG9zdGluZyBwZW5kaW5nIGZ1cnRo
ZXIgcGVyZm9ybWFuY2UKPj4gICAgICB0ZXN0aW5nIG9uIGFybTY0IHdpdGggbmV3IFRMQiBnYXRo
ZXIgdXBkYXRlcy4gU2VlIG5vdGVzIGluIHBhdGNoCj4+ICAgICAgdGl0bGVkICJtbTogc3BlZWQg
dXAgbXJlbWFwIGJ5IDUwMHggb24gbGFyZ2UgcmVnaW9ucyIgZm9yIG1vcmUKPj4gICAgICBkZXRh
aWxzLgo+Pgo+IFRoaXMgYnJlYWtzIFVNTCBidWlsZDoKPiAgICBDQyAgICAgIG1tL21yZW1hcC5v
Cj4gbW0vbXJlbWFwLmM6IEluIGZ1bmN0aW9uIOKAmG1vdmVfbm9ybWFsX3BtZOKAmToKPiBtbS9t
cmVtYXAuYzoyMjk6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKA
mHNldF9wbWRfYXTigJk7IGRpZCB5b3UgbWVhbiDigJhzZXRfcHRlX2F04oCZPyBbLVdlcnJvcj1p
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgICBzZXRfcG1kX2F0KG1tLCBuZXdfYWRk
ciwgbmV3X3BtZCwgcG1kKTsKPiAgICBefn5+fn5+fn5+Cj4gICAgc2V0X3B0ZV9hdAo+ICAgIEND
ICAgICAgY3J5cHRvL3JuZy5vCj4gICAgQ0MgICAgICBmcy9kaXJlY3QtaW8ubwo+IGNjMTogc29t
ZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+Cj4gVG8gdGVzdCB5b3Vyc2VsZiwg
anVzdCBydW4gb24gYSB4ODYgYm94Ogo+ICQgbWFrZSBkZWZjb25maWcgQVJDSD11bQo+ICQgbWFr
ZSBsaW51eCBBUkNIPXVtCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4KPgo+CgpVTSBzb21laG93
IG1hbmFnZWQgdG8gbWlzcyBvbmUgb2YgdGhlIDMtbGV2ZWwgZnVuY3Rpb25zLCBJIHNlbnQgYSBw
YXRjaCAKYXQgc29tZSBwb2ludCB0byBhZGQgdG8gdGhlIG1tcmVtYXAgc2VyaWVzLCBidXQgaXQg
bG9va3MgbGlrZSBpdCBkaWQgbm90IApnZXQgaW5jbHVkZWQgaW4gdGhlIGZpbmFsIHZlcnNpb24u
CgpZb3UgbmVlZCB0aGVzZSB0d28gaW5jcmVtZW50YWwgb24gdG9wIG9mIEpvZWwncyBwYXRjaC4g
UmljaGFyZCAtIGZlZWwgCmZyZWUgdG8gcmVsb2NhdGUgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgc2V0X3BnZF9hdCBlbHNld2hlcmUgLSAKSSBwdXQgaXQgYXQgdGhlIGVuZCBvZiB0
bGIuYwoKZGlmZiAtLWdpdCBhL2FyY2gvdW0vaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC91
bS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKaW5kZXggNzQ4NTM5OGQwNzM3Li4xNjkyZGE1NWU2M2Eg
MTAwNjQ0Ci0tLSBhL2FyY2gvdW0vaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvdW0v
aW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC0zNTksNCArMzU5LDcgQEAgZG8ge8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAogwqDCoMKgwqDCoMKgwqAgX19mbHVzaF90bGJf
b25lKCh2YWRkcikpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAogwqB9IHdoaWxlICgw
KQoKK2V4dGVybiB2b2lkIHNldF9wbWRfYXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVk
IGxvbmcgYWRkciwKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1kX3QgKnBtZHAsIHBt
ZF90IHBtZCk7CisKIMKgI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3VtL2tlcm5lbC90bGIuYyBi
L2FyY2gvdW0va2VybmVsL3RsYi5jCmluZGV4IDc2M2QzNWJkZGEwMS4uZDE3Yjc0MTg0YmEwIDEw
MDY0NAotLS0gYS9hcmNoL3VtL2tlcm5lbC90bGIuYworKysgYi9hcmNoL3VtL2tlcm5lbC90bGIu
YwpAQCAtNjQ3LDMgKzY0Nyw5IEBAIHZvaWQgZm9yY2VfZmx1c2hfYWxsKHZvaWQpCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm1hID0gdm1hLT52bV9uZXh0OwogwqDCoMKgwqDCoMKg
wqAgfQogwqB9Cit2b2lkIHNldF9wbWRfYXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVk
IGxvbmcgYWRkciwKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1kX3QgKnBtZHAsIHBt
ZF90IHBtZCkKK3sKK8KgwqDCoMKgwqDCoCAqcG1kcCA9IHBtZDsKK30KKwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
