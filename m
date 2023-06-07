Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB56C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSoxC7suOz37otpz4fRCxpS6aFSIOYDTGvmT+bYRdfk=; b=x3zx6U3MhNkvXl
	/Z7jNkqqiXfUWUTijbOCJMYac6ckSEJdckicYZn3SjyjFzvJ9cMOuKL6TL0JWEGf3qMRc5zRBrfeY
	HpJ020l7kwtID/HhMaG6X+qsDVTFiKdnyocT+UbgK8RGLpw9oZYfYHYbZkhFb2zimSW9zjbLgFaH5
	cGJ7rR7uwBSiSfipMlWuuCGJ5cEegySHCUUdJ2pWKHC/YQiF6ljKGnPgzDurE60eD6pk+bW0MU3DV
	H8iqjkWiM5nwVUy+XXgdqEtr44J0LU72LEYCdqNgMmeqBjBdu5SEm1jvsrbGTVGYMn0WbM+8fVUQf
	a2ut3BdFihjyecoXZtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rNL-005eX2-3D;
	Wed, 07 Jun 2023 11:30:51 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rNI-005eVS-1t
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 11:30:50 +0000
X-QQ-mid: bizesmtp88t1686137431txjb0ruo
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 19:30:30 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: PS/N6jJLnDYwJEGZC7QAtJWPa/AlKwXo0vmdJ7kjq/mWA0tEQux5qfVTlr0zq
	V0mQ4yl64VpUmbvnsqbSN7zmeSevRUHmbKOZoV2RqIOt8edl233rqbjgHL+q7xdbYk7qw0T
	oDbzE70YdzBu94Fz3kB0Vxyk73oAMss5RRcIEMdMbDAKZGDHbrmqZ3shDB9YNI4GPLQbbyC
	YpefZjfBLWxIf0z9U6lv0MnP+rAzGLTBXjOtyEUJdteCy8j1LYn7FPmZtLhHlVEj+dAmryn
	bRmbdeOXlRWDFL3U2JhqQGtudiei24trgW3jAVgqAa8iUyA/xMvOA7v8ihmxArblu03CWvf
	A7TJ2iCs1KR4AhETgTAsng5OTvPUqWD1dzD8jIRVnYXh9ApTgLCxOG2o/o+ts6irrjY3CNF
	F0Q8oxfdQOU=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11378213777674272868
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 1/3] tools/nolibc: sys.h: add a syscall return helper
Date: Wed,  7 Jun 2023 19:30:09 +0800
Message-Id: <7cad207c4c4deb41151bd12fa658fb3fc64a5bf1.1686135913.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686135913.git.falcon@tinylab.org>
References: <cover.1686135913.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_043048_940882_AD9B028A 
X-CRM114-Status: GOOD (  11.50  )
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

TW9zdCBvZiB0aGUgbGlicmFyeSByb3V0aW5lcyBzaGFyZSB0aGUgc2FtZSBzeXNjYWxsIHJldHVy
biBsb2dpYzoKCiAgSW4gZ2VuZXJhbCwgYSAwIHJldHVybiB2YWx1ZSBpbmRpY2F0ZXMgc3VjY2Vz
cy4gIEEgLTEgcmV0dXJuIHZhbHVlCiAgaW5kaWNhdGVzIGFuIGVycm9yLCBhbmQgYW4gZXJyb3Ig
bnVtYmVyIGlzIHN0b3JlZCBpbiBlcnJuby4gWzFdCgpMZXQncyBhZGQgYSBfX3N5c3JldCgpIGhl
bHBlciBmb3IgdGhlIGFib3ZlIGxvZ2ljIHRvIHNpbXBsaWZ5IHRoZSBjb2RpbmcKYW5kIHNocmlu
ayB0aGUgY29kZSBsaW5lcyB0b28uCgpUaG9tYXMgc3VnZ2VzdGVkIHRvIHVzZSBpbmxpbmUgZnVu
Y3Rpb24gaW5zdGVhZCBvZiBtYWNybyBmb3IgX19zeXNyZXQoKS4KCldpbGx5IHN1Z2dlc3RlZCB0
byBtYWtlIF9fc3lzcmV0KCkgYmUgYWx3YXlzIGlubGluZS4KClsxXTogaHR0cHM6Ly9tYW43Lm9y
Zy9saW51eC9tYW4tcGFnZXMvbWFuMi9zeXNjYWxsLjIuaHRtbAoKU3VnZ2VzdGVkLWJ5OiBXaWxs
eSBUYXJyZWF1IDx3QDF3dC5ldT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvWkgxK2hraGlBMitJdFN2WEAxd3QuZXUvClN1Z2dlc3RlZC1ieTogVGhvbWFzIFdlacOf
c2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi9lYTRlNzQ0Mi03MjIzLTQyMTEtYmEyOS03MDgyMWU5MDc4ODhAdC04Y2gu
ZGUvClNpZ25lZC1vZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxhYi5vcmc+Ci0tLQog
dG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5
cy5oIGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKaW5kZXggODU2MjQ5YTExODkwLi4xNTA3
NzcyMDc0NjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCisrKyBiL3Rv
b2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCkBAIC0yOCw2ICsyOCwxNiBAQAogI2luY2x1ZGUgImVy
cm5vLmgiCiAjaW5jbHVkZSAidHlwZXMuaCIKIAorLyogU3lzY2FsbCByZXR1cm4gaGVscGVyLCBz
ZXQgZXJybm8gYXMgLXJldCB3aGVuIHJldCA8IDAgKi8KK3N0YXRpYyBfX2lubGluZV9fIF9fYXR0
cmlidXRlX18oKHVudXNlZCwgYWx3YXlzX2lubGluZSkpCitsb25nIF9fc3lzcmV0KGxvbmcgcmV0
KQoreworCWlmIChyZXQgPCAwKSB7CisJCVNFVF9FUlJOTygtcmV0KTsKKwkJcmV0ID0gLTE7CisJ
fQorCXJldHVybiByZXQ7Cit9CiAKIC8qIEZ1bmN0aW9ucyBpbiB0aGlzIGZpbGUgb25seSBkZXNj
cmliZSBzeXNjYWxscy4gVGhleSdyZSBkZWNsYXJlZCBzdGF0aWMgc28KICAqIHRoYXQgdGhlIGNv
bXBpbGVyIHVzdWFsbHkgZGVjaWRlcyB0byBpbmxpbmUgdGhlbSB3aGlsZSBzdGlsbCBiZWluZyBh
bGxvd2VkCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
