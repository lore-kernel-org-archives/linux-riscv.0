Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554BCEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mvPLhsFtem87T9hKxqJWP4/Po2YBkkw89S7ILJdVcJQ=; b=AZzTNE/HCV9bbV
	EtpC998XgW8gxGJx/23EF3ibU9gPKZBX+5jWdrzdW7YbCF6Ytcuq+AfdDMU4EiakmYOYaK2bk6Qu/
	QpZ2mN6JHIhNWez+0We4pimXjlP+b3u2sAN+RuP8NU7HpUqXdIvpblzTaY3lsOihCgcV10ZoFXkVx
	Etay/fEKdnap7JhLvoDGPeXgTUWRpx8gD2mnyDo3pJHyhqARzgb+HFI220mdMlDJt0HROmPXl4L2Z
	Iyn4G8obn3xUbnUkrprYZx8YdQdl9TppziIJ6F7lbOoDeMxZTvtEl7YbVEvKnOZtF17zmiY3VMM8M
	KxKnhVgSDwjvVmhhNB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEl82-0006KE-0C;
	Thu, 29 Jun 2023 06:27:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEl7y-0006JF-2P
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 06:27:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4470A61492;
	Thu, 29 Jun 2023 06:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299C7C433C8;
	Thu, 29 Jun 2023 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688020057;
	bh=YQhuBQ3j9NEc7Bo7uyfWxsU+RoSkYIM6Un+O+o02yNs=;
	h=From:To:Cc:Subject:Date:From;
	b=cP051lzRT7C0TFbto2MNtQweDI2SV7bTfB3NWG1Z/1EupqLqJ/CaA3IX1ktNKgb33
	 YUvDm45rLg6NfT1gpm2ur6hJWTGvVbqUHdrpJ4zXqLIzMhaRk33/HZzkTkxOzRWFK8
	 42BOLaDhgD1s37sWxWV3TtwtFvyzPm9IBgrhWywoT8pUnD52ECgcBZ/jyzozJSrRIy
	 4S2S4/JrHdwSe2cvBaARUn/L74WIL58VVxNfB4sb/BIvO3rhlg7Xa29kmeSISaqe/Q
	 BEbbdPW+IcUa+n0ir3tldKu/VDDytX5Ay9l+j3ueELp/hWspZ5J4pYmdy5bZw1IOXS
	 9DmFiTgRVP/5A==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux@rivosinc.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>
