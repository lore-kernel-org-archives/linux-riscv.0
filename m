Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387BCC02197
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=abYsD3WGFavFZaM7mFnICC22ruSiBXvM2I1G6iVSGG4=; b=Q7cQthLpHQBRgm
	ssLp+yn9g31wePEMFyVeVYBP0hwHIAvg8Kn2XQh5cERL5RpJxTVHeRVtSR/CnnNdylt3LHcFJYR1s
	b15ZBasbT3CcjTSHxXrUiSt+4srp+ciDMP3FNzGUBjCehLa3Y8Jbxobn9LtxONOQr1wTabUlT3V81
	TpAzHdeJ/GDVx8WEu/oIMl/3aX58Vd4JN0UpXI/5YjFPMn5nmzK09bEqDR8Lu+nKE+YV+DLY9ohRk
	6r4EuRLxP84Zw5kS4BEpD62FuuXT4QJnJPrZ5kywbBDNGwI6vdu77otXJxHq1uL/BNdtGDLo++7RM
	XdYJxXBWj6X5p3zZ1oPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi7N-00000003wx5-2I6L;
	Wed, 05 Feb 2025 16:19:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwm-00000003ucI-1UDw
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DD73A437DC;
	Wed,  5 Feb 2025 16:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F42C4CED1;
	Wed,  5 Feb 2025 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771695;
	bh=vVgyPSLuK8V9Z8ZoAgEifbf+M3HZpZDaonS3lABhZZA=;
	h=From:To:Cc:Subject:Date:From;
	b=siNjltJ3eiZzPl4eC+FZjpQopN9cXA5U6Wy+AtzLimxR+YRrGiPlN11BZhluCbtyT
	 ZQHvsB+LpSLHMQBaizS9R1cIG0G9TDNxiAfwoykC3y8NsSJWcEQL9g6Hk6y6xX1nwI
	 emjZnHbUlz2zioORAvQ8Y2rPxg11jtBYOFlBwj4jeajrwgcYvu3tpBLPKPM8F6q+hE
	 1MxEUeZBch1jkIIExxHlj8yDFO4wspGzU4GQ7wUk1ObC+Dnjgro8Vm75u1s6eDhcfu
	 0kx8DlSh+IJuhRAhhzGrNQnCjeI7nP7GMnlVYyQ8xU4NcAT8FDKfRQ8OsHc6uR0xrM
	 uCcvlupTgZrvQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Add some validation for vector, vector crypto and fp stuff
