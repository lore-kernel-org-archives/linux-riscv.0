Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC1DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F366140B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73F366140B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OHfy+1SlXpeBwzAtEpx59R7S243V8WKt4hstb+xCndI=; b=DWqWZ5CZFkvEOUux73qqdSjMSd
	HgyfQSsSJVXGqgbVFybzTgdVZLsmmpRe9Hm1Fdvc8xhDhKQseX3ZXhzSk5Dn1/pP0MG1lVZI5/xLe
	d9buRY3pXBAgYlJ8A4Hyy5wrqDIm/cD9EaREp35SsamcTK6BzOdh19RB/Xq5fDrlget0xFHGAitQN
	EURA8UoTK75ysHqDEvyDVEidvvdhmXNJOhuWPRCEsc3FGbVdK9WbCG7x7iuEpWDDHDbVAG6AKJDF8
	6a0toi+EwA5AKsmee8/s6AVN4zYfQp/+lQtU6ZgnBfy7P5tu5tA3IGgOEaLtgh1MDTUDye35cv0lo
	LKM+nbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXYm6-008VmT-21; Tue, 05 Oct 2021 00:57:42 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXYm3-008Vll-N2
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 00:57:41 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id y28so7982538vsd.3
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sF9hNK+5Q8kvuTjnhNF2i15pqYB6ARh7CyQsrGGk5Nk=;
 b=3rDZP7rDxkPm4BRicpP7c18tETvV9lhAEStAgfxE784aSkZF8p0I7xRBHZ+kJyrAyg
 iPqFbTTomjZkq30xmNd0Wl6cIv1fp6Zi35lRRIL0gt7ylAlCellwGfQlKyhcdc8wnPXN
 o1ql62CI+cdEz+C53mbFztu/lP/p9vOz4TI4kL05lWmcJl4eITyEFP2NBndsLpKOinEv
 K0T4BXFgPm63yhjj8HwFSaMMcFOBIlCbWCqx/637FnacxHjPD7cdkPgXUckKP18A1E2k
 YZb9vyz2qfeHke+Sx0GoWhAYXZd0oeoHSmjuz14SPf/ckAcaY2JBM6KS7wVO8kHGU5nV
 wLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sF9hNK+5Q8kvuTjnhNF2i15pqYB6ARh7CyQsrGGk5Nk=;
 b=r8fYBSBfwdSIUAXOM9TbvZmVeiMYj5qrVUTWJeSXTPeihhTj2hQX4oWWVi1eFQkVQm
 +WyKrbrLF4AnqhyLFXhfpP5noV5DKO3W9QaXbzcZnsxQM0VEtoElksIEY1xCY15RMXg4
 N5Y39Ziv1Zr8uiQYXWR7WQUogTkRQ2DE9OE8/MGThKfGIbjDRFD15uQiwxADm/kR41Va
 6EaCtQ4H2y4U/o25OzCSfgjcBwRgGJuczlTz6LMpMPzCs5AB4sYpbxICz4tRaaxPPTnD
 3meNTnLSEb0Tn3D0fEqnCwSWWdhm3dS22ZnTy/9RQCJcExxqVjWLSLxgZ5FNTmmRPPQp
 6JsA==
X-Gm-Message-State: AOAM531SoHs4y/qXk38/d0eeJ/gifsrY50A12TYj483Pk/cJlhQ3J84Q
 dcSop2X97bI7bHuk72++WTenbA==
X-Google-Smtp-Source: ABdhPJxM4t0iAKZap7UMdl4qygCi5eAr9HooSKcNeMwHx46JHFIzp9NOtETibJEIQYYuR3phsIxt4g==
X-Received: by 2002:a67:d11e:: with SMTP id u30mr13617063vsi.58.1633395458360; 
 Mon, 04 Oct 2021 17:57:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h69sm7880300vka.42.2021.10.04.17.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 17:57:38 -0700 (PDT)
Date: Mon, 04 Oct 2021 17:57:38 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 17:57:18 PDT (-0700)
Subject: Re: [PATCH v2] riscv: add rv32 and rv64 randconfig build targets
In-Reply-To: <20210912034538.19404-1-rdunlap@infradead.org>
CC: linux-kernel@vger.kernel.org, rdunlap@infradead.org, mpe@ellerman.id.au,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-88e4dc9f-726f-4229-942b-083c9bdb61f8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_175739_780036_ED4AE1FF 
X-CRM114-Status: GOOD (  15.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 11 Sep 2021 20:45:38 PDT (-0700), rdunlap@infradead.org wrote:
> Add the ability to do randconfig build targets for both
> rv32 and rv64.
>
> Based on a similar patch by Michael Ellerman for PowerPC.
>
> Usage:
>   make ARCH=riscv rv32_randconfig
> or
>   make ARCH=riscv rv64_randconfig
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
> v2: add missing S-o-b
>
>  arch/riscv/Makefile              |   10 ++++++++++
>  arch/riscv/configs/32-bit.config |    2 ++
>  arch/riscv/configs/64-bit.config |    2 ++
>  3 files changed, 14 insertions(+)
>
> --- linux-next-20210910.orig/arch/riscv/Makefile
> +++ linux-next-20210910/arch/riscv/Makefile
> @@ -141,3 +141,13 @@ install zinstall:
>
>  archclean:
>  	$(Q)$(MAKE) $(clean)=$(boot)
> +
> +PHONY += rv32_randconfig
> +rv32_randconfig:
> +	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/32-bit.config \
> +		-f $(srctree)/Makefile randconfig
> +
> +PHONY += rv64_randconfig
> +rv64_randconfig:
> +	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
> +		-f $(srctree)/Makefile randconfig
> --- /dev/null
> +++ linux-next-20210910/arch/riscv/configs/32-bit.config
> @@ -0,0 +1,2 @@
> +CONFIG_ARCH_RV32I=y
> +CONFIG_32BIT=y
> --- /dev/null
> +++ linux-next-20210910/arch/riscv/configs/64-bit.config
> @@ -0,0 +1,2 @@
> +CONFIG_ARCH_RV64I=y
> +CONFIG_64BIT=y

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
