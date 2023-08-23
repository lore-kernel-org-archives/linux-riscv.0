Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D843DC27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4TBXDijVK52mUl0q6ulK6V9HSSV83rthnUEZQ0bACE=; b=EBaUEjBVO3cpZD
	AELG/j+e4fz1h0De6icVdGvvIPWLn/UHW0uhxu6p5oevainJQcYpy6OxsK4ejIoE/vsb105QmFYdx
	Z8/xhcSxZ4MJeUc+xJCfepsViUrT0qYvmXfb2TPs3qULBxa//+auOV99zQj9K2dZ1Go2AYbPjZgD7
	70na5LoBT5ez3rzD+ecTxBAdCq0X2ayB4q5WVNM3z4PZ2wKlJqdnhVb3bWtUD78p9VOWbRRbwM68c
	6DwED0+/VWlSy/WHpW3uyMzig3wYX5YF6TAN7/U5J8pi6eAb2jk5nYMXbFT01d1sYuec6pSrvDCAw
	X4EMgVN0IEo3IKCg6rgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYuBQ-001TXV-0N;
	Wed, 23 Aug 2023 20:10:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYuBM-001TWv-2D
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 20:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3E5962D53;
	Wed, 23 Aug 2023 20:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A485C433C8;
	Wed, 23 Aug 2023 20:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692821423;
	bh=K2KpJdKf6FScElKO4BDQjTIMS7VSEO2o1DADSC7q+R4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TgwAtISaI/NB71xFkrQ3QjMKmZldGjqpQuWnPbPjBjCNJjufUyJ7O8+3z+EIo9RxL
	 SPQqUSxskHRNNuOqKTNu0Mkz33efiQJy9/bKynhadhdIalsJeodvJBIO1oR9KSa+MC
	 c7FStgmt2dsOcI47W/0DbuL5naWT8X0G7wH3PCr0H6ANlrjnGio088oEuK6KRd99+c
	 jeWECy3scIe6qg9hEDT5Afb36ZA/6PzVj6gutNdWD/rqoEHpNZJGRsyP/6zF5g4/TH
	 SHCPAS5ZgBeA2uCWH27xOTkO6PlF9LLdDoaUT3weaI8V0XBmHkf0mZyywK4x9ATjQr
	 QjZPuJcqHlfhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E2800C595CE;
	Wed, 23 Aug 2023 20:10:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Require FRAME_POINTER for some configurations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169282142292.4166.3281543334488200075.git-patchwork-notify@kernel.org>
Date: Wed, 23 Aug 2023 20:10:22 +0000
References: <20230823082845.354839-1-bjorn@kernel.org>
In-Reply-To: <20230823082845.354839-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rdunlap@infradead.org,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org, guoren@kernel.org,
 dfustini@baylibre.com, linux-next@vger.kernel.org, sfr@canb.auug.org.au
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_131024_774984_17A39E39 
X-CRM114-Status: UNSURE (   9.32  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgMjMg
QXVnIDIwMjMgMTA6Mjg6NDUgKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBTb21lIFYgY29uZmlndXJhdGlvbnMgaW1wbGljaXRs
eSB0dXJuIG9uICctZm5vLW9taXQtZnJhbWUtcG9pbnRlcicsCj4gYnV0IGxlYXZpbmcgRlJBTUVf
UE9JTlRFUiBkaXNhYmxlZC4gVGhpcyBtYWtlcyBpdCBoYXJkIHRvIHJlYXNvbiBhYm91dAo+IHRo
ZSBGUkFNRV9QT0lOVEVSIGNvbmZpZywgYW5kIGFsc28gdHJpZ2dlcnMgYnVpbGQgZmFpbHVyZXMg
aW50cm9kdWNlZAo+IGluIGJ5IHRoZSBjb21taXQgaW4gdGhlIEZpeGVzOiB0YWcuCj4gCj4gWy4u
Ll0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIHJpc2N2OiBSZXF1aXJlIEZS
QU1FX1BPSU5URVIgZm9yIHNvbWUgY29uZmlndXJhdGlvbnMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcmlzY3YvYy85Zjk0NGQyZTBhYjMKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQot
LSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9y
Zy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
