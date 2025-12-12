Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83499D41D74
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 02:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxlbrqQYMBOkF357ZGIAfNO2arS8z9h4cvhdZrDO0BE=; b=riQ6R1ezGjInWF
	nr2nUwsiRiZUlUssVJtLmu5EnHLN2HIOsTk8j77c7gmscvMBL5ld8UdELlE1nlui/ouLFdHAO4XtE
	0cqR1eV1u/nSY7Ozsbw40B/PV7+DnTehipvIfpKE3QeksdjJR0j/BqbalDkpasuxtI8FiCkt7xtSW
	GOEwbbEiKEiGeNZ4lwsJwaj615o55nzIPqhFt4c70jBbVaAOizbIsOA13HLjUPsGUXZGkgGINm7N/
	1ndihy7AkU7jl1M8r00ScjQtw+Gggn9h4c35X71CEJ303zZrs+TLW5+PScucakWekdR8TYlI4J0Ec
	ol86LbRcgyaUleUwkFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXx-0000000HWQ9-3Cy8;
	Fri, 12 Dec 2025 02:06:17 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXv-0000000HWOy-3a8Y
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 02:06:17 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso774396eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505175; x=1766109975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=eGQMjEnW6kCwKKwLVKEhi/xuJA0mcnufK+CiEfeER6XEJmcdzdCqwV+UX7Pqj5nY0y
         rJ9Y4h1QAey7Puo6PukunfEcq3ftAr8XHCXsmMxlnLAK88rH0kmzspOw6h6et1OYkeds
         pkE0nbs1M172lqOTm+A2sBPTuwhZAngwFeu5NsQ5ct6amRf5GrwV4mA6vmm9RMpoLaex
         cNOUIK2Jz5eL+WW3pUphIi8gpYueP7ZnvWeXXJPw9odGdnGL5O3wHMjX7iQK2+KigPlb
         EKeRu4BSf8VPaCYR0AjelriG8nV7aZSxltmLhdzvkCXS3M8AX0bCi+8LbQTzaGjhPpOU
         T8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505175; x=1766109975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=ZIqFk+ORbzuTAZdeIVq3cteT8mJ8ienok8QMyRKrDRmfO0c3Cs2JaYL4NjWPsz1482
         +9Pyl3/5wjLWzz+M/IIbCzlCwVIB22am9hNOnEBoGqq/Lg6cy/eodz7xPR4gwK8iy2j6
         i0T6nmURXKHmKJ1j08Bel9V+WBaVY6VOwI0CJNcV2MYDjZfrqTK8y1Xf4S64w3i9KLzh
         ihBuHIkS0L8F5XMaT7AHNCTG/QucIjJlCfHi22w3TUh37M5OE82Q2R3MjHNTYhvsSTvN
         rWFnW2q4e/bC22JkWrvp0ggBuZeE9Rv0o7oaQ5PN71RUcBNiHPm52rjbfgc68iEVTgPk
         3n2A==
X-Forwarded-Encrypted: i=1; AJvYcCU1yuzwDfvaI3kGKVdVVr/+XmCeQuxAr7RE9aaE/cLRhXF6jECDE0rEgDiT4It3C3hJsVhtc7tpQkpEPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFpXD0lRwHsMal3LHXOhn8iLl+oScoD4Wkp0ozRHQ6JHMv6jLf
	k3tJbgKAumoyTbfyKihD1dzHKzbv9qI4v1mYFXSXvRJPCPJg3YVlHgyd
X-Gm-Gg: AY/fxX7ePhZz0oKhLrJPw+dstCMUrHrui9hSd8nyk+tgsrMyXUv0snstfE5EvW0MpiZ
	pPv9QD02laNvmI+OgSJb0VMZaQK9Et+xY328YDoQ27uJze/bZkrajLVstDg+dWwn8ebyWCpV91Z
	/L8PkRuh1h+TyNrPHmXWw3+Zzoku0M65jN0PVE/Hg1NnJV29sR4U+Kjt40gbeIf618UDRThAA7h
	Oh70Hixy9QiL06HlanTX7k0j5nXgHS9w0TMGk3XQkrYL+zfWgzfLn04NMzz3SGFQgDVJhSz+nEU
	hI2k9bqyo8Zk9o3YJe6dIQuzfhaQ13Wxbv6DmFgmt1WRYOiF+kuhCHtVEvWHhafFScfpcpbz0fe
	FRdp3td69tNyjO4MEo42tVToD66Dqr1X0HpFOGBiAqp4bAR/NoCtYxY5LCwslvEgvmMX44T+mDz
	YNo0zmoYGZwg==
X-Google-Smtp-Source: AGHT+IHp4XoVEq8gZitvB+BzE1jK7qxIPLPcDqRDy/MZup4QourLgfB3mVZLdfvqwzeWxynBbGaqDg==
X-Received: by 2002:a05:693c:26c4:b0:2a4:626d:5c38 with SMTP id 5a478bee46e88-2ac1c7af40dmr1966521eec.17.1765505174731;
        Thu, 11 Dec 2025 18:06:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190acd01sm11708576eec.1.2025.12.11.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:14 -0800 (PST)
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
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Fri, 12 Dec 2025 10:05:03 +0800
Message-ID: <20251212020504.915616-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212020504.915616-1-inochiama@gmail.com>
References: <20251212020504.915616-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_180615_893917_9F35BC2F 
X-CRM114-Status: GOOD (  10.97  )
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

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..e1b515b46466 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
