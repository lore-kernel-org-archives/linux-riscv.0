Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67438E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp0iT2RNhTfXeqzY6m4uk/isq2uxxSWqHPuzcO5j2Vw=; b=Hal1Q/UZoS0Cvl
	f5+wETsrVu9jCeQKoFx7B4GbV8F4ZxyEFN/AjaCQk62mrbM/BePqT0tCoTwkGW3jVmoai45tXOUDs
	eEY5mv01JSYaGJJu0HDX5Yfs2zRF1o/qkGb36Lzr9GOUsYrziB6nKZiKoFBFBIN8/Jhbfphc/mJzf
	mjvsAakSmZS/mShyWMwzCyILigkTZFAd9KvRqQxC0bxt0wgLqNscG+ulyKAfGv3l0BksOhTDL2GWj
	SdWpZT1NYe7lj2YDBbBsshAGWNenLrCW47RGZcd/NeeYmgYDbO97i6wHYnKO6OPbP1X/KAnrik1Cm
	zdvRrT3rzwRC10WdUCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBym-0000000AEb6-11vU;
	Mon, 16 Dec 2024 14:21:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoF-0000000ABNQ-0Mw9;
	Mon, 16 Dec 2024 14:10:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gs/m1ne1xnufcZuceBub2RzRtdWIKInpIZ86AtKhTZY=;
	b=cmdDBZfVWS6iJxS6Qj2w9ZQQ3R6xmZGKYAB0HWFGlKDMd12wPWqlnClWQ3d9T7mCAdp/oE
	TXGiqyd4mqPSHh1hjNowtj42QYpOidrFxIljJST2kZe4sCYwpRZiQyKF+QJUs1XFCMHY4N
	3gjda6bRPz/5UIjh3zOmprTshVCtwZ/XomceXMNMEBF6Vow85ee5QJt7lK++hffeJWVKRW
	9UvDDAWxuIfhR4FaJCFRZX5QrK27RFV+m3cKrSBncouypGH2CzVfL3wzZaGMtcZbWBlVgS
	30gz/u4EggQbRrH+hJzX2F68RuF16gFJRgNK6BJyRtMzbWJiNZHpyUVvfgl1OQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gs/m1ne1xnufcZuceBub2RzRtdWIKInpIZ86AtKhTZY=;
	b=heZTOf2AXJAP0vRl3L0tLwZ+AYJjnJOJsGZMWC/8FrllI/jr0RX1EvBsRXVwn9qbXBWlqg
	bQ8V7pa/w94GHaDw==
Date: Mon, 16 Dec 2024 15:09:58 +0100
Subject: [PATCH 02/17] vdso: Introduce vdso/align.h
MIME-Version: 1.0
Message-Id: <20241216-vdso-store-rng-v1-2-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=2181;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zRm1/jHzhcX2cBU5SFyW7PIL5hMfUBZQzaPVvddjWs0=;
 b=3vucqSgNyFfcPlZWU+nck873IDs3fyLmnT/Uwqgae45dcegtZe39aM9ZkpPEyADY1fE7HmIZD
 KjgQ1Whis1RBTmvVwZEHZ6hciMQgEMdV0+RhtXHlxeCdmndFQ1Ipjf9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061055_454621_B7CC981B 
X-CRM114-Status: GOOD (  11.62  )
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

