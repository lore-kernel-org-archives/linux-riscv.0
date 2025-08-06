Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C84C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VHaEMe2llEFdFoBKnpxEg5BzT6CrhPGRHL2EkzG3jk=; b=1M74wB8h68Kp2I
	ZOZz7rpq5cJMz3QFhDYlMDAcp5i1pl8jl0Kgu21fNppxcXqhqckazGliURR883JWYhsZcfoxtscNf
	C/TDVDsft8l2I8UeXeChqAADuyMc8CBbw/5mp0QG0JpeCY8zTvIVNxZor0lCUrluaPzvl+UlCSMSs
	qbuM3BU2xYydXDhWIqgaQp7RER8MNvVRDx/53qVV05ArTXUzefPtrWQCh3rS83f+NEJRNj/CepRNT
	Tzs2vdGT+PYkRGXSCs+dkKwmR9jPzencjO4F/cTxfulZ1DDdA1ZYJvP6OQxaXkS6ABO7wW7NerbZr
	suQUAlngv+W8OlCZzd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhny-0000000FtOp-2832;
	Wed, 06 Aug 2025 17:19:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjs-0000000FsFu-0q0f
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F9C06112C;
	Wed,  6 Aug 2025 17:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F65EC4CEF1;
	Wed,  6 Aug 2025 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500543;
	bh=n4+mBmrM2PXhRcMevexmYO4o9PH4fP3pZStIuAV55rc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=icnaqOJdzQTMO/kFFBnE2vk1OzKlWqDAD1c+GNsy3zvLHBprU5WWiD5sWUvI8lJoE
	 zK8aVccyma1F5btkyyx6/97UR6HLNH2AHk5E/1YW9AfgB9M2BVVCYnr+r3NWeR2M3I
	 EVrzV0AgRsmSJKCI5hGOsQHwLg4XFYWHhTKYih0zDkipC90tMv5oQXnffO3KUUaKk4
	 IZds+s9kBZ2VHYzCPziDNywtDDQF9cYVR3OL6L1dEgHhjSUxd1aVKuHj5C/+HgsGvD
	 J8sB8AQeFdIkq4R0gEem8521skbb/U0RLD4yEVTZbJUZC6y1hLZOTix3lEDGqlLPjL
	 lSNUGeL36Q+IQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D33383BF63;
	Wed,  6 Aug 2025 17:15:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: cpufeature: add validation for zfa, zfh and zfhmin
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055687.2863135.4984020591537860914.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:56 +0000
References: <20250527100001.33284-1-cleger@rivosinc.com>
In-Reply-To: <20250527100001.33284-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr
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
eHQpCmJ5IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT46CgpPbiBUdWUs
IDI3IE1heSAyMDI1IDEyOjAwOjAwICswMjAwIHlvdSB3cm90ZToKPiBUaGVzZSBleHRlbnNpb25z
IGRlcGVuZHMgb24gdGhlIEYgb25lLiBBZGQgYSB2YWxpZGF0aW9uIGNhbGxiYWNrCj4gY2hlY2tp
bmcgZm9yIHRoZSBGIGV4dGVuc2lvbiB0byBiZSBwcmVzZW50LiBOb3cgdGhhdCBleHRlbnNpb25z
IGFyZQo+IGNvcnJlY3RseSByZXBvcnRlZCB1c2luZyB0aGUgRi9EIHByZXNlbmNlLCB3ZSBjYW4g
cmVtb3ZlIHRoZQo+IGhhc19mcHUoKSBjaGVjayBpbiBod3Byb2JlX2lzYV9leHQwKCkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IAo+
IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSByaXNjdjogY3B1ZmVh
dHVyZTogYWRkIHZhbGlkYXRpb24gZm9yIHpmYSwgemZoIGFuZCB6ZmhtaW4KICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8zZGUyOTM1MmFhZWIKCllvdSBhcmUgYXdlc29tZSwgdGhh
bmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mu
a2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
