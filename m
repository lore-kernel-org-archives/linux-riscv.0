Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F41C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1EkGvrX/so/tcBz3ndM8rURayiofNJZn4DqNDxXu3Y=; b=lSFWYYP9EPG0PE
	c/SU+4H9hMkBO3JWMmsT8QeRxmf8+b09iTtbJ/Dn+f0hhMjvrXprNK+vMI6RTRRUxg1UfBq5qvLKR
	BwECVNtsiog/7u0EDbGD83CY+NilQhLKE8P0G9XabaRDPBkf09Sfa3Dy13Lkcc7F5uIV7qduZPGbW
	fjw64IQ2IY91IBSs4RiAMNY7Vj8q+M6DdmPzDkjwQP5kJ+ZmmxxrOG/GSV+g9FEVqbF55I1wzrfdL
	66S1O/YC8eeAzgDtGWzqZvk70/YiRcQsdbTGpiy/O6YzfycHSjyK7z15TFcJ622GlCB302ScGex35
	hHqdWCqNiqiK6lwpb/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MNV-0094Ik-2L;
	Sat, 03 Jun 2023 08:12:49 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MNS-0094HH-2G
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:12:48 +0000
X-QQ-mid: bizesmtp67t1685779952t05dliz3
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:12:31 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3jysSi7KPtogxkoekhC659z+ArtoJAEYTmllq6RxfjS8BCn5mqHJ
	O98HVUV0S5ZwQZkWqwX4sJdto+Rln35sV6MiI+4oN1YpPXiJxDGBEA0ZD4AsakhyzgxQEcB
	+LDpUY6CKcIgfZCHMis0AdjIpU+jAN8A1YDKWoNxahXCzvHZBH80INcI59EL0m1rulehtAa
	RwH6J1iAR8OzjdxwHL8YMi7pZ4WYVpQN/ClKWo1C7Cj+W/ub2y91JqWvGCCknHxX4AwBG9u
	te6wHZdWxiJ0EtJrB/vogkD5aJkiFm1IaZoceZHJ3taEVEj6VBkZe8YvGN3yEWituugrvxb
	HCZCVJNS/WOcoYH2sqLVK8Hb0OF8lhktNWXUUaOZNjhd5wXiHQMtjYv0sMB6U9wlr7QOZDx
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7582937344931115199
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 08/12] tools/nolibc: open: fix up compile warning for arm
Date: Sat,  3 Jun 2023 16:11:57 +0800
Message-Id: <66f55993e77b55bc666c003de2d598f81f19e4e4.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_011247_032809_8117F9C1 
X-CRM114-Status: UNSURE (   9.42  )
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
b29scy9pbmNsdWRlL25vbGliYy9zeXMuaAppbmRleCAwMTYwNjA1NDQ0ZTcuLjg1NjI0OWExMTg5
MCAxMDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKKysrIGIvdG9vbHMvaW5j
bHVkZS9ub2xpYmMvc3lzLmgKQEAgLTg2Miw3ICs4NjIsNyBAQCBpbnQgb3Blbihjb25zdCBjaGFy
ICpwYXRoLCBpbnQgZmxhZ3MsIC4uLikKIAkJdmFfbGlzdCBhcmdzOwogCiAJCXZhX3N0YXJ0KGFy
Z3MsIGZsYWdzKTsKLQkJbW9kZSA9IHZhX2FyZyhhcmdzLCBtb2RlX3QpOworCQltb2RlID0gdmFf
YXJnKGFyZ3MsIGludCk7CiAJCXZhX2VuZChhcmdzKTsKIAl9CiAKLS0gCjIuMjUuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
