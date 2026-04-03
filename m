Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DDCD730BC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLPI9eZJFGx474ZPXY2C4muyC3BmFRlUFvBqpoT9OCo=; b=4g13R6rQH7vj+m
	I5MDIos8ktdDx3egKlMoGlsJaUhBYEkGiTK2II35Ks1vIsNdkXBHPpf8YyCm11yAQfMrpSCv1OHl0
	cKQVurPkRCajqwjJ5J07pqvFckDs5kgEggX6t0ZkkQJUy9jKXdOk+BBn0fSGE7aF0GIFCZ0i0y1x0
	8hq7C8Z+7Hk5lHv4wqKDH9Z6Gyd3ATtQTnqKAeM7zAJRsgh4L5XCUcqWclSpYW5dirSvcTrldh9OE
	os77bWN8MmLCxLpyCqrcXXLf8CePE7OfeIWiqw21OvC0mnjmYn/avgd6cWcvKGOlhtrrmR4Lfifpj
	ATVdA2hzG98atjd8Vmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZYd-00000001g95-1YEV;
	Fri, 03 Apr 2026 08:07:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZYb-00000001g8x-1mTF
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 08:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B5E960131;
	Fri,  3 Apr 2026 08:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAA7C4CEF7;
	Fri,  3 Apr 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775203628;
	bh=RfaI3vGzyzEw96Vo+Q01uD19LbNi69PFgGAjB9PerQs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Jr3LYFsi3XWX72R3KZNOgiMmsADOMvqQczRemZGYrtJFaccMumyHXE0UkRELzjrU3
	 0K99tX6/mFr2pu0gctKc6hbKtS4pfgdiWKcnM1IrNrWb1UfINnl4p7AA6QVMeqRQ+m
	 BfxBsGA2zVnpFkDwg7kA8bDkBxKQkl0SyWorpHVajiIv6wNcQUzHtnNNsb1uy1EUbg
	 KHPRaoMHIA//dDLHRyXQZqK9jSMN7j0PGSESt1vyr7ZzWMt0N/WwrPgiJC0rNBCTmK
	 gZGqLMrYfcS3oKTd0BsVyvSNHJBbNVOQMAr7CoRqWuG8gIoknvem66llOXE7iwWmNd
	 zNjPE+iSWfhQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCF83809A09;
	Fri,  3 Apr 2026 08:06:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: ptrace: avoid BIT() in UAPI header
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177520361004.788074.16007431158644027406.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 08:06:50 +0000
References: <20260330024248.449292-1-mikey@neuling.org>
In-Reply-To: <20260330024248.449292-1-mikey@neuling.org>
To: Michael Neuling <mikey@neuling.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com,
 thecharlesjenkins@gmail.com, linux-kernel@vger.kernel.org
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
CmJ5IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPjoKCk9uIE1vbiwgMzAgTWFyIDIwMjYg
MDI6NDI6NDggKzAwMDAgeW91IHdyb3RlOgo+IEJJVCgpIGlzIG5vdCBhdmFpbGFibGUgaW4gVUFQ
SSBoZWFkZXJzIOKAlCB0aGUgaW5zdGFsbGVkIGxpbnV4L2JpdHMuaAo+IChVQVBJIHZlcnNpb24p
IGRvZXMgbm90IGRlZmluZSBpdC4gUmVwbGFjZSBCSVQoKSB3aXRoIG9wZW4tY29kZWQKPiAoMVVM
IDw8IHgpIHdoaWNoIGlzIHRoZSBzdGFuZGFyZCBwcmFjdGljZSBmb3IgVUFQSSBoZWFkZXJzLCBh
bmQgZHJvcAo+IHRoZSBsaW51eC9iaXRzLmggaW5jbHVkZSB0aGF0IHdhcyBhZGRlZCBieSBjb21t
aXQgOTg1NDU2MjBiMCAoInJpc2N2Ogo+IHB0cmFjZTogRml4IEJJVCgpIGNvbXBpbGF0aW9uIGlz
c3VlcyIpLgo+IAo+IEZpeGVzOiA5ODU0NTYyMGIwICgicmlzY3Y6IHB0cmFjZTogRml4IEJJVCgp
IGNvbXBpbGF0aW9uIGlzc3VlcyIpCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBOZXVsaW5nIDxt
aWtleUBuZXVsaW5nLm9yZz4KPiBBc3Npc3RlZC1ieTogQ2xhdWRlIE9wdXMgNC42ICgxTSBjb250
ZXh0KSA8bm9yZXBseUBhbnRocm9waWMuY29tPgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1t
YXJ5IHdpdGggbGlua3M6CiAgLSByaXNjdjogcHRyYWNlOiBhdm9pZCBCSVQoKSBpbiBVQVBJIGhl
YWRlcgogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzY0MGRjMDFhOTdmOQoKWW91
IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90Lgpo
dHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
