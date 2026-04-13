Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2F8F34C4E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBroO6YuRJIF1gZ0Mqp5c7kkMeflnUHosAYb3B5+7wA=; b=vVQn9jxNeD3iOe
	IVBJWOLnAGnDkwMHyGm50rptKTIq/6CWyNuqykKMJUvCsrIm/StZ2x1cE8Wu+loc84V7G5eOyVlTd
	ncXx4cJBsgC29KwWrjiEM2kW9b5/lD+YvtVI+V0VFtduMm54ZSNy9kjcB1e+hYRFsLwhVEJHbDcyZ
	uAOIeeioTMJzvWHxbp0J5tfIxKSzGrZoAlnzQNXPJ/avy3/TsBeHSFUIpc5DLvPIOYBngtpDWyzVW
	GSs2GGIwYbF38QkVbBHJH46kaGQyCqZwj7xCDcfgjZEhoEMsgZJCxm5Vj3MKqlhyaZSBLA0ta+3pr
	mMGYBjCvvuaVy4gTtTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGU1-0000000FeVb-0as5;
	Mon, 13 Apr 2026 12:33:41 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGTz-0000000FeSG-07VW
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 12:33:40 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8d68bcf50fdso485591485a.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776083617; x=1776688417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G3PbZPnXvhTGMf08wp4zGUyWkrOGmA6vnbkCFh7iCiM=;
        b=GGCEBe42kDN/OF6fx7oSufCIM0jtSqW0uTLbFrlLEhVwj4UM8WgZGIk6TdDX5G35PA
         yvEuKIyzSeLeJAiKYHwEjl6goo0Xhs+qRbaZZ+cvr27NHCd2v8EsS7AJpdvbxtqVknKv
         KjdixMRaTWHhMFT9FOZ9MU+FPmsr1iNJ547fU9q5oTfg7Zpz2j+Va3zYFcLnWACSHzsV
         6luqfXwc6bFT5MjRkTfyCjaWrYRvckMxTS7RVfRc/RUQrd5S8sYIKi9lAgnx2+UVGFiy
         JWlfIB+lHP/IqcO6i0MGT92QK1CBvl6y/yaiPsFRbSZOubZtM7EzIaRsSfCHeYIOjmcN
         Qo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083617; x=1776688417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3PbZPnXvhTGMf08wp4zGUyWkrOGmA6vnbkCFh7iCiM=;
        b=s7MPUaeNg1udYJNg4+jG2BpNr04x8CRTdormFQWPYn1lpAvQixuO2yjuxZKytHKtNw
         1lRMDscK4MZujzBO92UxooO7Jp5I1V17QHLIbkT1inPfbvFWjQqcg+mnQ193mSvXt6by
         8d976205gT2WpeOImgn60MRyH1B6OKlvS9PDwCAKTsa4XuQQ9Cc2Obo5UkSpuWvuF5Xu
         6eUjlIJkmtmIKYV14QWjI3CWw/5NFzlb8vEBDZJtZeA1gzYCgwZaQO3PA5sBPf103Cp8
         jzVslqyLpn/gh59uqHfAO7Co84JT10B4dmxA3/IQCEzb3n1i9gaWi+44CCR6UHfnC6VJ
         7dqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+g7EZxjgxln4iBRweXt6Vcc+8HK2XSiwbMGMJ3R/PU4xt6rFQRy4YZ13KQQKb6WIR3XBDiYn/VF2uQ5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsOssr1zLM9b0QNzdkhvbHwRcFfvQmxBRfSz+aKXc/A2gRP2bM
	9XfKXdXpi7vEY/qK+AL6sU3Cv6Bd1SeDflh1dGpxEvH3HHuX2ZZc2R3Zhtx0LbC3y/Q=
X-Gm-Gg: AeBDiesXcTunXtIXWFqDXL+Ia/neYt00YgiPaA/0XGdUekfyTSyfx9JFy9XEusWz4xX
	XQCoLHHk28MnmmXpxoyHKSq/CrFrvRJ7uQtYX5BNQ3BehxqGIDcfD9Es0emk5jZj7hyTZKl5hc9
	RpqfmZainT1XYP1pZE86ThfZ6In+dWiLMe9eoTps8j0d+xmcV69SmmiBBqhWv2peed6MXzJU6eo
	JvzqlanSHOGUD8JQypsVBQvA0QaPNq+0M4/TF1CD68SiTyFkSBHnRNMt/7FDAh42ai/bT7eW/Q2
	IPWBIwpkyT4mvygZitL+Z1sv7q+mRN56QPFhL0pY+/aHNvyY35pGmWHqEq4uGheOgqPwUC5CajJ
	2WZ9WnGEPvdNINMoEyo+q7E87Wwt4syCIwGm5dXOvGyAICJ2MWnQICWp3AYPaiRtIvrY84MwZbz
	X+O746Mcb1Vj9bF6mYrHj8ip8dNuO/JtE3g/FsSJqQeHcu5B9EM12HgQF3R4GhBeRX9HkI8K27v
	zsBaw==
X-Received: by 2002:a05:620a:3729:b0:8d7:cf69:3bf3 with SMTP id af79cd13be357-8ddcfea032emr2045008085a.54.1776083617086;
        Mon, 13 Apr 2026 05:33:37 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb9637c5esm840380785a.38.2026.04.13.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:33:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCGTv-00000005Acj-2B2K;
	Mon, 13 Apr 2026 09:33:35 -0300
Date: Mon, 13 Apr 2026 09:33:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "fangyu.yu@linux.alibaba.com" <fangyu.yu@linux.alibaba.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"tjeznach@rivosinc.com" <tjeznach@rivosinc.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"vasant.hegde@amd.com" <vasant.hegde@amd.com>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic
 page table
Message-ID: <20260413123335.GH3694781@ziepe.ca>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
 <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_053339_232107_CFFE38E1 
X-CRM114-Status: GOOD (  12.03  )
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

On Mon, Apr 13, 2026 at 06:45:07AM +0000, Tian, Kevin wrote:
> > From: fangyu.yu@linux.alibaba.com <fangyu.yu@linux.alibaba.com>
> > Sent: Saturday, April 11, 2026 10:22 AM
> > 
> > diff --git a/include/linux/generic_pt/common.h
> > b/include/linux/generic_pt/common.h
> > index fc5d0b5edadc..dfadf8a5752a 100644
> > --- a/include/linux/generic_pt/common.h
> > +++ b/include/linux/generic_pt/common.h
> > @@ -188,6 +188,7 @@ enum {
> >  	 * Support the 64k contiguous page size following the Svnapot
> > extension.
> >  	 */
> >  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
> > +	PT_FEAT_RISCV_SVPBMT,
> > 
> 
> nit - every feature has a comment.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Oh that's right, please add a good comment!

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
