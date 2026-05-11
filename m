Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB55CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfRXs9KXnORX6VI9HmspUYPzwoGx8yfVl+tOcEwqXGc=; b=MK+Ha+9PWntLQc
	ZihkKx10xSe/+kldOLoyezw2RjTlJUjRreuqQwgzCz7H7oD1ltfLvB3T8HoO8De5hhFAn3KlxUKXj
	e51pm+bd3zMSLzwQqEFcNgnNhnlfx0lAzS77nkMXKVojrZw8EKkDtQlF2upH8rYHVhnTxZba+4oXE
	0VNIcymbBZqk+f+0ISDqVpMrqXa0J3XKxWX5ryDRyD2Cp4K07YJGFuUPp6Gkg2yJln7Z4ytvT1Ljj
	5mm1LZgAB1WqEZ4JwRRDBSZbOIsPPllN8p9feCXuwWdc92z0Ya5ebR1GNoyYlEbYpUmEYbjPpv4H4
	P1vh0Dm2+XOR9hLyPUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLVI-0000000CfpC-1gFF;
	Mon, 11 May 2026 07:56:40 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLVE-0000000CfnR-3WiR;
	Mon, 11 May 2026 07:56:38 +0000
Received: from 8bytes.org (p200300f6af1d9600f5faa5cebd6c042e.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:f5fa:a5ce:bd6c:42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 41ECA1C3E81;
	Mon, 11 May 2026 09:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778486191;
	bh=kdL4PNsOX6mz5DbR4xt+4lvMH7nnV1ort4ldJMlDfJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQD9nSEqlCi3VNSUVxTGVmL7V2OTyE9VZOFViIb3A7DckknaIDAsckH/K0/XoTCMk
	 nPEoyVckdez7Da2ub6bIAM6p8oHDfQQfIaIPIJkM+YyIVCQIc2c3T2V0V8yG1x9uNv
	 kRAItTkUYpCGOMVBK9LNCCjGDKYiqctK70HvcY/l4G4L4HxmjXyw6h65ySXYTGaL8X
	 mV2UTOgO90Oj7Magxx4CvP8VGRTy3WSkRjS+u/7ZDjuq0OVLcjcn6QM0LndtY9hLUU
	 BS+SyLs9bWYQ8s0NDyZjBBg+/9xwPdOYLNRNremZ9ovcugTIlQEPF66PWpOOmzHmv3
	 VzkCZs9RFLcQA==
Date: Mon, 11 May 2026 09:56:30 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, kevin.tian@intel.com, baolu.lu@linux.intel.com, 
	vasant.hegde@amd.com, anup@brainfault.org, nutty.liu@hotmail.com, jgg@nvidia.com, 
	guoren@kernel.org, iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] iommu/riscv: Support Svpbmt memory types in
 generic_pt
Message-ID: <unecry3tpor6u2dnitimpenvmet56ly72p6mfsfqmcupowo35u@vuju76n33jqo>
References: <20260414110212.79526-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260414110212.79526-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005637_129600_92C2764C 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 14, 2026 at 07:02:10PM +0800, fangyu.yu@linux.alibaba.com wrote:
> Fangyu Yu (2):
>   iommu/riscv: Advertise Svpbmt support to generic page table
>   iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits
> 
>  drivers/iommu/generic_pt/fmt/riscv.h | 8 ++++++++
>  drivers/iommu/riscv/iommu.c          | 2 ++
>  include/linux/generic_pt/common.h    | 4 ++++
>  3 files changed, 14 insertions(+)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
