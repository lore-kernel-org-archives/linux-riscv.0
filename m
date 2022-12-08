Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C97BC4708D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFc5V0c2lukRsnr+1Ozb02RWCkx5hbv3ztvxVwWU+yY=; b=ZUeZpzPj2CNSk4
	+vxvofEW2sYF6TNGlDeHLU9fkZIqlA73WTU9n1GfYs7j7yuU4iPYIwdxsXrakEAbssAcmAP9ql+xV
	A/m0AgPnnjYqh6TfWxBl1wODj3fdgCBmgJbgLs90d7ANumxGz7/pnYFwt0ublTSXzwv4UH1pxYEzm
	HB1LMAy23Ad1xVYeUjktC5do2843yIeoArFS7e1J5T1BzsIMrAO9OX3wwQKmDM0wHmIQjHRf/RHWU
	/TMs6FcQKZ2+K4sz7toaG3s1DIUpKdCb9rEeHcNWCQEU6Y5ALQUi7n207kPhMVll6Fc3f7yVWlMDa
	rIIjou/FFJKIoc3HOh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p35Rf-00HA0C-Kf; Thu, 08 Dec 2022 01:11:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p35Rc-00H9w6-EV
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 01:11:25 +0000
Received: by mail-pj1-x102f.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso5482pjh.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuptZMN7vunrA9teINtxZ2esf/Hdp6MybgUyi21FWx4=;
        b=jY64ETL2kkECdTEQMg8rucstga2N0o3I3CD1CJFV/JeOWXAaYuTbpQQqzU1sRTkcES
         /CHFF2U33jfhZV1WIf9wl22SwVCyxsEMERxBvuubV/7GvqGNT+wfsP1k8zdVxBhJfd8K
         FpE5jIAoNh5Yi69Y3gb0t1HGyW1L/04baWYyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuptZMN7vunrA9teINtxZ2esf/Hdp6MybgUyi21FWx4=;
        b=NWmL7I02b4tt2/056ZIYyJeySX7mX2UTg3mHnA9OqOlQ6e4jA6g0ZzwUNKJ8gczgbK
         ZRvtOpbzPa918XziYdKyii4fx7Fb06T72Lbeekz/jeE35JzWYR1SKIHtx/pQYg7Hws4p
         PY3kSJy0S5Xrwa1xQJhu37Idv/WBGAd8yBSM+V2ocZ09ccnj3iQBY3ys+E5rNu3wRiPc
         crFP0folk739GUWvaFzoKYTa7g6wbCT6mQFF9d7WEiKYMev8QJWcwE4rotUHAogtRMXg
         ERKbFYzkrUELSEY++LmpC1mg+S03SJTVTqqYR5ZO+VYJzWGpgBgIGoiwVzcde72/l08X
         p2Dw==
X-Gm-Message-State: ANoB5plQkpVB5RtH6y2Yl1U0EIWkrC441qwcbHb95eKYdwsW22F/4ki6
	4nFaTS9Tu716mTGG+IH9IzKASinprqGZJUd9UcoP
X-Google-Smtp-Source: AA0mqf6CSFfmG2Raqa4l9T5ncQkVtnTWU6KsrQOuHWlK7TspyF+qEuTbbJX5K8jKmy9tOHCbtPknVD0wG9lIZBJfsIs=
X-Received: by 2002:a17:90a:7d0f:b0:218:d50e:5af8 with SMTP id
 g15-20020a17090a7d0f00b00218d50e5af8mr77754002pjl.26.1670461881483; Wed, 07
 Dec 2022 17:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <Y4oxNbQwOldICdnw@google.com> <CAOnJCU+Eo7do0Rd+S4RBOMYpY+sG8ODqpkqA-Cii92bO-cG5+Q@mail.gmail.com>
 <Y5C/4s7OannaS8+H@google.com>
In-Reply-To: <Y5C/4s7OannaS8+H@google.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Dec 2022 17:11:09 -0800
Message-ID: <CAOnJCULpCy6Mt6EdJBHvH9Uei8OUiOx_dE52At-ZedCgpi283Q@mail.gmail.com>
Subject: Re: [RFC 8/9] RISC-V: KVM: Implement perf support
To: Sean Christopherson <seanjc@google.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_171124_509434_5B3C6348 
X-CRM114-Status: GOOD (  18.60  )
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

On Wed, Dec 7, 2022 at 8:31 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Dec 07, 2022, Atish Patra wrote:
> > On Fri, Dec 2, 2022 at 9:09 AM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Mon, Jul 18, 2022, Atish Patra wrote:
> > > > RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> > > > the virtualization enviornment as well. KVM implementation
> > > > relies on SBI PMU extension for most of the part while traps
> > > > & emulates the CSRs read for counter access.
> > >
> > > For the benefit of non-RISCV people, the changelog (and documentation?) should
> > > explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().
> >
> > As per my understanding, kvm_register_perf_callbacks is only useful
> > during event sampling for guests. Please let me know if I missed
> > something.
> > This series doesn't support sampling and guest counter overflow interrupt yet.
> > That's why kvm_register_perf_callbacks support is missing.
>
> Ah, I missed that connection in the cover letter.
>
> In the future, if a patch adds partial support for a thing/feature, it's very
> helpful to call that out in the lack shortlog and changelog, even for RFCs.  E.g.
> adding a single word in the shortlog and sentence or two in the changelog doesn't
> take much time on your end, and helps avoid cases like this where drive-by reviewers
> like me from cause a fuss about non-issues.
>

Absolutely. I will update the commit text in v2 accordingly.

>  RISC-V: KVM: Implement partial perf support
>
>  ...
>
>  Counter overflow and interrupts are not supported as the relevant
>  architectural specifications are still under discussion.
>
> Thanks!



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
