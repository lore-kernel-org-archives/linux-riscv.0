Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E00C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9HgD0nMq0ObkKttG8J+HXBS+r6Sn8GbPPdFoDfu1sk=; b=YPLvFteHGu2f9B
	Tuqy3IdOumkROGt5Lz2tcD99hzI204E4HpFyo817cOtFZAmlrufE3jOq2ARsFELBdhm8bre741Cti
	r0B+lVxDeeURH6WMbrNuAYH8VOu19lv7U2J7IDZ/zIcnnqFCU+LtxuNWk7Dnhnph6INSeYDwCCeV4
	+BmDxmoutSTsIS7REgZwNrMhvWnHwvCKIVV4PA8QOX+xbqQFAnhuCBhg5oN/CfWGueYYLrouSQmJS
	IZpu+RicZLtwEqW0m6rDnqv0pdGcJOUn/tguNAycaTXajBb0e3aYnB5GDRm+MoYmil0+PT+EW011n
	kTTcGF7r8JlSwHq70BLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MR7-0094re-1Q;
	Sat, 03 Jun 2023 08:16:33 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MR4-0094qY-1L
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:16:32 +0000
X-QQ-mid: bizesmtp77t1685780177tiq7j5j8
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:16:15 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: hoArX50alxFFZWWL2Wyj1D3SOa6jZE2VhGESBJVTnGUig23E/NM6osFUoAejc
	ZMnT/lOPYyAss5rGMd5FNaLZyAovm6YOd7t29lhWCVjscHA33su6FF+MkKHvlCsNyzW3iet
	QTTEeqpyfmlHlPe16kFQ8T//b0we/bCoXaw76jfP8nhXhjqXglXlhb3mLhsjItcfXzOcVsn
	ow6D/k9IEf0Q7tF/wtaReG1iUW2jRUByaH8tMIGBtv/FkX2Uc9m49rBTvnu33BAK+aeG/eg
	wXrlbRPV63CeKIcUmlwSnu2AEvTkhVFGK0euwG0yyMpM1m0Px8nY0Z8nIOFF+ohSORa7fjN
	dNu7jD6jHWXx5n2wUcEz9LxNYZixsgris0WcF8ROqihn3JWeCY2apZ5A0RrzSKN4dZp/MJx
	BVUWy7RiVqo=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8375714549719897536
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test cases
Date: Sat,  3 Jun 2023 16:16:07 +0800
Message-Id: <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_011630_751160_8C09103E 
X-CRM114-Status: UNSURE (   8.46  )
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

VGhlc2UgMiB0ZXN0IGNhc2VzIGFyZSBhZGRlZCB0byBjb3ZlciB0aGUgbm9ybWFsIHVzaW5nIHNj
ZW5lcyBvZgpnZXR0aW1lb2ZkYXkoKS4KClRoZXkgaGF2ZSBiZWVuIHVzZWQgdG8gdHJpZ2dlciBh
bmQgZml4IHVwIHN1Y2ggaXNzdWUgd2l0aCBub2xpYmM6CgogICAgbm9saWJjLXRlc3QuYzooLnRl
eHQuZ2V0dGltZW9mZGF5KzB4NTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2xk
aXZtb2QnCgpUaGlzIGlzc3VlIGhhcHBlbnMgd2hpbGUgdGhlcmUgaXMgbm8gInVuc2lnbmVkIGlu
dCIgY29udmVyc2lvbiBpbiB0aGUKY29taW5nIG5ldyBjbG9ja19nZXR0aW1lIC8gY2xvY2tfZ2V0
dGltZTY0IHN5c2NhbGwgcGF0aCBvZgpnZXR0aW1lb2ZkYXkoKToKCiAgICB0di0+dHZfdXNlYyA9
IHRzLnR2X25zZWMgLyAxMDAwOwoKU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGlu
dXhAd2Vpc3NzY2h1aC5uZXQ+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzI4MDg2N2E4LTc2MDEtNGE5Ni05Yjg1LTg3NjY4ZTFmMTI4MkB0LThjaC5kZS8KU2lnbmVk
LW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KLS0tCiB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25v
bGliYy10ZXN0LmMKaW5kZXggYmY2M2ZjNjZlNDg2Li5lNjhjNTY5MmVjNTQgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCkBAIC01MzMsNiArNTMzLDgg
QEAgc3RhdGljIGludCB0ZXN0X3N0YXRfdGltZXN0YW1wcyh2b2lkKQogICovCiBpbnQgcnVuX3N5
c2NhbGwoaW50IG1pbiwgaW50IG1heCkKIHsKKwlzdHJ1Y3QgdGltZXZhbCB0djsKKwlzdHJ1Y3Qg
dGltZXpvbmUgdHo7CiAJc3RydWN0IHN0YXQgc3RhdF9idWY7CiAJaW50IGV1aWQwOwogCWludCBw
cm9jOwpAQCAtNTg4LDYgKzU5MCw4IEBAIGludCBydW5fc3lzY2FsbChpbnQgbWluLCBpbnQgbWF4
KQogCQlDQVNFX1RFU1QoZ2V0ZGVudHM2NF9yb290KTsgICBFWFBFQ1RfU1lTTkUoMSwgdGVzdF9n
ZXRkZW50czY0KCIvIiksIC0xKTsgYnJlYWs7CiAJCUNBU0VfVEVTVChnZXRkZW50czY0X251bGwp
OyAgIEVYUEVDVF9TWVNFUigxLCB0ZXN0X2dldGRlbnRzNjQoIi9kZXYvbnVsbCIpLCAtMSwgRU5P
VERJUik7IGJyZWFrOwogCQlDQVNFX1RFU1QoZ2V0dGltZW9mZGF5X251bGwpOyBFWFBFQ1RfU1lT
WlIoMSwgZ2V0dGltZW9mZGF5KE5VTEwsIE5VTEwpKTsgYnJlYWs7CisJCUNBU0VfVEVTVChnZXR0
aW1lb2ZkYXlfdHYpOyAgIEVYUEVDVF9TWVNaUigxLCBnZXR0aW1lb2ZkYXkoJnR2LCBOVUxMKSk7
IGJyZWFrOworCQlDQVNFX1RFU1QoZ2V0dGltZW9mZGF5X3R2X3R6KTtFWFBFQ1RfU1lTWlIoMSwg
Z2V0dGltZW9mZGF5KCZ0diwgJnR6KSk7IGJyZWFrOwogCQlDQVNFX1RFU1QoZ2V0cGFnZXNpemUp
OyAgICAgICBFWFBFQ1RfU1lTWlIoMSwgdGVzdF9nZXRwYWdlc2l6ZSgpKTsgYnJlYWs7CiAJCUNB
U0VfVEVTVChpb2N0bF90aW9jaW5xKTsgICAgIEVYUEVDVF9TWVNaUigxLCBpb2N0bCgwLCBUSU9D
SU5RLCAmdG1wKSk7IGJyZWFrOwogCQlDQVNFX1RFU1QoaW9jdGxfdGlvY2lucSk7ICAgICBFWFBF
Q1RfU1lTWlIoMSwgaW9jdGwoMCwgVElPQ0lOUSwgJnRtcCkpOyBicmVhazsKLS0gCjIuMjUuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
