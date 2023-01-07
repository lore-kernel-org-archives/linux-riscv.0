Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526DAC6379F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ocBvvX8nFpIp1e/UL1/gurMpmQiDLBUbSvxK2sQ7pE=; b=IPXYjod6CYrN37
	xcc8X1KCC/c+m6+UqtUoyYF3Wb6tstipMK1aYKWPMz52wU5jWUte2v8VOciP0zqvX39CQM9Cyk/Yt
	dpjq6F00alvwWuI7GQOQBZOuWxvvuh1ztLBMrAfEgHdWaCTX3gTj1AgikCH18fFRO76zO3Y8d3kLl
	yVQIQxF8I9YK1LmZN1ZUHJpZlwr8/y8fVW5G/I7foIxofDHAZAZW0VO1ync2pv5PQ3oqzxsBR16yN
	xQ2c8yu5WwShVYP4a0pbfaTT5MN+z3g79pC+zTPJcZXJXfDj7owJFUs40OTwxQvgpj8agxzdMKc/Z
	zo9nVfPBSm/qqSL6nkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7Y0-004W2K-9v; Sat, 07 Jan 2023 11:39:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7Xw-004Vy3-Gm
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 11:39:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F4B5B81F88;
	Sat,  7 Jan 2023 11:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5187CC43396;
	Sat,  7 Jan 2023 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673091569;
	bh=ibXELA1fPqv+k0h/D45FA6m8vJh/UThmM0vYia8LTnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJ6cXhlsWHZbFfcGF9Ck8bMzkm+8yBvS5sW/XUdPNHXM52L4GqJzRnU3TAFKz4q2E
	 RcZBlUIvimQfbL2FQolG/oemKy4EzxEzbFk+8/7suriBGh4P1HFd6wCHMHQr5iugQJ
	 K4qJCyRCoxZJDjzfSppix8mFkXs4OUCEfK51leL1ktGBBeRZpEehcW1//oMGFoZYr0
	 TfDmOQPiA7N0i7b56MWGrEbzjLJrD5MbkuzL1yOfAdlpm1wYze0pRIVSCeWdNkomsf
	 SzZIPZRSNBluDUbsp3inHgjI4g4+6qqj8Ev/yBow3mIBS3v6wdiJ8A5k4GsazoIgUn
	 zqPDeEWZZVDZw==
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
Subject: [PATCH -next V13 5/7] riscv: entry: Remove extra level wrappers of trace_hardirqs_{on,off}
Date: Sat,  7 Jan 2023 06:38:36 -0500
Message-Id: <20230107113838.3969149-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230107113838.3969149-1-guoren@kernel.org>
References: <20230107113838.3969149-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_033932_866651_FA5A38B6 
X-CRM114-Status: GOOD (  11.43  )
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
