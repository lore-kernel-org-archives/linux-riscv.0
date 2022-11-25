Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLxx7Bs0A9SQYs44Zsg7bn+fMeFb445s5ptp5d4P+EU=; b=OjzRshb5WpYLbf
	Cthue2QdJ2uo7+KIBzFGjbTSN2hF1D0w8c0OgNcI1hhS37Kvd9fWPnCdN4AS10vLwa0YheGShen8N
	vehKLyMpKCzK77biec0y0hzOUp4hNdxbiRlKZugs6M4S0kuL4xSovyMCfWTPDLGrMU+CTs/okqzi+
	VqhtGiOgl12DCRGV0jXUVC96lYcrewZyQqXuP8qwe9aMuVeoFeEDyNLtTpV8bie1ljFjQTdKwpnDi
	DTFWNyd59I6QcR9nueBlXDp2I638yOxb3szD4AhfSLAGyh8MPkwDjIO/N4sFlW6smTQ4NdBHO5e5N
	jMxijBTJxUdgtgxM00CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZ0X-00Glhb-7R; Fri, 25 Nov 2022 13:44:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZ0U-00Glfx-0Y
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:44:44 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D6E9B3F339
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669383878;
	bh=H7WgkO/jthnfYyqghB3+uZ02vDcS06QazZEvHsZ2tPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=K0frvN0ZRrrvJqtj2AVKiz7nrBpU0JlJBZyTZa++n4lRZBwJUvfJYHFqSm/iM8BqU
	 iAN2ME+9noYvWs/l95IOFjMFgYxXycTdyJuS+/qJiBKa3yCYCmzIUpacoTvmKE5ppq
	 aUBk/5lEgFvzHp/146lbwJpYmAsjE1ADrMUsDJf0ApA4JAuiTboyDpX5+HYldmpt3F
	 R3j4JiZ+4OirHVIIKVU7r8uFeEOmbJqGz0Q/i7glV3yKMQVbtsNa20zMNmpAz0UYyN
	 Bj9hiK716YfMrLvRTKpU+ZAQ+YPS9I9U0/WtU2ZVDsG7oqOCPErdBKPSxWU6Fql6vF
	 LBC1tjrpzZAoQ==
Received: by mail-ej1-f69.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so2292181ejc.15
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 05:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7WgkO/jthnfYyqghB3+uZ02vDcS06QazZEvHsZ2tPA=;
        b=YdawtnkqiLPj9RKzi7uhMSTC/8afZjN+zaS39qt7Ut4rbkYM51eLD51/06L2qb3Exz
         LMyjsfid60KZgVb6/lqhlGHAgDs/sh5rt8jYcTijbFcWXqy/X9DErtkjzUFuzNhCJr/9
         JpHDeCyYs55B15CD6ABCTiS9YfT5ZmGhIiBCqzm7hB3M/wjusIDKtiBQhrF5sTpVuPnt
         NvMn2ofaKDJ3T8yf7dR6p7HiTldy5EO6izbKqu/0pAeXw+y4rLmq3x42iLxdQjdsNRl8
         U9k+O/sg2127xgIT0z2ZJdz1fUPkTGl3gazEz3/mcKLnlSH39bxYtcx+KToSK7HbUsms
         cYNg==
X-Gm-Message-State: ANoB5pksohPR0GBj7TO7MBeqfqFx+iE3sCfUEtu4Nb6kinFXdENPZ7Xy
	WppR0JEdZ1kCQndp+NHnIwo40NgtmRnfiUG/OqE/BiEiGBsKu+EPPHNlEYGfASGrSNdNJBiPChT
	L9YJOmJfZTIXC4Pk9puTGWXmmDNifFMeqpcWyA5Tw9XnrjQ==
X-Received: by 2002:a17:906:5a9a:b0:7bc:26e:a259 with SMTP id l26-20020a1709065a9a00b007bc026ea259mr4681499ejq.445.1669383878543;
        Fri, 25 Nov 2022 05:44:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5C9lKruuxJCkUDFDDG9/Rf6eznqrgnehqdS7LMq93QVRBj4Qh1HwPA0xlZ3myltBwGs9wZMw==
X-Received: by 2002:a17:906:5a9a:b0:7bc:26e:a259 with SMTP id l26-20020a1709065a9a00b007bc026ea259mr4681482ejq.445.1669383878284;
        Fri, 25 Nov 2022 05:44:38 -0800 (PST)
Received: from localhost ([95.236.177.174])
        by smtp.gmail.com with ESMTPSA id k26-20020a17090632da00b0073022b796a7sm1581335ejk.93.2022.11.25.05.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 05:44:37 -0800 (PST)
Date: Fri, 25 Nov 2022 14:44:37 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: increase boot command line size to 1K
Message-ID: <Y4DGxWLIVx9p9TS+@righiandr-XPS-13-7390>
References: <20221125133713.314796-1-andrea.righi@canonical.com>
 <6fee29f8-8150-e6ec-e2ec-210610a7e27d@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fee29f8-8150-e6ec-e2ec-210610a7e27d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_054442_217100_FF71A660 
X-CRM114-Status: GOOD (  24.97  )
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

On Fri, Nov 25, 2022 at 02:41:11PM +0100, Alexandre Ghiti wrote:
> Hi Andrea,
> 
> On 11/25/22 14:37, Andrea Righi wrote:
> > Kernel parameters string is limited to 512 characters on riscv (using
> > the default from include/uapi/asm-generic/setup.h).
> > 
> > In some testing environments (e.g., qemu with long kernel parameters
> > string) we may exceed this limit, triggering errors like the following:
> > 
> > [    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> > [    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
> > [    3.333233] Hardware name: riscv-virtio,qemu (DT)
> > [    3.333550] Call Trace:
> > [    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
> > [    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
> > [    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
> > [    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
> > [    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
> > [    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
> > [    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
> > [    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
> > [    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
> > [    3.335857] SMP: stopping secondary CPUs
> > [    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
> > 
> > It seems reasonable enough to increase the default command line size to
> > 1024, like arm, to prevent issues like the one reported above.
> > 
> > Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> > ---
> >   arch/riscv/include/asm/setup.h      | 7 +++++++
> >   arch/riscv/include/uapi/asm/setup.h | 7 +++++++
> >   2 files changed, 14 insertions(+)
> >   create mode 100644 arch/riscv/include/asm/setup.h
> >   create mode 100644 arch/riscv/include/uapi/asm/setup.h
> > 
> > diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
> > new file mode 100644
> > index 000000000000..f4fe549aab40
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/setup.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASMRISCV_SETUP_H
> > +#define __ASMRISCV_SETUP_H
> > +
> > +#include <uapi/asm/setup.h>
> > +
> > +#endif /* __ASMRISCV_SETUP_H */
> > diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
> > new file mode 100644
> > index 000000000000..5738f93ae437
> > --- /dev/null
> > +++ b/arch/riscv/include/uapi/asm/setup.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _UAPI__ASMRISCV_SETUP_H
> > +#define _UAPI__ASMRISCV_SETUP_H
> > +
> > +#define COMMAND_LINE_SIZE 1024
> > +
> > +#endif /* _UAPI__ASMRISCV_SETUP_H */
> 
> 
> Just for reference to previous discussions regarding this: https://lore.kernel.org/lkml/CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com/T/
> 
> Thanks,
> 
> Alex

Ah! It has been address/discussed already, great! Thanks for pointing
that out and sorry for the unnecessary patch. :)

-Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
