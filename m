Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E86C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:12:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF15E611AD
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF15E611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kbT6OGMPJ96MpLbbQ3V8JICPR8Yvsntr6vylLzo4rJM=; b=Cs3hzl6r4ZKSG8KSX0jAKAV6Z
	caSjnOGB/Fva10r5BoIkjnVJjg2D+MLtwVnmg9Og6hPD5qFxnTUcLTelYQK+xXJMGrIdW79nfNux5
	1epefm1aLjkFmQheuprIVqrKfnJa9iUh1cB8vfOXHRrb4FQMekCf2RSNkyN8ILo/8gSQUvlt2WKhX
	7pMXVFMeiOcHDvWeMlyAcT0ipdZJ2MPdHDNPwiTFcIqDm3Xoa71wo2sJkmOVhkjyp0zv481SBLkr+
	+0Kc2BqFO8RiQxLC5eoosmD/JdNs7As/VdXKlPssJtI3cZVgrSzLn5CeFOudKsRTEXBd/ZcIuUOsQ
	0mgklsJOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFR9-002xGA-W4; Wed, 19 May 2021 06:12:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFR7-002xFi-41
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0ZOHlTtIuO0KvtP35Ncl+RMxfppJjVep11mqcq1nXNQ=; b=E9p/HhY5/5/UFeVAYlnbhbn5Cb
 8Wely+FK+TkjYhOKQt9n9W616nAuz35Uq1Kb73ZbDV6Iffi9xsF+zJPEpijb+TDpVQ9F+taTqF7gZ
 XqRCRxnFLAvrRCbNXXGgmDGVf6Xl6Rz5OoE/f1hwNslBVZm77MHsHs7l9PO9V/D9cThOzfvly0sxD
 WtmlFVe4I+FaddG6D5x6rtXvLSnz4FCZWA2xjYCTqH4nCqC+9IGh6YjbHTH9/Jt+sAk3r5fpuw+fb
 jg0dRmBalhfQzHnV1R4zMmffUv5BajY0WLrG0U3MB7JOvLtfkQCdga1Y676ar3KHNtZh3fIMG75cp
 PuiizP6Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFR4-00FAnc-Gi
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:12:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBA8360FF2
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621404722;
 bh=aliJ2A5IaLQl1kaFJpcVaP8FxOlUquhNHY8hfbwV5oQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G9DZR23da4IjsoJ/mtAo2AxCyf5GDW2IBuWal8rsvRSUyw0YGESWBWY9765O/zFUq
 OnqbcN7Xothn9+c0LxanS4KEHJFBdg7HNlH5a7rdHiMyBlCUh1DDhbKVBx2ZPl5z1T
 SPuWPJT/TmE2An9xwQXLbCq/JmtSIpzY2dTaSpllQnS2hujMM2i0xiKWOKGhum8cAE
 nde1rhH/lYw62U5AeKtUbRnV2sD44ZCQlwXr0e2I6VYgukoTamidjdhgzrnudauYJq
 zKyF21Fnyqd+NpIXsFzM0lCvqPJA8PaZOHLV+Mezrqm25c8acZlF3PHChGjmJjsBgX
 RoQPiT48pGerA==
Received: by mail-lf1-f49.google.com with SMTP id i9so17281359lfe.13
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 23:12:01 -0700 (PDT)
X-Gm-Message-State: AOAM531n96pbIjnSKlcNBLKeCkd3sRDydvMFbmBEICu3Ut0lzaacjDnv
 PZ51wnUbFCc86d4KOEJtrroHYtKLT6zHldxzIr0=
X-Google-Smtp-Source: ABdhPJxlGj9xlx+dM6z1cg/1XfTAYuNHni/4fS0DrteOYCWlgF9XOUG9wrp/nkdsQ6fjglLfVBF0odXgygjFL2krD6E=
X-Received: by 2002:ac2:5493:: with SMTP id t19mr7293363lfk.346.1621404720345; 
 Tue, 18 May 2021 23:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de>
In-Reply-To: <20210519060617.GA28397@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 May 2021 14:11:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSd273ZuRpgFZK-UKA=LgDHGEVrWdN8admScta-mF-Hvw@mail.gmail.com>
Message-ID: <CAJF2gTSd273ZuRpgFZK-UKA=LgDHGEVrWdN8admScta-mF-Hvw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 drew@beagleboard.org, wefu@redhat.com, lazyparser@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_231202_600035_E7674662 
X-CRM114-Status: GOOD (  13.58  )
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

On Wed, May 19, 2021 at 2:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > Since the existing RISC-V ISA cannot solve this problem, it is better
> > to provide some configuration for the SOC vendor to customize.
>
> We've been talking about this problem for close to five years.  So no,
> if you don't manage to get the feature into the ISA it can't be
> supported.

arch/riscv/errata/ is also defined in riscv ISA?

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
