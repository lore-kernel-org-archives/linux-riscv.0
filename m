Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9F1C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 20:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048B5222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 20:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1v1q5qa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfKA6/6/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048B5222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruiN2lYnPgHwOUjo6pRsvoWqPux/leqhMjgpUZZjj4w=; b=Z1v1q5qaoc08X7
	ID/05f/fu6Z3n7Yp5bcHiWcwL/uU85LhyAoz7kBPzkfQSzk2I8ALgkPnJM/OqRGQ61owXvUvMvcMq
	NMByRGjtnEaLWs3L9t7texX34s3hyqMkIbrRNSssAicgvwKRY/+HldutyBMgji5Mgs2MFz4Z6JwAw
	dLbDH5jvLW8DrCYanxEqqHS5VNJmF1N92hNpXWpg7YATz+8faPakTvBXBhXum4joMcUxW3VTS2+OZ
	XyD8cLDwjv5+bjSn7tVpuTbOg374PeZ0k8OgqDoD/QAp2Fyfv5Ehv3F9YHSOPoRchKPlYN6rbFfz8
	0JUEp3f2A05IbvTJDqGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gterJ-0007Fw-6X; Tue, 12 Feb 2019 20:40:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gter6-00075O-E2; Tue, 12 Feb 2019 20:40:37 +0000
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0EC6222C7;
 Tue, 12 Feb 2019 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550004036;
 bh=vjjmB3q5kxynqTfBl4fMXnJzLtFOe/CWMrbnP/HvubI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QfKA6/6/PzAH/1DTX5KyhQZjfr82FQxTeLuAkVGfvNPh0B5ZeDW8YW0zkx2oYKF8x
 js6uiZtrNajIS0RO2RaoERpXiSG8LLpOW2CofF7tRM0Ar6Gkfs/XYQaSDu8gGWSYkl
 fig/6HVAkxpsdIZs+cf77ZjUfMX0mfPMDlK+pctE=
Received: by mail-qk1-f177.google.com with SMTP id x9so52029qkf.0;
 Tue, 12 Feb 2019 12:40:35 -0800 (PST)
X-Gm-Message-State: AHQUAualwy1abbCu1W6ck9JyzxPbqwaHVpi9VvnHGQkGz2ezzYdA7541
 IAhkxNKuB7a0vIiK+j2kv2aL82WkyTgq4s9fhw==
X-Google-Smtp-Source: AHgI3IYz2gzbmamNNYONyTiDfE0zREh3E/QtpTpAvvx3glvEe3X+ZYzmIZ6HhCz+z+2Heg/0CZQUYhYHO3QCjAjIpjc=
X-Received: by 2002:a37:5686:: with SMTP id k128mr3834629qkb.29.1550004035085; 
 Tue, 12 Feb 2019 12:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
In-Reply-To: <20190211133554.30055-7-hch@lst.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Feb 2019 14:40:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL+LiJTF5kZz2hXGbQcH+D4U0jAQE376VSUVMQmdg=XFA@mail.gmail.com>
Message-ID: <CAL_JsqL+LiJTF5kZz2hXGbQcH+D4U0jAQE376VSUVMQmdg=XFA@mail.gmail.com>
Subject: Re: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_124036_505224_670AB65A 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 SH-Linux <linux-sh@vger.kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-riscv@lists.infradead.org, arcml <linux-snps-arc@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 11, 2019 at 7:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
> This API is primarily used through DT entries, but two architectures
> and two drivers call it directly.  So instead of selecting the config
> symbol for random architectures pull it in implicitly for the actual
> users.  Also rename the Kconfig option to describe the feature better.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arc/Kconfig            | 1 -
>  arch/arm/Kconfig            | 2 +-
>  arch/arm64/Kconfig          | 1 -
>  arch/csky/Kconfig           | 1 -
>  arch/mips/Kconfig           | 1 -
>  arch/riscv/Kconfig          | 1 -
>  arch/sh/Kconfig             | 2 +-
>  arch/unicore32/Kconfig      | 1 -
>  arch/x86/Kconfig            | 1 -
>  drivers/mfd/Kconfig         | 2 ++
>  drivers/of/Kconfig          | 3 ++-
>  include/linux/device.h      | 2 +-
>  include/linux/dma-mapping.h | 8 ++++----
>  kernel/dma/Kconfig          | 2 +-
>  kernel/dma/Makefile         | 2 +-
>  15 files changed, 13 insertions(+), 17 deletions(-)

> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 3607fd2810e4..f8c66a9472a4 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -43,6 +43,7 @@ config OF_FLATTREE
>
>  config OF_EARLY_FLATTREE
>         bool
> +       select DMA_DECLARE_COHERENT

Is selecting DMA_DECLARE_COHERENT okay on UML? We run the unittests with UML.

Maybe we should just get rid of OF_RESERVED_MEM. If we support booting
from DT, then it should always be enabled anyways.

>         select OF_FLATTREE
>
>  config OF_PROMTREE
> @@ -83,7 +84,7 @@ config OF_MDIO
>  config OF_RESERVED_MEM
>         bool
>         depends on OF_EARLY_FLATTREE
> -       default y if HAVE_GENERIC_DMA_COHERENT || DMA_CMA
> +       default y if DMA_DECLARE_COHERENT || DMA_CMA
>
>  config OF_RESOLVE
>         bool

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
