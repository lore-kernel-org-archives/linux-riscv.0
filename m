Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1113C44514
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 23:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=stTviyo7eGlLdMVP8GlDJFzuE9KhtNE4zqr0KXta2gg=; b=kLeqd/GtHw7CgH
	OrC1FQ/H3KmBDP62Uinan8tDNNopoGLqWgO7HT1LlQVuxFgeptFYOeQleLUU2EpWA/yT89/T7tRIO
	uTxt4mVuW8CgEcPhPMPHUuHj18xPb7DdxEQFFAERsJnGWnkSMdj6W7RVrNe4UypAVZaSRDeF9NXjW
	3ScOIBjGAUEVY9jyJsWpZW6LF48tgTrqCarHBUjO1bbwIU5KyBVY9TGDZOBl0nM2j+xMWyBnU2BL+
	UTf/ylv50K2g1SAmNbaUx7z81BSc5OFw26FLoZP9MWIGtVifTzxuL7F+k0jbpQ3erhHfNqUVHlwwK
	UUvSEa1RNLyQURv134mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkV96-00000000m5s-3rdA;
	Thu, 16 Jul 2026 23:05:36 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkV93-00000000m4u-2bKd
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 23:05:35 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6626b5ace23so1203474d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784243132; x=1784847932; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oK6R8pSf4q5klrNu6IUKUSP5IXczJYV+oguJ7eE6+Dk=;
        b=J9jIr0lcbMbXBku5hfHAjOe9kMyfi1o5sSOmB44DqQ9Unr+u5b2btMkty7q4VrHaTA
         h3+J5ODSiiYhMoaXbOONHhMjZCGkK0ovO0YIV6N+REf6DAWyjYdiEa1czXToLZfIIWkH
         y0tjmuPDRXybM7ixBJzGzuAeGmdazUXlVVTeH05Q6H6enDQiAwKsrCa95pZY+pJp6D+F
         bSWi8vmbBn7Ef60rUU9KVIY/s8y5Cy86lFBwwArFDdTF4/NLIfqt128KaKbVPbhRKl9L
         iZi5d11Cc1erOBiV/GX5kYN4SSDPFoL/G5ZAA5oequlaRQqJdnwWwVown0G+vHmnGTrt
         ZHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243132; x=1784847932;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oK6R8pSf4q5klrNu6IUKUSP5IXczJYV+oguJ7eE6+Dk=;
        b=qidXXplDcEa0c2pvIhxDPZjVCFSg7P7/EhYTyzwQRSAKx56PESavRlsBeeu2dmnxzi
         dDotLsKwMZVfHa/PW69Zi4MOv2qPUEOr+sK+i8oRtyZL0RchgLcfkcpkXuHH1jdGd+8w
         G6cdApd3GxU8wrts3A37ZWEkg8m1daepqo+S0UDqp6TfdtbvMkPwKYLTBF0om20rVHbb
         R6s1lZfIfDaMNvMfJhbf+9X8o0NIX5wq7+ufOvbIWzJBhratGDRGeKl6gQ8lCvz0uNJk
         y3iPhK3XDrYsONiq8ZqNNhotEtVH0RNNW7U8dH0jGQo8CgHkaRv/IDbi3CRRYUSAxRjm
         oaXw==
X-Forwarded-Encrypted: i=1; AHgh+RoKHE0sleZB5Z66N6pIglFr5xHN/c+dwBJkVSwPrxY6jjQIgpkcg5uJFp5kK9M1wzpZjizswEyn6k7NzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzddJu8cLjOZkwCvSzgjr6DCtu9R5zY7jlV2ageskFv/kfJBtK0
	bDQjBVTUWkFc1fQIm92aagulMurFl23W5ShBSAL6Ce1pUCeFPGAbIIMWfMlf1SvGSnAcV3XO89J
	TvTDC6Bs=
