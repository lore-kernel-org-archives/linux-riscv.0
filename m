Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E063E63C85
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aIoHe1dfYRNkt1wiW/HmM1WSr3Kd4DMYll2Nq0vYX0o=; b=GwZUBvNS+QrmcD
	5dbnYAJiI8LWJ3FJi2a3exOvJ1PG0YeQw0LX4xeEGhVZS09E1Uj0kZ/okegWvyks6O4HfUJmWnkBS
	YcfviAtKdjfV1i6aGPOywWd6fjl51dAPHCwgSdfkEPSQVcctxEiaYrxPWy4pP73f5Ic16QJsLWTBE
	eAv+Rhqag93k0ZHAZT4eGpAa9iV5xkGVDxWn9PHM68V7tdS+06XNhFgrbdeUWcdwOHWVeZ3xXefGO
	sgQ9etAzzhAl9en2s1ljcKSni0TTXCPtKAaTsN75NAb/3OoRSOuCPPY8s6BI3aD2YfyllB1KPDojJ
	svOfcmAwLRsdcVVQvg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjt33-0000000AtPZ-2g4E;
	Sun, 25 Jan 2026 05:52:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjt31-0000000AtPN-1CzC
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 05:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64EAE60018;
	Sun, 25 Jan 2026 05:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19099C4CEF1;
	Sun, 25 Jan 2026 05:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769320350;
	bh=PxKVuX9dZ+15sduk5orMIw8Ay7DKzlNXmTpCvQ7wsUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LVPkNI4IxN8sOpUhYCBHm3yDqC3gKhu2VZqsWBq1koZQ8R/SIEh/xMeK4TqN5Xf6u
	 8OjMa2Hq5Xiuemt3wZgZJ7PYqufWDu2gjIF9lOLQOsoiiKLtL/I2f/XTsb7dOhMWU3
	 y9kThvlEG6UFYh5sc1LX7ogi0ODayomkRolzQtljZksh4PYaR3Jnwou4O7nNkrw2Ir
	 KvM0ehNYoxcZGQsLSPkE9hBXP7JQms8Lu1qCq9KpV7clZ+aR3VYZWH26q1ORwNQyuu
	 Zv/UEA46D8KtgV4/1OLrwjQFwLuJN6FqaLdW0DemiE8KFIOPx+wMcj6/DD3hTnT5Vn
	 tQUnCWu3ryr7w==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] riscv: mm: Fixup no5lvl failure when vaddr is invalid
Date: Sun, 25 Jan 2026 00:52:12 -0500
Message-Id: <20260125055212.433163-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

RnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3Jn
PgoKVW5saWtlIG5vNGx2bCwgbm81bHZsIHN0aWxsIGNvbnRpbnVlcyBkZXRlY3Qgc2F0cCwgd2hp
Y2gKcmVxdWlyZXMgdmE9cGEgbWFwcGluZy4gV2hlbiBwYT0weDgwMDAwMDAwMDAwMCwgbm81bHZs
CndvdWxkIGZhaWwgaW4gU3Y0OCBtb2RlIGR1ZSB0byBhbiBpbGxlZ2FsIFZBIHZhbHVlIG9mCjB4
ODAwMDAwMDAwMDAwLgoKU28sIHByZXZlbnQgZGV0ZWN0aW5nIHRoZSBzYXRwIGZsb3cgZm9yIG5v
NWx2bCwgd2hlbgp2YWRkciBpcyBpbnZhbGlkLiBBZGQgdGhlIGlzX3ZhZGRyX3ZhbGlkKCkgZnVu
Y3Rpb24gZm9yCmNoZWNraW5nLgoKRml4ZXM6IDI2ZTdhYWNiODNkZiAoInJpc2N2OiBBbGxvdyB0
byBkb3duZ3JhZGUgcGFnaW5nIG1vZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5lIikKQ2M6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KQ2M6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFj
YWRlbXkpIDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCkNoYW5nZWxvZzoKCnYyOgogLSBVc2UgaXNf
dmFkZHJfdmFsaWQoKSBpbnN0ZWFkIG9mIHNpbXBsZSByZXR1cm4uCiAtIERvbid0IGNoYW5nZSB0
aGUgb3JpZ2luYWwgbm81bHZsIGNvZGUgbG9naWMuCgp2MToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNjAxMTgxNDU0NDEuMjkxMzAyLTEtZ3VvcmVuQGtlcm5lbC5vcmcv
Ci0tLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggYWRkYjhhOTMwNWJlLi5i
ZmVhOWY3M2U3MDMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCkBAIC04NTIsNiArODUyLDI3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBz
ZXRfbW1hcF9ybmRfYml0c19tYXgodm9pZCkKIAltbWFwX3JuZF9iaXRzX21heCA9IE1NQVBfVkFf
QklUUyAtIFBBR0VfU0hJRlQgLSAzOwogfQogCitzdGF0aWMgYm9vbCBfX2luaXQgaXNfdmFkZHJf
dmFsaWQodW5zaWduZWQgbG9uZyB2YSkKK3sKKwl1bnNpZ25lZCBsb25nIHVwID0gMDsKKworCXN3
aXRjaCAoc2F0cF9tb2RlKSB7CisJY2FzZSBTQVRQX01PREVfMzk6CisJCXVwID0gMVVMIDw8IDM4
OworCQlicmVhazsKKwljYXNlIFNBVFBfTU9ERV80ODoKKwkJdXAgPSAxVUwgPDwgNDc7CisJCWJy
ZWFrOworCWNhc2UgU0FUUF9NT0RFXzU3OgorCQl1cCA9IDFVTCA8PCA1NjsKKwkJYnJlYWs7CisJ
ZGVmYXVsdDoKKwkJcmV0dXJuIGZhbHNlOworCX0KKworCXJldHVybiAodmEgPCB1cCkgfHwgKHZh
ID49IChVTE9OR19NQVggLSB1cCArIDEpKTsKK30KKwogLyoKICAqIFRoZXJlIGlzIGEgc2ltcGxl
IHdheSB0byBkZXRlcm1pbmUgaWYgNC1sZXZlbCBpcyBzdXBwb3J0ZWQgYnkgdGhlCiAgKiB1bmRl
cmx5aW5nIGhhcmR3YXJlOiBlc3RhYmxpc2ggMToxIG1hcHBpbmcgaW4gNC1sZXZlbCBwYWdlIHRh
YmxlIG1vZGUKQEAgLTg5Myw2ICs5MTQsOSBAQCBzdGF0aWMgX19pbml0IHZvaWQgc2V0X3NhdHBf
bW9kZSh1aW50cHRyX3QgZHRiX3BhKQogCQkJICAgc2V0X3NhdHBfbW9kZV9wbWQgKyBQTURfU0la
RSwKIAkJCSAgIFBNRF9TSVpFLCBQQUdFX0tFUk5FTF9FWEVDKTsKIHJldHJ5OgorCWlmICghaXNf
dmFkZHJfdmFsaWQoc2V0X3NhdHBfbW9kZV9wbWQpKQorCQlnb3RvIG91dDsKKwogCWNyZWF0ZV9w
Z2RfbWFwcGluZyhlYXJseV9wZ19kaXIsCiAJCQkgICBzZXRfc2F0cF9tb2RlX3BtZCwKIAkJCSAg
IHBndGFibGVfbDVfZW5hYmxlZCA/CkBAIC05MTUsNiArOTM5LDcgQEAgc3RhdGljIF9faW5pdCB2
b2lkIHNldF9zYXRwX21vZGUodWludHB0cl90IGR0Yl9wYSkKIAkJZGlzYWJsZV9wZ3RhYmxlX2w0
KCk7CiAJfQogCitvdXQ6CiAJbWVtc2V0KGVhcmx5X3BnX2RpciwgMCwgUEFHRV9TSVpFKTsKIAlt
ZW1zZXQoZWFybHlfcDRkLCAwLCBQQUdFX1NJWkUpOwogCW1lbXNldChlYXJseV9wdWQsIDAsIFBB
R0VfU0laRSk7Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
