Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B318CC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FaCSzAC5nE3JL2hgMmgs8kOFtTAtrFAP+k9s59Qs9+A=; b=pII0c5g4QB84mx
	qmdXJrb9JTtUMLLYL5NH/xUL5ayIi7m9KwGl0KvNGasnGWV014s0S0g8eR/oyqfLEeUIh+J2n9Ewe
	Scd7L+c6g4UwliAljBcIKhrJTrJ3Rm9btFLJtnAXQbS/ehyH/GWYP+i5u8KzlRXNmshbvZnLpD7QY
	lGP7b9Sly8lCgYVcGOCdNucEgkkFgSTDfKULzmVwexUxLmtXFR2oRn820ws1A/Alv33r2pFGbLfDi
	/zP9zmoQyNaslccmFL/M0DSugXhv3yU/5R96EagBhu1MmGAMLYcS8vmIeKgEn6Nic66KD45r5Rbg0
	PLlT4C9yE+TaKMzkBqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b7v-00000008K1o-1glx;
	Wed, 09 Apr 2025 19:30:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b7t-00000008K1A-0lSY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 19:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB9B6A41974;
	Wed,  9 Apr 2025 19:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBD9C4CEE2;
	Wed,  9 Apr 2025 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744227020;
	bh=rLVCto77rXoyxOAnxaMssoEXsBuoenM6dX6qAsp7LJA=;
	h=From:To:Cc:Subject:Date:From;
	b=J1niUu0p0A3DahxPhmu1LIUq0mTzpQKDmuoX9Yztwgp9FC1oCJ8I/9s16smqTl+ak
	 YsOzxgTjBsjbYorLgBqjPP1m0NYmD5FLaF0K1k+LWkdnGqZLhAjPVuYbxgDN7UwwkJ
	 8jfYHUI/Z+oK4+G0MCFQYifIKFjB2w3nqAgyVCYhTooFw544GUMfS+OLYLGpC3FwfW
	 OBFoFoj0GDDwywwb7Tjeg5QcBr0NU/TH8QNFDiwt75VR1p14tRgCrqVExjecyRxyl8
	 DBSGHlS90oKRUGW/Om9qrVWihkDkGFRBV4jfiHAC9PTut4chu0kk2ej66uwikEVl3D
	 diDASiRuG2n8w==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Daniel Maslowski <cyrevolt@gmail.com>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: kexec_file: Support loading Image binary file
