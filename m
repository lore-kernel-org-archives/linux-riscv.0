Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AAD606A336
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNSaAlCL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=N948NK5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QcFF1fKCiS+FH2/CfsOczltb+tTALrefia8c6m+4/KM=; b=hNSaAlCLKyP6PR53zdzElK7RnT
	WOakmBEdU4U3ZRDkbaYi5AIL01/8L77HFzywexTEMkuQkqbvtdxhmLTfN7VUBwnvuEfmF0t03EshV
	sYVcGUpbb5zpldgJ4F2x9VpjCYDGQCZ+Jb7DplqesfYRcDSFn5SllPpS6fwuQSy0BOiKaFRyff/6d
	baVHNO4dFpRfrRu9slLiTmRxlDIomFXCwapvWbkaOAZ674QEiUMf3BzIdyh/K3doe6SPloOmODnJS
	c7r0mc9udQ3qFpzfaXLjYvWYyRCs0K7OI6goiWUp6VbXi7yvU60rxU+p3lBpqoez3PIO+efNyKWbg
	9ZlgMxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQx-00000007vXB-0kew;
	Tue, 24 Nov 2026 21:52:15 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQt-00000007vUT-3mD4
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 21:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=53YDCo8QbzEKoi/A/PIEZnOPiWUNZZ8Q6v9cpVBdB0s=; b=N948NK5pZvBX3x91epD2ql/GVd
	4YHUMkpHAWjqwrAyMEje7gJTTiSVN43JdM0A5d64Ij/1sN9hN0EhmEkqzmcP3SHyHjRN8mYOujEZG
	sI1N4EJCqYKtfxNOLW5j1L6uRvB+lKIS0DnTgVi8/ww5wEaqCztJxOGCBuGiDeliou1JXG33MdIt2
	LK2mw4BytOVhEjABZZmJV2gruVAjD2q3R8ckCCuWobtM4SXHsPwAw9YzsxpjipYh/eYWePSA4MzYK
	hCVdv7leEUjimaWBczAP00TfwWfQSq1GmHPtpeF6AJAC9fOvT6kHX6ppVM91a6uCVFvYFDkabMLhy
	8ozfFvlw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVyQk-00000008zDA-12Zo;
	Tue, 24 Nov 2026 22:52:02 +0100
Date: Tue, 24 Nov 2026 22:52:01 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <awYHAU239WMaqVKk@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261122173810.2409146-3-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135211_958905_9388EF4F 
X-CRM114-Status: GOOD (  11.15  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jiayu,

On 2026-11-23 01:38, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
> 
> Reload the shadows during probe and cache the data for subsequent reads.
> Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> other banks.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/nvmem/Kconfig             |  11 ++
>  drivers/nvmem/Makefile            |   1 +
>  drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
>  4 files changed, 218 insertions(+)
>  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

Thanks for this new version. I confirm the nvmem format is now much more 
intelligible. The content for banks 0 and 7 matches what is reported by 
the vendor driver under Bianbu. Therefore:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
