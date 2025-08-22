Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD828CA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXyGRpNXx6DB1qEschh9eJOsQLkCC9M3Th7R+aT4dqQ=; b=mGoJXmfqBHpwEu
	7E5rTGFawLb5Qv4JvFzIB1o5yrhr0fbVBlChRwNCH+aaADzPxDK7KhjnEAuxHrFT5o+GBlq8GsvR5
	66c2bDVIBARxMFhTxCoyrnt+aiczSk9JFT/fKP2C274EACdmIGnkpXa9kHWfujlAlYpEDHvJGod2D
	07JZZIDbri2McVeHxjwxmdMruIxkNakN079LQyFrGpXirWPTz4Da2/MYrpETrd4HKDJDQtExiqQ+m
	pzCtpRvYdjPP2u7N5FvIDu0P5Clye4OvguVKvTN4sb/3fw9CXuBrAopeTFTfsuEeQvh+EhlEEGdYZ
	LKRNWuPEg8qD4tmn9ujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqy-00000002IIU-2Czv;
	Fri, 22 Aug 2025 11:22:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI7V-00000001LNB-3vZa
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:07:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2445827be70so17287185ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832033; x=1756436833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quTPMYj7s5QwSm0woBLSQz7z4VVYjT+IYu8GwKKHe24=;
        b=REmQf6SRj8ezA0zgaal4o5yppdyReBgEmOY6UhyWAUyOiqwzH6fj0dBcZ+ZkUquzeR
         ERMbnNBbtF6pTCvxXq8XRAvOIOzml0kRn4V93miX960izKbsaXwd0fjGbGw00fzxNYST
         nRPDlL/5GfPpzpXllQt8Op8CsOMEr2c4QK/H7zUC8Sm3ccE87PpHixTgxExWD/B+ZHGw
         W6UD9ASlmrQ3TCTh8d9j2q8+CC72dLmd4e4zJLvmBCzPhwdLycomjAfg1sc4gAMFWo4h
         3OGWLEtwWOWFahzsI5QZtJs4lVjuO08OyDz7rFzlZ4kQBWhoKihH4cPDl4+7tDrJUGp4
         NDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832033; x=1756436833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quTPMYj7s5QwSm0woBLSQz7z4VVYjT+IYu8GwKKHe24=;
        b=liliYOD4WucHFseByDtsoe2oz//OX1x3+794eA1JbzBq+1OI13UIGxsbyRjuDUuZ1p
         ZFVB11w8pP8oZag0yM7yJRCIthDTlMo+nSlNVxEZzGxtEK8NjnFktyCufZCS0A0p0lqM
         cWGeIKI3vUV9zEqBdpTuS3dFkrzMot6K7p49eDVNmjWpDrmVhycKBQHpb5XW72whfEBX
         K59LBv4Gjr4EGhLuXlNA5z/szo4wGzQdVaPIV2D+U9sfiDDwnMYQuXiik/oUMIR30sVS
         SOiBtPBJ6vjHJXEAcik9HLt2zix+Pzx0vUzZdk4NlyH+wNnYOSnTyoxmyFP4Jom6W/ht
         XHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGpE49TcwiGDmRSXnblQu2rti9OKbUT5JH1+gmGiVd7rswvdThEU9Q9z2fK24yEfzC549t+PJsD0XVGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrb/GBZlplezE8uiRKyP+hRaB7jYQ6/UHjaQhOhAR5vLUBiCL7
	YoqlTBXlkxBuDu3yaTIO6eC4LJ6+xmlRddJzeFSZZGiK/ho4wbn18krDkxBqjxouuTk=
X-Gm-Gg: ASbGnctUQOe6XB1PPZXQEOthJ6Wqy3CZmiyP+PhUZJz0v4McLAMBBCZqrQig1FlYO4s
	1p00FW0gv2NKZ+4aafvB8HLVUHyzJJdvd0lZW9e99GrQqEHD9JfqZnMa76XjmtTJWPFghVa70EG
	x4xWbecbpXIvwmDhsPF6JEvYGjep8FwlrYD5MUSBkfhsv2E5ND6mtpQUJfNPTG/wqaKa3NMFwVf
	KW6mhq9sXx/nVta0AAc76+x8lFWam8qr4EcUVP/hpGDy0+bPGBFV8ODmxcbWk8jy41NFwcUlFWD
	SzOiBVuFN0FzWByFEqSs4PEjbNzC1BMh+WCp9BpScczgncE7xxHcXDgH1Lbwl9xhNjl0CcHv4xY
	PQT9/BeC0EkpQdr2Y/dB6aayIecV8YGRBCw==
X-Google-Smtp-Source: AGHT+IGxr6BvRlq9gDlCAE/XGtF9F2t4Uze1UvterPKqOgW+FIUz6fdAVotEWXje2mAfPXpMbJnhUA==
X-Received: by 2002:a17:902:ce91:b0:234:d292:be95 with SMTP id d9443c01a7336-2462eeea5f4mr23986195ad.42.1755832033132;
        Thu, 21 Aug 2025 20:07:13 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:07:12 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:34 +0800
Subject: [PATCH v5 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
MIME-Version: 1.0
Message-Id: <20250822-working_dma_0701_v2-v5-8-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200713_985975_866CF573 
X-CRM114-Status: UNSURE (   8.45  )
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

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f25394d088d0d3cbee41fa9fb553c71e495036fd..b9ef2da15fb22f08bdb5ee5d1bba9f6eed49ff97 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -241,6 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
