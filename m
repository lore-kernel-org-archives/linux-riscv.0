Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC87C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmbEM7mLmCuFJLZKuX4pIsTQkIxoFOLQa+2YnIALqO0=; b=fppfIBCaIedvxU
	G0vfjdROew73tAkJeV0LJWaZ6Y1rCoO1kP4gH3cLbFM3AW6fYfcUCg22uSzFi01uhch+AOuKw8Gkw
	Wj+MGnLJ78vhZbIFCGKji3PNEcf0sEsUKI4qinjqAEFq0F370YRe1UssBGWZd1slH66t7kKER2aX9
	5eIPmLuOgi8bt8tOMEabydbWwab+ICqnFJgEXamzW9Gcyku9hGEjiBhAm0j9X35HBvjTxsjJJMCqU
	bXa+oFAGPkm+FqlOosc2Umg8qkzO0ZQym7AyckaxQXa3h9jFILl3DnYNSXUZWsFp0oPVnfygfqD/3
	bhIXPgpGJJz/XBzLwqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5NC6-009ASy-0Z;
	Sat, 03 Jun 2023 09:05:06 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5NC3-009ARz-1G
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 09:05:05 +0000
X-QQ-mid: bizesmtp85t1685783090tuggc0mf
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 17:04:49 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: 7aHzntQn+UDHWzdTWpnJ/o+QEDhVowL/EH/i/fZBEdZqSAhhL5+pk34byH2Y5
	kzLZBz9qzzO0LP7M+PHEtGEIMj8KpN0Glze3AWMa2ZIfxU/SvPwyc9Aa+8xPzPVir/sy1Aq
	KT3Zbu29n8BjDugTZ9m11vay+P3VJC2mSUwnJ4qxmYg4oTSyqLFXJgJ+WZPFXp993qh/a+Z
	zCdQJ/oTJCl6Q+WrnkmPUwenBidK5AngUE7qtZZvIDdjHmT03Us1ykhpzts22qNACVokfWX
	UEWPEo9i8QuM2Ge+WRNEkvl9tU5a/xj5WytSvIRNnldYygYj9PtwEo5FCjzizT0ZAQPHGK5
	8qirc5kUl/BjHnumj7Hv6kkmRw0JMb+ifxJwUlYqlQ9HPJzHwKu2zfUKDBaW/uGb4mFlarp
	2I9DDIpEOdw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10955599285119131163
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 2/3] tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
Date: Sat,  3 Jun 2023 17:04:17 +0800
Message-Id: <a81040d90ad9f2042f653acdeb1d53b29a259028.1685780412.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685780412.git.falcon@tinylab.org>
References: <cover.1685780412.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_020503_735958_77CC30DF 
X-CRM114-Status: UNSURE (   9.28  )
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

