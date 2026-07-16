Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BEEC44507
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 03:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3d6hO4Ws25MMxqn+2qFT9v+Lp4ab++3+LupCQ7gbTQ=; b=wdEJnIxsmJNWro
	90l1FzRUWgdoYzIwumVPhm06h7SC3YQ80Z2t2RUE0h+CUnreNFKbyBIsSJlWADgZ3MfnIhqDluXUw
	o0i36W3uceo14u4ADrJaY0N1SMLv7sCxHD7hWSKQ7waWccZBYO9VtaEmcXwTK19Bnyd4d9A0g6SR6
	K0Xy60fHbZhJz1L34F4OwBgfJOrOc2EhvuEFuKqhbuLgFQzO6+5DF2puuWVlSR+w0APUCYuFVPWLn
	Uh6x2qfsqsNfZaHGr2a4eawp8mOEQ/5WPMCzJQ2FWeP+Fh4AwZtgK0lYJKKRE3DnZ1ySo/yfv46IN
	IEHBzTB1yP2qlVcWSqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCg3-0000000GKys-1LNE;
	Thu, 16 Jul 2026 03:22:23 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCg0-0000000GKyB-2Mux
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 03:22:22 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8111c0c7561so85145817b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784172140; x=1784776940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48efBL+/zgjdRX5eeYvPyEwynq80yeCCfHgWW6gkRZI=;
        b=aemN0EHm0x4BznVMhCTmFMyQ5ewtxo7XyyCnzd1l+xXUS44/ZGoso1i0oHub1JOE/X
         SkA9hWUCtuWXN0qWQoDk3WNsWxfm8vMVjsHLcrcevYfwC92g8PrZ/Vw/sW4YAzSfoNje
         rzL2/sIRK6PzHi0udi5PcrvB+XPKQmfFnhCi9LwYU+SLXNxn+qgg0RtG19P8UWydiSN3
         XLM8/CE8kHC7XYy11bueOKsCWMldtXJWuh9DFlcZErLVhixOBv+44tCjiOq/lc/lkkgT
         WxRs3uzMG1rBZsCdSRpnWyftW7vFshH3FSTlUYx0jUP9mwZk1oYpr68W7e0ch+b6DiI5
         JzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172140; x=1784776940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48efBL+/zgjdRX5eeYvPyEwynq80yeCCfHgWW6gkRZI=;
        b=S4LGfzuVclmzLy1nOwpj68yc36LwEeBrYK5DEbTDdpRrjSbWwPv3reiUdm8rJO2AeE
         TI7xuZ8adr5cmMmVvs8gCfr4kRQonEp8Uw3w7V/ILBztGmuSnMuAWG46Ugp0cIycktFA
         +4hZaLqZ8VdpDZmhId16JUiR2a7WzyIjMLQPvGy+wdkalPzBZULb1mjH92dupjttFspL
         JYEU3T3DKaRXvMnjrVBvp6/Owpzr+1sve2GexzFYk2bzdz1M0j8E7HAU3V1JPjqT47LE
         Lc47pdErwN6acRhJ4fMY5d/PFz+4qYFPcFn10LGw0wlGPB5ANI0ht7zuvSTXnxOw5mlB
         Nl1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/DiSWOaiLxGwA8+suh8BkU/LZSyeE8lDPr/h7P9fPcZ0maRRk1NJUcNozToBZ6wvqf/r4Mxc5uYAXCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV3MiqOAz/1ISvpmUiQQSIhlmwS4b684GQdKwAsV/7a0qu5tpU
	3guCsEmvgE/UnfWUqDbN0VcPnWL0huAgObZ6dpxcsxn/xgEhE61/bjh62k4RkpNwlGI=
X-Gm-Gg: AfdE7cmhCr63XX09Tm372OHksScdB0ymf0bAhbuU5nIwtU9x6zE7Nf4aVk7GbnVFT9X
	6QwyNyey6Z5oaTEQGLUrWQR398dFiY95t7BhDDMkLbwDQNzX9y4exMqII9eHxaS53zEfgQKLBqh
	WpcN0rIDNoacWu+ZDrMZUNoUZf/HQR3Q8qKi6yslVCdvuqAoEHJLaO7oGoUS5wZB4kfRBbl8qiS
	piDyLUVaI+xLY7zwIbGHwq99mbLuYEEKlbEy2EEBP7sA+ArdtJ7zng4NusZA9Ych5zlE3CR0SNM
	SyUHxO3gD1GUggaj9MC45jkpD34kE3zIpPUaZ+Yz3NuP9XYU4FT88BzSP+YVUt0tJ75wHjwYY7S
	PP7Vak1+0WifzznLasq0gI4yIAdHM4lxQy9lNN4/gcD++fTrnqJblnC2IzSa1UN+qR+7KoNJeRC
	AAFd8urG4fLJ65nucPGX7Cac8ko/ARobUMcEd3oJH3kMGUJjz/1efTxaBlsw==
X-Received: by 2002:a05:690c:9313:b0:81e:d300:f427 with SMTP id 00721157ae682-81ed300f4f5mr29106957b3.5.1784172139650;
        Wed, 15 Jul 2026 20:22:19 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:56e1:f9cd:8869:2218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm185039127b3.14.2026.07.15.20.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:22:19 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 15 Jul 2026 22:21:55 -0500
Subject: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
MIME-Version: 1.0
Message-Id: <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
In-Reply-To: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260715_202220_612790_44E371F9 
X-CRM114-Status: UNSURE (   9.51  )
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
root port, but the SoC doesn't have any 32 DMA addreseses which the
rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
has when this particular root port is detected so that the driver can
probe on this SoC.

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
