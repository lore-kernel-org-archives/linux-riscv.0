Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED911C71133
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xflDsmK/6AE6b16N49LzBRB1OuRfsmmcDhdmMjRr6I=; b=lUJDX0v0hVWU8K
	h6IT78N7XFZmq/437Pe79YZses2SjcwEuWB8PAgGBGLQwtzmqtVhZ+mkhcWIF7kVv5u5MFSLz+lQ5
	tbDMwGvJKNrXiDFVspl/TG8YfE6JaytCkp7HXLCCaNxTRMzfk23CmYaWXM0eE4TowwuAl0HeiqhwC
	O2MkQLd0xyDvtWCXaT5y+OmfJA41yRQwCmuIVDWNutTan7hyaadKq7XqxxVtiz6udFAcXAdm1utiK
	o/7hjWvA7yW+dY6JTjD3n9CYJxmhiPzOzJaU28CmhTcHkG8Ug4p5bX/fPKsKHaVC/EouqfhdXJGQ/
	ZnTNDSw69PWl/P/9Ta6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57N-00000007z6W-2lIs;
	Tue, 10 Jun 2025 19:58:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pb-00000007T8K-3xfe;
	Tue, 10 Jun 2025 16:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FD5FA5149B;
	Tue, 10 Jun 2025 16:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2981C4CEF0;
	Tue, 10 Jun 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572891;
	bh=ckC6thOTdPiUGu5TKE27pUsN8vQouOQ2AEYzFaexYD4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EPOuoFId290O15qzATYhPnK7rUONYkV6lL/8chMjOVuZC9s8VmPEXY/Lksgfzrfl7
	 57hyVe3xyAyEq5JG6wEKdxNV0UFFkhwJ1i0hZQKBJ/CZ9ASszlaj+jKngnsM24GHxV
	 mWa3op9unMWMA5/bDrI1t7oJWv7IqMxNxmiB3XW5Om0t1qKk2p3TI/iz1Z0gGZErUd
	 g68pnaTddVz541C8x5SCft5DYa25RzbIhTBqzSliN3vqoZuY6MjiaZBywYmDkUwhyb
	 fOzAGVXQ+TzYNv2X6IZgs/DgcGOlaRbKjbXDM2Zb5IT5W5Gqnr+nb3YcqvJ6ZKcfOq
	 +xKJaaLUdXnMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD7339D6540;
	Tue, 10 Jun 2025 16:28:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: lock the correct mp_state during reset
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957292126.2454024.2746700614044204811.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:41 +0000
References: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
To: =?utf-8?b?UmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, yongxuan.wang@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092812_042908_EEA018C3 
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
CmJ5IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+OgoKT24gRnJpLCAyMyBNYXkgMjAy
NSAxMjo0NzoyOCArMDIwMCB5b3Ugd3JvdGU6Cj4gV2UncmUgd3JpdGluZyB0byAqdG1wLCBidXQg
bG9ja2luZyAqdmNwdS4KPiAKPiBGaXhlczogMjEyMWNhZGVjNDVhICgiUklTQ1Y6IEtWTTogSW50
cm9kdWNlIG1wX3N0YXRlX2xvY2sgdG8gYXZvaWQgbG9jayBpbnZlcnNpb24iKQo+IFNpZ25lZC1v
ZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGgg
bGlua3M6CiAgLSBSSVNDLVY6IEtWTTogbG9jayB0aGUgY29ycmVjdCBtcF9zdGF0ZSBkdXJpbmcg
cmVzZXQKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy83OTE3YmUxNzA5MjgKCllv
dSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4K
aHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
