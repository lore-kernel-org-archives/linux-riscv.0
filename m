Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF11C7EE2F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/6GB/dVUiOhcQmEfyHnHxlr1ZoevFNO5qIkPMg88sg=; b=jub4fr2wL0v6VD
	RP7ztHJ994B2/x8qdCM0bMqgmxD9GFJbI+UVzkqUg3jaWXvRrLBMDhEnR+OItQlJgkRV2r2C3qOkU
	89P0sInoYJsvxRFrFEzUxoizDhm+lf6k4JO0DGSXqKiBN0mvxVFeVTeHFQ4lyFRk6gL1vNRheTNhW
	4Wxx0GuQwrC0uYl91+l+ynBEBYlgwbxDBSzHYCh4pMz1zJrWZ4SaG4sU5SVnEITxR95QSWvJW6nxe
	M6EB+L4wNwlHpAjNM0mc9wRuOjPdKilw0AqfGc0TlXFHTw1lDcsOdCBo4ESaZINuyc++x9wR3yu3O
	D4P4avjDUQoIVcPIiiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6paf-005Gzt-2r;
	Wed, 07 Jun 2023 09:36:29 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pac-005GyO-12
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 09:36:28 +0000
X-QQ-mid: bizesmtp71t1686130553tmsdhqdy
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 17:35:52 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: lkL5M32tl2CKtzfdmJppNXVfPo4dxxS2i5yjRnmFQwVRtg9qihhO/bdGb8f45
	yWn2uxZLxaR03l3EEyG3ZSe+rmOHf0zQcc978/tiuiHl9/xeA/a5gsfw1Iz5iwm9HgXYtxx
	PP8ebuEvcyWxkYw5KtdUj/NMNt0ADHXsRQs4S7w5o7GFUXvGt70EaVa1Z9M2HAzmkU0j/3+
	Ly/ztVpho8T0NWn1hGi9u1c3QjZoSjFOtbvsYaVB9tnmAOJ4B3oiKbDMiv+FjFA+JDdXPCE
	Izip3hN+MT1jbZAgpNtiTLAHenU2xXWtiLfC3EzFz8W4ty+E3z3Xdes0vghwexbdeA149FC
	1h5T5I9ph8YUWFsHRh2goaMbO2tFv9l+YES8qlLlsYf4mDSk5c1NABZFvisRPFGLWZakBFf
	qSvd39YkcwE=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14568529187218780332
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/3] tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
Date: Wed,  7 Jun 2023 17:27:52 +0800
Message-Id: <1b2ace57de2f47ae0da4457845594baf59f7e06d.1686128703.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686128703.git.falcon@tinylab.org>
References: <cover.1686128703.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_023626_681632_4297E888 
X-CRM114-Status: UNSURE (   9.70  )
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
LzVlN2QyYWRmLWU5NmYtNDFjYS1hNGM2LTVjODdhMjVkNGM5Y0BhcHAuZmFzdG1haWwuY29tLwpS
ZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KU2lnbmVkLW9mZi1ieTog
WmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KLS0tCiB0b29scy9pbmNsdWRlL25vbGli
Yy9zeXMuaCB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaCBiL3Rvb2xzL2luY2x1
ZGUvbm9saWJjL3N5cy5oCmluZGV4IDc4Yzg2ZjEyNDMzNS4uNTQ2NGY5M2U4NjNlIDEwMDY0NAot
LS0gYS90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaAorKysgYi90b29scy9pbmNsdWRlL25vbGli
Yy9zeXMuaApAQCAtNTU0LDcgKzU1NCwxMSBAQCBsb25nIGdldHBhZ2VzaXplKHZvaWQpCiBzdGF0
aWMgX19hdHRyaWJ1dGVfXygodW51c2VkKSkKIGludCBzeXNfZ2V0dGltZW9mZGF5KHN0cnVjdCB0
aW1ldmFsICp0diwgc3RydWN0IHRpbWV6b25lICp0eikKIHsKKyNpZmRlZiBfX05SX2dldHRpbWVv
ZmRheQogCXJldHVybiBteV9zeXNjYWxsMihfX05SX2dldHRpbWVvZmRheSwgdHYsIHR6KTsKKyNl
bHNlCisJcmV0dXJuIC1FTk9TWVM7CisjZW5kaWYKIH0KIAogc3RhdGljIF9fYXR0cmlidXRlX18o
KHVudXNlZCkpCkBAIC02NzIsNyArNjc2LDExIEBAIGludCBsaW5rKGNvbnN0IGNoYXIgKm9sZCwg
Y29uc3QgY2hhciAqbmV3KQogc3RhdGljIF9fYXR0cmlidXRlX18oKHVudXNlZCkpCiBvZmZfdCBz
eXNfbHNlZWsoaW50IGZkLCBvZmZfdCBvZmZzZXQsIGludCB3aGVuY2UpCiB7CisjaWZkZWYgX19O
Ul9sc2VlawogCXJldHVybiBteV9zeXNjYWxsMyhfX05SX2xzZWVrLCBmZCwgb2Zmc2V0LCB3aGVu
Y2UpOworI2Vsc2UKKwlyZXR1cm4gLUVOT1NZUzsKKyNlbmRpZgogfQogCiBzdGF0aWMgX19hdHRy
aWJ1dGVfXygodW51c2VkKSkKQEAgLTEzMzgsNyArMTM0NiwxMSBAQCBpbnQgdW5saW5rKGNvbnN0
IGNoYXIgKnBhdGgpCiBzdGF0aWMgX19hdHRyaWJ1dGVfXygodW51c2VkKSkKIHBpZF90IHN5c193
YWl0NChwaWRfdCBwaWQsIGludCAqc3RhdHVzLCBpbnQgb3B0aW9ucywgc3RydWN0IHJ1c2FnZSAq
cnVzYWdlKQogeworI2lmZGVmIF9fTlJfd2FpdDQKIAlyZXR1cm4gbXlfc3lzY2FsbDQoX19OUl93
YWl0NCwgcGlkLCBzdGF0dXMsIG9wdGlvbnMsIHJ1c2FnZSk7CisjZWxzZQorCXJldHVybiAtRU5P
U1lTOworI2VuZGlmCiB9CiAKIHN0YXRpYyBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKQotLSAKMi4y
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
