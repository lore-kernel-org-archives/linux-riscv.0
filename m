Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9588C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPWNpC6O49pbJw5jbxUBUqlBj/WG3747IX3LPIW4qbs=; b=4XUs0Vj6pDMRsO
	713H8xMtuHJsGp41a/M2FQQaWqGnnn3N5trldyjI3oU1ISIhTSx6x866IHd9i8Mp6QqHY5oxrCVBJ
	JNoI9ma6Xp9nr+Pm1qszBEU0jy7UyTMpDk7s5MpJkzl9gavq80Gy8SjkJkfTo4gAxCZE3SUO7HNc8
	+kcChE8jWnobd/Ai7gaiSdeDEHlpd80oz33ZAHiFkAD4TUI7hxUA9Yp9fxwwrqTB1ws2R1rK19zNC
	jS+3ZK196WEgTxv2giZSZIbKyn60IStzAuEC1KVLKViLrx2xp52bMWdPYX01PIrXwt7AK2EqN32Iq
	i6Pn3rfEIkP1aEB+58Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ccu-00AXzF-2c;
	Mon, 29 May 2023 13:09:32 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ccs-00AXy3-1t
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:09:32 +0000
X-QQ-mid: bizesmtp84t1685365756twqe4148
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 21:09:15 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: c42nD1GNGymYSx9zxbwKVxV026O2dZWRFqYx6VQqJt6skveeHg/nZbB/cHuZH
	yNePeKtpfxiGhlrCiFRwsT41pB2wFLQqVPZ421ScXWSPm8WuUHiCwKQ49QH9580QgRZllK6
	kAaElYyTFvBbXqR/lhLnOXSQU22pnZim6le3759YqTcbbL+WXrujyuMlMXr+Cv7uv5MfKF6
	nBKBBATqyNtj0st9oDj0zF6U8qzqutCKNead501b7xS5i8jYxBc+F1Kmsrh2H/3f4IEt1us
	tqatwCDcOYeFimS8rExKu652H6GDc/H/Xf8uMN37CFoDjdnnuyNoXEv2T9EAudaLLCF3+PA
	QCv95hQ/2kQXzkSSYDxg3fBIEf3ZGyBGoPJieoMnz2Vcro6q28=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16574069139898678745
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 7/7] tools/nolibc: open: fix up compile warning for arm
Date: Mon, 29 May 2023 21:09:09 +0800
Message-Id: <63248d72857cd6e40f997b0893e865faeab2d40e.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060930_921334_699F43C2 
X-CRM114-Status: UNSURE (   9.89  )
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

ICAgIEluIGZ1bmN0aW9uIOKAmG9wZW7igJk6CiAgICBub2xpYmMvc3lzcm9vdC9hcm0vaW5jbHVk
ZS9zeXMuaDo5MTk6MjM6IHdhcm5pbmc6IOKAmG1vZGVfdOKAmSB7YWthIOKAmHNob3J0IHVuc2ln
bmVkIGludOKAmX0gaXMgcHJvbW90ZWQgdG8g4oCYaW504oCZIHdoZW4gcGFzc2VkIHRocm91Z2gg
4oCYLi4u4oCZCiAgICAgIDkxOSB8ICAgbW9kZSA9IHZhX2FyZyhhcmdzLCBtb2RlX3QpOwogICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXgogICAgbm9saWJjL3N5c3Jvb3QvYXJtL2lu
Y2x1ZGUvc3lzLmg6OTE5OjIzOiBub3RlOiAoc28geW91IHNob3VsZCBwYXNzIOKAmGludOKAmSBu
b3Qg4oCYbW9kZV904oCZIHtha2Eg4oCYc2hvcnQgdW5zaWduZWQgaW504oCZfSB0byDigJh2YV9h
cmfigJkpCiAgICBub2xpYmMvc3lzcm9vdC9hcm0vaW5jbHVkZS9zeXMuaDo5MTk6MjM6IG5vdGU6
IGlmIHRoaXMgY29kZSBpcyByZWFjaGVkLCB0aGUgcHJvZ3JhbSB3aWxsIGFib3J0CgpTaWduZWQt
b2ZmLWJ5OiBaaGFuZ2ppbiBXdSA8ZmFsY29uQHRpbnlsYWIub3JnPgotLS0KIHRvb2xzL2luY2x1
ZGUvbm9saWJjL3N5cy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggYi90
b29scy9pbmNsdWRlL25vbGliYy9zeXMuaAppbmRleCAxZDZmMzNmNTg2MjkuLjE1NDE5NDA1Njk2
MiAxMDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKKysrIGIvdG9vbHMvaW5j
bHVkZS9ub2xpYmMvc3lzLmgKQEAgLTg2Miw3ICs4NjIsNyBAQCBpbnQgb3Blbihjb25zdCBjaGFy
ICpwYXRoLCBpbnQgZmxhZ3MsIC4uLikKIAkJdmFfbGlzdCBhcmdzOwogCiAJCXZhX3N0YXJ0KGFy
Z3MsIGZsYWdzKTsKLQkJbW9kZSA9IHZhX2FyZyhhcmdzLCBtb2RlX3QpOworCQltb2RlID0gdmFf
YXJnKGFyZ3MsIGludCk7CiAJCXZhX2VuZChhcmdzKTsKIAl9CiAKLS0gCjIuMjUuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
