Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A46606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMS/a9on;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=Vlnj07HE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FebPvCY1htfgA6bUU0Qg1OUVlZ7tv5w8O/RR0Ok41lM=; b=wMS/a9on6IGP4AahkbE4QZVmsJ
	wPtcyPC1lsiqV0A601y4UoUXE8r8E/kSdvOcvCTv/sUVS4QPD35elh9yVeWTeK+8EUIYDX0ds57Xw
	5NWT2zHJMry4JgBMMMP+HUtWkLqHEGdkEOPwZSeC4T/PaBMboJoL1pR415ZFBJKkIFO69CtspSiZf
	aixPYofnsZMD0LjX2H+Xsw7b1j7Ay9n4tchVy9jpwRzkUYDDgH02oPKBz59Bk5yNUl8Nk9ze8ppiQ
	ingb8fxJ+z7NQZSFwOs1o+mLrYa5pTRCPNiql5B+QihOaDqTngegr60cIdk32Mu6jyJacBl7DCErK
	4O7QEqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQRC-000000075FO-1WJw;
	Tue, 17 Nov 2026 21:09:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQR9-000000075F2-1xqa
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=EtVhHyW7aHGIibxC4T0ib9PS9njKICVdDDhJxL38oGw=; b=Vlnj07HEQZhfE7IRgLQCX9skMn
	aJo6gXGLWOXucwKVPXL+859PoLGmk3foGjFfxnO8DOsJwUwibVcHvztSN8qlaLX+FpcxO5D6b/2r1
	lLmGmArVKunrLHuTyPyWMRe4h4Bg3L1llAajMlW189OED1+K7IZxsZ3NqnjDW1mXfg8eeOVtwPj7z
	0T8S1UCkvWiix5HCGozpHyQr2GgmGHbkJhieCNuv5wA2bCZdfFNUCuUwO+8SyrU4esccjciDyGrsS
	geSAbwPnRIFdSiXnOD+f5PwYrKmV2o/w4EqZ3621bXuUK1FWVYWBTSL5s4kAtNz1no4482vu+ybVd
	n9WnZ2YQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTQQz-0000000GYFB-3DTt;
	Tue, 17 Nov 2026 22:09:45 +0100
Date: Tue, 17 Nov 2026 22:09:45 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <avzCmVhf8tl6hi_B@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116075423.1519438-3-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130955_538127_E4DFFEBE 
X-CRM114-Status: GOOD (  17.40  )
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

Hi,

On 2026-11-16 15:54, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
> 
> Keep the root key and SSK registers outside the exposed bank ranges.
> 
> FUSE_READY reports completion of a software-triggered reload. Trigger a
> reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> snapshot. Fail probe if the reload times out.
> 
> Snapshot the shadow registers with aligned 32-bit reads and expose the
> data in little-endian order at controller-relative offsets. Serve reads
> from the snapshot and use keepouts for the remaining register ranges.
> 
> Enable the AES_WTM clock only while accessing the hardware. Leave its
> shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/nvmem/Kconfig             |  11 ++
>  drivers/nvmem/Makefile            |   1 +
>  drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
>  4 files changed, 212 insertions(+)
>  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

I have been looking at the code with more details. Is there any reason 
to "expose" the whole 1024-byte efuse address space in the nvmem layout 
(of course with some masking) as opposed to the 16 banks x 32 bytes = 
4096 bits only (still with masking)?

I find strange that user space has to know the address of bank 0 or bank 
7 instead of just looking respectively at addresses 0x000 and 0x0e0.

As the layout exposed to user space also includes status or control 
registers (although masked), this might makes difficult to support a 
newer version of the efuse controller which have a similar data layout, 
but slightly different registers colliding with the bank data.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
