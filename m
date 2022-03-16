Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAADDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 00:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPOTzF7lhQBCqFgU2N0lvqpemcpcUyd9JuB4Pozq8iA=; b=cL1dUIcBzqHDfE
	/YNVmmdZN0oCs9IpZCGdnFW66/SozuVhIHUyQc3wXVLdoc5TwGDjDr1MWHZ4AkKnqjjgIdfvw+jxS
	pa9kbqHweQNuqXkOTB9JDHLoocmMQpcG1miVE3nOOr3Dq9tKyLopvfHjfnRj8otVkymR1QVtCDCwW
	bhnfbiHuXHlJI89ub5MT6XNiRtJ/nOqDpI5NHV/Fzw4rnBSiTgPpMam3pjG8o0nrBbp+nvJmegUHB
	cqX8AU4L2raK+N1uYHjPR+jQUJtf/cby94K4tGfgQPYKS2Aezds/hSIB7D8ytS89z6Uv5QrutcSPQ
	sL+L8v07k87uRm7lWELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUH7l-00AxMM-82; Wed, 16 Mar 2022 00:02:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUH7i-00AxKd-Pd
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 00:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6091761558;
 Wed, 16 Mar 2022 00:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C86C340E8;
 Wed, 16 Mar 2022 00:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647388961;
 bh=gSjwqWfs0xHAYr2djQjQy7OqRlnUPhxMCbMqx3FoaNo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tRV99RsTh7UBRLm80E74A83E1av840luLqyGcVBIazJDG+QAvwJrmzIOkRn3GVndU
 dcbiUWNiOMAv2xwvEHVGd427Hm0z9vbzaOEdtP4KgurnRm6UykHbeO6vGx0qAT39YX
 Mai0EkzClKVJRGExXv3sEp8zY3Pj3S+zOGKxi01T1i/sFIFAprjMBbek7m8M87oLKz
 Gu7KTw7PNfgIakn3khUNKxEbdHA/Q4UXPk0Dr1MQ5mvp+ySnqfdwLdSFoYHCn+6r/R
 uyX+Sa2CvMuTSuW8ZRzLm7ZSl9kg7CaitKm+4UiVUZmnZGwkaBu7hDQEZ26accK9ci
 ExUnIdJ7hUMww==
MIME-Version: 1.0
In-Reply-To: <a3c7ec5c46c1d8be455d1c347db4855bb56cec53.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
 <a3c7ec5c46c1d8be455d1c347db4855bb56cec53.1646388139.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 5/5] clk: sifive: Move all stuff into SoCs header files
 from C files
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Date: Tue, 15 Mar 2022 17:02:40 -0700
User-Agent: alot/0.10
Message-Id: <20220316000241.C7C86C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_170242_910039_2B702004 
X-CRM114-Status: UNSURE (   9.71  )
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

Quoting Zong Li (2022-03-04 02:03:21)
> Improve PRCI driver to reduce the complexity, we remove the SoCs C files
> by putting all stuff in each SoCs header files, and include these
> SoCs-specific header files in core of PRCI. It can also avoid the W=1
> kernel build warnings about variable defined but not used
> [-Wunused-const-variable=], like commit 487dc7bb6a0c ("clk: sifive:
> fu540-prci: Declare static const variable 'prci_clk_fu540' where it's
> used") does.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