Date: Wed,  9 Apr 2025 21:29:57 +0200
Message-ID: <20250409193004.643839-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_123021_349571_5943A708 
X-CRM114-Status: GOOD (  13.47  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKSGkhCgpGb3Igb3ZlciBh
IHllYXIgYWdvLCBEYW5pZWwgYW5kIEkgd2FzIHRlc3RpbmcgdGhlIFYyIG9mIFNvbmcncyBzZXJp
ZXMuCkkgYWxzbyBwcm9taXNlZCB0byB0YWtlIHRoZSBWMiwgdGhhdCBoYWQgYmVlbiBzaXR0aW5n
IG9uIHRoZSBsaXN0cyBmb3IKdG9vIGxvbmcsIHRvIHJlYmFzZSBpdCBvbiBhIG5ldyBrZXJuZWws
IGFuZCByZS10ZXN0IGl0LgoKT25lIHllYXIgbGF0ZXIsIGhlcmUncyB0aGUgVjMhIDstKQoKVGhl
cmUgYXJlIG5vIGNoYW5nZXMgZnJvbSBWMiBvdGhlciwgdGhhbiBzb21lIHNpbXBsZSBjaGVja3Bh
dGNoCmNsZWFudXBzLgoKU29uZydzIG9yaWdpbmFsIGNvdmVyOgogIHwgVGhpcyBzZXJpZXMgbWFr
ZXMgdGhlIGtleGVjX2ZpbGVfbG9hZCgpIHN5c2NhbGwgc3VwcG9ydCB0byBsb2FkCiAgfCBJbWFn
ZSBiaW5hcnkgZmlsZS4gQXQgdGhlIHNhbWUgdGltZSwgY29ycmVzcG9uZGluZyBzdXBwb3J0IGZv
cgogIHwga2V4ZWMtdG9vbHMgaGFkIGJlZW4gcHVzaGVkIHRvIG15IHJlcG9bMl0uCiAgfAogIHwg
Tm93LCB3ZSBjYW4gbGV2ZXJhZ2UgdGhhdCBrZXhlYy10b29scyBhbmQgdGhpcyBzZXJpZXMgdG8g
dXNlIHRoZQogIHwga2V4ZWNfbG9hZCgpIG9yIGtleGVjX2ZpbGVfbG9hZCgpIHN5c2NhbGwgdG8g
Ym9vdCBib3RoIHZtbGludXggYW5kCiAgfCBJbWFnZSBmaWxlLCBhcyBzZWVuIGluIHRoZXNlIGNv
bWJvIHRlc3RzOgogIHwKICB8IGBgYAogIHwgMS4ga2V4ZWMgLWwgdm1saW51eAogIHwgMi4ga2V4
ZWMgLWwgSW1hZ2UKICB8IDMuIGtleGVjIC1zIC1sIHZtbGludXgKICB8IDQuIGtleGVjIC1zIC1s
IEltYWdlCiAgfCBgYGAKCk5vdGFibHksIGtleGVjLXRvb2xzIGhhcyBzdGlsbCBub3QgbWFkZSBp
dCB1cHN0cmVhbS4gSSd2ZSBwcmVwYXJlZCBhCmJyYW5jaCBvbiBteSBHSCBbM10sIHRoYXQgSSBp
bmRlbmQgdG8gcG9zdCBBU0FQLiBUaGF0IGJyYW5jaCBpcyBhCmNvbGxlY3Rpb24gb2YgZml4ZXMv
ZmVhdHVyZXMsIGluY2x1ZGluZyBTb25nJ3MgdXNlcmxhbmQgSW1hZ2UgbG9hZGluZy4KClRoZSBW
MiBpcyBoZXJlIFsyXSwgYW5kIFYxIFsxXS4KCkkndmUgdGVzdGVkIHRoZSBrZXhlYy1maWxlL0lt
YWdlIG9uIHFlbXUtcnY2NCwgd2l0aCBmb2xsb3dpbmcKY29tYmluYXRpb25zOgogKiBBQ1BJL1VF
RkkgCiAqIERUL1VFRkkKICogRFQKCmJvdGggInJlZ3VsYXIiIGtleGVjICgtcyArIC1lKSwgYW5k
IGNyYXNoa2VybmVscyAoLXApLgoKTm90ZSB0aGF0IHRoZXJlIGFyZSB0d28gcHVyZ2F0b3J5IHBh
dGNoZXMgdGhhdCBoYXMgdG8gYmUgcHJlc2VudCAocGFydApvZiAtcmMxLCBzbyBhbGwgZ29vZCk6
CiAgY29tbWl0IDI4MDkzY2ZlZjVkZCAoInJpc2N2L2tleGVjX2ZpbGU6IEhhbmRsZSBSX1JJU0NW
XzY0IGluIHB1cmdhdG9yeSByZWxvY2F0b3IiKQogIGNvbW1pdCAzZjcwMjMxNzFkZjQgKCJyaXNj
di9wdXJnYXRvcnk6IDRCIGFsaWduIHB1cmdhdG9yeV9zdGFydCIpCgpbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTQwMjAwNDQuMTM5NzM1Ni0xLXNvbmdzaHVh
aXNodWFpQHRpbnlsYWIub3JnLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyMzEwMTYwOTIwMDYuMzM0NzYzMi0xLXNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnLwpb
M10gaHR0cHM6Ly9naXRodWIuY29tL2Jqb3RvL2tleGVjLXRvb2xzL3RyZWUvcnYtb24tbWFzdGVy
CgpTb25nIFNodWFpICgyKToKICByaXNjdjoga2V4ZWNfZmlsZTogU3BsaXQgdGhlIGxvYWRpbmcg
b2Yga2VybmVsIGFuZCBvdGhlcnMKICByaXNjdjoga2V4ZWNfZmlsZTogU3VwcG9ydCBsb2FkaW5n
IEltYWdlIGJpbmFyeSBmaWxlCgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbWFnZS5oICAgICAg
ICAgfCAgIDIgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oICAgICAgICAgfCAgIDYg
KwogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gv
cmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jICAgICAgICAgIHwgNDg1IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL2tleGVjX2VsZi5jICAgICAgICAgIHwgMTQ0ICsr
KysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19pbWFnZS5jICAgICAgICB8ICA5NiArKysr
KwogYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfCAzNjEgKysrKysrKysr
KysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDYxMCBpbnNlcnRpb25zKCspLCA0ODYgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19lbGYuYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2tleGVjX2ltYWdlLmMKCgpiYXNlLWNvbW1p
dDogYTI0NTg4MjQ1Nzc2ZGFmYzIyNzI0M2EwMWJmYmViOGE1OWJhZmJhOQotLSAKMi40NS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