Date: Wed,  5 Feb 2025 16:05:06 +0000
Message-ID: <20250205-cobbler-unpadded-5580c1f5d946@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=kEfjLL/AKQiPww/DgCF2YWb+qxGGMYe1F7o2flNSwO0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe8wCBZcIcX04ktn7hPfcxw9bHRUXnXxqvpfZbe7mU 4eUW+fe7ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEJnIxMpyWvxoQfi/i7U+u KgkVK9kdToWhZx+u3bb1kOQuqds7u4UYfrPLTZhkF3LfySPAUUzgiFW86nS2oBAdNpeM6uK8Jwl CjAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080816_526031_4EACE29A 
X-CRM114-Status: GOOD (  10.56  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCllvLAoKVGhp
cyBzZXJpZXMgaXMgcGFydGx5IGxldmVyYWdpbmcgQ2xlbWVudCdzIHdvcmsgYWRkaW5nIGEgdmFs
aWRhdGUKY2FsbGJhY2sgaW4gdGhlIGV4dGVuc2lvbiBkZXRlY3Rpb24gY29kZSBzbyB0aGF0IHRo
aW5ncyBsaWtlIGNoZWNraW5nCmZvciB3aGV0aGVyIGEgdmVjdG9yIGNyeXB0byBleHRlbnNpb24g
aXMgdXNhYmxlIGNhbiBiZSBkb25lIGxpa2U6CgloYXNfZXh0ZW5zaW9uKDx2ZWN0b3IgY3J5cHRv
PikKcmF0aGVyIHRoYW4KCWhhc192ZWN0b3IoKSAmJiBoYXNfZXh0ZW5zaW9uKDx2ZWN0b3IgY3J5
cHRvPikKd2hpY2ggRXJpYyBwb2ludGVkIG91dCB3YXMgYSBwb29yIGRlc2lnbiBzb21lIG1vbnRo
cyBhZ28uCgpUaGUgcmVzdCBvZiB0aGlzIGlzIGFkZGluZyBzb21lIHJlcXVpcmVtZW50cyB0byB0
aGUgYmluZGluZ3MgdGhhdApwcmV2ZW50IGNvbWJpbmF0aW9ucyBvZiBleHRlbnNpb25zIGRpc2Fs
bG93ZWQgYnkgdGhlIElTQS4KClRoZXJlJ3MgYSBidW5jaCBvZiBvdmVyLWxvbmcgbGluZXMgaW4g
aGVyZSwgYnV0IEkgdGhvdWdodCB0aGF0IHRoZQpvdmVyLWxvbmcgbGluZXMgd2VyZSBjbGVhcmVy
IHRoYW4gYnJlYWtpbmcgdGhlbSB1cC4KCkNoZWVycywKQ29ub3IuCgp2MzoKLSByZWJhc2Ugb24g
djYuMTQtcmMxCi0gc3BsaXQgdmVjdG9yIGNyeXB0byB2YWxpZGF0aW9uIHBhdGNoIGludG8gdmVj
dG9yIHZhbGlkYXRpb24gYW5kIHZlY3RvcgogIGNyeXB0byB2YWxpZGF0aW9uCi0gZml4IHp2ZTY0
eCByZXF1aXJpbmcgZXh0ZW5zaW9uIGxpc3QgdG8gbWF0Y2ggRXJpYydzIFBSCgp2MjoKLSBGaXgg
YW4gaW52ZXJ0ZWQgY2xhdXNlIENsw6ltZW50IHBvaW50ZWQgb3V0Ci0gQWRkIFp2YmIgdmFsaWRh
dGlvbiwgdGhhdCBJIGhhZCBtaXNzZWQgYWNjaWRlbnRhbGx5Ci0gRHJvcCB0aGUgdG9kbyBhYm91
dCBjaGVja2luZyB0aGUgbnVtYmVyIG9mIHZhbGlkYXRpb24gcm91bmRzLAogIEkgdHJpZWQgaW4g
dy8gcWVtdSdzIG1heCBjcHUgYW5kIHRoaW5ncyBsb29rZWQgcmlnaHQKCkNDOiBFcmljIEJpZ2dl
cnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+CkNDOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+CkNDOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgpDQzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xl
eUBzaWZpdmUuY29tPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ0M6
ICJDbMOpbWVudCBMw6lnZXIiIDxjbGVnZXJAcml2b3NpbmMuY29tPgpDQzogQW5keSBDaGl1IDxh
bmR5Ym5hY0BnbWFpbC5jb20+CkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkND
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwoKQ29ub3IgRG9vbGV5ICg2KToKICBSSVNDLVY6IGFkZCB2ZWN0b3IgZXh0ZW5zaW9uIHZh
bGlkYXRpb24gY2hlY2tzCiAgUklTQy1WOiBhZGQgdmVjdG9yIGNyeXB0byBleHRlbnNpb24gdmFs
aWRhdGlvbiBjaGVja3MKICBSSVNDLVY6IGFkZCBmICYgZCBleHRlbnNpb24gdmFsaWRhdGlvbiBj
aGVja3MKICBkdC1iaW5kaW5nczogcmlzY3Y6IGQgcmVxdWlyZXMgZgogIGR0LWJpbmRpbmdzOiBy
aXNjdjogYWRkIHZlY3RvciBzdWItZXh0ZW5zaW9uIGRlcGVuZGVuY2llcwogIGR0LWJpbmRpbmdz
OiByaXNjdjogZG9jdW1lbnQgdmVjdG9yIGNyeXB0byByZXF1aXJlbWVudHMKCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAgODUgKysrKysrKysrKysKIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oICAgICAgICAgICB8ICAgMyArCiBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAxMzMgKysrKysrKysr
KysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE4MyBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlv
bnMoLSkKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
