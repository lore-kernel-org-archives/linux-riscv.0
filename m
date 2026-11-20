Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50C606A326
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 00:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JA56cwYq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHohB7cf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kfb62g1b3SO2nuuvzDTIjkJ1ScHFVgujYFWtUpe8bBo=; b=JA56cwYq6ZWn/R7Ih8vwnPVyqS
	XS10I+rXbE53UULld9QWI8LvZQblDG455UCh/0i7gIVltq7yMmMhDq4rYIiGEjuDoe0Qr9CiXTh5j
	3Xp4msHDYlh2jAJ269bhuJlvEnTXoeOmvNh0ArEc47HCr4ZUG3cp0O4lYgKHZLqdeIpuq+GgMzJwE
	EnZ9WBKxF2p0Idc7751RGraumyIcdUDVjOoW2sCJHnEwdvITsvbpPoaQcemMl7qe3vXnzRhmitl/O
	hOxQYo4CT+vLVb75G0B3xQjA+LeMzYzriY3SN0OAKHFoJhzd+NxHItUuAov4RlhWoJ9seB1GAqh7c
	/a6qGFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUChQ-0000000Dlsj-1M46;
	Fri, 20 Nov 2026 00:41:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUChP-0000000Dlsa-0MvE
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 00:41:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8577461847;
	Fri, 20 Nov 2026 00:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9ED1F000D0;
	Fri, 20 Nov 2026 00:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135314;
	bh=cnjKBIJ05Q1s49fHgd6kk3d8IJTU42NYzeIDTxhsvQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hHohB7cflFrPXH1DBkE8glqGnVd+IsAmoLc7ukWBvBnR1BeIaPKaRlWLmmPNS8Ieh
	 +MYMV099B/96z11uJTZZWyRStZNsQn4+N3ihrdjICgZM04esn89DfwdHHEUPjffmcP
	 gUjDx/Hslg2E1Qzf877wBd8XUWuWQsPCgBkOo4g/P3yjcbay+HIMFK5G7hdECknuBb
	 b0r8AzreSblmCwqvvowxPfpXEZY8J8zLH8WntFEnTmBlPa4/mDSKlKRqMCG+MObDv3
	 pefvxsgF+Wi/nbxPuiVJbiqQGJlQXpDZ3PhiSNryZQnhvLFlFBlJLzijbgg8uMQYD4
	 ic44T3Kwp986A==
Date: Thu, 19 Nov 2026 16:41:52 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Zeng Heng <zengheng@picoheart.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Samuel Holland <samuel.holland@sifive.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, Dave Martin <Dave.Martin@arm.com>,
	Babu Moger <babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Peter Newman <peternewman@google.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] [PATCH 3/3] riscv_cbqri: Bind to RQSC platform devices
Message-ID: <av-XUDYxM9laU1_W@thelio>
References: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
 <20261117-acpi-rqsc-v1-3-381ce645751e@kernel.org>
 <CAEEQ3wnnYTdVvH+NVWLSG+rk2bTZrDF4bF1F74R0jSuhQWzaGQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnnYTdVvH+NVWLSG+rk2bTZrDF4bF1F74R0jSuhQWzaGQ@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 07:12:10PM +0800, yunhui cui wrote:
> Hi Drew,

Hi!

[..]
> > @@ -101,15 +154,13 @@ static int cbqri_capacity_probe(struct platform_device *pdev)
> >         ret = riscv_cbqri_register_cc(&info);
> >         if (ret) {
> >                 dev_err(dev, "failed to register capacity controller: %d\n", ret);
> > -               goto out_put;
> > +               return ret;
> >         }
> 
> The same multiple-controller case applies to RQSC-described devices here:
> 
> https://lore.kernel.org/all/CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com/

I would prefer to handle that scenario in a future series as I am not
sure how I would test it.

Do you have hardware that you can test it on?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
