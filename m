Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CFAC433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 20:13:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68540611C0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 20:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68540611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZHWqmshr3RgVLcNtrKtO+RBmqslr9JC2NPSak0fRWxc=; b=lTjZACbTrrhB7GwBqM9dplMQS
	13sx9rr1OWc2zaN/IkRnWAxEZ1SH/AEJiLVaDM9z98K0HnDn7Fbro7kLC9Rpeg3nTt+9zmlca0z5M
	KX1CGaMJw4t3di0n1qlCe5OiNkqGbdH3WNq6d2+isaWfX3y1GoS5JlP3Ni3rcwsep1VqBAuRMZL4p
	boPZcKv/yd0vvH2VihhoJu2XOwDthvhQKPhKkeZS22WTO2WxRQQHfMW+b5ty6GeY/WpD8BUu+Qqdg
	NyIm+9GzP7Tk/Efs07g/TautsCBfgfuNA36lPCw8/GkLZzfHzZ68rYP6VnJIB+e6siMbU9+Wex2gG
	Jtc7gOHag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEY0-005uW2-A1; Wed, 07 Apr 2021 20:13:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEXv-005uUx-H3
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 20:13:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id q5so117716pfh.10
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dwldfrHGB7cvjNDHe6gxp+OQ0DSzEe0anuIQnT5lIYc=;
 b=dKW4tyxbGX73iHxH5Iha60EvcjCvKI+5hrpqwPPcbjELczGr/kzgfdsnLJJsWtOJbP
 ubOwwaB3iZb/RBJ+1QPkWGQAjFPjPBqh2IboNE1nH7H1pZZqyeSqspXh1PeeRkVlyVq3
 D+oq7t34NOHRn9OQqu4dUPDeY2QjjFesL1gh9WM+knJrz1i5ZQMIlvyZpNZOQKqZbOKS
 4CB8O8zOE9mVX0eyokxf96eDPzy8oTdAAN584lU799CDSvkBRtjLRtC/rvSTel9pIKWP
 gshTMF9nTcU8N6w8UNgn+aG83qEZcXRIQj51bqqxl3MvzOMunlFLxakjAhVMSVBe674a
 jRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dwldfrHGB7cvjNDHe6gxp+OQ0DSzEe0anuIQnT5lIYc=;
 b=bHuf43yBKlUSLY8Fmi5d9DrLxTAsw+z50y35pLibxvnCaYVTmrFFQGMXn+xl/EJwBP
 eiYks/4hePifmurt4u91bGRqY9GaC3f2VFJ9uGCvJl3V1OszD4cUZ7fxCIUP68Ph44gz
 rWOPTVBpLFvpxZOaWTMZmgUkRcddHz9GebE0XTP6Cta7mTZyO9GL31B+ejnvaulqWIUB
 ioZUHcnMbLfZvQVuZvo74X2DeHNdsKc/l236BTa/bGqWvJDFiCBFMEX4WppcO9tRAvTi
 CdnKD+OYVvofFcjpLiuDKGE8lhw7QTfzvCpqhUWkWyyPWabPZ+s3EvJbWRrolirlLy35
 0Yxw==
X-Gm-Message-State: AOAM533lJysmW2j0xmrGiroO1FY8MkAzVOcoNGcH26hczkCIRj2e0qQU
 oevhxw7yujZKxfUJ4+jdDSc=
X-Google-Smtp-Source: ABdhPJx1TzjDHM8SCpdazwwikZp8MB63xmALxAEXVlHdCjBoBVsMzPPllM88y4Piph/rcIdj06SGPw==
X-Received: by 2002:a65:610f:: with SMTP id z15mr4931593pgu.360.1617826380553; 
 Wed, 07 Apr 2021 13:13:00 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 m1sm5878421pjk.24.2021.04.07.13.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 13:12:59 -0700 (PDT)
Date: Thu, 8 Apr 2021 05:12:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, guoren@kernel.org,
 linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, sparclinux@vger.kernel.org,
 Waiman Long <longman@redhat.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210407201258.GH3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
 <20210406235208.GG3288043@lianli.shorne-pla.net>
 <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_211303_782471_2B858A3A 
X-CRM114-Status: GOOD (  14.19  )
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

On Wed, Apr 07, 2021 at 11:47:49AM +0200, Peter Zijlstra wrote:
> On Wed, Apr 07, 2021 at 08:52:08AM +0900, Stafford Horne wrote:
> > Why doesn't RISC-V add the xchg16 emulation code similar to OpenRISC?  For
> > OpenRISC we added xchg16 and xchg8 emulation code to enable qspinlocks.  So
> > one thought is with CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, can we remove our
> > xchg16/xchg8 emulation code?
> 
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32 is guaranteed crap.
>
> All the architectures that have wanted it are RISC style LL/SC archs,
> and for them a cmpxchg loop is a daft thing to do, since it reduces the
> chance of it behaving sanely.
> 
> Why would we provide something that's known to be suboptimal? If an
> architecture chooses to not care about determinism and or fwd progress,
> then that's their choice. But not one, I feel, we should encourage.

Thanks, this is the response I was hoping my comment would provoke.

So not enabling CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32 for architectures
unless they really want it should be the way.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
