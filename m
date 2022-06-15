Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CA4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7MOvrF+MKJ//PwS4mBceJfwmwS8CuFy+S9B+k9HoYk=; b=yTigJ91EqqOvYf
	xYR/TEQXs6A643c6gJfG7dYwwUw1yWcoFyxbGVpsXm2WcGRIPUmBqZdmO+MxwW6Pcme/xGhaVd3HH
	Z/XRK2gxLgpJtwMBghS+Q9ZMMXI6n1hDGTB8aiRpR5o8seBNyL3Tgex3yw1pgqm7N1Sv7GTvt0iYC
	psZHhCaMaZRXOvkK8dt5CzorI4ANHqsjwuDh+ZqTRd3jPx9aRm/63p33WmAIqEJXhtTk/H95b6sCo
	o2WGE3pxdvWPy0L9k0QKOtsoqY8irlDQZT3EjCta4jHhifgArh8HhTFOhP1X2gegwKzXpDSf+Ro2r
	UZO2Z7MYqtyqhi2Vr/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1NrM-00D7XS-RL; Wed, 15 Jun 2022 07:54:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1NrA-00D7SH-Fy; Wed, 15 Jun 2022 07:54:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C7AA61917;
	Wed, 15 Jun 2022 07:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DCFC341C0;
	Wed, 15 Jun 2022 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655279666;
	bh=VM9JsnNuaNSKfXw3/W5PC+ryw2B8xnjrM3+SbaLRwlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGl2tA+QFedQio6WLQwpcsHPnnA1J6C5L1sRmDLoeb3aoI8ASmSAQZPpx3dpnJQiI
	 pDOcKbh0vMtfkMxkcx4TlTVvIJUrjr76Cw1solVGw/gRLRYWv3JlY6Lq9MmxVxT5j/
	 bkbcToCwXmrl3xvOw9GSJTg2DmPekpNmHTRPDzapkdq/a3RdN3rabGuDhMuStcQS6x
	 VwlN1I1cwKuDoqdyORjIwz6SNT2g6+KyOxR+MKurRsgXM+YaKexJa5CjJYGmPn3H1V
	 DFahL1shyawETgdZ0mzky2SzjljSvbv90h7cW6JEneyZ1UqvKnIQa24J2Jm+ovL4uY
	 0sx+LrZ32kNwg==
Date: Wed, 15 Jun 2022 10:54:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, ardb@kernel.org,
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, dvhart@infradead.org, andy@infradead.org,
	akpm@linux-foundation.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
	keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	david@redhat.com, anshuman.khandual@arm.com,
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com, chenhuacai@kernel.org, geert@linux-m68k.org,
	vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/5] introduce mirrored memory support for arm64
Message-ID: <YqmQIpQ8hzxYkMv2@kernel.org>
References: <20220614092156.1972846-1-mawupeng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614092156.1972846-1-mawupeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_005428_609425_4E4EDACF 
X-CRM114-Status: GOOD (  13.93  )
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

On Tue, Jun 14, 2022 at 05:21:51PM +0800, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Patch #1 introduce mirrored memory support form arm64.
> Patch #2-#4 fix some bugs for arm64 if memory reliable is enabled.
> Patch #5 disable mirror feature if kernelcore is not specified.
> 
> Thanks to Ard Biesheuvel's hard work [1], now kernel will perfer mirrored
> memory if kaslr is enabled.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/CAMj1kXEPVEzMgOM4+Yj6PxHA-jFuDOAUdDJSiSxy_XaP4P7LSw@mail.gmail.com/T/
> 
> 
> Ma Wupeng (5):
>   efi: arm64: Introduce ability to find mirrored memory ranges
>   mm: Ratelimited mirrored memory related warning messages
>   mm: Limit warning message in vmemmap_verify() to once
>   arm64: mm: Only remove nomap flag for initrd
>   memblock: Disable mirror feature if kernelcore is not specified
> 
>  arch/arm64/mm/init.c            |  2 +-
>  arch/x86/include/asm/efi.h      |  4 ----
>  arch/x86/platform/efi/efi.c     | 23 -----------------------
>  drivers/firmware/efi/efi-init.c |  1 +
>  drivers/firmware/efi/efi.c      | 23 +++++++++++++++++++++++
>  include/linux/efi.h             |  3 +++
>  mm/internal.h                   |  2 ++
>  mm/memblock.c                   |  7 +++++--
>  mm/page_alloc.c                 |  2 +-
>  mm/sparse-vmemmap.c             |  2 +-
>  10 files changed, 37 insertions(+), 32 deletions(-)

For the series: Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
