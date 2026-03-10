Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72D0FCC9A8
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 01:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C89lW0zKDwGXg/VwApdpckFvzYJJICgE9zGgL0syF2U=; b=D8kjyMv8iSQ7Nz
	Cj+/mV3is3XtW0WfNjzYbGHGvHMG/rdsbVUhbn8cWof88QPSdA56Qhh2c34gmObz1kWrZEBv9YPJA
	pqc0Ccf7C3fcEiq+B58hXZ7eQMHJ7/qW3wdORBbAScIavp2hoYhayWaH8llPNOR6D1MYUHtBp+VQW
	nMlvXbybqS9ryth4+npDWAoGmS5ajx4BLxaQEk+tKWansufHa5n3rmVhDs0amKNChr5JEDSIpIoG3
	slOUDUpzbbqYRD0BLD1uPPk5FIuZMwnOlA0QcbzPQI5WNvxnIjMMnXQsISKpWl5ctz3rQWimA3FxD
	FvMx9ufEV7dEoCF8C+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGk-00000008VXa-3wcL;
	Tue, 10 Mar 2026 01:52:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGi-00000008VWa-3Q7w
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 01:52:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 919FE600B0;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47011C2BCB0;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=UDuJTfJFnSO3UuVkTPP9yX+tK1rRS0uC+sGgQyxBvZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y6SUeorP6ivVEjYpLhZRNwgvg09rNvezmJ85n4kocMdWSDfAkqEZaEk0xpv1ZRzrB
	 sVDOSGzvrFi5fVZj+sP0ue8+YcDznBa+sFEsalIm+4tVjRH3eOe7x9IiHrYdn3jLS5
	 rDVZY4u6+UkZzIcHxPUgjqyBiLIdhHVKe43iyrak56ffb71JDAzOo3TUMD2znmS9Vj
	 ENsHBxj3k2yVuRmu+febKbDHb3k/NdQiDCrZM18LNH3nUUaGaqbT9eecYJAdKnPk65
	 rUTlCwpt0/7tMgWZmCjbiJDoHWrXV1gKGa4Zj8e70iOkXyTQA5xSdiCF2XQYBJvPEX
	 Q4gV3yyZe3B7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD80FCC9A4;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:12 -0700
Subject: [PATCH v2 3/4] riscv: ptrace: Fix BIT() compilation issues
MIME-Version: 1.0
Message-Id: <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=1011;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=t37RqGcAuzbofdWiHpfRgZVkCDu2cWFOE4fQhY8Q/nQ=;
 b=EI8VcUZbPHkHsqsClRktZ8hfeD9BASOVhAmdE/u72wSQVx2Hdb9Qy6AmxBjDvee7WSeD+BT5+
 2nzD/+cWGKwCs0vBwj8yDDdGiqYC0/qq/fbY5qXz+XY13nRK9AEyiyN
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+CgpCSVQo
KSBpcyBiZWluZyB1c2VkIGluIHB0cmFjZS5oIHdpdGhvdXQgYSBkZWZpbml0aW9uLCByZXN1bHRp
bmcgaW4KY29tcGlsYXRpb24gZXJyb3JzIGluIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L2NmaS9jZml0ZXN0cy5jOgoKY2ZpdGVzdHMuYzoxMDE6NjA6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiDigJhCSVTigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCiAgMTAxIHwgICAgICAgICAgICAgICAgICAgICAgaWYgKChjZmlfcmVnLmNmaV9zdGF0
dXMuY2ZpX3N0YXRlICYgQ0ZJX0VOQUJMRV9NQVNLKSAhPSBDRklfRU5BQkxFX01BU0spCgpJbmNs
dWRlIGxpbnV4L2JpdHMuaCB0byByZXNvbHZlIHRoaXMgaXNzdWUuCgpGaXhlczogMmFmN2M5Y2Yw
MjFjICgicmlzY3YvcHRyYWNlOiBleHBvc2UgcmlzY3YgQ0ZJIHN0YXR1cyBhbmQgc3RhdGUgdmlh
IHB0cmFjZSBhbmQgaW4gY29yZSBmaWxlcyIpClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lu
cyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9wdHJhY2UuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCmluZGV4IDE4OTg4YTVmMWE2My4uNWI1M2Nl
YTE0MzU1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCkBAIC04LDYgKzgsNyBA
QAogCiAjaWZuZGVmIF9fQVNTRU1CTEVSX18KIAorI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KICNp
bmNsdWRlIDxsaW51eC90eXBlcy5oPgogCiAjZGVmaW5lIFBUUkFDRV9HRVRGRFBJQwkJMzMKCi0t
IAoyLjUyLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
