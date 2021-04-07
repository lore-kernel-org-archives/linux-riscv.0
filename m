Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A583EC433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 16:01:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B0661132
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 16:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B0661132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9PsHxczVhWZ/Ea9YoSzvhPV2w+DBzJNKkwVBjETlgnA=; b=OXuXp857+V2JlmdSRkQYMdqtg
	dgpwnWtaUVotMZIzzn8rVhriFjmqrLJgSqu7QRrzXYGNP7WC3/Mi1pl6T11+aQ8EKhY0zJCXfLRFt
	7HSqIFsOmXVXa/c6y0t8jD14Z8qagWyPZvFqU/h28jXSkd4RHufO5nS3lFBruxxWhsmk4P1nzxZsb
	eeSnNha1nkNI9ntK171FapLiGMuVcNEvn544OzR93vPfhG/2Rqx5RscFqVi2vVGNXbTBdf/g2mTpn
	fwoezEloUSUOa2DStie6Vmcby4KK8Tlz1ja5rI5WE0l7VEeVuuFpIOGD6SR5oXnlh0VIjLgqy7feA
	k5Etc1pAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAbl-005NNt-Sj; Wed, 07 Apr 2021 16:00:45 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAbH-005NDW-Kw; Wed, 07 Apr 2021 16:00:15 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 002B73001FB;
 Wed,  7 Apr 2021 18:00:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E298B2BF09269; Wed,  7 Apr 2021 18:00:14 +0200 (CEST)
Date: Wed, 7 Apr 2021 18:00:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YG3XDnNc+GaW1Tz4@hirez.programming.kicks-ass.net>
References: <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
 <20210407094224.GA3393992@infradead.org>
 <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 07, 2021 at 04:29:12PM +0200, Christoph M=FCllner wrote:
> RISC-V defines LR/SC loops consisting of up to 16 instructions as
> constrained LR/SC loops.  Such constrained LR/SC loops provide the
> required forward guarantees, that are expected (similar to what other
> architectures, like AArch64, have).

The text quoted by others didn't seem to say such a thing, but whatever.

> What RISC-V does not have is sub-word atomics and if required, we
> would have to implement them as LL/SC sequences. And yes, using atomic
> instructions is preferred over using LL/SC,

(psudo asm, can't be bothered to figure out the actual syntax)

	# setup r_and_mask, r_or_mask

.L1
	LL r, [word]
	AND r, r, r_and_mask
	OR r, r, r_or_mask
	SC r, [word]
	JNE .L1

is what you need for LL/SC based xchg16, that's less than 16
instructions. If RISC-V guarantees fwd progress on that, good, write it
like that and lets end this thread.

The fact that this is apparently hard, is not good.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
