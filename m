Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B172CF3951
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2FQs/sG5kUlh5XGpA7A/646s4B/0pUfCfUAYmvDTvw=; b=l9LvfTZsPy1cMG
	eEnXa5BVl0FOscJIoLOzPiizKzKQLu55mET+m+btKQN2VAtOrnDvhLSQsnc99BA63ZJIa+zjm51el
	XTVKh3dGWY42PJ1gXP9JGxRZYmCC0+ArxZW11Ju8AM6pjRPw9vvJHX7qJqNy4QiI+5iDppP98JSHV
	EYm1a8XYEhU505OglNK3fOB8c9uGszScNYlbHqXCZv4dZVjDbk7fHuTHhaFtk8kpxWCuNnuqj/Bmc
	hwMJ6sW8kuGhrNikntHEgbfqcCCSKHFVh9REtkmRETdRUAz6GjaQyTvpATvEZGVUMHlVmPCQX6/Ob
	DGJJjDf9Ft7frsHVTlZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLks9-00000003eiu-0y1y;
	Wed, 19 Nov 2025 16:17:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLks8-00000003eiT-0duW
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 16:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 957286016B;
	Wed, 19 Nov 2025 16:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E42C4CEF5;
	Wed, 19 Nov 2025 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763569051;
	bh=/ZyPr0bolrQOFzFOw5n1ZDUctiYcQCYBM+n5jgHJUJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s4tKULAC877T/tmiAxjgqBNoHJJLJDsHoqSCQeFN4wWFGrl71RTneGefYdprO+0iK
	 ErF9V21sCXOZnyDCCTWjEjQSrSXDuPTzr+k4qQBHTOCnzwo/rxowS+J9wCeYsKjb6M
	 3oxSO3yDZNwtW1swd9Ci8KwNbYN+9YGC3zWDAjdaqTlFoK6CXCXny0G57VbxDKgVHI
	 Sm5FwHl1dR10sTHalmlYdSCRqBXADSgHJK2OKDj0PipMUwz6MuoMGXg7tD+fXLKPcU
	 A+VY528QS5OhThav4h2zSdx2eVIkWJnBIFVdrQVWURKqY7DIthho+IfAsIhH+4txIo
	 1FLkCoHJJb5GQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yixun Lan <dlan@gentoo.org>
In-Reply-To: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
References: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] mfd: simple-mfd-i2c: a couple of cleanups
Message-Id: <176356904975.268862.5196177981414997871.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 16:17:29 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-52d38
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

T24gVHVlLCAxMSBOb3YgMjAyNSAxMjoxODozNCArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IEhlcmUgaXMganVzdCBhIGNvdXBsZSBvZiBhZC1ob2MgY2xlYW51cHMuIE5vIGJlaGF2aW91
ciBjaGFuZ2VzLgo+IAo+IEFuZHkgU2hldmNoZW5rbyAoMik6Cj4gICBtZmQ6IHNpbXBsZS1tZmQt
aTJjOiBNYWtlIElEIHRhYmxlIHN0eWxlIGNvbnNpc3RlbnQKPiAgIG1mZDogc2ltcGxlLW1mZC1p
MmM6IGRvbid0IHVzZSAicHJveHkiIGhlYWRlcnMKPiAKPiBkcml2ZXJzL21mZC9zaW1wbGUtbWZk
LWkyYy5jIHwgMTggKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpb
MS8yXSBtZmQ6IHNpbXBsZS1tZmQtaTJjOiBNYWtlIElEIHRhYmxlIHN0eWxlIGNvbnNpc3RlbnQK
ICAgICAgY29tbWl0OiA4MWQyY2M5MjcyZGY4YzAxZTM2YTk2M2RkOGIyM2NhNTg1YjY4MDMyClsy
LzJdIG1mZDogc2ltcGxlLW1mZC1pMmM6IGRvbid0IHVzZSAicHJveHkiIGhlYWRlcnMKICAgICAg
Y29tbWl0OiA0NmJkZGI1ZmJlN2UzY2I3MzIwNGE5NTJkYmQ0Njg3Y2YwOTc0ZWY1CgotLQpMZWUg
Sm9uZXMgW+adjueQvOaWr10KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
