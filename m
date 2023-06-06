Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BD1C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yAyg0jymbNLy168GEr5OudaTaSpfTKH9EJEzjS05ik=; b=4zsVArB6u6dUrk
	5TIZwOq6iWI08rZrnoku/STXrplUIruc6SqZPx6gGgwyR8Twa0Ru2ZwBa9eRxckWf8teONO33ZLQb
	xx2ZbrQvLZJ/+SrwyfID48JjOB8Xj1D4u69Al3ctQjL5Sln79qkcA7hsGjl41Vx5DBHkRMDRlLLlM
	Qr+hEdU3qmMeq3a8QR7O3ZeCKUdUVurx4w91qdSklEvmNYaOzb6C7Cv4dY1lCqtmlV62bf5To1gVH
	LfeZPjJUX7pp1IYfstje9ujTCMpqFHGC3wEgk/i+snGMH3EQ2cm0qEu+BNz+ZfiNYEG29v9vSaqDF
	LjtrelsNRynmUr2OtAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Rlc-000k1z-0l;
	Tue, 06 Jun 2023 08:10:12 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RlY-000k0n-2k
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 08:10:10 +0000
X-QQ-mid: bizesmtp74t1686038995tv89ingj
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 16:09:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: HH6/KuQOBEZ8A8pYx8XsBdrlyHL8GtyVq+ZUYV+ZZkz5xn0a8lAF48lB5ZtBN
	SEWV6uZWjpbmERUWWwjt4KHGN6OUhX3XImQ0L7p7kXrbRfdWAKcpM/mpRkjsNRth7sRK30F
	oLwh+CsaqTOX+bNQGyM0K20+LqxfeXTvq1RHm5O/G6QDI3z42kjmXotyPTq/8v9Ii9CqVa5
	WoUNXfWEfyW1TrJwG4a8+z0fI2ABZfq1QiLkCmY+J3QAlzybxry9PnCd7+qW5+2UC7Sp4ma
	FIf/x3mgWeYBACj50Qgz2pRM3ScdIBRZDKtwL910cw7SxyhfKwdvvN+K/3izjyLKz2AkkJM
	REp0CjT5nX4zPp5U+vBZkFTEMNAyE9w7qEI508/U7kiFmnEDTMTHEmP64/qJ1FRhs/y9Mus
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11179949754190029416
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and __sysret() helpers
Date: Tue,  6 Jun 2023 16:09:51 +0800
Message-Id: <a42fb9e1bbe0daf7d8a48ea8f44135ef851030d7.1686036862.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686036862.git.falcon@tinylab.org>
References: <cover.1686036862.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_011009_215483_2F9A0DB5 
X-CRM114-Status: GOOD (  11.19  )
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

bW9zdCBvZiB0aGUgbGlicmFyeSByb3V0aW5lcyBzaGFyZSB0aGUgc2FtZSBjb2RlIG1vZGVsLCBs
ZXQncyBhZGQgdHdvCmhlbHBlcnMgdG8gc2ltcGxpZnkgdGhlIGNvZGluZyBhbmQgc2hyaW5rIHRo
ZSBjb2RlIGxpbmVzIHRvby4KCk9uZSBhZGRlZCBmb3Igc3lzY2FsbCByZXR1cm4sIG9uZSBhZGRl
ZCBmb3Igc3lzY2FsbCBjYWxsLgoKVGhvbWFzIHN1Z2dlc3RlZCB0byB1c2UgaW5saW5lIGZ1bmN0
aW9uIGluc3RlYWQgb2YgbWFjcm8gZm9yIF9fc3lzcmV0KCksCmFuZCBoZSBhbHNvIGhlbHBlZCB0
byBzaW1wbGlmeSB0aGUgX19zeXNjYWxsKCkgYSBsb3QuCgpXaWxseSBzdWdnZXN0ZWQgdG8gbWFr
ZSBfX3N5c3JldCgpIGJlIGFsd2F5cyBpbmxpbmUuCgpTdWdnZXN0ZWQtYnk6IFdpbGx5IFRhcnJl
YXUgPHdAMXd0LmV1PgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9a
SDEraGtoaUEyK0l0U3ZYQDF3dC5ldS8KU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2L2VhNGU3NDQyLTcyMjMtNDIxMS1iYTI5LTcwODIxZTkwNzg4OEB0LThjaC5kZS8KU2ln
bmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KLS0tCiB0b29scy9p
bmNsdWRlL25vbGliYy9zeXMuaCB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaCBi
L3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCmluZGV4IDU0NjRmOTNlODYzZS4uYzEyYzE0ZGIw
NTZlIDEwMDY0NAotLS0gYS90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaAorKysgYi90b29scy9p
bmNsdWRlL25vbGliYy9zeXMuaApAQCAtMjgsNiArMjgsMTggQEAKICNpbmNsdWRlICJlcnJuby5o
IgogI2luY2x1ZGUgInR5cGVzLmgiCiAKKy8qIFN5c2NhbGwgcmV0dXJuIGhlbHBlciwgc2V0IGVy
cm5vIGFzIC1yZXQgd2hlbiByZXQgPCAwICovCitzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18o
KGFsd2F5c19pbmxpbmUpKSBsb25nIF9fc3lzcmV0KGxvbmcgcmV0KQoreworCWlmIChyZXQgPCAw
KSB7CisJCVNFVF9FUlJOTygtcmV0KTsKKwkJcmV0ID0gLTE7CisJfQorCXJldHVybiByZXQ7Cit9
CisKKy8qIFN5c2NhbGwgY2FsbCBoZWxwZXIsIHVzZSBzeXNjYWxsIG5hbWUgaW5zdGVhZCBvZiBz
eXNjYWxsIG51bWJlciAqLworI2RlZmluZSBfX3N5c2NhbGwobmFtZSwgLi4uKSBfX3N5c3JldChz
eXNfIyNuYW1lKF9fVkFfQVJHU19fKSkKIAogLyogRnVuY3Rpb25zIGluIHRoaXMgZmlsZSBvbmx5
IGRlc2NyaWJlIHN5c2NhbGxzLiBUaGV5J3JlIGRlY2xhcmVkIHN0YXRpYyBzbwogICogdGhhdCB0
aGUgY29tcGlsZXIgdXN1YWxseSBkZWNpZGVzIHRvIGlubGluZSB0aGVtIHdoaWxlIHN0aWxsIGJl
aW5nIGFsbG93ZWQKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
