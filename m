Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB2C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AoCRT6wPag3tQkdwSwAHFI2KfrU0tsHUWXmbZ5AroU=; b=Bey9pV3TXHo+2h
	6S8+vjXML0GwvEeYipXtO7dCsJ2ZsdCb+QHlZgQXoE01XMALxbsOxjTxSskrb7b8ISj3ZEXZIzdCU
	euFTs04lgoNFobYE/3fQxChQuHJK7vKDNq381/rvSwlTnIoC/uIfJNUg+AB8UZ+jvw16UsWORQsrr
	6JHPGLP0kAk7Hg909JW54r18QTmZfG+l8wx+GuUgL8Dll2mlUgZ7TJEMFahfdlQCfPSpbRMOKJHnQ
	gGyvdoJxHvt6Duq/sPkGp/bTebGeUvTYb/6zNMlruj9Rtqq4/lmjOFY1Q5g5GHz+ssVKkZFKZXmhr
	pg94b258q5E/ttr9I0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ83-00000008R6W-3ql7;
	Thu, 30 Jan 2025 08:42:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ81-00000008R5a-2nCf
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 08:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 232665C5D97;
	Thu, 30 Jan 2025 08:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7D8C4CED2;
	Thu, 30 Jan 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738226544;
	bh=Hns6xwQBsveKR1vKW31yktZyPYFYoDOUmz4ZKRbjlTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vMzj4MYKtAiqJ6RLff4zJDABl7+halshmCh0EvHM/8X2HgrGzphOmm/IaTDLL2HEf
	 p/9fD1tMNFp222OgdU2zOCRlhTlG1kDFeqYBoKW52i0oegKOaJ8nlfMprSIcYMsyW1
	 hwW7EUpyvJUayUv6fvRpQ1ViC3pJtLfUsXYSMuNMQyJ8gcKVZh04FkyCfRClMXX3Gk
	 1dIlONxzZo0i7Oe9+E5qtuou5p4mAtt/K2wF2pCxM+pe0jJT2VEL960qR8Q4l1yeew
	 p96p4fQVsGo7jz/LkVhj4gAqLH3vvZbuA0bUSwt85euHZ8Uum/sFSH+zLERjXHR5xn
	 6PyU2iGEfGhdw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Chunyan
 Zhang <zhang.lyra@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
In-Reply-To: <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
Date: Thu, 30 Jan 2025 09:42:21 +0100
Message-ID: <87frl0snf6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_004225_746661_2B4EBE33 
X-CRM114-Status: UNSURE (   7.30  )
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

Q2h1bnlhbiBaaGFuZyA8emhhbmdjaHVueWFuQGlzY2FzLmFjLmNuPiB3cml0ZXM6Cgo+IFRoZSBQ
VEUgYml0KDkpIG9uIFJJU0MtViBpcyByZXNlcnZlZCBmb3Igc29mdHdhcmUsIGl0IGlzIHVzZWQg
YnkgZGV2bWFwCj4gbm93IHdoaWNoIGhhcyB0byBiZSBkaXNhYmxlZCBpZiB3ZSB3YW50IHRvIHVz
ZSBiaXQoOSkgZm9yIG90aGVyIGZlYXR1cmVzLAo+IHNpbmNlIHRoZXJlJ3Mgbm8gbW9yZSBmcmVl
IFBURSBiaXQgb24gUklTQy1WIG5vdy4KPgo+IFNvIHRvIG1ha2UgQVJDSF9IQVNfUFRFX0RFVk1B
UCBzZWxlY3RhYmxlLCB0aGlzIHBhdGNoIHVzZXMgaXQgYXMKPiB0aGUgYnVpbGQgY29uZGl0aW9u
IG9mIGRldm1hcCBkZWZpbml0aW9ucy4KCkhlYWRzLXVwOiBJdCBzZWVtcyBsaWtlIEFsaXN0YWly
J3Mgc2VyaWVzIFsxXSB0aGF0IHJlbW92ZXMgdGhlIGRldm1hcApQVEUgYml0IHdpbGwgbW9zdCBs
aWtlbHkgbGFuZCBpbiA2LjE1LgoKCkJqw7ZybgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW1tL2NvdmVyLjExMTg5ODY0Njg0ZTMxMjYwZDE0MDg3NzlmYWM5ZGI4MDEyMjA0N2Iu
MTczNjQ4ODc5OS5naXQtc2VyaWVzLmFwb3BwbGVAbnZpZGlhLmNvbS8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
