Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E20C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jetaW4YUkR8UoOsyB55wrq3Kz+qUoBVl9apa5FaTEc=; b=4rZemi7CCvLQ63
	WczzZVMps1FcRE6eRqrSzhpt+9GPY2yKYe1/iZ6X8+Cyc7Dr3m9djpj8ncJQWYGmzJSMcJxZdlZdJ
	dA245xy8Rm5T7Ng1Yaop4OsvXTOY0r+k/NvFLJ2CumAfMzgBTha/FR/keWzKpzEML96+1D6GH+1gc
	7oVQExX7l/7jvIIIFhIaYKlvGqmON1H5v6zuv0onjbXLq/A80r05eANp8DDyazN5obxyLNMZqikTC
	PQQx9TP5gZmNln2/hYEzEpfG9Y15n8SKW/QnCWh1vs8MfMvLKApXBqikoQiqHlzA62Hso4W5J3BEH
	l81UjkNNDwHlx8mCnaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCioT-005eem-1i;
	Mon, 11 Dec 2023 16:07:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCioR-005edf-1j;
	Mon, 11 Dec 2023 16:07:19 +0000
Date: Mon, 11 Dec 2023 08:07:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Message-ID: <ZXczty+Y6dTDL4Xi@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-6-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-6-samuel.holland@sifive.com>
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

> +CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)

Btw, do we even really need the extra variables for compiler flags
to remove?  Don't gcc/clang options work so that if you add a
no-prefixed version of the option later it transparently gets removed?

Except for that:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
