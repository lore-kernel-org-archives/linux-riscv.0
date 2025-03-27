Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F6C3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBKYXcsm78HDOndt5LXgHLTGxMccza47n/YRx+HVudk=; b=fbXMqwt4JrJIs9
	g2+vCfJpmYmdhoMZBXIrQT3/5Yr0+xKm+RU5qJqPcR+qetV23T+1Uqi1Nuamds1/R98d1A3R7ffiE
	DZ2u15HKArQWDjNPYqzZj4gBJ3khMgqYRCRPRE6IA50uBdFvgYcy3gOU2XVXDZqvQ9NIB8CKEPuE6
	8dGuEsyh2zwJJHBluHX2Tg3IHwkYhJz6xE67nlJVkpYsN4KqYUNX5HPOdtoV2kBachqM+oy+HgrFJ
	HPtKc0B/mRkDiMvuxycztsEIojS/hgB5S9H1ENjlnSGMGNfzzf6VWAZ//BPwmJLi3Jz7esw7zjKAt
	gY4TULW2sL6il20TA//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqd-0000000A42f-46c0;
	Thu, 27 Mar 2025 03:24:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqZ-0000000A3zh-2gOh
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03F92A41ABB;
	Thu, 27 Mar 2025 03:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2F5C4CEDD;
	Thu, 27 Mar 2025 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045838;
	bh=rDzVJYFPmMuRVaHSz+QupgM1qeXPy7Nb+/Tbc2Rhldg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QkLUdOa1ATbh3FtnKXk+Lo473eMBx6fasoENc7R8LNZ7TPkSlPbJTy5Pk6xGYIX3j
	 ZRKtj477s8Irm7LzBWMaD5eVyD+plYfOA+XmbEe6p5AVuu978szhMGD0udzFl+bBg+
	 ahGi0C+ywgvBmdr2gyTK2GfZJ+fSGTVDqhX01dwc2KV/U+8SShc+ZqIcFbHuNbMXwC
	 hvhujyT/byymMdv9pe8/cP0PEUxo2bmfTvr+qVp9KHrtze7euvXLOL7GeCjEl+S7c3
	 BIUDMMhwTFiaEnF07ZF5Qu58h4IDSiLwDh5lh4/cBL6PZbRZXd/uowHDXmDtfKjcqU
	 ZuItJ0l5e+v8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D98380AAFD;
	Thu, 27 Mar 2025 03:24:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: Don't use %pK through printk
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304587475.1549280.18045684973860315790.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:34 +0000
References: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
In-Reply-To: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202359_764586_986B7D34 
X-CRM114-Status: UNSURE (   7.40  )
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
IDE3IEZlYiAyMDI1IDA4OjM3OjU4ICswMTAwIHlvdSB3cm90ZToKPiBSZXN0cmljdGVkIHBvaW50
ZXJzICgiJXBLIikgYXJlIG5vdCBtZWFudCB0byBiZSB1c2VkIHRocm91Z2ggcHJpbnRrKCkuCj4g
SXQgY2FuIHVuaW50ZW50aW9uYWxseSBleHBvc2Ugc2VjdXJpdHkgc2Vuc2l0aXZlLCByYXcgcG9p
bnRlciB2YWx1ZXMuCj4gCj4gVXNlIHJlZ3VsYXIgcG9pbnRlciBmb3JtYXR0aW5nIGluc3RlYWQu
Cj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDExMzE3MTczMS1k
YzEwZTNjMS1kYTY0LTRhZjAtYjc2Ny03YzcwNzA0NjgwMjNAbGludXRyb25peC5kZS8KPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25p
eC5kZT4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gcmlz
Y3Y6IG1tOiBEb24ndCB1c2UgJXBLIHRocm91Z2ggcHJpbnRrCiAgICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3Jpc2N2L2MvZWI4ZGI0MjFjZTgzCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEK
LS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
