Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE15EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxo6KMmRBd/Nt+z2e+tSAK76B9ahRvSv8OuE9xZ3nDE=; b=YoQ2IDoLs+KGuA
	Ihqw/KXx+Tv8zPqlRyeGg3UY2WYIdvyh0XhARE8pvsleEsC4WT+6hOqow3Cdek7yTuzqsAbFVgkH2
	YQDi8WlSdX7v2hDT4xnjhXane+6JiF6PBdosE6OLFlpbcLzF8ZeMbxvumwHv/jS5cBmfJP4gfTEIQ
	k3f5Un4XIyi1NCd40prL5VXa+duexqZa6cwe+mLVc4TGsLrn9rqa00ulYX6ut+pLYugJ4moVZ/mAD
	H8cZ3fXrPUMOWEMxP5n5RaUgCM0I0VcEgoWAuJePf3jOXebo1Fxa5L1hPbPD3N/I/t4OzgEGaiAOH
	Ap+gga/4A1VPhTwog48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUyT-00FjOi-2X;
	Wed, 28 Jun 2023 13:12:45 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUyQ-00FjMo-2H
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:12:44 +0000
X-QQ-mid: bizesmtp82t1687957941t9p5g4ui
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:12:19 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3gc349QTkQ7SU6ffMdAH/eQrZxvNwomvXA+s018/A5CbPdqWJXSW
	bsMr2cGgOsXAIGORzyCtAvwWtBM3WGjAIgeGNA5LwvZ7A0C3R/qatX7x0uOqiKPa+jnPPoR
	L6O/pCd7cphqFeTZFLjidIzWD70WfHXKJkoZbFrK5HGGqwJhJ/py1h1SDopPrTdtcEcqOQv
	lRFN4dnH3wRAXA5a/sh6SEb0XzJiezI5dXuqOf2Nb2WVPqg39e1NbRSSCT8G10sKwrTgS7D
	X5lHIUSGZX1OYsAM301CgLDgmN8KE+ZBq6zQ8OW3OC/MoqsucGHLIKLSmODCnkZ9jTTZOpI
	AzADRoZVbljpu1ByHxS64uX+TfoCxi6lPdMSMwN
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10617112051867632203
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
Subject: [PATCH v5 02/14] tools/nolibc: unistd.h: apply __sysret() helper
Date: Wed, 28 Jun 2023 21:11:44 +0800
Message-Id: <d6dea45987fda7edc0bdc3a1f6865ab8edd3cfd8.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_061243_044812_5F6C4712 
X-CRM114-Status: UNSURE (   6.86  )
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

VXNlIF9fc3lzcmV0KCkgdG8gc2hyaW5rIHRoZSB3aG9sZSBfc3lzY2FsbCgpIHRvIG9uZWxpbmUg
Y29kZS4KClJldmlld2VkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5u
ZXQ+ClNpZ25lZC1vZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxhYi5vcmc+Ci0tLQog
dG9vbHMvaW5jbHVkZS9ub2xpYmMvdW5pc3RkLmggfCAxMSArLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy9pbmNsdWRlL25vbGliYy91bmlzdGQuaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3VuaXN0ZC5o
CmluZGV4IDBlODMyZTEwYTBiMi4uZmFiYzg0NmY3OTdiIDEwMDY0NAotLS0gYS90b29scy9pbmNs
dWRlL25vbGliYy91bmlzdGQuaAorKysgYi90b29scy9pbmNsdWRlL25vbGliYy91bmlzdGQuaApA
QCAtNTYsMTYgKzU2LDcgQEAgaW50IHRjc2V0cGdycChpbnQgZmQsIHBpZF90IHBpZCkKIAlyZXR1
cm4gaW9jdGwoZmQsIFRJT0NTUEdSUCwgJnBpZCk7CiB9CiAKLSNkZWZpbmUgX3N5c2NhbGwoTiwg
Li4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKLSh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKLQlsb25nIF9yZXQgPSBteV9zeXNjYWxsIyNOKF9f
VkFfQVJHU19fKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCWlmIChfcmV0IDwg
MCkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCi0JCVNFVF9FUlJOTygtX3JldCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAotCQlfcmV0ID0gLTE7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKLQl9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCV9yZXQ7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Ci19KQotCisjZGVmaW5lIF9zeXNjYWxsKE4sIC4uLikgX19zeXNyZXQobXlfc3lzY2FsbCMjTihf
X1ZBX0FSR1NfXykpCiAjZGVmaW5lIF9zeXNjYWxsX25hcmcoLi4uKSBfX3N5c2NhbGxfbmFyZyhf
X1ZBX0FSR1NfXywgNiwgNSwgNCwgMywgMiwgMSwgMCkKICNkZWZpbmUgX19zeXNjYWxsX25hcmco
XzAsIF8xLCBfMiwgXzMsIF80LCBfNSwgXzYsIE4sIC4uLikgTgogI2RlZmluZSBfc3lzY2FsbF9u
KE4sIC4uLikgX3N5c2NhbGwoTiwgX19WQV9BUkdTX18pCi0tIAoyLjI1LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
