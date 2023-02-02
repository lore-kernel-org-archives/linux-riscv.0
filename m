Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF048C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClbQGHkHi8XvTN6HqOB9YqcnlLiEjB9Yyyd9xO9n9y4=; b=4NAJl41Do5bsM2
	G02NWBEJBPgakggnqhln2VioqfgPFWvf3cGF+Mq5+aQkH69zMsP+JfJd6Z0UfnsP+kmdlhCiLa4WH
	/0PK507FmQTQFjwXNWCrHJTNHM2qAPMbrHHLbSdcH9ueYYi5dqDn7h3vrsE+m9ox7K6oB9NnPVnXR
	CR+j7iRb0n9gBgVWQD5I/OxjeJ7rZ2MKKfbc/Bd7h+XPKtHm3Jwf4iagUlt4rkUfOckAG/hReZuA4
	vTNwI8aDGBPx4hf42OTz2kkQjTN+PJu4vYgr0JTdnPdiDE+4ngh+Zlx+oL3/bwqIgNHzjPwCoZkEC
	SchWTqBfol4XY3XMXxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXwl-00FdXv-2Q; Thu, 02 Feb 2023 11:40:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXwg-00FdVu-2i
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 11:40:04 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P6xcQ3rhWzJsDr;
	Thu,  2 Feb 2023 19:38:14 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 19:39:50 +0800
Date: Thu, 2 Feb 2023 19:39:29 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Changbin Du <changbin.du@huawei.com>, Guo Ren <guoren@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hui Wang <hw.huiwang@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Changbin
 Du <changbin.du@gmail.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v3] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <20230202113929.mmbpumsvzqbnxcb5@M910t>
References: <20230130232659.3374212-1-changbin.du@huawei.com>
 <Y9fdtcoh8POLZ6CD@wendy>
 <CAJF2gTQm_iHHEOEv+38G6nqjDO5b+oDcUOXi8uKxZLXvG249Kw@mail.gmail.com>
 <Y9jIPOLxRRrjMo2t@wendy>
 <20230201210031.x7c5xlgxxiaoahqz@M910t>
 <Y9pwo5iC7hrPm/wk@wendy>
 <20230202230043.737f6z3mi2thukgz@M910t>
 <Y9tt6MCMXK4c8W6E@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9tt6MCMXK4c8W6E@wendy>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_034002_502782_5D8F90F8 
X-CRM114-Status: GOOD (  39.02  )
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

On Thu, Feb 02, 2023 at 08:01:44AM +0000, Conor Dooley wrote:
> On Fri, Feb 03, 2023 at 07:00:43AM +0800, Changbin Du wrote:
> 
> btw, something is wrong with your mail client or host machine.
> Everything that you are sending is timestamped in the future,
> as it is currently 15:57 on the 2nd in UTC+8.
>
hmm, my machine goes 12 hours ahead. Thanks for your remainding.

> > On Wed, Feb 01, 2023 at 02:01:07PM +0000, Conor Dooley wrote:
> > > On Thu, Feb 02, 2023 at 05:00:31AM +0800, Changbin Du wrote:
> > > > On Tue, Jan 31, 2023 at 07:50:20AM +0000, Conor Dooley wrote:
> > > > > On Tue, Jan 31, 2023 at 03:26:33PM +0800, Guo Ren wrote:
> > > > [snip]
> > > > > > > >
> > > > > > > > -     /*
> > > > > > > > -      * Before reaching here, it was expected to lock the text_mutex
> > > > > > > > -      * already, so we don't need to give another lock here and could
> > > > > > > > -      * ensure that it was safe between each cores.
> > > > > > > > -      */
> > > > > > > > -     lockdep_assert_held(&text_mutex);
> > > > > > >
> > > > > > > I must admit, patches like this do concern me a little, as a someone
> > > > > > > unfamiliar with the world of probing and tracing.
> > > > > > > Seeing an explicit check that the lock was held, leads me to believe
> > > > > > > that the original author (Zong Li I think) thought that the text_mutex
> > > > > > > lock was insufficient.
> > > > > > > Do you think that their fear is unfounded? Explaining why it is safe to
> > > > > > > remove this assertion in the commit message would go a long way towards
> > > > > > > easing my anxiety!
> > > > > > >
> > > > > > > Also, why delete the comment altogether? The comment provides some
> > > > > > > information that doesn't appear to become invalid, even with the
> > > > > > > assertion removed?
> > > > > > Stop_machine separated the mutex context and made a lockdep warning.
> > > > > > So text_mutex can't be used here. We need to find another check
> > > > > > solution. I agree with the patch.
> > > > > 
> > > > > Whether or not you agree with the change is not the point (with your SoB
> > > > > I'd hope you agree with it).
> > > > > I understand that you two are trying to fix a false positive lockdep
> > > > > warning, but what I am asking for an explanation as to why the original
> > > > > author's fear is unfounded.
> > > > > Surely, having added the assertion, they were not thinking of the same
> > > > > code path that you guys are hitting the false positive on?
> > > > > 
> > > > The assertion is reasonable since the fixmap entry is shared. The text_mutex
> > > > does should be held before entering that function. But the false positive cases
> > > > make some functions (ftrace for example) difficult to use due to warning log
> > > > storm.
> > > > 
> > > > Either the lockdep should be fixed for stop_machine, or remove the assertion
> > > > simply now (we can keep the comments). (or do the assertion conditionly?)
> > > 
> > > How would you suggest checking it conditionally?
> > >
> > Please refer to a early patch from Palmer Dabbelt.
> > https://lore.kernel.org/all/20220322022331.32136-1-palmer@rivosinc.com/
> 
> Oh cool, thanks for that.
> Why not resend that approach, with your suggested fixup for
> ftrace_init_nop() then?
> It looks more complex, but is less worrisome & has an R-b from Steven
> already.
> 
Personally I don't like the complex change, because the clients of text patching
api are very limited. So I think it's not hard to take care of it. (The arm code
also doesn't have the assertion)

So I would leave the decision making to maintainers :) Anyway I will send V4 as
a candidate.

> Thanks,
> Conor.
> 



-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
