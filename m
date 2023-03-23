Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49DBC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv9tUAUpbTMTyfdDG+o6QQeZYi6vWuuaTki2Ze5w/Ls=; b=HkBcxAndRaZ9PQ
	mwnHDL2t8H9hdU4B/0vaI29+MK97TGgxhfv86ZqLFDMkzom5MkorGmgPe/X0a/i2jPwGU+GvkSUN1
	ONZIfubUkLhnM7w7RXtSwfsDw6TbanzyM30TRh6VsgaDzW7mFkzMHgMnzh4VnhOyrk9CDx24Dv+TU
	Fj6uRa5rEw44Fyw6J/alleZZF32N6j0Au4piWcmpYfEzEhYPbn/2BYseV8/skN7xP3ReVT9yTyHQ8
	vHDbbSQf7X83pVmbS5hzuVUGnyD8KtnS9904rGea2sx7bmY0xw8Du/HwGX6qfX0l/WOCXvPmYjCgR
	VoqDZe+8zO5BCJh0yfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOfa-002aXr-1u;
	Thu, 23 Mar 2023 17:24:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOfX-002aXB-1r
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 17:24:08 +0000
Received: by mail-ed1-x533.google.com with SMTP id cn12so44345315edb.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679592245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zWO1/jUFd4RJnO28yjlA8l9Qr4+du9+9sjmz8G/d7Jk=;
        b=PLFpiDTtN+CiMt1ZibhiyF6XIqR6IGRFiHd3YLiatnXSMgCkKNPaIsTxDMAkxffeMN
         h0Dlp1RxefC3IPQoUuOT6VsI5KVLAQhw8hBaO07GqAonBTZ8m2d2gEa7vTE4bk/QDnlI
         iRTu0f1/pgNGSnh7TOFkMbEXJuf8VquDWuuiq0H4MXY6HQkF9S/6yfms/ZWdUU3hF2JK
         ky5zwDZnoCBTSRRw1+E2CsbNrmDt9IDcB9ghag/t4XE9CLUvlcGtJN4vsAyC81Yh5cRv
         yOVJAF5xc/b3SQfvmoU0jgyqWqQUmZO7hqddaCHE/ZXLMLDYaJi04ceD+jS2fFHY1lar
         g1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWO1/jUFd4RJnO28yjlA8l9Qr4+du9+9sjmz8G/d7Jk=;
        b=AlzSLh8axD4hA+OieWfc3YuwhMqPoS90Y91NkQPfgi8MHhXW9eAaxHrckMxmpWfQPl
         19RfPC0ulr0cJiaYxnSiDhsXO0vX+sOgh9yfJ3EisDL7A9AUOrE/AE0S5FG4hbqQhnRT
         9O5YLfC4b+5PPd0oZjpwuIqb7rSfKjLnePL+Bm8OX9BtHule9wK5F/mcU4eBQXDIyuWC
         AUQM9buRJ/AcNss7AF1lHvMmOoYzB+mImNljdVuM15/JoTtcePQPeJ39XfeBQVes5AOh
         EVWbdus/GDZAfsAgnnJoCYocu+ns/wabZ/+CxRC6WL6zK4hQ9RucKtNVFo4unZ+CM3LO
         NhaQ==
X-Gm-Message-State: AO0yUKXdTcrtHV2erKYFtRxZ8NrTF5SYwCAlD9iBQiBK866NTnoasQ8U
	4BYtxWGMUDSIz5kk8SvKHR7O1Q==
X-Google-Smtp-Source: AK7set81fv7ZRLP4oUooBclsYYTpRvTEdvrCtqeHBgokhJImFboslLnFA2d4moFS9zFAO5kO0HRfDA==
X-Received: by 2002:a17:906:9154:b0:930:bcee:eed with SMTP id y20-20020a170906915400b00930bcee0eedmr11196273ejw.9.1679592245178;
        Thu, 23 Mar 2023 10:24:05 -0700 (PDT)
Received: from localhost (cst-prg-89-179.cust.vodafone.cz. [46.135.89.179])
        by smtp.gmail.com with ESMTPSA id ml23-20020a170906cc1700b0092ce8344078sm8956676ejb.33.2023.03.23.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:24:04 -0700 (PDT)
Date: Thu, 23 Mar 2023 18:24:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] riscv: export cpu/freq invariant to scheduler
Message-ID: <20230323172403.nfrtgm5vea4qvinu@orel>
References: <20230323123924.3032174-1-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323123924.3032174-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_102407_621231_71725A06 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, Mar 23, 2023 at 08:39:24PM +0800, Song Shuai wrote:
> RISC-V now manages CPU topology using arch_topology which provides
> CPU capacity and frequency related interfaces to access the cpu/freq
> invariant in possible heterogeneous or DVFS-enabled platforms.
> 
> Here adds topology.h file to export the arch_topology interfaces for
> replacing the scheduler's constant-based cpu/freq invariant accounting.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
> changes from V1:
>   - fix the leading underscore and tidy the patch up 
> ---
>  arch/riscv/include/asm/topology.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 arch/riscv/include/asm/topology.h
> 
> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> new file mode 100644
> index 000000000000..727e8d163a3b
> --- /dev/null
> +++ b/arch/riscv/include/asm/topology.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_TOPOLOGY_H
> +#define _ASM_RISCV_TOPOLOGY_H
> +
> +#include <linux/arch_topology.h>
> +
> +/* Replace task scheduler's default frequency-invariant accounting */
> +#define arch_scale_freq_tick	topology_scale_freq_tick
> +#define arch_set_freq_scale	topology_set_freq_scale

I was thinking all the right hand side would line up, which means
the above two need additional tabs and so does topology_get_cpu_scale.

> +#define arch_scale_freq_capacity	topology_get_freq_scale
> +#define arch_scale_freq_invariant	topology_scale_freq_invariant
> +
> +/* Replace task scheduler's default cpu-invariant accounting */
> +#define arch_scale_cpu_capacity	topology_get_cpu_scale
> +
> +/* Enable topology flag updates */
> +#define arch_update_cpu_topology	topology_update_cpu_topology
> +
> +#include <asm-generic/topology.h>

I'd also prefer a blank line here.

> +#endif /* _ASM_RISCV_TOPOLOGY_H */
> -- 
> 2.20.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
