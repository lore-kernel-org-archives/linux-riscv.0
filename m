Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78D8C02198
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBP0d6qZkbI6q7qLLhfbeoCq5b8kbL1gCn18AM27zwI=; b=kkTmA8OHWP/uSP
	KaNVSrwVeFZ6o9Z8aGYC43Zvg0rI3QBpVb2GlawxgJZv/CFDTgiiG4CayuI8hLmoSv1DfWQ+KlGg1
	MaMlkFmLjTxwlwBwK00TxyYSv1ViTucHHMCcznLhLVUHrfj7QD64XPJ+VwaMEa4mQs9kYnkJTiQcV
	sgFu+ZwB+IKDjLIMxSxcMyRnOF8IGaK8ytyMzEh3gcMQmDY1SfleVb55tu73iU2lKSyt2KljQS44M
	SuK7HbsqjIf0DpgyMfyWnUpa6eefSoamyxQ3qEvS13x2gApyG/HHaprL9nN6xJ2O3T0HafWwqZsNz
	FLlUvZxOc5eMzGNU2kqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1zu-0000000GS1y-2qJW;
	Mon, 03 Feb 2025 19:20:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1us-0000000GQHB-3uli
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91A605C688F;
	Mon,  3 Feb 2025 19:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268D0C4CED2;
	Mon,  3 Feb 2025 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610130;
	bh=DNa/v4L4GNkBFQVY6p5fPmrvgQMyAR2FediJooOHzq8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IA6wl1kD76UaA590vQjC8DR1CxUfDIk/wXotpFrZMhwfiIHpu4XETt1RNAgo7S9qZ
	 lVLQOJu21i2CVWA+BqV0mnF3y6EV4mcsaOXCBha9CcL1XG/sHlsZ16oVfZBay9LSd+
	 /4OSY7xiAEnSp67jxsmUGmOrjJ0w8RSvjaM++jzAVVNNugicDQOaAETQwJUwdOiEgB
	 RvrmH3rdOg0RTni1PpklIpJf0ELAlaoq0FWqNmKj7SQkQILXjTqQ9Ry5BbiYHkS+Id
	 yISPT3zKVcUp+/9ptx3WeWzRv3ZMnhjZ7YRZvtXWgG5tFSP9F8P3+iFerrAmNCzchK
	 vEsIxFrxEdW2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D61380AA67;
	Mon,  3 Feb 2025 19:15:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] pwm: microchip-core: fix incorrect comparison with max
 period
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015701.3409359.18144530519616995351.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:57 +0000
References: <20250122-pastor-fancied-0b993da2d2d2@spud>
In-Reply-To: <20250122-pastor-fancied-0b993da2d2d2@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 conor.dooley@microchip.com, stable@vger.kernel.org,
 daire.mcnamara@microchip.com, ukleinek@kernel.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111531_014511_98390270 
X-CRM114-Status: UNSURE (   8.74  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xlaW5la0BrZXJuZWwub3JnPjoKCk9uIFdlZCwgMjIg
SmFuIDIwMjUgMTQ6NDI6NTYgKzAwMDAgeW91IHdyb3RlOgo+IEZyb206IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gSW4gbWNocF9jb3JlX3B3bV9hcHBseV9s
b2NrZWQoKSwgaWYgaHdfcGVyaW9kX3N0ZXBzIGlzIGVxdWFsIHRvIGl0cyBtYXgsCj4gYW4gZXJy
b3IgaXMgcmVwb3J0ZWQgYW5kIC5hcHBseSBmYWlscy4gVGhlIG1heCB2YWx1ZSBpcyBhY3R1YWxs
eSBhCj4gcGVybWl0dGVkIHZhbHVlIGhvd2V2ZXIsIGFuZCBzbyB0aGlzIGNoZWNrIGNhbiBmYWls
IHdoZXJlIG11bHRpcGxlCj4gY2hhbm5lbHMgYXJlIGVuYWJsZWQuCj4gCj4gWy4uLl0KCkhlcmUg
aXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFt2MV0gcHdtOiBtaWNyb2NoaXAtY29yZTog
Zml4IGluY29ycmVjdCBjb21wYXJpc29uIHdpdGggbWF4IHBlcmlvZAogICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9yaXNjdi9jLzc1MmI2ZTNhZjM3NAoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5
b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJu
ZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
