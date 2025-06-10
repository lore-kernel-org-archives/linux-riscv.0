Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFF4C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20ZP1z2ewlnrohjeO7yPfiztEF7Dv6nf/AikdC8zo+Q=; b=shwalpbPuBpOQw
	u36p4khc714L7XbXBUsVA71lWtb31+Lqjh54KJdIreuDI0jNUqFrQh//uXeyrjWod0mqBE1IxWaa6
	frs/HSnP5JnomP9TdM5rwEbY79kgEQ4/hrSCcLE6VkoOin4HJHOGWTzDVwh5NlD7CdHlJoBgoM7xA
	oH76e3o8fGByRvJRDZwubT2SLyPon2t0bqXRIq2CXsj6NaumTEgNRzVXpemOO00+WioY1ozIlZO+Z
	TtpTaVQld9LHBDcxUUQnR8yd+hCZWKZh23KhgjDmgj56XP5a+YzfnzvsRbG7uAR+xp2AaejPcKlhQ
	Jluopv8H3b7hEkymHPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nK-00000008IPk-3Bvy;
	Tue, 10 Jun 2025 22:50:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Lf-000000080st-2sTy
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qPlK4nKG6oKcdwoxWHuRy1WP7POdpnFO/j+cHRh/MAM=; b=BeBQN03yf7d6qhh2eQldiJTOME
	CIdEY4VhbRJXEyjYSib0+ePoVvBsqA0lj/lC12X9tH9e1ybI0RiMSCoszCiukMmCnL1w8bbWzwPrD
	3SENjs+qD5hkAtiGXJTJYcOGSKFv7sojf/qzZl5qbSSxk3s1XPj2ou9dFNSbKuZI81oftMilCcRbn
	0O82XhNrzhjJh5uZA9Dg8d7uhzYo5VJQmM1eHUWxH1i1qjCryymC79VFUYkjuRCzjTMg9ba2DEYa+
	bU5rOmvNpPU3/FUON9lke+OSZfe0X/KOm6/fT3v9b2aWUCMouLRNbj1ga+afQ5iaAemUvoOjlX8Hc
	kW34wAyw==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Lc-00000001zI5-2q6r
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 20:13:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44E2143A0C;
	Tue, 10 Jun 2025 20:13:21 +0000 (UTC)
