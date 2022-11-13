Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C934C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5+n/3sGo9PWM3X3v2of8LAOorTnVT/nR3pJDNDkWIg=; b=GZQgTTuni2dydZ
	m/NJCorLdKAoVaaSCuLki3UmKNN6y1OhMN12ziAIVBXZyUnyHC9D9OHZDjT/QstXcZowAYBFZgx+R
	ERPvdiknh8JbbaYixtnrMo2bNJ9l16VrzRyDhoMVj1HU78HoJrN0GK9HTC31wojbxOMJB8PuBhnG4
	JErqIo3WJBqFNMPB/bxE7rBR6UFhmCh3JdxOyIZ2GSbFyAh3n9fPv6HpS7ShzkEobgr8LpAmNHawd
	wVVmX7mqUAgj0ABOCfnMcbYRj3tY0aPlMlWpanNTavozJ/rp1+zloD8M+SX+2nWUuoQIrGMwwa7ti
	FVT9fzIWK3hKH/S371Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouDkU-00Blq4-5u; Sun, 13 Nov 2022 14:14:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouDkR-00BlpN-Ph
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 14:14:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7136AB80945;
	Sun, 13 Nov 2022 14:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460F7C433C1;
	Sun, 13 Nov 2022 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668348849;
	bh=0N0faY7nLSbLb2KNcD5w20O8mhRpdTYXbjsNeB1Wlt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFEcQYM9Q52ZQjb9z3Sbl6pkgL6/Qid2n6rVNELB/BJX+fiDscq/7oV3zt25Fbf4C
	 6QjMw91fuBwzG5LKeHiTCzGvLXMR56+xHvHQntXP9v/5TADr/0hnm/27nizNFfMbr9
	 RiAyqAGeaJKsTzIVLCmFte1UdCVyt6Da25rb4m/P9PwU3V4GYCT+JbtYH9SdWGDxPU
	 gwxgal1qIJbIbpL3dJ0w5ObhU6ToxJysx5bCurH9iqc3jRlVJysOCICMmr9CKHG1Jd
	 HIn0DGhpf9T+SNlzWXX/zIJBbyr9TqBI2qLr7AmUa+njOTDTQm4n/uLbMYoSmT8617
	 iadKYky65LMCw==
Date: Sun, 13 Nov 2022 14:14:04 +0000
From: Conor Dooley <conor@kernel.org>
To: debug@rivosinc.com
Cc: palmer@dabbelt.com, jan.kiszka@siemens.com, kbingham@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux@rivosinc.com
Subject: Re: [PATCH] gdb-script: updated lx_current for riscv
Message-ID: <Y3D7rF34CAI+bZQx@spud>
References: <20221111195938.1499148-1-debug@rivosinc.com>
 <20221111195938.1499148-2-debug@rivosinc.com>
 <Y3A2tPFbqcf1DPr5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3A2tPFbqcf1DPr5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_061411_999716_4E5ACBC0 
X-CRM114-Status: GOOD (  21.77  )
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

On Sun, Nov 13, 2022 at 12:13:40AM +0000, Conor Dooley wrote:
> On Fri, Nov 11, 2022 at 11:59:38AM -0800, debug@rivosinc.com wrote:
> > From: Deepak Gupta <debug@rivosinc.com>
> > 
> > lx_current python gdb command defined in scripts/gdb/cpus.py updated
> > to support riscv architecture.
> 
> The commit which added support for arm64 gave an explanation of why
> SP_EL0 needed to be checked. Would be nice if you could do the same here
> for RISC-V. See 526940e39626 ("scripts/gdb: add lx_current support for
> arm64") for what I mean.
> 
> While you're at it, "scripts/gdb: add support for RISC-V" would appear

Realised I omitted a word there, sorry: s/add support/add lx_current support/

> to be a more standard $subject for this file.
> 
> Thanks,
> Conor.
> 
> > 
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > ---
> >  scripts/gdb/linux/cpus.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> > index 15fc4626d236..ce6703f1e35a 100644
> > --- a/scripts/gdb/linux/cpus.py
> > +++ b/scripts/gdb/linux/cpus.py
> > @@ -173,6 +173,14 @@ def get_current_task(cpu):
> >           else:
> >               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
> >                                  "while running in userspace(EL0)")
> > +    elif utils.is_target_arch("riscv"):
> > +         current_task_addr = gdb.parse_and_eval("$tp")
> > +         if((current_task_addr.cast(utils.get_long_type()) >> 63) != 0):
> > +             current_task = current_task_addr.cast(task_ptr_type)
> > +             return current_task.dereference()
> > +         else:
> > +             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
> > +                                "while running in userspace")
> >      else:
> >          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
> >                             "supported with this arch")
> > -- 
> > 2.25.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
