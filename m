Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C441D4A604
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMxQqWZOWabbDsBL2FKkMCcrz/cTaodn71wmfqCuAnE=; b=r9eE0ZZB6cOzF9
	R8fUo01Mvls+byPoS4190xzmCi8DXqJCyiWbghuBuIDtEnu7olwmE7wkJp1mOGZbF/cZHr6PQag6q
	fauSglL9sUIo63QD3zSlDAG83/xqnKNWm9ufUymFxbZyC4UYtQEBS7aMBuUCSSkAjnALYe5jrjeUP
	a7FCBRPmYOI1eyJFHsrPkhNrKS86i+SUO+JhrCNz594X2J4Fagjj6enuaUiudakzcQJ4PheedTX5q
	M8mdUcEjMxD+b/xhvBAH/VWQmb4FIBAzAECizGog2YdwhED+HmX9SrOr2hZW+PLbFhsVqEmYBPTWE
	To2rfEUuWfnzVAdFIOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdBH-0000000Desm-2pUP;
	Fri, 16 Jan 2026 06:19:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdBB-0000000Derw-0yE5
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 06:19:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768544367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flwjYtqlrMALIXZXtKpSQ7iMAml1HwYFImYMXwos3ec=;
	b=B4g63FGDMoWQRlfIoJKDPDTjb38sC0GwbLcsjCZz8Hvbktc16Pol1CSwckNbX5ryQgkBXG
	UT1n4tPSX/thqMsFEfXNnd1rJKRPYVGA+HNjq2ujooTnY54kThxIdI2yuo6zHZHOWhzqN2
	wgVqxLN5OWR30vYd7hmwTIAo3igT3i3UvJNg5O/gTVgJa1UoWqgRPkugd4kyxEpu3kVhsl
	g8fv5P/al4bTP7QNGO6S6Z7N2bgpTsukX/G2ELn3144vwEyJbw6MgSqi5HBj8YXqpafbXn
	pFkvsP/qh4h7aJowpmvg+4y/MxxM+qcEjzNXji3pnC3QRgyyUE0zDQTv0/PyOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768544367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flwjYtqlrMALIXZXtKpSQ7iMAml1HwYFImYMXwos3ec=;
	b=VRmUi2Glr8EqDBOnL9vubwKSi5M9T+6FBpGt2aFvTL99g+2FOeBLtAQHUWtgNyXT3SyTiu
	s4YEgfYCBdmE1uBQ==
Date: Fri, 16 Jan 2026 07:19:24 +0100
Subject: [PATCH v2] riscv: Implement ARCH_HAS_CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20260116-cc-can-link-riscv-v2-1-eaf362d74c90@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAGvYaWkC/32NQQ6CMBBFr0Jm7Zh2ihhdcQ/DgkwHmWiKabHBE
 O5u5QAu3//576+QJKokuFYrRMmadAoF6FABj324C6ovDGToZIkImZH7gE8ND4yaOKNn40zt6cx
 DDWX3ijLosjtvXeFR0zzFz36R7S/9Z8sWLTbOibtI3TfGt6V8z3EKuhy9QLdt2xfKnz4ctgAAA
 A==
X-Change-ID: 20251222-cc-can-link-riscv-dc0304d27cf4
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768544366; l=1847;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=YsZODejPaMJUcZSBq/h58xHb2HRtC/WNXB0PXS59kuU=;
 b=H9mOViyKCBg8gXI4naBTJ26ZDk6c98aTE/8zMcuL/c2UMleqawTjUyTOLGOu+tPwgKbDv5d9x
 ZQB7zioBRBlCMAxr/nyJU/qllTmg7x0Tijq5ECCv1JDJEn447xStT37
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_221930_793953_EAD1B572 
X-CRM114-Status: UNSURE (   5.65  )
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

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIHJlbGllcyBvbiAtbTMyLy1tNjQgY29t
cGlsZXIgZmxhZ3MuClRoZXNlIGFyZSBub3Qgc3VwcG9ydGVkIGJ5IHJpc2N2IGNvbXBpbGVycy4K
ClVzZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgbG9naWMgdXNpbmcgLW1hYmkgaW5zdGVhZC4KClBy
ZWZlciB0aGUgJ2QnIEFCSSB2YXJpYW50IHdoZW4gcG9zc2libGUgYXMgdG9kYXlzIHRvb2xjaGFp
bnMgYXJlIG1vc3QKbGlrZWx5IHRvIHByb3ZpZGUgYSBsaWJjIGZvciB0aGF0IG9uZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBBbHNvIGhhbmRsZSAhRlBVIGNhc2UuCi0gRXh0ZW5k
IGNvbW1pdCBtZXNzYWdlLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNTEyMjItY2MtY2FuLWxpbmstcmlzY3YtdjEtMS02MzNlMzllNGE2MGRAbGludXRyb25peC5k
ZQotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcg
Yi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggNmIzOWYzN2Y3NjlhLi4xYzYzNjExN2I3ZTQgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAg
LTI1LDYgKzI1LDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IEFSQ0hfRU5BQkxFX1NQTElUX1BN
RF9QVExPQ0sgaWYgUEdUQUJMRV9MRVZFTFMgPiAyCiAJc2VsZWN0IEFSQ0hfRU5BQkxFX1RIUF9N
SUdSQVRJT04gaWYgVFJBTlNQQVJFTlRfSFVHRVBBR0UKIAlzZWxlY3QgQVJDSF9IQVNfQklORk1U
X0ZMQVQKKwlzZWxlY3QgQVJDSF9IQVNfQ0NfQ0FOX0xJTksKIAlzZWxlY3QgQVJDSF9IQVNfQ1VS
UkVOVF9TVEFDS19QT0lOVEVSCiAJc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1ZJUlRVQUwgaWYgTU1V
CiAJc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUKQEAgLTEzNTEsNiArMTM1MiwyMCBA
QCBjb25maWcgUE9SVEFCTEUKIGNvbmZpZyBBUkNIX1BST0NfS0NPUkVfVEVYVAogCWRlZl9ib29s
IHkKIAorY29uZmlnIEFSQ0hfQ0NfQ0FOX0xJTksKKwlib29sCisJZGVmYXVsdCAkKGNjX2Nhbl9s
aW5rX3VzZXIsLW1hYmk9bHA2NGQpIGlmIDY0QklUICYmIEZQVQorCWRlZmF1bHQgJChjY19jYW5f
bGlua191c2VyLC1tYWJpPWxwNjQpIGlmIDY0QklUCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3Vz
ZXIsLW1hYmk9aWxwMzJkKSBpZiBGUFUKKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlciwtbWFi
aT1pbHAzMikKKworY29uZmlnIEFSQ0hfVVNFUkZMQUdTCisJc3RyaW5nCisJZGVmYXVsdCAiLW1h
Ymk9bHA2NGQiIGlmIDY0QklUICYmIEZQVQorCWRlZmF1bHQgIi1tYWJpPWxwNjQiIGlmIDY0QklU
CisJZGVmYXVsdCAiLW1hYmk9aWxwMzJkIiBpZiBGUFUKKwlkZWZhdWx0ICItbWFiaT1pbHAzMiIK
KwogbWVudSAiUG93ZXIgbWFuYWdlbWVudCBvcHRpb25zIgogCiBzb3VyY2UgImtlcm5lbC9wb3dl
ci9LY29uZmlnIgoKLS0tCmJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhk
MGQwNDAyN2NiMWU4CmNoYW5nZS1pZDogMjAyNTEyMjItY2MtY2FuLWxpbmstcmlzY3YtZGMwMzA0
ZDI3Y2Y0CgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNz
c2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
