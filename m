Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC143606A33A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmjdCwEw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kY6FsRmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fcVqoLuSDTw8U4KSLbQCP76uYSpTXr3yUw3TX2n3GSg=; b=KmjdCwEw8JJnAvuTcjK0T4gvmz
	M+v+6zPJzZL38iJI9kdYPNTyyBwFbXvSpqGGBM+VoSBD9DhKPKIY6gtT8Lm79DsNDme8cX6YN4jQO
	6PnTUyOgzseASppgMfsGdQXwfKTM6YDx1ExYaf6fkO2HM4FxD7F1lXrhbtbYDRxsk7RfhgiUnvkaZ
	iDo4f+Aeqc4aJ6TujBJ7K8trP9ihopCbGKZVhIUvveXDS6HzfA1xOdN8tUbwCvY9FSh6eTBDWOYbB
	SuVZilRZs/5yR3Di9gC0/tH/qA9Dxpzw9gMek0EHLUNn0kJHxAFxA8pgOZNAUd1/T6MY95Pyc0mrE
	3ZcKp5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2oX-0000000F2nT-1cgE;
	Sat, 14 Nov 2026 01:44:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2oV-0000000F2kp-2kA7
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 01:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA3E261CE6;
	Sat, 14 Nov 2026 01:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F6C1F000C5;
	Sat, 14 Nov 2026 01:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794620657;
	bh=ze++7aKWR2T/skYTjKdocWOwvTMkchcenQAZ9t6jBy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kY6FsRmRUmQrIK7GUlrIO51EsyjeDIn0PGOrBoHwzK+J5wgN0I5tTqJwZRTjE8J4/
	 VxS/F99U8CuYVNlkUY2+Ly8M8L80ZJCWEFfig+EEsRtd6HWutqJs2WgMO8VtQfSMtG
	 Px+/kxLRur9rBAdwyyG3Ff6Epqq5rwIL6SE8LOGjA8bN3wSsVGqhiJQO1qpHNvifc4
	 us8C2Vv8+TI9uddSSBjSwD7xtHp4UniwK0HAG5vwSlEfsCC+EHHx2JIgJANtG0Ii8X
	 uqGBLQeDddJspxuoO6v7OcIAc3jmchGTHaZ3zgRO0Ru7oQzgza9fswH8JvksVTWWET
	 rxUdYCLY9hW8A==
Date: Sat, 14 Nov 2026 01:44:14 +0000
From: Yixun Lan <dlan@kernel.org>
To: Vlad Banea <montrealtango@gmail.com>
Cc: troy.mitchell@linux.spacemit.com, wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com, jyc0019@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own
 DMA window
Message-ID: <20261114014414-GKA99639@kernel.org>
References: <20261113023158.2872492-1-montrealtango@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113023158.2872492-1-montrealtango@gmail.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vlad Banea,

On 21:31 Thu 12 Nov     , Vlad Banea wrote:
> On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
> 0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
> upstream an inbound access that falls inside its own memory window, so
> dma-ranges must skip each port's own outbound window; the other ports'
> windows reach memory.
> 
> The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
> which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
> every port. Give each port its own bus that skips only its own window.
> On boards with more than 2 GB of RAM, each port can then reach another
> 512-640 MB without SWIOTLB bouncing.
> 
> Signed-off-by: Vlad Banea <montrealtango@gmail.com>
> ---
> 
> Notes:
>     Changes in v2:
>     - describe the K1 PCIe address map instead of citing the vendor DT (Troy)
>     - "more than 2 GB" instead of 4 GB (Troy)
>     - drop the RFC tag
>     - RFC: https://lore.kernel.org/all/20261112015148.3911178-1-montrealtango@gmail.com/
>     
>     Tested on an OrangePi R2S (8 GB, RTL8125B on pcie1 and pcie2): SWIOTLB
>     use under load went from up to 87 slots to none.
> 
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
