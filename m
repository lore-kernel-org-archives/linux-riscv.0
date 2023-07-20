Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83D7EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KigINpeQj5+3Y60ceONwE54hmqVqojLpgklccuRuG8Y=; b=RPyOIA2lGEKPw1FPpAtyfG8j3+
	JxOEtBJBTBDETXQyIUg/M9KuXlsoakwIviJoeUSFjyJTKgj6x60I6aZBYtcUIKsJxpFsEQjOYvvbr
	2uKRbqcI70jOfHb2t0RqxHQKUBDhhFlx6YdsW3wJ+mmriXeDyOBC7msXlly6ZPjM3jSM1HylEftaO
	3uSEJTNVRraaItmMec8zu90mH04pyoYRv895Hi+CBa8xGVscpdyyGTKKZJw2Y65H/51MzyKUcRzj9
	28isG8EKswFzf18ZYeU58ghAAN+EU0zGzExpgGUf7B5P4iVBtdBbCRlxfEtdRjgNuOtxMhAC+YYzr
	feDB0zBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSof-00B8td-0g;
	Thu, 20 Jul 2023 12:31:33 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSoc-00B8sq-2A
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 12:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689856290; x=1721392290;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PPjb1efpNVs+0C/3htOuyu3cb1OjDpfvMZWKs6Ysk/Q=;
  b=h4JBpN2Fg2Ckpyr5h8cjcFOTZPiZwAd31nDCFj76OHXOa9kLm0Y1ZcN2
   nb8djGpaGeGzX6KRVfM3IIcpihdsFzz99PHRev5dIhYFxvvz7TMAfllKO
   AV/ezn3OJYVWuRwJ0RO4eQfeu8SrHz6DxoKqIohCeQE0pDSU4ifbYeq2n
   Shf6i1At8HuS9XRheI0vedpHu0ThDqbfVs9mT7ZVzFBGjurqvbKYiamDJ
   h+ntY1+lx9LUrEUaFf0lgIyibJD7rCxdA22qftJ8PrHtNGQ8+3j3wLtzE
   ak7cRSqIACSCVFHlzAopWKldfs1YLgzM/CKMnAnSIups8mHd+U+w/pYTa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430484827"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="430484827"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848430629"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="848430629"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.191.109]) ([10.252.191.109])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:31:23 -0700
Message-ID: <45d32e95-9d57-a424-63bd-b894cf0d3a2b@linux.intel.com>
Date: Thu, 20 Jul 2023 20:31:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu
 support.
Content-Language: en-US
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_053130_747742_62E8E5AB 
X-CRM114-Status: UNSURE (   7.24  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023/7/20 3:33, Tomasz Jeznach wrote:
> +static void riscv_iommu_iotlb_sync_map(struct iommu_domain *iommu_domain,
> +				       unsigned long iova, size_t size)
> +{
> +	unsigned long end = iova + size - 1;
> +	/*
> +	 * Given we don't know the page size used by this range, we assume the
> +	 * smallest page size to ensure all possible entries are flushed from
> +	 * the IOATC.
> +	 */
> +	size_t pgsize = PAGE_SIZE;
> +	riscv_iommu_flush_iotlb_range(iommu_domain, &iova, &end, &pgsize);
> +}

Does RISC-V IOMMU require to invalidate the TLB cache after new mappings
are created?

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
