Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F40FF3ED43
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOCIgOHbY/cNt+PCIKdE3V5KwRLHzO22f9+xSfxRFiI=; b=l7R4NcGFMf7afx
	eAb1ZeYYmupgWj948+ThqIZdn13e3Q+2r23KeqYH/fSRt4pls/Gv8bsUtKkvlOA3a1TTGFOR7tZl3
	ofjuOdZ6Nf8sPVskMxQXADJyVMgdAtoq/ARh2+omXKjbTcmJL8dk4RgF1IyGXKMpuXza8X0c7wBzs
	Y6U3LXxh4dER+942qBVP/1rVq2ccOIsUtpd4HuWVuC+UxglInhjNkZl6vqD6PahCk15OaFwXgHTsN
	IRaiCsyYdWh6PrwldNJK+LoRm1JwaluAwK/xDSTSA2fXy8jQ/96Ne2It+9NDdF7vrL/Fb1jLkgDfD
	hpl1PnQza2cor0U0Yq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXkC-0000000DRFp-1GMq;
	Sat, 11 Apr 2026 12:47:24 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXk9-0000000DREx-1Ai9
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 12:47:22 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8a0323830beso25480406d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Apr 2026 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775911639; x=1776516439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWppL+WJopnByItX0KjB3DQR4+wR3fIbz3ulvVygolU=;
        b=DAl6t+VQpNyHFzQ8RNQ1PyZgv81F4JPpIscqEnUHOyV40+eMRkNN8Ff27/QWefZTNc
         dkz37uDQVlMi1qv89fRnBIXqxmqKhgMlAFxPA6rcnWwgemN3T1iBAA8wyk7rhY8ChI0S
         X3P05vTJEbkYvd9gPkCl9LmbAOWdCeu86F0CXsREYGFaPTkIl8XD4cn0zWu1zmi59Z7L
         62hq4al8uQiuZx4LxlrxBfGQgjep6qYtk3Q+2/naWnTMPECKYfVkjdJQ1oXisDeakw+k
         QUZ54NuEAjxaC3MJ84u5YArWozAyl2l234wcDXSdgw4Wure1idq7aE5cVa0WdRUFtCC5
         ykqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911639; x=1776516439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWppL+WJopnByItX0KjB3DQR4+wR3fIbz3ulvVygolU=;
        b=pllj2y1SbQRkwc/aGvX8l8S4lvjdEto6yc4KJmh7KqVheioUWLMb+pXXMmIN7NExsr
         t4Ye6VtFZGgU/l+OZ75xL+a8zgzVzRGwpSo1Bsjs89hz6jMNKLgZjG9Yc0e7YxZO/rH3
         wYI0J8b34AjL3gw7Rn+MWqXRW8oUuf5ODwEmSVwG5NzqJfFM+r2FJzuGJXaUwXEFnA2d
         3kkm93G4SM4DlbTs+Bj+iq9C1BBWnrbaACnIqVMOqfSF8CQ5Qfkpp2kkq+C2dgIeoPUr
         uVacNIMdkEkyXnvrfqaR1dl11C/x17C2Zy7L/7X5hm9iT0xWOgVLirbpt1V/TDnjUr00
         /yWg==
X-Forwarded-Encrypted: i=1; AJvYcCUioOTcy24xWq8QrE9rC60VncZG1dUpoGf5xHxeM9zYYzXLNFkHZ4rocNI8bW/5wBawH/E69B1ExbNh4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB3wfW1nkeI/ZqEXeF2rvCwkVR761Gy21g5ZfFONqma3tOUkbq
	zK+1ezNT/Fk7bawtKDoD1rQOjzYv+fXaLAL0C8dAXE5E51j8OrlU9ddg8Xtt/Dhpz6s=
X-Gm-Gg: AeBDiev6KDvg1oDD6wIeaPxq0G6BPz1NhNluHQGPdhBXGXYtEbpEtIG4+R6fQ1z7ag1
	3X+YwMw4NGFqf4GRPgxhlkTdc6H918yUZip6WC2NeJNqnvvTbXGHKwNlr4Vt7ZA5QFttpsWrJKi
	5YHp06RwXMNN3bWwuFD4lJH5eLMA++vW0h0vy3NLXDxwv7W4unU9WYD4DJVsuq7EVtljkbJTiDX
	fEQBjeo8ZAJLX9+LeLH1TtVLAB4m8wIhvJQFwOP0QW8CStUwzMlIhymhwEilvXXe4mbN+Tud6aA
	R0zIHG/vLbNNYj9SuRPGKpevUXbQHsEEfCUE6ufi4qHTq8ZEaBxJGslouDkL0/UIXnu1BxT+9ix
	MOnCsdTeuqN4UgYw6nfZDxzGxFG0bwqe3CWn+ruGy55VHLnOCF+L6Yp+H67CpTyzy28pTEOmGXz
	C+TISjPhNqD622iLWsPqZhfdrYXwn4T78BnB6Cf5Z/Duly99QuB+dmfRTqc8SZlNBzH9SdrlxS7
	LMx7g==
X-Received: by 2002:a05:620a:4155:b0:8cd:923a:87a0 with SMTP id af79cd13be357-8ddcd6fcfc0mr1003943885a.21.1775911639328;
        Sat, 11 Apr 2026 05:47:19 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb5f89d88sm426412085a.4.2026.04.11.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:47:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wBXk5-00000002Xff-27WZ;
	Sat, 11 Apr 2026 09:47:17 -0300
Date: Sat, 11 Apr 2026 09:47:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org,
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic
 page table
Message-ID: <20260411124717.GE3694781@ziepe.ca>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_054721_504391_EAE9080D 
X-CRM114-Status: UNSURE (   8.87  )
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

On Sat, Apr 11, 2026 at 10:22:22AM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> The RISC-V IOMMU can optionally support Svpbmt page-based memory types
> in its page table format. When present,the generic page table code can
> use this capability to encode memory attributes (e.g. MMIO vs normal
> memory) in PTEs.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c       | 2 ++
>  include/linux/generic_pt/common.h | 1 +
>  2 files changed, 3 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