VGhlIHZEU08gaW1wbGVtZW50YXRpb24gY2FuIG9ubHkgaW5jbHVkZSBoZWFkZXJzIGZyb20gdGhl
IHZkc28vCm5hbWVzcGFjZS4gVG8gZW5hYmxlIHRoZSB1c2FnZSBvZiB0aGUgQUxJR04oKSBtYWNy
byBmcm9tIHRoZSB2RFNPLCBtb3ZlCmxpbnV4L2FsaWduLmggdG8gdmRzby9hbGlnbi5oIHdob2xs
eS4KQXMgdGhlIG9ubHkgZGVwZW5kZW5jeSBsaW51eC9jb25zdC5oIGlzIG9ubHkgYSB3cmFwcGVy
IGFyb3VuZAp2ZHNvL2NvbnN0LmggYW55d2F5cyBhZGFwdCB0aGF0IGRlcGVuZGVuY3kuCgpBbHNv
IHByb3ZpZGUgYSBjb21wYXRpYmlsaXR5IHdyYXBwZXIgbGludXgvYWxpZ24uaC4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGluY2x1ZGUvbGludXgvYWxpZ24uaCB8IDEwICstLS0tLS0tLS0KIGluY2x1ZGUvdmRz
by9hbGlnbi5oICB8IDE1ICsrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYWxp
Z24uaCBiL2luY2x1ZGUvbGludXgvYWxpZ24uaAppbmRleCAyYjRhY2VjN2I5NWEyN2I2NzY4ZDQ4
ZjQ2NTE5YWJjNTg0Yzk0ZDVkLi41NWRlYmYxMDVhNWQ2MTBjNTkyZTVjNTNhNDE1MzAxOGVhMWFl
MmM2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2FsaWduLmgKKysrIGIvaW5jbHVkZS9saW51
eC9hbGlnbi5oCkBAIC0yLDE0ICsyLDYgQEAKICNpZm5kZWYgX0xJTlVYX0FMSUdOX0gKICNkZWZp
bmUgX0xJTlVYX0FMSUdOX0gKIAotI2luY2x1ZGUgPGxpbnV4L2NvbnN0Lmg+Ci0KLS8qIEBhIGlz
IGEgcG93ZXIgb2YgMiB2YWx1ZSAqLwotI2RlZmluZSBBTElHTih4LCBhKQkJX19BTElHTl9LRVJO
RUwoKHgpLCAoYSkpCi0jZGVmaW5lIEFMSUdOX0RPV04oeCwgYSkJX19BTElHTl9LRVJORUwoKHgp
IC0gKChhKSAtIDEpLCAoYSkpCi0jZGVmaW5lIF9fQUxJR05fTUFTSyh4LCBtYXNrKQlfX0FMSUdO
X0tFUk5FTF9NQVNLKCh4KSwgKG1hc2spKQotI2RlZmluZSBQVFJfQUxJR04ocCwgYSkJCSgodHlw
ZW9mKHApKUFMSUdOKCh1bnNpZ25lZCBsb25nKShwKSwgKGEpKSkKLSNkZWZpbmUgUFRSX0FMSUdO
X0RPV04ocCwgYSkJKCh0eXBlb2YocCkpQUxJR05fRE9XTigodW5zaWduZWQgbG9uZykocCksIChh
KSkpCi0jZGVmaW5lIElTX0FMSUdORUQoeCwgYSkJCSgoKHgpICYgKCh0eXBlb2YoeCkpKGEpIC0g
MSkpID09IDApCisjaW5jbHVkZSA8dmRzby9hbGlnbi5oPgogCiAjZW5kaWYJLyogX0xJTlVYX0FM
SUdOX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdmRzby9hbGlnbi5oIGIvaW5jbHVkZS92ZHNv
L2FsaWduLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMC4uMDJkZDg2MjZiNWM1YWE1OWQyZWUwYjE1Nzk5YjZlOWFkYjM0
M2Y2NQotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvdmRzby9hbGlnbi5oCkBAIC0wLDAgKzEs
MTUgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaWZuZGVmIF9f
VkRTT19BTElHTl9ICisjZGVmaW5lIF9fVkRTT19BTElHTl9ICisKKyNpbmNsdWRlIDx2ZHNvL2Nv
bnN0Lmg+CisKKy8qIEBhIGlzIGEgcG93ZXIgb2YgMiB2YWx1ZSAqLworI2RlZmluZSBBTElHTih4
LCBhKQkJX19BTElHTl9LRVJORUwoKHgpLCAoYSkpCisjZGVmaW5lIEFMSUdOX0RPV04oeCwgYSkJ
X19BTElHTl9LRVJORUwoKHgpIC0gKChhKSAtIDEpLCAoYSkpCisjZGVmaW5lIF9fQUxJR05fTUFT
Syh4LCBtYXNrKQlfX0FMSUdOX0tFUk5FTF9NQVNLKCh4KSwgKG1hc2spKQorI2RlZmluZSBQVFJf
QUxJR04ocCwgYSkJCSgodHlwZW9mKHApKUFMSUdOKCh1bnNpZ25lZCBsb25nKShwKSwgKGEpKSkK
KyNkZWZpbmUgUFRSX0FMSUdOX0RPV04ocCwgYSkJKCh0eXBlb2YocCkpQUxJR05fRE9XTigodW5z
aWduZWQgbG9uZykocCksIChhKSkpCisjZGVmaW5lIElTX0FMSUdORUQoeCwgYSkJCSgoKHgpICYg
KCh0eXBlb2YoeCkpKGEpIC0gMSkpID09IDApCisKKyNlbmRpZgkvKiBfX1ZEU09fQUxJR05fSCAq
LwoKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
