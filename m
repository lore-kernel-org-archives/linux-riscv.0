Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F6AC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/wToao9dSPuTOfmBFX/SSuy0W1sFRacaxohE31f75U=; b=yLubSeJhbWeRKQ
	bExeeHPKmwLAaN0mAIz0qX/zetvIjd3jQl0utZq4Knxp0i1TYNnWB2yrnlVaS1gRazUI4BRJtbjhn
	8VGVV5N2q3XzhoHiUGLWQjUKjxOX2zW6XV+13aI7WWOV1Rp9ybAc7pGO/7LL9HD6a4jBY0P4qzy77
	Aia008UfLjgw+/h9+l0tTM6axSlHIDw/8ZEZwBXiTvpt3XtbyY4PP3LpAhvR+Wa0c/RCbzC/0KRWe
	pmWf1vr3ObgXR5zJWpVoIBwVYpANiQPr6qvKqjv9bUQyI5sZPFlwZ/eYuSGj48KZysVZ85YknOv8g
	sModE7JehZIeaN/6xIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdS5-00D34Y-0m;
	Thu, 18 May 2023 13:13:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdS3-00D32l-0F
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:13:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 998AC64F46;
	Thu, 18 May 2023 13:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566E6C433A1;
	Thu, 18 May 2023 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415630;
	bh=8Y/3tw7LBtz2gYHWlOFw83dhZ7e45+M8w9YD/Nh3m5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FXqmOW0KY+kh3dWehn3iktiaucY523D75j1oLEu2DkJNTYeHrG0CTGeI+pQW5p9WT
	 1VhHU8LKJg4V8guunv0uOqgA/bIkKJOerF+5A4BtxBY2lyKbPLXTc5wPcJSH9FXtjt
	 syM7rD68B1355HMu7rGTlmhLpynWC52buCnMOTkGGe24fYGTyiauFRixNFibs0613T
	 5ys81zV8nXJbNU1Ypt5BY/i8IHnPTJypnlsgdrIQfEjxBD7huYczviHNM8U0bA2pR5
	 ydMN/D5jsIdvQ6d45fn5yx6DatgXTxVkPS5HyWR//xLGcPvG0FgCgCrPzlS3aFR0aD
	 TvLYgcecSet9A==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 16/22] riscv: s64ilp32: Add TImode (128 int) support
Date: Thu, 18 May 2023 09:10:07 -0400
Message-Id: <20230518131013.3366406-17-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061351_156439_EEBC0D65 
X-CRM114-Status: GOOD (  10.21  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlIHM2NGlscDMyIHVz
ZXMgNjRiaXQgY29tcGlsZXIsIHNvIGl0IGNvdWxkIHN1cHBvcnQg4oCcVGV0cmEKSW50ZWdlcuKA
nSBtb2RlLCB3aGljaCByZXByZXNlbnRzIGEgc2l4dGVlbi1ieXRlICgxMjgpIGludGVnZXIuCgpJ
dCdzIHRoZSBmaXJzdCAzMkJJVCBsaW51eCBzdXBwb3J0IFRJbW9kZSA6KQoKU2lnbmVkLW9mZi1i
eTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICB8IDEg
KwogYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCmluZGV4IDMzZmU2MjRlZjZkMy4uZTBjM2RlZTY4NTEwIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC0zMDUsNiArMzA1LDcg
QEAgY29uZmlnIEFSQ0hfUlY2NEkKIGNvbmZpZyBBUkNIX1JWNjRJTFAzMgogCWJvb2wgIlJWNjRJ
TFAzMiIKIAlkZXBlbmRzIG9uIE5PTlBPUlRBQkxFCisJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSU5U
MTI4IGlmICEkKGNjLW9wdGlvbiwkKG02NC1mbGFnKSAtRF9fU0laRU9GX0lOVDEyOF9fPTApCiAJ
c2VsZWN0IDMyQklUCiAJc2VsZWN0IE1NVQogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9N
YWtlZmlsZSBiL2FyY2gvcmlzY3YvbGliL01ha2VmaWxlCmluZGV4IDI2Y2IyNTAyZWNmOC4uNjhh
ZjQ2Mzc5NWUxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZQorKysgYi9hcmNo
L3Jpc2N2L2xpYi9NYWtlZmlsZQpAQCAtOSw1ICs5LDYgQEAgbGliLXkJCQkrPSBzdHJuY21wLm8K
IGxpYi0kKENPTkZJR19NTVUpCSs9IHVhY2Nlc3MubwogbGliLSQoQ09ORklHXzY0QklUKQkrPSB0
aXNoaWZ0Lm8KIGxpYi0kKENPTkZJR19SSVNDVl9JU0FfWklDQk9aKQkrPSBjbGVhcl9wYWdlLm8K
K2xpYi0kKENPTkZJR19BUkNIX1JWNjRJTFAzMikgKz0gdGlzaGlmdC5vCiAKIG9iai0kKENPTkZJ
R19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT04pICs9IGVycm9yLWluamVjdC5vCi0tIAoyLjM2LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
