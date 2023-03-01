Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1508C6FA9D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfT5+fI6TGY6aIBpRHdBoBoefLo7NzfjM9Xx5getWO0=; b=CGdYqimESF2tQ0
	eLGJYC2rywpHlFwWkqpG7Syg5ft5IOH6FsKLR7VbAlsVLkRoX62mQ0ZgrjCHldHE0/036bi0q8Uui
	hdWk0WCve1gqZtVupnvb5G+x5ABuTqaoleTxG+0Uhlzz507lECl1zq/B8aCt2vt8ESqXMYGJ2tBve
	/gBdy/HFYW28nfdWxSQWXCxwNznXsxzqKJ291MjM9BJin1ktDDf9ch0n3+3SQOeEREp0zkbvM0T18
	xtZLcNH7hmko3VTBKRsL3KtEzS5EEPCwqotppwgnvHgft7zgCqqns1xeQBPqToULPbnthcHfzJoyt
	htFF/MHB/Ob+JAvhGx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPll-00Gu6h-FW; Wed, 01 Mar 2023 16:57:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPli-00Gu67-PI; Wed, 01 Mar 2023 16:57:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46A7D61419;
	Wed,  1 Mar 2023 16:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3313FC433EF;
	Wed,  1 Mar 2023 16:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677689849;
	bh=yaPbTuqvzSZPUD5byFXCQgw/KYy/ybMqt50jxgUlau8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iUta2dxpT4sL7j8io+ssCFItLk++aHVUWwtcZ8cgWBspiWdXgyLyVdnovVWTJhgh4
	 lhyfJC4eU4mrcRBL74RKmGiFzDZpNiBfzVk9k+OBCqxD60OPMM0Ut5SOxGuzN6Gj8E
	 yAYjFiKH36lK4V0Lvzx3DmKXvgE9Vk4ekhvcUBBqIVss0iZBmHikactTEwwwBTcz1B
	 /3iYaKan2tmlZ0i3teeKagQYF/0KK1bIF5Y6hMu+xnoZZH0EjbpmPtkm/p9xsgCgtp
	 IkUlORx4Cg6J2TP+hzAAEdKuMv0O+EZDyd9wRCCj6NTSnI7SJbn39lpkeISYHsR7r7
	 AbgjVcUA4Q6vA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com,
 Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org,
 atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren
 <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, Nick Knight <nick.knight@sifive.com>,
 anup@brainfault.org, Ruinland Tsai <ruinland.tsai@sifive.com>,
 greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>,
 vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincent Chen <vincent.chen@sifive.com>,
 palmer@dabbelt.com, "Eric W. Biederman" <ebiederm@xmission.com>,
 kvm-riscv@lists.infradead.org
Subject: Re: [PATCH -next v14 09/19] riscv: Add task switch support for vector
In-Reply-To: <Y/+AN0e5netDShxx@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-10-andy.chiu@sifive.com> <Y/+AN0e5netDShxx@spud>
Date: Wed, 01 Mar 2023 17:57:27 +0100
Message-ID: <87v8jk8l54.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_085730_898181_63BC2B1A 
X-CRM114-Status: GOOD (  16.17  )
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

Conor Dooley <conor@kernel.org> writes:

> Hey Andy,
>
> On Fri, Feb 24, 2023 at 05:01:08PM +0000, Andy Chiu wrote:
>> From: Greentime Hu <greentime.hu@sifive.com>
>> 
>> This patch adds task switch support for vector. It also supports all
>> lengths of vlen.
>> 
>> [guoren@linux.alibaba.com: First available porting to support vector
>> context switching]
>> [nick.knight@sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
>> code refine]
>> [vincent.chen@sifive.com: Fix the might_sleep issue in riscv_v_vstate_save,
>> riscv_v_vstate_restore]
>> [andrew@sifive.com: Optimize task switch codes of vector]
>> [ruinland.tsai@sifive.com: Fix the arch_release_task_struct free wrong
>> datap issue]
>> [vineetg: Fixed lkp warning with W=1 build]
>> [andy.chiu: Use inline asm for task switches]
>
> Can we *please* get rid of these silly changelogs in the commit messages?
> Either someone did something worthy of being a co-developer on the
> patch, or this belongs under the --- line.
> It's a bit ridiculous I think to have a 15 word commit message for the
> patch, but have like 8 different bits of per-version changelogs...

Yes, please! And not only for this patch, but for the series in
general. The series needs a respin for various reasons, so now would be
a good opportunity to clean up the changelog.

Simply move it to the cover letter, or below --- as Conor suggests.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
