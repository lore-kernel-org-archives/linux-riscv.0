Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4215DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DhFNPqZrvRJduKG5a66yJWA5zx/i2iD1CMx9n33VrY=; b=g2t0tzyljnkXPP
	cJaPFicxMczCJ5HWvaWl0ApKPwze+CY6AdgqdUOtRIuny63b7JTrLENmrksmJBFaWvqf/BwQsYuji
	j74y3vbjdmIB4ltGBCEGvhtjRtf/52io7yYn8XH81o/pPJDz/Bu/geDnBw7tKbBEbpstWoPYtfGnv
	u9pjD5yldyoK8EeKfHZK1fyWeUbwgTExzHcafx9mrWprxPVItwxzWx72Ghou1ky3TAb/E0fJoWDq1
	iC47GNj/I+k5eawsEcMoA7qGZyCgeaBkshMJR2kCEtytar2t7l46muw0F4MVhL2CQqzLvcSAoU62M
	vqzVkwRCGZunrsfq27dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCisR-005gTb-20;
	Mon, 11 Dec 2023 16:11:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCisO-005gRx-1R;
	Mon, 11 Dec 2023 16:11:24 +0000
Date: Mon, 11 Dec 2023 08:11:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 09/12] riscv: Add support for kernel-mode FPU
Message-ID: <ZXc0rAdi7Vo8nbS8@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-10-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-10-samuel.holland@sifive.com>
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

> +#ifdef __riscv_f
> +
> +#define kernel_fpu_begin() \
> +	static_assert(false, "floating-point code must use a separate translation unit")
> +#define kernel_fpu_end() kernel_fpu_begin()
> +
> +#else
> +
> +void kernel_fpu_begin(void);
> +void kernel_fpu_end(void);
> +
> +#endif

I'll assume this is related to trick that places code in a separate
translation unit, but I fail to understand it.  Can you add a comment
explaining it?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
