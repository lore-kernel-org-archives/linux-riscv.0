Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FED0CCD194
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4S4hRNirOwC2ixRJm3gdAir9gf7KqX7JNJ1HJahSu0=; b=IZwwFxClDkKVDq
	42VUdEnE9UIdhG5gHh5ysi9PyGGZs7ce5XtebD/F3TNAkb+SSX2MieQmoznHjGY7tHFYQ/VqiE7Lx
	4mmQKZdHLCVXUwMIb0F+K1TqmO0mYdIE0zWrtNLudKsu4IDva579DwR194SIZYIz/rNd4Sefsrcbs
	QGgBjuXYgrJSwyH+Vz4rDdX52JQmIecep34sim2c+HEZUH/cByOg+yIuG5Q8fUdSkLxpiX7xOUrLg
	ZdW7YZp42ggjWyJAVyHUGYs563d4qEE2LAiWVUK1UmyESChLCQv4qMIsVl3f2MzStHjThtmU+AQvW
	TqFPtbZm+ZdSX1Uuif/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej1-0000000GO5B-0qXs;
	Tue, 14 Oct 2025 13:05:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiw-0000000GNyq-3ClW
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:05:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	b=Zv1lZI9bfmZPDvEM4JRusAAq2cBllhjidSUvA9XtE2Ueq5UmZZWoyNyW3QP9Qq2LayLz1t
	EOWUw+ekjm1ZI3ivepNtxpPBhZK8KcSHVObBXN8SFRalX+yoW4vn8kBLzLxHl43jlA5/JR
	1cLBjhlv73q773FIXCEdaE0azr9ONjKk13E8obTJ4zcG5LQqWtpuNTp0Zuas7VZs90NPPm
	8+v68iVr3yOcA4456vKPsS22IsjrtUPvwZ0j24GKJzyN2MrGZim+zAMuiVw7AO6CNPzuqp
	pgTkEA//CML0qSQlX0o6HpofqTPJvZXMG2eV2+DEd1WV7uGiKp7N6MaJZTr1mQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	b=wlzUTHbKokvyVpwrlS1pfBwevlVj/x9vf+ARON0OWsvmjFoXR1E5gzzyiFmLYG7aT3wHf2
	LnIQbss7Iiy91mBw==
Date: Tue, 14 Oct 2025 15:05:18 +0200
Subject: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=2247;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6NbAT/c8dhOFpg7qjR2b49v4+fnBDinUJpp942RcUVs=;
 b=+axK+KClVFQLPqY2xQIV6Z1Guh/4xXDQBrACtf2w9ctXvFPO+pdPmvsWesaDbNln2fhCMBlvB
 WgGXUgtUQ07ACaBUqVkclPsSnd9imwvXGgtXlpBCgUj8Xxa/luTj8dE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060554_969566_2DB032A8 
X-CRM114-Status: UNSURE (   9.96  )
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

