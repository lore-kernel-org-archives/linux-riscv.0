Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB4FCE8E6B
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xLUVPNovOUCLuxxr31ZuIYKYe+Sr+8Aumo/DdqQuiQ=; b=LJ3fB4bfYmnSB/
	H2Rtz5785fTlB5DQWtGuZ5VnP/oqWrNFQl/W5MqyvPZSY+/yhpB/DnEEjHXtjsi/wLFPdksa2FfJo
	g6tYypfZUPSR2GGJZbzpvcwlV0EbNoaNW0bipu4BVX/Zlo00uwFmsUnTicny17ILroGTYiG4rLgKz
	IB1C5c1YNgq+gb9XZdHXiXXQpbQDjq0jRMAyLjIC1AS2joLyR9Kw54Un7AFQ1BwvLGWbP/lRRLkoX
	qIVzkweq+QaipqQU7wUn5tp9lwOXyCOZez53m9Pco9aFrGCicuaEMGsMsuTeCo/9Ynf5WG0PYB7sF
	lhwAvX1Wq1eECPmvinaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x7j-00000000Mwn-286o;
	Thu, 24 Oct 2024 12:39:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x2z-00000000LzE-3hlO
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 12:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1BD7A4535C;
	Thu, 24 Oct 2024 12:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89700C4CEC7;
	Thu, 24 Oct 2024 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773276;
	bh=3ygEjG6hTS+s76bWt2IvYPg8yyhSvz+WHj+DxEVzQJY=;
	h=From:To:Cc:Subject:Date:From;
	b=uonhDsAxDtqHpYTOwA0RL5u/lqune/NxVAhq2wVRAgjNeuH3v8KhBLVMCZJImrKIi
	 E0kvBrkUcshfxQXg0K4JFuvrk+GM3j47hylwCwddJmO27BWldvg9kEQrG7xnX63he9
	 O5/yasof/iY3fMmtYFUgWv4s/L0V4dndgQjnkQXwbpvILjrWdc6oN75ejBQQ42iuCG
	 LbPUpRQ6kAXix5qmxfe4LfTeQg6fFWRMJVbZZAx2GPDWzRJ9fyTCCfl+8FZTKCwHUf
	 vUUkdNSifGBg5hqNsIr9HBl6FP1Pmo1b5/LwPmfMaZ9MYH2UUgM1bbURcnXJEys6DT
	 7qE0Xku+zq4kg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add some validation for vector, vector crypto and fp stuff
Date: Thu, 24 Oct 2024 13:34:28 +0100
Message-ID: <20241024-fanning-enrage-bcc39f8ed47d@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rFKvUC5WbGtzbbJAD2E+rOogADPDAQJQjX4YNpHNNNs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlSdlcDu+QXPLh8ReufWddjnuVnZ7a/l1bOe7nIcMcN+ VvVvC07OkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRHTUM/zPNewu1Sp/UNPFt nz/93d3+BUw8a5hDlDIK5Zb/W9Fz8zYjQ3vYSXt1ofrkqa7T0qOu+dSJ/J9qzliou0340o5n63a +YQcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053438_013727_B744FB0F 
X-CRM114-Status: UNSURE (   8.92  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCllvLAoKVGhp
cyBzZXJpZXMgaXMgcGFydGx5IGxldmVyYWdpbmcgQ2xlbWVudCdzIHdvcmsgYWRkaW5nIGEgdmFs
aWRhdGUKY2FsbGJhY2sgaW4gdGhlIGV4dGVuc2lvbiBkZXRlY3Rpb24gY29kZSBzbyB0aGF0IHRo
aW5ncyBsaWtlIGNoZWNraW5nCmZvciB3aGV0aGVyIGEgdmVjdG9yIGNyeXB0byBleHRlbnNpb24g
aXMgdXNhYmxlIGNhbiBiZSBkb25lIGxpa2U6CgloYXNfZXh0ZW5zaW9uKDx2ZWN0b3IgY3J5cHRv
PikKcmF0aGVyIHRoYW4KCWhhc192ZWN0b3IoKSAmJiBoYXNfZXh0ZW5zaW9uKDx2ZWN0b3IgY3J5
cHRvPikKd2hpY2ggRXJpYyBwb2ludGVkIG91dCB3YXMgYSBwb29yIGRlc2lnbiBzb21lIG1vbnRo
cyBhZ28uCgpUaGUgcmVzdCBvZiB0aGlzIGlzIGFkZGluZyBzb21lIHJlcXVpcmVtZW50cyB0byB0
aGUgYmluZGluZ3MgdGhhdApwcmV2ZW50IGNvbWJpbmF0aW9ucyBvZiBleHRlbnNpb25zIGRpc2Fs
bG93ZWQgYnkgdGhlIElTQS4KCkNoZWVycywKQ29ub3IuCgp2MjoKLSBGaXggYW4gaW52ZXJ0ZWQg
Y2xhdXNlIENsw6ltZW50IHBvaW50ZWQgb3V0Ci0gQWRkIFp2YmIgdmFsaWRhdGlvbiwgdGhhdCBJ
IGhhZCBtaXNzZWQgYWNjaWRlbnRhbGx5Ci0gRHJvcCB0aGUgdG9kbyBhYm91dCBjaGVja2luZyB0
aGUgbnVtYmVyIG9mIHZhbGlkYXRpb24gcm91bmRzLAogIEkgdHJpZWQgaW4gdy8gcWVtdSdzIG1h
eCBjcHUgYW5kIHRoaW5ncyBsb29rZWQgcmlnaHQKCkNDOiBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+CkNDOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgpDQzogUGF1bCBXYWxtc2xleSA8cGF1bC53
YWxtc2xleUBzaWZpdmUuY29tPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNv
bT4KQ0M6ICJDbMOpbWVudCBMw6lnZXIiIDxjbGVnZXJAcml2b3NpbmMuY29tPgpDQzogQW5keSBD
aGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+CkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCkNDOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwoKQ29ub3IgRG9vbGV5ICg1KToKICBSSVNDLVY6IGFkZCB2ZWN0b3IgY3J5cHRv
IGV4dGVuc2lvbiB2YWxpZGF0aW9uIGNoZWNrcwogIFJJU0MtVjogYWRkIGYgJiBkIGV4dGVuc2lv
biB2YWxpZGF0aW9uIGNoZWNrcwogIGR0LWJpbmRpbmdzOiByaXNjdjogZCByZXF1aXJlcyBmCiAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgdmVjdG9yIHN1Yi1leHRlbnNpb24gZGVwZW5kZW5jaWVz
CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBkb2N1bWVudCB2ZWN0b3IgY3J5cHRvIHJlcXVpcmVtZW50
cwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA4NCAr
KysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgICAg
fCAgIDMgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwg
MTQ4ICsrKysrKysrKysrKy0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygr
KSwgNTAgZGVsZXRpb25zKC0pCgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
