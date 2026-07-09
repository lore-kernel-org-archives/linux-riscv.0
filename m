Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5F4C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QyFU64sQtSSlg1DKi5SeNo9CKP9314cnuqzbvF6O+KM=; b=eFIB29My92jHj5
	EY+0LL3HJvi8nQ026larNhcdT2cuHmleM6dk30oO07N1ZFntir5Y9PtbyED5J4s8acXqrj9osnIBP
	BA3+RyB2CMr609ME1TyEIaA5eOLGgTLrZxJuFJM01fGNdl8RNPagb4IVYuHP6aKXV3TdZnNouo9qc
	BlHQy+GWje/3WvzZB1j/l89lzhl8IbRTJF2n8Ojx2kltn0fjBO5c53W805mLP92oy+nPr8cGedfSW
	D3VEiAhALrVeMMnTA7fjTu23i3GVx67DXr1iccPZ3r2akRTxUMjFLxgH3NZWlk8nZ2ay2hCsrMY5G
	yiGAHxms3Yf10HsuNLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg0S-00000000y2d-384D;
	Thu, 09 Jul 2026 04:05:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg0P-00000000y1b-1kd8
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:04:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cad4170e8eso4989135ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569897; x=1784174697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEHsI3+JCKB2EiJ/RAuGzgvkVrODmXwkkeIiIkxzRKw=;
        b=dUWbqfJDdQ8apwr8Ezf4vkvVbSGA0ATi928ASwRAIHPTYRGHbRjv2haWEEQdRl7o4h
         k3faNFZIN1AvmkMVYSKTq6yQcvBTCk8rUq6kM01ZhWgigqOszNgsN1X+q2uKxy2/gNmq
         z30aiLDtsZZr7X9CfNqscUeYkdN0SI8hH+qeb6pEcpRv9Jpeest9VhXVWkfVAT4p+KWs
         sDCUJczTkkV5VS7Q3mG0QaKWzLYqmPi6VpYrnq3NKMBpv0I/tL5P6ehrmdmnygEjQF1L
         +pYaCUKWteYLmVkojH+rn80yw3bLlrvELZ5Kh2SpyltpbTlN0ZqG72MwKPuX5RKHsQE2
         QL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569897; x=1784174697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEHsI3+JCKB2EiJ/RAuGzgvkVrODmXwkkeIiIkxzRKw=;
        b=ENsJG4AznMdRmvciqpEzm7OwtxuuI2CA0XYvt0cV1U8wKostGe23g0QBkHa9Tb5hmb
         NjkWZEhG3DW1SQxnhuxvSHXOwotZhIvUb4zqr75HK43b331AF673LdUj3VfGB8twQTm/
         e/0nsN/6dyG4KQzlupKC+tPaCX2w33xm7kD05pG7+DUQoLC0rlDXmz188quDI+5d2xLd
         IVv0JfmwqheqyV+etmzv3tEYXroU1/O5l7xL6wkGd9d9VsSW1nnayq4z/jFeCwIIIgvD
         ShbQRz1IksuJY12NzIv140h9uPI/GmB7s8wOxvlILkYTPKcywPfG+EY+iMianjiAKIGn
         s89g==
X-Forwarded-Encrypted: i=1; AHgh+RpvDraAIue2PKe87ZiL5WP9bpnxjs+Q64yYUJ34SbJRXqfbP/YQYxMDbGH/fEpKteSohQ6W2iQ1kTYFdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYeNi1WryFhrivUldosuOMfH2bKngqnsRRSCP2stEiFH17kZh4
	PDjjV9tFpVThJVCHa1lZrXR5VI7Oku0FGAz6dt92ZrAKKYBEklSdKtbX
X-Gm-Gg: AfdE7cl65+CLt1nu+ceEYcXN5HSfyDKBHVpogNvXuT7lcurnMeUjwC5FMEOTDVPWVB7
	kL9ZooH0vwnBnDsZVLIT8TiAlPt39vzqQrqwM0ZrnuhYyCj37UlWk0Y1HucGzNU+icmdsi4eWSe
	wJFZ+T91z/wkwD983YdzULRr+NEPIFdt/I4uR3PjG8mJ35MTIxAJDsglgQLFnnHZDE1Ly/l91lA
	3IkFDSK4f/a7pR0edug0TJezTaRutFN//ZwlnQIzehtIyPvmtU0ebKq3oLFiWbxjqa8/5CsY0zs
	8F/y5QwgvcJh39ChQg4yuA83CxbO36QV8FV2PY5J8b3hO+k37/ATAChc5sDl1na2miq/8yT/nzI
	vgYlkCv3LMOE4ueRqb0b2Y5J4V1cb2GFYG1wDA0EWNSWFfcfJyrmOaqMS8lvGDGY+
X-Received: by 2002:a17:902:cec2:b0:2cc:9179:32e with SMTP id d9443c01a7336-2ccea37df94mr58757875ad.10.1783569896614;
        Wed, 08 Jul 2026 21:04:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm36569815ad.6.2026.07.08.21.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:04:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Thu,  9 Jul 2026 12:04:12 +0800
Message-ID: <20260709040415.977784-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210457_455072_7CAC356F 
X-CRM114-Status: UNSURE (   5.75  )
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

DTS for series:
https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com

Inochi Amaoto (2):
  riscv: dts: spacemit: k3: add USB controller and USB phy support
  riscv: dts: spacemit: k3: Add PCIe device node

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  51 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 237 +++++++++++++++++++
 3 files changed, 321 insertions(+)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
