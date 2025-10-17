Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBBFCCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 05:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RKPUGKMmdUStolPta3CGlWzzsKhHUmDxkNsXNUKBkKE=; b=IddGD2OK8sW+tS
	zwWMDJjyVl3Sf8AQNWV3EWuVhug4R/FoXVKUIPuKixk8AqaxzX8NEZcaWBqLHJIoBzv1UDPd5HuFs
	eB1rqHqB9LU1BME+IrovqMV51FjOZI3+jfRCG/aSh93JXy/ffnb+eK/i5Gz6/uNgghGV1JbfIn9KG
	ojbCX1b9Flm3VZX0tIp8zKlrFuCegWsi++2RM4M03TVjLa/8ztgl+HH6n3KcqJQrpiNmW+xdButcL
	XpmsfM17qaZD4HKIlCPE7zQFLPTJkP2M4byfbxZoqB7L6H99Cr2gQx0PZxoQvf9319kQuOFjTv5V4
	uv9/5vNkEWMmzfl6Hymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dQ0-00000006fQO-3p3l;
	Fri, 17 Oct 2025 05:54:24 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dPx-00000006fKX-3SCk
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 05:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760680393;
	bh=9Llik9TC8xsVJr4sY/DZm85aDCV1XohD3eSIWPKun1k=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=yTWIuWiJcb+wkY7UiWKL2efD6vQ3DYUMLtyu/ux2ER2SSWThDdeqarm+X0GYF/M8G
	 YKVaMTu9bWrMrc0lxVyMMSQabNOGlcNVKRcILxPIarM/U4MT85ayXLg7YqdfwfoVLa
	 a7OdZeBf56I4M0fyCspivSyMl7bvCuQgFKki72KE=
X-QQ-mid: esmtpgz11t1760680390t7159569f
X-QQ-Originating-IP: 7lBdRt8TZM+XnRQa4An81zQDgcIZsKi2YskrOXxwnMc=
Received: from = ( [14.123.253.52])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 13:53:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 608102386777863130
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] riscv: dts: spacemit: add initial support for
 MusePi Pro
Date: Fri, 17 Oct 2025 13:52:24 +0800
Message-Id: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJjZ8WgC/22NQQ6CMBBFr0K6dkhbChFX3sOwgDLIRKFNpxAM4
 e5W1i7fS/77u2AMhCxu2S4CrsTk5gTFJRN2bOcnAvWJhZa6lLW+wkvBtDB6Ah8c9JGhNFWvpTV
 Gt51IOx9woO1sPprEI3F04XNerPpnz5qSSv6prRokVKg6U6uhGgq8v2letpx9a3GimFs3ieY4j
 i+38EwjuwAAAA==
X-Change-ID: 20250928-k1-musepi-pro-dts-546d20c442ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760680388; l=997;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=ZTb0R1SYkjTNuWQ9FV7qBLfNn8delC/2yfO9jejOBe8=;
 b=Ein+MMLXwWUJxWUumo5ZKfwDfJeKWx7mJ0PcHtbcJ7hXWgv8rrLmEdaMGnmyVx76bHLIW9+eI
 ONJ6wboGNmEACoJNzWv1PkiKc4z1ZaIis74QKP8l63ZtL+Ka5f926uP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nmigys7utaQUxx03+UMUJN8fweWq3afgn8zzPe6Ao5c6gQvn+cmWQ6MQ
	5CQDXz/3cOwlxzoWIrt4b7gRtTUAQMCj39KPioqpicbqh4Juow/6PnHaUfvJ7YxhlHRz4ij
	mVfB24PQSMSlQ1JHqKGrSxjIyqJijj9A59rShsjuQ7BS/JaiAKnVpPmTJnxK6dcAMdq2qZj
	FNejZQuwMUd4W4Z4uioo8VNLACNixQ5ILEXTd6ZFJoajS6iRM3poEOYa7nNBZKwqBZb6DdI
	29iWGDw3phstON/ebmJm9RKA7XHOwzHtJo/vfqpHRP4675TO3MMepWGScrBXORDtM6lKVwP
	Wgfnje3DqplMeq7IReu2MeSAyOFJ4CuryjmIrNw7b1T/+9jhFUZBT+KCUO5fTPEZaZGftUp
	C1OaYdRfwvD7ZwfkRWkiA1emdqh4Py1O6tI6xriUAyIJbeq295i1MxwhcVvFkrVAV+H1Voj
	RUG/nEIKiWfq5irKxn5GnBPSHSxacNDW+bUPX781yU1cV5gXGfMpJTKWFUmHOwBV2Iahitt
	FMxn/KYkUBHEByjEO5n75zI6D/r75CWhnfFVOR3VJkzhoL8+StBUhftdTOY4zdt2kPhoRd6
	tcE52FAavyTUB30frIufkDgprwP5JItmKRKCfu8HOV8GDOYIpwnQD2Kgn5ZgLr6b6qr+Snp
	v/2JVmurnWDtuB674/RXGE9MhSRW47ekZioQbBBGlZjk7Nn6WdeSFzP+uGouBZVAQ748NTL
	0b7Qb/6IP0U0zRfhqkBnztjw/JurdAOOdS5tTvWz7Nx1t1/J3HJRUvMA1x/hYIws5p5kqrf
	lL1/2ywowXW2BsUZYdL0N3XUNyCpl6OtLm5U++EhWFKygZGnadzWqtCLDdaQj2zODYj1S3v
	yFSlEKJm2tMQQBQTE6LfoP6iPtVT7wOYVapVT3Qbuwa+DYpLEtW1v89NZwBt+XkZvQWAlSA
	4YrrII+BKJgktdwe8NpEcfWneyM3rAaXl8O2oAga2O0xeO1GgTNzHOSs9Vi5dSbbIHd+eBK
	HI6G6jbAQX/cv6s6x0ru6laooiR+SuSS7ZMAWufVtuXSzSuU9rdtm3Jrpi62GW8lGyaIs1P
	Gu791JkpCMWZg8iHnyu2E3V3UtVuEZaZ2gRs+KQu8mdj6HEr1EeCnYQ6ghUxN4h9g==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_225422_375960_754E7AF5 
X-CRM114-Status: UNSURE (   5.38  )
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
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: add MusePi Pro board
      riscv: dts: spacemit: add MusePi Pro board device tree

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     | 78 ++++++++++++++++++++++
 3 files changed, 80 insertions(+)
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
