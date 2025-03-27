Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8998C36010
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAKlB58V0gVaT3F40vLPACT1auInXrIuIzuP1khUn7A=; b=1VFU39Da6UXbDd
	xJQePdgtCjM5cXQEszB7Hn4Jy94LzzEYnKzrfzsRLbNqEkzh/0/BHQyiZNYtTCefX6F0Sxs1yxTZO
	jMAkJWrCDZ58dIaGFuetxAzKV8DFvpnvuq9x07AoMv0F86ektcyYDgoAcwU4Ln3kyrl/SjS84Zl+t
	lbWTDia07tCBwYyc4Pq9VvdDasUgmvSHO60TGRf1Z8JXGWKi8AMhDR1cUTpJo/g1KULrT99GmaslE
	LZdyRpaBYZUUQNqaiCk9WzKuep75nhTuGzCdmBgOvxgdoBXTrFbkezu26acMgZ58CFfQw/dNsxWh1
	nd3/GcB0mLo749dkxszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqb-0000000A41E-2hS6;
	Thu, 27 Mar 2025 03:24:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqW-0000000A3xr-2a1O
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03ADCA41A94;
	Thu, 27 Mar 2025 03:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBB6C4CEDD;
	Thu, 27 Mar 2025 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045835;
	bh=0Z+krIl+/zQYEwjG0OKDq23wYFASD/qtkJxmur+n0hk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OKIVlDksSvYxBczefAjURc8P10kXnp2ZJbkVZgE7HDzRSkujUtWAGwVBF233EQI+O
	 jcvaWK/tDrJ85gMIGcgr4kCT+0NqN7/+g+iXSX3VB9yjgpdUOC1lK6JNg86cH0t/S8
	 JqNbMd34ymWgSkWulmDOapT5YVjq/p0hWV1lG6AVoW+iQQStKLUW4Wdbucb692zk6N
	 fkFyjYBuqZGAm+sa48Xja9onPuw6finTR64EcVuCXZIG420aFm4e8wKVwByRe3C0Nc
	 qwCYTz6u4KQiXvQCLA8WVAszXXKCVv+PhAbkIS29F6gJzFf4ZnOHKLBD/8t0/bkRGW
	 /jJ7isU0h3IjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34226380AAFD;
	Thu, 27 Mar 2025 03:24:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] riscv: Call secondary mmu notifier when flushing the tlb
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304587200.1549280.10533939486464142848.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:32 +0000
References: <20250113142424.30487-1-alexghiti@rivosinc.com>
In-Reply-To: <20250113142424.30487-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, samuel.holland@sifive.com, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202356_729910_D8A1F559 
X-CRM114-Status: UNSURE (   7.15  )
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
eHQpCmJ5IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT46CgpPbiBNb24s
IDEzIEphbiAyMDI1IDE1OjI0OjI0ICswMTAwIHlvdSB3cm90ZToKPiBUaGlzIGlzIHJlcXVpcmVk
IHRvIGFsbG93IHRoZSBJT01NVSBkcml2ZXIgdG8gY29ycmVjdGx5IGZsdXNoIGl0cyBvd24KPiBU
TEIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgo+IFJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+Cj4gLS0tCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAt
IFt2NF0gcmlzY3Y6IENhbGwgc2Vjb25kYXJ5IG1tdSBub3RpZmllciB3aGVuIGZsdXNoaW5nIHRo
ZSB0bGIKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9kOWJlMmI5YjYwNDkKCllv
dSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4K
aHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
