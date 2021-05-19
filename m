Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19657C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:49:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35C361355
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35C361355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IE/G1tET1xniXcxy9HE1KlZ88YacRC47Snf6vdG2Vo4=; b=d+2sGv98WfBxcdaCoM5XTwAKj
	AymzbcTLPZeL+EJAU9k9iAuguvRjTqi93k9uSWvoAMXACH0q7+T3uCy0AHZ3mdYJso5fsJI4MOZod
	7dx+nrmTsppOzhLWQcjxKuHFDwIGMMQ735hhcmd3zHifIyTK1VCktRn/3AsiEjLLKFPJt7oNkhvpY
	plV/QKVJSmx9hbyFWM0eLRYOKQVEG+PfbHvy437ft5JCGlrm+08fBIF4sSnAwtYoXBeWKsS+vFFs0
	NTNggp6ZH6YSNm5bU2wvOEGVr4RqnhWchdbzDEeJtlljdrjw02MYD5tuMZozsICg56iVMebHOkN6v
	erZXTsqZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljF4U-002vF9-PL; Wed, 19 May 2021 05:48:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljF4S-002vDm-0W
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sFd5QyzvSC+aGnwbIVs5f+JbQ78UujHCh3+Bc+nMwvU=; b=uQUCu+QFlEt2klAHnvBt6L3Y2H
 tfRz7cJnFXNlhj6J/dRRNgUHHCbPAVGJOYeQ+/wRcWMIJARs1vaS6k/ohTMnvlbraDGFGb5FP/dPQ
 xjkbQYM6iEboBg3/ispk6YoZL0K19Bjm/SEwXEqFREJh0qRvuD3SJalAu9prFU3fmxgspNrkd73/1
 GN8k+l/fm9lgWetd/MLlhHpoXBba74dIay99xvdSfkHHLuXRS//PqqWER3oh2TPmvglO7ei8Nu07T
 FOG55ltwdy5WTVYPXX+WnYbMhEH64IMlCQbUFwi6H87rzeuJRcJCmijRfrj90ky47Niy90sNBxFmH
 dEWuBmMg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljF4P-00F9wC-Ah
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:48:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C05DD613AD
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 05:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621403316;
 bh=1M/78skAnJ0O2EA7jNQp+kPITl517U87tfk5kFLTNwo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lncOtVDAEu7HiiRH4NkTlbuFCw039Zi8FHl47j/D8o8b6429d7pMItzt92Zuqn/md
 1k+rbV+ujbbDaXukjm0H+1NkPpRruxJUxHosKCKcTPnfO6GNB2cIPjYaZNGrcS4NaE
 GHVDbor7fM1s6Abpb3MI0t36fipqE5D8L9qat0/El/+e3kqejTkZ/+k+/nWPZ1mAzc
 PuHDXrty+uIaYvgimxcHDmatLZfVnBz1m9NmKx/pMsYHPhhU/LaDAkRTimQGn8DGza
 QJUH2Wr6BcISqxxFuI7L3y/p6NxUoWyT+xqpmuXHfj3/CzbkZ80qIsBFio5u6tyKDc
 Ze99bV9iojkDQ==
Received: by mail-lf1-f46.google.com with SMTP id w33so9281771lfu.7
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 22:48:36 -0700 (PDT)
X-Gm-Message-State: AOAM530s7S200nTtOEKWdNXXXPhMYGb/JLeVMUnDqzWT4+k5J6wKcHrq
 9rLZz2b5A9lTK440rLahLKbtzf4vNptcvi4D4EQ=
X-Google-Smtp-Source: ABdhPJyZmJGTwo2722UUz7WdRiEPE80dASqU/bVhjb4FY4dMa4G28pS/d7JsiaV39IWXLH9tUctL90X9qaaj9JfV8T0=
X-Received: by 2002:ac2:5493:: with SMTP id t19mr7208809lfk.346.1621403315041; 
 Tue, 18 May 2021 22:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
In-Reply-To: <20210519052048.GA24853@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 May 2021 13:48:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
Message-ID: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 drew@beagleboard.org, wefu@redhat.com, lazyparser@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_224837_408291_6049A27B 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, May 19, 2021 at 1:20 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 19, 2021 at 05:04:13AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> > vendors define the custom properties of memory regions in PTE.
>
> Err, hell no.   The ISA needs to gets this fixed first.  Then we can
> talk about alternatives patching things in or trapping in the SBI.
> But if the RISC-V ISA can't get these basic done after years we can't
> support it in Linux at all.

The patchset just leaves a configuration chance for vendors. Before
RISC-V ISA fixes it, we should give the chance to let vendor solve
their real chip issues.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
