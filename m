Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF60CF3ED4C
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoSN0NCcNlz97EiAq+xkTTZpaiApuCp/pkVZ0vJVXYE=; b=2FuT0EentLfHIp
	mpNrvNLB6SgVJmg2S5iEWP5g+FyE1MFM54JK4oopvU5bTNPtEATJH3KOYQjhhpaOJFZjfwYrzzogR
	/XQ0SrmBLf0TStUZhqPnA3EZh9M/boYl2S1eS1qttTP/TWR5JjAZyrLcpSQBZ3wpoLCEamF4OxcIQ
	4T9uLgQsU4WPUsjHEKppP5FPt9/rCvH8LZv0oqhbFNTKVuFfLjYwPXp5Pusg9BHjGaFESjRNawZq5
	wG58OOdFsRRDyFMo5r3HmAPBPUC03dTkVbXBGh+ijVNGWhOGzjLxhe+R3ggbbvXKV2sNQdJmGi8pZ
	hD7B9Bl29a1v9KIo1Tlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXke-0000000DRJw-0IA4;
	Sat, 11 Apr 2026 12:47:52 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXkb-0000000DRIU-1g3e
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 12:47:50 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-506251815a3so24397131cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Apr 2026 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775911668; x=1776516468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2V2rJGuz1N7Jn8jex+6xRO5eeCVkWdXEYVceyBVA2GA=;
        b=TL14iAw9sIpF/rKOtyJ283ieGuht9GIz6D5MqwYn93zpDDGyMFcX5FxK/2ef/t7U7f
         9bZ/ivkwxtDspxv4OO17NpdbkP8AdQiOLd1vd/YNl3wkRkuMnmAYGQAxgIo2jqaeoXwv
         evfxveH7PBqio/YKpMl4sQdf7nG1+DyNgTjnbJ2fzfjeFOKtMmX172/biC9xAoeVyuGI
         I7sH7pkUOOoDX1j0QhLZOWjnZJpBcx2cn/AMCpMrg3uj/rlLvXux0opLvGQNmdTqE1pd
         ne9bMxKUjchG8YzSgQ5q+oz2slWfwKJ2Y4H5ECq1gSLc7zxLfGZFDtbrFsBzarXe01x+
         kRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911668; x=1776516468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V2rJGuz1N7Jn8jex+6xRO5eeCVkWdXEYVceyBVA2GA=;
        b=HvLqXi9/Z7w7On94jOOH5lMd24bjRheqUdx4tiR9Z55r5Pocg/SF+gsjmpDtLc7+eU
         vqqn9p5jjZvQQESflMDPHu1VdNvcsiIu058kKQzF+s9YW8MtIe7N7tkYUtKQ1h5yX7S0
         fmttfz8epb6MjfmnmVqNuU1WrfKxdIPcjRDzc8Pp8dZg6X+XYZCHv98n0vRIWtwoSAzr
         suuwU9W8nQZPiP3zWyHJnwJdl6hITI75gm3HCdUnvDhGiZcvazO9ZuXRMY42VnnzEULk
         9WtJLrLdCYpnxED+LYcy/IgkuWEktyxcpvJiRU3otUaVM3p+CRQUF/EGp/hxCZUqkxw6
         bzzA==
X-Forwarded-Encrypted: i=1; AJvYcCV+oQ/0bTmZsWEsTT24axZwlZuuvrA666ScxcSQIMzaWNBGVLOBdKWzgVPrM1mvtlcr8WfIthDKM7c2dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQLT5TyPXpYpmD4w7OzBS5aQ/LkkeZjNs+OlrubfxO8NdQNEy/
	Md/hqaBZxL0XrxoBNcH7U3ikndxhggulHT+3qD1ICzHQuNaDoGFX+clVcADQ0C1PhSY=
X-Gm-Gg: AeBDiesaIz9twp8nu/qbSysB815CrjyOVDHdoG+Xhmjf5wHg8HYoTjxMOsS92/BRLp7
	BIMUwRRdg9RFX3mKJI26WZCnPXTDiw2UnK8ae2MWq7bTSzqEQ1pqv6IbJ/n9GN4ln+FOcmFz2N3
	mZnWAW6Yudb3ARiX/G2L9AjTY/Fl/NeGDBOZSUaroQcQ7PQ1QqJwihyt7DLKNXCrdtkdAwwbXdK
	yDe4wuhOThL5gluABc/nxdEAJfh2tlTFwF5Q2CvYkz3K7+oHzMK19WmslPHPpmF2PkGDwnBtUuW
	U/gfLhRuGOyLEASli14pClJqS1aaVG1mpTYkHU6QbFDz5OOFYLCaYOqNGmtPhcBNlJoLoWrRbz1
	Lf3fwkJXYTZDfSvt4cfrJ4Q/yo/NEtKrS/CpTCRZIfDeMpoCBiYG//bf1vp1UGIdB+/2Ix9TNyj
	Uinwb+PyKiOsZT4bvME0zNrQ0OzOTnnWmkEvFHvS3P6hYYwTqUtFSuD+f32Qp7mkQUOTYLGKUqt
	XOnlg==
X-Received: by 2002:ac8:590a:0:b0:509:3cd:b22f with SMTP id d75a77b69052e-50dd5af20e4mr102128571cf.23.1775911668183;
        Sat, 11 Apr 2026 05:47:48 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd5651482sm43650061cf.31.2026.04.11.05.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:47:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wBXkY-00000002Xgq-4AP9;
	Sat, 11 Apr 2026 09:47:47 -0300
Date: Sat, 11 Apr 2026 09:47:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org,
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
Message-ID: <20260411124746.GF3694781@ziepe.ca>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_054749_442174_AB98A91D 
X-CRM114-Status: UNSURE (   9.59  )
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

On Sat, Apr 11, 2026 at 10:22:23AM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When the RISC-V IOMMU page table format support Svpbmt, PBMT provides
> a way to tag mappings with page-based memory types. Encode memory type
> via PBMT in RISC-V IOMMU PTEs:
> 
>   - IOMMU_MMIO   -> PBMT=IO
>   - !IOMMU_CACHE -> PBMT=NC
>   - otherwise    -> PBMT=Normal (PBMT=0)
> 
> Clear the PBMT field before applying the selected encoding, and only
> touch PBMT when PT_FEAT_RISCV_SVPBMT is advertised.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This is similar to ARM now with the 3 kinds..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
