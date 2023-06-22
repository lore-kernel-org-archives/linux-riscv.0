Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B049EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AeM0x8+Wq/THVM1gwJyfzCWnu2LCidogeGx5QsQM5BY=; b=chJbIUHPDeELPI
	3ewZxNMHl+S6OSg+49nbOrLFTSCwaEBqikmUryMIeDxTw+J2u974IQJ0Ky5Al3//j8m/cb4sPtt6P
	2EW/4Vacx2ssEhrneb6BBN0Ei2VFBqDWoP3Ptps5CylOnbSrMJWG+tiD4QxlHqKXf9jobeXdNFytU
	atqBXKkHPQYL61b9YNusLSRlBon1wUNF+oeRUd+dOUDAWZgtpfakYWAGr7x7fmQ+BM/he3aZpXRt1
	cxGOq7laPXST24UaNReopwgCT1GngP8VkTZnI70FYxSn3SsM5eS3Xqa+z1cun5h1QMO2vthQTqHe9
	mqW9mit0lPeOuS4jaLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOEL-001LrM-2P;
	Thu, 22 Jun 2023 17:36:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOEI-001Lqy-30
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 17:36:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 433E76189F;
	Thu, 22 Jun 2023 17:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46613C433C0;
	Thu, 22 Jun 2023 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687455381;
	bh=/OtlEWvMky8FwHoyDb4NvG0us2YcJyx1FBYe9wivhIo=;
	h=From:To:Cc:Subject:Date:From;
	b=SDP/87huKee/Zv1UWW27EOV4jrMoXFTtOyzBCCVV2HyEgaNUlEEUByq9LhmSB4cQK
	 akKVNj+YyNFLugitTB+lUVjf2avCXVwEpZeOLECHKo91RYsbYxvVrgshCGdYAZSGn6
	 Pcbf/v/6u2sZGEpbffUiKeA3Vux7ZXH88rKG/+xBRKsxo3gfRv9pmhjl3KaRCQ7GGB
	 GT+jJOmenD9WBi2fLUfivHK5Jupp7GHhbEDJnkSS73TJVm4wegD6JxV9lNB/a+XeeA
	 iFHcQOnUsZswGhaDS+pRpwrShuald9jYkTRJ4R65G/STQ1uWc06QiHga7mojE0upT+
	 VoQDDDWWKH93g==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux@rivosinc.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH] riscv: Discard vector state on syscalls
