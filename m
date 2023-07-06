Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE568EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VHM7nNYkJbxlGfQjyaJvaCjJmBLhJcRt4TiAhVT2GI=; b=N3CGhDtAfTzsZq
	8LYdPDQ/hr+BkuxLPrRWYpvKBOVu0fNppSkd2oU0iktwSltYfPJJlTR8RZS5Rc75f0SrcrPCgS5Jm
	crqrDjdrB3GgtMAah1W8qH/XoGmy87KRdVJvOf5wKXyZ3UyRfnj7PtgRRWYWUrcXk7uNLp3sz4naK
	l2zR53HtNZPlD1PQ68uGOdRTMPJqqhQQErnEk49VqWWneLjxjgCCUr1MPXU9AqU+CpGWK08V4cza7
	RArREXc3K0+PxvIpblpjnMbha3VRMnfPpKpuUtgzmTEk6O+1Pnc1nVbm8x2fn+YQMcYhR9cOKBHg4
	j55Mkd3BWaiRVLrQNEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWe0-002kBJ-09;
	Thu, 06 Jul 2023 21:36:08 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWdy-002kAr-11;
	Thu, 06 Jul 2023 21:36:06 +0000
Message-ID: <62e993a5-0bb4-40dc-6399-f60525300a6c@infradead.org>
Date: Thu, 6 Jul 2023 14:36:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: Tree for Jul 6 (arch/riscv/)
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Conor Dooley <conor@kernel.org>
References: <mhng-a4ed8be3-1e00-4604-ac93-29d893829988@palmer-ri-x1c9a>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <mhng-a4ed8be3-1e00-4604-ac93-29d893829988@palmer-ri-x1c9a>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzYvMjMgMTQ6MzIsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFRodSwgMDYgSnVs
IDIwMjMgMTQ6Mjc6NTMgUERUICgtMDcwMCksIHJkdW5sYXBAaW5mcmFkZWFkLm9yZyB3cm90ZToK
Pj4KPj4KPj4gT24gNy81LzIzIDE4OjU3LCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+Pj4gSGkg
YWxsLAo+Pj4KPj4+IFBsZWFzZSBkbyAqbm90KiBhZGQgYW55IHY2LjYgcmVsYXRlZCBzdHVmZiB0
byB5b3VyIGxpbnV4LW5leHQgaW5jbHVkZWQKPj4+IGJyYW5jaGVzIHVudGlsIGFmdGVyIHY2LjUt
cmMxIGhhcyBiZWVuIHJlbGVhc2VkLgo+Pj4KPj4+IENoYW5nZXMgc2luY2UgMjAyMzA3MDU6Cj4+
Pgo+Pgo+PiBvbiByaXNjdjY0Ogo+Pgo+PiBXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4OiBzZWN0
aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZTogJHhydjY0aTJwMV9tMnAwX2EycDFfemljc3IycDBf
emlmZW5jZWkycDBfemloaW50cGF1c2UycDBfem1tdWwxcDArMHgxNCAoc2VjdGlvbjogLnRleHQu
dW5saWtlbHkuc2V0X2JpdC5jb25zdHByb3AuMCkgLT4gbnVtYV9ub2Rlc19wYXJzZWQgKHNlY3Rp
b246IC5pbml0LmRhdGEpCj4+Cj4+Cj4+IEZ1bGwgcmFuZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVk
Lgo+IAo+IFRoYW5rcywgSSdtIGdpdmluZyBpdCBhIGxvb2suwqAgRG8geW91IGhhcHBlbiB0byBh
bHNvIGhhdmUgeW91ciB0b29sY2hhaW4gdmVyc2lvbiBlYXNpbHkgYXZhaWxpYWJsZT/CoCBUaGUg
bWFwcGluZyBzeW1ib2xzIGFyZSBuZXcgYW5kIHdlJ3ZlIHNlZW4gc29tZSBvZGQgc3R1ZmYgaGFw
cGVuLCBzb21ldGhpbmcgaXMgbGlrZWx5IGJyb2tlbiBzb21ld2hlcmUuLi4KCkknbSB1c2luZyBn
Y2MtMTMuMS4wIGZyb20gIGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL3Rvb2xz
L2Nyb3NzdG9vbC8KCi0tIAp+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
