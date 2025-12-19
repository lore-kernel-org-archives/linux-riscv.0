Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5857FD767DC
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEZ7VktTvF3kQUReUIuaxSN1cgNJH/PuNsC1D10nYw0=; b=PVaTYgpCcKaRgg
	wRtALD5AR/iT/1fbERFBzTRRVB2BpeVOlPqkDRzq2pSRO4zBMFOYVNqhWRASsdDRa7q4hgn1odB3X
	FkHykl8dQ6/NVAGBVOg7AnvenQQ5Ngb2bZbRXsuLaS6hrlDSpvPC6/hMv5Ij/U2fZxkt9MqXwiR1p
	XVzduazmK4AvXm30O5uHi9sgBSiUKqYKI1FZvFwFQG2vhxKD1tsAT2IbDEdXHXFYMwNEp+7EnYr+d
	2jdLXVBUzuyrHcNtLeMpnoh7Dcef9z3PWPIlGCf1sjlB6aP4H7K5reRglETvhu1RQ+SStnYHSNcLx
	X2dNEUI6n9OjbJP6S69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYdB-0000000ABo6-48nH;
	Fri, 19 Dec 2025 11:26:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYd9-0000000ABnh-3Nn3
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4C8660008;
	Fri, 19 Dec 2025 11:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44492C116C6;
	Fri, 19 Dec 2025 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766143601;
	bh=emCDmsE3rurjfQPDmhdnWGfjUOSO12N/ORlhonGNo20=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhboe+vqiisKPjFv6ErbJkTs47pFlFEKevXBD2LojW0gPHaQO1TTcsMF41eHsFJSs
	 7dkcSHjrzC0C4kxI7AafLr95Q2H9QXR/iR2630QyiRnaHmEmaNzVLW4FdLMQ+uq3Jn
	 OVoAmYuSsLD5JsdqkmPwRyxRgoqCT4NCeKdhpgpj0A1kwg60A/XkmaExRKBqXDnyXy
	 6JRP3uuRrQZhEGCz2HlA5dJci8wWDrPr+JIYx/z82R7urzc4ymXBIkWWWwgNc28vpW
	 IK2+GIV1/WFBMAV4vuDH/D+f+svrmo1k/Jf1YlIU0C93UeoxgVgiKGtIEfI3eCy/ja
	 R4uC+abCEUFVA==
Date: Fri, 19 Dec 2025 11:26:34 +0000
From: Lee Jones <lee@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, dlan@gentoo.org,
	elder@riscstar.com, andi.shyti@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <20251219112634.GJ9275@google.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
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

SGkgS29uc3RhbnRpbiwKCj4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gcmlzY3YvbGludXgu
Z2l0IChmaXhlcykKPiBieSBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9v
dGxpbi5jb20+Ogo+IAo+IE9uIFR1ZSwgMTggTm92IDIwMjUgMTQ6MDg6MDQgKzA4MDAgeW91IHdy
b3RlOgo+ID4gU2luY2UgUDEgS2NvbmZpZyBkaXJlY3RseSBzZWxlY3RzIEsxX0kyQywgYWZ0ZXIg
dGhlIEkyQyBJTENSIHBhdGNoIHdhcwo+ID4gbWVyZ2VkLCB0aGUgZHJpdmVyIHdvdWxkIGZhaWwg
WzFdIHdoZW4gQ09NTU9OX0NMSyB3YXMgbm90IHNlbGVjdGVkLgo+ID4gCj4gPiBUaGlzIHNlcmll
cyBmaXhlcyB0aGUgUDEgS2NvbmZpZyBhbmQgcmVzZW5kcyB0aGUgSTJDIElMQ1IgcGF0Y2goVGhp
cwo+ID4gcGF0Y2ggaGFzIHJldmVydGVkIGJ5IG1haW50YWluZXIgWzJdKS4KPiA+IAo+ID4gTm93
LCBQMSBLY29uZmlnIHBhdGNoIGhhcyBiZWVuIG1lcmdlZFszXSwgc28gSTJDIElMQ1IgcGF0Y2gg
Y2FuIGJlCj4gPiBtZXJnZWQgYXMgd2VsbC4KPiA+IAo+ID4gWy4uLl0KPiAKPiBIZXJlIGlzIHRo
ZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4gICAtIFt2MywxLzRdIGkyYzogc3BhY2VtaXQ6IGNvbmZp
Z3VyZSBJTENSIGZvciBhY2N1cmF0ZSBTQ0wgZnJlcXVlbmN5Cj4gICAgIChubyBtYXRjaGluZyBj
b21taXQpCj4gICAtIFt2MywyLzRdIHJ0Yzogc3BhY2VtaXQ6IE1GRF9TUEFDRU1JVF9QMSBhcyBk
ZXBlbmRlbmNpZXMKPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzE2YmQ5NTRj
OTMzNgo+ICAgLSBbdjMsMy80XSByZWd1bGF0b3I6IHNwYWNlbWl0OiBNRkRfU1BBQ0VNSVRfUDEg
YXMgZGVwZW5kZW5jaWVzCj4gICAgIChubyBtYXRjaGluZyBjb21taXQpCgo+ICAgLSBbdjMsNC80
XSBtZmQ6IHNpbXBsZS1tZmQtaTJjOiBhZGQgZGVmYXVsdCB2YWx1ZQo+ICAgICAobm8gbWF0Y2hp
bmcgY29tbWl0KQoKSSB3YXMganVzdCBhYm91dCB0byBzZW5kIGFub3RoZXIgc25vdC1vLWdyYW0g
YWJvdXQgcGVvcGxlIHBpY2tpbmcgdXAKcGF0Y2hlcyB3aXRob3V0IHRoZSBjb3JyZWN0IEFja3Ms
IGJ1dCBJIGp1c3QgcmVhbGlzZWQgdGhpcyBpcyB0aGUgc2FtZQpQYXRjaHdvcmsgaXNzdWUgd2Ug
c3Bva2UgYWJvdXQgYSBjb3VwbGUgb2Ygd2Vla3MgYWdvLgoKVGhpcyBmb3JtYXR0aW5nIGlzIHZl
cnkgY29uZnVzaW5nLCBzaW5jZSBhdCBmaXJzdCBibHVzaCBpdCBsb29rcyBhcwp0aG91Z2ggdGhl
IHdob2xlIHBhdGNoLXNldCB3YXMgYXBwbGllZC4KClBsZWFzZSBjYW4gd2Ugb25seSBsaXN0IHBh
dGNoZXMgdGhhdCB3ZXJlIG1lcmdlZD8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
