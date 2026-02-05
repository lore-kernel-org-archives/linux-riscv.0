Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AC3E9129A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIODK8BSd9Ua27h7TXiFF+NUltm6YoOEhuD2xk7QiFc=; b=DdM4VU/Tb6/O22
	BUe+w8VbUcA+RNebZ1O4eaxGEJwdF2eCZpTTymPr2MHmpsiNBfL67y9wZF6ai3Z/G4SrTsW8s0NRS
	g6NE0wnaOLwMjVSXCUwxzLTSJc179XTaXiev5+8tfQlVyQtR1EhvKmMS1B5VcHiBLbtQ3QmAQEKbU
	cJyBvHQ0/+QPWH3GrrqlEQOi1tzdV/sCPD/oot9w8Pp6FM2Nx3D/h7D7PiXhpo86ITQmVtr2c9JvC
	gF6a/XtMBGnznULbwmkY9Ab97KmpqAkFaNP/Qj1H46RCn61/z2OuR+9DCgSqWvMtnYES2AhhIuj2m
	YkkjDCY0zHJTZiBaKCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvdk-00000009hXw-02ux;
	Thu, 05 Feb 2026 09:27:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvdi-00000009hXf-0rwT
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8019A60122;
	Thu,  5 Feb 2026 09:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED0FC19425;
	Thu,  5 Feb 2026 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283625;
	bh=DGof05aujWusFuoWzBv6el8fSgip16IGW5oJeX1ExKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdQw+2exsqc2y6a5j3HsPv2q8hOgKtcMmpXoyzBRv9gybgYADL84pKQyPwQXl5Ziq
	 ekVSlvvYuyD3XW9enrFkC7gHDVgyKzLL9Cfh1b8uyrNWQspQcJhVmxF2Dw0zi5ylaY
	 wnOPXfp5ydKSKHe0d4MP98mOfLFsySm6A5+4whZ0rkS1+kg5lMEyUaaxK+ucjS9lCR
	 otrBjbkZOumLQepBXTo2iUC++vgWjd/tewgp0e9JLc/Xa/ojBCdioTp2HF9tRpLYhZ
	 6OTJdDEtBr1Z1dzblzGvhotp31urQyIcjSHIkY9NCQhJ+bzxRmpuZ1knRdtHCqkSik
	 iqvtsNlDaDMzw==
Date: Thu, 5 Feb 2026 10:27:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
Message-ID: <20260205-spiffy-bizarre-doberman-184d2b@quoll>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>
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

On Mon, Feb 02, 2026 at 01:46:50PM -0600, Anirudh Srinivasan wrote:
> diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tenstorrent/atlantis-prcm.h
> new file mode 100644
> index 000000000000..841516cbefd9
> --- /dev/null
> +++ b/include/soc/tenstorrent/atlantis-prcm.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Shared definitions for Atlantis PRCM Clock and Reset Drivers
> + *
> + * Copyright (c) 2026 Tenstorrent
> + */
> +#ifndef __SOC_ATLANTIS_PRCM_H__
> +#define __SOC_ATLANTIS_PRCM_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +struct atlantis_prcm_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};

Drop, there is no driver-wide user of this.

> +
> +static inline struct atlantis_prcm_adev *
> +to_atlantis_prcm_adev(struct auxiliary_device *adev)

Same here.

Do not add symbols to headers which nothing uses. These are private to
the driver so they must stay ONLY in the driver.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
