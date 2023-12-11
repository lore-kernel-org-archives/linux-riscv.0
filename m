Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C6C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSWqcUSx4nNUh3A4hGfGXlf4Sf3Pc6rv2r/M9v6Ik6Q=; b=fcAdffCnxcJGKl
	Eet3JJvwR2fsJDWhcq6Kr9+4uTO+DsNfAWdwrn2nb7n2srUU56d/L4FEL6ZOkEWkVEMfkW2DwiK4F
	SpTrLlx4G+L8rnAqFC1gLt8t2QXY+qNIttJqqs3o9C+z30pxspodrkhFcPm+rixf1aIHC2+9hkF7N
	SoJIbq/qhX98ZLzXm9ViPIokYrQU+1Kqivx2ab74+oMsmQgKWTL8AeBbolJn+2AK3sOmy6+7Ka2Yr
	mv9z+hP79+xKUx4JFhWFST+ek0fhznDFrsTU342RIQZIutmPb6fk0u+rAV9LqgmPOolT9QMr9wrEP
	b6UFJ/iDL6LOapOFYONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCilL-005dE8-37;
	Mon, 11 Dec 2023 16:04:07 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCilJ-005dCw-1o;
	Mon, 11 Dec 2023 16:04:05 +0000
Date: Mon, 11 Dec 2023 08:04:05 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 02/12] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZXcy9YUWrC586RX+@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-3-samuel.holland@sifive.com>
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

> --- /dev/null
> +++ b/arch/arm/include/asm/fpu.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * linux/arch/arm/include/asm/fpu.h

Please don't add the file name to top of the file comments.  It serves
no purpose and easily gets out of date.

Except for that:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
