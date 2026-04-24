Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495EDFED3C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLMNW2CGmQ9M00FDu8Hacy+oLbHiZqdK62NoOdTY6a4=; b=gDBC9C4MLOndfM
	5oR5dmVvr6QPxjx+sv6wNkH6ItWhArfQ4uwPLfzPwNSJdVXGhg/vVX3xITqdN5U6u1gnUcBxzfk+s
	vAqm16y9O5m9N4qN5GpaUoRNoVbZS+quCsXvaFKj/nIEN2Z3Lpst9IjtQp3hvhawwnNHALAAUWrmL
	Umx8XTr9wUY0kJXzHltjuySxzWczHCneZzB0NdEHsHT1PAOI83mZmDb+UhPg75uEKTfJKIxberhAx
	3R4H+wUoBocECi80M6XpLKDXo2Py9Kld6jsDD4nrcMPR5rHmI9Wazz4J34kgCMriZVmYY2QO9d3Rt
	+FFVyXR1f142Njv12OCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGH3H-0000000DHbS-0s0x;
	Fri, 24 Apr 2026 13:58:39 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGH3D-0000000DHap-3dhN
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 13:58:37 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2e221a71e19so7690604eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2026 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777039114; x=1777643914; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQxAgNQNXDNCO7hb32JxDK6aD4YqIXLUMAcyq751mmc=;
        b=Ujs3i6YOaI5uwf19R2sqd9UEHk8Jk4qnDcGyz4T4UzR0YQ1hHJsDZiU9ZXUdnVJBsa
         myimFVQD7AWuWGacAbedfxO6DKWUSl6e5czJlqTxsO93pfJEdg+6M4J9iEh3WNZATs9q
         HBPvPdai0DdT4ngNaNft04KtfUw1N03zOKJ0tzaurjk93EhoIDMvrcZFyucJ/JakmogB
         84IU0D+M/ygb6dOTpw1KyWZN3O+XWCHBJ+Gelr//DJ0DGbUCc6i0wDwnquzq0H9GM5su
         wWODgL4ywEuFRau9l1cnghV4+ZZF3VtFjcI2xBdB6UcoJrIla/wwULhkCtxjHstacUNg
         oCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777039114; x=1777643914;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQxAgNQNXDNCO7hb32JxDK6aD4YqIXLUMAcyq751mmc=;
        b=K/LJanRG9uo9yfionJpWwOq04KTYhDAblGa+fGFKIJ54Y8INZmSi134MfvAuViIibr
         3ABWaIxQeKrZZBC/HwXNCP3EFQmoWzOT0Bhqu9dQfdH7V9pdubRAYlsnz9usBbrgXHGK
         Aqx9PrR4vnHxjdKVHc8sjymt8hWuYwRopISQjD8xnHHfU6+n11zvIEpC+pO/skawEYCC
         8jkMQhCVMuQln7U3EMQhfG/uTynwHnJyAN3nq3OIm5k2HUDP0yY1b7pu+CjO7eeI3QLi
         72RY9JTJmXMulwi635nP4fUEaUuX1zlUPafzYFCExnxc3TS504ABxb/GmJlskarFn/Yn
         xm5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9x3tpgxZgX9og0Xgpmy86Bp/RHskokXm5DAnljH0qF8LmnfPPvyrgLq83Yys6oKNP5MA4io7qbpKnZpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaKILlhLAIDdNeqIpw7W4orcOM+APkGEL5xa0W2M9qzTq6Y6c7
	6qRnhkUgXCAWO2KcAEEblJ/Nu8npL7LRWjVey2n7IuKnvsaKUyOavL2gIqdLJykAsps=
X-Gm-Gg: AeBDiesDNONKJzgbTNS/ITMgHsD/G2dXL1joG4xwQtd5qF7dFhNEzU6pH7zAfyhE+Rq
	+XFrh3PVnBu8pgZX8E66wgZWheBX6WSuUnBErCaSf7yMpPVFwzURHKcp+SwmE+oWde7uvGwCckr
	ARGURuktWtcsSrHiyKdMCJVRh7BuUajQ45gNszl5+42GpNx1cPZh5haDWE/ulSNEQBF+YS0jirv
	66BQYSFX4IbZY5V6+I44p/IGr3FOTnUM9V7W4hCuthlcFZdqJk6rUkOL6DB4nzi2wBafV2h49D9
	qOSt1wT4LbC+AwhYCpeN+wn09NQh1nJr9SISZdvGo72sf+nLcrixin5meSMclHIGrAIgSq8aP99
	tsaCHygMHfPfKeVvhCQMyfs8W6u//KcFZWwCEX7msnL4YcTBLy6Rqm/mfxUWvW4MMRu6aJUMaDl
	R//Av0+lyD15ynRVasRUfNCdCPJMLk/ZffomC1B7/AdSs=
