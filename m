Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69AEEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 19:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aJEc84P+SSjcNqj+ChWwrUWUXZgP6LkEbtxcM9bTSSQ=; b=xTpuME8dcvSvZjX7ddaz4EZLX6
	77G2f7zPr5aXVMUqLea7/BebDzrjYCzMBLbnZ8uNpHtUUsNLh7medICxIaSGq5jHzQHK7w789Z/7X
	9cHCxZCJamIwoih4MS4pfpq35gnknjbMqEJrnVsTX2zH1/K3KccibUJoi1C96TLSLMi01r0MAemIT
	KRhKYR80CvVakwUd7lJM/kqAAXD7evuGzzJGiAif8LjEX/Xs443RwvdFuWlpMXSmhOEWL89RtZox9
	u21HB3mTrs+/0nt/WJ+d/npZU+YQAwcuod49xJN2v/XNTKCf3ndgIz+U6ZEDSYgN8cdGAQygHCIjx
	PAwEPiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC3wy-00FbiV-2b;
	Wed, 21 Jun 2023 19:57:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC3wv-00Fbhf-15
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 19:57:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b543f7e53aso40810105ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687377424; x=1689969424;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/oCsBAha5TlkusYS9TJvUJvw6Xp0GQ+FaZxtlvSIy8=;
        b=31NOzH8T0+2VDO2CYEqSKyHjSx4gVZR51gmxRjnAqCA52GzLUvZWT/t9nYLXZAL+qi
         ywsalk0MVUxrtPZPbbn3QEezt/ckSPGzZQKVLq90m3dtRiguXqvJzIVfdy4tU1YDwyKp
         EGC+ePLAG5XxzTRYBcm0iLsvYjTF/QX3rxkUHYAVSS95DEznN25qtG1xtNMXwA9rpc7y
         hkwKF7JdRkoOwg6MmaahIrHH9SPz4ePLRXSkSCVQpWYyj6gHvwGtvOZQ6p5AMUsan8H5
         Jvsq+vmqVAzVHoxpXomDTyNqb3a5WmGugRiDjm1+Q1Qi0xBlQBkYg2FWXbmEbAi+namd
         d1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687377424; x=1689969424;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/oCsBAha5TlkusYS9TJvUJvw6Xp0GQ+FaZxtlvSIy8=;
        b=X4xlOkmGNi5osqj4EC28ctnV1Viv3ypIu5C97tF82Pd/UBgR0n7u2S4MWT+jXPzEs7
         aiFQj1ocDYng/EB4rGj64YtezWneLzOh+07Wk91GQ07G2BFa48OP4wbGNp2nryAv0/Q3
         UyQwii8cBy3PkDwRGjVn7b0oJVSLDgCg1mpaSO/BW+ZuQ50s9aZwCHb0oKjW2lRInYcc
         pEeDitnmafajJTlevvR9t9fqIQ8bTE6gN2fd9Eiq+XalASJJ5Iljbhc95ywKpj1tHc/B
         JS2f9NxzN3OUy6BhP66ackBIYjRQIwXqUt+nKUn7euuFkPdsYHJ4HZLQ8QYGakwBXVQj
         9wMg==
X-Gm-Message-State: AC+VfDy/xSCOrgdD8QtSwhzQf2IvrIv+sdQYNnUCyAKkw9Mry92HYrol
	K6GXHcy+JLvaJmHlTEbltL7epjRsv5n7yerw+2Y=
X-Google-Smtp-Source: ACHHUZ4PlOcgGzuvd/vrGBXWSweqjzis58nvu5gGAEW7a+L7+rBFMlDT/k/NAs79bhYMEn3+FtkAjw==
X-Received: by 2002:a17:902:6b45:b0:1ac:84dd:6d1f with SMTP id g5-20020a1709026b4500b001ac84dd6d1fmr14999678plt.1.1687377423613;
        Wed, 21 Jun 2023 12:57:03 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c10d00b0019aaab3f9d7sm3860360pli.113.2023.06.21.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 12:57:02 -0700 (PDT)
Date: Wed, 21 Jun 2023 12:57:02 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 12:56:23 PDT (-0700)
Subject: Re: [PATCH v1] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
In-Reply-To: <20230621-panorama-stuffing-f24b26546972@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, rdunlap@infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, jszhang@kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2c7ad1c9-cba1-4501-ae38-0ffb3d5bf487@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_125705_370771_5D6809F8 
X-CRM114-Status: GOOD (  17.26  )
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

On Wed, 21 Jun 2023 12:00:31 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Randy reported build errors in linux-next where XIP_KERNEL was enabled.
> ARCH_THEAD requires alternatives to support the non-standard ISA
> extensions used by the THEAD cores, which are mutually exclusive with
> XIP kernels. Clone the dependency list from the Allwinner entry, since
> Allwinner's D1 uses T-Head cores with the same non-standard extensions.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Link: https://lore.kernel.org/all/ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org/
> Fixes: da47ce003963 ("riscv: Add the T-HEAD SoC family Kconfig option")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Jisheng Zhang <jszhang@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig.socs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index ce10a38dff37..6833d01e2e70 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -43,6 +43,7 @@ config ARCH_SUNXI
>
>  config ARCH_THEAD
>  	bool "T-HEAD RISC-V SoCs"
> +	depends on MMU && !XIP_KERNEL
>  	select ERRATA_THEAD
>  	help
>  	  This enables support for the RISC-V based T-HEAD SoCs.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I don't have an ARCH_THEAD, though, so not sure where this is aimed at.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
