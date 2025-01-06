Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E1DE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYXa20ItsgZDUkNxb1u/yx+8Z3xvKOgSjFOceVn5lKM=; b=OTy1Dz1UeMwx0D
	8NfzMGIcpFAoS4kXK5FZFTw7Z+AIpCcVxre60usoJqdkZEK1oEw7bToNdCCdfgifyC6jkvd8Sr4T+
	OTPKDc1KEn4TOBxzuSFT6uqS8OtO4hnVl9Ao5+RBSHq1LTYHybrQD863Hnxmcdu4bdDBngev7a3Yj
	2HXeCSy6wDTUfgTVAJfVC8bcfk0uk19w6HnkKSVjVLkLHw6mHqLPaEFMyv0S+TxuHAkL8NWARAX1t
	OLW0sO4NItzMF4IPNycz761+O1bUtAwT6WxI+gqKD+xDgUAWtdbg6S08WT74wFS1JB8zkw3t6kgWU
	D8F4rCsQH5p5XQCXS0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlSN-000000014Xs-2ny8;
	Mon, 06 Jan 2025 11:39:39 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlSL-000000014Wm-2tlu
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 11:39:39 +0000
Received: from 8bytes.org (p200300f6af348600d06e0009f19b6c7e.dip0.t-ipconnect.de [IPv6:2003:f6:af34:8600:d06e:9:f19b:6c7e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 11B072E0016;
	Mon,  6 Jan 2025 12:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736163576;
	bh=QcL3nPR2Mg+y/+kLjqriTIYQaCgkXcbBs07WimY99OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VySX6RNmaZv0h0Bz25vkMgMU8mIX6G8EU5a/NnGDDkUYj6AOlZW4u79UsRJwzqhG8
	 rSX90D2MelK07hDWBi/21+YHQlWyaf720+tEJcTTCm5TlPkFPo2SG0XkNEaqNz3JHg
	 dBQvPE9WYxLj9OmMhgh9XJH4RQQHx2IWNHszZV2CZ/hR5lxbdfeoekxBQZNHIsD1PU
	 LBeBVKpQBGpGQ6oKVLPIm/Zae8TY2nOwd2MkmP/c6uTIb24cwJMCz7hkeJxPIhV5hP
	 vgWZTBQ5/tGhUxirMIKEgHoAxMfg9s6hhUUvC2vNJpRa1PhkvzeqbRLpg4Ji5Hoy5E
	 vNAaln+sX8sbw==
Date: Mon, 6 Jan 2025 12:39:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: tjeznach@rivosinc.com, will@kernel.org, lihangjing@bytedance.com,
	xieyongji@bytedance.com, guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] riscv: iommu: Add shutdown callback for kexec
Message-ID: <Z3vA9go8BVbunBQZ@8bytes.org>
References: <20250103093220.38106-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103093220.38106-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_033937_954251_CF2C7CF5 
X-CRM114-Status: GOOD (  11.39  )
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

On Fri, Jan 03, 2025 at 05:32:18PM +0800, Xu Lu wrote:
> After kexec, the newly booted kernel can not initialize iommu driver
> successfully as no one resets iommu state before kexec.
> 
> This patch series supplies shutdown callback for iommu driver. The shutdown
> callback resets necessary registers so that newly booted kernel can pass
> riscv_iommu_init_check() after kexec.
> 
> Xu Lu (2):
>   iommu/riscv: Empty iommu queue before enabling it
>   iommu/riscv: Add shutdown function for iommu driver
> 
>  drivers/iommu/riscv/iommu-pci.c      |  8 ++++++++
>  drivers/iommu/riscv/iommu-platform.c |  6 ++++++
>  drivers/iommu/riscv/iommu.c          | 12 ++++++++++--
>  drivers/iommu/riscv/iommu.h          |  1 +
>  4 files changed, 25 insertions(+), 2 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
