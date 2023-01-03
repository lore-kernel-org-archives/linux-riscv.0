Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9EDC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 03:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4I7nkQk92x5J9rwoWedFbtFTVEnZVzqkKQ5VSpYcdI=; b=F2qp47le1xwUhB
	VVwps+nfEc/XaP1u2K+AbX5HIFvNoyoU5jZp6ea5Uk87zHPDfjqcesnkmI7PanJ7nQ213qRvVgtNp
	NA7YNUo7SM01vkKEK4G9LEsEGO71HhotHuNb4p8HEsjUhMFKNcZPPhTNHi9tSIp/vZ3dSBXiC21GD
	KeUIId4X5hlDRE2+ytBZeKVXNlkMX6gdJKjewZpg9DPXaTrKhERKJIibRjdPm/r9jhnYiZ/bsoUU1
	nZMQr6VgFQUS13jF72rdlYkoeTLHjRkIzRPU3jchjSqETGJuHDxzIQDHXP0Q0trfHgvHeAXQaZmEZ
	nw/H8fWSTe55JlLpvPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCY8P-00G8FC-JI; Tue, 03 Jan 2023 03:38:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCY6C-00G76s-0g
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 03:36:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5FAEB80E3F;
	Tue,  3 Jan 2023 03:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F84DC433F1;
	Tue,  3 Jan 2023 03:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672716980;
	bh=p9uq1dT3wqHk1xwCR4oP6vwWJJjGc4TOe40BN/kAFJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iIEdauUv4ZuWQxs6BqjDjuZTYGqDotkCgBvMIIYCpqNEAiR5eweo2AuvH5T32fF8Q
	 8yr60qQHY4hNVv1MO7rKlv01n++UkVAjI1Sd5Az+e3yDk5H3Sb3WS17Euv3vbE5u5E
	 +yU9WPAX4XUEXVwmAl6/0mpOaCFAsOFdIqGw6Td+vAFsptPtPviMyoG8B8gURPItFo
	 Kmm1JUfcpCeSABsept4gRbY9pFDSBl4S9P53Gm02B7pe0qGwREtjeThNK5Jauv/iGj
	 v3UFX0MvP/xso6zckdgSVTb3aEPFuXP0KDczviT9XGec9dxqFT/4Z4AQfHio+WjXAA
	 MmMqzUm1rOizA==
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
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent instrumentation inserted
Date: Mon,  2 Jan 2023 22:35:27 -0500
Message-Id: <20230103033531.2011112-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230103033531.2011112-1-guoren@kernel.org>
References: <20230103033531.2011112-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_193624_349498_184807A4 
X-CRM114-Status: GOOD (  14.44  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKV2l0aG91dCBub2luc3Ry
IHRoZSBjb21waWxlciBpcyBmcmVlIHRvIGluc2VydCBpbnN0cnVtZW50YXRpb24gKHRoaW5rCmFs
bCB0aGUgaypTQU4sIEtDb3YsIEdDb3YsIGZ0cmFjZSBldGMuLikgd2hpY2ggY2FuIGNhbGwgY29k
ZSB3ZSdyZSBub3QKeWV0IHJlYWR5IHRvIHJ1biB0aGlzIGVhcmx5IGluIHRoZSBlbnRyeSBwYXRo
LCBmb3IgaW5zdGFuY2UgaXQgY291bGQKcmVseSBvbiBSQ1Ugd2hpY2ggaXNuJ3Qgb24geWV0LCBv
ciBleHBlY3QgbG9ja2RlcCBzdGF0ZS4gKGJ5IHBldGVyeikKCkxpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L1l4Y1E2Tm9QZjNBSDBFWGVAaGlyZXoucHJvZ3JhbW1pbmcu
a2lja3MtYXNzLm5ldC8KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
ClRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgpTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMg
fCA0ICsrLS0KIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCA1NDli
ZGU1Yzk3MGEuLjk2ZWM3NmM1NGZmMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCkBAIC05NSw5ICs5NSw5IEBAIHN0
YXRpYyB2b2lkIGRvX3RyYXBfZXJyb3Ioc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBzaWdubywg
aW50IGNvZGUsCiB9CiAKICNpZiBkZWZpbmVkKENPTkZJR19YSVBfS0VSTkVMKSAmJiBkZWZpbmVk
KENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSkKLSNkZWZpbmUgX190cmFwX3NlY3Rpb24JCV9fc2Vj
dGlvbigiLnhpcC50cmFwcyIpCisjZGVmaW5lIF9fdHJhcF9zZWN0aW9uIF9fbm9pbnN0cl9zZWN0
aW9uKCIueGlwLnRyYXBzIikKICNlbHNlCi0jZGVmaW5lIF9fdHJhcF9zZWN0aW9uCisjZGVmaW5l
IF9fdHJhcF9zZWN0aW9uIG5vaW5zdHIKICNlbmRpZgogI2RlZmluZSBET19FUlJPUl9JTkZPKG5h
bWUsIHNpZ25vLCBjb2RlLCBzdHIpCQkJCVwKIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9z
ZWN0aW9uIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncykJXApkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCmluZGV4IGQ4NmY3Y2Vi
ZDRhNy4uYjI2ZjY4ZWFjNjFjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKKysr
IGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCkBAIC0yMDQsNyArMjA0LDcgQEAgc3RhdGljIGlubGlu
ZSBib29sIGFjY2Vzc19lcnJvcih1bnNpZ25lZCBsb25nIGNhdXNlLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkKICAqIFRoaXMgcm91dGluZSBoYW5kbGVzIHBhZ2UgZmF1bHRzLiAgSXQgZGV0
ZXJtaW5lcyB0aGUgYWRkcmVzcyBhbmQgdGhlCiAgKiBwcm9ibGVtLCBhbmQgdGhlbiBwYXNzZXMg
aXQgb2ZmIHRvIG9uZSBvZiB0aGUgYXBwcm9wcmlhdGUgcm91dGluZXMuCiAgKi8KLWFzbWxpbmth
Z2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQorYXNtbGlua2FnZSB2
b2lkIG5vaW5zdHIgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAlzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRzazsKIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKLS0gCjIu
MzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
