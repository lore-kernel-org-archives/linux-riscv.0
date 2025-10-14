Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C350ACCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SQu4jy+N8FzAD2TrjB/yNuY7NEAwkd8pKPLm8fWSTd0=; b=UP9RayJuEZgnI1
	kOtZA7wDOghvjD3YsvlBLP3dddmbkmB5U9Vv7iaLadwmh3C4HorFNyET/Fngzvz7Lsw+JTDRdCmxg
	vuK4WHz9Wp+VTL8cYXzhNFvtZg30cG9Wle/hXOJc/RWuc1tiUEmVY6YNiJcY5Ah9bfDr9LKoVj1h9
	QQF8eG5PZFDcaRnXxZTM1Qsm5BMxNdMBrYVWRo86JhiR/PlOncWtFHEkOe+qPuk/+Br92H8YA0943
	PulZLRYDbk4R3fQguLXqMv0KX5iqUphpXOTZEkSKPRMpx9vTQo2qBxveJsFUkl7pDZDW7kirE9KaV
	1A42tqSdukGG+roT6u4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej0-0000000GO4V-2fhy;
	Tue, 14 Oct 2025 13:05:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiv-0000000GNyY-3tDi
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:05:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	b=18Vfa1VRutbhgbwNI48uwRFrpTeK2iXMNNTzbDO0N7x5xONQbK5szxonq4ynVgVeOR87f9
	/+dAtUgG+zz8okIOlqkYHW9vY7SNupVCUbTCAqxN7EwLA1hzMKiXwWbVBQ9DVEN/ssMks+
	RqDArBFm87CsFc2oSx+Dv4YpO/+fKtgNsszjib2frMB4kascP6vDibG2NAlRKZT943QWaa
	4mfweieMQ011LjiIYvfP1TGplFbYSC7aCT7dAqz00Wny5AkFg4vyB285fS0T5qFYa6MVxE
	sGWYCA/M2PuyV8MB8h7ezU3qRTZ9gJtE3qJTK2ZBsEgJP5Cg22uDTnqXzKBEIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	b=s9uz1WXbQUnSkz0696jxjnrvflf58GlYGmSwbNzRqndYmmv20g7+eUgK1BDUYWwmkhWTAe
	JKbsLnaYtHUjhaAg==
Subject: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Date: Tue, 14 Oct 2025 15:05:15 +0200
Message-Id: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAItK7mgC/4WNQQqDMBBFryKz7pRMVLRdeY/iQk3UoZJIYoJFv
 HtTL9Dl+/DeP8Brx9rDMzvA6cierUkgbxkMc2cmjawSgxSyFDXl+O4DLwpD8lZnJ489bx5FPhB
 VqitUKSC5q9Mj71f31Sae2W/Wfa6bSL/1XzESCpTqMVZjQSTqvFnYhM1Zw/tdaWjP8/wCCbSiJ
 L4AAAA=
X-Change-ID: 20250813-kbuild-userprogs-bits-03c117da4d50
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1841;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nwdxilI0gCDF3hCKssRA5tQbRafKabX/iqdQVkTDYQU=;
 b=MxoQo1TizE+S8bqU4JcnOVpUGYj4wmq5FSvunih7gRn6DU94kLSoa3uxPTVhQdnPvJtR0bw14
 Kuj7ZjOyybgA7859XltD841WYT6mM+WPK2cYwKR5+PQFZK7588LnrSg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060554_102765_1215A945 
X-CRM114-Status: UNSURE (   8.31  )
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

