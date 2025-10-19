Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79320CCD195
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG8Rv2AkhjE0yj0wUjBGxmKsOVWjSpIzrJguuHzzV8w=; b=D1dFOOqJYnOitq
	n2wDLhZDoNYW8cmqoB+1VCUoatrG3T2NtK2tWgrCi0Ted9vSZmeFr4lQoe675T/+TJJObLmVnAwyr
	kHOyxApGZPl+wLVPuZYHOF5Rp44U/Fdoj3KmWdA/FvBgPRishaDn3ekosOhWd9vLni7c/zI9nomeJ
	DBPFi2uu8ourF2OJqOYc1aT5139aDF3xpNhlQvnLLuOEzdbgjxeqzZ4DP9SGRZE43sspm/X+HJ84U
	xrDQXXZINvk6d3lJ5wuQ+r4As8TOG4mBWLFioIpWu13KPnI0CutlunX4B/Ggcd/qfLO7KYftaVMrt
	NuKWcoFHs5hlff8go3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWDk-0000000BCEE-0Q8e;
	Sun, 19 Oct 2025 16:25:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWDg-0000000BCDU-3FdU;
	Sun, 19 Oct 2025 16:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C9C944476;
	Sun, 19 Oct 2025 16:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7610C4CEE7;
	Sun, 19 Oct 2025 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760891119;
	bh=AqeDRU1eKSmQXUiCZ7pwi0Bd8BGGXBM48O4Ou5Xs+sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2EokHRLd68kZBeDRRdhxJ1rDW2elFlh8EnkyaTJnHSCfqkoujh7BohpZc68H407D
	 6bUXmBrNoq7Ww0jTMF1QQwGeMEpfXz0BrGd0k+T8PJbgWDRrKfDcnhwumf2RRZV3Tp
	 M1nqa0cZRI89OYqyvuvRWeFwctcqJgDf9nK43gHk2G3mRl3usq7ey6ziFEp5oxVwef
	 8ha/lyEniLuE2fegL9ApZJO+lst38G6OUrwAE6O/NFZ/Mz1YaBFZd+ociss1pkQv9d
	 0MzWPAoBwoLUZ5+ACw5ohULeXVrjB6+3sdA7UiNPKC79wDn4zGf7+6LA7UKkZ5vUk5
	 GbYsQCDUj5ADg==
Date: Sun, 19 Oct 2025 09:23:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Message-ID: <20251019162346.GB1604@sol>
References: <20241202010844.144356-16-ebiggers@kernel.org>
 <20251019060845.553414-1-safinaskar@gmail.com>
 <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_092520_876965_13F3EC67 
X-CRM114-Status: GOOD (  22.04  )
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

