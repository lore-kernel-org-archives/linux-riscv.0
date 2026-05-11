Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD340CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lk0R1wscbkLMtAjGuo2DVoaESjlBqIiRbNR2rL6NJNw=; b=rv1RslKF7pw0DQ
	9biKmfrDxCCSpKngDYBHxkG1L3oKvCIsuOB3FmI4E/fw2P1ZI9pAUwwhpfMwzBa3rpbdh6NcI7No3
	Jp0TpwO4TcDAYXzPhv0sRvELYZq+M9NsNBMBXA/UQdlH//l6DGoNKwAErQ8FnTl6zCkLhCsJmqs3Q
	oGAiNvISYKrjnMJL0sX+V6NFBw12W8z2smQPYLweHk+qj96VQv8HVlP3stde3uG/5eQ7mkUWQ5GGM
	VD+R4X+onm9SCznY7UIsJGu5iVGR1vKOabYJpzKW0Ho3VZq7MaN0tzliRythMkpBpnKnDAZf/yWC+
	Haxd4eGKspyQez+2QTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHv-0000000CVbV-1E9f;
	Mon, 11 May 2026 06:38:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHs-0000000CVad-0rY0
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:38:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so1535044a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 23:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481523; x=1779086323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrHfqxO5zQWaRSbwjGtMUupsuspxAHrjR7FaYDhyfhQ=;
        b=P2ecuiBmyf5LbH4KnZLFk//tJlo/7HyqC/sxm41T6B+kZqdUTh2vgROH6y0XKqvk3I
         1ccuUF+WbmzHLnzTd7nNtQ8cmBqZbiBttslMg7hHHtqcTizP17z8RA6Cf7fqo3Qyq7cc
         zP1ZO+v5tBP/wCJZvlm+OD3PTAnAzw1pAH1yNijldG2YSgkMwfH6gawsPBw8hnjKK1nr
         e159td76z7tJwl14f7+2m/mWP/sQKl8nzxR/UzcxUNtijyZqrf2NnRfm6BIOFC9wUDe2
         wX4HGl7LBge44AtMLkB2cYuhBMLR3iNTF2RKz7uYuhG8H8RACezp6mYd5G8H/vLioOVY
         REmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481523; x=1779086323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrHfqxO5zQWaRSbwjGtMUupsuspxAHrjR7FaYDhyfhQ=;
        b=N7zCS5vtGzmUsk+I34FSku7+T+Wrhy5pt1ahmkQaXZC33BXYlaZWjI7Yko9sEu6EY5
         7pXXPR8JYgxNv7OdPn9t4LvBUP7bE1tzAkHxsZl66Wz2nVfQ+t4Zh26qKsbRDpidytrm
         wf/C1bRZ1cXwWM3HErTa43TFMDeysVZ7RzdhN/zYcHH9bxkV2Q9JQwdoqcYnU9/bbJ3z
         fsu1WsV8cgdlHLkNM4GIBIgzBDde+O1oZpGPoP6B+rRYl8bFLEubgfC5jdIlfvWHbd2l
         ZxpSzyFX92LBWj7a3xsfRA0x/IIDSrgX3lCdeUpOcEENk06qVuueIEtq80ZM/XuZVf83
         Rh8w==
X-Forwarded-Encrypted: i=1; AFNElJ8aZo9Xbu/RxoKAcrgNT3dgkk3rm1k86cV4+WJSwelKQw2OJ66fZLfEVXrdtUhwlhfW7YCXUJxeP50jaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPXmCAh1CdNk5od4R2ulfNnfwNc8EYB0meLkr6Wpg+U4QA2yM
	7LprMp0qXGOA9Gqz1fxczGvS+dIl6GYh4AbGq5Z2HyLoGgHbsMzRBFXa
X-Gm-Gg: Acq92OE8paIAcZdgk99a7MN3DxT2Il1YhkbTGJEGHGn34H/UKqO9iZmgNcXwubJFUKZ
	PgB2xeFi2oOHiZfZqiRDeFUJo5Zc+r6bM4FkLPrVbTe4JpJ5Hx/VaRxXLZ11Yzyo4mlLQDv7hJS
	XF+douERvE992OCiPNq8vK+df6J0SmoG05zsZqyqVmTyA0BNsy4B6TVXDCdSOz/gTLv5fh2S8sI
	duVFnKcBY6Rij75r2RazqIPXZIvQXS1ZearRYVeBF7lECLcpeLnizJppVd/C0YU4g+PcxvQ9riK
	L+8kgF36TVdJ7T8muVtsLXm60hHFNmmRXo3sLG2bLsJL81tQzyWwjieWgW+PXx2K1vnDmu6C7s6
	5veAH6nTQKuJA7/7WwNPs6KuEL0+1U8kJXKpu/jIMbtfAszRnOe9zrNZaB0irgSZtppPBRFgVCP
	IfJ9/T/7uHQvkvVEJMIiHESoQ=
X-Received: by 2002:a05:6a21:9983:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3aa5ab71a24mr24213272637.26.1778481523036;
        Sun, 10 May 2026 23:38:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be0csm8409174a12.2.2026.05.10.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Mon, 11 May 2026 14:38:15 +0800
Message-ID: <20260511063818.463877-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_233844_249803_7346F143 
X-CRM114-Status: GOOD (  11.20  )
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

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary.

This patch series add fallback compatiable according to the disscussion.

Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM

Change from v5:
- https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
1. Add dt-bindings patch for fallback compatiable
2. patch 2: Adapt the binding change.

Change from v4:
- https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
1. drop patch 1 and patch 2 as they are merged
2. Add ABI break statement and clarification for this patch.

Change from v3:
- https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
1. rebase to v7.0-rc1
2. patch 1: Apply Conor's tag
3. patch 2: Apply Frank's tag

Change from v2:
- https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"

Change from v1:
- https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

Inochi Amaoto (2):
  dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
    CV1800B
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
