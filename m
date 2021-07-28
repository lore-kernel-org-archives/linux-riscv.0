Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C61CC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 13:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986BF60EC0
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 13:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 986BF60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2GhKC/ckTTo7zAVfSws+Luyq4p06Tnn4X0ocdNOl2I=; b=YuappD41rcYL0N
	75O6nUa7rORQhKYumQ80/CpzIlSyFiKV8m32lT5riFFd5Dje3infzLVPS807rvDimFSmrfkj2wxzD
	DDHT7yLBj4KFSuKSdvMNO0LPEofQXXAF+WWw1Q0uKDKUMPwx+dsFu7PF4aAIQL3kaqdIyYWVlgk+b
	4TmMisR4k92KpYrL3EupKnOzjYyLb/L9btYbgDI1XGrbpV2JW2Ud5qa12EcuhUyPBQ+dbfkZjmrgI
	4swhIzvuymojPfM7mBdKw/9jEtJEojdgSdheCUmBKms76L8b1bv8Ol+apOORsD0JRCT19+xM0IjtC
	u01xG1Iv4QVLjLvHj48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8jsa-000pEi-Hk; Wed, 28 Jul 2021 13:45:48 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8jsW-000pD9-OM
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 13:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=gSlg8rRsSXoJ0fWh8d+x+IcEx/wtHhvBcH
 sY6dFKF0A=; b=ryb3fbKBlgKMA7reFRVg6exgROkuPU0THvFSabOvpO+g9BEPCX
 tN1gXX639yATePUgxA9cf763wOW0BXsDGKGp5vIqIZ/VDL/51RF18sUhdf88n34S
 CJ3CwbkrW1Jx1f7I6siaaXlQB5LQG3C3TEVFiPXfGrEt6dQhkFokIMefg=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygA3Tkx8XwFhDnNaAA--.1287S2; 
 Wed, 28 Jul 2021 21:45:32 +0800 (CST)
Date: Wed, 28 Jul 2021 21:39:34 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Changbin Du <changbin.du@gmail.com>
Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: stacktrace: fix dump_backtrace/walk_stackframe
 with NULL task
Message-ID: <20210728213934.5a0ee52e@xhacker>
In-Reply-To: <20210727221656.wq3ponbzhvftfxc5@mail.google.com>
References: <20210627092659.46193-1-changbin.du@gmail.com>
 <20210628134404.4c470112@xhacker.debian>
 <20210727221656.wq3ponbzhvftfxc5@mail.google.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygA3Tkx8XwFhDnNaAA--.1287S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw17GFW5WrWrXrW8KF1Dtrb_yoW3Gwc_Xr
 Z3A3WDCrsrZrZ7Ca93Jr13ZryDKFW8Jr4rKw4v9r95Awn8G398JrnYkF1fJF1DKrn7ua43
 Gr9xX3WFg342vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxU7GYLDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_064545_504463_53956211 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, 28 Jul 2021 06:16:56 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> On Mon, Jun 28, 2021 at 01:44:04PM +0800, Jisheng Zhang wrote:
> > On Sun, 27 Jun 2021 17:26:59 +0800
> > Changbin Du <changbin.du@gmail.com> wrote:
> > 
> >   
> > > 
> > > 
> > > Some places try to show backtrace with NULL task, and expect the task is
> > > 'current'. For example, dump_stack()->show_stack(NULL,...). So the
> > > stacktrace code should take care of this case.  
> > 
> > I fixed this issue one week ago:
> > 
> > http://lists.infradead.org/pipermail/linux-riscv/2021-June/007258.html  
> 
> I still see this issue on mainline. Is your fix merged? Thanks!

Nope, the fix is missed twice. Palmer has added the fix patch into
fix branch, I help it will be in next rc

Regards


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