X-Gm-Gg: AfdE7cn+RZujj0hm+ZFZ1KLS37gBPMUuxQizXFiRjfkFCPeboj35wQ/LZ4BB/thg4LT
	i8pOhCwpzQrudEzyeiAiSk1hS7Fd5dslKl70ayTwWbmBdNKZjo7TreQ1gRx1XlywEhrL8H/ZjY5
	WysMeSAm8Td6q3u71aOLoTpQLROs/SvS3DcHLthOpVFGem/s96WkdTgA4lxzMfvs8mq9qfx3q6D
	SXihxXetujqG7AB1ELkbRJIZeyDtc1fj6k5o0Y5BQ7dw1hDy/W6n31InDKwkZn4FzWZUnsw0TyZ
	qqO5yRnbHMc1ln57o6VYbYbv4UwNvFy84sjJ0ADUAcvIQi8f704q36uwGE0ryEUHCeXZCxv+sdX
	JmV6wMUkq4C557jxwPztzTQMj+bxyVfeuqTAEQKnn01v+HhxttNBFyBW2hcvBmtz8ZGhhxW1zGT
	vmE7XKYQYAzJbau8HA2eIMCEjlD82ExatGiJgHhb7Tkf2WJDa5L/VtYNYVJQ==
X-Received: by 2002:a05:690c:289:b0:7dc:1c56:2901 with SMTP id 00721157ae682-81ee27da32dmr27774457b3.1.1784243132428;
        Thu, 16 Jul 2026 16:05:32 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:40df:d071:3a06:1c14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be90499sm207006837b3.5.2026.07.16.16.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:05:32 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v2 0/2] Enable WiFi on Spacemit K3 Pico ITX
Date: Thu, 16 Jul 2026 18:05:09 -0500
Message-Id: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKVjWWoC/32OQQ6CMBBFr0K6dkhLAxVX3sOwoHWUamyxU1BDu
 LsFTdy5fJP/35+JEQaLxHbZxAKOlqx3CYpNxkzXujOCPSZmBS8qrkQJIT62NVDfGrzZCFcJrVS
 mVkpoaSRLvT7gyT5X56H5MA36giYuom8i4H1IY/EX6yxFH17rJ6NYrv9GRwEcsFRKm0oqXum9J
 8ojukUS0MXc+Btr5nl+Az91dJ7jAAAA
X-Change-ID: 20260715-rtw89-spacemit-k3-a37c9771b3c3
To: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Ping-Ke Shih <pkshih@realtek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-wireless@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_160533_697093_4B3E1F39 
X-CRM114-Status: GOOD (  18.55  )
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

The Spacemit K3 Pico ITX has a RTL8852BE Wifi card attached via PCIe.
The probe for the rtw89 driver currently fails because driver tries to
allocate a kernel page with GFP_DMA32, and this board has memory only
above the 32 bit range. The rtw89 driver has the ability to use 36 bit
DMA addresses, but this is only enabled for certain PCIe bridge/rootport
that have been validated to work on. Enable this ability for the PCIe
root port. A similar patch seems to exist in the vendor kernel tree.

To test this, you'll need the 3 patch series adding the K3 PCIe RC
Driver[1], K3 PCIe Phy[2] and K3 PCIe DTS[3].

I've dropped the dependency on [1] from v1 and added the PCI IDs to
pci_ids.h here directly. Inochi's PCIe RC series will now use the PCI
IDs added by this series.

One question I had was about whether the IOMMU on the K3 could be used
to do DMA mappings and allow the wifi card to work with a 32 bit virtual
address. The K3's IOMMU isn't supported currently in the kernel DT. It
seems to not be enabled in the vendor kernel too. Even if the IOMMU was
enabled, I'm not sure if it would help with this exact problem. The fix
proposed in this patch works to solve this problem, so I've sent it to
the list.

[1] https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/
[2] https://lore.kernel.org/spacemit/20260703021024.495433-1-inochiama@gmail.com/
[3] https://lore.kernel.org/spacemit/20260709040415.977784-1-inochiama@gmail.com/ 

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
Changes in v2:
- Updated Patch 1's commit with reason for where the PCI IDs will be used
- Dropped the hard dependency on Inochi's PCIe RC series and add the PCI ids in this patch directly 
- Added Acked by from Bjorn and Ping-Ke, Tested by from Aurelien
- Link to v1: https://patch.msgid.link/20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com

---
Anirudh Srinivasan (2):
      PCI: Move Spacemit vendor and device IDs to linux/pci_ids.h
      wifi: rtw89: pci: enable 36-bit DMA on spacemit K3

 drivers/net/wireless/realtek/rtw89/pci.c      | 4 ++++
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 3 ---
 include/linux/pci_ids.h                       | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260715-rtw89-spacemit-k3-a37c9771b3c3

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
