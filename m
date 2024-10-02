Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00619CF6D3B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6o9/uH7IgVe9LYylq77IIHdJOAceLCNFxpaXJ2BxLw=; b=D9U6k9XlfoyQXx
	qy1IvUi3vkmBtYg1xlNkuq35UMadLn5J2+QJxvhIxBM0KgmA9hhlN1K6/KswF/la0Xiz9SXvdQCyo
	AKnvfruLV+Al65VqdkI+eLEpPdzd3f0BfVQaMveUbv0T6NbS9XsLx8K7njtC/btVWtjF9Pth+lTSd
	UTn6iaAMJJZZMTwaY46R4oU6Hf/Bbi+nM/38isJnH1IBms1ANTpjlSh6ZUtY3+AnpJwP+h2z4G7rl
	0k2L60Byn9+aJG4bW4XUOh/Lt/EtI2pu4Hejp0TqoQwv7atkPxqoJi2T3FKjMLFHgOa+d9yNT6gnz
	YvVHw6aGTlTfG1ZvF6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xG-00000006shD-34QX;
	Wed, 02 Oct 2024 16:11:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xD-00000006sgL-1Mu4
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 16:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5386D5C4C32;
	Wed,  2 Oct 2024 16:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E83C4CECD;
	Wed,  2 Oct 2024 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727885514;
	bh=z4NrtfuoKFkUV7gw60/XOVCDu2x+hP12xwDRpwJUw9M=;
	h=From:To:Cc:Subject:Date:From;
	b=YL3bTYKwUaF/fTBfzLN0gLhOXBR1HldxOaE6syA6L+SOQE5zN9YdMshH/H4HOUfBl
	 Oo7gDhg/5moCjyim+RGM1EDflJ1wE/NMicxokN81mbiLgV8qzYlrTitrL9BEjFYigO
	 yUKxS/LZtnhrpn73EL5mJQjQ7VwIkd7JE1+R98/RvIYDmmpIgWTGF+UcDjGwlfr2SR
	 1uE3nz+DYqMbXA3nMGB0Q+taxa70bV9lkvj8a5DDItrINHjlM5AmvpAuCPe/iJyD5H
	 wBdosYhmj8nhJ0yBqoQXLlDwEBpqHE23ysQwKN2Lmpfo+e2yIDYSfhDe+nb94P47Nn
	 TBu667nl7Kf+g==
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
Subject: [RFC v1 0/5] Add some validation for vector, vector crypto and fp stuff
Date: Wed,  2 Oct 2024 17:10:53 +0100
Message-ID: <20241002-defeat-pavestone-73d712895f0b@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VtP66jynw+1DhNCd6kcn7svr44Hq2u2DpQ/VRxE2T40=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/C/pzm5esbdlj9+4lV8fr001Tp38K50iUOPZIYVOnw ytelec2HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIWSYjw9T1sf4RbTOEZ294 un6yqap2+Y6XjluOWu5eftDQOV75YArDP3WfpIiUbRM3zLCZ+qRu0fYa3Zk6EtdfHmj7aBAY8uq VOw8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_091155_438828_C152314D 
X-CRM114-Status: GOOD (  10.21  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCllvLAoKS2lu
ZGEgUkZDIGFzIEkgd2FudCB0byBzZWUgd2hhdCBwZW9wbGUgdGhpbmsgb2YgdGhpcy4KClRoaXMg
c2VyaWVzIGlzIHBhcnRseSBsZXZlcmFnaW5nIENsZW1lbnQncyB3b3JrIGFkZGluZyBhIHZhbGlk
YXRlCmNhbGxiYWNrIGluIHRoZSBleHRlbnNpb24gZGV0ZWN0aW9uIGNvZGUgc28gdGhhdCB0aGlu
Z3MgbGlrZSBjaGVja2luZwpmb3Igd2hldGhlciBhIHZlY3RvciBjcnlwdG8gZXh0ZW5zaW9uIGlz
IHVzYWJsZSBjYW4gYmUgZG9uZSBsaWtlOgoJaGFzX2V4dGVuc2lvbig8dmVjdG9yIGNyeXB0bz4p
CnJhdGhlciB0aGFuCgloYXNfdmVjdG9yKCkgJiYgaGFzX2V4dGVuc2lvbig8dmVjdG9yIGNyeXB0
bz4pCndoaWNoIEVyaWMgcG9pbnRlZCBvdXQgd2FzIGEgcG9vciBkZXNpZ24gc29tZSBtb250aHMg
YWdvLgoKVGhlIHJlc3Qgb2YgdGhpcyBpcyBhZGRpbmcgc29tZSByZXF1aXJlbWVudHMgdG8gdGhl
IGJpbmRpbmdzIHRoYXQKcHJldmVudCBjb21iaW5hdGlvbnMgb2YgZXh0ZW5zaW9ucyBkaXNhbGxv
d2VkIGJ5IHRoZSBJU0EuIEkgbWlnaHQgaGF2ZQpnb3R0ZW4gdGhlbSB3cm9uZywgYnV0IEkgaGF2
ZSBjaXRlZCB0aGUgYml0cyBpbiB0aGUgZG9jdW1lbnRhdGlvbiBJIHVzZWQKZm9yIHJlZmVyZW5j
ZSAtIHNvIGRvdWJsZSBjaGVja2luZyBzaG91bGRuJ3QgYmUgL3Rvby8gZGlmZmljdWx0LgoKQ2hl
ZXJzLApDb25vci4KCkNDOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+CkNDOiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytk
dEBrZXJuZWwub3JnPgpDQzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29t
PgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ0M6ICJDbMOpbWVudCBM
w6lnZXIiIDxjbGVnZXJAcml2b3NpbmMuY29tPgpDQzogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFp
bC5jb20+CkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNDOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwoKQ29ub3Ig
RG9vbGV5ICg1KToKICBSSVNDLVY6IGFkZCB2ZWN0b3IgY3J5cHRvIGV4dGVuc2lvbiB2YWxpZGF0
aW9uIGNoZWNrcwogIFJJU0MtVjogYWRkIGYgJiBkIGV4dGVuc2lvbiB2YWxpZGF0aW9uIGNoZWNr
cwogIGR0LWJpbmRpbmdzOiByaXNjdjogZCByZXF1aXJlcyBmCiAgZHQtYmluZGluZ3M6IHJpc2N2
OiBhZGQgdmVjdG9yIHN1Yi1leHRlbnNpb24gZGVwZW5kZW5jaWVzCiAgZHQtYmluZGluZ3M6IHJp
c2N2OiBkb2N1bWVudCB2ZWN0b3IgY3J5cHRvIHJlcXVpcmVtZW50cwoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA4NCArKysrKysrKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgICAgfCAgIDMgKwogYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgMTQ3ICsrKysrKysrKysrKy0t
LS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0p
CgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
