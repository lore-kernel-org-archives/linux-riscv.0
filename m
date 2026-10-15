Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8BDCCA462
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H92iyCEBZwkIHCCfQyyHBeXjPeW5iol8M83Nmlt5mfE=; b=wEWmoujY9Vvfqv
	UzcbSJNxdPrbBY1gA8QV79Sqds01fTxvgmoFBY9nNrdFlPIm4n9jDiEZ7qmvZ+5DdVggTgqKbKazY
	6kZPuSZ86meAphNwF5r2t1QP3SB/hycODn5BtzeBJhzvna/Mn+TXB9P0jyhMpuMpne/Wc6wbC6uDZ
	1kv44mAZcMPNBIQa42w6wOymqqAMdFAjEjL/vBqCSZkBt0jvh3pylnu8RkqjiCkpeUcFBTcj6sBTK
	+MS2pL/dOZjz56LDsdRkTdZECqUkXa4+o4sOnMxV1Zwg1Qt3IVr9rcseqPKKlEN5A7CGwk2rhcuOz
	dFsvi+AOjnghbfMSzY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHT4o-00000001RVc-3GGw;
	Thu, 15 Oct 2026 21:33:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHT4n-00000001RVL-0hbe
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 21:33:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6B2940E5B;
	Thu, 15 Oct 2026 21:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350211F000C4;
	Thu, 15 Oct 2026 21:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792100004;
	bh=5Yx23oGPRdic9RmKMw6Xussx9kuO7CpNoC42ywopOTk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FSFGEXE5laPox3hCH6IqswvdbITnxGACV/RzYNIT82YqU7+mwCqbfXWM6nyNV8ChN
	 uYYrsWU7zPqbSyg7Dsb6xLYfh0GuwQo4UzIYzcBeKfzORePtL0vGdKkCfjORbCam6d
	 CxAKVqWLDU/iqj1ilpBNnnqzWLkSckWIiqz2ChAQQDGztHSKs/9xpSHtChY65Jdo4e
	 5d3nUjIJ4PthlR3iI66AtxbQqeOjoeHH3T0VMZ/62jBNgskV/yI0hSgBXkzC1QFPhD
	 v8wV82T72EeyzUEy92xxVApPJn6B35Ptn1DxTcOVbBDwSLk/6wqFolL/5up4EU+oDI
	 z+ikhD0Seee+w==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>, Andrew Jones
 <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
In-Reply-To: <CAAhSdy37AUsq0ixwiaGz5HwSJw+jTAonoCHG5Oi8h5=Hw+bXrw@mail.gmail.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
 <CAAhSdy37AUsq0ixwiaGz5HwSJw+jTAonoCHG5Oi8h5=Hw+bXrw@mail.gmail.com>
Date: Thu, 15 Oct 2026 23:33:22 +0200
Message-ID: <87v772d4yl.ffs@fw13>
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

On Fri, Sep 25 2026 at 21:21, Anup Patel wrote:
>> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> LGMT.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Acked-by: Anup Patel <anup@brainfault.org>

Can you make your mind up?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
