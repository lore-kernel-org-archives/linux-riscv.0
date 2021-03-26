Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2015C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 14:21:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7173461A18
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 14:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7173461A18
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZI/1yvUOcOk4sEtWQc6fEtJBKH0RLHB7BSMjg1HtzN4=; b=oKULVnD30+HjfGjlx/NoFgVGR
	SwKk5H5FPP6pJM+M2NVOUtyZJJK8NBBQj1Jv/LPWZ5yKu7eMXMwLa40z9tM5X53Si1T3icqdQtsk+
	fcf2dTVag4+EMJ9IrtryyzToiDOhtEU7wK42aQidCrIMU00BATwRvrIvk+tt8BGsaN7wKuIcpyl/l
	MxmzbaB/yVZJ2WBm+sDDhh0QbU4bvMhYSNVnBxZ/jGBE7mlkmDBWVBgFXQFWwEuVt9k9h2HaNkjwO
	pyC/R0dzh143IHkOhrFatPqW2k2ozd5rF8zPUFqyYBTXYoD/MZyhAv21aj/CZoNDJSmq8o7l6lLJJ
	jE8r9HcHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPnKS-003lEx-4H; Fri, 26 Mar 2021 14:20:48 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPnKF-003lBt-MP; Fri, 26 Mar 2021 14:20:37 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6PJQ0zLJz9v03Q;
 Fri, 26 Mar 2021 15:20:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id s0KOf5I51hUM; Fri, 26 Mar 2021 15:20:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6PJP6Vfbz9v0P3;
 Fri, 26 Mar 2021 15:20:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B5C58B8CF;
 Fri, 26 Mar 2021 15:20:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id apm4h56oZ3Cq; Fri, 26 Mar 2021 15:20:23 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95C5C8B8C7;
 Fri, 26 Mar 2021 15:20:22 +0100 (CET)
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
Date: Fri, 26 Mar 2021 15:20:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87zgyqdn3d.fsf@igel.home>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_142035_856993_FF398D87 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

CgpMZSAyNi8wMy8yMDIxIMOgIDE1OjA4LCBBbmRyZWFzIFNjaHdhYiBhIMOpY3JpdMKgOgo+IE9u
IE3DpHIgMjYgMjAyMSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+
IGluZGV4IGY4ZjE1MzMyY2FhMi4uZTdjOTFlZTQ3OGQxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4g
QEAgLTIwLDYgKzIwLDcgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvc3dpb3RsYi5oPgo+PiAgICNp
bmNsdWRlIDxsaW51eC9zbXAuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4+ICsjaW5j
bHVkZSA8bGludXgvY21kbGluZS5oPgo+PiAgIAo+PiAgICNpbmNsdWRlIDxhc20vY3B1X29wcy5o
Pgo+PiAgICNpbmNsdWRlIDxhc20vZWFybHlfaW9yZW1hcC5oPgo+PiBAQCAtMjI4LDEwICsyMjks
OCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4+ICAgCX0KPj4gICAKPj4g
ICAJcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxcbiIpOwo+PiAtI2lmZGVmIENP
TkZJR19DTURMSU5FX0ZPUkNFCj4+IC0Jc3RybGNweShib290X2NvbW1hbmRfbGluZSwgQ09ORklH
X0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsKPj4gKwljbWRsaW5lX2J1aWxkKGJvb3RfY29t
bWFuZF9saW5lLCBOVUxMLCBDT01NQU5EX0xJTkVfU0laRSk7Cj4+ICAgCXByX2luZm8oIkZvcmNp
bmcga2VybmVsIGNvbW1hbmQgbGluZSB0bzogJXNcbiIsIGJvb3RfY29tbWFuZF9saW5lKTsKPiAK
PiBTaG91bGRuJ3QgdGhhdCBtZXNzYWdlIGJlY29tZSBjb25kaXRpb25hbCBpbiBzb21lIHdheT8K
PiAKCllvdSBhcmUgcmlnaHQsIEkgZGlkIHNvbWV0aGluZyBzaW1pbGFyIG9uIEFSTSBidXQgbG9v
a3MgbGlrZSBJIG1pc3NlZCBpdCBvbiBSSVNDVi4KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
