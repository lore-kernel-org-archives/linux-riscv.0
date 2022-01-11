Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696BCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jb8t4KafTSg0+2ZC+3/ydWbZV5LkBTr4+ZR40b7bJAA=; b=Fls6NZPDqih5n/
	yVWUi3ztVE35q+U/7qr+cKUPbOpJe7AIqz9tDHX2VsRcAKw+wMdP2IhI6twmjMDSIYPlxgexc6LAP
	BgcSx2kcKsCeB4Tp/QksJQknoBOIJm5Bcxk53agZdoIOYGl8OvC3UiKC6h5IttivMYZ6yWoRiB+5C
	WdDc89l9dFwBTjtasq3SlaoKJZSKRzhQN+YYWPgpobEEAOLY2v9mWyG2s/UTl9s/NKfqX4XuvuKLP
	VazNbjekbBkMyWQqwaqiymCVydGwJFo1EhUQmRT4b8TWcRbRR1mIgGV2tz8eYr54ogq8egJaUuUU7
	208PbYfB4L+FLHFDAZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7CsZ-00FPbq-MA; Tue, 11 Jan 2022 08:51:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7CsV-00FPar-FN
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 08:51:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso3863513pjo.5
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CyD9l+2ezhf6QjDxxdO63hYLgAiFV1ZYCShhusA3Zc=;
 b=EQGDnRWIzVflvRC1LoZBEca5vqEcilEfPy7CnUu3mLOtpkgy6w5pKahNh//E5U3xfQ
 crvEswdn9+Jw2nKpYnT1laOXAsAHj+ZsDHWXcC39ec83ibeSMG19vP1c8eGcX/PSrm0B
 xWWSpl3a6wyNpRIl+61dCj24l2FvXfWQLWevlOAfje9O4ZMVbw6yYNFEPn89DJjg3eFo
 1wNVB9CBl9AFVAqxt1zDYzGICrZ4TKipIqU+2hDijnAK3GfZK7AiZ6+uBelBctFUN0wQ
 TX72hOMnbXnfHv316neSjDGnMl7KvIOiyovEZX3g9mnj+HGM+FS9atoldU5UeFftMSwQ
 fAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CyD9l+2ezhf6QjDxxdO63hYLgAiFV1ZYCShhusA3Zc=;
 b=HeMoS1vs65yD0KO134xrF/RNhNgj6nR0t+iqZZRGjW/Zo/47atXQSc6f9mhFoy0/3K
 6BZgRdTKbtWpnzlEOvSMh7mzbR9dHBua0MQFjb/HfXjhLWybMCg9aaVDtdBkEQ8kDqk1
 nQoNemEKZqKw0QEDoufmxB3A23DmSK+AVR8h1UEtyET54qiiy7eQo04sy9OuE5VT3RHh
 ayKKP1IU0UJNgr9jofQYoz6y6POfIndaSTI9loIHTFxnMZHsAb+kyfjCEkrt+eI887p3
 wWZzzVBQ7wxC9khA3zhufIjGcEnvjW1oj++hla078fRcZwNqFhRmcc+spN575qipDQS1
 bjRA==
X-Gm-Message-State: AOAM530QRvYMLP/Urq0dFbp0nQPK4fAGvGdOeBq/oF/vJBo6PQdCGM8r
 m9xruIZdzFN7ssSFdAjJ8E6XBw==
X-Google-Smtp-Source: ABdhPJwD+RQbLIRJC0BxCTDAflnidt5/NwF1Mtjccg6WfBOp5jBUvuu24w0KyQxWVGPNZVnK8Oba1w==
X-Received: by 2002:a63:3e81:: with SMTP id l123mr3215398pga.41.1641891098542; 
 Tue, 11 Jan 2022 00:51:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id j4sm9447598pfa.149.2022.01.11.00.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 00:51:38 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/3] Determine the number of DMA channels by 'dma-channels'
 property
Date: Tue, 11 Jan 2022 16:51:24 +0800
Message-Id: <cover.1641890718.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_005139_591136_A0B9FE4B 
X-CRM114-Status: UNSURE (   9.02  )
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

The PDMA driver currently assumes there are four channels by default, it
might cause the error if there is actually less than four channels.
Change that by getting number of channel dynamically from device tree.
For backwards-compatible, it uses the default value (i.e. 4) when there
is no 'dma-channels' information in dts.

This patch set contains the dts and dt-bindings change.

Changed in v2:
 - Rebase on tag v5.16
 - Use 4 as default value of dma-channels

Zong Li (3):
  riscv: dts: Add dma-channels property in dma node
  dt-bindings: Add dma-channels for pdma device node
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml      |  7 +++++++
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi |  1 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi        |  1 +
 drivers/dma/sf-pdma/sf-pdma.c                     | 15 +++++++++------
 drivers/dma/sf-pdma/sf-pdma.h                     |  8 ++------
 5 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
