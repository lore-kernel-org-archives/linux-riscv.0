Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F50DCAC5B0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RU5zQGU2Wl8li810lIAr7htV2Rt0d3FDjfczIdD4tGA=; b=g69wRkLxoDSt/t
	HZbem35eZtvjQlM53YF8r+6Gmx2pQHuNX+FJ3ODWgDixr/+bQJDi89o1UyVBAeHhfpCd45bT6xqEO
	CUPE7l7EGuCDBku11VimIZLGgdFIcDmNnqWLrXwQhN+uCP36blWPhwlxd3wKzvZcTI5y59IDakods
	nnbRXh7nH5Q6u6dX9W+dzLE0R7hP5eEQs0zvjPG4K+5ZgWIEhcOZla8fH1UYYH1fN6ACcFr1KnjUb
	HUvv1AnRhh7gtHb4qfQyHlFLMHWxRjbl8rc58AdEVO1dVlxI/p0IdoHayLEHGZHPaa0xAuYFH9S9y
	Uxg6ITXbXK11PJY9VScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4oXf-0000000DEla-0smC;
	Fri, 03 Oct 2025 22:46:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4oXe-0000000DElS-0qmR
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 22:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38CC5602B6;
	Fri,  3 Oct 2025 22:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E8EC4CEF5;
	Fri,  3 Oct 2025 22:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759531579;
	bh=gIBQHcFKcBIdAPga4TBQFjUJoyny6CEqEN/10Zi2Q/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DP5+XvuYagYXLfhO1np7W8ZssxsrnmVjNqaeA42iotzTWHd4wgDv4Vgw0RhRvH5kW
	 5yfTsBxP/a40CGsG66tALqe5NkwrDOGqYoColHYcP96HukTMidPum9k8/85UFa5s9+
	 3tWUJeMy2PjCYcJQ0bVu2IUxG6rmfHnyTdYVFfbe2AHTBJF0Y+8Y/4h+qVhsrHSUZj
	 5UGnleVyfgJ6YXRySNi9YdEIK6IbwmolXo0NK9TKyjd1KgjJL49F8A87zgt3DPGXdI
	 TD3tdCjmspn857+e6tcoL+g54g8UsDnhT0SoO2sClAhhXfJuH6SsAH9yfz7kDOl53a
	 yJ3GO564Kw9jw==
Date: Fri, 3 Oct 2025 15:46:17 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <aOBSOZzOAeelS6Gi@x1>
References: <20250915095331.53350-1-ziyao@disroot.org>
 <20250915095331.53350-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915095331.53350-3-ziyao@disroot.org>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 15, 2025 at 09:53:28AM +0000, Yao Zi wrote:
> TH1520 SoC is divided into several subsystems, most of them have
> distinct reset controllers. Let's document reset controllers other than
> the one for VO subsystem and IDs for their reset signals.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Thanks for sending these patches.

> ---
>  .../bindings/reset/thead,th1520-reset.yaml    |   8 +-
>  .../dt-bindings/reset/thead,th1520-reset.h    | 216 ++++++++++++++++++
>  2 files changed, 223 insertions(+), 1 deletion(-)
> 
[snip]
> diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-bindings/reset/thead,th1520-reset.h
> index e51d6314d131..68ac52ed69de 100644
> --- a/include/dt-bindings/reset/thead,th1520-reset.h
> +++ b/include/dt-bindings/reset/thead,th1520-reset.h
> @@ -7,6 +7,200 @@
>  #ifndef _DT_BINDINGS_TH1520_RESET_H
>  #define _DT_BINDINGS_TH1520_RESET_H
[snip]
> +/* DSP Subsystem */
> +#define TH1520_RESET_ID_X2X_DSP1	0
> +#define TH1520_RESET_ID_X2X_DSP0	1
> +#define TH1520_RESET_ID_X2X_SLAVE_DSP1	2
> +#define TH1520_RESET_ID_X2X_SLAVE_DSP0	3
> +#define TH1520_RESET_ID_DSP0_CORE	4
> +#define TH1520_RESET_ID_DSP0_DEBUG	5
> +#define TH1520_RESET_ID_DSP0_APB	6
> +#define TH1520_RESET_ID_DSP1_CORE	4
> +#define TH1520_RESET_ID_DSP1_DEBUG	5
> +#define TH1520_RESET_ID_DSP1_APB	6
> +#define TH1520_RESET_ID_DSPSYS_APB	7
> +#define TH1520_RESET_ID_AXI4_DSPSYS_SLV	8
> +#define TH1520_RESET_ID_AXI4_DSPSYS	9
> +#define TH1520_RESET_ID_AXI4_DSP_RS	10

This doesn't seem right. The numbers for each subsystem should not
repeat. Here the DSP0 and DSP1 items have the same numbers: 4, 5, 6.

This causes both clang and sparse to complain. I think you can just
change this so that TH1520_RESET_ID_DSP1_CORE is 7 and so on. The
indexes don't really have any concrete meaning other than how they are
used as unique keys.

The warnings:

  AR      kernel/built-in.a
  CC      drivers/reset/reset-th1520.o
drivers/reset/reset-th1520.c:655:32: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
  655 |         [TH1520_RESET_ID_DSP1_CORE] = {
      |                                       ^
  656 |                 .bit = BIT(12),
      |                 ~~~~~~~~~~~~~~~
  657 |                 .reg = TH1520_DSPSYS_RST_CFG,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  658 |         },
      |         ~
drivers/reset/reset-th1520.c:643:32: note: previous initialization is here
  643 |         [TH1520_RESET_ID_DSP0_CORE] = {
      |                                       ^
  644 |                 .bit = BIT(8),
      |                 ~~~~~~~~~~~~~~
  645 |                 .reg = TH1520_DSPSYS_RST_CFG,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  646 |         },
      |         ~
drivers/reset/reset-th1520.c:659:33: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
  659 |         [TH1520_RESET_ID_DSP1_DEBUG] = {
      |                                        ^
  660 |                 .bit = BIT(13),
      |                 ~~~~~~~~~~~~~~~
  661 |                 .reg = TH1520_DSPSYS_RST_CFG,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  662 |         },
      |         ~
drivers/reset/reset-th1520.c:647:33: note: previous initialization is here
  647 |         [TH1520_RESET_ID_DSP0_DEBUG] = {
      |                                        ^
  648 |                 .bit = BIT(9),
      |                 ~~~~~~~~~~~~~~
  649 |                 .reg = TH1520_DSPSYS_RST_CFG,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  650 |         },
      |         ~
drivers/reset/reset-th1520.c:663:31: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
  663 |         [TH1520_RESET_ID_DSP1_APB] = {
      |                                      ^
  664 |                 .bit = BIT(14),
      |                 ~~~~~~~~~~~~~~~
  665 |                 .reg = TH1520_DSPSYS_RST_CFG,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  666 |         },
      |         ~
drivers/reset/reset-th1520.c:651:31: note: previous initialization is here
  651 |         [TH1520_RESET_ID_DSP0_APB] = {
      |                                      ^
  652 |                 .bit = BIT(10),
      |                 ~~~~~~~~~~~~~~~
  653 |                 .reg = TH1520_DSPSYS_RST_CFG,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  654 |         },
      |         ~
3 warnings generated.
  CHECK   drivers/reset/reset-th1520.c
drivers/reset/reset-th1520.c:643:10: warning: Initializer entry defined twice
drivers/reset/reset-th1520.c:655:10:   also defined here


Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
