Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25694C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E453A2190A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z7kuiDrN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xicmuh1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E453A2190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHarq8iSKNrH+N37A4LE8uWaaJNGqUSn3edP3k6MOKs=; b=Z7kuiDrNTBcnvF
	5kVdy3evVC5+PTBFpPc1tV8a6MwMtXBv5+FRQQcPjzWL+h/WRo4CoV5QDVG9uiYZuYmclhEnvX8nK
	7xvzKTVViUYB0uLo5hhbF+gsMyTYsbcLxCTqUi+WgRdk2k8X2//Jdy7555+BugKPKhOzOHSz9dgXL
	AYOvhhKKF6Gj9OIFOGnXT52RV/CBdPIbxoDRTrAnI7GHLPRiUlYMz1ZxNFRqxKMEPeZ1Yow9dGO0t
	W3appS0roVr5mpUmGFxrB+cSKj5wkFwlRsrEH+ITCq3WnFwtavUyJBOuNXUdxiaeqSQ7R0D1XdL4L
	+/b3ZoNALAmsmKVWg7AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7Ndl-0005OU-Jx; Fri, 22 Mar 2019 17:07:33 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Ndd-0005Fa-Ho
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 17:07:26 +0000
Received: by mail-lj1-x241.google.com with SMTP id q66so2672126ljq.7
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5KpCUavpU6jklxItqvKr4mbyrohs/asqf5NX0BYYpc=;
 b=Xicmuh1ND+AZ9lc/udGkNvWbzi2Lu2j3o6M44sYQ0ZH2WsGeVBgW5f2xPJwNTxlY2d
 JaSMsr2SEVdWRDbZBYCXJ0vB1W1wIN3vVWqOMIiqWhD3oBYZFF9I7ROZZs9bJvkPzu9N
 HN8UN8zBc9zkjew06tZVB45+s5iWpvEon1EZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5KpCUavpU6jklxItqvKr4mbyrohs/asqf5NX0BYYpc=;
 b=IOWWYObJPzcl0vCAcZy3QtyF9vq1uPd3CreXBVDcv0E5MnC2dMmYZKXwwJuUhvsUgC
 Tp91eYwxI6Z4YwJFpCwccINrym4gpMnHVhGP/icNOhYyZz1/CutSmOxvyo+VXdbXw01j
 uRG3SXhKaH6SB7fYzT1kI7GjH/xmJ/7T10IJ5tIcZTruXSSEFUQ7+GlEQIgdA+hbfLNW
 PXPQF00BCcoAJ9ed2NJS/cuQ3l2YBxTvUdrYC66yVJSFZepu6vABaulHOKuGi0tr9FMh
 joCkwBA7zR+buFFL2ABZkeENSWwtleAs1dUh4AnT25wflxpi9eOdSSZVTwg03neqUuzc
 dnBw==
X-Gm-Message-State: APjAAAWW3ZYP3U97ExZ4BmUQZsGP6l6FwjKJC0VX1yVrxuQ9cvtF7Y3T
 zYHTP+VTX28pA9lPCrhZfRoZRFkSBGA=
X-Google-Smtp-Source: APXvYqw1gq5q9SfVcJXbCd91FSIZnz7MBwgm5M/a8oWj/ZHbTqs0bnzVUMsa4BL1FNlqLMFqTbqJAQ==
X-Received: by 2002:a2e:711a:: with SMTP id m26mr6059034ljc.40.1553274443174; 
 Fri, 22 Mar 2019 10:07:23 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id v12sm1790456lfd.20.2019.03.22.10.07.20
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Mar 2019 10:07:21 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id y6so2640435ljd.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 10:07:20 -0700 (PDT)
X-Received: by 2002:a2e:9786:: with SMTP id y6mr5380150lji.79.1553274440270;
 Fri, 22 Mar 2019 10:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190322143008.21313-1-longman@redhat.com>
 <20190322143008.21313-3-longman@redhat.com>
In-Reply-To: <20190322143008.21313-3-longman@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Mar 2019 10:07:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjujKK-Ey7DPnMExaEmphicuEDLmVn-9+W9VzFzR-Ts=A@mail.gmail.com>
Message-ID: <CAHk-=wjujKK-Ey7DPnMExaEmphicuEDLmVn-9+W9VzFzR-Ts=A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] locking/rwsem: Remove rwsem-spinlock.c & use
 rwsem-xadd.c for all archs
To: Waiman Long <longman@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_100725_587048_CF1E1319 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-um@lists.infradead.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-alpha@vger.kernel.org" <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 7:30 AM Waiman Long <longman@redhat.com> wrote:
>
> For simplication, we are going to remove rwsem-spinlock.c and make all
> architectures use a single implementation of rwsem - rwsem-xadd.c.

Ack.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
