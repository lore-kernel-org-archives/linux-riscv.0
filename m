Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3197C5CFCF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrSPBZEIzMd394pBcXJs2gBEeBtUoWHzu1aD45CxBx0=; b=N4VODWnc7ZE127
	XY8+CgZiNL7Ir31DSTDU4cMjI6wYzbsNvAnjZDaXmEyIWn+m0uge+fAk6Ukrd1UXew310ywxrZwqr
	AYLkgBQ76npQGQkKYNTo7czTKakj/UQsvIHoi4e6VA03ObyjRa8wacx+vkDJREZymKqpVmiRwyZg0
	9KJ2FdcXS7xnJ2UpodRNC4G+v82Vll6TexyD13Ua46x8UpnCIld31tKzUmeM+6eYLuShDo9vXYjsx
	3zp+DV5vxhEq5/IWxKcFmiNZHzbytEFWkXIPWO46Hmsw9OOosZ8FCdp5adYbAczBbRQj/fZenwf2E
	XyOzrTYK8yL9ZUaAS3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wti78-0000000DeSZ-3uUC;
	Tue, 11 Aug 2026 08:45:38 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wti77-0000000DeS1-01Ra
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:45:38 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-976ea28c65fso1587720241.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 01:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786437935; x=1787042735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wuD96jkyFRAJDxLrv7VxDZQ1jCgls7jP6RjRb86vqnE=;
        b=l21L0EadfHtLx/cikVC7LUC0ZRQ40H4utvxfqo0ZS/dWmsRhIacVcD58iniHoz2c4u
         RtA7vrnmQDNuQ+BqZDKwfOw/UF+BYnmXjgCdOuOyZVckP0ovRoBR9SibIyyyd6exc8VT
         BIXw5siUCjIDqAgdojTYijWDwOANJNDq4VYXXJBJjcZ9CbLXehT8I6hnWxI3NEbT1w5D
         OEu5nYHNMefMHLe+iXlVr8RYiC6U4xhgbccomvZRkav9vYGHVZnwL6S2SfbmZOelq2lj
         GRZFdCTNRhnsKZpjmceZ4as8qY7ETPjX7gEcAZRIsnXTdbKc7FUn1/7aD1PKzKLNTpSB
         S1IA==
X-Forwarded-Encrypted: i=1; AHgh+RrEcPNcPIDvY/iny/xBDbIqlMTRBoxF2rQlBgaYk4PQwLx/VnC+Lh3+/ijseHFiqZDMCRjiSa1OsvTIOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+GMTco7lIPrjyfCEgy5VQEBzJM2ZUCxkNgw9LXUNGzaqr0Gz
	nBuc5eLVObwg1p93v3Z4+4rVR1oApsQJM7qsM4UeDJ7BBGLhk0XdyCRiWfQvZLuy
X-Gm-Gg: AR+sD13Bjd8O1i09U6nA2jJrepuY5kSuKVEuApGVCjTOfwy6ci3S3Dfz+oB70Wr6zbC
	mQ4QvaJaYxOm+Hfp/Nvg9Dl9WHNKNDNMFU/4xDU2+bI/+AUnnYZm+MFbO+iV8Iq96aHdALTYulm
	Qg4+enQ9/iPFnFBkkRS6NjfXNh9clZhNY7mW7Yy62ks2VgLNb52DfFzmQibpAzeZPHHTmyajfpW
	iXxO2iss3a4Bu5skrPsCHiKoc65Fa6QBuOJU9qWVtCVR7tMixp/rUlxzl8yIfNyR1F8wqBiJbVk
	LJdkMporb5KumDcuojYqyl3yLd6h4rc6MxOCy2xy5IRMdM4WjQyx4CdlRfr0AaXQDrAqKFKvlcD
	zjA0fh4oo2qb2jCqime4cbY7IFME/9w2xg3PWTNYBzAnm06MvYkYeNaE5iB8FilOz5HGpACMvyF
	l6qOSdYrQo4wIDoTxj/KrClSXtEGbpF//fxP55AUbI0xkRq5+2rigRvpwOPGM/3+uNofLY2p51s
	XzyAtIjFsuDR2M10QwopiJjjw==
X-Received: by 2002:a05:6102:c13:b0:726:8813:2078 with SMTP id ada2fe7eead31-76b56fb9d92mr503442137.11.1786437935567;
        Tue, 11 Aug 2026 01:45:35 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b65bb5ddesm298854137.12.2026.08.11.01.45.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:45:35 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-976ea28c65fso1587707241.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 01:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3FehzzCdtYRA7M8H+Dthmdy3h7REMFee2DYbBBAub+IGx6X6jf1ur7lkbFhZFOTr7MWPS0Sw5xKSMBQ==@lists.infradead.org
X-Received: by 2002:a05:6102:32cd:b0:737:bfe6:3b03 with SMTP id
 ada2fe7eead31-76b55e928c7mr527965137.7.1786437933756; Tue, 11 Aug 2026
 01:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
 <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org> <871pcaa2g6.fsf@yellow.woof>
 <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org>
In-Reply-To: <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 10:45:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
X-Gm-Features: AUfX_mxoNGnG7M-jK6smxeOqoPvMxc9XrNI7Pv-rO1365KBWl7a-h7gKNzaFosA
Message-ID: <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
To: Paul Walmsley <pjw@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Rui Qi <qirui.001@bytedance.com>, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
	Jingwei Wang <wangjingwei@iscas.ac.cn>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_014537_051898_C53F113F 
X-CRM114-Status: GOOD (  23.59  )
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

Hi Paul,

On Sat, 8 Aug 2026 at 01:30, Paul Walmsley <pjw@kernel.org> wrote:
> On Fri, 7 Aug 2026, Nam Cao wrote:
> > Paul Walmsley <pjw@kernel.org> writes:
> > > Now that we've queued a patch to get rid of the async hwprobe
> > > infrastructure, is this patch still needed?
> >
> > Yes. Removing async probe only ensures probe is finished before the
> > kernel is done booting.
> >
> > But there are usermode helpers which run while the kernel is still booting.
> > This patch ensures probe is done before that.
>
> Okay, thanks for taking a look.
>
> Thanks Rui Qi for the patch; queued for v7.2-rc with a cc: to stable.

This commit is now commit 994dad686e755477 in riscv/fixes.
However, riscv/for-next contains the similar but empty commit
acf3fcb5e9199cc9.  Presumably this is the result of a bad rebasing of
for-next on top of fixes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
