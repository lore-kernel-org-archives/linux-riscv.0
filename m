Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F159FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fJvGiWWcy/SMcmWQRrYJGgLAwyuc/lwVgtUTI2LgW4=; b=MTsaVYE/10eQu3kXHQoZFLb8ik
	zRrODSxIE2JCV1wBtFJzh8sM02dMDeT1DAOS4zMWKpnzyKNSoS89tGTVK0DBWyhJyuVKjnVvbGYH+
	vUEzTHYo2oamOaaxjkogD+MpEgtdR7LDSONhAxK1UecdoE1L7sxvDDcPedaFM8KzAa+pcGe7JcV5n
	7ePar+R5c84/sKBVT8ehDndQcjSFnivF6hkj8HHxk7OgvBHQ5cj36z+167ujRdgMIDpA585vgxUqj
	9LZiP+Ic/IrmJAwIVrJCnspfWde0FWspVWPTO/Ars/oHUts6LHoickzR31OUheNkY0Zy1iuTaouCZ
	6MnxUwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSzh-00BADT-0x;
	Thu, 20 Jul 2023 12:42:57 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSze-00BACx-39
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 12:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689856974; x=1721392974;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JaJ/lkSSzUjKz6n6+OtO6yZ6zwybCck47wRM8qdASR0=;
  b=c1uJgjve0caO4kd7gTa6y6OpC1nXw67EcBT4SBdIjZIXJjT/UAIMMlw6
   jFHPDsHaO4a/X0a1FbcLHMZNOoEUoTzxveIww3Ti4GdK/K2/dPYfMHlmP
   aSc4pExBeeafyHBCp1qtpNB2b7K+jeS6oN5p64k+XVy1GWctD/XxeMmF/
   dMGgU6KY6g+e1tMLEWIO1VGhmgZj6g+A4uBL90nGv8jB3OAEhAdJzKyu0
   HQm0Y/2SSsMmo15JAkxuRii5XXPGBaqsjNsWVXW2TpOcXXd7ZAmX/BqSH
   Q0BVhASV1suRwaiYs/mv9INSw3/AXLkGrGoOsTWLnF44r3b0nZYt3HyzX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397594586"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="397594586"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="701605663"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="701605663"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.191.109]) ([10.252.191.109])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:42:47 -0700
Message-ID: <376985dd-a8b9-b86a-3c12-4633dd4505d7@linux.intel.com>
Date: Thu, 20 Jul 2023 20:42:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/11] MAINTAINERS: Add myself for RISC-V IOMMU driver
Content-Language: en-US
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <e1578b96b9c75433d8c49b6a173ff47a64675c2b.1689792825.git.tjeznach@rivosinc.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e1578b96b9c75433d8c49b6a173ff47a64675c2b.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_054255_049058_07690491 
X-CRM114-Status: GOOD (  11.53  )
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
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aee340630eca..d28b1b99f4c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18270,6 +18270,13 @@ F:	arch/riscv/
>   N:	riscv
>   K:	riscv
>   
> +RISC-V IOMMU
> +M:	Tomasz Jeznach <tjeznach@rivosinc.com>
> +L:	linux-riscv@lists.infradead.org

Please add the iommu subsystem mailing list.

iommu@lists.linux.dev

It's the right place to discuss iommu drivers.

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> +F:	drivers/iommu/riscv/
> +
>   RISC-V MICROCHIP FPGA SUPPORT
>   M:	Conor Dooley <conor.dooley@microchip.com>
>   M:	Daire McNamara <daire.mcnamara@microchip.com>

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
