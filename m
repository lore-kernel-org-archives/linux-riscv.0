Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42005C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 23:52:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDF2C613B3
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 23:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDF2C613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l5j1KhdHA/0EM3zce4azkdn1mskjjNaB5Nq6jCU6Igw=; b=P/unrrfkj8J6XWPkmCWh/Rexd
	BgJ4YDPPiE65jSrvG4+f7XgHvDd/XQQtI/m/dL2aNwvbQJzWF2XI+aYgH2IDCFB07t5oni1iOD1G2
	wNUqiJk1ZwQgaGtttBUx+KIewz0Ju540p2/lhmmbY6no/T2jRSJ4uCel+9jjfuSJPzSduaY5KZeZQ
	kwyUOrTc/CIVHbBs3QTzEI5X9DIKHbOc0J8R3q7zUsM9rB/XsvbtxXoolZvFFN9sBCbnLyv/w2tX2
	+FNP2W/X7Lv1yZONCQj8tpdnEAhfBwgl4oJJ+Az1GbqznZL9YB4NYPqfwHGA4n1Tt/r0Lj71C6WqY
	0FDgT2KHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTvUY-003eIl-Td; Tue, 06 Apr 2021 23:52:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTvUS-003eI6-Se
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 23:52:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id v8so8396716plz.10
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r0Ha/Gv3pAkjmgqqsKcPiH9tlZnqWzms79uqmOiSHMs=;
 b=DoH08R29BGwmuj6eSbyG3BUk0CMYUOgrE7l1ib0WohqefmBPVt3sY22jJOdDf2ba3M
 OraAYZNzGMrAjzLBt/oLKxSGP5xVkpQwVYlEyQ+FCAxk1AucZMSXaKaX4yes8IpuX9bx
 k/PK2mwZ7S6C7V1Otv/hHIYsXqEQzWVrSgtZ7Smoc3vdWQK5bfkyy5fWevoxUBoneWfM
 UlLNvmrFvT/LKV17m0n35Iq2WXwO1WQ94cKquKeKdq4Eo0jQbOkxVxjhAnmnUDMrZ/jw
 sjVzOf22KCT3mTqKrrakDQ7hCLtkS68PqKVrr3avChCGt1YUrsIst96sJ5oXc8I6D0zL
 +AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r0Ha/Gv3pAkjmgqqsKcPiH9tlZnqWzms79uqmOiSHMs=;
 b=O0RhwZXKWkDK6WPHSrFYrMgm+m5COuo+CsvPdxSKJZqu8wAxLv0DiRQKir/vERMS8u
 ZkVqHo54GfPxzSxsI0B7u/yikYvEGFzYBh4FTtk9JYIhYEh3pskbFrrP1u/I88LzbdDT
 liF1xI/6w8K/qG/DLulFkWTsQOLZdVbvmuhN4fYgtl/bCgoTTXedm5HfVIea5Vq/AzsD
 l9vhoHGhS0U3fmebfh8RY6OZf7wjhLr6DlqlB275aH8upPXQEQLMKEwbrYNYPAlMP1mX
 bvvvpZoaHwL+aEpQrUms213nnj2JgRzWup7cfKi3dbjHZfFjyyKVEZXEsvMJ61i+SFJK
 OdBw==
X-Gm-Message-State: AOAM530Obcv3qKSEKcqiXysuCi9S3Mh8gY/1MVFSjiXUggIMBqcOOxcl
 pEff9f3w4dCW2vqjahs7W+s=
X-Google-Smtp-Source: ABdhPJxtumeckyy0f77HdPuOn8G6N6f+xOhLUrB9QPIL+nP1d3kOEbilw2AHpr0vnTb2lu4tnB14Mw==
X-Received: by 2002:a17:90a:6385:: with SMTP id
 f5mr590598pjj.212.1617753131320; 
 Tue, 06 Apr 2021 16:52:11 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 k21sm19587938pfi.28.2021.04.06.16.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:52:10 -0700 (PDT)
Date: Wed, 7 Apr 2021 08:52:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: guoren@kernel.org, linux-arch@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, sparclinux@vger.kernel.org,
 Waiman Long <longman@redhat.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210406235208.GG3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGyRrBjomDCPOBUd@boqun-archlinux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_005214_301367_EB9E1414 
X-CRM114-Status: GOOD (  23.61  )
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

On Wed, Apr 07, 2021 at 12:51:56AM +0800, Boqun Feng wrote:
> Hi,
> 
> On Wed, Mar 31, 2021 at 02:30:32PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Some architectures don't have sub-word swap atomic instruction,
> > they only have the full word's one.
> > 
> > The sub-word swap only improve the performance when:
> > NR_CPUS < 16K
> >  *  0- 7: locked byte
> >  *     8: pending
> >  *  9-15: not used
> >  * 16-17: tail index
> >  * 18-31: tail cpu (+1)
> > 
> > The 9-15 bits are wasted to use xchg16 in xchg_tail.
> > 
> > Please let architecture select xchg16/xchg32 to implement
> > xchg_tail.
> > 
> 
> If the architecture doesn't have sub-word swap atomic, won't it generate
> the same/similar code no matter which version xchg_tail() is used? That
> is even CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, xchg_tail() acts
> similar to an xchg16() implemented by cmpxchg(), which means we still
> don't have forward progress guarantee. So this configuration doesn't
> solve the problem.
> 
> I think it's OK to introduce this config and don't provide xchg16() for
> risc-v. But I don't see the point of converting other architectures to
> use it.

Hello,

For OpenRISC I did ack the patch to convert to
CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y.  But I think you are right, the
generic code in xchg_tail and the xchg16 emulation code in produced by OpenRISC
using xchg32 would produce very similar code.  I have not compared instructions,
but it does seem like duplicate functionality.

Why doesn't RISC-V add the xchg16 emulation code similar to OpenRISC?  For
OpenRISC we added xchg16 and xchg8 emulation code to enable qspinlocks.  So
one thought is with CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, can we remove our
xchg16/xchg8 emulation code?

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
