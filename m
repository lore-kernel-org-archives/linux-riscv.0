Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C658CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bALO4yZ+OAnteVcMwbashnvPaPWV0njIdXIdJyspQkQ=; b=WwGNr2z5QsLpH3
	HnmESeV+VCzbclP+hpvCtGzHSTWt90FqD34dWGj5FvOuiVI7SF/HDwiqFdijQuSWh0Bua3wHQD5fm
	ElZdZ+IA9kNUs8gcgULUdACF3RlAaIi4ZZOkDAFKQcPKgPzKWfaIc/Tdg57reVQ61VF0Pr1Lw4/Jz
	SdixCLKJ4rb+iJnnZwG7IoepfZkV0FIUdMrHHi0eVP9bYbWC/dCw5UcYjNTgKXcSovM3/sCPgET97
	GlYI97WCbJLJUckk/oC2GLVUTJrkd7RFg7JKMolsRV50r25OV2iykb0wiih6JWIpYIWtrrUb7VIv8
	EW2Kpt8hC2h57MDcsvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGO-00000002YBh-0jnZ;
	Fri, 15 Aug 2025 13:14:32 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFV-000000028h9-1oLn
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:26 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1230051EB3;
	Fri, 15 Aug 2025 12:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755252080;
	bh=8FsMk8obAbD+bD00DJ3mYVUDhP/6yoGCi9VNK8VjAFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vr83j4M161TRumIMrKEvi+KvnRunX7jsFjaLirpQXvcspcrBGkXldm3ThsgnoZ5Qy
	 NCBKCI3ax+d6zc3PWT8F0CHJKLxateKkwvY8hc3Eo4+e15qlLuUPyP/PRniOY8IvuB
	 yAVNHniRaJjENv0Veyh6CzWG3G+RJqGjK8UIcMTtDLiNpJ9q2hKamIlXXNN1YaLuE9
	 QvRpPvOOMcbej3WQqTt36aH1OGxKMjXyHwDFKKQ4NWkdv0VseU59P9tjftFifX41Rn
	 ADnsERYP6xf08gdiO2QOZsZdsSJN3oDEZpdjDWU1BMTZ7Yimbf5NpSVu8EthNUeFxK
	 /LoYnW0ys8Liw==
Date: Fri, 15 Aug 2025 12:01:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: tjeznach@rivosinc.com, markus.elfring@web.de, will@kernel.org,
	robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/riscv: prevent NULL deref in iova_to_phys
Message-ID: <aJ8FbvCJEOj2XjT-@8bytes.org>
References: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030125_684386_0FFA2DD5 
X-CRM114-Status: UNSURE (   8.96  )
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

On Fri, Aug 15, 2025 at 03:12:44PM +0800, XianLiang Huang wrote:
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 2d0d31ba2886..0eae2f4bdc5e 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1283,7 +1283,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
>  	unsigned long *ptr;
>  
>  	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
> -	if (_io_pte_none(*ptr) || !_io_pte_present(*ptr))
> +	if (!ptr)
>  		return 0;

Zero is usually not an invalid physical address, or is it on RISC-V?

-Joerg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
