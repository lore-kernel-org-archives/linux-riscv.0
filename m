Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1BDC27C6E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 03:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Iy2goahjOlkKQObcsacQbWFYv6m075Rz3CISuDRndo=; b=ZD51UCGEqM1+Oh
	MghTORG1O9F8+0omwounTm1UB2Z6g0zP/H1+FFnEJYPMUhlyFaU+fusSj104wBm3m9MUZ+OOjrPQF
	SXiVhO1734m5c5U90yiE+17HRDYqUILwwgHeWrImIck14XgdQ5JkGC+lnFM14hRT6FzsOgq8hdTvd
	nXs8rzWez79EBkCDOjTZybX0D3gn13AE2VRjP9UpAkVO0npnWcBahsmFKTSrLPz8n1B54kH9Sy6X5
	I+kWB8SckiqX+bUy0RkYrk16yaIb+44n83ZYNtVvVLjSs3pOXEQJd7E4wzZ9URGKN6IYqrHcrwPAy
	+Tqg/GAbNCtzUgUCQKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIK1o-00000004ZiV-24lw;
	Sat, 15 Jun 2024 03:24:32 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIK1l-00000004Zhe-2082
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 03:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718421869; x=1749957869;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZhDyvZjrKNUgqfOnQHg80XwyNyd57tVs1xZ403nIE54=;
  b=XAA4fjEh+8eUV3dyBMs0LqvXmDXQMv7BJRA7HzFXj7kDNNAVrjrEEqzd
   a/vUdrFMVvEuTHlOPPy6GzxN6VC823V2i1Qhuw8lzsPpf0d0uSGJ1Co61
   wH9C6/TotbqkJXd8XDSI0ZTiNf4VBwNqvnLesUgixx/3p1gueXHCtvIvJ
   QgILD7apyiiLL8qNLJKnAdyv89nIdxuiT6B2cCXyyxJZIMhzx9PHWhFAG
   uk74QrnxYiiZly+sWWgW2BFApMm6UKIAueSilsSZzmLxwtwGVpyP5G//v
   hBaNA1kAH53vgVmCs7Aoyf1mjQJ6T5DDmvVw/0zyPFvFbPiR1zDVGePZd
   g==;
X-CSE-ConnectionGUID: GUkGgrNYT06wQ3/Y0A+/mQ==
X-CSE-MsgGUID: Puj+pIRxTDCIIYuPmBgXKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19184019"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="19184019"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 20:24:27 -0700
X-CSE-ConnectionGUID: 92QNrtsCSg2Uvzp7bb7Aqg==
X-CSE-MsgGUID: Wykncz7CSsKgxePnXrnqEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="78167097"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa001.jf.intel.com with ESMTP; 14 Jun 2024 20:24:23 -0700
Message-ID: <fb252e35-46e1-48ba-b236-a3296922ffdb@linux.intel.com>
Date: Sat, 15 Jun 2024 11:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com
Subject: Re: [RFC PATCH v2 08/10] iommu/riscv: support nested iommu for
 flushing cache
To: Zong Li <zong.li@sifive.com>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jgg@ziepe.ca,
 kevin.tian@intel.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-9-zong.li@sifive.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240614142156.29420-9-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_202429_564976_FB995308 
X-CRM114-Status: UNSURE (   4.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/14/24 10:21 PM, Zong Li wrote:
> This patch implements cache_invalidate_user operation for the userspace
> to flush the hardware caches for a nested domain through iommufd.

$ grep "This patch" Documentation/process/submitting-patches.rst

Same to other commit messages.

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