T24gU3VuLCBPY3QgMTksIDIwMjUgYXQgMTE6MTA6MjVBTSArMDMwMCwgQXNrYXIgU2FmaW4gd3Jv
dGU6Cj4gT24gU3VuLCBPY3QgMTksIDIwMjUgYXQgOTowOeKAr0FNIEFza2FyIFNhZmluIDxzYWZp
bmFza2FyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPjoKPiA+ID4gTm93IHRoYXQgdGhlIGxvd2VyIGxldmVsIF9fY3JjMzJjX2xlKCkg
bGlicmFyeSBmdW5jdGlvbiBpcyBvcHRpbWl6ZWQgZm9yCj4gPgo+ID4gVGhpcyBwYXRjaCAoaS4g
ZS4gMzhhOWE1MTIxYzNiICgibGliL2NyYzMyOiBtYWtlIGNyYzMyYygpIGdvIGRpcmVjdGx5IHRv
IGxpYiIpKQo+ID4gc29sdmVzIGFjdHVhbCBidWcgSSBmb3VuZCBpbiBwcmFjdGljZS4gU28sIHBs
ZWFzZSwgYmFja3BvcnQgaXQKPiA+IHRvIHN0YWJsZSBrZXJuZWxzLgo+IAo+IE9vcHMuIEkganVz
dCBub3RpY2VkIHRoYXQgdGhpcyBwYXRjaCByZW1vdmVzIG1vZHVsZSAibGliY3JjMzJjIi4KPiBB
bmQgdGhpcyBicmVha3MgYnVpbGQgZm9yIERlYmlhbiBrZXJuZWwgdjYuMTIuNDguCj4gUHJldmlv
dXNseSBJIHRlc3RlZCBtaW5pbWFsIGJ1aWxkIHVzaW5nICJtYWtlIGxvY2FsbW9kY29uZmlnIi4K
PiBOb3cgSSB0cmllZCBmdWxsIGJ1aWxkIG9mIERlYmlhbiBrZXJuZWwgdXNpbmcgImRwa2ctYnVp
bGRwYWNrYWdlIi4KPiBBbmQgaXQgZmFpbGVkLCBiZWNhdXNlIHNvbWUgb2YgRGViaWFuIGZpbGVz
IHJlZmVyZW5jZSAibGliY3JjMzJjIiwKPiB3aGljaCBpcyBub3QgYXZhaWxhYmxlLgo+IAo+IFNv
LCBwbGVhc2UsIGRvbid0IGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gc3RhYmxlIGtlcm5lbHMuCj4g
SSdtIHNvcnJ5LgoKUmlnaHQsIHRoaXMgY29tbWl0IHNpbXBsaWZpZWQgdGhlIENSQyBsaWJyYXJ5
IGRlc2lnbiBieSByZW1vdmluZyB0aGUKbGliY3JjMzJjIG1vZHVsZS4gIGluaXRyYW1mcyBidWls
ZCBzY3JpcHRzIHRoYXQgaGFyZC1jb2RlZCB0aGUgYWRkaXRpb24Kb2YgbGliY3JjMzJjLmtvIGlu
dG8gdGhlIHJhbWRpc2sgKHdoaWNoIEkgZG9uJ3QgdGhpbmsgd2FzIGV2ZXIgbmVjZXNzYXJ5Cmlu
IHRoZSBmaXJzdCBwbGFjZSwgdGhvdWdoIGl0IGRpZCB1c2VkIHRvIGJlIHVzZWZ1bCB0byBoYXJk
LWNvZGUgc29tZSBvZgp0aGUgKm90aGVyKiBDUkMgbW9kdWxlcyBsaWtlIGNyYzMyYy1pbnRlbCkg
aGFkIHRvIGJlIHVwZGF0ZWQgdG8gcmVtb3ZlCml0LiAgSXQgbG9va3MgbGlrZSBEZWJpYW4gZGlk
IGluZGVlZCBkbyB0aGF0LCBhbmQgdGhleSB1cGRhdGVkIGl0IGluCmh0dHBzOi8vc2Fsc2EuZGVi
aWFuLm9yZy9rZXJuZWwtdGVhbS9saW51eC8tL2NvbW1pdC82YzI0MmM2NDdmODRiZmRiZGMyMmE2
YTc1OGZhNTlkYTRlOTQxYTEwIzEyNTFmOTQwMGE4NTQ4NWQyNzVlMTcwOTc1ODM1MGFhMDk4NzA5
YTgKCkFzIGZvciB5b3VyIG9yaWdpbmFsIHByb2JsZW0sIEknZCBnbGFkIHRvIHNlZSB0aGF0IHRo
ZSBzaW1wbGlmaWVkIGRlc2lnbgppcyBwcmV2ZW50aW5nIHByb2JsZW1zLiAgVGhlcmUncyBhbiBp
c3N1ZSB3aXRoIGJhY2twb3J0aW5nIHRoaXMgY29tbWl0CmFsb25lLCB0aG91Z2guICBUaGlzIHdh
cyBwYXRjaCAxNSBvZiBhIDE5LXBhdGNoIHNlcmllcyBmb3IgYSBnb29kCnJlYXNvbjogdGhlIENS
Qy0zMkMgaW1wbGVtZW50YXRpb24gaW4gbGliLyB3YXNuJ3QgYXJjaGl0ZWN0dXJlLW9wdGltaXpl
ZAp1bnRpbCBhZnRlciBwYXRjaGVzIDEtMTQgb2YgdGhpcyBzZXJpZXMuICBCYWNrcG9ydGluZyB0
aGlzIGNvbW1pdCBhbG9uZQp3b3VsZCBtYWtlIGNyYzMyYygpIG5vIGxvbmdlciB1dGlsaXplIGFy
Y2hpdGVjdHVyZS1vcHRpbWl6ZWQgY29kZS4KCk5vdywgaXQgYWxyZWFkeSBkaWRuJ3QgZG8gc28g
cmVsaWFibHkgKGFuZCB0aGlzIHBhdGNoIHNlcmllcyBmaXhlZAp0aGF0KS4gIEhvd2V2ZXIsIGJh
Y2twb3J0aW5nIHRoaXMgY29tbWl0IGFsb25lIHdvdWxkIG1ha2UgaXQgbmV2ZXIgZG8Kc28uICBT
byBpdCB3b3VsZCByZWdyZXNzIHBlcmZvcm1hbmNlIGluIHNvbWUgY2FzZXMuCgpTaW5jZSB0aGUg
ZXJyb3JzIHlvdSdyZSBhY3R1YWxseSBnZXR0aW5nIGFyZToKCiAgICBbICAgMTkuNjE5NzMxXSBJ
bnZhbGlkIEVMRiBoZWFkZXIgbWFnaWM6ICE9IEVMRgogICAgbW9kcHJvYmU6IGNhbid0IGxvYWQg
bW9kdWxlIGxpYmNyYzMyYyAoa2VybmVsL2xpYi9saWJjcmMzMmMua28ueHopOiB1bmtub3duIHN5
bWJvbCBpbiBtb2R1bGUsIG9yIHVua25vd24gcGFyYW1ldGVyCgpJIGRvIGhhdmUgdG8gd29uZGVy
IGlmIHRoaXMgaXMgYWN0dWFsbHkgYSBidXN5Ym94IGJ1ZyBvcgptaXNjb25maWd1cmF0aW9uLCB3
aGVyZSBpdCdzIHBhc3NpbmcgYSBjb21wcmVzc2VkIG1vZHVsZSB0byB0aGUga2VybmVsCndpdGhv
dXQgZGVjb21wcmVzc2luZyBpdD8gIEFuZCByZW1vdmluZyB0aGUgbW9kdWxlIGp1c3QgaGlkIHRo
ZSBwcm9ibGVtLgoKLSBFcmljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
