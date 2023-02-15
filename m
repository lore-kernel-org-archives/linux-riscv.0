Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B15C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjAiJcAXpR4kAu6eq3FNxeq8KN6OXzvZEqURak/QDSM=; b=wq5o97vTv37pJj
	jgxW9yip5g/zQkmVgAYRmeFJIgG1n5mAVTV5cLSASLvqhR0e1Vw+Vm2kjgRSoM01FjgzBCMkIOeOM
	LbCO0sJd4SmLzIrQL8Me2hDP6FH60VPduOJb5t8VymVqY+x8aMxORjCzaH6BvTelk2CHaOjCbvogd
	nGZUp/r14nZ7k7U5RF7UQ3SScjN3L3+V1DQxS3LWAj6JSK/iBfXLWQDT6U4I3Q80FjYjpsRRbvOAG
	oFImGCPEoDWBVIdlTPdBSjI5vyBanp1HcyLoOpG9bEmMjSlbbmLAXKGtF7Bw5zt8ffTQeuc72xFRc
	RGpK0cANulDM+lbgq9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS8kC-004XSB-EU; Wed, 15 Feb 2023 03:46:08 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS8k5-004XPS-NS
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 03:46:06 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PGkSj5JJLz16NgJ;
	Wed, 15 Feb 2023 11:43:33 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 11:45:52 +0800
Date: Wed, 15 Feb 2023 11:45:32 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Guo Ren <guoren@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Changbin Du <changbin.du@huawei.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hui Wang
	<hw.huiwang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v4] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <20230215034532.xs726l7mp6xlnkdf@M910t>
References: <20230202114116.3695793-1-changbin.du@huawei.com>
 <Y+wlula69tYrSZjQ@spud>
 <CAJF2gTQBiE7d_RiNjxoyx9gppYQxXBLeNhEsX04tjtjM_56gRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQBiE7d_RiNjxoyx9gppYQxXBLeNhEsX04tjtjM_56gRQ@mail.gmail.com>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_194601_964427_79438314 
X-CRM114-Status: GOOD (  12.60  )
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

On Wed, Feb 15, 2023 at 09:24:33AM +0800, Guo Ren wrote:
> On Wed, Feb 15, 2023 at 8:22 AM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Changbin,
> >
> > On Thu, Feb 02, 2023 at 07:41:16PM +0800, Changbin Du wrote:
> > > The task of ftrace_arch_code_modify(_post)_prepare() caller is
> > > stop_machine, whose caller and work thread are of different tasks. The
> > > lockdep checker needs the same task context, or it's wrong. That means
> > > it's a bug here to use lockdep_assert_held because we don't guarantee
> > > the same task context.
> I'm trying to delete all stop_machine in riscv, from ftrace to kprobe.
> When I have done, we needn't this patch.
>
Which approch would you use? I looked through the riscv-spec, but didn't find any
description abount concurrent modification and execution.

> > >
> > > 2.25.1
> > >
> 
> 
> 
> -- 
> Best Regards
>  Guo Ren

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
