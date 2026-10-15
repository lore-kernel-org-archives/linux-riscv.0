Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC88ECC6B38
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0DcwyhE5oBozvEjcd29wIaPT1cqZHri105Rrei/2Fw=; b=PeJWUkMzkmiwM2
	rJh1eyFUvnb14ikee2KbuMGiBI/6gDQ9b7XFSYj5ahD4fDdJeDe4zLgq/fFbG2zwPy4ylYmoHBhxl
	lfFFEQDCHBAu5fkHDE8XMZoPWvHZo7YWVe5SI9sXcsVSjjutdb3guUnR4D+mmYuHQtHIdMkbu3pe3
	xTPfTita5UODnC6Au8MtkTfyTEgU+PduDVM9sQFhvh1yNOLVfcPAGqw89r2AG8ylxbyEcoa735fyk
	f0eUtCP5hgI+a5nrtXsW1+KSb8EVsWQfZT2IdU8UtwCqTAGQD+gsQXPO0s//mMy0H1/KGnmhophRu
	BWSmyqJNDqTdpbeWLsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHT3Z-00000001RIB-2Erh;
	Thu, 15 Oct 2026 21:32:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHT3Y-00000001RHx-3PmR
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 21:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E28542DEB;
	Thu, 15 Oct 2026 21:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391AE1F000C4;
	Thu, 15 Oct 2026 21:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099928;
	bh=YE1MtNRwJfcTNyZjDrwuFEDJnSop9M2Es5vzVnWdHI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iLgi3bNjvKJoF3GRUGVzHWzOUI0bgKHXJbxWDI2ybTFrqfss4Y7/mGhyMmOTCOLn2
	 Mnyz8OBcO6JOBY/yG9jMZhH03LeO0T75ASpV9KKDbtI/s7CcF2TBlGeTp9xNlUzaTH
	 WDsi/sUYzS4bbT4DPhBKS+xmVQ6lCgGomh8gSWtmRww7PPLZz/GpM3pZLL+oG87xAA
	 6ey2igX/EiXfHGuUgKhzMjHyaI0qB2hMGbv+HsxJjwk1gZtk1pEwrEUsz/GXP31OA0
	 t/gU9utCOxn4i9a46dTtNbNP1Ork6ykRdeC+dML4l5vMCz4x7G8EGzDQ1d6PPcWBtR
	 sd++OEkDTX3Kw==
From: Thomas Gleixner <tglx@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
In-Reply-To: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 23:32:04 +0200
Message-ID: <871p9qejl7.ffs@fw13>
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
> Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
> host IMSIC target into one contiguous MSI IOVA range. MSI message
> composition then uses the target CPU's position within that range.
>
> Build an IMSIC physical address array indexed by logical CPU.
> Require every possible CPU to have an initialized IMSIC page before
> publishing the array. This preserves physical address zero as a valid
> target and guarantees the array has num_possible_cpus() entries.
>
> The array size and each target's index can therefore be derived
> directly, without storing duplicate count or per-CPU index metadata.
>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Acked-by: Thomas Gleixner <tglx@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
