Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34670C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpuA47zMrY97LB3bVIhqPu1WPzv/k0WDw03mvKIgTes=; b=FztVrDLQElcPOM
	GQHtEuQ2e7xMZJjhTmcy7oow32aNH9Zqzwac+6NIc5ofSZfc42zjvobVydbn/SEda7IYdk2RmrR0j
	SE2JutC3N1OYtzuhBLDi17cZSpbUrVJEGqDKKlrrLl2NuPk4W3JIcdJehhlYKgVkQv1iiepUc667v
	jRoSyS730GPrEqro+XuY+IAynunYvDsExYpLiyKyESzgFhechTxQnbhH77KtE4ld1sKsD5OdBzL7k
	VQGpFt9aoXGsiuqUd0eB1HYeLHx7mV2WGwsW7QsJj8WeX2CSCVhkMs1vi5GgzclhaajQ6sjrt8eqh
	7Qy7ToXcqQTbIZwPUlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ6-00000009BfZ-1UUn;
	Wed, 11 Jun 2025 08:02:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2j-000000097mR-2cza
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:43 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsOOrGBakifNVCfKsVVVvhphUazsao0TPGogrQbBl2g=;
	b=eLrUCPsYv5gADn8+3sK2GRnIrrpbSOpLe4GNHneQO4DeP8C62gwifn+84R6qE6uQ0loLKO
	J7tRzhsIW2w2ZxBLzEHNzLzDaAbJC8DiyQ5usTIoZN4Hrq+IM7BX35S7uPcWDNw2XOzygz
	GWeqUYv9000ZCnvIPizgUcCqARevMeSEVp2tCo2A6k6J4XGzUewxv/OckUyMAXcIPDttmW
	pYaom6imO2ePjMaZsA1D81UhfrmRDzZGejo5Mvhm4ovSknOtoAa4elJNmvb8upHsvRGR7T
	W0vYFIrkNqYZBxRrjF0NcfqJDzlDsRZw3eqI+Sx5RTXPZIK0c4Pu446HOCkazg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsOOrGBakifNVCfKsVVVvhphUazsao0TPGogrQbBl2g=;
	b=Wj2au+nKYQgPGmH1T5ci+Jv8EalPVdjiAV4Ttu2hoAj7phxQJbDRiWJOHEwtpSMw30xZ0X
	S6KPIrFpsnG0gKBA==
Date: Wed, 11 Jun 2025 09:38:21 +0200
Subject: [PATCH v3 15/16] kunit: uapi: Introduce preinit executable
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-15-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=4665;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LrqS14BgBBh1vJManAT++TMRX3/0WwlTJmmoCOXwvPw=;
 b=QOBN8OgiUAjyXsyLfqrFeeDagneiyz16sdrt6s8Kt0CsPoZwX20L0gJ0EWVEx35SoA0gC5np6
 aKnUPlAdBi/Bn5I+vXXqYQUmndHsyI4s3CWGST2VM+c22P+zHSAbrle
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_003841_944823_A9EF0E38 
X-CRM114-Status: GOOD (  15.18  )
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

