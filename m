Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C4AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 05:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAbo2S+kHAU561lTjKK/dYGxHYbejNBleMb5zUC8e6E=; b=a2Y9ycYD8TQNIp
	8O3x1u/UQe7+SJBymBv92dbIbnF7kYLthSaRFgld5V8XAd34cKIdpn4D8Je8JOj5sgSQ7y9qFlB7M
	o/LibDUJru8jlR1eayjUiZ5vNqQ9HtoYBpcT69RQn730WgAn6tYAHwAk4F5mDkrBUBe+Ed31lZ+YF
	KrtnYz+2JdRfRZxJ8cwRZPbsBzfQYaQyhdMSMXjwV/J1uBt73K2hiDckV2ZB6XkzjVWB+TcP0MxK3
	Nu+4vc8KAqcV7oVgiUzpdn6roI/JuM5sgHKgNnP4w6p2t0p/HZXy7r0mFuT89L4QBsEg3Q8vw3K3x
	VmC1F4pfysmvIOG5cimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0FzI-00DZ7x-BU; Wed, 30 Nov 2022 05:50:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Fz8-00DZ1y-Ne
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 05:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A516F619D7;
	Wed, 30 Nov 2022 05:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14FE0C433C1;
	Wed, 30 Nov 2022 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669787416;
	bh=mWapkiqeTyhlxtRKV32R7knpZ7vDUmMOPyBjveYsR+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Av78yeFmfoNfcMdGgqwR32cOMPacIyY0KesjwoFf/ydY6U13ddUEDf2bwaLb94WOV
	 kO+bbyWiJ4tfLwP08lIt5TjX3qCMvMAOaipihb59G0p9jg0T7oYFPBdJd+L3WD+8S7
	 s/oOMpFD2Jb7hgEDM+Vi6QwtZdLmFNhPn/DuDqUwa0tB4QvGKaCwl9qLQRkGglzpY+
	 YTiRBpwouNVLRuOJv+AKNhHAQ6zagIQfma3orWDLEiwwwlANZKLf6oZ6XPIr13zjDk
	 5k97t/Htyhx+EEs65WlkM1NJajxP5GFqEsZiNSfv0ERmLVHFvcwYZ7QZWxxg7PA9R1
	 SGCjgUhK1ipQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE4EFE21EF2;
	Wed, 30 Nov 2022 05:50:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: Proper page permissions after initmem free
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166978741597.2406.14892412978128239301.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 05:50:15 +0000
References: <20221115090641.258476-1-bjorn@kernel.org>
In-Reply-To: <20221115090641.258476-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel@sholland.org, bjorn@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_215018_829382_67D2608D 
X-CRM114-Status: GOOD (  11.18  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMTUgTm92
IDIwMjIgMTA6MDY6NDAgKzAxMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPiAKPiA2NC1iaXQgUklTQy1WIGtlcm5lbHMgaGF2ZSB0aGUga2Vy
bmVsIGltYWdlIG1hcHBlZCBzZXBhcmF0ZWx5IHRvIGFsaWFzCj4gdGhlIGxpbmVhciBtYXAuIFRo
ZSBsaW5lYXIgbWFwIGFuZCB0aGUga2VybmVsIGltYWdlIG1hcCBhcmUgZG9jdW1lbnRlZAo+IGFz
ICJkaXJlY3QgbWFwcGluZyIgYW5kICJrZXJuZWwiIHJlc3BlY3RpdmVseSBpbiBbMV0uCj4gCj4g
QXQgaW1hZ2UgbG9hZCB0aW1lLCB0aGUgbGluZWFyIG1hcCBjb3JyZXNwb25kaW5nIHRvIHRoZSBr
ZXJuZWwgaW1hZ2UKPiBpcyBzZXQgdG8gUEFHRV9SRUFEIHBlcm1pc3Npb24sIGFuZCB0aGUga2Vy
bmVsIGltYWdlIG1hcCBpcyBzZXQgdG8KPiBQQUdFX1JFQUR8UEFHRV9FWEVDLgo+IAo+IFsuLi5d
CgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjJdIHJpc2N2OiBtbTogUHJv
cGVyIHBhZ2UgcGVybWlzc2lvbnMgYWZ0ZXIgaW5pdG1lbSBmcmVlCiAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3Jpc2N2L2MvNmZkZDVkMmY4YzJmCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlv
dSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5l
bC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
