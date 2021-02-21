Return-Path: <SRS0=ZPlh=HX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BDCC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 14:23:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A119F60C41
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 14:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A119F60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jehqXbR0T/dHqiIuDFIul4EJWLHpiRILQBpozbsDrfE=; b=RlFTVh++dHmM2hd37l/WBHFVYQ
	CtMBNfXBsAWXeZaQrsHLUwJMYB+9iGYqonck1ucjby0ua1e3sqWvl+YcLNjBeDj7ucPQdoRnEQkfq
	TTXNasnrc2pUx629Lye4IBC/Ukm66zRpFhqULPagL3ayi3T/WXJ91thWxNjtjCOMDPjz9TsAvAUFG
	1lHd3D9XLNGA31lDbaeFzrNlAv7YRnxfQgoDl9OaoqiH3OjzilqyLFA6qmOkMmgzPbQPxO4wTEmv0
	mjw6LrdIaBuOtAZ87oS1Slfzkg9NHoRyDOgcDAr/YE0OILYKI7AlSnEZHZ29iRq7nFokQC2eDB9cx
	NbxBEfCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDpdD-0003or-Ja; Sun, 21 Feb 2021 14:22:43 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDpdA-0003o0-LD
 for linux-riscv@lists.infradead.org; Sun, 21 Feb 2021 14:22:42 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C6A621BF207;
 Sun, 21 Feb 2021 14:22:34 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Dmitry Vyukov <dvyukov@google.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Get rid of MAX_EARLY_MAPPING_SIZE
