Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB556C021BC
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gP/eWQKpyj3q1t3NI5xTJt3gAu/NH3U30+KVfQMNN/4=; b=lkp/WODiKDgglz
	xsd1Q3rO0aH1dx8lxIPKEbUPszB+7nrZAh41aNihNNeIKpugDZUTwsegUQIA72kcHfOiYKlvBodxR
	wzyAoM14DvKtM4/OUE5Xii9FQKPuSJqHiuaTSEamHbieyPasXvJLoaQWarnpz7ckZ5MuNjeFveBGo
	k/5mZ1XIOgLuw5a/gulYFWuQbfbgVS7mI1QZpo7ekEvqyslmvLQ+SpaN0BwV/2medPRB8B6oZFT/U
	3vpT94KneTCh8aiemYs0FfbZDDySzI3JqxgzZj0gm1ZzXaSZ2YC/GZhi0fPr1tmCFAZwBzl5sRG6F
	Nz3kjrkK0PaW1J9Kneyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHh-0000000DndP-3nZR;
	Mon, 24 Feb 2025 13:14:09 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXRP-0000000Dfer-2zj1;
	Mon, 24 Feb 2025 12:20:08 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1fY56pPJz9sSK;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmjW4wRXcRyZ; Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1fY55w83z9sSC;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B37438B765;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lGRMugV4dhlW; Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A6868B763;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Message-ID: <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Date: Mon, 24 Feb 2025 13:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-3-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250217042220.32920-3-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_042007_902057_85A19684 
X-CRM114-Status: GOOD (  10.25  )
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

CgpMZSAxNy8wMi8yMDI1IMOgIDA1OjIyLCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IEdFTkVSSUNfUFREVU1QIGdldHMgc2VsZWN0ZWQgb24gcG93ZXJwYyBleHBsaWNpdGx5IGFuZCBo
ZW5jZSBjYW4gYmUgZHJvcHBlZAo+IG9mZiBmcm9tIG1wYzg4NV9hZHNfZGVmY29uZmlnLgo+IAo+
IENjOiBNYWRoYXZhbiBTcmluaXZhc2FuIDxtYWRkeUBsaW51eC5pYm0uY29tPgo+IENjOiBNaWNo
YWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8
bnBpZ2dpbkBnbWFpbC5jb20+Cj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldT4KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEto
YW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+IC0tLQo+IEp1c3Qgd29uZGVyaW5n
IC0gU2hvdWxkIENPTkZJR19QVERVTVBfREVCVUdGUyBiZSBhZGRlZCBpbnN0ZWFkID8KClllcyBw
bGVhc2UgZG8gdGhhdCBhcyBhIGZpeCB0byBjb21taXQgZTA4NDcyODM5M2E1ICgicG93ZXJwYy9w
dGR1bXA6IApDb252ZXJ0IHBvd2VycGMgdG8gR0VORVJJQ19QVERVTVAiKQoKPiAKPiAgIGFyY2gv
cG93ZXJwYy9jb25maWdzL21wYzg4NV9hZHNfZGVmY29uZmlnIHwgMSAtCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmln
cy9tcGM4ODVfYWRzX2RlZmNvbmZpZyBiL2FyY2gvcG93ZXJwYy9jb25maWdzL21wYzg4NV9hZHNf
ZGVmY29uZmlnCj4gaW5kZXggNzczMDZiZTYyZTllLi5lYTZmODM2NDA3ZDIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1X2Fkc19kZWZjb25maWcKPiArKysgYi9hcmNo
L3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZwo+IEBAIC03OCw0ICs3OCwzIEBA
IENPTkZJR19ERUJVR19WTV9QR1RBQkxFPXkKPiAgIENPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkK
PiAgIENPTkZJR19CRElfU1dJVENIPXkKPiAgIENPTkZJR19QUENfRUFSTFlfREVCVUc9eQo+IC1D
T05GSUdfR0VORVJJQ19QVERVTVA9eQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
