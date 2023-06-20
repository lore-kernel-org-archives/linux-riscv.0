Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143E9EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPUrfVU//fnQXpb990oELi0xRqEu+SnnD29B1eZxhmA=; b=ip/qrk3qsqaKWr
	iHuaeVPi6FOVObLrFomB8xYrQVm5Yy/Vo602pQ3LcBKRhBVqTX0T0n/XtIkew5g/zMnvvY86X1WYq
	1ujTz4f7cX1O4X0jE4hC8j93thD3CgfBOGXLwIgMaO0IjsHFoyTF78XAZHW+7R/e4CS4bSZBVRE9s
	U5s9W16abOM3JRgZeT6tXun/LBemIPNu0qG5rHUQ1rA7bVb6RGcFFxCSrXh9FNo4iPvhdma+FONzN
	56HVIuFGEDt6SQV9/j8r3wQHr66j3MA3lyxcQPV9ZeJ0BbQYYsEr66tFLtwK379v+xBbCLRLRgc3M
	agv8oLFUs3jDR5JQI1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBd9c-00Bf55-10;
	Tue, 20 Jun 2023 15:20:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBd9Z-00Bf48-1x
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 15:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E83B1612D1;
	Tue, 20 Jun 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56A3EC433C9;
	Tue, 20 Jun 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687274420;
	bh=2k98mMgOMgUh8cLLc+tlihNRAWbOo5x8TfgYwQ3JGX4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qgybfX2wCwdbHduQ5+Ea1UCHKTz9CvouMTUwP9qSWHEe816u1/L2Z07zUJLF5Y0Nn
	 a3u6TqI2aWwZDqUS9bs3dYHAsUe4vq4HiElqQ1uMUYRQp+51xiI5Gs8CTT4ZlH5yzS
	 3TVKbA3disNOuG/c6dwfPfBTRLVTrrcjhlnu09+Z2BhXHNHcJlBZCb7NNYg24OT08W
	 foACLLFhrMCdGcJ+2NeSaOTkfM0wn3bm8YnZkf3hCpcp5QosC7y7SPrf3pXF7oIbY7
	 7ORc8vgG8M+U+9JOGext6/YVi77I8vYhvjII2mn+gcS0woY+nwasvvETYzBIyfkkk1
	 4EjybJHbaVWcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3C82CE21EDB;
	Tue, 20 Jun 2023 15:20:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: Pre-allocate PGD entries for vmalloc/modules
 area
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168727442024.569.16572247474971535604.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 15:20:20 +0000
References: <20230531093817.665799-1-bjorn@kernel.org>
In-Reply-To: <20230531093817.665799-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux@rivosinc.com,
 alexghiti@rivosinc.com, joro@8bytes.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_082021_682929_85181661 
X-CRM114-Status: UNSURE (   9.38  )
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
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgMzEg
TWF5IDIwMjMgMTE6Mzg6MTcgKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgUklTQy1WIHBvcnQgcmVxdWlyZXMgdGhhdCBr
ZXJuZWwgUEdEIGVudHJpZXMgYXJlIHRvIGJlCj4gc3luY2hyb25pemVkIGJldHdlZW4gTU1zLiBU
aGlzIGlzIGRvbmUgdmlhIHRoZSB2bWFsbG9jX2ZhdWx0KCkKPiBmdW5jdGlvbiwgdGhhdCBzaW1w
bHkgY29waWVzIHRoZSBQR0QgZW50cmllcyBmcm9tIGluaXRfbW0gdG8gdGhlCj4gZmF1bHRpbmcg
b25lLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjJd
IHJpc2N2OiBtbTogUHJlLWFsbG9jYXRlIFBHRCBlbnRyaWVzIGZvciB2bWFsbG9jL21vZHVsZXMg
YXJlYQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzdkMzMzMmJlMDExZQoKWW91
IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90Lgpo
dHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