VUFQSSBzZWxmdGVzdHMgbWF5IGV4cGVjdCBhICJub3JtYWwiIHVzZXJzcGFjZSBlbnZpcm9ubWVu
dC4KRm9yIGV4YW1wbGUgdGhlIG5vcm1hbCBrZXJuZWwgQVBJIHBzZXVkby1maWxlc3lzdGVtcyBz
aG91bGQgYmUgbW91bnRlZC4KVGhpcyBjb3VsZCBiZSBkb25lIGZyb20ga2VybmVsIGNvZGUgYnV0
IGl0IGlzIG5vbi1pZGlvbWF0aWMuCgpBZGQgYSBwcmVpbml0IHVzZXJzcGFjZSBleGVjdXRhYmxl
IHdoaWNoIHBlcmZvcm1zIHRoZXNlIHNldHVwIHN0ZXBzCmJlZm9yZSBydW5uaW5nIHRoZSBmaW5h
bCB0ZXN0IGV4ZWN1dGFibGUuClRoaXMgcHJlaW5pdCBleGVjdXRhYmxlIGlzIG9ubHkgZXZlciBy
dW4gZnJvbSB0aGUga2VybmVsLgpHaXZlIGl0IGFjY2VzcyB0byBhdXRvY29uZi5oIGFuZCBrY29u
ZmlnLmggdG8gYWRhcHQgaXRzZWxmIHRvIHRoZQp0ZXN0ZWQga2VybmVsLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0t
LQogbGliL2t1bml0L01ha2VmaWxlICAgICAgIHwgIDkgKysrKysrLQogbGliL2t1bml0L3VhcGkt
cHJlaW5pdC5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiBsaWIva3VuaXQvdWFwaS5jICAgICAgICAgfCAxMSArKysrKysrLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9s
aWIva3VuaXQvTWFrZWZpbGUgYi9saWIva3VuaXQvTWFrZWZpbGUKaW5kZXggZTQwNmEzMWRmMWRm
ODM0YTg3OTYxNjYzZGUwYjc5MjFiNTk0ODFjMi4uMTk0OTNlYzMyMGM2MWUyY2NiYjU4ZThiMmU5
NDNlOWE0ZWM0NDdlMiAxMDA2NDQKLS0tIGEvbGliL2t1bml0L01ha2VmaWxlCisrKyBiL2xpYi9r
dW5pdC9NYWtlZmlsZQpAQCAtMTIsNyArMTIsMTQgQEAga3VuaXQtb2JqcyArPQkJCQl0ZXN0Lm8g
XAogCQkJCQlkZXZpY2UubyBcCiAJCQkJCXBsYXRmb3JtLm8KIAota3VuaXQtJChDT05GSUdfS1VO
SVRfVUFQSSkgKz0JCXVhcGkubwordXNlcnByb2dzICs9CQkJCXVhcGktcHJlaW5pdAordWFwaS1w
cmVpbml0LW5vbGliYyA6PQkJCSQoQ09ORklHX0FSQ0hfSEFTX05PTElCQykKK3VhcGktcHJlaW5p
dC11c2VyY2NmbGFncyArPQkJLXN0YXRpYyBcCisJCQkJCS1pbmNsdWRlIGluY2x1ZGUvZ2VuZXJh
dGVkL2F1dG9jb25mLmggXAorCQkJCQktaW5jbHVkZSAkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUv
bGludXgva2NvbmZpZy5oCitibG9icyArPQkJCQl1YXBpLXByZWluaXQuYmxvYi5vCit1YXBpLXBy
ZWluaXQuYmxvYi1zeW1ib2wgOj0JCWt1bml0X3VhcGlfcHJlaW5pdAora3VuaXQtJChDT05GSUdf
S1VOSVRfVUFQSSkgKz0JCXVhcGkubyB1YXBpLXByZWluaXQuYmxvYi5vCiAKIGlmZXEgKCQoQ09O
RklHX0tVTklUX0RFQlVHRlMpLHkpCiBrdW5pdC1vYmpzICs9CQkJCWRlYnVnZnMubwpkaWZmIC0t
Z2l0IGEvbGliL2t1bml0L3VhcGktcHJlaW5pdC5jIGIvbGliL2t1bml0L3VhcGktcHJlaW5pdC5j
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAuLjgxMTgyMDM5OTY1YThjOTNhZWJiMmQ1ZDc2ZjQxMTNiZmVmMjc3YTYKLS0t
IC9kZXYvbnVsbAorKysgYi9saWIva3VuaXQvdWFwaS1wcmVpbml0LmMKQEAgLTAsMCArMSw2MyBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKy8qCisgKiBLVW5pdCBVc2Vy
c3BhY2UgZW52aXJvbm1lbnQgc2V0dXAuCisgKgorICogQ29weXJpZ2h0IChDKSAyMDI1LCBMaW51
dHJvbml4IEdtYkguCisgKiBBdXRob3I6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3Nz
Y2h1aEBsaW51dHJvbml4LmRlPgorICoKKyAqIFRoaXMgaXMgKnVzZXJzcGFjZSogY29kZS4KKyAq
LworCisjaW5jbHVkZSA8c3lzL21vdW50Lmg+CisjaW5jbHVkZSA8c3lzL3N0YXQuaD4KKworI2lu
Y2x1ZGUgIi4uLy4uL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdC5oIgorCitzdGF0
aWMgaW50IHNldHVwX2FwaV9tb3VudChjb25zdCBjaGFyICp0YXJnZXQsIGNvbnN0IGNoYXIgKmZz
dHlwZSkKK3sKKwlpbnQgcmV0OworCisJcmV0ID0gbWtkaXIodGFyZ2V0LCAwNzU1KTsKKwlpZiAo
cmV0ICYmIGVycm5vICE9IEVFWElTVCkKKwkJcmV0dXJuIC1lcnJubzsKKworCXJldCA9IG1vdW50
KCJub25lIiwgdGFyZ2V0LCBmc3R5cGUsIDAsIE5VTEwpOworCWlmIChyZXQgJiYgZXJybm8gIT0g
RUJVU1kpCisJCXJldHVybiAtZXJybm87CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHZvaWQg
ZXhpdF9mYWlsdXJlKGNvbnN0IGNoYXIgKnN0YWdlLCBpbnQgZXJyKQoreworCS8qIElmIHByZWlu
aXQgZmFpbHMgc3ludGhlc2l6ZSBhIGZhaWxlZCB0ZXN0IHJlcG9ydC4gKi8KKwlrc2Z0X3ByaW50
X2hlYWRlcigpOworCWtzZnRfc2V0X3BsYW4oMSk7CisJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJG
YWlsZWQgZHVyaW5nIHRlc3Qgc2V0dXA6ICVzOiAlc1xuIiwgc3RhZ2UsIHN0cmVycm9yKC1lcnIp
KTsKKwlrc2Z0X2ZpbmlzaGVkKCk7Cit9CisKK2ludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
diwgY2hhciAqKmVudnApCit7CisJaW50IHJldDsKKworCXJldCA9IHNldHVwX2FwaV9tb3VudCgi
L3Byb2MiLCAicHJvYyIpOworCWlmIChyZXQpCisJCWV4aXRfZmFpbHVyZSgibW91bnQgL3Byb2Mi
LCByZXQpOworCisJcmV0ID0gc2V0dXBfYXBpX21vdW50KCIvc3lzIiwgInN5c2ZzIik7CisJaWYg
KHJldCkKKwkJZXhpdF9mYWlsdXJlKCJtb3VudCAvc3lzIiwgcmV0KTsKKworCWlmIChJU19FTkFC
TEVEKENPTkZJR19ERVZUTVBGUykpIHsKKwkJcmV0ID0gc2V0dXBfYXBpX21vdW50KCIvZGV2Iiwg
ImRldnRtcGZzIik7CisJCWlmIChyZXQpCisJCQlleGl0X2ZhaWx1cmUoIm1vdW50IC9kZXYiLCBy
ZXQpOworCX0KKworCXJldCA9IGV4ZWN2ZShhcmd2WzBdLCBhcmd2LCBlbnZwKTsKKwlpZiAocmV0
KQorCQlleGl0X2ZhaWx1cmUoImV4ZWN2ZSIsIHJldCk7CisKKwlyZXR1cm4gMDsKK30KZGlmZiAt
LWdpdCBhL2xpYi9rdW5pdC91YXBpLmMgYi9saWIva3VuaXQvdWFwaS5jCmluZGV4IDEyMTE0NmRk
YTUzM2IzZjkwYWNhMzdjMjBiZDBlN2ExZDIwY2IzYjUuLmJjY2MwODFhNjUzODUwNzcyNGMxZWYz
NDAyMDNjZmQxNDcxNzBkYzQgMTAwNjQ0Ci0tLSBhL2xpYi9rdW5pdC91YXBpLmMKKysrIGIvbGli
L2t1bml0L3VhcGkuYwpAQCAtMTM5LDcgKzEzOSw3IEBAIHN0YXRpYyBpbnQga3VuaXRfdWFwaV91
c2VyX21vZGVfdGhyZWFkX2luaXQodm9pZCAqZGF0YSkKIAlrZXJuZWxfc2lnYWN0aW9uKFNJR0FC
UlQsIFNJR19ERkwpOwogCiAJY29tcGxldGUoJmN0eC0+c2V0dXBfZG9uZSk7Ci0JY3R4LT5leGVj
X2VyciA9IGtlcm5lbF9leGVjdmUoY3R4LT5leGVjdXRhYmxlLCBhcmd2LCBOVUxMKTsKKwljdHgt
PmV4ZWNfZXJyID0ga2VybmVsX2V4ZWN2ZShrYmFzZW5hbWUoQkxPQihrdW5pdF91YXBpX3ByZWlu
aXQpLT5wYXRoKSwgYXJndiwgTlVMTCk7CiAJaWYgKCFjdHgtPmV4ZWNfZXJyKQogCQlyZXR1cm4g
MDsKIAlkb19leGl0KDApOwpAQCAtMjM5LDYgKzIzOSw3IEBAIHN0YXRpYyBpbnQga3VuaXRfdWFw
aV9ydW5fZXhlY3V0YWJsZV9pbl9tb3VudChzdHJ1Y3Qga3VuaXQgKnRlc3QsIGNvbnN0IGNoYXIg
KmV4CiAKIHN0YXRpYyBpbnQga3VuaXRfdWFwaV9ydW5fZXhlY3V0YWJsZShzdHJ1Y3Qga3VuaXQg
KnRlc3QsIGNvbnN0IHN0cnVjdCBibG9iICpleGVjdXRhYmxlKQogeworCWNvbnN0IHN0cnVjdCBi
bG9iICpwcmVpbml0ID0gQkxPQihrdW5pdF91YXBpX3ByZWluaXQpOwogCWNvbnN0IGNoYXIgKmV4
ZV9uYW1lID0ga2Jhc2VuYW1lKGV4ZWN1dGFibGUtPnBhdGgpOwogCXN0cnVjdCB2ZnNtb3VudCAq
bW50OwogCWludCBlcnI7CkBAIC0yNDcsNyArMjQ4LDEzIEBAIHN0YXRpYyBpbnQga3VuaXRfdWFw
aV9ydW5fZXhlY3V0YWJsZShzdHJ1Y3Qga3VuaXQgKnRlc3QsIGNvbnN0IHN0cnVjdCBibG9iICpl
eGVjCiAJaWYgKElTX0VSUihtbnQpKQogCQlyZXR1cm4gUFRSX0VSUihtbnQpOwogCi0JZXJyID0g
a3VuaXRfdWFwaV93cml0ZV9maWxlKG1udCwgZXhlX25hbWUsIDA3NTUsIGV4ZWN1dGFibGUtPmRh
dGEsIGJsb2Jfc2l6ZShleGVjdXRhYmxlKSk7CisJZXJyID0ga3VuaXRfdWFwaV93cml0ZV9maWxl
KG1udCwga2Jhc2VuYW1lKHByZWluaXQtPnBhdGgpLCAwNzU1LAorCQkJCSAgICBwcmVpbml0LT5k
YXRhLAorCQkJCSAgICBibG9iX3NpemUocHJlaW5pdCkpOworCisJaWYgKCFlcnIpCisJCWVyciA9
IGt1bml0X3VhcGlfd3JpdGVfZmlsZShtbnQsIGV4ZV9uYW1lLCAwNzU1LAorCQkJCQkgICAgZXhl
Y3V0YWJsZS0+ZGF0YSwgYmxvYl9zaXplKGV4ZWN1dGFibGUpKTsKIAogCWlmICghZXJyKQogCQll
cnIgPSBrdW5pdF91YXBpX3J1bl9leGVjdXRhYmxlX2luX21vdW50KHRlc3QsIGV4ZV9uYW1lLCBt
bnQpOwoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
