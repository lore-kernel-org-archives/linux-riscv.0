Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C58CCD183
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 01:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92IVDQa+abpDkz9AaJEkZcsBGLV1lya2KmZiIP7cKPM=; b=N4rKQ0M5iGvdnX
	Fo0WK2t47R5qKryLyoaL90mBo846Bp3EI3zlua1rcSK93P0AhMnrD2dI2guS4wl/gFa9Pn1XoP308
	eSPdCrw/EeQ60KAGf47DpLCEuGBdJ8rGZFOA5alHkNobfOKopgGu5UOEv7lYR0WmBDzf/NHUG6A6R
	02R7dnyEHxB90/J1IPP4Jrjq0HJc2jymwz9dFVoU56U4Q56/apesUBV1TVx25LH/k9vprygNwwY2w
	eBHWcC2xKxrf3PYYMKu8MFSpD6xLl6TLdHMDzx7nU1Ys1/8R7WMAI6AOHxCfUSEfdNiJ6cfaNn8yV
	xmMfc624eOQEZmKu9mgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72OE-00000007Svv-1P6S;
	Fri, 10 Oct 2025 01:57:50 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72OA-00000007Soy-3g9J
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 01:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061411;
	bh=ZVmyHGZ5/a4VGE9Sqr8Y7J7QfKmQk/JgxVkPEgUWgqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=JsEPoRGMPByAkhTGThlxR2GDJXp8kw7oPeRCN8kq+OWzLStjiREF4gNnhT+T3BRZE
	 U5MEQqV94O9U54kx79a+kSUz5weHqB9l+J8HFirdF6zwDQ5UG7+AqOc0P2+HS3WOIZ
	 ShBGlf0Y7K3VZ56qPjF+2tPj/VzXMF1GuPxn5jEc=
X-QQ-mid: esmtpgz12t1760061401t772b4fb9
X-QQ-Originating-IP: 9yUPyFi0REviDgtQdUjqnqSZf3F9sx1EUu7TcumO3Ng=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9320719454535500342
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/5] riscv: dts: spacemit: add initial support for
 MusePi Pro
Date: Fri, 10 Oct 2025 09:56:29 +0800
Message-Id: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM1n6GgC/x3MwQpAQBCA4VfRnE2taQmvIgfsYBK2HaTk3W2O3
 +H/H1AOwgp18kDgS1T2LYLSBIa52yZGcdFAhnJTUYlLhuup7AV92NEdirktHJnBWup6iJ0PPMr
 9P5v2fT/a0LQ8YwAAAA==
X-Change-ID: 20250928-k1-musepi-pro-dts-546d20c442ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=1172;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=8JRImo+QHxwUhWzjvIREcd7a0LJS2+I0PAcbb7327jE=;
 b=llDOybGRdR+Use70f2OI4PX2IRWKaiO6FREv3lo9kGDdwztbKKu9xmNZ46V5jVJsbXlK4dy0O
 Qry8+7u1VBLCgRFK29ldBkXXa2U3rUCODamaadHEvObqkorp3bT2Tfq
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ORj2Owp+dtBUqMSpaMXdrCjAfkP/T/SnRuwNy/T+6qPdpFZAy2BB6hlV
	wPdWlz/sOGeuMXqYYgo9oN7CeLOvpDWA1kAhoTFCUb50JF7V+zgsu4eeVMQGHMs6t5I0I1U
	EEkhH+/4jFsZOdAT1HM77FEwolJatrq0NlCjXd7/S5FHm3UaOLq3VIDoIY++TvnS6x7BWoI
	ekgZhHVKOgzYsDXpb38UbOCo7fjwTS0Qr0kbX0x6RAWo9ZLQIb7XnC0HmB7WOSuRc09ZiD3
	ztK7rCp1kOiOQmXK5eETPF+6rKPlCEQv7zi4l02f7+37I6kcBXf1LmaE5t9rLneU8SWt9sB
	9pDEU0EpTbkbEvbSEl2u2ZhpUtm22xVLAKuAuawfNEu1/+v3Uo9jnncS8BojTDXjrupnrH5
	cDgfWUnS7BwMIJo+96dThp06Rp4rWCS99rhWJSS+P9BakhwBBs7SG1lXuIgMGS6i1MCxSKJ
	FOgJLiy/NcVjvThA4HIcOWV9CM2eNW2CZ3JAXFQltywIg+c53sl80p8vQqQPdbIZ9uI9Lvv
	c3UrYf1Ne+Pr8AUxxuWzA9AqcIeU/KDgxTXyJ2ZYa1EZKfDdnD7aKR9MVRA2ru0OpIpo7Fy
	sSxXwkxAKx73TPX8olknpQlAKr0XGKHeg9E+MBqBrIZajQV0wEckzRD94/8Ft7Ht6tnRerc
	pqmGtEbKFbcNSczXHMJHHDWlAbheEOGSGN96DKjMHbAgGBHf06moNKETKogYoZSgR2NtE/K
	EfbSlMTitZKWOSlIIlRCOROodw5k4pEDJJHL0mwxHp9Ec3QrZa1QsH9DDFgoSbPosqjMd+K
	H4U2CjWTnxLncNweshFXp7ZulY9BIuDzY4POcQ423GGDSf8LltnOffm4CMpPNUJEq7InKTc
	xZLNBdBQaYLVhDJDy35+vWuK3WbLUuxR2gXtKBonQnniC2XKWkFnGzWE4c409UnxZLW3YIL
	2Zfsdn5OptpoPFLNd/WGXP62pIjK0wh2yCjgy2mg+pQvi421irDh0DHP8hnRi1wKhRE6kgh
	MTDP8iBU3Kbu7MhacZnZ1BAaxuk8yhKBl5QhAG6t1TD5CqUzlyeNE1xywHeIeJXzw2V6P87
	1JSyDNK9WOAmU6Bi78v2ewPtiQZKisv6iQ2uK+amDdxnGR/0Ytne9CO4J8zQrjrBP5pF4Vo
	mCCi
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_185747_281241_4E6AFEC4 
X-CRM114-Status: UNSURE (   5.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset adds initial device tree support for the MusePi Pro board.

Muse Pi Pro [1] is a single-board computer integrating a high-performance
RISC-V 8-core processor, storage, I/O and expansion capabilities into
a credit card-sized 1.8-inch board.

Link:
https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
[1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (5):
      dt-bindings: riscv: spacemit: add MusePi Pro board
      riscv: dts: spacemit: add MusePi Pro board device tree
      riscv: dts: spacemit: enable PDMA on MusePi Pro
      riscv: dts: spacemit: enable eMMC on MusePi Pro
      riscv: dts: spacemit: add Ethernet support for MusePi Pro

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     | 77 ++++++++++++++++++++++
 3 files changed, 79 insertions(+)
---
base-commit: 93e3e1281b369a386a4942bb50111def06902e1f
change-id: 20250928-k1-musepi-pro-dts-546d20c442ab

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