Date: Thu, 22 Jun 2023 19:36:13 +0200
Message-Id: <20230622173613.30722-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_103623_080063_FBF4BA7B 
X-CRM114-Status: GOOD (  13.69  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViB2ZWN0
b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXM6CiAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2Vz
IGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwogICh2MC12MzEsIHZsLCB2dHlwZSkg
YW5kIHZzdGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCgpUaGUgdmVjdG9yIHJlZ2lzdGVycyBh
cmUgY2xlYXJlZCwgdmlsbCBpcyBzZXQgKGludmFsaWQpLCBhbmQgdGhlCnZlY3RvciBzdGF0dXMg
aXMgc2V0IHRvIEluaXRpYWwuCgpUaGF0IHdheSB3ZSBjYW4gcHJldmVudCB1c2Vyc3BhY2UgZnJv
bSBhY2NpZGVudGFsbHkgcmVseWluZyBvbiB0aGUKc3RhdGVkIHNhdmUuCgpSw6ltaSBwb2ludGVk
IG91dCBbMV0gdGhhdCBjbGVhcmluZyB0aGUgcmVnaXN0ZXJzIG1pZ2h0IGJlIHN1cGVyZmx1b3Vz
LAphbmQgc2V0dGluZyB2aWxsIGlzIHN1ZmZpY2llbnQuCgpMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8xMjc4NDMyNi45VVBQSzNNQWVCQGJhc2lsZS5yZW1sYWIubmV0
LyAjIFsxXQpTdWdnZXN0ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
PgpTdWdnZXN0ZWQtYnk6IFLDqW1pIERlbmlzLUNvdXJtb250IDxyZW1pQHJlbWxhYi5uZXQ+ClNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCgpJIGZp
Z3VyZWQgSSdkIHNlbnQgb3V0IGEgcHJvcGVyIHBhdGNoLiBJIGxpa2UgQW5keSdzIG9wdGltaXph
dGlvbgpwYXRjaCwgYnV0IFRCSCBJIHRoaW5rIHdlIHNob3VsZCBkbyB0aGF0IGFzIGEgZm9sbG93
IHVwLgoKQXMgUsOpbWkgcG9pbnRlZCBvdXQsIHRoZSBjbGVhcmluZyBtaWdodCBiZSBvcHRlZCBv
dXQsIGJ1dCBJIGxlZnQgaXQgaW4KaGVyZS4KCgpCasO2cm4KCi0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZWN0b3IuaCB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMgICAgICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKaW5kZXggMDRjMGIwN2JmNmNkLi42OTJj
ZTU1ZTRhNjkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaApAQCAtMTYzLDYgKzE2MywzMCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVjdCAq
cHJldiwKIHZvaWQgcmlzY3Zfdl92c3RhdGVfY3RybF9pbml0KHN0cnVjdCB0YXNrX3N0cnVjdCAq
dHNrKTsKIGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCk7CiAKK3N0
YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQoreworCXVuc2lnbmVkIGxvbmcgdmwsIHZ0eXBlX2ludmFsID0gMVVMIDw8IChCSVRTX1BF
Ul9MT05HIC0gMSk7CisKKwlpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQorCQlyZXR1
cm47CisKKwlyaXNjdl92X2VuYWJsZSgpOworCWFzbSB2b2xhdGlsZSAoCisJCSIub3B0aW9uIHB1
c2hcblx0IgorCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCisJCSJ2c2V0dmxpCSUwLCB4MCwgZTgs
IG04LCB0YSwgbWFcblx0IgorCQkidm12LnYuaQl2MCwgMFxuXHQiCisJCSJ2bXYudi5pCXY4LCAw
XG5cdCIKKwkJInZtdi52LmkJdjE2LCAwXG5cdCIKKwkJInZtdi52LmkJdjI0LCAwXG5cdCIKKwkJ
InZzZXR2bAkJJTAsIHgwLCAlMVxuXHQiCisJCSIub3B0aW9uIHBvcFxuXHQiCisJCTogIj0mciIg
KHZsKSA6ICJyIiAodnR5cGVfaW52YWwpIDogIm1lbW9yeSIpOworCXJpc2N2X3ZfZGlzYWJsZSgp
OworCisJcmlzY3Zfdl92c3RhdGVfb24ocmVncyk7Cit9CisKICNlbHNlIC8qICEgQ09ORklHX1JJ
U0NWX0lTQV9WICAqLwogCiBzdHJ1Y3QgcHRfcmVnczsKQEAgLTE3OCw2ICsyMDIsNyBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkgeyBy
ZXR1cm4gZmFsc2U7IH0KICNkZWZpbmUgX19zd2l0Y2hfdG9fdmVjdG9yKF9fcHJldiwgX19uZXh0
KQlkbyB7fSB3aGlsZSAoMCkKICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpCQlkbyB7
fSB3aGlsZSAoMCkKICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykJCQlkbyB7fSB3aGls
ZSAoMCkKKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKQkJZG8ge30gd2hpbGUg
KDApCiAKICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1YgKi8KIApkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXgg
MDVmZmRjZDE0MjRlLi4wMGM2OGI1N2ZmODggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMjk1LDYgKzI5NSw4
IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2Fs
bF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCQlyZWdzLT5lcGMgKz0gNDsKIAkJcmVncy0+b3Jp
Z19hMCA9IHJlZ3MtPmEwOwogCisJCXJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncyk7CisKIAkJ
c3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7CiAK
IAkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKCmJhc2UtY29tbWl0OiA0NjgxZGFjYWRlZWZh
NWNhNjAxN2UwMDczNmFkYzFkN2RjOTYzYzZhCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
