Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6380EC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:48:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 356DD22CAE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kLsIGk+s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 356DD22CAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcZvhZ4Q6+ckaWB5ERKM2L8gwD0hjW++ZUnhaQg8BRc=; b=kLsIGk+sVr4emNPkm8Pl5vcpn
	zOAeJdJRwS9hE9TMYp3tq2HJ+y6jS6P2R6IooPWwYdCiomXunkQCGgZRljyPlQK4BuGl+bPpCglJa
	i99wOiS3RJRXAHDVgAOjzQAvlY1SASNGVntyw7wYDqyNuQE4uEQXGFWStz93TFKwOH3+GzvcoYTZv
	AEjPc+z6b4fKoU1aaMhicxx5KmvoZYg/qFDFtpcZL2T1nrew2q6OnM6K8gjTKqLvbbQLMFlZLQV0f
	2dI/fg5dCdhG1OZxfKbarIwpU0l0vo7EfIwJDU/nQwPlXqT4EsiAhGgzC8QuqYiEdO2POjN3U0h1U
	HlT8rt+nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k39TR-0003Fa-Bt; Wed, 05 Aug 2020 02:48:13 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k39TP-0003F9-G6
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 02:48:12 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k39TL-009Y7j-1q; Wed, 05 Aug 2020 02:48:07 +0000
Date: Wed, 5 Aug 2020 03:48:07 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
Message-ID: <20200805024807.GM1236603@ZenIV.linux.org.uk>
References: <20200805020745.GL1236603@ZenIV.linux.org.uk>
 <mhng-cd1ff2e9-7d34-4d56-8d79-b2d02a239290@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-cd1ff2e9-7d34-4d56-8d79-b2d02a239290@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_224811_574875_22970459 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, macro@wdc.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 07:20:05PM -0700, Palmer Dabbelt wrote:
> On Tue, 04 Aug 2020 19:07:45 PDT (-0700), viro@zeniv.linux.org.uk wrote:
> > On Tue, Aug 04, 2020 at 07:01:01PM -0700, Palmer Dabbelt wrote:
> > 
> > > > We currently have @start_pos fixed at 0 across all calls, which works as
> > > > a result of the implementation, in particular because we have no padding
> > > > between the FP general registers and the FP control and status register,
> > > > but appears not to have been the intent of the API and is not what other
> > > > ports do, requiring one to study the copy handlers to understand what is
> > > > going on here.
> > 
> > start_pos *is* fixed at 0 and it's going to go away, along with the
> > sodding user_regset_copyout() very shortly.  ->get() is simply a bad API.
> > See vfs.git#work.regset for replacement.  And ->put() is also going to be
> > taken out and shot (next cycle, most likely).
> 
> I'm not sure I understand what you're saying, but given that branch replaces
> all of this I guess it's best to just do nothing on our end here?

It doesn't replace ->put() (for now); it _does_ replace ->get() and AFAICS the
replacement is much saner:

static int riscv_fpr_get(struct task_struct *target,
                         const struct user_regset *regset,
                         struct membuf to)
{
	struct __riscv_d_ext_state *fstate = &target->thread.fstate;

	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
	membuf_store(&to, fstate->fcsr);
	return membuf_zero(&to, 4);     // explicitly pad
}

user_regset_copyout() calling conventions are atrocious and so are those of
regset ->get().  The best thing to do with both is to take them out of their
misery and be done with that.  Do you see any problems with riscv gdbserver
on current linux-next?  If not, I'd rather see that "API" simply go away...
If there are problems, I would very much prefer fixes on top of what's done
in that branch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
