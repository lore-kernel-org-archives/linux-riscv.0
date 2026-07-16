Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E8DC44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uukP9BhgPE/jm5WZ3JP1jN8H51BgRWNLlJglHNk5kwo=; b=4e5GqcqKrcebv/
	ALSOfUpV3v48O6/v6035aS6Td2KxB2dnDENmhvVfHjqcckIcFcAYrgICfVx6ass0GOQIOb9bGSGtA
	p6PmloJpE4/nJzLaPKd1tPcyqS0rbo0Mwdw9EXh0ZbgkFWkOLM93595TY/JoyIEjVqQPpiaOcCIJs
	lLICn8eRqhinorQWAiLXQP25daBVyiKyQ7cbD3XWr5i7YSTQrhBTfq5SqyiaVvyDdgTmELBtvqS6C
	5mTHzA4I1Ni0Hw0RDv9lCNCkHZBiO9q7UVbFIqCV/dFrhN9Qy9pcs18BtSaiTTFxbSPdVuxPfKFqw
	w04xTGnneWswe4uyZMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkV9B-00000000m6u-0URC;
	Thu, 16 Jul 2026 23:05:41 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkV95-00000000m5S-2tkH
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 23:05:36 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81ed2a06b9eso21715167b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784243134; x=1784847934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bk3USZv12WGxErumeiIAVcQcqRoeJeqlNLEHc8GMv1c=;
        b=JWndZFVaI3TVbZE1EQpvh+sNloYNnQBCfEcbxDEB9UH7YqOQrwXTW65aHAzNdBueJI
         KTDZbmvWYeKcCtqM3GYsFilzBE7NicSr0bZpNCv7TI1by43IUMCFZYgrekCdIpxHV49e
         CcHDt4Nhu3ALHTWF8MVXMs5jT6XDpf6fmgpkpd/QLgEvn4E6/dvVMmAuahPotUrPSPq1
         b6OXsByYN43ehdpPeMWnjfMnJFqFUa5GfQ99S4uv7TAZs2UOygc1q5MxdQbkqiLsM+8b
         M7dLAP71wXqFTSF9ZzZgjjwtv931FX7nHjRqVosKGAQRftU9f6g9/ad/IVE7WhCzFCgB
         wobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243134; x=1784847934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bk3USZv12WGxErumeiIAVcQcqRoeJeqlNLEHc8GMv1c=;
        b=XzjHKft9+paKsVHqMNMENEKJePmeVT9ZpM0XI2HcpGCbJKOCivEz9JOeQ/i+rvy/8s
         DTQTgLcfmUyCZBJTXzUS3MeFbZU42bJl8JERrhLWFLoXo6y+Cdgb/8n8t1q1tNOTcdhO
         hVdU+ECZcbWVNfY5SOULrO08LY/z0wdy/Xqdihu5HbAhPL4ZImZyWeR8jZoijWErrGYg
         mohQKaXpE82HiABpJkyfHGRt397y6zVGCsTnuC77dc/H+YdbleM7dd+/8C+eLqbTQGfj
         bb50lONZ8eUMUOFllIIulzRrpV/VTcPoJyrdHYotTDrR3CjGYMg93MkeQtEmpRu25fFD
         1D2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoK+EC9aLeHglz28U5UHoOXANQLYgdHF8dGWrnISZzS/UM/0RggIzBi3kOc8jQYgvjcd65nHw3/+pgXKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo5QZQuXn6O3s09YHKNtoBDXe+nrEiSMSYgw7SofLFt2AOo2pf
	xG9ZfAh9a3W3sR3i6WFW0lqJ9ugDKTYUPK8XNzZtK2Qv5ILrc2b2S/wMx36Vi/n9ktlpwhsMeYI
	VeXsPIz0=
X-Gm-Gg: AfdE7clMTFJ/PXRULIK4phJRzsPyAQbLjEUI0IdyIbJgQrKR9nkgiR5Nv0d4QD1pSS1
	6mL4UVoro3nZxWDFccmZ3O8FTS1llTZNGLRLpPY5qL8K0vdr0PyhYybS3D29YKVPebMR3+GFE7z
	i/5V9jtiE1m8Si+EhOLjNrJ1A1hSF9kp8VFPgTUh1/WeBkINJFEukYFHMQBH2FupQXQ2+DKOKtZ
	tXO3UirpMGZqZNLSHYvNcCuEkhNmQYuFatDoqzCfHCZB/WJDZHuLxTCYsl8TRt5DDdOdtaT4w8c
	ARRggddBRJX/rns/2NXVJqAPhulXmTckc5XNqAiNxNrdyPe+hZMlkqqSVQXRE7f7LwHrYJEYK3t
	M+rUueoYpDbicY/mwQhFnwf+6a9VXM/ZSZmFJdWsY3JLXYN0V69t/k6+naw2OdOy1Oc2vBpx3+c
	lRFKb+V6ZFK77jIvdQ18Vv/oNqCkNNXfSScUSA8tlb/S0sx6+uS7Q+HNXKqg==
X-Received: by 2002:a05:690c:6101:b0:81d:a1e5:a498 with SMTP id 00721157ae682-81eedf06896mr7708727b3.62.1784243134324;
        Thu, 16 Jul 2026 16:05:34 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:40df:d071:3a06:1c14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be90499sm207006837b3.5.2026.07.16.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:05:34 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 16 Jul 2026 18:05:11 -0500
Subject: [PATCH v2 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
MIME-Version: 1.0
Message-Id: <20260716-rtw89-spacemit-k3-v2-2-392b577ebf75@oss.tenstorrent.com>
References: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
In-Reply-To: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260716_160535_743704_E19097C4 
X-CRM114-Status: UNSURE (   9.81  )
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

The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
root port, but the SoC doesn't have any 32 bit DMA addreseses which the
rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
has when this particular root port is detected so that the driver can
probe on this SoC.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 102bae4881805..c5b82fc46d063 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -3326,6 +3326,10 @@ static bool rtw89_pci_is_dac_compatible_bridge(struct rtw89_dev *rtwdev)
 		if (bridge->device == 0x2806)
 			return true;
 		break;
+	case PCI_VENDOR_ID_SPACEMIT:
+		if (bridge->device == PCI_DEVICE_ID_SPACEMIT_K3)
+			return true;
+		break;
 	}
 
 	return false;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
