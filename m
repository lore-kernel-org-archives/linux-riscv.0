Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4A6C19F2E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+4opW2jM6EDTl5UrRCo13X1kV9WHY0t/xc5UUBQ/xo=; b=ResYLw9NxRHaLc
	9RKtV0ZwoGxELHZbpaqFUMMOsS6DMb/ILhJ8fCpaVnEtRajjAAjCfEVelLd3k48WzbzQU2cvdHNi7
	7OUCYzshDv1GA3KOsMTbGIt9ejtzCmiRV2YMu4yCQ4phx0/rMbOU21+MbNOxy/4xWRdoqmd3Xq0WO
	dlPru04BB+SKLotdHr36O4WASFE0v7D31pj+YA7kuK0V5vtbKyXRDinlauTLNVSm146Q0BW/gHUnU
	1n0gVh0SBlfAiZILgissF2c5sndEMNLmcGkeubNe2oApaQMw4shetEmo6jCZa4RUJRWO2akjciZ1s
	Tt2JFkiQ7878Ej+v8I9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIYB-000000047u0-19WD;
	Wed, 26 Feb 2025 14:38:15 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGrU-00000003k8P-06KI;
	Wed, 26 Feb 2025 12:50:05 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z2v3t6vSKz9sSN;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPLDBYGk5ZSX; Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z2v3t62h2z9sSL;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBC958B78B;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ep8JbNxoBOZU; Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85E558B77C;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Message-ID: <c58f3fef-82a6-43a4-a222-1cc8ab62a93b@csgroup.eu>
Date: Wed, 26 Feb 2025 13:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Steven Price <steven.price@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-5-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250226122404.1927473-5-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_045004_213283_16AD00BC 
X-CRM114-Status: GOOD (  10.63  )
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

CgpMZSAyNi8wMi8yMDI1IMOgIDEzOjI0LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IERFQlVHX1dYIHNlbGVjdHMgUFREVU1QX0NPUkUgd2l0aG91dCBldmVuIGVuc3VyaW5nIHRoYXQg
dGhlIGdpdmVuIHBsYXRmb3JtCj4gaW1wbGVtZW50cyBHRU5FUklDX1BURFVNUC4gVGhpcyBwcm9i
bGVtIGhhcyBiZWVuIGxhdGVudCB1bnRpbCBub3csIGFzIGFsbAo+IHRoZSBwbGF0Zm9ybXMgc3Vi
c2NyaWJpbmcgQVJDSF9IQVNfREVCVUdfV1ggYWxzbyBzdWJzY3JpYmUgR0VORVJJQ19QVERVTVAu
Cj4gCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6
IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g
UmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+CgpS
ZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
PgoKPiAtLS0KPiAgIG1tL0tjb25maWcuZGVidWcgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9LY29uZmlnLmRlYnVnIGIvbW0vS2Nv
bmZpZy5kZWJ1Zwo+IGluZGV4IDQxYTU4NTM2NTMxZC4uYTUxYTExNDk5MDlhIDEwMDY0NAo+IC0t
LSBhL21tL0tjb25maWcuZGVidWcKPiArKysgYi9tbS9LY29uZmlnLmRlYnVnCj4gQEAgLTE4Niw2
ICsxODYsNyBAQCBjb25maWcgQVJDSF9IQVNfREVCVUdfV1gKPiAgIGNvbmZpZyBERUJVR19XWAo+
ICAgCWJvb2wgIldhcm4gb24gVytYIG1hcHBpbmdzIGF0IGJvb3QiCj4gICAJZGVwZW5kcyBvbiBB
UkNIX0hBU19ERUJVR19XWAo+ICsJZGVwZW5kcyBvbiBHRU5FUklDX1BURFVNUAo+ICAgCWRlcGVu
ZHMgb24gTU1VCj4gICAJc2VsZWN0IFBURFVNUF9DT1JFCj4gICAJaGVscAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
