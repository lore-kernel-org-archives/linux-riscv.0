Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D268C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:36:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27FE76113E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27FE76113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UNl39sO80bnpqjbKp6vuuRnVJTwYC7Qu3RICBQ7lDFQ=; b=dZ65CLFVV4ib4eIP9MhSG1oN9
	US2IXjX2JCYJ5Ka0oXa9OglQcSfc6ithq1xsfBu/ZNu7Ph14bzvqcxDdkKfiZJO/TWx5Bfs2p8aAh
	lu0GfZby8SQOYDcm2Lf3cwYZw4ogYbrVNHce6vAK03Axh+yyDz9KkYSvI24N39Pt7pl0ZqncC7RHd
	flHb2e0Cy041DJ+91uTmjECeNU9Q5B+IrGrc32Ezf1if3G/iYWdYClNzCjT2Bk/ta2wsl2f5DoV8T
	tvUDGPfu3g6OPElabiWrH5jVm6i7nciDMUnS8871BsPZn4q5AP0rRdDw1FvnhmV3saPDVSrl+ghnx
	8hZNwJktA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLqY-00DMLq-Kx; Fri, 02 Apr 2021 15:36:30 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLqJ-00DMKC-Ez; Fri, 02 Apr 2021 15:36:17 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkfh6syMz9v2m9;
 Fri,  2 Apr 2021 17:36:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SsC2ob6kJi6G; Fri,  2 Apr 2021 17:36:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkfh5PDlz9v2m8;
 Fri,  2 Apr 2021 17:36:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A97528BB77;
 Fri,  2 Apr 2021 17:36:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dzRgT34PMsr4; Fri,  2 Apr 2021 17:36:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA9038BB6F;
 Fri,  2 Apr 2021 17:36:13 +0200 (CEST)
Subject: Re: [PATCH v3 12/17] sh: Convert to GENERIC_CMDLINE
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 microblaze <monstr@monstr.eu>, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <6b76649009943f2893fdfded22becd41db2fe1f7.1616765870.git.christophe.leroy@csgroup.eu>
Message-ID: <d672dec1-6fcb-d5dc-a551-2a99e6dd6976@csgroup.eu>
Date: Fri, 2 Apr 2021 17:36:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6b76649009943f2893fdfded22becd41db2fe1f7.1616765870.git.christophe.leroy@csgroup.eu>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_163615_567186_E7199DC6 
X-CRM114-Status: GOOD (  13.78  )
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

CgpMZSAyNi8wMy8yMDIxIMOgIDE0OjQ0LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4g
VGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAu
ZXU+Cj4gLS0tCgo+IGRpZmYgLS1naXQgYS9hcmNoL3NoL0tjb25maWcgYi9hcmNoL3NoL0tjb25m
aWcKPiBpbmRleCBlNzk4ZTU1OTE1YzIuLmZhYjg0ZjYyNDQ4YyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3NoL0tjb25maWcKPiArKysgYi9hcmNoL3NoL0tjb25maWcKPiBAQCAtMTYsNiArMTYsNyBAQCBj
b25maWcgU1VQRVJICj4gICAJc2VsZWN0IENQVV9OT19FRkZJQ0lFTlRfRkZTCj4gICAJc2VsZWN0
IERNQV9ERUNMQVJFX0NPSEVSRU5UCj4gICAJc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQKPiArCXNl
bGVjdCBHRU5FUklDX0NNRExJTkUKPiAgIAlzZWxlY3QgR0VORVJJQ19DTU9TX1VQREFURSBpZiBT
SF9TSDAzIHx8IFNIX0RSRUFNQ0FTVAo+ICAgCXNlbGVjdCBHRU5FUklDX0lETEVfUE9MTF9TRVRV
UAo+ICAgCXNlbGVjdCBHRU5FUklDX0lSUV9TSE9XCj4gQEAgLTc0MiwzNSArNzQzLDYgQEAgY29u
ZmlnIFJPTUlNQUdFX01NQ0lGCj4gICAJICBmaXJzdCBwYXJ0IG9mIHRoZSByb21JbWFnZSB3aGlj
aCBpbiB0dXJuIGxvYWRzIHRoZSByZXN0IHRoZSBrZXJuZWwKPiAgIAkgIGltYWdlIHRvIFJBTSB1
c2luZyB0aGUgTU1DSUYgaGFyZHdhcmUgYmxvY2suCj4gICAKPiAtY2hvaWNlCj4gLQlwcm9tcHQg
Iktlcm5lbCBjb21tYW5kIGxpbmUiCj4gLQlvcHRpb25hbAo+IC0JZGVmYXVsdCBDTURMSU5FX09W
RVJXUklURQo+IC0JaGVscAo+IC0JICBTZXR0aW5nIHRoaXMgb3B0aW9uIGFsbG93cyB0aGUga2Vy
bmVsIGNvbW1hbmQgbGluZSBhcmd1bWVudHMKPiAtCSAgdG8gYmUgc2V0Lgo+IC0KPiAtY29uZmln
IENNRExJTkVfT1ZFUldSSVRFCj4gLQlib29sICJPdmVyd3JpdGUgYm9vdGxvYWRlciBrZXJuZWwg
YXJndW1lbnRzIgo+IC0JaGVscAo+IC0JICBHaXZlbiBzdHJpbmcgd2lsbCBvdmVyd3JpdGUgYW55
IGFyZ3VtZW50cyBwYXNzZWQgaW4gYnkKPiAtCSAgYSBib290bG9hZGVyLgo+IC0KPiAtY29uZmln
IENNRExJTkVfRVhURU5ECj4gLQlib29sICJFeHRlbmQgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1l
bnRzIgo+IC0JaGVscAo+IC0JICBHaXZlbiBzdHJpbmcgd2lsbCBiZSBjb25jYXRlbmF0ZWQgd2l0
aCBhcmd1bWVudHMgcGFzc2VkIGluCj4gLQkgIGJ5IGEgYm9vdGxvYWRlci4KPiAtCj4gLWVuZGNo
b2ljZQo+IC0KPiAtY29uZmlnIENNRExJTkUKPiAtCXN0cmluZyAiS2VybmVsIGNvbW1hbmQgbGlu
ZSBhcmd1bWVudHMgc3RyaW5nIgo+IC0JZGVwZW5kcyBvbiBDTURMSU5FX09WRVJXUklURSB8fCBD
TURMSU5FX0VYVEVORAo+IC0JZGVmYXVsdCAiY29uc29sZT10dHlTQzEsMTE1MjAwIgo+IC0KPiAt
ZW5kbWVudQo+IC0KClRoYXQgImVuZG1lbnUiIHNoYWxsIG5vdCBiZSByZW1vdmVkLgoKRml4ZWQg
aW4gdjQsCgpUaGFua3MgdG8gUm9iIEwuIGZvciB0aGUgcmVwb3J0LgpDaHJpc3RvcGhlCgo+ICAg
bWVudSAiQnVzIG9wdGlvbnMiCj4gICAKPiAgIGNvbmZpZyBTVVBFUkhZV0FZCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
