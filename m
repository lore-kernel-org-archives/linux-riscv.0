Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32747C44507
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 03:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QOl8zuEhc6aDVNKVtgcCYbeFFfhQD3Ki72RojWxGN8A=; b=hHcbK+f3EHb4mL
	sgwxDcf3pQel6FnDJbQRsYwnP9WkCdtwAIpVyOI9/tTz5OhKWrB0od88uqVeU3BR2eNQJ0D8GRAlr
	5MAHeHvbdnbvEeKfNpxkQLbPXG9bvTJtEgZu4RYgeMEn8JABfwjAnKDxCrVn9oliON4fkBQsvfEBv
	G4PLiPI+OpHDiPMe5/5+JlDPRJypCJYnSsecGs/+09mkKmS0zS5siLnJ27/Pyvw3cJcGbuj7qelDz
	AoF5xQgZtpi7Cle7AUypAavL9gi5UYibv9T0iqHTO5b+PDZuDEErq7yh3HWfE9+zzBUS2/yimFq2K
	COtanDuPe52b2WA51Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCg2-0000000GKyd-0TvB;
	Thu, 16 Jul 2026 03:22:22 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCfz-0000000GKxd-1RMg
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 03:22:20 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-81e69a2db34so111456957b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 20:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784172138; x=1784776938; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=32tsfE8uTtDxzdpxN/nRKCIyJZygTroSQ6UN8Ha/aFo=;
        b=evkCy09MmhhtdAJWjSjMNnBU+tC7u+Er31/QlNXQOUcvhsOQMHK50j0/0+VPmwgYnu
         tM7vd72p8p1ICj4Fw0GbXvAjfhU4MZLh4A2GlcrUdH6RwPxKkrNP6j4r/gHWarsttmym
         68WIMlLYxY2BxJwwt2/N+Y51mLJBGPBQKXn95TRjxwongtqCfElUIVrhSkMoqF63eaIC
         j9gFVR/z6mu6z469QCpoHrNeMbYZsD/aoWPywK/mRrJcDFGy5YRX4DqjhOJqZtl6TM13
         t0fPGQs6bX9YeMfivvKipZ/BPs+w/tMfM/TeGuYl1hf+QRhUUC8qsn/uIOizIbX3RBbo
         jmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172138; x=1784776938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=32tsfE8uTtDxzdpxN/nRKCIyJZygTroSQ6UN8Ha/aFo=;
        b=sXoMQHfAzVb0UV3y3DqaB4vSRkQ4mhqRqOoHUSYigvpYvRLIMhCK+PpkxvE9XlofXk
         crBYOGTRZKg5OHRpDzGUMQx/XWIDIB0UHF2fhsbSfw5v7yZGF4r/8N69qTO2M/HHREmo
         4oLjwK3kE6e2KHah/58qv104zEUOR99pCqpnkbWkSLeuKhROw3hFs0NniUz1nxDCbJlC
         WELAFwNeyEL7gOhaBWgERWpqT1BZCQuj6aW3AkMNtlE6uwOdtiL4PkwjpDl5yK5O6tSe
         d6w8biasUbTkWX2ihaiQbUHXExgS8mHZQ1fC+cYFpYnF/OQXpHdAoSyiQfMedTPcnHNj
         YYGg==
X-Forwarded-Encrypted: i=1; AHgh+RondMU1aE54VALD/oNjnLP9iFzH22tlqnwbnM63ASK2vO6sshZbmi69iMJZh9EjTpSk7DBWYt+7bSyG2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PeyXmHtBET0+X7RojI156erkPzfUBmU2+KB8m6sTNeL8i++h
	M4t8mtuss0bbLhBfJgdKNoBfvp/pFmoqCycvp0J34W7ha5lClbt3CVeyEU9SrhgYOMc=
