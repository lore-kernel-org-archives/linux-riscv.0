Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA4ECD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrY6w13L6/e9KDtiBKMr8Ivh8aBfurII99t/ozmjoak=; b=s7537QPh8DVw1Y
	YICNlCZu1rFbVO6vwLgkBTkHt+uoYuhPqGW0M5JoMRTwjE4UkU7OIyd3O1XLy8PQJCRR/XXvsj34i
	K22N+VXo5Slv0clCvoxQcHt19uIzqWKqRMKWsvJSEdQSmOv9BKNUYr4wg/Nm8iSmovNunJwj2UPnf
	aDVoNsL9aLxYVga/wGXSNzxUR6npC8vdv8SGiW/l5hIKB52+6tmnSWumAw/9p0EiMBRrBXC836THG
	+IAejNmsnAxJkDiG0YyD6YVz+EYo/DJy5Qp4KmqFj+6255EuP8emN9AmnDQDNwWHY90Rn2XDdBho7
	5QYKDJ5n8kykiU73xgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwx-000000045Gc-02ND;
	Thu, 04 Apr 2024 19:40:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwq-000000045DW-1xq3
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41BFCCE344D;
	Thu,  4 Apr 2024 19:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 410A8C433A6;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712259629;
	bh=v3DmZ6IXGPe5rmr1R70F45K790DmFZH1xRFy3xse5qQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P/nMSGiT2HZuY4F1eJVEGD4tL/q3+PDK4EubRDWddlO5sk06QgyGOiMuDn/QK6mNZ
	 ar1kD8ZdsWSQPKWgYuoRJxBv9FY6RKMOIhh5B4XCisaUpHnvyn/gpjmcmEtX3pMllN
	 MlZUN/l+tdV7v0BE7Ru6EY8xLS7CZOt1HtgV347mtBXrHDYqBj8hQtPOJKirlfnx0E
	 75HIGbWo04ElX3Ni0XHs2SO7crjCajopSwv9spXYFq7Flxvw0c/yDgFx07aM7/6GyM
	 ORgy5PExAz9/begalm0nZxRMMahZoXOARzuNMIR/4yfvhX9K5fT2Kbcq1/1qFOS4l7
	 Rd0SdaoU/azMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A674D84BB1;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix vector state restore in rt_sigreturn()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171225962916.17194.17766920994807052898.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 19:40:29 +0000
References: <20240403072638.567446-1-bjorn@kernel.org>
In-Reply-To: <20240403072638.567446-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 bjorn@rivosinc.com, conor.dooley@microchip.com, heiko@sntech.de,
 vincent.chen@sifive.com, ben.dooks@codethink.co.uk, greentime.hu@sifive.com,
 ancientmodern4@gmail.com, jerry.shih@sifive.com, nick.knight@sifive.com,
 linux-kernel@vger.kernel.org, vineetg@rivosinc.com, charlie@rivosinc.com,
 vgupta@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124032_726516_1308D1D0 
X-CRM114-Status: UNSURE (   8.35  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgIDMgQXBy
IDIwMjQgMDk6MjY6MzggKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgUklTQy1WIFZlY3RvciBzcGVjaWZpY2F0aW9uIHN0
YXRlcyBpbiAiQXBwZW5kaXggRDogQ2FsbGluZwo+IENvbnZlbnRpb24gZm9yIFZlY3RvciBTdGF0
ZSIgWzFdIHRoYXQgIkV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcwo+IGFsbCBjYWxsZXIt
c2F2ZWQgdmVjdG9yIHJlZ2lzdGVycyAodjAtdjMxLCB2bCwgdnR5cGUpIGFuZCB2c3RhcnQgdG8K
PiBiZWNvbWUgdW5zcGVjaWZpZWQuIi4gSW4gdGhlIFJJU0MtViBrZXJuZWwgdGhpcyBpcyBjYWxs
ZWQgImRpc2NhcmRpbmcKPiB0aGUgdnN0YXRlIi4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3Vt
bWFyeSB3aXRoIGxpbmtzOgogIC0gcmlzY3Y6IEZpeCB2ZWN0b3Igc3RhdGUgcmVzdG9yZSBpbiBy
dF9zaWdyZXR1cm4oKQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2MyN2ZhNTNi
ODU4YgoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFt
IGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1s
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
