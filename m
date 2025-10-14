Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C78CCCD198
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVxbQ/teug9PGH6RcrBBdL785wqj8FKjoaqgpKoa5Hk=; b=KgKOLLAk4MNpcf
	TqfbLlGbLbwlovwWalVxPeOBvBvLjpKBrNXUz9K/RF5hTO2G+UgjexG9FMA4QlKNsWdY1v/CAKXDp
	hK6DCcvkno+sfhmS2nM49zdh1v/YWZpdEZi+x/ZtkBsPtEJD7Jl7Mo8cM+Ta2sYKC/QMHtBs6Vbk4
	DDyPDSvIovbVyJnQvJKG0i1izreofxkAQ+lOtNkaPD3w5aHZfEDGZMZO2dEn5JVLiATGicvlnqRa1
	P7bC/6K/GONnDek8ccg3Zt8BbFfGNpbIthsjOHmafbJOGO2X0XmNx3iyuHv6VSTzgirozh4b8SPOX
	oYv2LobP0EPi+oIODGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej6-0000000GO9d-1aZU;
	Tue, 14 Oct 2025 13:06:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiz-0000000GO1A-2ZWv
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:06:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	b=Vzd9X37JzWVNDax9xF7gUtygBZfPFaA3gsNq68iYTXU84peT0r3N8MbT2m2gSyuEWOp475
	oR+vVdCmcqytsiwYiC6b/bE6d/82PiwkIPqrAvPK4pLAOLq5oJluEKE4Ej6AWHFXvKRgRP
	cuuYJ9oQ/giOO8oM7d9galUCfWv5BUQogZCB3n0avBH2xCchZEYbEG8Y23WkWP8S9lkqBe
	sXljt99G0QRpZzxPiMEntfQiVi7KL/+ysk3fM+CyHJAHBi3n6B8rskNRKW2kRWW7tRLHFH
	gM4uGdxfzGFPYPXkvPD4Uuaw7fSqO2n2Cw19SsmwKTwwJi8bz96YTPC8Ibjw8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	b=TWmuMW95i4+CfhBBZ5SlvE9frAHrOqOTHwnuv5oXGcDx7/vcAsqhO3HRTC6MIdlDBbjCEx
	MiSFQwwp28wI7oCQ==
Date: Tue, 14 Oct 2025 15:05:22 +0200
Subject: [PATCH v2 07/10] MIPS: Implement custom CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-7-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1586;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=N71PVC1EfqSrxafXCVGnmlQykhL538a8yG+n3pVRhVs=;
 b=Hqg5+Zs1tdClXCVe2TNzjiX+1s7O2uQEAdV1tuC5lSBxirEybZXF94igzHK2M6GzMASu/egXy
 uBKrmuF+mr3AlBuXbEkMD7e4WRZW54J2F/40AVnKmentil9eMRb4dJa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060557_795624_44F1AC87 
X-CRM114-Status: UNSURE (   7.20  )
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

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIGRvZXMgbm90IGhhbmRsZSBkaWZmZXJl
bnQgYnl0ZSBvcmRlcnMuClRoaXMgbWF5IGxlYWQgdG8gdXNlcnByb2dzIHdoaWNoIGFyZSBub3Qg
YWN0dWFsbHkgcnVubmFibGUgb24gdGhlIHRhcmdldAprZXJuZWwuCgpVc2UgYXJjaGl0ZWN0dXJl
LXNwZWNpZmljIGxvZ2ljIHN1cHBvcnRpbmcgYnl0ZSBvcmRlcnMgaW5zdGVhZC4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGFyY2gvbWlwcy9LY29uZmlnIHwgMTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9LY29uZmlnIGIv
YXJjaC9taXBzL0tjb25maWcKaW5kZXggZTg2ODNmNThmZDNlMmE0M2JmOTM4NGUxYzNjM2U0NTRh
OGU1OTg2MS4uYjRmMDc1NThhZDM5NWViOWJiNjI2YTI2NGEyZTAwZmRmYmRiN2Y3MiAxMDA2NDQK
LS0tIGEvYXJjaC9taXBzL0tjb25maWcKKysrIGIvYXJjaC9taXBzL0tjb25maWcKQEAgLTQsNiAr
NCw3IEBAIGNvbmZpZyBNSVBTCiAJZGVmYXVsdCB5CiAJc2VsZWN0IEFSQ0hfMzJCSVRfT0ZGX1Qg
aWYgITY0QklUCiAJc2VsZWN0IEFSQ0hfQklORk1UX0VMRl9TVEFURSBpZiBNSVBTX0ZQX1NVUFBP
UlQKKwlzZWxlY3QgQVJDSF9IQVNfQ0NfQ0FOX0xJTksKIAlzZWxlY3QgQVJDSF9IQVNfQ1BVX0NB
Q0hFX0FMSUFTSU5HCiAJc2VsZWN0IEFSQ0hfSEFTX0NQVV9GSU5BTElaRV9JTklUCiAJc2VsZWN0
IEFSQ0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRFUgpAQCAtMzEyNiw2ICszMTI3LDIwIEBAIGNv
bmZpZyBDQ19IQVNfTU5PX0JSQU5DSF9MSUtFTFkKIGNvbmZpZyBDQ19IQVNfQlJPS0VOX0lOTElO
RV9DT01QQVRfQlJBTkNICiAJZGVmX2Jvb2wgeSBpZiBDQ19JU19DTEFORwogCitjb25maWcgQVJD
SF9DQ19DQU5fTElOSworCWJvb2wKKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlciwtbTY0IC1F
TCkgaWYgNjRCSVQgJiYgQ1BVX0xJVFRMRV9FTkRJQU4KKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtf
dXNlciwtbTY0IC1FQikgaWYgNjRCSVQgJiYgQ1BVX0JJR19FTkRJQU4KKwlkZWZhdWx0ICQoY2Nf
Y2FuX2xpbmtfdXNlciwtbTMyIC1FTCkgaWYgQ1BVX0xJVFRMRV9FTkRJQU4KKwlkZWZhdWx0ICQo
Y2NfY2FuX2xpbmtfdXNlciwtbTMyIC1FQikgaWYgQ1BVX0JJR19FTkRJQU4KKworY29uZmlnIEFS
Q0hfVVNFUkZMQUdTCisJc3RyaW5nCisJZGVmYXVsdCAiLW02NCAtRUwiIGlmIDY0QklUICYmIENQ
VV9MSVRUTEVfRU5ESUFOCisJZGVmYXVsdCAiLW02NCAtRUIiIGlmIDY0QklUICYmIENQVV9CSUdf
RU5ESUFOCisJZGVmYXVsdCAiLW0zMiAtRUwiIGlmIENQVV9MSVRUTEVfRU5ESUFOCisJZGVmYXVs
dCAiLW0zMiAtRUIiIGlmIENQVV9CSUdfRU5ESUFOCisKIG1lbnUgIlBvd2VyIG1hbmFnZW1lbnQg
b3B0aW9ucyIKIAogY29uZmlnIEFSQ0hfSElCRVJOQVRJT05fUE9TU0lCTEUKCi0tIAoyLjUxLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
