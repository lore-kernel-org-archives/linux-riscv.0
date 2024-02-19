Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A981C48BF8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVvSA8xOaqfMVu8aou7LQI/Fpypc+ezHIhSc6GNsRlY=; b=xvGoT2qmBIHLJ0
	aBm3agCYCjrPr4pPlN2rMS/B0Y6XkaRxPLAisn/Nb9/bQ1UzU3aoVzHwaKsP/LQxr0PSABxc3/FFC
	NXzzNtjBHJE5uwlaQzcPM+xIejJK46Tl6IsCR2fe1YPDWOvSUZJ4/Ak8l1tpJUnbLkNVBZr7cE4oO
	j7Xkj0eDF0s0r9AmZWmqwtKmX9gtL+FRvRUpjpBuWFwcT4djFoMuZCT8deYDGykNNtjupNosiKd8t
	a7X0i+vONSL7jdClP584sdD+7cv+2ZMJ0z9fa1TL7gKEcju7oecug1bXB3fa02OC8Bvf2XN2EWrPy
	2C7QO5+rJjfZp78RPdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2kI-0000000AOIV-0x2e;
	Mon, 19 Feb 2024 12:27:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2kF-0000000AOHG-2etS
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 12:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20B8260C26;
	Mon, 19 Feb 2024 12:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60584C433F1;
	Mon, 19 Feb 2024 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708345658;
	bh=WC//6ifWhE+tXtiIWjc1rpI458yYbl6SPhLu3hEmmTg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GOCIj9lsOzJXS4U4rvasmFuvhcfDgGIkaaSQSn8dXkuKR4u6B2U3tgYRZFITHfR1w
	 MG/eWs60A1phxsG3ZKXnKn13gzEiq5SjPgf4KqqYj8bNwobAIGbRwiZ5uEONzU6dT0
	 +DHp9q76z4m+0fJ+bpVhAGfxx8AwCAzJSJL3Pzjbmb16bJDhEArMBHLUEmqCtZ9gkZ
	 R+SFv5+InU17XQ0Atn6q51YuM5StlRArQVQGLOST5Ve81SNNyyOjLkTv+07059cgjg
	 J6/cgXSiNVGu4+IMTE+eV7QOsarHqg6oiD1UwNxzE7A7/yTORAvRYh3X4E2BhrQEre
	 iy4kM2Ch18OMg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Baron <jbaron@akamai.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH 1/7] riscv: jump_label: Batch icache maintenance
In-Reply-To: <20240212025529.1971876-2-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-2-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 13:27:35 +0100
Message-ID: <87il2kfxl4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_042739_742568_22E352C9 
X-CRM114-Status: UNSURE (   5.04  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gU3dp
dGNoIHRvIHRoZSBiYXRjaGVkIHZlcnNpb24gb2YgdGhlIGp1bXAgbGFiZWwgdXBkYXRlIGZ1bmN0
aW9ucyBzbwo+IGluc3RydWN0aW9uIGNhY2hlIG1haW50ZW5hbmNlIGlzIGRlZmVycmVkIHVudGls
IHRoZSBlbmQgb2YgdGhlIHVwZGF0ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5k
IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
