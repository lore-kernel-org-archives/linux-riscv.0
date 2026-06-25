Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B04CDE009
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LOcgrZr+5fZGSsRY7Y9+RbCbpOUX27GyUp+soC83nU=; b=CoXgGaXHE4oMQx
	ZEJd5OrLchqgA4m6fkQTWQH7F98ol+KNwh5IJlCSW9tupqEq2J+0BcaYrgtL6BxtlWibU57IlbFd3
	7cWBPIDLfNozyZfkDl8QUIblyBp8hvvHKgD8RRWAmuyrtTU1Nla1Nw/GpqmsxH14I8jkeF+oTdBUL
	D+Yv/FAxI8uHIlWBbTu5YQ/Ewftc/F9n9blnKSFvWrMFwDmB5i4NytN34R7dUYCZQTGPg/pkYkV1F
	xPNahNcloDNnilgXDS7OWTHKY7cLRMM+0ZjPtIljo52iJhkcxGHECh938SCTKZ50jr7o3PG7fEBav
	01jELoOwgG1JMiuUJEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcpSm-00000009j24-2vte;
	Thu, 25 Jun 2026 19:10:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcpSk-00000009j1X-2nyv
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 19:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E66760098;
	Thu, 25 Jun 2026 19:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DFE1F000E9;
	Thu, 25 Jun 2026 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782414609;
	bh=LyHwI89PwTTZzRxgq2rdQ5zV3fciS/lmKH9dk7gb0Q8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=dhkW32UrkT5rDdGocO9RtnOj1cYeB+4/hhudpM91GZ8p0UQrshZyyFnWwRA4TxZnk
	 /yN0pgLfyMbp1JWv0GkbLeeqbc9zkStPvfxpx5OYlt8ijUiB/mKbm2wNB9KfR/Bdls
	 DfGJis2oGwDXT1/1Z4iYEVIFaVunhyHVCf3OIWIIBL0YPHPyQpKepDfZGMvcRm19Rc
	 NvsduIZ2vaeech95Cw9qLS8SY49fPaY2n3oPNZdRcX50q5XvTVoguacBKFvr0ozwTu
	 wlaPIT/AIRZ9lD+A/Gu5Smnjt/UnRYF2UFbV0YNIoeN7blTiAh4q9+PI0G7GB5/KPA
	 z//+0sMmBEWsg==
Date: Thu, 25 Jun 2026 13:10:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: XianLiang Huang <huangxianliang@lanxincomputing.com>
cc: tjeznach@rivosinc.com, markus.elfring@web.de, joro@8bytes.org, 
    will@kernel.org, robin.murphy@arm.com, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] iommu/riscv: check pte null pointer before
 use
In-Reply-To: <20250807033252.1613-1-huangxianliang@lanxincomputing.com>
Message-ID: <4264ac5c-8968-24f7-4829-cfe30e8ac372@kernel.org>
References: <20250807033252.1613-1-huangxianliang@lanxincomputing.com>
MIME-Version: 1.0
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

Hi,

On Thu, 7 Aug 2025, XianLiang Huang wrote:

> The riscv_iommu_pte_fetch can return NULL when the provided iova is not
> yet mapped, the caller should check if the returned pointer is NULL or
> not, but riscv_iommu_iova_to_phys missed this, which will then lead to
> a kernel panic.
> 
> Check the pointer before using it to avoid the bug. Now, when
> iova_to_phys is called with an unmapped iova, the kernel will not crash
> here.
> 
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: XianLiang Huang <huangxianliang@lanxincomputing.com>

Going through some of the Patchwork backlog.  The code that this patch 
changes no longer appears to exist.  Care to take a look to see if 
something like this is still appropriate?

thanks,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
