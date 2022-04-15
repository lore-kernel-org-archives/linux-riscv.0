Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 08:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nG1xQYjk0aRibWjmuSaKVUmdgz/5tE/1+nV5GIdVDGU=; b=vZOwEBNhK2Xi3z
	J7LS+p4hCMekA5rvB4uR9PXk/5RSp6IOBjclZhFcHmU9P0M2w1B5qyBFkmOI6O8I+9PeUkxJzRryL
	IZj1tynQ+1OXidknTukLUoJi+A0iIzCyzzUdrQzFVaM/T2w686YBWhmCQqSjDRKFgldBJ7eDBrn5t
	w5InVtEPZmUaCj2i1nrKfYIURQV3djhK7/PwkBMwIaQH7nOIKjBT+hzuQNUBGcQkW5+3M0MuSSkr8
	bock1/7J34Sd36ingqPA4vFdIdtRKWjJz2qmZ/uUAoPExzO2HL9u1Zc30mKYJh3ZvpajJqIC2EVC+
	x4/wr04BYmrnxdj7qWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfHVW-009Kwp-0r; Fri, 15 Apr 2022 08:40:46 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfHVQ-009Kr5-Ly
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 08:40:42 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1nfHVK-003EZS-7x; Fri, 15 Apr 2022 18:40:36 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 15 Apr 2022 16:40:34 +0800
Date: Fri, 15 Apr 2022 16:40:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: conor.dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/1] hwrng: mpfs - add polarfire soc hwrng support
Message-ID: <Ylkvgo8Lcpmi09x1@gondor.apana.org.au>
References: <20220408100911.1638478-1-conor.dooley@microchip.com>
 <20220408100911.1638478-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408100911.1638478-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_014040_748460_57728B5D 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, Apr 08, 2022 at 10:09:12AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a driver to access the hardware random number generator on the
> Polarfire SoC. The hwrng can only be accessed via the system controller,
> so use the mailbox interface the system controller exposes to access the
> hwrng.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/char/hw_random/Kconfig    |  13 ++++
>  drivers/char/hw_random/Makefile   |   1 +
>  drivers/char/hw_random/mpfs-rng.c | 104 ++++++++++++++++++++++++++++++
>  3 files changed, 118 insertions(+)
>  create mode 100644 drivers/char/hw_random/mpfs-rng.c

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
