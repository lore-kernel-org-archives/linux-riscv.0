Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB21C41535
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u04KjcDWoiTYwJMIoje0LTi/prMj2UalBqDpRhKxbM4=; b=Te2E45Xk/uZrUs
	WhHDXCCmeMWKXHoQ3JJcLyxSYTkQRTseaMDQEy3OQ6VaMuTJgoastrx5mS3NSTr9I4bQqO0jAF3Q4
	VIx/HQ8QUTjHFR9zYUsEHrR89krf7bcIBJMgPpBjto7i3aY5Gkr81OtpPFRLQfUOXqpoCZbKFp1Ua
	NB8L7YkeY8wqoNamAm3HmlPB8GWB2B1OeBBfz5I+Iu2Ko5nTF8qJal9S2RSLdJVydol1GfFwP1hbt
	leFs73GP85X0EN4R0/p1y3f+yjErrqIO5m273BGmSdjTAe7jht05Q/wpyvEEFZLe0NcFgPPiG7DeA
	f73MdE+ODkv9imDPT2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fuz-000fDd-16;
	Tue, 07 Nov 2023 06:50:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fuw-000fCd-17
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 06:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7990FCE0E89;
	Tue,  7 Nov 2023 06:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1B84C433CA;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699339827;
	bh=XYdFuNDBExD8UovptnoGzsnJmhjZb5HPyGAlNA7VRFs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RM/Y3x2uDPkwGkbiEr/Z5tP/zDbfQNPEM4x8GHdHCm7jHiAS65pJs9yvvsaMjdC0c
	 YNk/TW2EQXD/6LPMXg3JWfU0XF9p5LAPuLqVgGUOqY9DFuvhpbshutSLKkApFYWEYM
	 UaC4UiX9dtkKk7QFUYbTVOFcFVZ0l0TQ+Y9Vqip5FORKR3P0HHKxKi0w2N23W6DyAV
	 u+lOkIDk1+v+z5w2l20/tL/7/M/JHx1zvlITikmxPF8+Y/JHHsATBsXI3AFYWkBmQz
	 hfGstvuwYufviRNhQ/Tx4xEMhlB3D7HrnQGRHzzqhzXONPlNPVqf4YTLLo2O84hIvA
	 fz+LwQFxHiqaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0C8BE00094;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: boot: Fix creation of loader.bin
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169933982678.6233.916131299923687483.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 06:50:26 +0000
References: <1086025809583809538dfecaa899892218f44e7e.1698159066.git.geert+renesas@glider.be>
In-Reply-To: <1086025809583809538dfecaa899892218f44e7e.1698159066.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jszhang@kernel.org,
 alexghiti@rivosinc.com, dlemoal@kernel.org, songshuaishuai@tinylab.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_225030_580526_194D8092 
X-CRM114-Status: UNSURE (   9.03  )
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
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMjQg
T2N0IDIwMjMgMTY6NTM6MTggKzAyMDAgeW91IHdyb3RlOgo+IFdoZW4gZmxhc2hpbmcgbG9hZGVy
LmJpbiBmb3IgSzIxMCB1c2luZyBrZmxhc2g6Cj4gCj4gwqAgwqAgW0VSUk9SXSBUaGlzIGlzIGFu
IEVMRiBmaWxlIGFuZCBjYW5ub3QgYmUgcHJvZ3JhbW1lZCB0byBmbGFzaCBkaXJlY3RseTogYXJj
aC9yaXNjdi9ib290L2xvYWRlci5iaW4KPiAKPiBCZWZvcmUsIGxvYWRlci5iaW4gcmVsaWVkIG9u
ICJPQkpDT1BZRkxBR1MgOj0gLU8gYmluYXJ5IiBpbiB0aGUgbWFpbgo+IFJJU0MtViBNYWtlZmls
ZSB0byBjcmVhdGUgYSBib290IGltYWdlIHdpdGggdGhlIHJpZ2h0IGZvcm1hdC4gIFdpdGggdGhp
cwo+IHJlbW92ZWQsIHRoZSBpbWFnZSBpcyBub3cgY3JlYXRlZCBpbiB0aGUgd3JvbmcgKEVMRikg
Zm9ybWF0Lgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBy
aXNjdjogYm9vdDogRml4IGNyZWF0aW9uIG9mIGxvYWRlci5iaW4KICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcmlzY3YvYy81N2E0NTQyY2I3YzkKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91
IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVs
Lm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
