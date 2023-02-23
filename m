Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150EDC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8qPp3MyhDDcVkpwzXTG+mKpun0T891yEKIOvGOgs/E=; b=2FnHE3loUJCzxf
	R4qHmBqwcBcgOgHG3mfzLh9exjHbSl87KcSQCXLFIuntALQCl9M1sYXgj4vqV0em9TzBK14faGJ2K
	I0Uph/nErLeCihVzcPdsEjpvW6dxhqW4MaEGnT0KxTa7P2erpHFm0XV99OJ5rP9lDXyjY/8CT25IU
	eeTQqNF+3ARMbjSpgMB/7V4+h83gps8RLIPT/YeGNFFHYJqDmC9x1XpfXyAtSijyAhzgeYTrRJYDn
	2VUPjyg9RMAfTMya/fD3siei5yUDnZyRwUbq3/ygEe0fJ/TdjiZ9CEPZ9TlIvqxYivYC0JJ3+lLja
	lQrsQcAbgCuzrCMBjsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVGcY-00HaAt-7y; Thu, 23 Feb 2023 18:47:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVGcV-00Ha83-3T
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 18:47:08 +0000
Received: by mail-lf1-x136.google.com with SMTP id s20so14650770lfb.11
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d84WjkOkqupHcw+FU5vzhrvdpAfWUWehoXECwf0pUzI=;
        b=qhm3hPm+oSJ4s1ShP0lapEUYR5IkwmhP+F+TJeQKrxZd+TPQYlMiwjnu0Bj10ztB0Y
         YVurYzUsyGsKrzwbqRkGwEmL9maWHZaHGOOA65qnrC6JLnKcGptkWpvgQMgseJZlUAH2
         iYEoFhf2x9kip/2gCIgUrrWz9EeWQvDPbx5zbpqbicLx2RZgcVWR5xKL1BQro2kthufd
         kXPaewWe4ha8b3ROmFmaN0PuS2+nM4kSds4IAapt12zwv+KDBqlfRMQJj64QvmhtF2nf
         c+ZepL+WBfUJtsnpJmB//rjxP68pXKk+MNswp83Ty3nkVa+jVVkAAnxXoFpnZycxev4B
         pYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d84WjkOkqupHcw+FU5vzhrvdpAfWUWehoXECwf0pUzI=;
        b=KPd8AO6YazKRWc3KyKp7KLP4eyLW1TvDx+eUMN+9R0uP+3DxhVw2P0AT9VcOpEzsaK
         bewtsZfNmaq62wUTpCGNO1Xs5ubpKBsRh2Uv8YbKNFrezAaa1b4sWcrMAvp0Q1gAteeE
         zHJ7Y+29bqq/74r4HV9EY4qq5GSXiNw+nJQZqzAVbkjxl7mu3YfcD/LVNG+SfkNgMU/Y
         9dbssWWwX+T2NKgrran08EmSOCWJiukaS0HEC0WgKQvH4laTUx2Jvo23wdOv/2Zun66C
         IztlDGkkW/ojr8T2C7icbQ89fMANaLNoXBhmfWQ2IJpHVjDMFqdyu6WKBSb250TpZERm
         ih1A==
X-Gm-Message-State: AO0yUKUuSAKiXh13lDMDwZoqYF70pgV4jfhmzhQQ5LQRAwbYAgFG1JlU
	q77W5rNe03mfokR72gOUZgkI6oYM6lw72d6Taj0dUQ==
X-Google-Smtp-Source: AK7set9GVMhv/MFxdE4YCHJ+J6E6QpFq7wGeHK54sZrlaJUASkgEtczMsrA24TNPaRXTbFQJxd/Sez72HlZanbuvKhg=
X-Received: by 2002:ac2:5689:0:b0:4d5:ca42:aeed with SMTP id
 9-20020ac25689000000b004d5ca42aeedmr4072955lfr.13.1677178017989; Thu, 23 Feb
 2023 10:46:57 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
 <Y/cjW8qVhRTPiz0t@hirez.programming.kicks-ass.net>
In-Reply-To: <Y/cjW8qVhRTPiz0t@hirez.programming.kicks-ass.net>
From: Beeman Strong <beeman@rivosinc.com>
Date: Thu, 23 Feb 2023 10:46:46 -0800
Message-ID: <CAP55G9CmOai+L_5yhqAQT586sas5+zSc=NgeJZVa6U8WzQYf+Q@mail.gmail.com>
Subject: Re: Perf event to counter mapping question
To: Peter Zijlstra <peterz@infradead.org>
Cc: Atish Patra <atishp@atishpatra.org>, linux-perf-users@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_104707_194638_22DC033A 
X-CRM114-Status: GOOD (  19.62  )
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

Trying again:
Hi Peter, thanks for the feedback.  Can you say more about AMD's
overlapping constraints?


On Thu, Feb 23, 2023 at 12:27 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Feb 22, 2023 at 04:28:36PM -0800, Atish Patra wrote:
>
> > AFAIK, ARM64 allows all-to-all mapping in pmuv3[1]. That makes life
> > much easier. It just needs to pick the next available counter.
> > On the other hand, x86 allows selective counter mapping which is
> > discovered from the json file and maintained in per event
> > constraints[4].
>
> All the contraint management is done in kernel, and yes, it's a giant
> pain in the rear side.
>
> From what I understand the reason for these contraints is complexity of
> implementation, less constraints is more 'wires' in the hardware.
>
> With PMU use being ever more popular, we're seeing the x86 PMU move
> towards less constraints -- although I don't think we'll ever get rid of
> them :/
>
> > 2. Mandate all-to-all mapping similar to ARM64.
>
> If at all possible, I would strongly recommend taking this route. Yes,
> the hardware people will complain, but newer x86 hardware having less,
> or simpler, constraints might be sufficient to convince them.
>
> (and if you do have to do contraints, please take a lesson from x86 and
>  *never* allow overlapping contraints as AMD had, solving those
>  constraints is not fun)
>
> As you note, this is *much* simpler to program and virtualize.
>
> > Note: This is only for programmable counters. If the platform supports
> > any fixed counters (i.e. can monitor
> > only a specific event), that needs to be provisioned via some other
> > method. IIRC the fixed counters(apart from cycle) in ARM64 are part of
> > AMU not PMU.
>
> So free running counters are ideal and fairly simple to multiplex/use.
>
> The moment you start adding overflow interrupts / filters and any other
> complexities to fixed function counters it becomes a mess (look at the
> x86 PMU again).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
