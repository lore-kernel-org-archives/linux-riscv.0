Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7400C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hd00zHaeWwWuMgz2nNzvdhJOqzM71ZXnku42Fht6ZI=; b=f18EWMemWUlXAV
	YFoGxNIyI0So5ViKXzM6rp/5sONhu/AQLu0OM4yVOviWiJDxQn2p2VxwZaB/p1Ox8ioQNKpU7icjU
	hK5dyfDXy1GEmpfSmNfo9A4eDfTp2I1nyx+uUf7Jpyf+THLG4XcW1MB57RV7VAx0/Bm0tQ7xpYDS1
	IbfrHC91YCzOEJJVR6J1dXkCeQN/zktwYZf7xpTCefhDV/x1ZGVk8W4HTx0jlbW1kpSpTWo+mPV3U
	JYHQM1+XhTbPi5zlLikXDOJnNXOKrcfKusQWqtQhN7jX8a1wkziKiGO9gAtkCDM2gKFwX6mAcUhU8
	zhasJUGq1Y1VP1gRofmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer8R-00000001BT5-2dzq;
	Wed, 01 Jul 2026 09:21:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer8P-00000001BQo-1Fy4
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:21:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782897690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27q4iLnrUGIHqDMHJ/k2A5c3Vrz1J6f+nJEVdonVQ+A=;
	b=2B2lL4s9cRjBm7FMkFtqmwvniVFGikslUZs5C6yipsMcbAbpZmpqhFXXP8L6H+h9qe9pWI
	JEVmX/FF8gwqMNk+lrug9Hi0sCGlZsBO+P29dU0zZ+QgAQONytwAuoDNSjFuzaxYcF+pka
	xhTjx2NsKtx9e/xMCtW5B3wKK3QblegvQmXIr62O2Lj6hZ1VAofDOJuloyqiXsDTSew3IT
	E4bGQepNydpvDAVe5prtCO/3AdSToRJfR03/Qx5Zzw/ZyacPpL2EhjjjKWBT1hpKFBd6u6
	6o1MpQehUAk4YD5aU53G+sdymJYat0siDP1SnYz0B6QlAKj90QXHFvw+0eOqrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782897690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27q4iLnrUGIHqDMHJ/k2A5c3Vrz1J6f+nJEVdonVQ+A=;
	b=vkfI9ExVDs1nkBqtHii4jvmBs8MgtF/T0TrsOQoAzT9SyB2mKLRoYvVjaVCRmWstIK+nGU
	Yirb+ZbgA61QXUBg==
Date: Wed, 01 Jul 2026 11:21:23 +0200
Subject: [PATCH 2/2] riscv: vdso: Simplify cflags remove logic
MIME-Version: 1.0
Message-Id: <20260701-riscv-vdso-lto-v1-2-89db0cd82077@linutronix.de>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
In-Reply-To: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Wende Tan <twd2.me@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782897683; l=1374;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dWPIAgjSItKoBCqbiVV+xGlpzRl+qs+6PTj99ayOIqM=;
 b=8uNjbtWX7MN6o4gooAD+PMI2lnFNr1h6nJDxSSF/31LzygDzHygzW31VeB3WhUXJs/r5E7Mhp
 DOSiVjHn6N2DCQ604wUAEzeA9PkzaemhoXGarZiHYToLfm8Wvhi3EeM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_022133_485764_8A33E5CE 
X-CRM114-Status: UNSURE (   6.18  )
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

TGlzdGluZyBhbGwgZmxhZ3MgZm9yIGVhY2ggb2JqZWN0IGZpbGUgaXMgdGVkaW91cyBhbmQgZXJy
b3ItcHJvbmUuCgpSZXBsYWNlIGl0IHdpdGggYSBzaW1wbGVyIHNvbHV0aW9uLgoKTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjMwMTM1MzE2LWYyNmYwZTBmLWMwOGMtNGQ0
ZC05OTYzLTEwZjk5ODVhNzY4OUBsaW51dHJvbml4LmRlLwpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
V2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCmluZGV4
IDQzZWU4ODFmNmM2Zi4uOGRiZjI1MzJhNTczIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKQEAg
LTQxLDYgKzQxLDggQEAgY2NmbGFncy15ICs9ICQoQ0ZJX0ZVTEwpCiBhc2ZsYWdzLXkgKz0gJChL
QlVJTERfQkFTRV9JU0EpJChDRklfTUFSQ0gpCiBhc2ZsYWdzLXkgKz0gJChDRklfRlVMTCkKIAor
Y2NmbGFncy1yZW1vdmUteSArPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19GTEFHU19TQ1MpICQo
Q0NfRkxBR1NfTFRPKQorCiBpZm5lcSAoJChjLWdldHRpbWVvZmRheS15KSwpCiAgIENGTEFHU192
Z2V0dGltZW9mZGF5Lm8gKz0gLWZQSUMgLWluY2x1ZGUgJChjLWdldHRpbWVvZmRheS15KQogZW5k
aWYKQEAgLTY4LDExICs3MCw2IEBAIGlmbmVxICgkKGZpbHRlciB2Z2V0dGltZW9mZGF5LCAkKHZk
c28tc3ltcykpLCkKIENQUEZMQUdTXyQodmRzb19sZHMpICs9IC1ESEFTX1ZHRVRUSU1FT0ZEQVkK
IGVuZGlmCiAKLSMgRGlzYWJsZSAtcGcgdG8gcHJldmVudCBpbnNlcnQgY2FsbCBzaXRlCi1DRkxB
R1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKSAkKENDX0ZMQUdT
X1NDUykgJChDQ19GTEFHU19MVE8pCi1DRkxBR1NfUkVNT1ZFX2dldHJhbmRvbS5vID0gJChDQ19G
TEFHU19GVFJBQ0UpICQoQ0NfRkxBR1NfU0NTKSAkKENDX0ZMQUdTX0xUTykKLUNGTEFHU19SRU1P
VkVfaHdwcm9iZS5vID0gJChDQ19GTEFHU19GVFJBQ0UpICQoQ0NfRkxBR1NfU0NTKSAkKENDX0ZM
QUdTX0xUTykKLQogIyBGb3JjZSBkZXBlbmRlbmN5CiAkKG9iaikvJCh2ZHNvX28pOiAkKG9iaikv
JCh2ZHNvX3NvKQogCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
