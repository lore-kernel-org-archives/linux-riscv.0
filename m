Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA9CDD548
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JznrJ6o8FdCjAidZJtJ3mkVbA0M6zkqOU8hbkAt/tmo=; b=3NyVA3TgQQ8baC
	AVCKwOB7tYustg8AWAujHTv0eiai5MOZUWpECmCKbig+91mzgh7N/jjEAZsYmUuaCMa+HqNbWcSiJ
	HFmJKcc/i5cl5FWF6Cm5utMtaeoHOE2p9pCKvbBDulq9zPL4LWY/wBnrWOKfvPp58sM/dR+racfR3
	Q7JLGwVb/YidcJs3/V01k4iVmoFln0rQNonmNTV6fkJRAoAs6cRMxTmAZbZpJUcZH6GkF3M3GSDac
	R7EfEKHepojl+ngKHAa4W5DfR1cXkAvPiKjcOpcPCgYwK6xPE+CtfWU//2usokblkvJGw43fgsgOT
	8PQUbpuK/k5lWdNI4x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxJy-00000008blC-2z9l;
	Wed, 18 Sep 2024 16:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxJo-00000008bhm-2HDs
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 16:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B86EF5C59F9;
	Wed, 18 Sep 2024 16:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE68C4CEC2;
	Wed, 18 Sep 2024 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726676055;
	bh=3rznRPdygQNZ3lygq9QAApBHw9Wr9Jz6m6ljd6J0fpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIejEd4n3jKs72DbigX6AovTlZzCspSJj2JtC2g+edq7i3EgSgZBuyPwnYGLMjFik
	 BanmUmNP3k1eew7YZIazc/0EPDShFdjtvoxUfYBDYXsUCDXPLHIrZdgY8VJ5+Dg1zX
	 NpSY+1QIVKOWL6Ty5DXSYo6haOjcfkthxSfDtYint7s7X3qpnfqDA9ce1kP4Zulicl
	 gkhqrh30IgP+WbyycL/Y9CfsCKPSKbx8YrywS7Kj+zfIqfv1v9I4yhq6Mm6nTbg6x/
	 b9+NQEkUhX5yvNTwP+tO7912htXd9E7sAO32216HVS14IV0YhCtroaSycKpo1nQdOd
	 JLz5gJkVdNWoQ==
Date: Wed, 18 Sep 2024 11:14:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@pdp7.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Message-ID: <172667605295.1715920.4448907447516770093.robh@kernel.org>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
 <20240914-th1520-pinctrl-v2-1-3ba67dde882c@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914-th1520-pinctrl-v2-1-3ba67dde882c@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_091416_717928_69AAF89C 
X-CRM114-Status: UNSURE (   9.20  )
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


On Sat, 14 Sep 2024 19:40:49 -0700, Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> 
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [dfustini: add thead,pad-group to select the pin controller instance]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 176 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 177 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
