Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F901CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdRAV1F5yrbNd+1is8yIrvr8ADf+Oa+HPzyOfAmJ4QA=; b=Q3dThiqNvtYNhE
	2klQNcWY3Zc1bBFvj3VbVJZ5ALltbHxoW1zsJf+piTvUuwx+0yuF4oiHA1w5iR2etZlesO852cmVz
	gynbITv7MImra2O4qyDdhMTuRG7csb9ab7h+KF3WhZCkLFJ5OIX/hPM8/LB4xglF74I3n0F3YMBG9
	IV/wvmEUf8mZGLsIlZou6jJBrLMVWaFoLpc0oyrtyrfaLRCVSuuBsrvWwCJ0l6PNDQ3O02GaUT/xs
	24jMxXNwGTX6aKXChx0WPNXkdjjN4wz7QePgmUVFKt7qgDTZuCEeFtQb+hTwLxRtP/v2IiL98NMXt
	oMW1zpVvHMfLux58Wddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mnf-00000005dR3-1pM3;
	Thu, 09 Oct 2025 09:19:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mnc-00000005dQT-42Il
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 09:19:02 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760001536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UAlkyoGOGlX43ewp3RiIlt9XuiNaKsCiHe1555MXTTw=;
	b=KTamAI1LJAlhRTJNw5n2/jzEEAawoORHlipMsayJnr05iQ3UnN/j5joDKP0ORQrJgRsVSK
	BdrYYRb7vxtdM3vtDEn1OOo9rn+WUMX67xT0ydpJjRqUTPJcMwpFgLdYUp07Jj5+QmVtDw
	xW/3TSQyOyySEPJUgBuK3yl4z2q9/62orxKX1cm9ckDFZjpynkZLS5FsTPb5iwzF916GrH
	/QTUnJUaqQ4FO0QjizxdGeyGa4GHFL98Q5i5ioJBq2vmF3vcvJuoy2eaD7aNRdqPwU4wAY
	NnwNn+TzQB+W5nFNlv6jJGmSAcIdm9fjEgxtPb4uQHcr7TqftSfaZ9lKLnHqdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760001536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UAlkyoGOGlX43ewp3RiIlt9XuiNaKsCiHe1555MXTTw=;
	b=juoREpc40lMETELBUiC8g1yaBR0p6OGGkTvANajb/qZzDnp0a8ghy5+1S0y9HsKfnU71GQ
	Apg0K8wBp75973BA==
Date: Thu, 09 Oct 2025 11:18:48 +0200
Subject: [PATCH] riscv: Respect dependencies of ARCH_HAS_ELF_CORE_EFLAGS
MIME-Version: 1.0
Message-Id: <20251009-riscv-elf-core-eflags-v1-1-e9b45ab6b36d@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAPd952gC/x3MywqDMBBG4VeRWTuQxEtpX0VcpMkfOyBaZkAE8
 d0buvwW51xkUIHRq7lIcYjJvlX4tqH0idsCllxNwYXBO/dkFUsHYy2cdgWjrHEx7gJcn0efH/F
 Ntf0qipz/7zTf9w85LeLsZwAAAA==
X-Change-ID: 20251009-riscv-elf-core-eflags-32e04d61d7ab
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Svetlana Parfenova <svetlana.parfenova@syntacore.com>, 
 Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760001534; l=1329;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HmXnlIwehpwXUPcql2B7lKPbYC1T44pGt7GB8oS1HHg=;
 b=dCU5eASiT/xtv9CLMS6h1yeRtyxHvH2B5hcxXyM6Z1gmZllf43NkPqI3G4wWCVpMPHhF4IDkx
 /Df5KUWsRWgDDb0QCFXNcwqa7jE/2odJpTIftECL+swzu2JleO9eVAE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_021901_163038_B98F96CF 
X-CRM114-Status: UNSURE (   7.71  )
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

VGhpcyBrY29uZmlnIHN5bWJvbCBoYXMgZGVwZW5kZW5jaWVzIGFuZCBpcyBvbmx5IHNlbGVjdGFi
bGUgaWYgdGhvc2UKZGVwZW5kZW5jaWVzIGFyZSBhbHNvIGVuYWJsZWQuCgpSZXNwZWN0IHRoZSBk
ZXBlbmRlbmNpZXMuCgpGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgd2hlbiBjb25maWd1cmlu
ZyBhbiAnYWxsbm9jb25maWcnOgoKV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBk
ZXRlY3RlZCBmb3IgQVJDSF9IQVNfRUxGX0NPUkVfRUZMQUdTCiAgRGVwZW5kcyBvbiBbbl06IEJJ
TkZNVF9FTEYgWz1uXSAmJiBFTEZfQ09SRSBbPXldCiAgU2VsZWN0ZWQgYnkgW3ldOgogIC0gUklT
Q1YgWz15XQoKRml4ZXM6IDhjOTRkYjBhZTk3YyAoImJpbmZtdF9lbGY6IHByZXNlcnZlIG9yaWdp
bmFsIEVMRiBlX2ZsYWdzIGZvciBjb3JlIGR1bXBzIikKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdl
acOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9yaXNj
di9LY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCmluZGV4IDBjNjAzOGRjNWRmZDUyOWUxZmU2MjNmNmJjMjcyOWEzODhiMzNmZGUuLjIyY2Rh
OWM0NTJkMmE5OTUyOWU3ZDZhMjY4YTkzOTI2ZGI1MTg1OWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTI5LDcgKzI5LDcgQEAgY29u
ZmlnIFJJU0NWCiAJc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1ZJUlRVQUwgaWYgTU1VCiAJc2VsZWN0
IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUKIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfV1gKLQlz
ZWxlY3QgQVJDSF9IQVNfRUxGX0NPUkVfRUZMQUdTCisJc2VsZWN0IEFSQ0hfSEFTX0VMRl9DT1JF
X0VGTEFHUyBpZiBCSU5GTVRfRUxGICYmIEVMRl9DT1JFCiAJc2VsZWN0IEFSQ0hfSEFTX0ZBU1Rf
TVVMVElQTElFUgogCXNlbGVjdCBBUkNIX0hBU19GT1JUSUZZX1NPVVJDRQogCXNlbGVjdCBBUkNI
X0hBU19HQ09WX1BST0ZJTEVfQUxMCgotLS0KYmFzZS1jb21taXQ6IGVjNzE0ZTM3MWYyMmY3MTZh
MDRlNmVjYjJhMjQ5ODhjOTJiMjY5MTEKY2hhbmdlLWlkOiAyMDI1MTAwOS1yaXNjdi1lbGYtY29y
ZS1lZmxhZ3MtMzJlMDRkNjFkN2FiCgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
