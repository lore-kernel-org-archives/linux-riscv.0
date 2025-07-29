Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EE0C87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLVVffkel8TCbV217bei1tqcmpXdrln0FKnfGrgzIRE=; b=ew4Rzzsqm7hYCK
	XvqVp/T9t2kZG3iL6PHJ+4u/AC787VtHCdSaBoh6wKmTX3+qvkk3RgmzISGIRf9qIb6Yld3ti9BC6
	Ko9256iszD3rTjBlrddHC6E5DZDJ+F0A7lUDVmrfsH7Gg4TLazhzfMYwy73ioGp6q7Me/eUGCTnJb
	kzFFnpugyRKkItwWcQLvyiuboTOBdOME49Nb8CZRZelHwnm/QJ8iLMkj+RCSBf0S6wUsZTTVYP5FG
	tYXY4zOANopFhw6LZxrMImPca78DOEr1n7x3Z1urDTcjbWPSp1CXwFCT9XLUAw3ViBCQADTaZbFhG
	72tlT82t/eG/qXJCYMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfEr-0000000GC1c-3yGO;
	Tue, 29 Jul 2025 07:59:09 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfET-0000000GBv4-2PQU
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 07:58:47 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 75E5A293B2; Tue, 29 Jul 2025 09:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1753775819; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=fctKX6s4DorIBsTkVoC4jAAakvMhelspgD8SMAwTeC/762E97zPhHS1jfWbghZBhC
	 IMdbqP3HmiIvmUkLgFHDqu+LWmUkKJbs9SUUCbqSQwiUC7yV8KgLvrS+54wZtf9AKQ
	 Rqj2nPwQo5AQ6e+HdqHBvYL5mTUrzv6B4ArxHeh2nGEOQ8/KNCJBKDS+NSCQ4Qeb9B
	 UNIH+RU57MZ4+po9QILU05jJdM1fsrVmGx1lwpPr8OZpr6LREbxotzWxYUz9zk5A1R
	 bgkyPpicj+ojoVZWCxaAQIiFNixnmx6qpBR1yBHIRsH5p+9wkorqLVKiCRbSjJ6gHU
	 IPWZxOPP35Wtg==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 07:55:30 GMT
Message-ID: <20250729084500-0.1.iq.1bn0n.0.enm20ieo12@biznator.pl>
Date: Tue, 29 Jul 2025 07:55:30 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_005846_091728_C00BCA52 
X-CRM114-Status: UNSURE (   0.31  )
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

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgbWlrcm8sIG1hxYJ5bSBpIMWbcmVkbmltIHByemVkc2nE
mWJpb3JzdHdvbSBvYm5pxbx5xIcga29zenR5IGVuZXJnaWkgZWxla3RyeWN6bmVqIGR6acSZa2kg
bW9udGHFvG93aSBpbnN0YWxhY2ppIGZvdG93b2x0YWljem5lai4gCgpBa3R1YWxuaWUgcHJvcG9u
dWplbXkgYmV6a29ua3VyZW5jeWpuZSB3YXJ1bmtpIHdzcMOzxYJwcmFjeSwgb2QgcGxhbnUgcG9w
cnpleiByZWFsaXphY2rEmSBhxbwgcG8gc2Vyd2lzLgoKUHJvc3rEmSBvIGluZm9ybWFjasSZIGN6
eSBtb8W8ZW15IHByemVkc3Rhd2nEhyBwcm9wb3p5Y2plIGRsYSBQYcWEc3R3YSBmaXJteT8KCgpQ
b3pkcmF3aWFtLApXb2pjaWVjaCBNcm9jemthCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
