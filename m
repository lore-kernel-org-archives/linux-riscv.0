Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ABAC47089
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9V310pEWN23c/5fBiF5vzxWXEcWx47xxfuLphaUaug=; b=hMredg/wSr8g/3
	HFy+5lwb6t1XPm9+Hs8beIOkI7Sz/9WOfhJoF3SFPFMAU5mYsncsb2AJ2wOYlEGL8c9HbajyLsloE
	XDvry99nsnnyLBZMijYNKAdnZyKl7ai+VmthLGKMH+rbfs0Co1pDjqsRq1VM0BfnM+AqLV/+bcwTJ
	nfsrZPwRaOI9jYNnAXpVa9g3fnCDn6gTxww1D64qzEdoxSFoazxvghkS/hmE55i5c4HpDwQOyvhSk
	rDhXYayOoEuxV4kL5ilEWPVBZEXOdk3aBiTyvcZpN7qaQgI5QDCAJ1XQ427gSQ4AItNavVcnSkKRo
	jEe8ZQQ6pmp7akUqQzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xKg-006h7F-So; Wed, 07 Dec 2022 16:31:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xKc-006gzI-Pg
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 16:31:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id 4so17550134pli.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 08:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3tHC8UqGNgJNk6TUIr7bCokV90g8koZJwnZS2XdsT8=;
        b=Bzv/XCuwwJeZpjtRBlwO9DkjSATcs16n9qA3P9iyyDu7jYUvKcPWPmGcoa3v8Gqy2H
         s5JtXDeazntWePvMSvPmhL2nEhTEjASGm6tcFws5Zx0J9k27Ui1g16FoVhA1FYR752YO
         AP7tewK1w+ChRx+hN2XVejvySz6oPhTVMXrs6XlW+FKjWXbiLfR1vdsb6jYU96aU77K6
         K2yekX0/qMqhDCMnlyZCckcGLvAvse+ijkIu2pAC98vcRZ3LM9e5RbVnTJ9QPvnhIbMs
         ZtBmSKQ3jUb4grz+NtOBOOTyIaIhXpd7K05JlTFFru1ikNx0Y8Q5y6mfbMy/lWvwW9t0
         E4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3tHC8UqGNgJNk6TUIr7bCokV90g8koZJwnZS2XdsT8=;
        b=WDSa7832ZQoRaGCLzMMKd/oR2kDeSxrEoFSdHekl1pmNrZ6s1I8JPFxdhV8iOlAhN0
         T9TQOKbrdH/OD2A9Yop8fgnJXGkxYRDcc7FRzEJDjrQan/Ys0D6kCGQcOrhyAa7KdAYo
         reT6AoWuxfEcv9Vk3dymHZ1HkEx4ArmRWdeZtckbe/3qqIZ4hYAlv3gdifLUpL1tHfSU
         42eIA9VMyEZ35OT3rxR4k+QnajGBgy4yNzJjjyf4wcts9nss7zJPuVUsrse2EmfEhqTm
         MUkzQtlJAyeggUbFC6wcikw9lipr8yCk4IVoi7fRQenzHXReZbECkyAeTYZGdd/ME/Ac
         A8KQ==
X-Gm-Message-State: ANoB5pmhmOB8KnDJVO00gqevFAk1c3/ZPTBoGj5vv+ZATHYccdBupV77
	YNtDgHkc5iu/ARY+OAG7GKXdeQ==
X-Google-Smtp-Source: AA0mqf7Qtio1AnDmo3m6zWhMSlgbTaneoN4QTCspu3qSGcyilWQUe0Gek8GBl/yxGHLPvLa+ZgcnUg==
X-Received: by 2002:a17:902:e154:b0:189:6d32:afeb with SMTP id d20-20020a170902e15400b001896d32afebmr1142361pla.1.1670430694283;
        Wed, 07 Dec 2022 08:31:34 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f17-20020a170902f39100b00178b9c997e5sm14769739ple.138.2022.12.07.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 08:31:33 -0800 (PST)
Date: Wed, 7 Dec 2022 16:31:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC 8/9] RISC-V: KVM: Implement perf support
Message-ID: <Y5C/4s7OannaS8+H@google.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-9-atishp@rivosinc.com>
 <Y4oxNbQwOldICdnw@google.com>
 <CAOnJCU+Eo7do0Rd+S4RBOMYpY+sG8ODqpkqA-Cii92bO-cG5+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+Eo7do0Rd+S4RBOMYpY+sG8ODqpkqA-Cii92bO-cG5+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_083138_839233_ABAB4A9D 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed, Dec 07, 2022, Atish Patra wrote:
> On Fri, Dec 2, 2022 at 9:09 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Jul 18, 2022, Atish Patra wrote:
> > > RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> > > the virtualization enviornment as well. KVM implementation
> > > relies on SBI PMU extension for most of the part while traps
> > > & emulates the CSRs read for counter access.
> >
> > For the benefit of non-RISCV people, the changelog (and documentation?) should
> > explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().
> 
> As per my understanding, kvm_register_perf_callbacks is only useful
> during event sampling for guests. Please let me know if I missed
> something.
> This series doesn't support sampling and guest counter overflow interrupt yet.
> That's why kvm_register_perf_callbacks support is missing.

Ah, I missed that connection in the cover letter.

In the future, if a patch adds partial support for a thing/feature, it's very
helpful to call that out in the lack shortlog and changelog, even for RFCs.  E.g.
adding a single word in the shortlog and sentence or two in the changelog doesn't
take much time on your end, and helps avoid cases like this where drive-by reviewers
like me from cause a fuss about non-issues.

 RISC-V: KVM: Implement partial perf support

 ...

 Counter overflow and interrupts are not supported as the relevant
 architectural specifications are still under discussion.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
