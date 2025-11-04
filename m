Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E138CCF9F8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 00:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIZTBtb4N3+ZYe2J57IM34RVub2fK1yChtuAO3HB0+Q=; b=onIuO/QjAKyq8QkpesOFNPKnTB
	3sFkjmYlwg7+EOSaN5DgB9NqPEKJnVkxNAg9VqWbkLn5a6QzZDGZq98E0k69wOiXKvFB6TY35t/YA
	IJZW6DhTXRkcd/AoBYROD4kKQTzyD+Mp4qqwXDjr+lcI6o3G3qf7vsQGLbXz6jA1yu5bfEKpOlJDm
	slrY7974Uwh6mUmTsUErytj0ueKb7ry5PK63GTiBxR9h0UOBMuabJMvd1vUfX/es7frqZZ1o8+gaJ
	Xs0j7sCGU7rdWpZGeNWvYpre7IevB30mX5Uh+SeQBO10L8S8I/GsPKn+Wtqz9VEcUfViro0zrxblz
	qbozcLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4uy-0000000Aqil-2DPs;
	Tue, 04 Nov 2025 00:29:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4ux-0000000Aqif-1zgB
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 00:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91898601D8;
	Tue,  4 Nov 2025 00:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172CBC4CEE7;
	Tue,  4 Nov 2025 00:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762216138;
	bh=tRnh6hweO+RMG4uAocwBUQlrYyZEJFmZtd+kmv+UXAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMssr6pb/eeudzEMibe0Ra49in/PvvVe4shsF4JuYaElRnS6HWIpedVQbEk7x+t3b
	 fXISfnt3KIXEu5l4d3wBgCYse9n6WRcjTUKz0cImFoLDTB5NWYFq9J3+ibtMaZohTf
	 XZz8hALd0sKLFcpSHoP32ayDpIkAfyyPskrZyZdP4TQMXcut9iBLiX+CMJAZTrPHRr
	 yqbNHZTVCr16iTwEOLXI9MBm9bZoDKPELyhTB2Ujy8JcNyNZEosFI0CqqwB5ZuvGch
	 vWbzHRi3X14GbMtoau+S8tNQXLiB8+GPYyo4Y0bPAGPlOcsBIChVynSMOZW44hxslx
	 JLTiiZkpbprbw==
Date: Mon, 3 Nov 2025 19:28:56 -0500
From: Sasha Levin <sashal@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, fustini@kernel.org,
	guoren@kernel.org, wefu@redhat.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.17] pmdomain: thead: create auxiliary device
 for rebooting
Message-ID: <aQlIyJ5-Tw2qZR4b@laps>
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-69-sashal@kernel.org>
 <04c400064452a5afa36941a57ea0d620896878f0.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04c400064452a5afa36941a57ea0d620896878f0.camel@icenowy.me>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMTAsIDIwMjUgYXQgMTI6MDI6NDFBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPuWcqCAyMDI1LTEwLTA55pif5pyf5Zub55qEIDExOjU1IC0wNDAw77yMU2FzaGEgTGV2
aW7lhpnpgZPvvJoKPj4gRnJvbTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4+Cj4+
IFsgVXBzdHJlYW0gY29tbWl0IDY0NTgxZjQxZjRjNGFhMTg0NWVkZWVlNmJiMGM4ZjJhNzEwM2Q5
YWEgXQo+Cj5UaGlzIGNvbW1pdCBzZWVtcyB0byBiZSBub3QgYmFja3BvcnRhYmxlIC0tIGl0IGRl
cGVuZHMgb24gdGhlIG5ldwo+ZHJpdmVyIGZvciB0aGUgYXV4aWxpYXJ5IGRldmljZS4KPgo+SSBz
dWdnZXN0IG5vdCB0byBiYWNrcG9ydCBpdC4KCkRyb3BwZWQsIHRoYW5rcyEKCi0tIApUaGFua3Ms
ClNhc2hhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