VGhlIGN1cnJlbnQgbG9naWMgdG8gaW5oZXJpdCAtbTMyLy1tNjQgZnJvbSB0aGUga2VybmVsIGJ1
aWxkIG9ubHkgd29ya3MKZm9yIGEgZmV3IGFyY2hpdGVjdHVyZXMuIEl0IGRvZXMgbm90IGhhbmRs
ZSBieXRlIG9yZGVyIGRpZmZlcmVuY2VzLAphcmNoaXRlY3R1cmVzIHVzaW5nIGRpZmZlcmVudCBj
b21waWxlciBmbGFncyBvciBkaWZmZXJlbnQga2luZHMgb2YgQUJJcy4KCkludHJvZHVjZSBhIHBl
ci1hcmNoaXRlY3R1cmUgb3ZlcnJpZGUgbWVjaGFuaXNtIHRvIHNldCBDQ19DQU5fTElOSyBhbmQK
dGhlIGZsYWdzIHVzZWQgZm9yIHVzZXJwcm9ncy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnD
n3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KQ2hhbmdlcyBpbiB2
MjoKLSBSZWJhc2UgYW5kIGRyb3AgYWxyZWFkeSBhcHBsaWVkIHBhdGNoCi0gRGlzYWJsZSBDQ19D
QU5fTElOSyBpZiB0aGUgdGVzdCBwcm9ncmFtIGdlbmVyYXRlcyB3YXJuaW5ncwotIE1vdmUgdG8g
YXJjaGl0ZWN0dXJlLXNwZWNpZmljIGxvZ2ljCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI1MDgxMy1rYnVpbGQtdXNlcnByb2dzLWJpdHMtdjEtMC0yZDlmN2Y0MTEw
ODNAbGludXRyb25peC5kZQoKLS0tClRob21hcyBXZWnDn3NjaHVoICgxMCk6CiAgICAgIGtidWls
ZDogZG9uJ3QgZW5hYmxlIENDX0NBTl9MSU5LIGlmIHRoZSBkdW1teSBwcm9ncmFtIGdlbmVyYXRl
cyB3YXJuaW5ncwogICAgICBpbml0OiBkZWR1cGxpY2F0ZSBjYy1jYW4tbGluay5zaCBpbnZvY2F0
aW9ucwogICAgICBrYnVpbGQ6IGFsbG93IGFyY2hpdGVjdHVyZXMgdG8gb3ZlcnJpZGUgQ0NfQ0FO
X0xJTksKICAgICAgcmlzY3Y6IEltcGxlbWVudCBjdXN0b20gQ0NfQ0FOX0xJTksKICAgICAgczM5
MDogSW1wbGVtZW50IGN1c3RvbSBDQ19DQU5fTElOSwogICAgICBwb3dlcnBjOiBJbXBsZW1lbnQg
Y3VzdG9tIENDX0NBTl9MSU5LCiAgICAgIE1JUFM6IEltcGxlbWVudCBjdXN0b20gQ0NfQ0FOX0xJ
TksKICAgICAgeDg2L0tjb25maWc6IEltcGxlbWVudCBjdXN0b20gQ0NfQ0FOX0xJTksKICAgICAg
c3BhcmM6IEltcGxlbWVudCBjdXN0b20gQ0NfQ0FOX0xJTksKICAgICAga2J1aWxkOiBzaW1wbGlm
eSBDQ19DQU5fTElOSwoKIE1ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDggKysrKysrLS0KIGFy
Y2gvbWlwcy9LY29uZmlnICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCiBhcmNoL3Bvd2VycGMv
S2NvbmZpZyAgICB8IDE1ICsrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
fCAxMSArKysrKysrKysrKwogYXJjaC9zMzkwL0tjb25maWcgICAgICAgfCAxMSArKysrKysrKysr
KwogYXJjaC9zcGFyYy9LY29uZmlnICAgICAgfCAxMSArKysrKysrKysrKwogYXJjaC94ODYvS2Nv
bmZpZyAgICAgICAgfCAxMSArKysrKysrKysrKwogaW5pdC9LY29uZmlnICAgICAgICAgICAgfCAg
NyArKysrKy0tCiBzY3JpcHRzL0tjb25maWcuaW5jbHVkZSB8ICAzICsrKwogc2NyaXB0cy9jYy1j
YW4tbGluay5zaCAgfCAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAxMGY4MjEwYzdhNzA5ODg5N2ZjZWU1Y2E3
MDIzNjE2N2IzOWViNzk3CmNoYW5nZS1pZDogMjAyNTA4MTMta2J1aWxkLXVzZXJwcm9ncy1iaXRz
LTAzYzExN2RhNGQ1MAoKQmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIFdlacOfc2NodWggPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
