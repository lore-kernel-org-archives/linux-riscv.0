Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0ECCD195
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfwGx0HO98bO1oiG81kS84Ibbsf5tN+8615zzB241S8=; b=RSZXseGY0sYGM9
	jBo7m/zHMd3mK5FWN0AcGpIlzJXharcERxMjuW8R+p/RGXCyCUIKk4lnijWwTNd/mBaXov4BpmK48
	rIqGPSrBiVptTS9c5HsCbzzXPs/MhCmle2shdoVr6kiQwVF+VZGnurkzW4Jl++b5KfbkQNIgYQux2
	mUEnb6VF1tt2M1kBVvfuq06QfoEYcYNaw85QbMx+AeX3IeRLrsKb07Oyq6YOJvyQBNGSgaCPjDC4r
	rGuFC1xpgt/Dmlk9JF3w0r85NkAgvSce9Cg3AfeslsUhwg0afov5DOTNVyz9h9++Xjblt7jwIRgNY
	7RaAdk78O+/ZVmIgYXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej2-0000000GO6Q-1yFv;
	Tue, 14 Oct 2025 13:06:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eix-0000000GNyo-0O76
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:05:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KptW+UoLghQMXOrNEBqzO3AErvEefbVuNoRlZvx97M=;
	b=oiNyH0PrK2xokgY/xRhYNh34O73m7EA1Pd8tkaIavxgzOcrBF7zJ4XwQGBgGA5DU2iz/p7
	zaGrtCdce56tduJqMybiZ6QG81A0ZQoupCxGlAwsyLQaqgfxVGfsM9/jLWqA5EKNwbRviH
	ZcWmsSCz6F37BEIeuvksoJuw7QI4dksDTXdACC039A6SeRr9w44U1McKyStTT7JU6BDLT9
	fu+6KJ/VYtPYJpN6wgaxmMvup8Sz40YT7m3JkJyhA2oGzQBYdyA04l/0xeG5lNAxGNdfi8
	Ol3MFMaZqs2RgzvuGUPde8NSabkiWpQDYKdLZ/OF0rB3VyPDWC6X3folzw0Qtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KptW+UoLghQMXOrNEBqzO3AErvEefbVuNoRlZvx97M=;
	b=IoJDo/mzsy5EWQOiAfu4TeoGsMkP1SmEZRcdfUfHvULsIDGeDHduiJKKAnuHzb9T9FPVhM
	9Bvuta2MxEAH+oDw==
Date: Tue, 14 Oct 2025 15:05:17 +0200
Subject: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1820;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cw6izJuCa9EwT35MsVWlQDliEz9mJYF0jA7XnDSqJhQ=;
 b=qMY3Zy0dOvDZ1jAtW9lSVtESua5rKfZ3bqAQERTzgb0DzSXGykCYkjWMB+HI0PnYvxaG/bwqb
 20TGDGAlQTbAqfhSInd0ke9McDq+UPb7BHmRRYxbey9/g06LyFjbTwr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060555_322953_BF56AB7E 
X-CRM114-Status: UNSURE (   9.49  )
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

