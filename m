Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B986AC5479B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=op16iofPH2zi8NUo0ForeRz/Q8dSkpTsjQwv4ccL4co=; b=SUDP3vbzYqQNrP
	SIzXosUqQzCQ2Wv64lY347Se3phc4ZGCm1UaAR7JS5lBxd5RW7XHgBZp4xGb9zDvu1hgjpd9lVgOF
	/E8vun6NGVfibuu6q0oyhVXG93PLtUbirZp2rK4msCvdZ5rshFpz1ob0mT4fUAs/HT9S1V/G/yM0K
	TwSxnkk2BF/7mMZqKAnlBbhPCXsmiw1dHQnK6oUe2A9AqN/BgHTS4Q/S7pGZx9nnEnzLIULBiMhdI
	XjpkbJw654CEGOiuAjg657QV/L55QyzzZAzVGqn86PkPI3Y1P+iweU3xVYwOTR9EYNMsbl+07ExiW
	oOjT2xeRQc1kUEf1PR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHhF-0000000BuSU-209K;
	Tue, 20 May 2025 07:47:33 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHfM-0000000BtuW-3heO
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 07:45:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747727114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gmkRO5oonKJByi8/gJOZpGu6mqQKR3Hv79GFdbu8cPnpNRLUfjxAZGGmIQo+j+3C24UzMDnw3TobN+2qkG18TQ5KjmtRTGtkX7OSY/bSUx2jytOvBHoyOWOSJoOCKuJjlv5WNao9hQEP9MPr3PhT4BRggKt3KuGW/TdRxNDpjsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747727114; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MnIccHBLt77o7gktE4VbMWuql1FFClYZl7Z9VMV2mU4=; 
	b=ncjOGjc+qBUf7vsf5NPE6Ao4DgKDglASu/yDV/n6Jnn+O3rzFgOdcD6oYGS83YgJd9r3FqGCaViShVm0tYJF3jdDTLmjqGsVhNV8SgwefsyFbjx+D/t8agbiUIznm+M5NvHEZrrdpCD0D6Ov+xUVA1diBETzfSeQF7eUq88hpLg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747727114;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=MnIccHBLt77o7gktE4VbMWuql1FFClYZl7Z9VMV2mU4=;
	b=dvScxM6IKnD3qXabc2to1Nr5DXS+0ZdfaVAwg1MMbftr1Zw/zIcb6DmdUPJeqy7b
	Oi39OCW/N3VwYwhRYatS6oeI5f3cZKmVr877MC4GSWjYdz74NavkrhpsYRtiMW3RE58
	Jqr+e5hl5xhftycVcNLRY47A0zmH+NN2UuKcOnPA=
Received: by mx.zohomail.com with SMTPS id 1747727112585692.5925758460581;
	Tue, 20 May 2025 00:45:12 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 0/2] riscv: sophgo: add mailbox support for CV18XX
 series SoC
Date: Tue, 20 May 2025 15:44:22 +0800
Message-Id: <20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANYyLGgC/5WPsW6DMBCGXyXyXCPf2WDTKWDo0kZETTNUVYYUO
 8FSEyITIaqId69BXaJO3e473f+d/hvprHe2I4+LG/G2d51rzwHEw4LUzf58tNSZwAQZxkwg0Lo
 HNQz09NkONEGFBixILmoSEhdvD26YbR+7wI3rrq3/nuU9TFuyec/XIbXKEbkqSlZkkOqkfBIAO
 fI40VroEpd3Z1G23UwUrV+rIqq2by9V9RzpakWmJz3+FWNcxCnjUso85TJTWRi1yNj/xHwW/zZ
 Xd817Thm1BpQ5GMUTA8uLO55av/+KrrZuyG4cxx9CHQHJXAEAAA==
X-Change-ID: 20250421-cv18xx-mbox-6282d1e1734c
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yuntao Dai <d1581209858@live.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747727085; l=2931;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=3U9B5pWkLOSWxS23r0T243a2yQfl666xD/tiXonAWTg=;
 b=p+fMjE7vUYGtXuuhgCSDK3E08ivevXbAJnRFEaKb/qikCEA2h7BuVKCPH8tfNe87KqSq8Jqtb
 mgnvaVIcUy+D07gB0vV6liVSbsYglseodx161NLyNUZyRhneNPvv8oL
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_004537_339538_F6AEBEB3 
X-CRM114-Status: GOOD (  13.88  )
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

Sophgo CV18XX series SoC has a mailbox module used to pass messages to
asymmetric processors. It has a total of 8 channels, each channel has a
length of 64bit.

Since the dts of cv18xx series are undergoing rework [1], the mailbox
node is not added in dts. It will be added later with the user (the
remoteproc node) together.

Tested on Milk-V Duo with CV1800B SoC, Milk-V Duo256M with SG2002 SoC
and Milk-V Duo S with SG2000 SoC by the mailbox-test client [2].

link: https://lore.kernel.org/sophgo/174710989159.597941.17259091695735282020.b4-ty@gmail.com/T/#m159cc72c6e4f89bfe14932f38ae93991e8cfa712 [1]
link: https://gist.github.com/pigmoral/70d0d0164dff7f9b95f59df50ef309d8 [2]

---
Changes in v4:
- Move processor ID description to the mbox-cells property in
  dt-bindings.
- Drop the patch of adding mailbox node in dts for now.
- Add missing `__iomem` in the `MBOX_CONTEXT_BASE_INDEX` macro.
- Pass the address of the value read from the mailbox to
  `mbox_chan_received_data()` instead of the mailbox's address.
- Link to v3: https://lore.kernel.org/r/20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech

Changes in v3:
- Update cv18x to CV18XX in commit messages and descriptions.
- Remove the `interrupt-names` property in dt-bindings, dts and driver.
- Move the mailbox node in dts to satisfy the address order.
- Remove `OF` dependency in Kconfig and the driver.
- Add copyright in the driver.
- Reorder the processes in dt-bindings and change the `RECV_CPU` macro
  definition from 2 to 1 in the driver.
- Clean up and improve macro definitions and register access methods in
  the driver.
- Improve the return value handling in the interrupt handler functions.
- Implement the `cv1800_last_tx_done` function.
- Link to v2: https://lore.kernel.org/r/SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM

Changes in v2:
- drop 'recvid' 'sender' in dt-bindings
- fix compatible to 'cv1800-mailbox', and change filenames too
- change #mbox-cell to 2, for <channel tagert_cpu>
- add struct cv1800_mbox_chan_priv and function cv1800_mbox_xlate to extract
  informations in mbox devicetree node of mailbox client
- Link to v1: https://lore.kernel.org/r/SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM

---
Yuntao Dai (2):
      dt-bindings: mailbox: add Sophgo CV18XX series SoC
      mailbox: sophgo: add mailbox driver for CV18XX series SoC

 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   |  60 ++++++
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/cv1800-mailbox.c                   | 220 +++++++++++++++++++++
 4 files changed, 292 insertions(+)
---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250421-cv18xx-mbox-6282d1e1734c

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
