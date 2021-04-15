Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003E3C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 13:16:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9291F611AC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 13:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9291F611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=82Wch/tJPiTPk57pyyHmtZfA9zqPGm11BZ4mODUyTEc=; b=NPLWVTD5vs21Zo2n+Iaj5QqBV
	Zo7tn40JhEJrqEXTgHsSwrAF5x21eby4SrZizLI9xdTzHPVfGMJvmTTbRGQPwWflH/PhCuj7i/hlX
	hIT9QcejkVohwOK91pzxdEwu+DYy51e8EcEXIth+TJS12crJGFyi+FTt4QZFqJ/DMbfbFmwqkdUJk
	hMPhqeXwFif13MMprJvr34/MtiPrHaSTMxZNg55KAKz/ZKMX31bA4Rf5o/vrp+C3z16y2UyjfZLDg
	iZ2RKCjS5X9Bje3Sl9Gkpm+eJs14ohoNi55a48kFDuMhu4DdHrCKrlK+s1P3TaRVB8TMYduSMlcIm
	mIBtDWd7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX1qY-00GEM7-MB; Thu, 15 Apr 2021 13:15:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX1qW-00GELu-O4
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 13:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bhSC1/BJEYTgOGlBe7kPtezIfZ4/KtItoy6Dd4R6X5g=; b=J/qqB2vqJpnxoSaeYXyJyCDdR3
 LsUap1yq3EBWooCpjGYO0GpcZaCfw44tICaYNgah04cHT3cF17js7I1frIeIzYsOdF6AbQ/A0gjCM
 RC42tVGgzDxWOA/eOXxG6NHzZzLzDZaiNDTXqmbBNwlqBh/2ysvEXytT+gCXBxnZknObe5+OvuE3N
 CwLWJVDeb8YuretL9jyjSt/Y1Y6Vat954yY2S8L0zVw7tNSaeeeJkw0FlOw7NXsjT0dGKlBq2BNuW
 ubc0GzahFKsp4BZJPE3wqnmH/qMXizUI79SGUbU/CXtc983aKzFTSPPhHcOdxgunXHL1K5NMQcAio
 IQdBP+7Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX1qU-008b9B-2o
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 13:15:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C3AC613B4
 for <linux-riscv@lists.infradead.org>; Thu, 15 Apr 2021 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618492545;
 bh=CBNjr3AxBARmjy8Ci1TwNIUkQ2u/unZwMvqua1P3OmA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lAe/oBzGAkjcRpE1psbxEBjcOuUPSnZHWgAIP492dc+WaHiyaFzNP/blo5D0aM9s5
 kcpPAxWNPbzRdR+sDHpnds82ItqaKSM4IePKgU2ZP2pjFcSoixJGFFBXDLlv1rD5Tx
 396TxqC5l+hq7FCVtrdZ92WLqeQQr3ReAVSmuoPho8YwOAGKephnWH2wNDRufWzhCo
 8Rrd9BYz/7XrTHvUsyNHl5IETovmtbxxjMCI4eZt+t6BrRMuGJIFB7D0gHpBl98bjN
 0LTebYclB0ln647iF2s6F82eHUjdSaeM5wEzFp7pVdo/uFg42VRGETrMQxjTSJYKU7
 nJ1uqORBC0g/Q==
Received: by mail-lf1-f53.google.com with SMTP id f17so32107639lfu.7
 for <linux-riscv@lists.infradead.org>; Thu, 15 Apr 2021 06:15:45 -0700 (PDT)
X-Gm-Message-State: AOAM530HIUiNexlFRfo1y1KShRiIkoWrnpIS6e0Lx9MXg2hAeuWP2AC3
 WTEz7M/xJDYCK7JgI5IITbjdBJ91Rah03BOsTaw=
X-Google-Smtp-Source: ABdhPJzwnmsP4WZeNpgfK/xKMZPMcbAQIJRnbGcOLkvM8+Q7NnxMly071ZBmAQhcthXX2SrLsntKAnToaUnnxNkn9gE=
X-Received: by 2002:ac2:55b8:: with SMTP id y24mr2529050lfg.24.1618492543822; 
 Thu, 15 Apr 2021 06:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <1618472362-85193-1-git-send-email-guoren@kernel.org>
 <YHf+z0AotZmjvaJ/@hirez.programming.kicks-ass.net>
In-Reply-To: <YHf+z0AotZmjvaJ/@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 15 Apr 2021 21:15:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT7ft8xNkQcAef1XFuWsVdNHcoGMZt-mWFmk47fKh0ecg@mail.gmail.com>
Message-ID: <CAJF2gTT7ft8xNkQcAef1XFuWsVdNHcoGMZt-mWFmk47fKh0ecg@mail.gmail.com>
Subject: Re: [PATCH] riscv: atomic: Using ARCH_ATOMIC in asm/atomic.h
To: Peter Zijlstra <peterz@infradead.org>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_061546_170863_3225DD33 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

Sorry, forgot riscv32. I would fix that.

On Thu, Apr 15, 2021 at 4:52 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Apr 15, 2021 at 07:39:22AM +0000, guoren@kernel.org wrote:
> >  - Add atomic_andnot_* operation
>
> > @@ -76,6 +59,12 @@ ATOMIC_OPS(sub, add, -i)
> >  ATOMIC_OPS(and, and,  i)
> >  ATOMIC_OPS( or,  or,  i)
> >  ATOMIC_OPS(xor, xor,  i)
> > +ATOMIC_OPS(andnot, and,  -i)
>
> ~i, surely.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
