Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E55C79FB9
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUq1rN2brtyOHnCmzkJ6Kz/UVx681PxmI0Sd4wuflKY=; b=xuM464dWDpLWXZ
	nLJN0QO27yCoS2mVeyRyKby2A78Gdje004WOPa8aQNAPqR06VVluK4X97Hkhb2Kfw1f2aIxdzEhiM
	vpCrdwb+erD6n8L3obh7e5yHTei7XV6blWO2ok4Y8GUbJSxZDPX9Ye4M7jVcwQrP3Hz6i5k+HFX+a
	MGBVUYb9UNRs1Q1lX6woZbusKPNjFXFE+o9LJciSDdbRG9vZAcvxQSNo6CRLnm8C3Br6jXjNqEsiY
	V0WgR+OXCFgeQCckIP8QLblafFJNTdD2tc4UYS8gfr9PaM/Ll/bMSO7V2jejQgo0uE5fmANMg980C
	M2g7EcmNCBH6jwAcO/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E29-0000000BAri-2gP5;
	Wed, 09 Sep 2026 08:51:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG3-2nbu;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=; b=F2S+YLPcQrkOY4md5JrFVEDtoL
	J7s/TSXOCWkI0/l+Va1kk8wTXJSbmkRReP5tk2fRz7q1bfx7oHzl8RW00Ky3pdxVQ2vviL3oPe/Kc
	2LIp6URPmDFCeGAvsa5tUCpBOUiD1zuh9deGOTXr5yAmhw0KsnnQqs0I+U3yjt9VFBjA8dI38yOCj
	t7JknNOLTYG4zFEXnI2TnNnI5fDAi0F/i1SNsVbTarOriFaqxE/EviT9gQb6a8/tp+Z4F/Vyw2X5L
	IWGz36DwgzqlYhWw8ZKjDPHwxwX7pu+1pbFAzhHo6ycFMuH4+oEd0ZgTPI6IYgfSjixI+3rjLGZff
	IX42PcLg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1i-00000000wIn-0Xao;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=;
	b=YV80N30gtg3Qo0+Nn5ZL14Uc4rxWQ913cXwBr24SAORpArv0rT4pLXYRBZmiU1XhVedhtm
	3gyANW09zc0AnJxdyhKpTxL570GrkaDpIprXpjRMCB0Q+lNtZiaZm58ZlxVzDicKRvrGpi
	w4/0MiHGowiYFT4LIjDgcSG2s9Rx8D2xwYHKUyVfl6NjAepsAWVAkrsjsiJ42saGd6Xbh9
	yfPekIScgoESbt7to4o0Y8ZggYTV62CbRHIJ2AJl/mS+ulCdUu7WTvsp4tsyim+fNDyfJy
	xlknZiyieERW87XvXKMAzRCm5R0mZ3L/DYRFqdklDPcVzg0WpkAa41ZQaCp3MA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=;
	b=WnZhgM4C9TDIR2uFp2TfzuCBG6oPaXdRjbuiKfGJaM4UpnOVhuqvMp9qkQ5jtb3aWa2zG+
	xJdxOHztclSdoICA==
Date: Wed, 09 Sep 2026 10:51:26 +0200
Subject: [PATCH 13/15] vdso: Remove unnecessary vdso/vsyscall.h includes
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-13-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=3977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gna+NxAbuHUiPh7UeY3iJvOkIMhHRrEMbf8sWoWLNzc=;
 b=ytf6AJeQ2RRzfTAaVL5jTvw60PTKQTaUNnPB+n+rtyAnSCDKsJxnzPm4sW6CzyPlgy4A/4sb6
 frGknUkvvrgA53jsfF8DIulc1yisK5Evm8qLbONPtD1QywylGQrPYC4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095130_429696_01D5881B 
X-CRM114-Status: UNSURE (   7.46  )
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

