Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AE6CED25D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 03:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Icqw4BKOOdoXlyu4jx74vCAe5/nA7iZYH7wXUZT2CE=; b=swlcLRIWBlyspT
	4AQbHnrtoc1adeJ6kd/YuSUpEdDbIHaDRRxNzZlSar0qY5U3vVsiaBN14S83p3Cv0vz7oF4xV5NEP
	b+cddTIpVa9Zq9/XHOXetdG/ZjWujK+ttG+b5FNwBQgJL00xaTpy8H3xVliBhvWatxMgqqSVRnCyF
	YQgzBKQqoS9Zn3X02o6Q6p8JRV2GYScD6dwDORtsjAj+W3ajVtGh/DN4KCdAFg+fzBmlti/1QkntZ
	4Wy4pzQCZ+mb9Bi1HN3aOlPLU99Er14r0x2VI+O3PkOAjFiSrqAo8DwHnxevmMeFak9WALastf5mu
	qoC6wx2/t8LoVzYH/ZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0vg-00000004Otr-2bYX;
	Tue, 08 Oct 2024 03:30:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0ve-00000004Ot8-1Eqw
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 03:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB1CBA42649;
	Tue,  8 Oct 2024 03:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F478C4CECC;
	Tue,  8 Oct 2024 03:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728358229;
	bh=PSOIf+TyBQF57TpOyMNELr/Rx8demt9hWhySbu/LsRs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IxL/dM75Cv3V8A4ljrby9r3ouPy/31wVFYylG13rTWQHl8hVki9A/Ci9XSb2BzScJ
	 QyJ2jbL+H1YAoOhxT1vcMdctzCMcQTdxuwOtl5qgGrXaDgpB+0lDKxoPYW6I1tInK2
	 7ZkCy0LUlNo8zxRbA9tBUcMEnYVnFEAcOFLYICYqpaJG5AfNgHWE4BIuu0qQGMvVFQ
	 uQggEH/s9sgD68hA2f7XTnizUeu9eeqwNKw7M8VuonGcUqfFycg8RkRPKmK694kxdo
	 YAh/orE4txks1PLfJmBRkGCcyeS+/NktocqUYPrqTWNKFSF4P9YyBJQGW5TtzXAayN
	 mPAvrRWAKWe5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BFB3803262;
	Tue,  8 Oct 2024 03:30:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172835823300.66789.3704854116445399222.git-patchwork-notify@kernel.org>
Date: Tue, 08 Oct 2024 03:30:33 +0000
References: <20240927131355.350918-1-bjorn@kernel.org>
In-Reply-To: <20240927131355.350918-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, bjorn@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 charlie@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_203030_419133_29FF3E25 
X-CRM114-Status: UNSURE (   7.73  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLW5leHQuZ2l0IChtYXN0
ZXIpCmJ5IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+OgoKT24gRnJpLCAyNyBT
ZXAgMjAyNCAxNToxMzo1MiArMDIwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IGxpYmJwZiBkb2VzIG5vdCBpbmNsdWRlIHRoZSBwZXIt
YXJjaCB0b29scyBpbmNsdWRlIHBhdGgsIGUuZy4KPiB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUu
IFNvbWUgYXJjaGl0ZWN0dXJlcyBkZXBlbmQgdGhvc2UgZmlsZXMgdG8KPiBidWlsZCBwcm9wZXJs
eS4KPiAKPiBJbmNsdWRlIHRvb2xzL2FyY2gvJChTVUJBUkNIKS9pbmNsdWRlIGluIHRoZSBsaWJi
cGYgYnVpbGQuCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAt
IFticGYtbmV4dCwxLzJdIGxpYmJwZjogQWRkIG1pc3NpbmcgcGVyLWFyY2ggaW5jbHVkZSBwYXRo
CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzcxMGZiY2E4MjBjNwog
IC0gW2JwZi1uZXh0LDIvMl0gc2VsZnRlc3RzOiBicGY6IEFkZCBtaXNzaW5nIHBlci1hcmNoIGlu
Y2x1ZGUgcGF0aAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy8xOTA5
MGYwMzA2ZjEKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwg
SSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3Qu
aHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
