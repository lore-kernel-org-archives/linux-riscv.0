Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F01C19F38
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We6ZZoHFjdkuXSyDnwHPDZ7CL3qpZrfllrWyXKftN3k=; b=HCpCorcYX9+hlt
	RxGshng0mMZtYyxLZIRSiAz4YKQwg5bRUYG2BFLSAeC5IVCr69EBNeJJbgK392hG0+oYoygLepENy
	7h8meCuGd1vU3z0wFeHA2wqvDNkgo+bUk5NxeFmdcT6TVxMUH6BgKZw+o3eHQiCSrvVl7tS/9n/jM
	6TRmk3fyE+B7mBgRCepiatULNTfnSbKBFOXT6X93DPQT7s18zcocpmh/TWvdDJVS054YT6/EFWio9
	gJebCrqZHXdVUFqNAR53oa4J3ofkRgxncgU7yyp5uI4iLnQmdqS/iuAIAuQ6Kg966OjstOZvJ0AOd
	6Xm22h9LcNl4QaUgNBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJie-00000004PSs-2iM6;
	Wed, 26 Feb 2025 15:53:08 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGrb-00000003kB2-2JB8;
	Wed, 26 Feb 2025 12:50:13 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z2v3D0g7Fz9sSK;
	Wed, 26 Feb 2025 13:31:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdl6tAtT0ddh; Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z2v3C6tl5z9sSH;
	Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D853B8B78B;
	Wed, 26 Feb 2025 13:31:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lyR8MYIwt_Lw; Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96D918B77C;
	Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Message-ID: <50339b41-9b4d-4315-a69b-ee32fc86baa6@csgroup.eu>
Date: Wed, 26 Feb 2025 13:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-3-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250226122404.1927473-3-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_045011_754292_B5999D8F 
X-CRM114-Status: GOOD (  10.08  )
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
IEdFTkVSSUNfUFREVU1QIGdldHMgc2VsZWN0ZWQgb24gcG93ZXJwYyBleHBsaWNpdGx5IGFuZCBo
ZW5jZSBjYW4gYmUgZHJvcHBlZAo+IG9mZiBmcm9tIG1wYzg4NV9hZHNfZGVmY29uZmlnLiBSZXBs
YWNlIHdpdGggQ09ORklHX1BURFVNUF9ERUJVR0ZTIGluc3RlYWQuCj4gCj4gQ2M6IE1hZGhhdmFu
IFNyaW5pdmFzYW4gPG1hZGR5QGxpbnV4LmlibS5jb20+Cj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4g
PG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWls
LmNvbT4KPiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pgo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IENjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IGUwODQ3MjgzOTNhNSAoInBvd2VycGMvcHRkdW1wOiBD
b252ZXJ0IHBvd2VycGMgdG8gR0VORVJJQ19QVERVTVAiKQo+IFN1Z2dlc3RlZC1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+IFNpZ25lZC1vZmYtYnk6
IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgoKUmV2aWV3ZWQt
Ynk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KCj4gLS0t
Cj4gICBhcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZyBiL2FyY2gv
cG93ZXJwYy9jb25maWdzL21wYzg4NV9hZHNfZGVmY29uZmlnCj4gaW5kZXggNzczMDZiZTYyZTll
Li4xMjkzNTVmODdmODAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1
X2Fkc19kZWZjb25maWcKPiArKysgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2Rl
ZmNvbmZpZwo+IEBAIC03OCw0ICs3OCw0IEBAIENPTkZJR19ERUJVR19WTV9QR1RBQkxFPXkKPiAg
IENPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKPiAgIENPTkZJR19CRElfU1dJVENIPXkKPiAgIENP
TkZJR19QUENfRUFSTFlfREVCVUc9eQo+IC1DT05GSUdfR0VORVJJQ19QVERVTVA9eQo+ICtDT05G
SUdfUFREVU1QX0RFQlVHRlM9eQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
