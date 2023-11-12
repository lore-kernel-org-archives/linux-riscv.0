Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9B9C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbwl2QMNDr7S+GWE61tbLxMKzT3jleZGBgwTLMlVlP4=; b=X/kSTAAjmlxduP
	m35+XBXUggnbuRUd0ib+7PNTN4iIRcR4A+7FsXx0RDZUC8d06mMY/h0cVyEVye7VcBQdLuX5oOxKU
	FtLaE4jG+pL016IWWSgkUBq4ZWd4BU324h4oQEw9zEBZxazPMnt+5xc72xwmWxoE41FUqu6armDHi
	+RuEhEX+iwat0ArO5emmj+NQM1X/MU210bQ7wZfa0pL9c0PjPAgJ0hdpjnhHuKFupJlhpHTNHzJ7I
	m+5t9A9FZYjZDZbjsC0oYOlFy7J/A6XaXrjv/K9snHs42N4q3uJy+pKUnQpkjXr7sQtGmDx8PVtdt
	0egNAm5NaCH326fmS9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mV-00Bjzl-00;
	Sun, 12 Nov 2023 06:17:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mS-00BjxL-0D
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 894DB60C09;
	Sun, 12 Nov 2023 06:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAE4C433C9;
	Sun, 12 Nov 2023 06:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769831;
	bh=xvz1rya1E02xCfXGsQlwgCTl+atNWzPl7o+rS0iSLkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fBDFivBo3T7J24ZloTMhISNIG/bND0s7vrrL2C1z8x/tqG8opLe99Kjlqlz3jI79y
	 uhVNHaWLH1ArFXGXJEiub688pP0XTpJCHrrhV2xUf6gEw2MjHITF02A1OGHKPSvyMm
	 gNV7Nk3ktsoNitWRPxry1/3uJKsYM9LO/fesvwLysYBUXJAdctqslxu60+Xi3YOeZG
	 Nz4hNdgyJbdNDW+icuW/5mS5/HQq4rq8O/X2y7OsxXv5Ro6gNIRmAyXqNN58djw1sI
	 PbAF/PpwCCzWVyeqctUo5NQ6CWFpLrSM5VNtrKLDVlU2i4CyPLVAQfVkRd+2tI6xaF
	 ABhUyCTRybIjg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 17/38] riscv: s64ilp32: Adjust TASK_SIZE for s64ilp32 kernel
Date: Sun, 12 Nov 2023 01:14:53 -0500
Message-Id: <20231112061514.2306187-18-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221712_147128_41B4A51D 
X-CRM114-Status: UNSURE (   9.08  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlIFJWNjRJTFAzMiAz
Mi1iaXQgTGludXgga2VybmVsIHVzZXMgdGhlIHNhbWUgdXNlcnNwYWNlIGFkZHJlc3MgcmFuZ2UK
YXMgdGhlIDY0LWJpdCBMaW51eCBjb21wYXQgbW9kZSwgYWJvdXQgMkdCLiBUaGV5IGhhdmUgbm8g
ZGlmZmVyZW5jZSBmcm9tCnRoZSBoYXJkd2FyZSB2aWV3LCBhbmQgYWxsIGFyZSBydW5uaW5nIElM
UDMyIG9uIGEgNjQtYml0IElTQS4gQnV0IHRoZQpzdGFuZGFyZCAzMmlscDMyIExpbnV4IGhhcyBh
IHNsaWdodGx5IGJpZ2dlciB1c2Vyc3BhY2UgYWRkcmVzcyBzcGFjZSwKYWJvdXQgMi40R0IuCgpT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCA3NTk3MGVl
MmJkYTIuLmU1ZTdhOTI5OTQ5YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTgzOSwy
MCArODM5LDI1IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3cF9jbGVhcl9leGNsdXNpdmUo
cHRlX3QgcHRlKQogICogImxvYWQgYW5kIHN0b3JlIGVmZmVjdGl2ZSBhZGRyZXNzZXMsIHdoaWNo
IGFyZSA2NGJpdHMsIG11c3QgaGF2ZSBiaXRzCiAgKiA2M+KAkzQ4IGFsbCBlcXVhbCB0byBiaXQg
NDcsIG9yIGVsc2UgYSBwYWdlLWZhdWx0IGV4Y2VwdGlvbiB3aWxsIG9jY3VyLiIKICAqLworI2Rl
ZmluZSBUQVNLX1NJWkVfMzIJKF9BQygweDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJWkUpCisKICNp
ZmRlZiBDT05GSUdfNjRCSVQKICNkZWZpbmUgVEFTS19TSVpFXzY0CShQR0RJUl9TSVpFICogUFRS
U19QRVJfUEdEIC8gMikKICNkZWZpbmUgVEFTS19TSVpFX01JTgkoUEdESVJfU0laRV9MMyAqIFBU
UlNfUEVSX1BHRCAvIDIpCiAKICNpZmRlZiBDT05GSUdfQ09NUEFUCi0jZGVmaW5lIFRBU0tfU0la
RV8zMgkoX0FDKDB4ODAwMDAwMDAsIFVMKSAtIFBBR0VfU0laRSkKICNkZWZpbmUgVEFTS19TSVpF
CSh0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCkgPyBcCiAJCQkgVEFTS19TSVpFXzMyIDogVEFT
S19TSVpFXzY0KQogI2Vsc2UKICNkZWZpbmUgVEFTS19TSVpFCVRBU0tfU0laRV82NAogI2VuZGlm
CiAKKyNlbHNlCisjaWZkZWYgQ09ORklHX0FSQ0hfUlY2NElMUDMyCisjZGVmaW5lIFRBU0tfU0la
RQlUQVNLX1NJWkVfMzIKICNlbHNlCiAjZGVmaW5lIFRBU0tfU0laRQlGSVhBRERSX1NUQVJUCisj
ZW5kaWYKICNkZWZpbmUgVEFTS19TSVpFX01JTglUQVNLX1NJWkUKICNlbmRpZgogCi0tIAoyLjM2
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