Tm9uZSBvZiB0aGVzZSBmaWxlcyB1c2VzIGFueXRoaW5nIGZyb20gdGhlIGhlYWRlci4KClJlbW92
ZSB0aGUgaW5jbHVzaW9uLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0va2VybmVsL3Zkc28uYyAg
ICAgICAgICB8IDEgLQogYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jICAgICAgICB8IDEgLQogYXJj
aC9sb29uZ2FyY2gva2VybmVsL3Zkc28uYyAgICB8IDEgLQogYXJjaC9taXBzL2tlcm5lbC92ZHNv
LmMgICAgICAgICB8IDEgLQogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyB8IDEgLQog
YXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jICAgICAgICB8IDEgLQogYXJjaC9zMzkwL2tlcm5lbC90
aW1lLmMgICAgICAgICB8IDEgLQogbGliL3Zkc28vZ2V0cmFuZG9tLmMgICAgICAgICAgICB8IDMg
LS0tCiBsaWIvdmRzby9nZXR0aW1lb2ZkYXkuYyAgICAgICAgIHwgMyAtLS0KIDkgZmlsZXMgY2hh
bmdlZCwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL3Zkc28u
YyBiL2FyY2gvYXJtL2tlcm5lbC92ZHNvLmMKaW5kZXggZTMwNmQwYzVhMjFjLi43YmU4NzFmNWVi
OWUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9hcm0va2Vy
bmVsL3Zkc28uYwpAQCAtMjMsNyArMjMsNiBAQAogI2luY2x1ZGUgPGFzbS92ZHNvLmg+CiAjaW5j
bHVkZSA8Y2xvY2tzb3VyY2UvYXJtX2FyY2hfdGltZXIuaD4KICNpbmNsdWRlIDx2ZHNvL2hlbHBl
cnMuaD4KLSNpbmNsdWRlIDx2ZHNvL3ZzeXNjYWxsLmg+CiAKICNkZWZpbmUgTUFYX1NZTU5BTUUJ
NjQKIApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jIGIvYXJjaC9hcm02NC9r
ZXJuZWwvdmRzby5jCmluZGV4IDU5MmRkODY2OGRlNC4uNTA1OTZkYWIyM2Y5IDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5j
CkBAIC0yMiw3ICsyMiw2IEBACiAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgogI2luY2x1ZGUg
PHZkc28vZGF0YXBhZ2UuaD4KICNpbmNsdWRlIDx2ZHNvL2hlbHBlcnMuaD4KLSNpbmNsdWRlIDx2
ZHNvL3ZzeXNjYWxsLmg+CiAKICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgogI2luY2x1ZGUg
PGFzbS9zaWduYWwzMi5oPgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva2VybmVsL3Zkc28u
YyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC92ZHNvLmMKaW5kZXggOGNlODE1OWMxMGI5Li4xZWRj
OGZiNzIwZGUgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC92ZHNvLmMKKysrIGIv
YXJjaC9sb29uZ2FyY2gva2VybmVsL3Zkc28uYwpAQCAtMjAsNyArMjAsNiBAQAogI2luY2x1ZGUg
PGFzbS92ZHNvLmg+CiAjaW5jbHVkZSA8YXNtL3Zkc28vdmRzby5oPgogI2luY2x1ZGUgPHZkc28v
aGVscGVycy5oPgotI2luY2x1ZGUgPHZkc28vdnN5c2NhbGwuaD4KICNpbmNsdWRlIDx2ZHNvL2Rh
dGFwYWdlLmg+CiAjaW5jbHVkZSA8Z2VuZXJhdGVkL3Zkc28tb2Zmc2V0cy5oPgogCmRpZmYgLS1n
aXQgYS9hcmNoL21pcHMva2VybmVsL3Zkc28uYyBiL2FyY2gvbWlwcy9rZXJuZWwvdmRzby5jCmlu
ZGV4IDgxNjVkZDNmYzFmOC4uOGViMTc2MGE4YTliIDEwMDY0NAotLS0gYS9hcmNoL21pcHMva2Vy
bmVsL3Zkc28uYworKysgYi9hcmNoL21pcHMva2VybmVsL3Zkc28uYwpAQCAtMjMsNyArMjMsNiBA
QAogI2luY2x1ZGUgPGFzbS92ZHNvLmg+CiAjaW5jbHVkZSA8YXNtL3Zkc28vdmRzby5oPgogI2lu
Y2x1ZGUgPHZkc28vaGVscGVycy5oPgotI2luY2x1ZGUgPHZkc28vdnN5c2NhbGwuaD4KIAogc3Rh
dGljX2Fzc2VydChWRFNPX05SX1BBR0VTID09IF9fVkRTT19QQUdFUyk7CiAKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCmluZGV4IDBmNDIxMDFhZDkzNS4uZTFhZDg2NzExMzdkIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMKQEAgLTE5LDcgKzE5LDYgQEAKICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVu
c2lvbnMvc2lmaXZlX2h3cHJvYmUuaD4KICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMv
dGhlYWRfaHdwcm9iZS5oPgogI2luY2x1ZGUgPHZkc28vZGF0YXBhZ2UuaD4KLSNpbmNsdWRlIDx2
ZHNvL3ZzeXNjYWxsLmg+CiAKIAogI2RlZmluZSBFWFRfS0VZKGlzYV9hcmcsIGV4dCwgcHYsIG1p
c3NpbmcpCQkJCQlcCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvLmMKaW5kZXggOWMyZjVlNDQyMzM4Li41NjY2Y2VjMTgwYWMgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvLmMKQEAgLTE1LDcgKzE1LDYgQEAKICNpbmNsdWRlIDxhc20vdmRzby5oPgogI2luY2x1
ZGUgPGxpbnV4L3Zkc29fZGF0YXN0b3JlLmg+CiAjaW5jbHVkZSA8dmRzby9kYXRhcGFnZS5oPgot
I2luY2x1ZGUgPHZkc28vdnN5c2NhbGwuaD4KIAogI2RlZmluZSBWVkFSX1NJWkUgIChWRFNPX05S
X1BBR0VTIDw8IFBBR0VfU0hJRlQpCiAKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvdGlt
ZS5jIGIvYXJjaC9zMzkwL2tlcm5lbC90aW1lLmMKaW5kZXggMTYxNjI4ZjY5MDZmLi5iY2E2NWJm
MWM4Y2IgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9rZXJuZWwvdGltZS5jCisrKyBiL2FyY2gvczM5
MC9rZXJuZWwvdGltZS5jCkBAIC00MCw3ICs0MCw2IEBACiAjaW5jbHVkZSA8bGludXgva3Byb2Jl
cy5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC92ZHNvX3Rp
bWUuaD4KLSNpbmNsdWRlIDx2ZHNvL3ZzeXNjYWxsLmg+CiAjaW5jbHVkZSA8dmRzby9jbG9ja3Nv
dXJjZS5oPgogI2luY2x1ZGUgPHZkc28vaGVscGVycy5oPgogI2luY2x1ZGUgPGFzbS9mYWNpbGl0
eS5oPgpkaWZmIC0tZ2l0IGEvbGliL3Zkc28vZ2V0cmFuZG9tLmMgYi9saWIvdmRzby9nZXRyYW5k
b20uYwppbmRleCA2ZmY0NjU0OTI4MWMuLmUwZmExMGJiZWZjOSAxMDA2NDQKLS0tIGEvbGliL3Zk
c28vZ2V0cmFuZG9tLmMKKysrIGIvbGliL3Zkc28vZ2V0cmFuZG9tLmMKQEAgLTE2LDkgKzE2LDYg
QEAKICNpbmNsdWRlIDx1YXBpL2xpbnV4L21tYW4uaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3Jh
bmRvbS5oPgogCi0vKiBCcmluZyBpbiBkZWZhdWx0IGFjY2Vzc29ycyAqLwotI2luY2x1ZGUgPHZk
c28vdnN5c2NhbGwuaD4KLQogI2lmbmRlZiBfX2FyY2hfZ2V0X3Zkc29fdV9ybmdfZGF0YQogc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBjb25zdCBzdHJ1Y3QgdmRzb19ybmdfZGF0YSAqX19hcmNoX2dl
dF92ZHNvX3Vfcm5nX2RhdGEodm9pZCkKIHsKZGlmZiAtLWdpdCBhL2xpYi92ZHNvL2dldHRpbWVv
ZmRheS5jIGIvbGliL3Zkc28vZ2V0dGltZW9mZGF5LmMKaW5kZXggYjg2N2MyMzAxZDVjLi43Mjhm
ZWQxYWU1MmYgMTAwNjQ0Ci0tLSBhL2xpYi92ZHNvL2dldHRpbWVvZmRheS5jCisrKyBiL2xpYi92
ZHNvL2dldHRpbWVvZmRheS5jCkBAIC0yNyw5ICsyNyw2IEBACiAKICNpbmNsdWRlIDxsaW51eC9i
dWlsZF9idWcuaD4KIAotLyogQnJpbmcgaW4gZGVmYXVsdCBhY2Nlc3NvcnMgKi8KLSNpbmNsdWRl
IDx2ZHNvL3ZzeXNjYWxsLmg+Ci0KICNpZm5kZWYgdmRzb19jYWxjX25zCiAKICNpZmRlZiBWRFNP
X0RFTFRBX05PTUFTSwoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
