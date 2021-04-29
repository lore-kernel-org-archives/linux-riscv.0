Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AEDC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 21:55:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670566141C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 21:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670566141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VN6oD6t0utfLIyusmJ27hXflkjGX6CatqKJ1o10QWYQ=; b=DpUWd+p+0kbC09181sC89T1zS
	2TDi6BuC4qZcZfMTJOit1mdezA1FS1zK9umG19rtH4wVHGit1fJrvwQr+scsMyXaloLaNNqzrHkpT
	q7yMBSOWLWCcGd5zn4Og9YcujsnmK2S78XggdJ6PWbZd1dES/fAtsiW7exBBaLPUSeINOXPvD7A5k
	N+6cHA5wzJGQ2aJ+4q2/SMhIZ1M5FdJout+mGrq+AASmrabqxM6sA/nQu42alKuOgCNlOdq93mGow
	KGH8wuTGoRZLkFcstahN9WpG8fro2eU1CSmmsLXWh7etrHe2wdEqxbHrEv4zziOYeGPEowNWD6yRg
	FpwoI89rA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEct-006bOZ-Jl; Thu, 29 Apr 2021 21:55:15 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEcp-006bN9-UB
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 21:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xILzlD8Dc/GC/uEcYmCRAVPf5ev0yMARXoUln4gBq+M=; b=VJEGuNqSqflXy+nqgwd/d/xObj
 5QUOHW2vhoj01+Qy42f+BLaRk+zypjoWG2HmN9r+4xiw6XWG8FET2ZMNJ3BMZfoeFl/F6qp4h/vZw
 w++g2mZQKGWxJjlXblXR/+cYSbKyXxJ70/olMqpjj2yEkSXsiNLLuk+Tn/EJ1ymyMSEjfMfBZ9LcH
 omldK3aIll4/ez9qOzo9oEuMV8UY+aaonmmPTc+gsOT5yY+2AHRXyzZnBFRKd1okNIghR7CU2x0na
 UIxvqQ26CK468hFMSJNBXhH5u5UuOttfs94p+F6hs4B7KL2mglwSOUGNNlut4GqaqCa59UAj75//U
 lS9xlsMw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEcd-000zu4-65
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 21:55:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id e15so10300738pfv.10
 for <linux-riscv@lists.infradead.org>; Thu, 29 Apr 2021 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xILzlD8Dc/GC/uEcYmCRAVPf5ev0yMARXoUln4gBq+M=;
 b=eIYbBZxhCJo4QYi8f2O4+a/PDCv49G7XQEh46rHgNeVgZkAPo27YclJTFAoSur+0jI
 Xu1c/2yXHlP/idepUEDlanvWe0G8/b1Ybyat/wVSWFVCsa9BHYp6JXwqqGooSwepyCm3
 b7yM0u1tr06nhWrZJQKj853ZY38kkLCxw7eM2B0j1KTDBLLvtSYDmumDUtEO7HBZ5L17
 cjEkzFk4lLvetZYuMOG0bexbhqgzcWP5r8NCBaCItRGXCPeHGPZdmkAGhsDBZUI7mcU8
 +eyc/jdqyqOGn1zwFZIO3+OkVdRcXDg5niV5Y1tKOUyrTHLPTN9ajffZdmzACyONS9bZ
 Cf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xILzlD8Dc/GC/uEcYmCRAVPf5ev0yMARXoUln4gBq+M=;
 b=MS9IXRKTIeF/Ulv7NlcdLVaXCXSc4/VmXCxMKGgLfRPcof4YfJhK4D8BM8pXY2e1Tv
 jl1+IODbHmoaO7zdsiPYD0yLPWmHDH+0MvmhjJONNIrx2HBWVtzNFDf9p3BPJR9n7mHW
 EzAHjE7RllmtT5poRrizaNcmwyY5NhzPzmgUym5NbqFfEMD9JtYmxN6IuAqVGkqaK6ef
 XmM8nEdCZ7Y/TkUoiUo2aFW+gPsLfwku6Fdz4xy33XTIY2wClTWTbH+lnTaEdKXRsTH7
 1GYwkJfQtzlYPKS7YE0mRwkbac+3O+XGtb7b+AKddqBDiI+tx+L0FQzcYBLxvtGNR+zl
 vrtw==
