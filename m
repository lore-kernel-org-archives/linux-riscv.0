Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A8C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ddfEKOQ01+aGWkGFaUvClILYfYn0j4JNQxhKmtL8wo=; b=vKxsr3/UsJB9Jc
	+/TmDtNmtPRkNc2bsW+r3klHYx3f3OLBDjXoVJUdB6gunjSGJj/VRh+yGEuDZVSqqXWKltExRGNOi
	q9/wZBkMonb9doDwFNnAZLq62agLlKk+gQRn4qXk1Z8jfno9wMFNN6R/b9ZuX5ex7UZwd9q3WRsfU
	y2FyxeRDoUk9Fu7DY8yNNvxwSub+m7eo9Q+acss2cMGzIG55+p9g94Xb7YPyPUDRPWz3jmlMdGQwI
	ER+htik9VIuFSAc+ssfl0GmaAXQfDfgNa6N3k4BoaK8Na03Ql++K8m46L8VdbemvnT1oPweOu9HQj
	K40ujUfPDJEDlcTCGgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHfi-00000009SFC-3uF9;
	Wed, 11 Jun 2025 09:23:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHf8-00000009S6l-1KBW
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 09:22:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtawFApvVC/il3WzGQ5ouLlAcuOcFQ89dR48c5s84KQ=;
	b=t2CcHL/NgPvPqqPO5DyCZ65WcPtZlecd4bwAusp8WJzx9DkTuK1mi3X7WoXgwRMTPQlDtu
	E2fudBz0nBDHxplzTT7TD7BJz79l3wmbBcGOcZ61Cf+RQgzJG8q9WQN16BMFwThSh25X1R
	kdHD2t2SaJBoGmQXanudASPg5lXZAaf2EsQkO+aTTe2u1t/6H1CgoDsFfJCPMQsZk4gvCY
	KbtJdALtEHnX1SbWi8ia6YtvZd+KaPE3JUEprRE+kWNgsaXGlVfrQvUwk1C3T4gqAqLiy9
	AwpLjDOmGbbLUo/q8YnA5w5xdTj0K+VCzuU8Sbq+2yuAuAOD/cRhylzrTnQH7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtawFApvVC/il3WzGQ5ouLlAcuOcFQ89dR48c5s84KQ=;
	b=xP7vQrJiwJzrto/eGP3l0LRHVTKCO8A0mjI0RKYg+ofFAFuliV0w5ytJUMJAq1i6wi+zcr
	xQhZeqrOHrHODfCQ==
Date: Wed, 11 Jun 2025 11:22:13 +0200
Subject: [PATCH v3 2/3] riscv: vdso: Disable LTO for the vDSO
MIME-Version: 1.0
Message-Id: <20250611-vdso-absolute-reloc-v3-2-47897d73784b@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=1308;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8B4x12CzHaxPC9X4pfyxH+ejQsD81seE02RnNXMkzSE=;
 b=MeVEZf4Tcm6ZHthWxkq9DUB7vjcgxE6V95k51kMGjendRw+PKJPPvVusb/jXN1+RUNZvon5rI
 Da78ZxH2LuxDWaGizyH12vN351IGlYgjYr82O6nMWi3zsWSrxFlm/8m
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_022226_495275_252F01FC 
X-CRM114-Status: UNSURE (   8.45  )
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

QWxsIHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIHN1cHBvcnRpbmcgTFRPICh4ODYsIGFybTY0LCBs
b29uZ2FyY2gpIGRvIG5vdAp1c2UgaXQgZm9yIHRoZSB2RFNPLgoKSXRzIGlzIHByb2JsZW1hdGlj
IGZvciBzb21lIHVwY29taW5nIGNvbXBpbGUtdGltZSB2YWxpZGF0aW9uIG9mIHRoZQpnZW5lcmF0
ZWQgb2JqZWN0IGNvZGUuClRoZSBMVE8gb2JqZWN0IGZpbGVzIGRvIG5vdCBjb250YWluIHRoZSBu
ZWNlc3NhcnkgcmVsb2NhdGlvbiBpbmZvcm1hdGlvbgphbmQgLWZsdG8tZmF0LW9iamVjdHMgaXMg
bm90IGNvbXBhdGlibGUgd2l0aCBjbGFuZyA8IDE2LgoKRm9yIGNvbnNpc3RlbmN5IGFuZCB0byBl
bmFibGUgdGhlIG1lbnRpb25lZCBjb21waWxlLXRpbWUgY2hlY2tzLApkaXNhYmxlIExUTyBmb3Ig
dGhlIHZEU08uClRoZSB2RFNPIGhlYXZpbHkgdXNlcyBfX2Fsd2F5c19pbmxpbmUgYW55d2F5cy4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by9NYWtlZmlsZQppbmRleCBjMTljM2M3NmY3YzlmNmIyZjc1MjNhNTkyNjlkZTNiNjgzNjU2MzIz
Li45ZjFiZjViYWU5YmQ0NzNlNDNkOWZkMzAyMmU5ZTFhMTg1MTI4YjczIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zk
c28vTWFrZWZpbGUKQEAgLTQ5LDcgKzQ5LDcgQEAgQ1BQRkxBR1NfdmRzby5sZHMgKz0gLURIQVNf
VkdFVFRJTUVPRkRBWQogZW5kaWYKIAogIyBEaXNhYmxlIC1wZyB0byBwcmV2ZW50IGluc2VydCBj
YWxsIHNpdGUKLUNGTEFHU19SRU1PVkVfVkRTTyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZM
QUdTX1NDUykKK0NGTEFHU19SRU1PVkVfVkRTTyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZM
QUdTX1NDUykgJChDQ19GTEFHU19MVE8pCiBDRkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9
ICQoQ0ZMQUdTX1JFTU9WRV9WRFNPKQogQ0ZMQUdTX1JFTU9WRV9nZXRyYW5kb20ubyA9ICQoQ0ZM
QUdTX1JFTU9WRV9WRFNPKQogQ0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENGTEFHU19SRU1P
VkVfVkRTTykKCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
