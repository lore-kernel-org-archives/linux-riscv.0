Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E186C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTzW7UcGlIqwXEQEpF8MNJpkIixrMfQ8tLrjwXSE5yE=; b=JeFUTPJLGyE6Dc
	E+USC5rFruDF8QSILShC0oMMZ00UsxT1SkehS/MxV1ghYyho0KGUp7eSwjr8QM+CFgwGZROfokktu
	aFohAuodda70j7zVYMDwMCRAZrRTYDyrItVIbI5n5PZxD6Mtfut2WTYew6ZXwu8mLMETI3shfuo+w
	Q792p24xTTAIb8VoUP4JmGrPbQCYBatPf9azsgIEaOA+31okLY/DZJe3xBQb5mbQ+VtSz9Cvq7K+m
	EF2ThJLOmLZU6lO405UDIE2pehkh4KkjoXljCW6VsG4mU/kGx1GK9XlBTD7fwnisNbkiWtB8AsV0O
	EQMz4gbeBCxUog2uKklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer8Q-00000001BSH-1tgN;
	Wed, 01 Jul 2026 09:21:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer8N-00000001BQa-3RJl
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:21:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782897687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZTHPrI4IM81/CExa8gXGUexuM3Q0SH52YtJqQ1ZRIM=;
	b=qLExgf/zidv5RV/7Q70dezrp0I6TovxjLZ/Uxy+mzJsItwLmbULuMcWXtMFp8fq/LKp9pu
	+94Bu66jpRQTFhBMeOjGNpEh5sPSpH5cUnN9b+IqTx/XDybqGJLJjCFCmi+Pi5dxjwhoVi
	4LpWqldjLGa8cc6C89V/bKi3kD0wL9Mjdvr2i44SI7ghx2TNpgGEp8/U9HrMMZ7p/aydBD
	l8TaoyqbgaIhVm3UXTp0q/VU3VWqV4/75xBeCMZ0FKram8UwNwxsvoKnianF+wkQ6qltiP
	ZBww19KqrlH7BZWnnQ49io+WhrkllBEJKbbZ5uz0mIbvl6oG4yJYLjH+s5TOGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782897687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZTHPrI4IM81/CExa8gXGUexuM3Q0SH52YtJqQ1ZRIM=;
	b=iSBZwsbwunqy0uUPMJoFZyYyGUDsylfBmObKjuv0FrRLC+aw3cyH3ZNwiQ1BiR2nj+Pg2h
	xFG2Tjdug+lz3aBw==
Date: Wed, 01 Jul 2026 11:21:22 +0200
Subject: [PATCH 1/2] riscv: vdso: Do not use LTO for the vDSO
MIME-Version: 1.0
Message-Id: <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
In-Reply-To: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Wende Tan <twd2.me@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 kernel test robot <lkp@intel.com>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782897683; l=1567;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=x1MoegCY6YEEWIzYOP6qLgLJzGXz39X22orJAX7mHVY=;
 b=zQHfOUpebyL5rgX0Mbz4u0oHJzSMpORSRNHVgS/rlmQKMgOzBBwelbAYq7OBLvRTre7APEoOu
 83oTc3bpBwYCq4Rcg+nXy+pGCNj4CT+NZ6E85GjoujQqZsytYVSPsc4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_022132_053930_9CAF70D9 
X-CRM114-Status: UNSURE (   7.50  )
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

V2l0aCBMVE8gZW5hYmxlZCB0aGUgY29tcGlsZXIgYXNzdW1lcyB0aGF0IHRoZSB2RFNPIGZ1bmN0
aW9ucyBhcmUgbm90CnVzZWQgYW5kIG9wdGltaXplcyB0aGVtIGF3YXkgY29tcGxldGVseS4gQ3Vy
cmVudGx5IHRoaXMgaGFwcGVucyB0bwpfX3Zkc29fY2xvY2tfZ2V0cmVzKCksIF9fdmRzb19jbG9j
a19nZXR0aW1lKCksIF9fdmRzb19nZXRyYW5kb20oKSwKX192ZHNvX2dldHRpbWVvZmRheSgpIGFu
ZCBfX3Zkc29fcmlzY3ZfaHdwcm9iZSgpLgoKRGlzYWJsZSBMVE8gZm9yIHRoZSB2RFNPLCBhcyB0
aGVzZSBmdW5jdGlvbnMgYXJlIGhhbmQtb3B0aW1pemVkIGFueXdheXMuCgpSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDYzMDE4NTUuV3ZrU0M0a0QtbGtwQGludGVsLmNv
bS8KRml4ZXM6IDAyMWQyMzQyOGJkYiAoIlJJU0MtVjogYnVpbGQ6IEFsbG93IExUTyB0byBiZSBz
ZWxlY3RlZCIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFRob21h
cyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gv
cmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQppbmRl
eCBhODQyZGMwMzQ1NzEuLjQzZWU4ODFmNmM2ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdmRzby9NYWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCkBA
IC02OSw5ICs2OSw5IEBAIENQUEZMQUdTXyQodmRzb19sZHMpICs9IC1ESEFTX1ZHRVRUSU1FT0ZE
QVkKIGVuZGlmCiAKICMgRGlzYWJsZSAtcGcgdG8gcHJldmVudCBpbnNlcnQgY2FsbCBzaXRlCi1D
RkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZM
QUdTX1NDUykKLUNGTEFHU19SRU1PVkVfZ2V0cmFuZG9tLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkg
JChDQ19GTEFHU19TQ1MpCi1DRkxBR1NfUkVNT1ZFX2h3cHJvYmUubyA9ICQoQ0NfRkxBR1NfRlRS
QUNFKSAkKENDX0ZMQUdTX1NDUykKK0NGTEFHU19SRU1PVkVfdmdldHRpbWVvZmRheS5vID0gJChD
Q19GTEFHU19GVFJBQ0UpICQoQ0NfRkxBR1NfU0NTKSAkKENDX0ZMQUdTX0xUTykKK0NGTEFHU19S
RU1PVkVfZ2V0cmFuZG9tLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19GTEFHU19TQ1MpICQo
Q0NfRkxBR1NfTFRPKQorQ0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENDX0ZMQUdTX0ZUUkFD
RSkgJChDQ19GTEFHU19TQ1MpICQoQ0NfRkxBR1NfTFRPKQogCiAjIEZvcmNlIGRlcGVuZGVuY3kK
ICQob2JqKS8kKHZkc29fbyk6ICQob2JqKS8kKHZkc29fc28pCgotLSAKMi41NS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
