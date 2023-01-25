Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F227FC54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkg+Qb0zSCKtGos8jcm+0L+h+uDoqC6wF4eO4Jxp47E=; b=J4a8auHNyVgZEN
	9NiYv2dyhTScgBu4zzCb8abmSMpBIkZm3P9Bca9alEn/pAwSuolWFclliWtkqqjfQJVTjy2Y86bJv
	c0algxvj7K1It1Ut38WAI2utAq0pfLSpPBeCxaj3YKc1r5HECBnBm857/WyMusbnAHT/JqBN7A9Xm
	rsOAjGAabSrRAY6qn3YE1BB2IlBUCgMHVMf1IK2P4eYpNIHEWoSVgID5eoKCMFto+65n2vzGhqLhG
	MrJNvXfmAMDrXYbk3QmeVpA0z6iEoW/Vm/M9lhDQATE5CEh2bxFjv+FY1+cukT6Lgr8lwe2WI6cgq
	fjGcdMQSeI+SLpocf6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKjTO-008BEk-G1; Wed, 25 Jan 2023 17:22:10 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKjTK-008BDG-1L
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 17:22:08 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id h5so6993535ybj.8
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+NF7WOwKXStbVcCBmnQTR8aAYHjwReQdf6MvWz/ieQE=;
        b=G/sP0Ge2BbmLK5C1fYqIhHmfO9YiRHy87eRqbWpmlZctgb1Mjd3hQa4bOwD180MWX6
         N9m5BZ5ghS2tzwTNr12nV3VeSN0+z9yP0c4kJa8fVHf0liLZpx9LSNTEL28uc4R/m8Xd
         DTt9dY/swPExNObKMFXnORILtXrqvfvPIy7kzOUkT25jJo53AbsZlXcJaaoY0pxtCLXS
         qgm7XaZfzBEKVqNPbBdF0AhzVYtmjGNYtzFnqQUr3odJs29myMNgBOQe8LMz9PeTVJLp
         7+pVgI1I+vSb3zqVmxeKhnMsVmNFvn/PsYcbOlBZDilIwwcmDqrHgsUVs8ak5XGd8/tq
         3RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NF7WOwKXStbVcCBmnQTR8aAYHjwReQdf6MvWz/ieQE=;
        b=pNbdSyrxLRee1KX0eEHlJvjVSzUi8yEHXyrRjkoZ1yFXNw4pu8kYucsfBPovEqN0sn
         szR3dCUT5O9vYS/tyWVjrVfY9UDMnZcPcOQyYq3PKq9uRCzsdsfTjGaMKDk/azYneM1v
         Z1qBx1juJBLIkzys16LTgEaNgGosTiDFGUrRyxsuXePlI31coRBESNaL8C1mvEWk2Tcj
         0x/GC1qQVcwBOkzbJc5uXFpmV+DwLVKVMkQEkCWLZiCEBAc99WogOXWdHsP6NVSH0W1r
         qF/2kYb2Lx27mx5sZii0ggeQpv2+jZ6cUfj2G7hJS38uYgMGicUeDfp7P9zXWziCWbpB
         AteA==
X-Gm-Message-State: AFqh2kor/PI2NlRF6F+xjH4BfnNzmJZExAXIpnqn6T5uxcNWon8GoJNr
	Y6T6eST+MvRxuP3MRdE+r2UkI2T6twUyXpYBZQkUzA==
X-Google-Smtp-Source: AMrXdXu3jKBxFWKV9U7HEoc8nZkdzpu/vB3yVyIUHmWHNLUO+5YjJYHaG1m9/rmSDsx5131N51uq+J+p+rywDrfAr5Q=
X-Received: by 2002:a25:1984:0:b0:7fe:e7f5:e228 with SMTP id
 126-20020a251984000000b007fee7f5e228mr1798951ybz.582.1674667320995; Wed, 25
 Jan 2023 09:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com> <Y9B8A+/FSPCrAANT@google.com>
 <Y9B9FZReDVwdNNrS@google.com>
In-Reply-To: <Y9B9FZReDVwdNNrS@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Jan 2023 09:21:34 -0800
Message-ID: <CALzav=fAVF5VDj76Pd9m+G+-A+UdvCS1tTVGCyvnvtgq4eFOSg@mail.gmail.com>
Subject: Re: [PATCH 0/7] KVM: Add a common API for range-based TLB invalidation
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_092207_551544_497752A5 
X-CRM114-Status: GOOD (  19.48  )
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

On Tue, Jan 24, 2023 at 4:51 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> On Wed, Jan 25, 2023 at 12:46:59AM +0000, Sean Christopherson wrote:
> > On Thu, Jan 19, 2023, David Matlack wrote:
> >
> > Did a quick read through, didn't see anything I disagree with.
>
> LGTM for the tiny amount of arm64 changes, though I imagine David will
> do a v2 to completely get rid of the affected Kconfig.

Thanks both for taking a look.

> > Is there any urgency to getting this merged?  If not, due to the dependencies
> > with x86 stuff queued for 6.3, and because of the cross-architecture changes, it
> > might be easiest to plan on landing this in 6.4.  That would allow Paolo to create
> > an immutable topic branch fairly early on.
>
> +1, that buys us some time to go through the rounds on the arm64 side
> such that we could possibly stack the TLBIRANGE work on top.

The main benefit of merging in 6.3 would be to make Raghavendra's life
simpler/easier so he can build the next version of his arm64 TLBI
series on top. But I guess he can still do that with a topic branch.

I'll go ahead and send a v2 on top of the changes from Hou you queued
for 6.3, Sean, and we can plan on landing that in 6.4 (barring any
further feedback or conflicts).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
