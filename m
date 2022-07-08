Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A967C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvUKCPzkKaYXslujxDBktbVnqfcLRzqdqiFkqNB4Yjs=; b=GNptTISfZZnB7D
	3i9fyrruvNWaeZth8F9969yH0RCrmjWeNOdNe3VgSeZQPyGnAzXCKd5mKHMo363uJZfZ+smpaU1dY
	YFY7psLw3Dzp0OCo2y7aKOaJKQXpF1UUXDdlM9SPMcqauSGLttSzBH2An1HMfsR3V70O3Qhvty+/Z
	ta8GXJNQje9Sken+bB78yvKrhgwXa0DyEkE+nkLeBagoLQnrgCKFv5x6Qs2QBIVRsRpGxFCcfHUeG
	3CIEnRzuFq3pR86xCRwGLNnPVujxppHNnpEnjUiscGXh+cChCUW8hWqVEm/Eovl4yEjfg2IFcOYr1
	STX4uh/6Avx3EUacoJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wNW-006BgL-H3; Fri, 08 Jul 2022 22:23:14 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wNU-006Bc4-0f
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 22:23:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id g1so131267edb.12
        for <linux-riscv@lists.infradead.org>; Fri, 08 Jul 2022 15:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yBdvBTe3g+WoWKyR2cO1ADMFniLHi7aD7N14QfJmN44=;
        b=U7LtpCI6Et+ZUqPOwI7r1KOG9LRVjRO7f1c4kL0531lewHHh9QjqKjQcAHW8knDWzw
         z73ez2NzxOWumdTs0B+BCHhvvM9dxWx86TkIYUNcIzrsyC8q5kjidXciPy0HMN19m/kE
         flvme3cuK73mxM7PMMkL3lmulqAksdjMTlj8baWX7qfqcvDTi3+uhoK1GToJ9mh0uzLP
         WVaN6MxWGI2e6MJ5CL8xAt4kKst2ifyXiczourRO+nvn0ZBXlmTgjlHh4G40LZHMl3tk
         1RL58VIR2/Uq7XB6Z8P2akBKPo17vtaz7T/8SRZcCSkNxvZ66HkM/rzCP1jj6hfteyOw
         FVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yBdvBTe3g+WoWKyR2cO1ADMFniLHi7aD7N14QfJmN44=;
        b=VLxeMJqbAKDlEGl3VI3HtAXFeN/PD5NjlSgs/lOTT4cuAQOgOoE86bqUm4KLSJ4WTc
         sGhg+O7Dm8ATs4YUkypZbHz5/HN5LgQGJ8rSlgEeD58Dau23e6PEkyKLBiJ6T+7esqd1
         AvyJPtVHycvh1ivB7j02vhjHVh0YFO4hJIBGJXIsmMAn2oyT+hsyAz/6ydJquxFgZCOp
         YL2ekVlCKfeetfPo9qLv5iVGvFe5HNDi8XL5C1K5GW+MIiiAhNzwQl5YoORvuTQ+XuOM
         wDKY42jlApb8eXCi1rKTcJbm7oodHtu/2+R+JS+Ibr1NYGecqAODTIHMyxCkYcacUy0p
         l+TQ==
X-Gm-Message-State: AJIora+I9r/1snGSsCSberl+qrTNRUEZKmR4NFm45gQKqAK+7zFCNenC
	Jy4nMTaVr/+yToA+20f7J3rA0CE9SBMWSqxt4c4=
X-Google-Smtp-Source: AGRyM1tiUsd7f6UAjFxaGOKMCFQWdEHIWpjx8lm0dM4npIINocOYFvbbYuCc1fEkvWycP/6zDtaD1wDwsObcNke4aAQ=
X-Received: by 2002:a05:6402:c92:b0:43a:7177:5be7 with SMTP id
 cm18-20020a0564020c9200b0043a71775be7mr7796141edb.224.1657318982890; Fri, 08
 Jul 2022 15:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220703130924.57240-1-dlan@gentoo.org> <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com> <YsUy8jBpt11zoc5E@infradead.org>
In-Reply-To: <YsUy8jBpt11zoc5E@infradead.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 8 Jul 2022 15:22:51 -0700
Message-ID: <CAEf4BzZrvOyYxmJpw=azZ59adeEqnHYqnUXKQProyUKBP5NaUA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
To: Christoph Hellwig <hch@infradead.org>
Cc: Alan Maguire <alan.maguire@oracle.com>, Yixun Lan <dlan@gentoo.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_152312_078323_993723FE 
X-CRM114-Status: GOOD (  11.00  )
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

On Wed, Jul 6, 2022 at 12:00 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Jul 05, 2022 at 10:00:42PM -0700, Andrii Nakryiko wrote:
> > riscv existed as of [0], so I'd argue it is a proper bug fix, as
> > corresponding select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE should
> > have been added back then.
>
> How much of an eBPF ecosystem was there on RISC-V at the point?

No idea, never used RISC-V and didn't pay much attention. But why does
it matter?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
