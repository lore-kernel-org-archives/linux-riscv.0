Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA39E7718B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtLPk3JSKon8qPGBVPYQ/OeibFbD9wggjNRFFZ0addQ=; b=RMg1aK0YGZrzXF
	83maO1A8mu+KYXtOlIojM7oVO4ljRrEbmHXQh7S6qBuQplHH0e7J6y84XT4UhcJ6kCl5gaUtAWDDs
	NY+EQcDb9JsslN7zBfpRFCEw71MniOF1z+hE/6+AGY5jgIgBsIICiVdwo4PGfRz8LTBRMLEnJZek8
	itaDEWkJQ7/vGPGAttNfiuN2uepetTV9zwxhQNI6DF5Zlats1UIv8i+3nA8dEE0bpqo22bYpArVdF
	ef4v0LhTRBobFwtS/pcPWHtZWdhQu17LcjOUWstBqTzyhyAbZTvfIEKQbmzoJbLrDDmaTc6BGKqnS
	PU80+uS9HPPzUpdCwiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ih-000000074kx-0jH8;
	Sat, 21 Dec 2024 14:44:43 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ic-000000074gX-1XWS
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792272;
	bh=nj0Jq2wR9LzNkifobwaqgqXXDXIUpTLkrlfLIfSBrB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qlYyNW/izxCwfFi+f66Ru0I8+DJsNe4VI5K+fVDh/dW7IvmATed3cwBw4PqoiW2RK
	 nRwH8DmOTcq334Zcjbx24G7FaJV3tJhMvCwuQi1xNZ03ETZz3yPX1I63rvfy8zmSUs
	 Hg7mfMhSeLDztySrOWH0RwKshbp9f8lGc1urPlNI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:44:29 +0100
Subject: [PATCH 2/6] selftests/nolibc: use waitid() over waitpid()
MIME-Version: 1.0
Message-Id: <20241221-nolibc-rv32-v1-2-d9ef6dab7c63@weissschuh.net>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=1420;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=nj0Jq2wR9LzNkifobwaqgqXXDXIUpTLkrlfLIfSBrB4=;
 b=nvClkbgo3WfomII9Gy/xuFDJ9bB9UMA1pDy2NmiSII3/8wtxOEGKSgH4f7omKIQ1AdzBh90WO
 KikHBwUy9gaDVBG4QiL3SWkr/UlaGwLPzeAQUIDgyz+zlaJNiyN5UwW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_064438_577883_F4FE123C 
X-CRM114-Status: UNSURE (   8.05  )
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

TmV3ZXIgYXJjaHMgbGlrZSByaXNjdjMyIGRvbid0IHByb3ZpZGUgd2FpdHBpZCgpIGFueW1vcmUu
ClN3aXRjaCB0byB3YWl0aWQoKSB3aGljaCBpcyBhdmFpbGFibGUgZXZlcnl3aGVyZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KLS0tCiB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyB8IDEwICsrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwppbmRleCA2ZmJhNzAy
NWM1ZTNjMDAyMDg1ODYyZmRmNmZhOTUwZGE2MDAwZDZjLi42MGM1MDk2OGQzNjMwZTQ5MDlhNWVj
YjI0MDA3NzBiYWFmN2MyYWRkIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
b2xpYmMvbm9saWJjLXRlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMv
bm9saWJjLXRlc3QuYwpAQCAtMTMyMyw3ICsxMzIzLDggQEAgc3RhdGljIGludCBydW5fcHJvdGVj
dGlvbihpbnQgbWluIF9fYXR0cmlidXRlX18oKHVudXNlZCkpLAogCQkJICBpbnQgbWF4IF9fYXR0
cmlidXRlX18oKHVudXNlZCkpKQogewogCXBpZF90IHBpZDsKLQlpbnQgbGxlbiA9IDAsIHN0YXR1
czsKKwlpbnQgbGxlbiA9IDAsIHJldDsKKwlzaWdpbmZvX3Qgc2lnaW5mbyA9IHt9OwogCXN0cnVj
dCBybGltaXQgcmxpbWl0ID0geyAwLCAwIH07CiAKIAlsbGVuICs9IHByaW50ZigiMCAtZnN0YWNr
cHJvdGVjdG9yICIpOwpAQCAtMTM2MSwxMCArMTM2MiwxMSBAQCBzdGF0aWMgaW50IHJ1bl9wcm90
ZWN0aW9uKGludCBtaW4gX19hdHRyaWJ1dGVfXygodW51c2VkKSksCiAJCXJldHVybiAxOwogCiAJ
ZGVmYXVsdDoKLQkJcGlkID0gd2FpdHBpZChwaWQsICZzdGF0dXMsIDApOworCQlyZXQgPSB3YWl0
aWQoUF9QSUQsIHBpZCwgJnNpZ2luZm8sIFdFWElURUQpOwogCi0JCWlmIChwaWQgPT0gLTEgfHwg
IVdJRlNJR05BTEVEKHN0YXR1cykgfHwgV1RFUk1TSUcoc3RhdHVzKSAhPSBTSUdBQlJUKSB7Ci0J
CQlsbGVuICs9IHByaW50Zigid2FpdHBpZCgpIik7CisJCWlmIChyZXQgIT0gMCB8fCBzaWdpbmZv
LnNpX3NpZ25vICE9IFNJR0NITEQgfHwKKwkJICAgIHNpZ2luZm8uc2lfY29kZSAhPSBDTERfS0lM
TEVEIHx8IHNpZ2luZm8uc2lfc3RhdHVzICE9IFNJR0FCUlQpIHsKKwkJCWxsZW4gKz0gcHJpbnRm
KCJ3YWl0aWQoKSIpOwogCQkJcmVzdWx0KGxsZW4sIEZBSUwpOwogCQkJcmV0dXJuIDE7CiAJCX0K
Ci0tIAoyLjQ3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
