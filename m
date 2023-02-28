Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F96EC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M2VoBY57Vva7b7a6lDrrsnB+ibacYUGgnNGX168toLE=; b=sFZnQ2OqjaA56x
	h9fQ5NhDGTMuYyKWxejXWAyxaLP/+7wHUDeWIG0E+0PeE4Zp1WvDHVNqrIi7qtHlMf1a7HmVPah3/
	yqaZ+KuwxdOrBGBvKpWe5y3EVc5NMRw6PpMQMXMnliE/Ur+L9p3WDqSzFalx8uZV1HJff9vzsUowr
	xpF2Gwn9ddW3UXpKE2njb5w65+QBrpiU+RE62etRi+Mw0inZ8TThRAEhs4Gp898pDo++lGh9vbtLK
	yUvrdJOAfik+h9z25EJdwz0bZ+xKJ9+RQvVuV2F9IyIAwlnJK9uF4lbMlDQPdMGDMcEp4OekvX9mO
	48pW4c8u2NdLFdxyF+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4wD-00E0a6-2j; Tue, 28 Feb 2023 18:42:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4wA-00E0Z5-9w
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 18:42:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0095BB80E69;
	Tue, 28 Feb 2023 18:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6273AC433D2;
	Tue, 28 Feb 2023 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677609771;
	bh=bxf6Na4275DAjaKN9Sr8BVZGW0gjDgYTE05rVuIhWwo=;
	h=From:To:Cc:Subject:Date:From;
	b=fsrpFMka4rEhDNttlbTgKspj87wKZKL1+GEijCxidZ09ngGHpa2+x+se6dC+QQgX6
	 fzKhXvYZuB5pOYUYalaQPQ5/49LTwfGl8eBVr/Br6E5sTNqM/ErsTlPRtpEwvGWyOc
	 G4nq7wdtH+7FwJ1YICBYnQ09jhSTBt2KNXPyuhI/KjJ8HzOZNLatqJFSlT4ZGJtwS+
	 FMYOnlz3Hv2d0mCH2we/Aljk7NVKHs+JbsKtkgNQtgN9QhPWqje8KPPOyauFKDxpPA
	 DUuAeRS+SKqtfrMWmdzze3dAjDxRLYQVb4oO50CJkUyn93lZFG+QL+1lBat3aWZQBy
	 JS9bHptI/iQpQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] lib/test_string.c: Make definition less dense
Date: Tue, 28 Feb 2023 19:42:44 +0100
Message-Id: <20230228184245.1585775-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_104254_514153_8406E2A1 
X-CRM114-Status: GOOD (  10.62  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQ2hlY2twYXRjaCBzZWVt
cyB0byBoYXZlIHRyb3VibGUgbWFraW5nIHNlbnNlIG9mIHRoZSBzaXR1YXRpb24gd2hlbgpzdHJ1
Y3QgZGVmaW5pdGlvbnMsIHZhcmlhYmxlIGRlZmluaXRpb25zLCBhbmQgX19pbml0Y29uc3QgbWFy
a2luZyBpcwpkb25lIGluIG9uZSBnby4KCkxldCdzIGJlIG5pY2VyIHRvIGNoZWNrcGF0Y2gsIGFu
ZCBtb3ZlIHRoZSBzdHJ1Y3QgZGVmaW5pdGlvbiBvdXQsCndoaWNoIHJlbW92ZXMgdGhlIGVycm9y
LgoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0K
IGxpYi90ZXN0X3N0cmluZy5jIHwgMTYgKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvdGVzdF9z
dHJpbmcuYyBiL2xpYi90ZXN0X3N0cmluZy5jCmluZGV4IGM1Y2I5MmZiNzEwZS4uNTUwMjI5MDg0
YzQxIDEwMDY0NAotLS0gYS9saWIvdGVzdF9zdHJpbmcuYworKysgYi9saWIvdGVzdF9zdHJpbmcu
YwpAQCAtMTc5LDE1ICsxNzksMTcgQEAgc3RhdGljIF9faW5pdCBpbnQgc3RybmNocl9zZWxmdGVz
dCh2b2lkKQogCXJldHVybiAwOwogfQogCitzdHJ1Y3Qgc3Ryc3BuX3Rlc3QgeworCWNvbnN0IGNo
YXIgc3RyWzE2XTsKKwljb25zdCBjaGFyIGFjY2VwdFsxNl07CisJY29uc3QgY2hhciByZWplY3Rb
MTZdOworCXVuc2lnbmVkIGludCBhOworCXVuc2lnbmVkIGludCByOworfTsKKwogc3RhdGljIF9f
aW5pdCBpbnQgc3Ryc3BuX3NlbGZ0ZXN0KHZvaWQpCiB7Ci0Jc3RhdGljIGNvbnN0IHN0cnVjdCBz
dHJzcG5fdGVzdCB7Ci0JCWNvbnN0IGNoYXIgc3RyWzE2XTsKLQkJY29uc3QgY2hhciBhY2NlcHRb
MTZdOwotCQljb25zdCBjaGFyIHJlamVjdFsxNl07Ci0JCXVuc2lnbmVkIGE7Ci0JCXVuc2lnbmVk
IHI7Ci0JfSB0ZXN0c1tdIF9faW5pdGNvbnN0ID0geworCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Ry
c3BuX3Rlc3QgdGVzdHNbXSBfX2luaXRjb25zdCA9IHsKIAkJeyAiZm9vYmFyIiwgIiIsICIiLCAw
LCA2IH0sCiAJCXsgImFiYmEiLCAiYWJjIiwgIkFCQkEiLCA0LCA0IH0sCiAJCXsgImFiYmEiLCAi
YSIsICJiIiwgMSwgMSB9LAoKYmFzZS1jb21taXQ6IGFlMzQxOWZiYWM4NDViNGQzZjNhOWZhZTRj
YzgwYzY4ZDgyY2RmNmUKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
