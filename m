Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91A9C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 17:35:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6707764D99
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 17:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6707764D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zIyqKj7MdOVmLn5kYcBMvtboHgWRObi6DWyxrPxBdzI=; b=OdZvEG4p24zi+JrSEBAQn/fXv
	9GVLJmEVUaCTVVyjVcJR3+xMYcpZRKLxwSdd3EjjNYO6E3RKjC95pldC9f8SPrf3jjZs2lMJaZken
	Hvafea8VZ5NJaRhJ4MdAgOewEexDi7MfeBoWoNUFGWzoBLmqpTUG5HT2vVhlYT4rG4GpgtZ4B4qlT
	/c7zynujDYtcjoWxDxitUI8XVd0EkvcMPFg3vWCXwXrIugZ3VV5FcD0qpI9uLhUVNPXVmvHf7q7BN
	ffC3Q988OjC/g97195clPayFBgJ0UIzxyXDWOdyOab+kDEVu02UwIlA8MXkyNlTXN4gwNx0Dvk8c5
	MDRvdztSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4GC-0001gn-G9; Tue, 16 Feb 2021 17:35:40 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4GA-0001gK-6I
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 17:35:39 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4Dg7RF0q3kzvjfn; Tue, 16 Feb 2021 18:35:36 +0100 (CET)
Date: Tue, 16 Feb 2021 18:35:36 +0100
From: Tobias Klauser <tklauser@distanz.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: riscv+KASAN does not boot
Message-ID: <20210216173534.54vzyfzdm5ioxu7t@distanz.ch>
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
 <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_123538_382591_22DFA5B7 
X-CRM114-Status: GOOD (  23.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>,
 Bjorn Topel <bjorn.topel@gmail.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 LKML <linux-kernel@vger.kernel.org>, nylon7@andestech.com,
 syzkaller <syzkaller@googlegroups.com>, Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021-02-16 at 12:17:30 +0100, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Fri, Jan 29, 2021 at 9:11 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > I was fixing KASAN support for my sv48 patchset so I took a look at your
> > > issue: I built a kernel on top of the branch riscv/fixes using
> > > https://github.com/google/syzkaller/blob/269d24e857a757d09a898086a2fa6fa5d827c3e1/dashboard/config/linux/upstream-riscv64-kasan.config
> > > and Buildroot 2020.11. I have the warnings regarding the use of
> > > __virt_to_phys on wrong addresses (but that's normal since this function
> > > is used in virt_addr_valid) but not the segfaults you describe.
> >
> > Hi Alex,
> >
> > Let me try to rebuild buildroot image. Maybe there was something wrong
> > with my build, though, I did 'make clean' before doing. But at the
> > same time it worked back in June...
> >
> > Re WARNINGs, they indicate kernel bugs. I am working on setting up a
> > syzbot instance on riscv. If there a WARNING during boot then the
> > kernel will be marked as broken. No further testing will happen.
> > Is it a mis-use of WARN_ON? If so, could anybody please remove it or
> > replace it with pr_err.
> 
> 
> Hi,
> 
> I've localized one issue with riscv/KASAN:
> KASAN breaks VDSO and that's I think the root cause of weird faults I
> saw earlier. The following patch fixes it.
> Could somebody please upstream this fix? I don't know how to add/run
> tests for this.

Thanks. I've tested the fix locally using vDSO selftests and sent the
fix upstream [1]

[1] https://lore.kernel.org/linux-riscv/20210216173305.2500-1-tklauser@distanz.ch/T/#u

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