VGhlIGdlbmVyaWMgdGVzdCBmb3IgQ0NfQ0FOX0xJTksgYXNzdW1lcyB0aGF0IGFsbCBhcmNoaXRl
Y3R1cmVzIHVzZSAtbTMyCmFuZCAtbTY0IHRvIHN3aXRjaCBiZXR3ZWVuIDMyLWJpdCBhbmQgNjQt
Yml0IGNvbXBpbGF0aW9uLiBUaGlzIGlzIG92ZXJseQpzaW1wbGlzdGljLiBBcmNoaXRlY3R1cmVz
IG1heSB1c2Ugb3RoZXIgZmxhZ3MgKC1tYWJpLCAtbTMxLCBldGMuKSBvciBtYXkKYWxzbyByZXF1
aXJlIGJ5dGUgb3JkZXIgaGFuZGxpbmcgKC1tbGl0dGxlLWVuZGlhbiwgLUVMKS4gRXhwcmVzc2lu
ZyBhbGwKb2YgdGhlIGRpZmZlcmVudCBwb3NzaWJpbGl0aWVzIHdpbGwgYmUgdmVyeSBjb21wbGlj
YXRlZCBhbmQgYnJpdHRsZS4KSW5zdGVhZCBhbGxvdyBhcmNoaXRlY3R1cmVzIHRvIHN1cHBseSB0
aGVpciBvd24gbG9naWMgd2hpY2ggd2lsbCBiZQplYXN5IHRvIHVuZGVyc3RhbmQgYW5kIGV2b2x2
ZS4KCkJvdGggdGhlIGJvb2xlYW4gQVJDSF9IQVNfQ0NfQ0FOX0xJTksgYW5kIHRoZSBzdHJpbmcg
QVJDSF9VU0VSRkxBR1MgbmVlZAp0byBiZSBpbXBsZW1lbnRlZCBhcyBrY29uZmlnIGRvZXMgbm90
IGFsbG93IHRoZSByZXVzZSBvZiBzdHJpbmcgb3B0aW9ucy4KClNpZ25lZC1vZmYtYnk6IFRob21h
cyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIE1ha2Vm
aWxlICAgICB8IDEzICsrKysrKysrKysrLS0KIGluaXQvS2NvbmZpZyB8ICA0ICsrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDE3Y2ZhMTFjYTcxNjNhYTMyOTcxMDFjZWIzYzll
ODVmNDg3OGYxMmQuLjI2ZTViY2E1MzRlMjcwMzRjMzU1OTM5YmNhNGM5MGRiNDM1ZWNkYmQgMTAw
NjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xMTM0LDggKzExMzQsMTcgQEAg
aWZuZXEgKCQoQ09ORklHX0FSQ0hfVk1MSU5VWF9ORUVEU19SRUxPQ1MpLCkKIExERkxBR1Nfdm1s
aW51eAkrPSAtLWVtaXQtcmVsb2NzIC0tZGlzY2FyZC1ub25lCiBlbmRpZgogCi0jIEFsaWduIHRo
ZSBiaXQgc2l6ZSBvZiB1c2Vyc3BhY2UgcHJvZ3JhbXMgd2l0aCB0aGUga2VybmVsCi1VU0VSRkxB
R1NfRlJPTV9LRVJORUwgOj0gLW0zMiAtbTY0IC0tdGFyZ2V0PSUKKyMgQWxpZ24gdGhlIGFyY2hp
dGVjdHVyZSBvZiB1c2Vyc3BhY2UgcHJvZ3JhbXMgd2l0aCB0aGUga2VybmVsCitVU0VSRkxBR1Nf
RlJPTV9LRVJORUwgOj0gLS10YXJnZXQ9JQorCitpZmRlZiBDT05GSUdfQVJDSF9VU0VSUFJPR1Nf
Q0ZMQUdTCitLQlVJTERfVVNFUkNGTEFHUyArPSAkKENPTkZJR19BUkNIX1VTRVJGTEFHUykKK0tC
VUlMRF9VU0VSTERGTEFHUyArPSAkKENPTkZJR19BUkNIX1VTRVJGTEFHUykKK2Vsc2UKKyMgSWYg
bm90IG92ZXJyaWRkZW4gYWxzbyBpbmhlcml0IHRoZSBiaXQgc2l6ZQorVVNFUkZMQUdTX0ZST01f
S0VSTkVMICs9IC1tMzIgLW02NAorZW5kaWYKKwogS0JVSUxEX1VTRVJDRkxBR1MgICs9ICQoZmls
dGVyICQoVVNFUkZMQUdTX0ZST01fS0VSTkVMKSwgJChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxE
X0NGTEFHUykpCiBLQlVJTERfVVNFUkxERkxBR1MgKz0gJChmaWx0ZXIgJChVU0VSRkxBR1NfRlJP
TV9LRVJORUwpLCAkKEtCVUlMRF9DUFBGTEFHUykgJChLQlVJTERfQ0ZMQUdTKSkKIApkaWZmIC0t
Z2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnCmluZGV4IDdiNzIyZTcxNGQ1YzVhMDU4
MDQ2NzkxNGIyMjZkYzA3MDBlYzA3OTcuLjRhMmFlM2NmYmYyNjUyNWE2MDkzNmQ5YjI5YTc0ZWY0
MzE5YmEzYTUgMTAwNjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9pbml0L0tjb25maWcKQEAg
LTgyLDggKzgyLDEyIEBAIGNvbmZpZyBSVVNUQ19MTFZNX1ZFUlNJT04KIAlpbnQKIAlkZWZhdWx0
ICQocnVzdGMtbGx2bS12ZXJzaW9uKQogCitjb25maWcgQVJDSF9IQVNfQ0NfQ0FOX0xJTksKKwli
b29sCisKIGNvbmZpZyBDQ19DQU5fTElOSwogCWJvb2wKKwlkZWZhdWx0IEFSQ0hfQ0NfQ0FOX0xJ
TksgaWYgQVJDSF9IQVNfQ0NfQ0FOX0xJTksKIAlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlciwk
KG02NC1mbGFnKSkgaWYgNjRCSVQKIAlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlciwkKG0zMi1m
bGFnKSkKIAoKLS0gCjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