Date: Sun, 21 Feb 2021 09:22:33 -0500
Message-Id: <20210221142233.3661-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_092240_929046_6F97401C 
X-CRM114-Status: GOOD (  11.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QXQgZWFybHkgYm9vdCBzdGFnZSwgd2UgaGF2ZSBhIHdob2xlIFBHRElSIHRvIG1hcCB0aGUga2Vy
bmVsLCBzbyB0aGVyZQppcyBubyBuZWVkIHRvIHJlc3RyaWN0IHRoZSBlYXJseSBtYXBwaW5nIHNp
emUgdG8gMTI4TUIuIFJlbW92aW5nIHRoaXMKZGVmaW5lIGFsc28gYWxsb3dzIHVzIHRvIHNpbXBs
aWZ5IHNvbWUgY29tcGlsZSB0aW1lIGxvZ2ljLgoKVGhpcyBmaXhlcyBsYXJnZSBrZXJuZWwgbWFw
cGluZ3Mgd2l0aCBhIHNpemUgZ3JlYXRlciB0aGFuIDEyOE1CLCBhcyBpdAppcyB0aGUgY2FzZSBm
b3Igc3l6Ym90IGtlcm5lbHMgd2hvc2Ugc2l6ZSB3YXMganVzdCB+MTMwTUIuCgpOb3RlIHRoYXQg
b24gcnY2NCwgZm9yIG5vdywgd2UgYXJlIHRoZW4gbGltaXRlZCB0byBQR0RJUiBzaXplIGZvciBl
YXJseQptYXBwaW5nIGFzIHdlIGNhbid0IHVzZSBQR0QgbWFwcGluZ3PCoChzZWUgWzFdKS4gVGhh
dCBzaG91bGQgYmUgZW5vdWdoCmdpdmVuIHRoZSByZWxhdGl2ZSBzbWFsbCBzaXplIG9mIHN5emJv
dCBrZXJuZWxzIGNvbXBhcmVkIHRvIFBHRElSX1NJWkUKd2hpY2ggaXMgMUdCLgoKWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA2MDMxNTM2MDguMzAwNTYtMS1hbGV4QGdoaXRp
LmZyLwoKUmVwb3J0ZWQtYnk6IERtaXRyeSBWeXVrb3YgPGR2eXVrb3ZAZ29vZ2xlLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgotLS0KIGFyY2gvcmlz
Y3YvbW0vaW5pdC5jIHwgMjEgKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCmluZGV4IGY5Zjk1NjhkNjg5ZS4uZjgx
ZjgxM2I5NjAzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwpAQCAtMjI2LDggKzIyNiw2IEBAIHBnZF90IHN3YXBwZXJfcGdfZGlyW1BU
UlNfUEVSX1BHRF0gX19wYWdlX2FsaWduZWRfYnNzOwogcGdkX3QgdHJhbXBvbGluZV9wZ19kaXJb
UFRSU19QRVJfUEdEXSBfX3BhZ2VfYWxpZ25lZF9ic3M7CiBwdGVfdCBmaXhtYXBfcHRlW1BUUlNf
UEVSX1BURV0gX19wYWdlX2FsaWduZWRfYnNzOwogCi0jZGVmaW5lIE1BWF9FQVJMWV9NQVBQSU5H
X1NJWkUJU1pfMTI4TQotCiBwZ2RfdCBlYXJseV9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX2luaXRk
YXRhIF9fYWxpZ25lZChQQUdFX1NJWkUpOwogCiB2b2lkIF9fc2V0X2ZpeG1hcChlbnVtIGZpeGVk
X2FkZHJlc3NlcyBpZHgsIHBoeXNfYWRkcl90IHBoeXMsIHBncHJvdF90IHByb3QpCkBAIC0zMDIs
MTMgKzMwMCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfcHRlX21hcHBpbmcocHRlX3Qg
KnB0ZXAsCiAKIHBtZF90IHRyYW1wb2xpbmVfcG1kW1BUUlNfUEVSX1BNRF0gX19wYWdlX2FsaWdu
ZWRfYnNzOwogcG1kX3QgZml4bWFwX3BtZFtQVFJTX1BFUl9QTURdIF9fcGFnZV9hbGlnbmVkX2Jz
czsKLQotI2lmIE1BWF9FQVJMWV9NQVBQSU5HX1NJWkUgPCBQR0RJUl9TSVpFCi0jZGVmaW5lIE5V
TV9FQVJMWV9QTURTCQkxVUwKLSNlbHNlCi0jZGVmaW5lIE5VTV9FQVJMWV9QTURTCQkoMVVMICsg
TUFYX0VBUkxZX01BUFBJTkdfU0laRSAvIFBHRElSX1NJWkUpCi0jZW5kaWYKLXBtZF90IGVhcmx5
X3BtZFtQVFJTX1BFUl9QTUQgKiBOVU1fRUFSTFlfUE1EU10gX19pbml0ZGF0YSBfX2FsaWduZWQo
UEFHRV9TSVpFKTsKK3BtZF90IGVhcmx5X3BtZFtQVFJTX1BFUl9QTURdIF9faW5pdGRhdGEgX19h
bGlnbmVkKFBBR0VfU0laRSk7CiBwbWRfdCBlYXJseV9kdGJfcG1kW1BUUlNfUEVSX1BNRF0gX19p
bml0ZGF0YSBfX2FsaWduZWQoUEFHRV9TSVpFKTsKIAogc3RhdGljIHBtZF90ICpfX2luaXQgZ2V0
X3BtZF92aXJ0X2Vhcmx5KHBoeXNfYWRkcl90IHBhKQpAQCAtMzMwLDExICszMjIsOSBAQCBzdGF0
aWMgcG1kX3QgKmdldF9wbWRfdmlydF9sYXRlKHBoeXNfYWRkcl90IHBhKQogCiBzdGF0aWMgcGh5
c19hZGRyX3QgX19pbml0IGFsbG9jX3BtZF9lYXJseSh1aW50cHRyX3QgdmEpCiB7Ci0JdWludHB0
cl90IHBtZF9udW07CisJQlVHX09OKCh2YSAtIFBBR0VfT0ZGU0VUKSA+PiBQR0RJUl9TSElGVCk7
CiAKLQlwbWRfbnVtID0gKHZhIC0gUEFHRV9PRkZTRVQpID4+IFBHRElSX1NISUZUOwotCUJVR19P
TihwbWRfbnVtID49IE5VTV9FQVJMWV9QTURTKTsKLQlyZXR1cm4gKHVpbnRwdHJfdCkmZWFybHlf
cG1kW3BtZF9udW0gKiBQVFJTX1BFUl9QTURdOworCXJldHVybiAodWludHB0cl90KWVhcmx5X3Bt
ZDsKIH0KIAogc3RhdGljIHBoeXNfYWRkcl90IF9faW5pdCBhbGxvY19wbWRfZml4bWFwKHVpbnRw
dHJfdCB2YSkKQEAgLTQ1Miw3ICs0NDIsNyBAQCBhc21saW5rYWdlIHZvaWQgX19pbml0IHNldHVw
X3ZtKHVpbnRwdHJfdCBkdGJfcGEpCiAJdWludHB0cl90IHZhLCBwYSwgZW5kX3ZhOwogCXVpbnRw
dHJfdCBsb2FkX3BhID0gKHVpbnRwdHJfdCkoJl9zdGFydCk7CiAJdWludHB0cl90IGxvYWRfc3og
PSAodWludHB0cl90KSgmX2VuZCkgLSBsb2FkX3BhOwotCXVpbnRwdHJfdCBtYXBfc2l6ZSA9IGJl
c3RfbWFwX3NpemUobG9hZF9wYSwgTUFYX0VBUkxZX01BUFBJTkdfU0laRSk7CisJdWludHB0cl90
IG1hcF9zaXplOwogI2lmbmRlZiBfX1BBR0VUQUJMRV9QTURfRk9MREVECiAJcG1kX3QgZml4X2Jt
YXBfc3BtZCwgZml4X2JtYXBfZXBtZDsKICNlbmRpZgpAQCAtNDY0LDEyICs0NTQsMTEgQEAgYXNt
bGlua2FnZSB2b2lkIF9faW5pdCBzZXR1cF92bSh1aW50cHRyX3QgZHRiX3BhKQogCSAqIEVuZm9y
Y2UgYm9vdCBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzIG9mIFJWMzIgYW5kCiAJICogUlY2NCBieSBv
bmx5IGFsbG93aW5nIFBNRCBvciBQR0QgbWFwcGluZ3MuCiAJICovCi0JQlVHX09OKG1hcF9zaXpl
ID09IFBBR0VfU0laRSk7CisJbWFwX3NpemUgPSBQTURfU0laRTsKIAogCS8qIFNhbml0eSBjaGVj
ayBhbGlnbm1lbnQgYW5kIHNpemUgKi8KIAlCVUdfT04oKFBBR0VfT0ZGU0VUICUgUEdESVJfU0la
RSkgIT0gMCk7CiAJQlVHX09OKChsb2FkX3BhICUgbWFwX3NpemUpICE9IDApOwotCUJVR19PTihs
b2FkX3N6ID4gTUFYX0VBUkxZX01BUFBJTkdfU0laRSk7CiAKIAlwdF9vcHMuYWxsb2NfcHRlID0g
YWxsb2NfcHRlX2Vhcmx5OwogCXB0X29wcy5nZXRfcHRlX3ZpcnQgPSBnZXRfcHRlX3ZpcnRfZWFy
bHk7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
