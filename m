Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4033FC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 05:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3Ygo7IQBdkB+biT8cpiUTzT+o2WLA290KAV6nkTtsM=; b=ivERKXyRNCHL+n
	NuMebjCOX4bkl52Y7yRO66h9sKGeryFZIhTz6n+I9PjGOBSbVTBhdT4wIbTVSZNuB0nCByxxmIjL/
	eEmmP+kmm37LT480fO3lNldaJvvnY6HzxZg50nrxcjMXPWOv0etMd+DaDIpz0OtPRGCCMmQRWC4cB
	7t4MGdCXSAtKm/yXcP3OrEifaNMkb7KUWkZD0ETHvklM1B5dn8Ac+0zdMWaIiWZv4b4c0otImnKmP
	827TkuMBodoElVo4sLdqNEuxxQZqPla9FJp8R4KPqiNND3Q7A9O/OSHJGhH7qOSZ8HY8WnZB66/zB
	7xP00zbDJswSrn2I7SVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5El-00AFjE-FW; Wed, 01 Feb 2023 05:00:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5Ei-00AFh5-Au
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 05:00:46 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P68p46Y8jzJrPZ;
	Wed,  1 Feb 2023 12:58:52 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 13:00:27 +0800
Date: Thu, 2 Feb 2023 05:00:31 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Guo Ren <guoren@kernel.org>, Changbin Du <changbin.du@huawei.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hui Wang <hw.huiwang@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Changbin
 Du <changbin.du@gmail.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v3] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <20230201210031.x7c5xlgxxiaoahqz@M910t>
References: <20230130232659.3374212-1-changbin.du@huawei.com>
 <Y9fdtcoh8POLZ6CD@wendy>
 <CAJF2gTQm_iHHEOEv+38G6nqjDO5b+oDcUOXi8uKxZLXvG249Kw@mail.gmail.com>
 <Y9jIPOLxRRrjMo2t@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9jIPOLxRRrjMo2t@wendy>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_210044_586368_8439ACC1 
X-CRM114-Status: GOOD (  25.56  )
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

On Tue, Jan 31, 2023 at 07:50:20AM +0000, Conor Dooley wrote:
> On Tue, Jan 31, 2023 at 03:26:33PM +0800, Guo Ren wrote:
[snip]
> > > >
> > > > -     /*
> > > > -      * Before reaching here, it was expected to lock the text_mutex
> > > > -      * already, so we don't need to give another lock here and could
> > > > -      * ensure that it was safe between each cores.
> > > > -      */
> > > > -     lockdep_assert_held(&text_mutex);
> > >
> > > I must admit, patches like this do concern me a little, as a someone
> > > unfamiliar with the world of probing and tracing.
> > > Seeing an explicit check that the lock was held, leads me to believe
> > > that the original author (Zong Li I think) thought that the text_mutex
> > > lock was insufficient.
> > > Do you think that their fear is unfounded? Explaining why it is safe to
> > > remove this assertion in the commit message would go a long way towards
> > > easing my anxiety!
> > >
> > > Also, why delete the comment altogether? The comment provides some
> > > information that doesn't appear to become invalid, even with the
> > > assertion removed?
> > Stop_machine separated the mutex context and made a lockdep warning.
> > So text_mutex can't be used here. We need to find another check
> > solution. I agree with the patch.
> 
> Whether or not you agree with the change is not the point (with your SoB
> I'd hope you agree with it).
> I understand that you two are trying to fix a false positive lockdep
> warning, but what I am asking for an explanation as to why the original
> author's fear is unfounded.
> Surely, having added the assertion, they were not thinking of the same
> code path that you guys are hitting the false positive on?
> 
The assertion is reasonable since the fixmap entry is shared. The text_mutex
does should be held before entering that function. But the false positive cases
make some functions (ftrace for example) difficult to use due to warning log
storm.

Either the lockdep should be fixed for stop_machine, or remove the assertion
simply now (we can keep the comments). (or do the assertion conditionly?)

And this is not a riscv only problem but common for architectures which use
stop_machine to patch text. (arm for example)

> Perhaps Zong themselves can tell us what the original fear was?
> 
> Thanks,
> Conor.



-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