X-Gm-Gg: AfdE7cmZ+MvT/sQ7X/bJmued6riIoOidnsE8ij+3UcLlFIo9CSrKuIzAD2wXUWIcoR3
	x0qCidpWdYqh93f9lqaIwpc9KXsDHtVu76EdL1AYTY9MBjMvTKJ8wFKy8aMe5682Y5oViNdGgLI
	A/xPRJT+Q8DYPeRkijUYNvLKLx0pcdxCtNHOMZBWUxbhbK1JF3NaP8jaDLj1iVVgJe4Hst3PUYy
	OPNV3bdYNUDCAQHMbRsK+dDzJoTco9iyMKJ2eXudf3I4qsaEc3xOK05K4m6IQzlaA7cCs0w8C+N
	4UKM1Buh9ehoqIu3ly4jebvXblUrWnDGj20YdoQ4arsbFODp0U2TlUo8Sk/Gb1/kljQ5VUHPHYA
	8JSGYhHMZOPQ7IdZoYsFnFDfuBUp9FuoepeVNfx/1fny9PAZ+qxT5mM1kbrhPT0EftmzlYktldW
	Hzlaorgu+Z0eD/W/kuWrMR3Ti83nG2zk+mEbMbuVtqHXROw67GZSsGs/0upQ==
X-Received: by 2002:a05:690c:22c5:b0:80c:85e5:8751 with SMTP id 00721157ae682-81ecfa9075amr49331957b3.58.1784172137811;
        Wed, 15 Jul 2026 20:22:17 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:56e1:f9cd:8869:2218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm185039127b3.14.2026.07.15.20.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:22:17 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH 0/2] Enable WiFi on Spacemit K3 Pico ITX
Date: Wed, 15 Jul 2026 22:21:53 -0500
Message-Id: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFJOWGoC/y2OQQ6CMBBFr0K6dkhbxAoxxnsYFqWOMGoBW0ATw
 t0t4G5e8v/7MzGPjtCzPJqYw5E8tU0AsYuYqXVTIdAtMJNcHrgSKbj+c8zAd9qgpR6eCehEmUw
 pUSYmYaHXObzTd3Vei439UD7Q9Ivon3D4HsJYv8WYRe/1OpZHp22LZ3zPuVRxlh7DAQKoaU1N2
 upLZTW9YtPa86IrtUcIEP7Jo1HFEpwRrJjnH09nhv3eAAAA
X-Change-ID: 20260715-rtw89-spacemit-k3-a37c9771b3c3
To: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Ping-Ke Shih <pkshih@realtek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-wireless@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_202219_414629_1F44B8F2 
X-CRM114-Status: GOOD (  17.47  )
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
Driver[1], K3 PCIe Phy[2] and K3 PCIe DTS[3].I have marked only [1] as
a depedency in b4 because this series doesn't depend on [2] or [3] to be
applied cleanly.

Inochi, Patch 1 could be potentially be merged in with your series [1],
any thougts on this?

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
Anirudh Srinivasan (2):
      PCI: Move Spacemit vendor and device ID to linux/pci_Ids.h
      wifi: rtw89: pci: enable 36-bit DMA on spacemit K3

 drivers/net/wireless/realtek/rtw89/pci.c      | 4 ++++
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 4 ----
 include/linux/pci_ids.h                       | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260715-rtw89-spacemit-k3-a37c9771b3c3
prerequisite-message-id: <20260709040027.958400-1-inochiama@gmail.com>
prerequisite-patch-id: ab02c35a752a1e8f0fff9bc06ebcf8961afef933
prerequisite-patch-id: e7cececa9950600cfeee3dc6d73d6c3a7cc16f32
prerequisite-patch-id: 49ba2fa5aa2d2069b8d857bbda6cc4813bfc015f
prerequisite-patch-id: f33c229b37442babb1289af29a33fd2a222304f0
prerequisite-patch-id: c91a780415fe64f11fe921761d213634d042fac7
prerequisite-patch-id: b2bbf0fe6a7d90be354bb266d311982ead5a0e6d

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
