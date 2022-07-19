Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF20C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vlmaxH4Z5VmhkvqZWiFqnsM3oHKlp6Rk+TNI4LpXH0=; b=igpQw2XFJSwPxD
	OIly0NKpFK6iuv0NT6lCKYU0dKVLVJ5ugJvpmDu+gggEdrUDCocCkgWzVAavB8bCnCgKTivd0OY82
	7eFvYUcNNbNgISbBbt1KdRz7mtR7k1R75ZmDW7nHoazspgxyDLk0En90pcDwrarrsJ8E6mjiRpOwj
	Q0yVioqzdm3z0CojXlT03XemSDiX6ZGlmax0eHkJavBwWOqSH98D4KArVWYsBLt1BL6A66Ow+3i6s
	AbrBdGIH2yjLBRjczciMlf5NAgV/N0PDpEriIW6+2bxQ58giNgj85qNobLDg/l4dOj+8bErD6uLjV
	yVaGNiHpPhlhlM2rCQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDp5l-00A0ra-Hp; Tue, 19 Jul 2022 15:24:57 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDp5a-00A0mu-7G; Tue, 19 Jul 2022 15:24:47 +0000
Received: by mail-qt1-f173.google.com with SMTP id y9so7890794qtv.5;
        Tue, 19 Jul 2022 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HV4Wgjz/TAUUMEiA/dyksbNxySCx+zbsJF2fZfi2554=;
        b=gqic9X1MEt/RL8VhHaKj0mOyYrBt7teQ8kgGaVKQUggj1zLiDGAhK1AmuGfQacVEef
         1pcYA97HVLVtGXMO79BWfsV0xJeF0RaLI1CjYZZgpWZgRmaldsVtFtuhupQwNYR2GJRT
         1Vb/FmqInsAEaJZcGXtILw7IjMWDBLV2950VObZVQ/YtERS4yHjrrG3v+F+IW4NwYvXC
         UFr3VcH37JaYRPEJVrx6oowWhG0SqwXoIEOrmLVldJifpkhlKp1jURucjdvWnsp2eSaM
         CHNyGOVAKtTA2XG42tYDAq6v/I3VUjiTTp0IrjDw9n8Ok0UZdxquQMnNFSv3hTLxzDXl
         yvyQ==
X-Gm-Message-State: AJIora+yfdNnP3ftH1HbiJj5T3AFcU0ryjmaeDbqC1MGB/8Qs53z/glg
	sxeepiPRA1WMbBoMFxUmRZrKW3RwXlL/aA==
X-Google-Smtp-Source: AGRyM1vPpSRPrCD+VFEpfxrMRmRYW73LAyyOY2vodkfOSVmG0/sgXjDt4l5+cY0/2XNksW5UO+dFSw==
X-Received: by 2002:ac8:5b90:0:b0:31e:e9dd:65ea with SMTP id a16-20020ac85b90000000b0031ee9dd65eamr10063683qta.289.1658244284554;
        Tue, 19 Jul 2022 08:24:44 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id h16-20020a37de10000000b006a693e46d5csm13753316qkj.11.2022.07.19.08.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 08:24:44 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id j67so4459661ybb.3;
        Tue, 19 Jul 2022 08:24:44 -0700 (PDT)
X-Received: by 2002:a25:bc8e:0:b0:66e:fe43:645c with SMTP id
 e14-20020a25bc8e000000b0066efe43645cmr32967226ybk.202.1658244283883; Tue, 19
 Jul 2022 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220715102609.2160689-1-sudeep.holla@arm.com> <20220715102609.2160689-2-sudeep.holla@arm.com>
In-Reply-To: <20220715102609.2160689-2-sudeep.holla@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 17:24:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfr3kzdacSJkPaOZ56x+7tJ1MjrUz+VG+Y+8aL+XW+jg@mail.gmail.com>
Message-ID: <CAMuHMdVfr3kzdacSJkPaOZ56x+7tJ1MjrUz+VG+Y+8aL+XW+jg@mail.gmail.com>
Subject: Re: [PATCH -next v2 2/2] arch_topology: Fix cache attributes
 detection in the CPU hotplug path
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ionela Voinescu <ionela.voinescu@arm.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_082446_279416_FBB892D5 
X-CRM114-Status: GOOD (  25.61  )
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

Hi Sudeep,

On Fri, Jul 15, 2022 at 12:28 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> init_cpu_topology() is called only once at the boot and all the cache
> attributes are detected early for all the possible CPUs. However when
> the CPUs are hotplugged out, the cacheinfo gets removed. While the
> attributes are added back when the CPUs are hotplugged back in as part
> of CPU hotplug state machine, it ends up called quite late after the
> update_siblings_masks() are called in the secondary_start_kernel()
> resulting in wrong llc_sibling_masks.
>
> Move the call to detect_cache_attributes() inside update_siblings_masks()
> to ensure the cacheinfo is updated before the LLC sibling masks are
> updated. This will fix the incorrect LLC sibling masks generated when
> the CPUs are hotplugged out and hotplugged back in again.
>
> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> v1->v2:
>         - No change in this patch, but 1/2 was added to fix possible
>           bug "sleeping in the atomic context" with this patch.
>         - Added all the received tags

Thank you, the "Early cacheinfo failed, ret = -12" is gone.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
