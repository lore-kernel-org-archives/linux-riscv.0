Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC36FE6748D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CcnH1M4rLW+F/d766YUTLURe/FmL31YpcgS3GrQLbiU=; b=iVSILPvdVnddEh
	GF80hyX77RvnT2VfK8da3XiF6EY6ur3LOQJiA0mMJ5+jIMEhvaIOrPHPebn90+HcCz5gFG4KDjsXj
	XDYWr+huy7Pu0wK4g3/pdzEzHsZuPnIWYVMKzSVeJ6a42r7Qt5lM1IRTkiQvjlnNSrJVjPmeylmeS
	/zR4rD28oYfRd8w6kUyFoMxw/++/KiVD5YieQ+Bw3oaQJ/wTnyfm+5e21FBMsVv3DB+xuNVzAVAsE
	PijrpaLogC/kAb1mGP2T87E3j9BJTdz408sb3XDwwrgEnoM5hIWMQUSajithPvatiOlsN4duCBhsb
	eQRWZvr+WbVn3MnIRXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbGp-0000000DR9I-39MM;
	Mon, 22 Dec 2025 08:27:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbGn-0000000DR7Q-24RU
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 08:27:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766392069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oSOtprZ+qPykyTr30pHF5ZKHmubcsbeElZ+oxTKbKdI=;
	b=gDL0xsWdpye4byeC+raxBohxIPYWLJGpziDgNhS7sp4z39Y3+EuFFlD/7xhSkPrM7mwZOB
	ovK2tTMZ+fztF+8EzHeCJZi1b4w4rhMOuWQRd+agf+QOeEZRtK4LJlAT9Yr8fIo2a6xcWE
	36+E2d2/2s8DYKaoJI5JYdDJGD3BM1L1sefBC5ThhPawJ+HlbRs/hb3QiqPRmjM5AxE5Rh
	FSOUzSopdb3DPTvuXZnCp+zyk5wZBTifvR7AATab7dryNyOqYw6E3vpCyp/qz8C5c1fx71
	yQWqL+PdARAHfkdDqsNNXPXt7XDfW+RWDamG7UvQhGmVhvx055y+CUZ6H1mA5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766392069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oSOtprZ+qPykyTr30pHF5ZKHmubcsbeElZ+oxTKbKdI=;
	b=QosDRLB2CQCGGWXZcMmbliTURCeugO9TbF7BgVso3U2sE6/3AWJoiyl9JZAZdSAlOaSAZE
	QseJpdOJIiAsZ2DA==
Date: Mon, 22 Dec 2025 09:27:47 +0100
Subject: [PATCH] riscv: Implement ARCH_HAS_CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251222-cc-can-link-riscv-v1-1-633e39e4a60d@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAIBSWkC/x3MMQqAMAxA0atIZgM1VgSvIg6SphqUKi2IUHp3i
 +Mb/s+QJKokmJoMUR5NeoWKrm2A9zVsguqqgQwNHREhM/Ia8NRwYNTEDzo2vbGORvYWandH8fr
 +z3kp5QM1jezkYwAAAA==
X-Change-ID: 20251222-cc-can-link-riscv-dc0304d27cf4
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392068; l=1376;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QC1AgF2lMr8UYHyVl29Yc4+kOlqxWRJOdKzuFtG64Bk=;
 b=3bqp5kSVSjk46TwmDSjMt6Fc1HmxWOVusqNUmXUTcb20KKJOBV2sHr4QPLXw14AOGO6YclQ09
 uKqMSOKkpU/Dq9jG1yxEjE3j2E9lw97E6fzvpeA7l6jNcrAZahYQm0T
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002757_685439_6F56D065 
X-CRM114-Status: UNSURE (   5.27  )
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
ClVzZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgbG9naWMgdXNpbmcgLW1hYmkgaW5zdGVhZC4KClNp
Z25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJv
bml4LmRlPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDExICsrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZp
ZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCA2YjM5ZjM3Zjc2OWEuLmI0YzFmOTIyZWVkNSAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpA
QCAtMjUsNiArMjUsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgQVJDSF9FTkFCTEVfU1BMSVRf
UE1EX1BUTE9DSyBpZiBQR1RBQkxFX0xFVkVMUyA+IDIKIAlzZWxlY3QgQVJDSF9FTkFCTEVfVEhQ
X01JR1JBVElPTiBpZiBUUkFOU1BBUkVOVF9IVUdFUEFHRQogCXNlbGVjdCBBUkNIX0hBU19CSU5G
TVRfRkxBVAorCXNlbGVjdCBBUkNIX0hBU19DQ19DQU5fTElOSwogCXNlbGVjdCBBUkNIX0hBU19D
VVJSRU5UX1NUQUNLX1BPSU5URVIKIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfVklSVFVBTCBpZiBN
TVUKIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRQpAQCAtMTM1MSw2ICsxMzUyLDE2
IEBAIGNvbmZpZyBQT1JUQUJMRQogY29uZmlnIEFSQ0hfUFJPQ19LQ09SRV9URVhUCiAJZGVmX2Jv
b2wgeQogCitjb25maWcgQVJDSF9DQ19DQU5fTElOSworCWJvb2wKKwlkZWZhdWx0ICQoY2NfY2Fu
X2xpbmtfdXNlciwtbWFiaT1scDY0ZCkgaWYgNjRCSVQKKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtf
dXNlciwtbWFiaT1pbHAzMmQpCisKK2NvbmZpZyBBUkNIX1VTRVJGTEFHUworCXN0cmluZworCWRl
ZmF1bHQgIi1tYWJpPWxwNjRkIiBpZiA2NEJJVAorCWRlZmF1bHQgIi1tYWJpPWlscDMyZCIKKwog
bWVudSAiUG93ZXIgbWFuYWdlbWVudCBvcHRpb25zIgogCiBzb3VyY2UgImtlcm5lbC9wb3dlci9L
Y29uZmlnIgoKLS0tCmJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhkMGQw
NDAyN2NiMWU4CmNoYW5nZS1pZDogMjAyNTEyMjItY2MtY2FuLWxpbmstcmlzY3YtZGMwMzA0ZDI3
Y2Y0CgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
