Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F6ECAC59B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQGlAFQOX3cTyqtPJeBLEuzCZRdDEv973w6TU6mQA1w=; b=xdU3lVgmryGsrG
	xqsoasV7wjD+tQqSiYrkUTtZJ933KB7PWojLTtKkUnVBHDf0YWguZyya5L75mZ1Z9tzemgM4pSxU5
	waEol5MIH3kAxbIp3cJUfGjWg8MGKLQqh4Q+M4U7GNkCHwzww/M/fAfB720P/aDMbYdfg1fwQ7oIb
	oH1I1go1W79IZ+7OHTjZajb7UOeczWZvu6MGkwAzudfcvAt4vb7r//H1UcUsmQ0HnAbE1f8gslysP
	ls60EU0M8S5hQx2MaTXnBuwox5stVm2wz9fdv1xgb9C2f7pGbRnVSKcW5NbjkcheYc1AEzt4EHnBr
	zlZwKCCQk2R1JIP+7oIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaRS-00000008lIU-2Zcf;
	Tue, 16 Sep 2025 18:30:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaRR-00000008lIF-1GhF
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 18:30:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A61E601B3;
	Tue, 16 Sep 2025 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA528C4CEEB;
	Tue, 16 Sep 2025 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758047412;
	bh=/60SfQxaLsYIsKPNHgxsvyMnMI3qJ6/je9Dcc85USXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcLZIk4QG8OaXaSJ6ufu602atIlGG4XngoCeveTzoBf0H5s4S/4ATiIAFhg+GsW2M
	 fW/hAwaRfqoyUpisKvnIScAAkVvMzyym7vkGoVqnfq4bNlCkeksiZMxbdF1seehl8f
	 +fHiL8pnW5UPKuMS9qDEAspXz5A8CV4zayuab9X1bYDHOGseWTZUr8IKZ4Reasb26w
	 5gnDUNeJPxXAuwT1qYNUKvMT3J5yfBwTYW0jdPknCs20Ke5dYwTeEcsOxudBTuNMXX
	 eypasJchs+QTE1Z4JxfppJNo5VzbVkjFFfbYNJ/ZMMlo2TLlLf/KSI5uIN92oluPSb
	 RVH9i2BbTS1LA==
Date: Tue, 16 Sep 2025 11:30:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] RISC-V: Add support for srmcfg CSR from Ssqosid
 ext
Message-ID: <aMmssvhxw+oH32OA@x1>
References: <20250915-ssqosid-v6-17-rc5-v2-3-2d4b0254dfd6@kernel.org>
 <202509162355.wByessnb-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202509162355.wByessnb-lkp@intel.com>
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

On Tue, Sep 16, 2025 at 11:55:39PM +0800, kernel test robot wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-riscv-Add-Ssqosid-extension-description/20250916-131818
> base:   76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> patch link:    https://lore.kernel.org/r/20250915-ssqosid-v6-17-rc5-v2-3-2d4b0254dfd6%40kernel.org
> patch subject: [PATCH v2 3/3] RISC-V: Add support for srmcfg CSR from Ssqosid ext
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20250916/202509162355.wByessnb-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162355.wByessnb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509162355.wByessnb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/sched/core.c: In function 'context_switch':
> >> kernel/sched/core.c:5357:35: error: macro '__switch_to_srmcfg' passed 1 arguments, but takes just 0
>     5357 |         switch_to(prev, next, prev);
>          |                                   ^

It seems I had incorrectly defined __switch_to_srmcfg() in the case
where CONFIG_RISCV_ISA_SSQOSID is not defined. I was able to reproduce
the error locally and this change seems to resolve it:


diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
index 7371e53e9e91..84830d7c6dc4 100644
--- a/arch/riscv/include/asm/qos.h
+++ b/arch/riscv/include/asm/qos.h
@@ -35,7 +35,7 @@ static __always_inline bool has_srmcfg(void)
 #else /* ! CONFIG_RISCV_ISA_SSQOSID  */

 static __always_inline bool has_srmcfg(void) { return false; }
-#define __switch_to_srmcfg() do { } while (0)
+#define __switch_to_srmcfg(__next) do { } while (0)

 #endif /* CONFIG_RISCV_ISA_SSQOSID */
 #endif /* _ASM_RISCV_QOS_H */


I'll include this change in the next revision.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
