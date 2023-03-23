Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D0C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=XeblB9N83JRsG9dq4Hdl0bsITGjE+jYh5TkaXhk/hoo=; b=sF8
	+RTMNFDHCe2njCDcV0y1FyVnxSHBSSBB8honXovSCGiMYZphqsMfVcHQQJ1nKsS1F2XPT/UeSYf7Y
	Fbktll0yUOTjn+XVxKD5gYsAjTbvZbRuEbCIIMjjXzpWwOHbA3bIakC547pvTlfMFKOJot34deYw3
	Iz8jTVKSwxq+w++AO0nNEAEcW/fCe4FCuB5aU1+gawQJfpXcNTiG7kB5zgjIyMHJzi8Owfd5EbpfD
	x+wiNguwABzGfPQZ1RkhRlEn2fqOTiBL2bOwe8BnWe0iu40a1M8ByAwb9BFj6rl5ez6+9woNVrrEJ
	YAgM6EStjvHJb+8UxDt6sucPyduKgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfICX-001ZoL-2q;
	Thu, 23 Mar 2023 10:29:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfICU-001Zno-2j;
	Thu, 23 Mar 2023 10:29:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6817BB811AB;
	Thu, 23 Mar 2023 10:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D47C433D2;
	Thu, 23 Mar 2023 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679567380;
	bh=fDcF61tjo8q8qHagQMk3UpbEV6iDDR23l7YEGst1DbA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=n6QIicGg7E0gminwcg/q/adbTOOQgBbPAKLqEQ1UE71B7Wf+/FNk+s3SsPov1noLU
	 9Uy5iTtQU8C11P44+jeeKePKM42eWGDr4RpOHKRsQGQsojdWnWN3IYz7r6PfM1+qKv
	 U+tquSHVVsDhENd1Q1raVbXJJmRZfPXwL1k+y4eOiUQZ5L7HOmoQZ1MHh9jvxvRJVt
	 0Mw5Cg3FSs6c1oG8CfdAYLbP+ZfjmFgR1xBj3iQo+Q8rbNtKHZSkcyqQ9MJUyGnqmm
	 5edNc2VyVOwlys6jqtbSvmQKRqBZzhIOB/rXuvmm28o/DOM/qlZqaEkxnEDtaDugvv
	 FN++C8+NMHoVA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew
 Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Conor Dooley <conor.dooley@microchip.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liao Chang
 <liaochang1@huawei.com>, Jisheng Zhang <jszhang@kernel.org>, Vincent Chen
 <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>, Xianting Tian
 <xianting.tian@linux.alibaba.com>, Mattias Nissler
 <mnissler@rivosinc.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v15 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <20230317113538.10878-11-andy.chiu@sifive.com>
Date: Thu, 23 Mar 2023 11:29:37 +0100
Message-ID: <87edpf4v72.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_032943_031388_C833E573 
X-CRM114-Status: UNSURE (   6.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBWZWN0b3IgdW5pdCBp
cyBkaXNhYmxlZCBieSBkZWZhdWx0IGZvciBhbGwgdXNlciBwcm9jZXNzZXMuIFRodXMsIGEKPiBw
cm9jZXNzIHdpbGwgdGFrZSBhIHRyYXAgKGlsbGVnYWwgaW5zdHJ1Y3Rpb24pIGludG8ga2VybmVs
IGF0IHRoZSBmaXJzdAo+IHRpbWUgd2hlbiBpdCB1c2VzIFZlY3Rvci4gT25seSBhZnRlciB0aGVu
LCB0aGUga2VybmVsIGFsbG9jYXRlcyBWCj4gY29udGV4dCBhbmQgc3RhcnRzIHRha2UgY2FyZSBv
ZiB0aGUgY29udGV4dCBmb3IgdGhhdCB1c2VyIHByb2Nlc3MuCj4KPiBTdWdnZXN0ZWQtYnk6IFJp
Y2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgo+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMzkyM2VlZWUtZTRkYy0wOTExLTQwYmYtODRjMzRhZWU5
NjJkQGxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZp
dmUuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