Q29tcGlsaW5nIG5vbGliYyBmb3IgcnYzMiBnb3Qgc3VjaCBlcnJvcnM6CgogICAgbm9saWJjL3N5
c3Jvb3QvcmlzY3YvaW5jbHVkZS9zeXMuaDogSW4gZnVuY3Rpb24g4oCYc3lzX2dldHRpbWVvZmRh
eeKAmToKICAgIG5vbGliYy9zeXNyb290L3Jpc2N2L2luY2x1ZGUvc3lzLmg6NTU3OjIxOiBlcnJv
cjog4oCYX19OUl9nZXR0aW1lb2ZkYXnigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
ZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYc3lzX2dldHRpbWVvZmRheeKAmT8KICAgICAgNTU3
IHwgIHJldHVybiBteV9zeXNjYWxsMihfX05SX2dldHRpbWVvZmRheSwgdHYsIHR6KTsKICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgogICAgbm9saWJjL3N5
c3Jvb3QvcmlzY3YvaW5jbHVkZS9zeXMuaDogSW4gZnVuY3Rpb24g4oCYc3lzX2xzZWVr4oCZOgog
ICAgbm9saWJjL3N5c3Jvb3QvcmlzY3YvaW5jbHVkZS9zeXMuaDo2NzU6MjE6IGVycm9yOiDigJhf
X05SX2xzZWVr4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAg
ICA2NzUgfCAgcmV0dXJuIG15X3N5c2NhbGwzKF9fTlJfbHNlZWssIGZkLCBvZmZzZXQsIHdoZW5j
ZSk7CiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgogICAgbm9saWJj
L3N5c3Jvb3QvcmlzY3YvaW5jbHVkZS9zeXMuaDogSW4gZnVuY3Rpb24g4oCYc3lzX3dhaXQ04oCZ
OgogICAgbm9saWJjL3N5c3Jvb3QvcmlzY3YvaW5jbHVkZS9zeXMuaDoxMzQxOjIxOiBlcnJvcjog
4oCYX19OUl93YWl0NOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
ICAgICAxMzQxIHwgIHJldHVybiBteV9zeXNjYWxsNChfX05SX3dhaXQ0LCBwaWQsIHN0YXR1cywg
b3B0aW9ucywgcnVzYWdlKTsKCklmIGEgc3lzY2FsbCBtYWNybyBpcyBub3Qgc3VwcG9ydGVkIGJ5
IGEgdGFyZ2V0IHBsYXRmb3JtLCB3cmFwIGl0IHdpdGgKJyNpZmRlZicgYW5kICdyZXR1cm4gLUVO
T1NZUycgZm9yIHRoZSAnI2Vsc2UnIGJyYW5jaCwgd2hpY2ggbGV0cyB0aGUKb3RoZXIgc3lzY2Fs
bHMgd29yayBhcy1pcyBhbmQgYWxsb3dzIGRldmVsb3BlcnMgdG8gZml4IHVwIHRoZSB0ZXN0CmZh
aWx1cmVzIHJlcG9ydGVkIGJ5IG5vbGliYy10ZXN0IG9uZSBieSBvbmUgbGF0ZXIuCgpUaGlzIHdy
YXBzIGFsbCBvZiB0aGUgZmFpbGVkIHN5c2NhbGwgbWFjcm9zIHdpdGggJyNpZmRlZicgYW5kICdy
ZXR1cm4KLUVOT1NZUycgZm9yIHRoZSAnI2Vsc2UnIGJyYW5jaCwgc28sIGFsbCBvZiB0aGUgdW5k
ZWNsYXJlZCBmYWlsdXJlcyBhcmUKZml4ZWQuCgpTdWdnZXN0ZWQtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzVlN2QyYWRmLWU5NmYtNDFjYS1hNGM2LTVjODdhMjVkNGM5Y0BhcHAuZmFzdG1haWwuY29tLwpT
aWduZWQtb2ZmLWJ5OiBaaGFuZ2ppbiBXdSA8ZmFsY29uQHRpbnlsYWIub3JnPgotLS0KIHRvb2xz
L2luY2x1ZGUvbm9saWJjL3N5cy5oIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5o
IGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKaW5kZXggNzhjODZmMTI0MzM1Li41NDY0Zjkz
ZTg2M2UgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCisrKyBiL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL3N5cy5oCkBAIC01NTQsNyArNTU0LDExIEBAIGxvbmcgZ2V0cGFnZXNp
emUodm9pZCkKIHN0YXRpYyBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKQogaW50IHN5c19nZXR0aW1l
b2ZkYXkoc3RydWN0IHRpbWV2YWwgKnR2LCBzdHJ1Y3QgdGltZXpvbmUgKnR6KQogeworI2lmZGVm
IF9fTlJfZ2V0dGltZW9mZGF5CiAJcmV0dXJuIG15X3N5c2NhbGwyKF9fTlJfZ2V0dGltZW9mZGF5
LCB0diwgdHopOworI2Vsc2UKKwlyZXR1cm4gLUVOT1NZUzsKKyNlbmRpZgogfQogCiBzdGF0aWMg
X19hdHRyaWJ1dGVfXygodW51c2VkKSkKQEAgLTY3Miw3ICs2NzYsMTEgQEAgaW50IGxpbmsoY29u
c3QgY2hhciAqb2xkLCBjb25zdCBjaGFyICpuZXcpCiBzdGF0aWMgX19hdHRyaWJ1dGVfXygodW51
c2VkKSkKIG9mZl90IHN5c19sc2VlayhpbnQgZmQsIG9mZl90IG9mZnNldCwgaW50IHdoZW5jZSkK
IHsKKyNpZmRlZiBfX05SX2xzZWVrCiAJcmV0dXJuIG15X3N5c2NhbGwzKF9fTlJfbHNlZWssIGZk
LCBvZmZzZXQsIHdoZW5jZSk7CisjZWxzZQorCXJldHVybiAtRU5PU1lTOworI2VuZGlmCiB9CiAK
IHN0YXRpYyBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKQpAQCAtMTMzOCw3ICsxMzQ2LDExIEBAIGlu
dCB1bmxpbmsoY29uc3QgY2hhciAqcGF0aCkKIHN0YXRpYyBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQp
KQogcGlkX3Qgc3lzX3dhaXQ0KHBpZF90IHBpZCwgaW50ICpzdGF0dXMsIGludCBvcHRpb25zLCBz
dHJ1Y3QgcnVzYWdlICpydXNhZ2UpCiB7CisjaWZkZWYgX19OUl93YWl0NAogCXJldHVybiBteV9z
eXNjYWxsNChfX05SX3dhaXQ0LCBwaWQsIHN0YXR1cywgb3B0aW9ucywgcnVzYWdlKTsKKyNlbHNl
CisJcmV0dXJuIC1FTk9TWVM7CisjZW5kaWYKIH0KIAogc3RhdGljIF9fYXR0cmlidXRlX18oKHVu
dXNlZCkpCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
