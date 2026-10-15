Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA1CC6B38
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QISrhEBQgWqMRGxrdb4wxbVeLzDws8kL7wwcCJ2eFA=; b=SqXE+fu+wbG0aD
	en13tiWZbRt3e/qUSZN6QEX1h+xJWuvPxeROq0nE82iADRrR1acEwZYRPTh8GXr2hR8oJzoNfwoYf
	STO/8y1+yh+lQl/qS2UV8VhvD3UckWifJaEYm1aooQGG8LQ9XOyUNXKir4Y7fsJdRyNMk+g/0cgZu
	r8BkIheh9OREhVYq2/My2b2My00giM3IKFIYQQaBiEybKMn0coVoqfICu3r8YktMnLoZdml2Mdytx
	Xrim2p1/VVnKJqaO22K9YIvMo9RbyvOglwAsdt5VreNTPz9SNpd7RYuyYWRKHcIFlvyCRMnTScbua
	SRDEB6f0tfbNXoriU78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHT3v-00000001RKv-2eeN;
	Thu, 15 Oct 2026 21:32:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHT3u-00000001RKT-25Gz
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 21:32:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9092060A74;
	Thu, 15 Oct 2026 21:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D5A1F000C4;
	Thu, 15 Oct 2026 21:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099949;
	bh=VJ/EuIc4xnUgkZ0HNak5wE/85JzasmjQLU9DlimpWik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BVC8jHQBBG50dSiZRBEFnjLvlb2bWBoXvw8jWKzK8mjUCK+k/z7dWqiWRjOZ44KKn
	 PudYgtsQQ+RpRKZeN34BhaK/XnD7xDHp0qGjkyuS+yAAIt9pxaNdH+PTv9TKAl4oGW
	 R3gJIEHqVVDwuH1+wN0Szi3PoyA0UtiTMbJVsusO2TgyrUPLh/YgNAM2zZSpypa2sB
	 VHUlFm0ZLe/yza94LaLmVnnzB5m4zF8TwqngdsmAzvOUsTw0do4vQLMXZtKjlkdgdX
	 Ziq6VW63idGionqiq/u7CSrzyRqxixu5kfD4hZsalXoNy/WVCr/VZM5aQnfnZGaNWA
	 uVhgxMAXlFTKg==
From: Thomas Gleixner <tglx@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 11/16] irqchip/riscv-imsic: Support IOMMU MSI address
 lists
In-Reply-To: <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 23:32:26 +0200
Message-ID: <87y0byd505.ffs@fw13>
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

On Fri, Sep 25 2026 at 17:16, Andrew Jones wrote:
> RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
> target into one contiguous IOVA range. MSI message composition therefore
> needs each target's position within that range.
>
> Prepare the complete IMSIC address list while allocating an IRQ. The
> list is guaranteed to exist after IMSIC state initialization. The IOMMU
> backend maps the pages and caches the contiguous base IOVA in the MSI
> descriptor when translation is needed.
>
> When the descriptor has an IOMMU MSI mapping, use the selected logical
> CPU directly as the page index within the IOVA range. Use the same path
> for initial composition and affinity updates. A zero iommu_msi_shift
> means no MSI address translation is required, so keep physical messages.
>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Acked-by: Thomas Gleixner <tglx@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