Message-ID: <ce79482e-1b7e-4d7e-a030-8c250a7e406a@ghiti.fr>
Date: Tue, 10 Jun 2025 22:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: [GIT PULL] RISC-V Fixes for 6.16-rc1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduuddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvffhufgtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeevveevleelgeegheejiedtfeeggeetffdtkeektedvgffghfefgeekheegkeeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemtgegudgumeefudekieemvdguvddvmeguhedvtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemtgegudgumeefudekieemvdguvddvmeguhedvtgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemtgegudgumeefudekieemvdguvddvmeguhedvtggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_211328_914144_9F5E957A 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxOTI3MmIzN2FhNGY4M2NhNTJiZGY5
YzE2ZDVkODFiZGQxMzU0NDk0OgoKIMKgIExpbnV4IDYuMTYtcmMxICgyMDI1LTA2LTA4IDEzOjQ0
OjQzIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FsZXhnaGl0aS9s
aW51eCAKdGFncy9yaXNjdi1maXhlcy02LjE2LXJjMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDBlNzgxNWU0NjQ4NDdhY2JlNWQ5YWRmYjM1MWM2OGY4MjJiYmFhN2U6CgogwqAgUklT
Qy1WOiB2RFNPOiBDb3JyZWN0IGlubGluZSBhc3NlbWJseSBjb25zdHJhaW50cyBpbiB0aGUgZ2V0
cmFuZG9tIApzeXNjYWxsIHdyYXBwZXIgKDIwMjUtMDYtMTAgMDg6NDM6NDYgKzAwMDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCnJpc2N2IGZpeGVzIGZvciA2LjE2LXJjMQoKLSBBIGZpeCBmb3IgdGhlIG5ld2x5IGludHJv
ZHVjZWQgZ2V0cmFuZG9tIHZkc28gd2hlcmUgY2xhbmcgb3B0aW1pemVzIAphd2F5IGEgcmVnaXN0
ZXIgdmFyaWFibGUgd2hpY2ggaXMgYm90aCBhbiBpbnB1dCBhbmQgYW4gb3V0cHV0IHBhcmFtZXRl
cgotIEFub3RoZXIgZml4IGZvciB2ZHNvIHRvIHByZXZlbnQgYW4gZXJyb3IgZnJvbSBsbHZtLXJl
YWRlbGYKLSBBIGZpeCBmb3IgdGhlIHJ1bnRpbWUgY29uc3RhbnQgc3VwcG9ydCB3aGljaCBkaWQg
bm90IGhhbmRsZSB0aGUgemVybyAKY2FzZSBjb3JyZWN0bHkKLSBBIGZpeCBmb3IgdGhlYWR2ZWN0
b3Igd2hlcmUgd2UgZGlkIG5vdCBzYXZlIGFsbCB0aGUgdmVjdG9yIHJlZ2lzdGVycywgCm9ubHkg
YSBmZXcgb2YgdGhlbQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKTm90ZSB0aGF0IHRoZXJlIGFyZSBzdGlsbCBpbXBvcnRh
bnQgcGVuZGluZyBmaXhlcyB0aGF0IG5lZWQgcmV2aWV3cyBhbmQgCnRlc3RzOgoKLSByYWlkNiAK
KGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNjEwMTAxMjM0LjExMDA2
NjAtMS16aGFuZ2NodW55YW5AaXNjYXMuYWMuY24vVC8jdCkKLSBpbml0aWFsaXphdGlvbiBvZiB2
ZHNvIHN0YXRpYyBkYXRhIAooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
NTA1MjIwNzMzMjcuMjQ2NjY4LTEtd2FuZ2ppbmd3ZWlAaXNjYXMuYWMuY24vKQoKU28gSSBtYXkg
Y29tZSB3aXRoIGFub3RoZXIgUFIgdGhpcyB3ZWVrLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKQWxleGFuZHJlIEdoaXRp
ICgxKToKIMKgwqDCoMKgwqAgTWVyZ2UgcGF0Y2ggImZpeCByaXNjdiBydW50aW1lIGNvbnN0YW50
IHN1cHBvcnQiCgpDaGFybGVzIE1pcmFiaWxlICgxKToKIMKgwqDCoMKgwqAgcmlzY3Y6IGZpeCBy
dW50aW1lIGNvbnN0YW50IHN1cHBvcnQgZm9yIG5vbW11IGtlcm5lbHMKCkZhbmdydWkgU29uZyAo
MSk6CiDCoMKgwqDCoMKgIHJpc2N2OiB2ZHNvOiBFeGNsdWRlIC5yb2RhdGEgZnJvbSB0aGUgUFRf
RFlOQU1JQyBzZWdtZW50CgpIYW4gR2FvICgxKToKIMKgwqDCoMKgwqAgcmlzY3Y6IHZlY3Rvcjog
Rml4IGNvbnRleHQgc2F2ZS9yZXN0b3JlIHdpdGggeHRoZWFkdmVjdG9yCgpYaSBSdW95YW8gKDEp
OgogwqDCoMKgwqDCoCBSSVNDLVY6IHZEU086IENvcnJlY3QgaW5saW5lIGFzc2VtYmx5IGNvbnN0
cmFpbnRzIGluIHRoZSAKZ2V0cmFuZG9tIHN5c2NhbGwgd3JhcHBlcgoKIMKgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmjCoCB8wqAgMiArLQogwqBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmggfMKgIDIgKy0KIMKgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZWN0b3IuaMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArKysrKystLS0tLS0KIMKgYXJjaC9yaXNj
di9rZXJuZWwvdmRzby92ZHNvLmxkcy5TwqDCoMKgwqDCoMKgIHzCoCAyICstCiDCoDQgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
