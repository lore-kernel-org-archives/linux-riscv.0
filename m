Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D542DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqOn4ID8DrxhlP48i3Vn5RWDsCYsKJ7zbqcHNl9Whk8=; b=S7MYWrrwxzpYTe
	M+NFluHaNEtQVxiKnVb2DGSj5QXacvH0nQs36o80ITaSFSmo8n1zQ1rg+7ppvTsgoeQyRw+A/GUON
	jVdNNm3FXcJTtWUdzDgQgvimHTwpmmrFy+mEitMcd5VVdwoCrvQe5DKPIK3p/wXpI6jtYGx3TT+w3
	aWEeHMPU2g8v6/wFkSckDrLYfEhQGGMloutwywqLlwdjs9Lz2onzusJREde2YKxWTB5S0mAgx+YdI
	yO2ZGzrPypM5xwpMnYs6sJee4JcJmeAfH+Q56ZxLcBYjyPf++fh7lnoNvGwYT/UlQU43BINmOk2PN
	y+UuwnporjPIf8OOn8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnsN-00GpvQ-Lg; Mon, 11 Jul 2022 07:30:39 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnlC-00GmZj-4q
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 07:23:15 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2ef5380669cso40025057b3.9
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 00:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2SoPBJmKp0saSsSrJnUdC1t5V8sczg7YM6NjBDpfI9M=;
        b=uOrNhwEocIf53B5XY1R2Tvu8TokuoTzcDM9cm+Z4aJpx7RLrreRyBxVf7yGkHtiZJe
         KxtuvbeyKR6ZXN/gY+cL+glI0SXf8NV/VPP5bIZFSQ+ePo6T/VmYtcgK62oNI6ZAqb/Z
         WF+IkIGCKEeM7WZIfIdSbQ3gNlgxGxtXHQyu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2SoPBJmKp0saSsSrJnUdC1t5V8sczg7YM6NjBDpfI9M=;
        b=1WWLj61GwxKPqOcLCt6cem2k7oCCNl7NdaWSqMUOpVcIl1c+JWEd29AUKZ/+0h/ADu
         kyQi5Wxe74F7gF0NwDBb9HZ+7timxsn70GpuHU+KiYZjij5eO+fdxvMb6KLp+Mcck6cI
         RWQufcmAhiB2eXoSWo4d5ZHsnPzh9PnXRrrnfPmNBq4U0nMJdl1IR+jBK2/H4OXlIzpU
         +V5ubzu8XOyqJzhHy7ZHNsWxGyBaCDmfX9AfhSyLmS9GYXjw2A3L9tfiiSFv/g7LvXiT
         +86xusXc2KZBcHGek0luM7FO5HplLGVM+X149oj88gbFHCUZj1KAOO4OP+7hwNBWYC3M
         sX+w==
X-Gm-Message-State: AJIora9PzS5ImR842hiT1qKqCjtH8toxCqfKzwlji3BL5CAps72feOy8
	wtWmi8w+eqtywBWatkzc2IOAMZZyt7cqKDNsQJ1kGJp19Q==
X-Google-Smtp-Source: AGRyM1urq7PZ8Mtl92sfk9Au28AkBWUvldy4Lo74JrDu9e2Zto9Rj1gaNUByC2UgLYepy71G0xXK5jMH1Gk8p202EuQ=
X-Received: by 2002:a81:5d55:0:b0:31c:dce7:96c9 with SMTP id
 r82-20020a815d55000000b0031cdce796c9mr17693064ywb.519.1657524189324; Mon, 11
 Jul 2022 00:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220624135902.520748-1-geomatsi@gmail.com> <20220624135902.520748-2-geomatsi@gmail.com>
 <YsvGk+ybtFZ9wQk1@curiosity>
In-Reply-To: <YsvGk+ybtFZ9wQk1@curiosity>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 11 Jul 2022 00:22:58 -0700
Message-ID: <CAOnJCUL8LUGbTkt5YywMHS07C0M8Dt1E=w5J22vJwisU_WWF9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf: RISC-V: fix access beyond allocated array
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_002314_248271_47737150 
X-CRM114-Status: GOOD (  15.89  )
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

On Sun, Jul 10, 2022 at 11:43 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> > The root cause could be related to the interpretation of the number of
> > counters reported by SBI firmware. For instance, if we assume that unused
> > timer counter with index 1 is not reported, then the range is correct
> > and larger array needs to be allocated.
> >
> > This is not the case though since SBI firmware is supposed to report the
> > total number of firmware and hardware counters including special or
> > unused ones like the timer counter. So just fix the range in for-loop.
>
> Hi Atish,
>
> Just a friendly reminder.
>

Sorry. I thought I already sent the RB tag.

> Regards,
> Sergey



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
