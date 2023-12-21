Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36468C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 04:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fl4YJz3s3H6BvIfVb6bDv/A0YOy2XDO+vRi1moLgi1o=; b=mS2D+S4MTg1LH1
	CA3TeHa0Sv1cgNv+fdW3ff/bf1M/Exn002xlJMI2EmjEmeeu7p0iIQlN7Ac+VYFRxiC0kjwhKJIGU
	yE3DrYZPbgPq0LAjoQmDYMMTabddlrMh2z2QuhyIYaFoL1p+J+PWkyjdYVwvACkaEz0zOkfZZ8n71
	Ki/VGb1KRIG50BHQoR9fgb4/0y9NlqpgU8XfPU6yRiltFvRqM66HwkCrBybip/lfFq4lvyfd++Wdn
	1gJs7Kvmi0YQAjVHV+YxqEY6y86yY4X05dL+dqcw5aLIJX8mTW5GgKSpSzGbMSMl8kyRVglTUCooV
	aJYF9vEiES041ZfCs5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGB8a-001i6v-16;
	Thu, 21 Dec 2023 04:58:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGB8X-001i6Z-2s
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 04:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4321CCE1E51;
	Thu, 21 Dec 2023 04:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740A6C433C8;
	Thu, 21 Dec 2023 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703134699;
	bh=Y7Unia0MjNq+xhf/SdLTJJEFwi9X+AFo3gAm06VmdUg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PxyFw2L2iNUVJDzrI9VTkR9HhM5eCtfp2BT4lZrs1fnvEIImg/gjyB6xjjz/yUlRH
	 kmA6C8Z8254W2usVvRjg+tii8pqDFZLcG22/41Em1eK8FQCHASjyiuJtisaudxFi6H
	 nIzODL3DWKdPXRIFhmB0jQ0VWYf8WLJuuSq+G1kRSjuHCGaQOGP+hEjUJ3G4e+Fii0
	 u/3bZm3JnAQUcX/k8ay839dsQZTtcLEISWmMSnHtiGMJPFfSuZvWN8MHI/F//XpWbq
	 u4Dh1HHr+adP6d/bolTLU/vuoWK3CioN8cUNyrwRIWQ540q5f9//kFmBNUhsQTLfFH
	 VbT7LcPPQBJug==
Message-ID: <ad35ba42d316a51626a031c4d7d3485c.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49535E448097F6FFC1218C39BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495354167CE560FC18E28DC5BB90A@IA1PR20MB4953.namprd20.prod.outlook.com> <IA1PR20MB49535E448097F6FFC1218C39BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: sophgo: Add clock controller of CV1800 series SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 20 Dec 2023 20:58:17 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_205822_106149_1796A757 
X-CRM114-Status: UNSURE (   6.29  )
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

Quoting Inochi Amaoto (2023-12-17 20:04:03)
> Add definition for the clock controller of the CV1800 series SoC.
> 
> For CV181X, it has a clock that CV180X does not have. To avoid misuse,
> also add a compatible string to identify CV181X series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
