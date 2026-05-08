Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC48CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 20:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZL70aRu1rpEmGpZUCcFRwyXsDU0m16XN02CnFxON7S4=; b=bvyy5D6RA0TsmQ
	0SxvhApn86g/gZdB2AZfbfA/Vl2So65eCEvI9pLstKXYBlBDRso+cGr2m+jXbabdHuztho0++nwtu
	wbJf9pYdtoUwSCmNwJZnUQnv6xmKTpiBnoPrbBC6KtsBFJzZK4dtSgh5YIwlUhPV0O1ERE+D5/Ofl
	KwZ5D3Qof793HkIOBid9mxSBKQGtpaZlRs0MTrNu/iu694sWvIYJYn79b21bgAxFZOeFPQsAfZc/L
	iSC1yXS8OC0/Rs6GPEJSjWV6s/jOaQ/hI+8o0kMGMkPe8sL7sSbIPcKhsiL+Et7XRQ8bkkq2vfe9Q
	pPWmmomBNEscs1YdWr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRkY-00000007Rw4-1sWs;
	Fri, 08 May 2026 20:24:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRkV-00000007RvX-1bOE
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 20:24:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso1145ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778271878; x=1778876678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce+YnMBE0LJf/ZEN+RPq6mW2l9lqvy12xVD6Nz1p8bo=;
        b=B35ugcQ+ogPobWP3AVxSw5FHhevCI1OzSLgwYN7rjkTiLrWOSzy5PjkcoXgaoyf9aW
         TNOxd8gNwDXOC31alXKF1W5E03yz8amKKX1EcsOptieF56A7Ib/1nOmkNN/q+ofajMqx
         DgX1o9Cpp2I1M5MJ4Ca5+C+KvSG7GN1b0nw8/sRxwOUzeCwZrU3NAotUphrJikbiMlMB
         f637CVgvKzUJSXs1CAxhCvGM6/niEPLnajdC2opkNAX5Da9Cco4o7irrD2SRBotGxSl/
         7S1isH0jsvbrFaiIjfIuCmMmkVSDPYz5jbFTuZ8idRIEZO1fFbTUhBtphimtkjzZbeko
         aZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271878; x=1778876678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce+YnMBE0LJf/ZEN+RPq6mW2l9lqvy12xVD6Nz1p8bo=;
        b=CilTxmzv64MFiX9xoDlvEECrzlSvLIfu9UrpJFmbBDeIoaomv1PAw4xPeBYXU4/vxc
         0yDCAAtvCOP4fZsya7v9hUwO9Vv8IZ9PNLTkkeh7zM2OrYGhC8UB7qGXZzhbziSEPpfW
         N1P+yD8vEY2DVehVMDmX2+4GlBygvDc2WRO/qavkn5ay6nX+jvdm4zLtZjMSJHHUlvgM
         /XPbyviAyDlPio0jMEqgkosNTy5ezDdzR9okWJdszLvqONCaUR59fmmr9ULeALd/dExu
         dmJAhDF4g4kudkMk6ngGVEVhlJnjTdrYMZFqD5TGLl+1lVBtO8dmUhlz9DZbRM8mdauu
         Y1Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+VcI150P3bLdMIGToulbkUAKcOP2krR6aeCpOE2se4hnNOjLiRvIQPaPYY8quWjU6jjc2joZ3fGpA4ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyko+D10GhC/Vno/do+lSuv9PmYdX0DjO6ad5TnVu3shEyfpFWJ
	rT6whiJjhnPVrNAk9k0z7gMuDzgxJtHuwhuv+kwExrdGo71gfje3g1cC89ZFXZMTDGWayjP2ZKU
	1E8wP8A==
X-Gm-Gg: Acq92OHs9mQ3luWsdFXr1MH7rEtxfBj1Ws3BJXf33ZYs69w+c6Rd6Vtm8IQGTCtzsDP
	DEBWER/QxVQRi83tDGFrswxSZU5UypmWQTDtg4KJYTiKt55tAI+HXNm9t1/9AnFV7jnIsUTuwZ4
	RQajoOa9vSAXiPTOMMhvo4nLWQpJGeem6F34D8U57G+ZwsmLWfLcwYeoGQ88okGVvMceJAXs+XM
	0wtJTULO/W/jppTVGeWGO03Hz/QcyMcNAt8vVsMVDeYWtO+xA482/HSPd2S/un3h+atGn4TsBWz
	gWhTjM1hbg0G/kHHpcXKjl0v7Fux7bI/2EVzlB1d9BfS6wlP6zII1TxWI2YznY8kg1RwS3Qn3LD
	Jm02fGPCK/AcLeZGhXAe7QlMhYWZm+nJpr7byqoWlN5yI4BSNyfvXbhAQ2iZ9HxmrJKOd7CWOaS
	ADwaBroeSz4ifMrWVOtw5nOuxLSzJMgZduFTbiHpRpaOcg6U3FudwzjgD22JZwFFVqYhw0
X-Received: by 2002:a17:903:1666:b0:2b0:5c88:51e1 with SMTP id d9443c01a7336-2bc747c1c17mr760485ad.14.1778271877978;
        Fri, 08 May 2026 13:24:37 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be0csm2827343a12.2.2026.05.08.13.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:24:37 -0700 (PDT)
Date: Fri, 8 May 2026 20:24:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
Subject: Re: [PATCH v2 1/8] iommu: Split the kdoc comment for struct
 iommu_iotlb_gather
Message-ID: <af5Gf10IujBbDXij@google.com>
References: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
 <1-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_132439_455799_5E1CE19E 
X-CRM114-Status: GOOD (  11.88  )
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

On Fri, May 08, 2026 at 11:53:00AM -0300, Jason Gunthorpe wrote:
> Use in-line member documentation and add some small clarifications to
> the members. This is preparation to add more members.
> 
> - Note that pgsize is only used by arm-smmuv3
> 
> - Note that freelist is only used by iommupt
> 
> - Reword queued to emphasize the flush-all behavior
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  include/linux/iommu.h | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
