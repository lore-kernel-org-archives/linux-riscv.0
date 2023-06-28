Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF284EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zzS6FphEP339tdpWyncwZG0VDfIBR/q7QCF5/S0Y+g=; b=zWUIoF4gdiKNoL
	nLidWCb4RD/sluj8oRuqKOW76aXdA6/u31TjDt2F6x6ItPOl0Af3Et3NvvdVSC67gXbQ9o4s0HQsK
	vp26VcMgftnG1oiTZTjd20LAoCqIIW3pZZi9DZnoKpLZG6Tn6R/X2j6sr+r9PFtIyohGvU0zh+BE6
	kp8abg2uyXDYkopWbbMkmIqs6iBY144wOGOPq3QlbAEhYy8xMe3aPfnuXK2KFxPiNvjm7PSyy7DDZ
	Op4NNH9gcTRJqLIh8W6g+1PkWCCr6LguHilEiM84lq6F7O8S6llTzn4ENMnVVdWDO93lky1jiIFoT
	NCI6KADOJBiJG0nXvLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUwn-00FjAC-0G;
	Wed, 28 Jun 2023 13:11:01 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUwk-00Fj8u-29
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:11:00 +0000
X-QQ-mid: bizesmtp81t1687957840tk05w25f
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:10:38 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3izmkUOsSxg9uIUu5hu7sXFhGMVn/F21TZKgQ+LTXI715mV+znqg
	V0FT8m4j5DU0uhm6jSBfO1u4rd7ypCrgSxJ91A3DlKLEueKsMfbTPPs+P9mJAzgNVumAW9U
	QkEQK3DazjlmxzOw8p068gfMxLkBWHbXFdbP/MVamr2vOlwQG9sNOE1r6D9eod+n8miz9Mk
	qH26SCAVQRROGIpcJ5YabBf38Pf4XN/b8ImH1ko0hkIy/ANWUjXjd3rcxdpp8bzl3nTjxt4
	/eu8Nz4NkPabuRpc5kBjSj7f6YL1B8AiP7pvmV6zn0pBlRyQemBwh60oA6IjG2HfjjdnX3N
	n38Lno9VJXoOQHtJmlyr9DM9Zvh9zrl+PAfzsaANOHi+Dmo3wsu6GmpGjn/c6JhUUagGQGB
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17494817763370749656
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v5 01/14] tools/nolibc: sys.h: add a syscall return helper
Date: Wed, 28 Jun 2023 21:08:32 +0800
Message-Id: <c23a5b2ad7c756c05d8a19af6033462ddbd948a6.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_061059_012736_DB3A8C7E 
X-CRM114-Status: GOOD (  10.89  )
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
ZGUvClJldmlld2VkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+
ClNpZ25lZC1vZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxhYi5vcmc+Ci0tLQogdG9v
bHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5o
IGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKaW5kZXggNTQ2NGY5M2U4NjNlLi4wOTdlZWY4
OGNmN2UgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCisrKyBiL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL3N5cy5oCkBAIC0yOCw2ICsyOCwxNiBAQAogI2luY2x1ZGUgImVycm5v
LmgiCiAjaW5jbHVkZSAidHlwZXMuaCIKIAorLyogU3lzY2FsbCByZXR1cm4gaGVscGVyLCBzZXQg
ZXJybm8gYXMgLXJldCB3aGVuIHJldCA8IDAgKi8KK3N0YXRpYyBfX2lubGluZV9fIF9fYXR0cmli
dXRlX18oKHVudXNlZCwgYWx3YXlzX2lubGluZSkpCitsb25nIF9fc3lzcmV0KGxvbmcgcmV0KQor
eworCWlmIChyZXQgPCAwKSB7CisJCVNFVF9FUlJOTygtcmV0KTsKKwkJcmV0ID0gLTE7CisJfQor
CXJldHVybiByZXQ7Cit9CiAKIC8qIEZ1bmN0aW9ucyBpbiB0aGlzIGZpbGUgb25seSBkZXNjcmli
ZSBzeXNjYWxscy4gVGhleSdyZSBkZWNsYXJlZCBzdGF0aWMgc28KICAqIHRoYXQgdGhlIGNvbXBp
bGVyIHVzdWFsbHkgZGVjaWRlcyB0byBpbmxpbmUgdGhlbSB3aGlsZSBzdGlsbCBiZWluZyBhbGxv
d2VkCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
