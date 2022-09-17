Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E27CECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 01:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0veyk88EZC7Nw2wXSnj6lvnPVtSJojEiK4tQMMmKGSY=; b=QIN6xXsoNTiPWM
	UAuFOMranYl2MnxEwsGwvhimgbng2CFxsLkEUfw6lF8auNbiC6FrDpG19ISHi4WOQicHF5BhTilri
	T9VBrnx2ZhYhirMxx0Ds7i+aUc5auK0YjX+yFViTHJJQeWVZK+uMimaCHARlBGrrXm9CGiIxihduK
	tD6NcPEkjfdduOSwS+xB8ziRKLHwXv46UBETI4lZjaIMYDdKAO7zMjRqnLfD54bxE48aMvtrpGzkL
	xaLANhsledpLrLuacITnY0qI7KWUDgswEB8V0bqESvemSr03CRa0/i6WL9TdhbZ5q4Lgms6YShYWw
	94mDZZyTkWRPxFg19elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZMFy-001BWA-S6; Sat, 17 Sep 2022 01:04:30 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZMFv-001BRj-Lq
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 01:04:29 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-127dca21a7dso54419609fac.12
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 18:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SogmOcn5XgXAPzM+7JlX6XaTLeT2kaxiYykTmtO0hXA=;
        b=d46pj9O6QuqVJvQ7YCXYSw0bTZhDLrXLLjyV7UeyMaTvRIDfMFf9FDFyAOoi/UNRUJ
         ESaS29HgFrXm6VZ/4BqG9aYzE5HgBX7MuOMtUYIroC9g0Mieuj0Oe0OQ2Y2OaWuw/8nj
         LdC/viO0iGzDntj0ejsNMgx2R+iY4jEQ8E3QUJGtZXjZQVj69WRhlzRqeH053a6/a46U
         2DX9HxVamh48aAsQCtaHACfqPNawkDZ5Gg/uLKWH3aSLcEw9H1E6+S45nGO0SWGFvjSE
         wbtb5vme3E6OS0dZSR6bFBt1BYfadgOTkFNNxUYgmp99cFIxBUrInmKlkaLhzklmxxIs
         Z//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SogmOcn5XgXAPzM+7JlX6XaTLeT2kaxiYykTmtO0hXA=;
        b=5oARag/JzI0rWJYD8cAsuktY0Cmyj3hncoFXYuqBDD/XGhwBGElTHck7oHljcNRt9g
         EOsxYoUijwS5ZtHQG5ZYmbqbB+AaPq/wvNzJHBalOR+O920HtDZlGQqgw7Mk4PVmR5GR
         5EKCVIDJ3Bnx6D3S9+lCQ8JOAeSAJ6S2mkuOE7d+1eAQPTFlmoSnvUHddEfHP3Ug0E3D
         yS6lbfo1XMbdyriqe+0MiDlI4buPxtTDQSsB15OJT7t38NdY9JLFUGFjIiqa87z+DZ4S
         uo/0ebDJI5ICHsut6j18lKQl0TBsOC/8lXZGdk+wogCLxJrudNL28ZeoojFptSOWMF1U
         mkRg==
X-Gm-Message-State: ACrzQf1yjJ+lCyXHq028ojIuOLSJihBhMtjMxy6YHoAXfZMsO8SY1FPq
	Bmbm1+IQVAnF9pb0e9CCw7j9FhsLXgcgeXuT0g24sQ==
X-Google-Smtp-Source: AMsMyM5jVUNDNoru0yHLu9A1nPd4s6/V6WhFdx++YaMq+TtIzGJ3B7Nf5Mgl6fo9rRvlo/yBKTh4iy7GDC3EpdmgLiE=
X-Received: by 2002:a05:6870:f105:b0:127:f289:cd27 with SMTP id
 k5-20020a056870f10500b00127f289cd27mr4265550oac.195.1663376662160; Fri, 16
 Sep 2022 18:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-4-andy.chiu@sifive.com> <CAJF2gTSn3_cDYsF9D8dt-br2Wf_M8y02A09xgRq8kXi91sN3Aw@mail.gmail.com>
In-Reply-To: <CAJF2gTSn3_cDYsF9D8dt-br2Wf_M8y02A09xgRq8kXi91sN3Aw@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 17 Sep 2022 02:04:11 +0100
Message-ID: <CABgGipWBOZx+c0i5B9xArTRxa6-4yAbeByWXr7v8MSf7AATfxg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 3/5] riscv: ftrace: use indirect
 jump to work with kernel preemption
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org, Jim Shu <jim.shu@sifive.com>, 
	Ruinland Tsai <ruinland.tsai@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_180427_720010_16C92E6E 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Guo,

On Wed, Sep 14, 2022 at 2:45 PM Guo Ren <guoren@kernel.org> wrote:
>
> I really appreciate you finding the bug, great job.

Thanks, :)

>
> On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:

Consider this case happens on a preemptive kernel, with stop_machine.
And all of stop_machine's sub-functions were marked as no trace.

> > p: patched area performed by dynamic ftrace
> > ftrace_prologue:
> > p|      REG_S   ra, -SZREG(sp)
> > p|      auipc   ra, 0x? ------------> preempted
> >                                         ...
> >                                 change ftrace function
> >                                         ...
> > p|      jalr    -?(ra) <------------- switched back
>
> When auipc + jalr -> nop, is safe, right? Because when switched back,
> jalr -> nop.
> When nop -> auipc + jalr, is buggy, right? Because when switched back,
> nop -> jalr, the ra's value is not expected.
>
> Some machines with instruction fusion won't be affected, because they
> would merge auipc + jalr into one macro-op.

This might not be safe as well, if auipc and jalr happened to sit on a
different cache line. And if there were a cache hit for the line
having the auipc and miss for the jalr after switching back. I do not
really sure if this is possible in practice.

> Qemu shouldn't be broken, because auipc + jalr is always in the same
> tcg block, so no chance for interruption between them.

In fact, qemu is broken. I had not thought of that before I got your
reply. But I believe that there is a size limit for each tcg block,
and the auipc and jalr just locate in a separate tcg block.

Regards,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
