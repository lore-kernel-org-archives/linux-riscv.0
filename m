Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A6C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zkyll1PL1v1OSafJ142kFguib2CgY/g9lHRCMz0yBXU=; b=1J39hMKdLlS1Si
	vhW80hkuEeJ0Kn3qgtUWJZEXDYpGeg094JuNHEmji+InkMEMahQKjZQvkgu8KppQ0r46CdlIQJN05
	LtT1heCBES7dMToI1+Vdu/BtbsNdfPXu1nut2LMOoW5jDAIMs6loKljQhkmv1BUrgR8yIUszkuXUQ
	pcip6FPvLoejae4u5gfB+0hOLj8+zdhlskHcrOPyLZx/eCd+9eG+gG3AmPmGSaqQ6UqrjXHWJTLfx
	XTHWx12+4EZx8RuX1jlKTrkci4ClFDuxbNBxqUSy1eqQvE/kohF3HOHUG48+cJJ2igxsglqMFlkmv
	BWUzfEQE1D+f9WIdGhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Pro-00Df6X-OQ; Wed, 15 Jun 2022 10:03:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1PrT-00Dey5-88; Wed, 15 Jun 2022 10:02:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 69300CE1E89;
	Wed, 15 Jun 2022 10:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6C4C34115;
	Wed, 15 Jun 2022 10:02:43 +0000 (UTC)
Date: Wed, 15 Jun 2022 11:02:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, ardb@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, dvhart@infradead.org,
	andy@infradead.org, rppt@kernel.org, akpm@linux-foundation.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	paulmck@kernel.org, keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	david@redhat.com, anshuman.khandual@arm.com,
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com, chenhuacai@kernel.org, geert@linux-m68k.org,
	vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/5] efi: arm64: Introduce ability to find mirrored
 memory ranges
Message-ID: <YqmuQIpkY7TJHAh6@arm.com>
References: <20220614092156.1972846-1-mawupeng1@huawei.com>
 <20220614092156.1972846-2-mawupeng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614092156.1972846-2-mawupeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_030255_502958_A4616386 
X-CRM114-Status: GOOD (  14.38  )
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

On Tue, Jun 14, 2022 at 05:21:52PM +0800, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory
> ranges") introduce the efi_find_mirror() function on x86. In order to reuse
> the API we make it public.
> 
> Arm64 can support mirrored memory too, so function efi_find_mirror() is added to
> efi_init() to this support for arm64.
> 
> Since efi_init() is shared by ARM, arm64 and riscv, this patch will bring
> mirror memory support for these architectures, but this support is only tested
> in arm64.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  arch/x86/include/asm/efi.h      |  4 ----
>  arch/x86/platform/efi/efi.c     | 23 -----------------------
>  drivers/firmware/efi/efi-init.c |  1 +
>  drivers/firmware/efi/efi.c      | 23 +++++++++++++++++++++++
>  include/linux/efi.h             |  3 +++

The subject prefix says "efi: arm64: " but it looks like x86 diffstat
here. You may want to get an ack from the x86 maintainers.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