X-Received: by 2002:a05:693c:2b15:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2e47a1027d4mr19101535eec.21.1777039114063;
        Fri, 24 Apr 2026 06:58:34 -0700 (PDT)
Received: from localhost ([2408:8256:2289:187:7e9d:5b36:3e7c:859d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm32940358eec.31.2026.04.24.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:58:33 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Fri, 24 Apr 2026 21:58:27 +0800
Message-Id: <DI1FSG6ITXK3.GG7XHRD4JSGC@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Guodong Xu"
 <guodong@riscstar.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, "Brian Masney"
 <bmasney@redhat.com>
Subject: Re: [PATCH v3 0/5] dmaengine: Add Peripheral DMA support for
 SpacemiT K3 SoC
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
In-Reply-To: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_065835_909372_E91BEBA2 
X-CRM114-Status: GOOD (  20.83  )
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

Apologies, I just realized the version number is incorrect.
This patchset should be v4.

                                      - Troy

On Fri Apr 24, 2026 at 4:20 PM CST, Troy Mitchell wrote:
> Hi all,
>
> This patch series introduces Peripheral DMA (PDMA) support for the
> SpacemiT K3 SoC, leveraging the existing mmp_pdma driver.
>
> The K3 PDMA IP is largely based on the design found in the previous
> SpacemiT K1 SoC, but introduces a few key architectural differences:
> 1. It features a variable extended DRCMR base address for DMA request
>    numbers (>= 64) depending on the hardware implementation.
> 2. Unlike the K1 SoC, where some DMA masters had memory addressing
>    limitations (requiring a dedicated dma-bus), the K3 DMA masters
>    have full memory addressing capabilities.
>
> The series is structured as follows:
> - Patch 1: Introduce the necessary dt-bindings: K3 compatible string.
> - Patch 2-3: Refactor the mmp_pdma driver to support variable extended
>   DRCMR bases, and add the specific implementation/ops for the K3 SoC.
> - Patch 4: Fixes a critical clock issue where the DDR bus clock
>   (top_dclk) could be gated by CCF, which would cause DMA engines to
>   hang and lead to system instability.
> - Patch 5: Finally, instantiates the PDMA controller node in the
>   SpacemiT K3 device tree.
>
> ---
> Changes in v4:
> - patch 4/5:
>   - add Brian's RB tag
> - patch 1/5:
>   - update commit message
> Link to v3: https://lore.kernel.org/all/20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com/
>
> Changes in v3:
> - Removed the dt-bindings patches related to the DMA number.
> - patch 1/5:
>   - update commit message
> - patch 2-5: nothing
> - Link to v2: https://lore.kernel.org/r/20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com
>
> Changes in v2:
> - patch 1-6 are added in this version
> - patch 7/7
>   - update commit message
>   - using k3 compatible string
>   - Link to v1: https://lore.kernel.org/all/20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com/
>
> ---
> Guodong Xu (3):
>       dt-bindings: dmaengine: Add SpacemiT K3 DMA compatible string
>       dmaengine: mmp_pdma: support variable extended DRCMR base
>       dmaengine: mmp_pdma: add Spacemit K3 support
>
> Troy Mitchell (2):
>       clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
>       riscv: dts: spacemit: Add PDMA controller node for K3 SoC
>
>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 ++-
>  arch/riscv/boot/dts/spacemit/k3.dtsi               | 11 +++++++
>  drivers/clk/spacemit/ccu-k3.c                      |  2 +-
>  drivers/dma/mmp_pdma.c                             | 37 ++++++++++++++++++++--
>  4 files changed, 49 insertions(+), 5 deletions(-)
> ---
> base-commit: 02f90981a67f3b9ee7d6684e7503a4fed7aade0c
> change-id: 20260317-k3-pdma-7c1734431436
>
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
