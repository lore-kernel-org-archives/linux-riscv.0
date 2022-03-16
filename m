Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84B4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 00:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=is0r1XpM1G/bMhhvc/4FMP1WczdCCj6zso7LNCLhEMw=; b=e7YxHL30uURx+Q
	RwBrJFhSO3+JeJhzuY/NzgkU6vt/RPZVLLxMeONo0CQ0zpt5cNLM5rTKyJNp7x/wlTDzudLBFbpsG
	vOuLOK1Noq+bbX2iigTq0uEipcgY2mromEA1mWoklOwj0ch6CRBu9xtKkKO8Xh4WG9ynBnfSwkmSD
	ltVqrGsodMyeTVTk8GKg5g7h0BRU5h9FSNcR1DCbUch7wZW+cY1NE988zMzRX+J01Honr0P1EuSO3
	ydzVcInWPMWsOd3qyxIj2qYKGH2dLP8U8mU1RrkFzOEgATH/tfNflA2VFp3Ho7ptb98LQoxI6AJxs
	YLta+jrA1l1rt/2GualA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUH7c-00AxHX-2f; Wed, 16 Mar 2022 00:02:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUH7a-00AxGn-BP
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 00:02:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6B7E6154C;
 Wed, 16 Mar 2022 00:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFF6C340E8;
 Wed, 16 Mar 2022 00:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647388953;
 bh=EyOsPySWxTjLPtQ+W1dS//mkQk4bJni7kyKXhYQWRNA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hm1nUPeb1uEtxYW7f9X75DtmwuiNriskOOw0rJ9KrfYu7WVWcOvm/LmGtvRLCXSRY
 oljvhPhErwiOPpltM/ql+A/20PU1gKAkfStDscN48SwnDeNrZrqa186/8TwHAsnr6j
 FHVYmL9csvVBCc5Fo1PklMVAsPkkn36kMLL5s6/HZ3PvK+1/uZz0bKqnWFEsrjbeid
 emW10G7jTWqz8sDthxypHx3o4WkgGEvlHCgtPklgUBtkhMHR1Zivr9TJSkurS9mwLt
 RSja2GwwX88Z+TMSxNYHElb422x8PwyNoPhzJclBpRfKzZlO0PyrAr1w2WOnlD8XjU
 SeyZOiSMDp5og==
MIME-Version: 1.0
In-Reply-To: <7728ef662c59449ce954b1b62c6ad5241e07adfb.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
 <7728ef662c59449ce954b1b62c6ad5241e07adfb.1646388139.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 4/5] clk: sifive: Add SoCs prefix in each
 SoCs-dependent data
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Date: Tue, 15 Mar 2022 17:02:31 -0700
User-Agent: alot/0.10
Message-Id: <20220316000233.ACFF6C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_170234_448496_A6246DFC 
X-CRM114-Status: UNSURE (   9.81  )
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

Quoting Zong Li (2022-03-04 02:03:20)
> This patch is prerequisite for moving SoCs C files into SoCs header
> files. Currently, fu540-prci.c and fu740-prci.c use same names for
> several macro definitions and variables, it would cause redefinition
> error when we trying to include all stuff in sifive-prci.c. In this
> patch, we also remove the temporary macro definitions which are
> added by previous patch.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
