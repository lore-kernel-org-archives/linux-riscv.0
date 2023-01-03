Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820A0C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 03:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ocBvvX8nFpIp1e/UL1/gurMpmQiDLBUbSvxK2sQ7pE=; b=NGpsD9HPkjgiry
	CMpUcRMSid3pr6Z0bUq9oMFAzEgy5lhvBVweS4y7P9Osqlb4G/lw6oneNu7wO013efkzxSv30IISq
	4Kd6y4lejIaHqKkaNS2J882TlzguDj1azZ/kojrlVTul4zBDV9zQv7DM/CPrArG6KApeB+wlYb+gx
	eUtC4bYtrKfv9L/2OevUmks8czFFJJs5cCMagtdYdBlVNlLvIYK7D1ZwGaQt4q1s6a3C0KOH+/BPu
	WfFR1TozrMbEI5UjrUrxhwwSLZD4/EI5L9/EqajnIOuxFTLZAfHp5CJSCjfFc/ScPwv2TLlpTg+4E
	AT/Otn52iaxHNfkCr6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCY7n-00G7oC-2X; Tue, 03 Jan 2023 03:38:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCY6Q-00G7DS-8p
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 03:36:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4FFFB80C8B;
	Tue,  3 Jan 2023 03:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE9FC433F0;
	Tue,  3 Jan 2023 03:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672716995;
	bh=ibXELA1fPqv+k0h/D45FA6m8vJh/UThmM0vYia8LTnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGwE4k4bX3ehsJS9WHMDFSptPFEnr9pqv2yOI0UmPMUr6bnoFZ1bPPOSCuiO8mkHZ
	 9e3IUI9A0YFxC7KnlpZAIMOmI2EGm83eu9LO6w9wKvZfbjBJNOCswafkI7w6aV1k6F
	 9z/91cDwz3a1zaWHPAb8hdpH7KBtdH/h06wezL6rTlFYwbcRRmkiPTxLt+Fv57+NIC
	 4J+QUQPFaW7QZpgt6Zub3a245xklQKwjudE1OqFFazUg4hcHFZHFMcAUuyCT3qg99w
	 zCJlpYaQHsAnY9JEpJkOpXftlAESaGmjcMQTcndBIfAO5aG39jrKPadpwykbfQyxZT
	 w9iJmN9Ly0glg==
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V12 5/7] riscv: entry: Remove extra level wrappers of trace_hardirqs_{on,off}
Date: Mon,  2 Jan 2023 22:35:29 -0500
Message-Id: <20230103033531.2011112-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230103033531.2011112-1-guoren@kernel.org>
References: <20230103033531.2011112-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_193639_116353_17FC092F 
X-CRM114-Status: GOOD (  13.05  )
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

RnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKU2luY2UgcmlzY3YgaXMg
Y29udmVydGVkIHRvIGdlbmVyaWMgZW50cnksIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhlCmV4dHJh
IHdyYXBwZXJzIG9mIHRyYWNlX2hhcmRpcnFzX3tvbixvZmZ9LgoKU2lnbmVkLW9mZi1ieTogSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+ClRlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL01h
a2VmaWxlICAgIHwgIDIgLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jIHwgMjcgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuaCB8
IDExIC0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQwIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCiBkZWxldGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvdHJhY2VfaXJxLmgKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCmluZGV4IDRj
ZjMwM2E3NzlhYi4uMzkyZmE2ZTM1ZDRhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9N
YWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQpAQCAtNjgsOCArNjgsNiBA
QCBvYmotJChDT05GSUdfQ1BVX1BNKQkJKz0gc3VzcGVuZF9lbnRyeS5vIHN1c3BlbmQubwogb2Jq
LSQoQ09ORklHX0ZVTkNUSU9OX1RSQUNFUikJKz0gbWNvdW50Lm8gZnRyYWNlLm8KIG9iai0kKENP
TkZJR19EWU5BTUlDX0ZUUkFDRSkJKz0gbWNvdW50LWR5bi5vCiAKLW9iai0kKENPTkZJR19UUkFD
RV9JUlFGTEFHUykJKz0gdHJhY2VfaXJxLm8KLQogb2JqLSQoQ09ORklHX1BFUkZfRVZFTlRTKQkr
PSBwZXJmX2NhbGxjaGFpbi5vCiBvYmotJChDT05GSUdfSEFWRV9QRVJGX1JFR1MpCSs9IHBlcmZf
cmVncy5vCiBvYmotJChDT05GSUdfUklTQ1ZfU0JJKQkJKz0gc2JpLm8KZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhY2VfaXJx
LmMKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDA5NWFjOTc2ZDdkYS4uMDAwMDAwMDAw
MDAwCi0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCisrKyAvZGV2L251bGwKQEAg
LTEsMjcgKzAsMCBAQAotLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLS8qCi0g
KiBDb3B5cmlnaHQgKEMpIDIwMjIgQ2hhbmdiaW4gRHUgPGNoYW5nYmluLmR1QGdtYWlsLmNvbT4K
LSAqLwotCi0jaW5jbHVkZSA8bGludXgvaXJxZmxhZ3MuaD4KLSNpbmNsdWRlIDxsaW51eC9rcHJv
YmVzLmg+Ci0jaW5jbHVkZSAidHJhY2VfaXJxLmgiCi0KLS8qCi0gKiB0cmFjZV9oYXJkaXJxc19v
bi9vZmYgcmVxdWlyZSB0aGUgY2FsbGVyIHRvIHNldHVwIGZyYW1lIHBvaW50ZXIgcHJvcGVybHku
Ci0gKiBPdGhlcndpc2UsIENBTExFUl9BRERSMSBtaWdodCB0cmlnZ2VyIGFuIHBhZ2dpbmcgZXhj
ZXB0aW9uIGluIGtlcm5lbC4KLSAqIEhlcmUgd2UgYWRkIG9uZSBleHRyYSBsZXZlbCBzbyB0aGV5
IGNhbiBiZSBzYWZlbHkgY2FsbGVkIGJ5IGxvdwotICogbGV2ZWwgZW50cnkgY29kZSB3aGljaCAk
ZnAgaXMgdXNlZCBmb3Igb3RoZXIgcHVycG9zZS4KLSAqLwotCi12b2lkIF9fdHJhY2VfaGFyZGly
cXNfb24odm9pZCkKLXsKLQl0cmFjZV9oYXJkaXJxc19vbigpOwotfQotTk9LUFJPQkVfU1lNQk9M
KF9fdHJhY2VfaGFyZGlycXNfb24pOwotCi12b2lkIF9fdHJhY2VfaGFyZGlycXNfb2ZmKHZvaWQp
Ci17Ci0JdHJhY2VfaGFyZGlycXNfb2ZmKCk7Ci19Ci1OT0tQUk9CRV9TWU1CT0woX190cmFjZV9o
YXJkaXJxc19vZmYpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhY2VfaXJxLmgg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggOTlmZTY3Mzc3ZTVlLi4wMDAwMDAwMDAwMDAKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhY2VfaXJxLmgKKysrIC9kZXYvbnVsbApAQCAtMSwxMSArMCwwIEBACi0vKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwotLyoKLSAqIENvcHlyaWdodCAoQykgMjAyMiBDaGFu
Z2JpbiBEdSA8Y2hhbmdiaW4uZHVAZ21haWwuY29tPgotICovCi0jaWZuZGVmIF9fVFJBQ0VfSVJR
X0gKLSNkZWZpbmUgX19UUkFDRV9JUlFfSAotCi12b2lkIF9fdHJhY2VfaGFyZGlycXNfb24odm9p
ZCk7Ci12b2lkIF9fdHJhY2VfaGFyZGlycXNfb2ZmKHZvaWQpOwotCi0jZW5kaWYgLyogX19UUkFD
RV9JUlFfSCAqLwotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
