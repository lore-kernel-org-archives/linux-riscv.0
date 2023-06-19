Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F9EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/pNTxRHTMNLGPEUTGdhFRAXXaH6qA/rZXMM19kKlNI=; b=4hJd38wiS+v3hM
	FWPae7O6ZUjJ81VqqSmboCUf7BLUmVz9vw5wKi9/5pOEzl2cHYiSXJOCMJbbU2d0z82E2rHXXLjTG
	0/apDgVcPNgfe7uFKMUTgGJixLJrr/nj+MPnTL5igyh+t6GHwBt23xkcaZ6iTXH+ALmR8ZvpRU7Zz
	Jqmd1fDU4CCieejwpHY9R4QWQoTxXvYVU18UVUbduNlSgILZvop8DrNdCiqpwaptrsNo+m+mVXwZe
	3lz2rpO6VgYyj7y/2VLX/CyrjfsX/MoPPPJqC8VePNqDAuKcP83TW/adHGC3ghx6x0aNtZjizfIFb
	dzRYIMXLdK7AU0QF7c2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH0g-008nrN-2v;
	Mon, 19 Jun 2023 15:41:42 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH0e-008nqQ-0i
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:41:41 +0000
X-QQ-mid: bizesmtp75t1687189283tf03uy18
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:41:21 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3jbjpkri1hCtt3wapIdtdZ3mKAKL3x4ywEH+9AAkaH2L1w9F6TnS
	Tx+YKnNgtl1OQjDw+EgPeDa3FaWoF9IQmEUTi2AyVScB6EvSGVTGHXGnIS67XikEy6+naJo
	fSmO3ZxxH1j3v3ekw8Pf+fz/3Vw5y0iNtBdxY5vVPRSdvVba2yz0+IlpPxN96v8lDQ9vEY2
	zEO3bvznX+ArQ0IfNCgqqXbXZ6lLhLV+/FvfQ6IuoCN3z9HLoccn/YpEDOzgZ15ObHr8ldM
	6JtYrJ077RhHpSdzMd4doDetReqFvlVxWZ5HY+fXN+9H53o+TN+P/bL9iFJv+xQQb9gYLW6
	Nt2EHqyX1g14gbJiAKteWKJ+DTc5ksX0Nx4cmNTluBs3O+E5h5KOoLZ47NeDSnyQVQuzXij
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11055691782021961800
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v4 01/10] tools/nolibc: sys.h: add a syscall return helper
Date: Mon, 19 Jun 2023 23:41:18 +0800
Message-Id: <c6e6077660db1d07fdf92d89dac3641ce8195851.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084140_561903_8300F5AA 
X-CRM114-Status: GOOD (  11.21  )
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
IGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKaW5kZXggODU2MjQ5YTExODkwLi4xNTA3Nzcy
MDc0NjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCisrKyBiL3Rvb2xz
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
