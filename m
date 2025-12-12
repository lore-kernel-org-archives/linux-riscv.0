Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103B9D41D74
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 02:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CB2lKaNaCqCn2/zb5QKzFD61wVpOY/TOREd3S4SxYB8=; b=xTmnHMOUGTx1ui
	yRu8cPZEmg8eVwWfMArWvH3WoiqmYF56Z39h9x+x8x338NqhKEij+26JcFhUKzuAyTfVk4Xcr8YmU
	Zcqty68qCspzBiXYOI1BxQWkFb/93C/nkeOTkioXjZ6Ps4fGPGKsaoo1mpcvDequS4asLeYpKWtyh
	WadgI9akPuixDdx7t3AksPelkWbI/VY+SFwYycLBI7+BpcGiWzetBj8RA0uafEtIqyP0sbHO4uxMQ
	rTC4JDcHxKwgCnFaHf+4Ma93ah72m/bgIeZ3/mg4akl1aqq6k+bH9kuAGkwr8rbXbJiYZKGhPCHsR
	YQwCSBqBB9lLOha77r3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXs-0000000HWO5-3f63;
	Fri, 12 Dec 2025 02:06:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXn-0000000HWN7-38T9
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 02:06:10 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3436a97f092so922466a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 18:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505164; x=1766109964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlgUDFgw3W20yRvzQZnPEu5u5tHChFQ6crwdHESAYTo=;
        b=SD7DeBjwb02fC8uOhRF66pwbvnDM3g6ZzaulPDMLstvZ3/SkhQmVGzF9JbDYd34dXs
         +Qm/XRGPCtsS+0B1VAHXIA1DpKYkJ8ertzurLHIrE/gWpsoOPlKeMGktTLPtprs6wFw8
         i30LgVIPhyqhYpHBJEg1xCGw8onFCISZgzwuSpAofDkMI4WseRvz8p2Fz+uxFs5b1mBR
         2nmImzxxjG6fv5xnmyOIUMzfaUV4FMWdUpoyFXJlRTBjfDYf/rXPSu8t5D1H24e2w9mD
         2E/NMdJFFy52Ahb6vqdOlT13tGXTalxPzPffy3Ri6A2PK2rkiwPHCdOXgdFryCxqyP52
         XvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505164; x=1766109964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlgUDFgw3W20yRvzQZnPEu5u5tHChFQ6crwdHESAYTo=;
        b=N3OuPvBl8N+srg9sVjnfk8WWrUQ9NEFVpwbtj46fxcSwxSKoslPFFTjr/JMba5gX6n
         rDApzLqnEZBp0qh7Tg2AdJiYFr2ljrosknIYPUVKicE5FllV0wyf8xXlf+uFR44bC/EM
         VGxdmd+i6QI4UGMpIKR5F8gtLsoKkIJXRHgxn7OfAaBVwi1Z/qHJnYqXvlLA6T8NLJ/G
         FjU1f4McA1sdg6cKc7/2I1TCCvl8zLWo4BzsrQ65pRRejEMKqwwcmjWy7wERK01bTyL6
         t7XlYSGSz9LTyBejg7KRIBb5Wz0vBBLvUQdHhlBKJaqkbuMytSq92taNkn7tcCYeC9i7
         vJrw==
X-Forwarded-Encrypted: i=1; AJvYcCXPuXjewjUofwj+A78atECP66hWFvU1310LUEBZO7lmNRs6kgfO5V1HCEWKlnVIHLgz7KVN07po6fO2bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI8YO4YC7ZGdHfIq2RjNPGgrko2Fbg2KSPbgIiJ6vYxaTwDLUT
	e0jrsnYGd6ULjR7IOr4eEWtjWIjS55Cjn9tOX3sA8j3FEINLSGKO8k+G
X-Gm-Gg: AY/fxX42mBwj5skUqhDTOEFUHdPnExbr0a5Out9/Shj4yVuX9HHVzSfirUte2DcYcod
	LxDF/hQvH0/cinvGkoRdoGjlxsAaqaL+J3XaRni4dxiGjyVHVjvLK4gWUAEGh2GKeXG7FpyLzzi
	V2Wvuvkzx80nSy1AhDp5wF4ro65NGDQ4GjesrqqJ0jnjhX+MkVnNRtQUSxiVNQOLqKILKs8fABi
	MRlHZtbRYA5NeWcHLszmgh4AsC6aEG7S8cLRnDkaVZ7EfSYmmlW9x4kWsqsu2eKi1CUadjRwoRR
	8H6D6w4sa4Nm3PP8KzXhEYaOJ07URGu6i3DqBy4M7SlglBLsb0R916+dw9gw3gx7bIH13MBxMBK
	SOuFzYIZD7Rk3PhGhnxp0zDAc7Qs4Na44//q0d1uko80mtPRxkjrzaHHXxnyaFJMH7tObBiEQnB
	bnPfZHiu4g5VOyCL38oeH/
X-Google-Smtp-Source: AGHT+IH3Yw9NfBszzIXyVq9G5mI8Je1OQSv84u6vZsMXIzrC8EAZ85t54i22pt6sz/SEwSGENP30UQ==
X-Received: by 2002:a05:701b:2515:b0:119:e56b:c745 with SMTP id a92af1059eb24-11f34ac52a8mr455769c88.10.1765505164545;
        Thu, 11 Dec 2025 18:06:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm13483678c88.12.2025.12.11.18.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:04 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Fri, 12 Dec 2025 10:05:00 +0800
Message-ID: <20251212020504.915616-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_180607_813905_0C0FCB16 
X-CRM114-Status: UNSURE (   8.61  )
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

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Inochi Amaoto (3):
  dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
  dmaengine: dw-axi-dmac: Add support for CV1800B DMA
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 4 files changed, 23 insertions(+), 4 deletions(-)

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
