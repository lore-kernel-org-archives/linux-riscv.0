Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ADBECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ow0Iw0rjIiekO9YmOnIggSTMxxoh89Z/cNT3RlyraCw=; b=qeiijda87ghPOK
	8V2AL8QUw2xHoZXJHFbuONY1ypGFdDpGQC5x1XkWEVLZXPCr/Ge47vriUYP62tpVgpzbO5erjSHAt
	1hNPxLTznxkyFLpCoHX7pDO4a12Iqva/GWHs3khTTgcV9HDBx6b6k6Wmjt2Mfiz1Y/RE2rcxAGZPy
	qyhhU9KyqrMwLiaOb3JXucim2LH5qgeDHqlF9+92+Aw8dcouK7vWGdCwcmJY7ITEdOXtzScAdJiGY
	yJ2V799y8sN12cV17HA4eegCApEBBxOTKtjqoiBn3/Tw90xMoBGqP8M8TW6Y0b/q4/zhP6xt4osOL
	0damOXP0Tda+g/HXIIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaYZ-002zvo-L3; Tue, 20 Sep 2022 10:32:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaYV-002zsa-Sm
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 10:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663669964; x=1695205964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLvjKx4Yb1X8lHBkqWwaF6OHYgPt5zI/9dOx67nKFdI=;
  b=rQwb42+hJ6motAonMz8rrl+nDoyldoxfqER6rjcVELZQmR7S1u9V0Xl6
   w3DH3/NCuLfpRjamGiQAQR0JLD6wxYfSHv/at78HQmgUxnmVc6u8HODjE
   QWawO+QruSigrizhqNDvYttGsmrz9LPYk9Eemz6ncQ3Hvk53/Z6y3Ux1D
   R1e1wKa0CUv6GZ3pBlj/cM04rwtI3VCphbyp7m60QDjsEHQXljv/9CV2D
   NSGLdz7IVEwv6VTRGrRHRGTwsDOai0GeLA/gx4jar+/Gy2UVXBMXspWEF
   B1QuIKW9yXdzM/xIEz4fMewLuwTMXLUAU3TGj7nosv6pl/BQ9FysQ0V1R
   w==;
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="174706509"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Sep 2022 03:32:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 20 Sep 2022 03:32:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 20 Sep 2022 03:32:40 -0700
Date: Tue, 20 Sep 2022 11:32:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binglei Wang <wang.binglei@h3c.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<l3b2w1@gmail.com>
Subject: Re: [PATCH] rethook: add riscv rethook implementation.
Message-ID: <YymWtBokuXK3cGEa@wendy>
References: <20220920093630.32085-1-wang.binglei@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920093630.32085-1-wang.binglei@h3c.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_033244_024714_CCDB81E1 
X-CRM114-Status: GOOD (  19.14  )
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

On Tue, Sep 20, 2022 at 05:36:30PM +0800, Binglei Wang wrote:
> From: "wang.binglei" <wang.binglei@h3c.com>
> 
> Most of the code copied from
> arch/riscv/kernel/probes/kprobes_trampoline.S

Hey Wang Binglei,

Please use the commit log to explain the reasons behind the change you
are making:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: wang.binglei <wang.binglei@h3c.com>

Unfortunately I don't know much about Asian naming, but I assume that
the . is not part of your name?

> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7c..2c1847921 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -345,6 +345,7 @@ int __init arch_populate_kprobe_blacklist(void)
>         return ret;
>  }
> 
> +#ifndef CONFIG_KRETPROBE_ON_RETHOOK

This seems quite unusual, other archs don't seem to have ifdef-ery
using CONFIG_KRETPROBE_ON_RETHOOK in their arch code so why should
RISC-V?

>  void __kprobes __used *trampoline_probe_handler(struct pt_regs *regs)
>  {
>         return (void *)kretprobe_trampoline_handler(regs, NULL);
> @@ -357,6 +358,12 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
>         ri->fp = NULL;
>         regs->ra = (unsigned long) &__kretprobe_trampoline;
>  }
> +#else
> +void __kprobes *trampoline_probe_handler(struct pt_regs *regs)
> +{
> +       return NULL;
> +}
> +#endif
 

> diff --git a/arch/riscv/kernel/probes/rethook_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
> new file mode 100644
> index 000000000..aa79630ac
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook_trampoline.S
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * rethook trampoline.
> + * Copied from arch/riscv/kernel/probes/kprobes_trampoline.S

Is this a 1:1 copy? If so, could the code be shared?
 
> This e-mail and its attachments contain confidential information from New H3C, which is
> intended only for the person or entity whose address is listed above. Any use of the
> information contained herein in any way (including, but not limited to, total or partial
> disclosure, reproduction, or dissemination) by persons other than the intended
> recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender
> by phone or email immediately and delete it!

Uh-oh! You'll have to work with your IT to get this removed before your
patches can be accepted:
https://lore.kernel.org/all/YgEnxmD9ZE4jVhP5@kroah.com/

The patch does not apply to -next for me either..

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
