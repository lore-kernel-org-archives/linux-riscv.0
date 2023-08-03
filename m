Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA99C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uybrKCiD1BD0F5yHbSXpH4lBh3u26bNRnkdOsPZ78Vs=; b=IrHgXUeaz/VjM2
	FYUW3Uf9RFsJg/HNY0UxznY+o2GMJ217616XfDWIejSVe9L2sn118t1/z9K+gaxLGjTxQAj94sghg
	VWLLehYhnhI0t8xYpwSBwjtMFWbXC2DhcnulFBmNkYJ079HjRF31IXeD6Z7HD9iMUQyIra+2QT1Vi
	PGBPVk03tW8hMAuCpRyqsT09VOON0Y17sKIJx0p062+XvA8e1/em/++uDsklo7JXjnzAxg3Q7IaIJ
	vyhZ1I18Gp87Peg3IxyVvXID4QQVNnv7PFzqDL8GOvW5SUhsi1Vpf1KyeYKcygT+rqWGrZzz2qtRm
	ai2fs6FGmXzscf3CaPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYfk-009DGx-2B;
	Thu, 03 Aug 2023 13:47:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYaZ-0098wv-2h
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 13:42:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B66C461D96
	for <linux-riscv@lists.infradead.org>; Thu,  3 Aug 2023 13:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E98C433D9
	for <linux-riscv@lists.infradead.org>; Thu,  3 Aug 2023 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691070122;
	bh=r4s3ur9QdCGpsgh3oEwBZT6hFanHdwrcpg4wERGLJmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HZ1l5Ayx8C7Zp/tulDNSVBYkZJWqK57C3x6l59CjA3yonV/xGx38ic7sMk0FEbL1I
	 7r+FAQR3CkGmag1uOdZJupMitc5su95trmpQq+hg4gOWYcLn7aG45g7fcQv9DiNlFc
	 b/VYhdSnihf/wX9znQuY2PwkJDBsdy54DsTcrExL4JSslp9PDasgfhMSyLwbO/jfRk
	 ePcLdGiZ0IFcpZvNUboF4S48ZQnvT7uP/WO4smdysBrHfDkzCnPJBWe3B77Cwiji8H
	 wADXLQkVWoPA0PcsdSlZwSD4/GXAUlgYC6snnw/FOSRpfrfiJLJMTtb9hUnPJP9VO9
	 D9UTD9IQM6Khg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso14726001fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 06:42:01 -0700 (PDT)
X-Gm-Message-State: ABy/qLbCc/Gbp9AsPxGrKR5L+LMchFN+XaNGve8+kvQUUCQMKQZw1UFd
	+bdSnEInSrVms15AR2ItPUxCC+0t3MSulcfX010=
X-Google-Smtp-Source: APBJJlHpRNTBRSJY8f35QI0ZpCnxRMpG0BXG7sw1yanHmNpSx4z+ia17IG/byRlJSLtHTAAVz0fbvlrffdUyAKzLM0k=
X-Received: by 2002:a05:651c:106:b0:2b6:ded8:6fc1 with SMTP id
 a6-20020a05651c010600b002b6ded86fc1mr7321871ljb.25.1691070119999; Thu, 03 Aug
 2023 06:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230803055611.2343011-1-xiao.w.wang@intel.com>
In-Reply-To: <20230803055611.2343011-1-xiao.w.wang@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Aug 2023 15:41:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXECv+JU-ahvWENk4XRrjxkfBmWoWHhOSdwGpfxC1LVLkg@mail.gmail.com>
Message-ID: <CAMj1kXECv+JU-ahvWENk4XRrjxkfBmWoWHhOSdwGpfxC1LVLkg@mail.gmail.com>
Subject: Re: [PATCH] efi/riscv: libstub: Fix comment about absolute relocation
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_064203_943945_919B6DBE 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu, 3 Aug 2023 at 07:48, Xiao Wang <xiao.w.wang@intel.com> wrote:
>
> We don't want absolute symbols references in the stub, so fix the double
> negation in the comment.
>
> Fixes: d7071743db31 ("RISC-V: Add EFI stub support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>

Queued up in efi/next (without the cc stable)

Thanks,


> ---
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index b0f8c495c10f..ed6e8ebd89b4 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -146,7 +146,7 @@ STUBCOPY_RELOC-$(CONFIG_ARM64)      := R_AARCH64_ABS
>
>  # For RISC-V, we don't need anything special other than arm64. Keep all the
>  # symbols in .init section and make sure that no absolute symbols references
> -# doesn't exist.
> +# exist.
>  STUBCOPY_FLAGS-$(CONFIG_RISCV) += --prefix-alloc-sections=.init \
>                                    --prefix-symbols=__efistub_
>  STUBCOPY_RELOC-$(CONFIG_RISCV) := R_RISCV_HI20
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