VGhlIGNvbW1hbmQgdG8gaW52b2tlIHNjcmlwdHMvY2MtY2FuLWxpbmsuc2ggaXMgdmVyeSBsb25n
IGFuZCBuZXcgdXNhZ2VzCmFyZSBhYm91dCB0byBiZSBhZGRlZC4KCkFkZCBhIGhlbHBlciB2YXJp
YWJsZSB0byBtYWtlIHRoZSBjb2RlIGVhc2llciB0byByZWFkIGFuZCBtYWludGFpbi4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KIGluaXQvS2NvbmZpZyAgICAgICAgICAgIHwgNCArKy0tCiBzY3JpcHRzL0tjb25m
aWcuaW5jbHVkZSB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbml0L0tjb25maWcgYi9pbml0L0tjb25maWcKaW5k
ZXggY2FiM2FkMjhjYTQ5ZTdhYzkzMDIwN2M5Y2RlOGQ0MzFkNTVkYzdhZi4uN2I3MjJlNzE0ZDVj
NWEwNTgwNDY3OTE0YjIyNmRjMDcwMGVjMDc5NyAxMDA2NDQKLS0tIGEvaW5pdC9LY29uZmlnCisr
KyBiL2luaXQvS2NvbmZpZwpAQCAtODQsOCArODQsOCBAQCBjb25maWcgUlVTVENfTExWTV9WRVJT
SU9OCiAKIGNvbmZpZyBDQ19DQU5fTElOSwogCWJvb2wKLQlkZWZhdWx0ICQoc3VjY2VzcywkKHNy
Y3RyZWUpL3NjcmlwdHMvY2MtY2FuLWxpbmsuc2ggJChDQykgJChDTEFOR19GTEFHUykgJChVU0VS
Q0ZMQUdTKSAkKFVTRVJMREZMQUdTKSAkKG02NC1mbGFnKSkgaWYgNjRCSVQKLQlkZWZhdWx0ICQo
c3VjY2VzcywkKHNyY3RyZWUpL3NjcmlwdHMvY2MtY2FuLWxpbmsuc2ggJChDQykgJChDTEFOR19G
TEFHUykgJChVU0VSQ0ZMQUdTKSAkKFVTRVJMREZMQUdTKSAkKG0zMi1mbGFnKSkKKwlkZWZhdWx0
ICQoY2NfY2FuX2xpbmtfdXNlciwkKG02NC1mbGFnKSkgaWYgNjRCSVQKKwlkZWZhdWx0ICQoY2Nf
Y2FuX2xpbmtfdXNlciwkKG0zMi1mbGFnKSkKIAogIyBGaXhlZCBpbiBHQ0MgMTQsIDEzLjMsIDEy
LjQgYW5kIDExLjUKICMgaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/
aWQ9MTEzOTIxCmRpZmYgLS1naXQgYS9zY3JpcHRzL0tjb25maWcuaW5jbHVkZSBiL3NjcmlwdHMv
S2NvbmZpZy5pbmNsdWRlCmluZGV4IDMzMTkzY2E2ZTgwMzBlNjU5ZDZiMzIxYWNhZWExYWNkNDJj
Mzg3YTQuLmQ0MjA0MmI2YzllMjQzYjQ2ZDE2MjZkODkyYzBjOTg2NjIxY2U0NjIgMTAwNjQ0Ci0t
LSBhL3NjcmlwdHMvS2NvbmZpZy5pbmNsdWRlCisrKyBiL3NjcmlwdHMvS2NvbmZpZy5pbmNsdWRl
CkBAIC02NSw2ICs2NSw5IEBAIGNjLW9wdGlvbi1iaXQgPSAkKGlmLXN1Y2Nlc3MsJChDQykgLVdl
cnJvciAkKDEpIC1FIC14IGMgL2Rldi9udWxsIC1vIC9kZXYvbnVsbCwkCiBtMzItZmxhZyA6PSAk
KGNjLW9wdGlvbi1iaXQsLW0zMikKIG02NC1mbGFnIDo9ICQoY2Mtb3B0aW9uLWJpdCwtbTY0KQog
CisjIFRlc3Qgd2hldGhlciB0aGUgY29tcGlsZXIgY2FuIGxpbmsgdXNlcnNwYWNlIGFwcGxpY2F0
aW9ucworY2NfY2FuX2xpbmtfdXNlciA9ICQoc3VjY2VzcywkKHNyY3RyZWUpL3NjcmlwdHMvY2Mt
Y2FuLWxpbmsuc2ggJChDQykgJChDTEFOR19GTEFHUykgJChVU0VSQ0ZMQUdTKSAkKFVTRVJMREZM
QUdTKSAkKDEpKQorCiBydXN0Yy12ZXJzaW9uIDo9ICQoc2hlbGwsJChzcmN0cmVlKS9zY3JpcHRz
L3J1c3RjLXZlcnNpb24uc2ggJChSVVNUQykpCiBydXN0Yy1sbHZtLXZlcnNpb24gOj0gJChzaGVs
bCwkKHNyY3RyZWUpL3NjcmlwdHMvcnVzdGMtbGx2bS12ZXJzaW9uLnNoICQoUlVTVEMpKQogCgot
LSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