X-Gm-Message-State: AOAM530XjmyDdtAD8q2auixaT7h9re+8iUrR4hZc20EDIPVw/ha4ZG1b
 /aWlgG//TX/oqRYLsTj9Bgk=
X-Google-Smtp-Source: ABdhPJxWYGupRvMzQopX9u2g7/MngEcIFHl1KxNOdrbssRowLBPVMtHH4KtwsfwB6l6kPIkFuk0N/Q==
X-Received: by 2002:a62:7c4d:0:b029:289:d38:d1be with SMTP id
 x74-20020a627c4d0000b02902890d38d1bemr572168pfc.23.1619733298295; 
 Thu, 29 Apr 2021 14:54:58 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id 18sm3181647pji.30.2021.04.29.14.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 14:54:57 -0700 (PDT)
Date: Fri, 30 Apr 2021 05:54:51 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 peterz@infradead.org, jpoimboe@redhat.com, jbaron@akamai.com,
 ardb@kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, akpm@linux-foundation.org,
 rppt@kernel.org, mhiramat@kernel.org, zong.li@sifive.com,
 guoren@linux.alibaba.com, wangkefeng.wang@huawei.com,
 0x7f454c46@gmail.com, chenhuang5@huawei.com,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Message-ID: <20210429215451.yuey5gzmfh2dkzp5@mail.google.com>
References: <20210429061713.783628-1-palmer@dabbelt.com>
 <20210429123007.5144fc0d@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429123007.5144fc0d@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_145459_274913_4C38BC68 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, Apr 29, 2021 at 12:30:07PM -0400, Steven Rostedt wrote:
> On Wed, 28 Apr 2021 23:17:13 -0700
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
> 
> > From: Palmer Dabbelt <palmerdabbelt@google.com>
> > 
> > We currently use text_mutex to protect the fixmap sections from
> > concurrent callers.  This is convienent for kprobes as the generic code
> > already holds text_mutex, but ftrace doesn't which triggers a lockdep
> > assertion.  We could take text_mutex for ftrace, but the jump label
> > implementation (which is currently taking text_mutex) isn't explicitly
> > listed as being sleepable and it's called from enough places it seems
> > safer to just avoid sleeping.
> > 
> > arm64 and parisc, the other two TEXT_POKE-style patching
> > implemnetations, already use raw spinlocks.  abffa6f3b157 ("arm64:
> > convert patch_lock to raw lock") lays out the case for a raw spinlock as
> > opposed to a regular spinlock, and while I don't know of anyone using rt
> > on RISC-V I'm sure it'll eventually show up and I don't see any reason
> > to wait.
> 
> On x86 we use text_mutex for jump label and ftrace. I don't understand the
> issue here. The arm64 update was already using spin locks in the
> insn_write() function itself. riscv just makes sure that text_mutex is held.
> 
> It also looks like ftrace on riscv should also have text_mutex held
> whenever it modifies the code. Because I see this in
> arch/riscv/kernel/ftrace.c:
> 
> 
> int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
> {
>         mutex_lock(&text_mutex);
>         return 0;
> }
> 
> int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
> {
>         mutex_unlock(&text_mutex);
>         return 0;
> }
> 
> Which should be getting called before and after respectively from when
> ftrace does its updates.
> 
> Can you show me the back trace of that lockdep splat?
> 
The problem is that lockdep cannot handle locks across tasks since we use
stopmachine to patch code for risc-v. So there's a false positive report.
See privious disscussion here:
https://lkml.org/lkml/2021/4/29/63

> -- Steve

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
