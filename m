Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A095C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxPM2zwO+a7cSNLmB7litmXKe7ENLbgSFJUDrBj/NBc=; b=xDQ9K+t2zGaxnz
	tBXVDR60FJDqlyTIq6smm/ey87gmyETW+2DefHBHyCyNwXEMfdVKHkQR0bCYGVTro5ZR/cs6ovcCu
	HHkkgBcewIqG4oYeBL+klLPbr8w7mRZmSc2/XHVEV7nQJOme6005X46YfWKs4fw3Re+f1b+jgheqr
	WsUbDoa8InkEXzZbtxPeWOel25GY1/d9eXoBk8/YzPqIug7GIZOSSqQN4dy1qFZQ0ItBRNnHhVqO1
	AqSxbyCiYU/nxcDab0v/CB5HE8rIoTK875E4Q3BZdBujOv3xyImkWSlsf+iXSGkJ+1efhfAn6JLzb
	HdABGw8TP1X6orsDtOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWPC-0000000GoO2-0nX0;
	Tue, 30 Jun 2026 11:13:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWPB-0000000GoNP-1wrW;
	Tue, 30 Jun 2026 11:13:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3E28600BB;
	Tue, 30 Jun 2026 11:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262B41F000E9;
	Tue, 30 Jun 2026 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818008;
	bh=gBrw4h6G+CAidiPHKiZfKf7oBnSSJvuEXV9bJiShaTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=blytqQRac+g9IOLHTev0RLz7JAEA05ZsCRJ4cXitfvYsRAWj+gBUwA3e6cQe8G0UO
	 PmqqWpzCpst3E2PvtVSn5zI6mrdwPf0p93zgNTlUC+ctCybXfH6X9J1JZ3viG6eATk
	 W/0sowhyccmzR/ELJy79DfC7PRH4Hk+2ksfFhFf5w/3BxLpG7rq4fDlGIsoMndRLaQ
	 ISDk9zW3XOoIF3nWXA39CBFku69yw+kff9k6bT2J8SgKMr6GCcewIkNUHIf7kcfpLR
	 dR7FNbthATEO2DTOT+eXGFIJt028JX+fkSP8YDOCwgjuuzeV6rGd5vO1VRkidBO596
	 f9DESVmWQK+TQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: chenhuacai@kernel.org,  kernel@xen0n.name,  pjw@kernel.org,
  palmer@dabbelt.com,  aou@eecs.berkeley.edu,  robh@kernel.org,
  saravanak@kernel.org,  bhe@redhat.com,  rppt@kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  loongarch@lists.linux.dev,  linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org,  kexec@lists.infradead.org,
  iommu@lists.linux.dev,  zhaomeijing@lixiang.com,
  catalin.marinas@arm.com,  will@kernel.org,  alex@ghiti.fr,
  akpm@linux-foundation.org,  pasha.tatashin@soleen.com,
  pratyush@kernel.org,  ruirui.yang@linux.dev,  m.szyprowski@samsung.com,
  robin.murphy@arm.com
Subject: Re: [PATCH v4 10/10] loongarch: kdump: exclude non-dumpable
 reserved memory regions from vmcore
In-Reply-To: <20260630074715.4126796-11-chenwandun1@gmail.com> (Wandun Chen's
	message of "Tue, 30 Jun 2026 15:47:14 +0800")
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
	<20260630074715.4126796-11-chenwandun1@gmail.com>
Date: Tue, 30 Jun 2026 13:13:22 +0200
Message-ID: <2vxza4sci8ml.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
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

On Tue, Jun 30 2026, Wandun Chen wrote:

> From: Wandun Chen <chenwandun@lixiang.com>
>
> Apply the same non-dumpable reserved memory filtering to LoongArch
> kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
> drop flagged regions from the elfcorehdr PT_LOAD segments, and
> of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.
>
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