Subject: [PATCH v3] riscv: Discard vector state on syscalls
Date: Thu, 29 Jun 2023 08:27:30 +0200
Message-Id: <20230629062730.985184-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_232738_861146_F812EEB3 
X-CRM114-Status: GOOD (  11.23  )
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
cmUgc2V0IHRvIGFsbCAxcywgdmlsbCBpcyBzZXQgKGludmFsaWQpLCBhbmQgdGhlCnZlY3RvciBz
dGF0dXMgaXMgc2V0IHRvIERpcnR5LgoKVGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNl
IGZyb20gYWNjaWRlbnRhbGx5IHJlbHlpbmcgb24gdGhlCnN0YXRlZCBzYXZlLgoKUsOpbWkgcG9p
bnRlZCBvdXQgWzFdIHRoYXQgd3JpdGluZyB0byB0aGUgcmVnaXN0ZXJzIG1pZ2h0IGJlCnN1cGVy
Zmx1b3VzLCBhbmQgc2V0dGluZyB2aWxsIGlzIHN1ZmZpY2llbnQuCgpMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8xMjc4NDMyNi45VVBQSzNNQWVCQGJhc2lsZS5yZW1s
YWIubmV0LyAjIFsxXQpTdWdnZXN0ZWQtYnk6IERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5j
b20+ClN1Z2dlc3RlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ClN1
Z2dlc3RlZC1ieTogUsOpbWkgRGVuaXMtQ291cm1vbnQgPHJlbWlAcmVtbGFiLm5ldD4KU2lnbmVk
LW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KCnYyLT52MzoK
ICBTZXQgc3RhdGUgdG8gRGlydHkgYWZ0ZXIgZGlzY2FyZCwgZm9yIHByb3BlciBwdHJhY2UoKSBo
YW5kbGluZwogIChBbmR5KQoKdjEtPnYyOgogIFByb3BlciByZWdpc3RlciByZXN0b3JlIGZvciBp
bml0aWFsIHN0YXRlIChBbmR5KQogIFNldCByZWdpc3RlcnMgdG8gMXMsIGFuZCBub3QgMHMgKERh
cml1cykKCi0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCB8IDMzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAg
ICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZWN0b3IuaAppbmRleCAwNGMwYjA3YmY2Y2QuLjBiMjMwNTY1MDNjNSAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCkBAIC0zMyw2ICszMywxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNj
dl92X3ZzdGF0ZV9jbGVhbihzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAlyZWdzLT5zdGF0dXMgPSAo
cmVncy0+c3RhdHVzICYgflNSX1ZTKSB8IFNSX1ZTX0NMRUFOOwogfQogCitzdGF0aWMgaW5saW5l
IHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9kaXJ0eShzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwly
ZWdzLT5zdGF0dXMgPSAocmVncy0+c3RhdHVzICYgflNSX1ZTKSB8IFNSX1ZTX0RJUlRZOworfQor
CiBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfb2ZmKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQogewogCXJlZ3MtPnN0YXR1cyA9IChyZWdzLT5zdGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNf
T0ZGOwpAQCAtMTI4LDYgKzEzMywzNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3Zz
dGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3JlXwogCXJpc2N2
X3ZfZGlzYWJsZSgpOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9k
aXNjYXJkKHZvaWQpCit7CisJdW5zaWduZWQgbG9uZyB2bCwgdnR5cGVfaW52YWwgPSAxVUwgPDwg
KEJJVFNfUEVSX0xPTkcgLSAxKTsKKworCXJpc2N2X3ZfZW5hYmxlKCk7CisJYXNtIHZvbGF0aWxl
ICgKKwkJIi5vcHRpb24gcHVzaFxuXHQiCisJCSIub3B0aW9uIGFyY2gsICt2XG5cdCIKKwkJInZz
ZXR2bGkJJTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCisJCSJ2bXYudi5pCXYwLCAtMVxuXHQi
CisJCSJ2bXYudi5pCXY4LCAtMVxuXHQiCisJCSJ2bXYudi5pCXYxNiwgLTFcblx0IgorCQkidm12
LnYuaQl2MjQsIC0xXG5cdCIKKwkJInZzZXR2bAkJJTAsIHgwLCAlMVxuXHQiCisJCSIub3B0aW9u
IHBvcFxuXHQiCisJCTogIj0mciIgKHZsKSA6ICJyIiAodnR5cGVfaW52YWwpIDogIm1lbW9yeSIp
OworCXJpc2N2X3ZfZGlzYWJsZSgpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92
c3RhdGVfZGlzY2FyZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlpZiAoKHJlZ3MtPnN0YXR1
cyAmIFNSX1ZTKSA9PSBTUl9WU19PRkYpCisJCXJldHVybjsKKworCV9fcmlzY3Zfdl92c3RhdGVf
ZGlzY2FyZCgpOworCV9fcmlzY3Zfdl92c3RhdGVfZGlydHkocmVncyk7Cit9CisKIHN0YXRpYyBp
bmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9zYXZlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywK
IAkJCQkgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCA1MTU4
OTYxZWE5NzcuLjVmZjYzYTc4NGE2ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCkBAIC0yOTYsNiArMjk2LDggQEAg
YXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJCXJlZ3MtPmVwYyArPSA0OwogCQlyZWdzLT5vcmlnX2Ew
ID0gcmVncy0+YTA7CiAKKwkJcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKTsKKwogCQlzeXNj
YWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKIAogCQlp
ZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQoKYmFzZS1jb21taXQ6IDQ4ODgzM2NjZGNhYzExOGRh
MTY3MDFmNGVlMDY3M2IyMGJhNDdmZTMKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
