Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4DC44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v6rTNcTwL+zwOV/ueFyQjticdQYd/R0XLjQwHFs+1/A=; b=mqmW+f58P2pAn2
	1P4MtxppiotUbzelZgHuFlTI964V0HauDmFva3xytEomioTCt+fZy+IPoQ3kb8Wh9t1r/GeMfvNEA
	ADpX/Lv83TqjdP3//ppio4huLskIgkUXS6ChzPllrKgxYBFVu3FFBBALqnWF2R88OpZcYV00Zmf79
	Pq2rtZKFvpxn/5lmDhN/GQ8GUih+ykm142mWl1M/EHdNxEx17DZf2xVySXHTvHECURiOzE336Lyzv
	1sEBjQJfF73uJ6LGQ0nvtk+ewXfcLFawbkRb3EuW39CQ6reEjJglcb06UQKqK6WqIGu2fcLgys709
	Tx/HURdiv1AoDSV03JYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmK-0000000BAJS-2FzK;
	Wed, 22 Jul 2026 07:54:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmH-0000000BAFu-0raz;
	Wed, 22 Jul 2026 07:54:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=esBiTzM0YMZJaHRPo8C9o8Uyx3hv3mWceMEfg8hR9K0=;
	b=laWRibYATJixqIxXMIs22ReJlQG/+C5LJskCMYxc6LfZOADlSy1GF5xLIiKqEXE+o0Rlb5
	lmTJNYmphv5jXmpPG2qGcHDLzMQh9QcGfG8rzh1jcmgebj/+vWX0T8euBRlDGjO3ZSqI33
	a/JDSRptXbpno6ugRI7ufT/lHkZRVRCXI//sxQgjGxnFjH6kYX4bFPEVVGKUvQnFiNmHEC
	7zkJFV9MBLht1ul/pa1jXQfYOcTxjBDn7Oz+iTPBTQNPRjw37r9FZUrAnHCI5AupawWl3+
	islAIV8p4h+IXfkJMuz6pXpf/TrlD3oFKVFS0D60+Xc0hFrwctAWQGf1+RbzFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=esBiTzM0YMZJaHRPo8C9o8Uyx3hv3mWceMEfg8hR9K0=;
	b=k4BoSx+0yhCqEVDg+FKrCfzUGO8KMuuSe4E+ZiXCPao/GSg7YPhN2Lh7o6IwAUACVgABXJ
	7W3b83mwwAIBfhCQ==
Subject: [PATCH v3 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Date: Wed, 22 Jul 2026 09:53:26 +0200
Message-Id: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSw7CIBSF4a00jMUALY86ch/GAeVhiRUMVFLTd
 O/SOjFGh/9J7ndnkEx0JoFDNYNosksu+BL1rgKql/5ioNOlAUGEIYYozDoFKKPqoRqCut6CNgl
 2VknbSqJEI0A5vUdj3bSxp3Pp3qUxxOf2JeN1fYMctb/BjCGCtdVcoK6zguLj4PxjjMG7aa8NW
 NFMPiDM/0CkQJwySyXVuGH8G1qW5QUpzdRdBQEAAA==
X-Change-ID: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ODl0setkvj0uIlTGNGfxVZ2OpkxJixp7vvM45HUxSeU=;
 b=EtnQPZl191QmxUTsRxjG3FvEAMh/Rvkn1+MohLuwUUauSHnpds2Gap6Jj0V0Jz9Jie/xZZSeQ
 RtJDfuahXveCBHPhZVs46xzomPnnkogB0uvir/fEXRiqs77WUzztZUL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005405_383823_A6F3D4BE 
X-CRM114-Status: UNSURE (   6.72  )
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

QWx3YXlzIHByb3ZpZGUgdGhlIGRlZmluaXRpb25zIG9mIHRoZSBWRFNPX0NMT0NLTU9ERV8qIGNv
bnN0YW50cyBhbmQKcmVtb3ZlIHNvbWUgaWZkZWZmZXJ5IGZyb20gdGhlIGNsb2Nrc291cmNlIGRy
aXZlcnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gVXBkYXRlICphbGwqIGNvbW1p
dCBtZXNzYWdlcyB0byB0aGUgbGF0ZXN0IGxvZ2ljLgotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0
Y2gubXNnaWQubGluay8yMDI2MDcxNy12ZHNvLWFyY2gtY2xvY2ttb2Rlcy12Mi0wLTc1NmY1YTVk
MTQ2N0BsaW51dHJvbml4LmRlCgpDaGFuZ2VzIGluIHYyOgotIEFsc28gZHJvcCB0aGUgSVNfRU5B
QkxFRCgpIGxvZ2ljLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2
MDcwOS12ZHNvLWFyY2gtY2xvY2ttb2Rlcy12MS0wLTNmZDc4MGJiZjg1MUBsaW51dHJvbml4LmRl
CgotLS0KVGhvbWFzIFdlacOfc2NodWggKDcpOgogICAgICBrYnVpbGQ6IHN1cHBvcnQgZ2VuZXJh
dGVkIGFzbS1oZWFkZXJzIGluIHN1YmRpcmVjdG9yaWVzCiAgICAgIHZEU086IE1ha2UgY2xvY2tt
b2RlIGNvbnN0YW50cyBhdmFpbGFibGUgd2l0aG91dCBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZE
QVkKICAgICAgTUlQUzogY3NyYy1yNGs6IFJlbW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZE
QVkgaWZkZWZmZXJ5CiAgICAgIGNsb2Nrc291cmNlL2RyaXZlcnMvbWlwcy1naWMtdGltZXI6IFJl
bW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWZkZWZmZXJ5CiAgICAgIGNsb2Nrc291
cmNlL2RyaXZlcnMvYXJtX2FyY2hfdGltZXI6IFJlbW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1F
T0ZEQVkgaWZkZWZmZXJ5CiAgICAgIGNsb2Nrc291cmNlL2RyaXZlcnMvdGltZXItcmlzY3Y6IFJl
bW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWZkZWZmZXJ5CiAgICAgIExvb25nQXJj
aDogUmVtb3ZlIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSBpZmRlZmZlcnkKCiBhcmNoL2xv
b25nYXJjaC9rZXJuZWwvdGltZS5jICAgICAgICAgICB8ICAyIC0tCiBhcmNoL21pcHMva2VybmVs
L2NzcmMtcjRrLmMgICAgICAgICAgICB8ICAyIC0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9h
cmNoX3RpbWVyLmMgICB8ICA0IC0tLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvbWlwcy1naWMtdGlt
ZXIuYyAgIHwgIDIgLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyAgICAgIHwg
IDQgLS0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQgICAgICAgICAgICAgfCAgMSArCiBp
bmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vY2xvY2tzb3VyY2UuaCB8ICAwCiBpbmNsdWRlL3Zkc28v
Y2xvY2tzb3VyY2UuaCAgICAgICAgICAgICB8ICA0ICstLS0KIHNjcmlwdHMvTWFrZWZpbGUuYXNt
LWhlYWRlcnMgICAgICAgICAgIHwgMTEgKysrKystLS0tLS0KIDkgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBlY2FjYzljOGQz
ZWQwZjYzMDY1ZjRhMWU5NGJmZDhiZjY1YTNmZmFmCmNoYW5nZS1pZDogMjAyNjA2MDUtdmRzby1h
cmNoLWNsb2NrbW9kZXMtYmZjYWY5YTJjODQ4CgpCZXN0IHJlZ2FyZHMsCi0tICAKVGhvbWFzIFdl
acOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
