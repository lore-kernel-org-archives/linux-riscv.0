Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C89C5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28ahoNX+Uj9yOEJREeCAFYDTvcp9foHltgR3R6W8L3o=; b=TuZmrMk017w4aW
	4N6lK94PmyTT75NsQQCNiS+iGbvkSdinc3o0qgiBAPmD74O/vcXVEerbWjuiPuJ0MaTiKoTIkegDG
	ly4JWM4epKwLCoHBfER3cxi4gKcf+XNGKQEbhuh1hQkSUP5ZyeGXTCOqUSRDcYZ8X/U1jTEBKwyvj
	PSI72+8gSEXH36nubyG/vrRhTjMFLSN4wPnTIOxSGU2+ktx0Vk30pWTdHooyFUXvh/LS1AjrylnD6
	ZVfYb3OnfV7DC4FojBcCyR3faKsOfC8JT62RSGllgwy2M/8nRKIKyIpr15Hs7iSG02KkC9md6XdYC
	hJhem/EGTs053yrkpLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuo4z-00000002M9o-21yS;
	Fri, 14 Aug 2026 09:19:57 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuo4x-00000002M90-2Cc8
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 09:19:57 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so296527241.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2026 02:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786699193; x=1787303993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9cYu+veJFNK2glAWWGSd0eRvh+9Ngi5bPC0vJMK6n9Y=;
        b=WQfXSOYaV2zv0fdhpEIjUR8xj3Fk4/CnKRBBeEzilNDTAWl4UJJ5bRUFikzCeth9rk
         jsbG85rMIVEszqZN1M0v6uUF3WkedLRZgw9lFR7A2hUezNXKfHcLeG9oDs6zcfXbIjHf
         Ypv/RE3k5zmr57ymo4y0D+3qDmX91JqmLJPeAMuL6Al1yJFMlTF/NzHt1en8s90/aMNS
         OMe0lSbyAORBLFq1GOmJSi1AL62t8PIvZ5FPtIDNkxGIzK4lXJbExbznir5VMHHs5GkV
         pke75hlYoTtju6qG/tEIx8VPIuWaCRKXqFOsEvRPNHIVB9zxRUAByuLdBm/TAEsqitl1
         zQtg==
X-Forwarded-Encrypted: i=1; AHgh+Rq77NSJP2GK1zcMpIKwUef6zMFsTca6KAMxnvPC6ebPJLG1JEgmTpRC0HogAZEmhqybJHHSpHcsmsujHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjILQPmOkBVfjFq5L4i+iEKseat6bWQXIk5ZvSiWibPeZt5try
	eJhacaxCq8feu9Kx3+e6IsRDAg037OYJKi25eRELQ5kOdlDxhyKUsbkIDwlavMmbcUw=
X-Gm-Gg: AR+sD10lCt5IJo3q1uiaxhDxesKGtFXM0uMPo7D4urcme1UpZSTDzipzsR/p2AeWlGp
	guD8UbP7uIav2JnRNO63fdrdYTWMjQx9Zb0+3InOCwLTY5xjLrAOfzm1iVUGkx+RPTY4zeepiml
	gcnK248hTtbsf2hDtbuA7lIKXy8M3F9FmN7zmnrhtmgXBO5KsWkAPKfSlypjIwls9/MdYtXP3Dr
	vxQ2UoE6kAXRRYuv6VJzGj/kpXj0a1KMFqVjGjpn9bCNsN1/c8ZHCgbDEM/6DsWfQd+q2M2T/68
	CfJdDv6iYpkIsLR2q0jyG65efMtvMo/56o/IFfRk4U7UPihO5ki1ZlgAbZu8yU+xn4JmCFqTB2A
	Xck7gZ9jfhkxQh9kdSPUtvTJoQmArYMu7fOajWHNHx41bhoS0+67lcbe5IsZW5Ku5b4q1qdp2c7
	gXeGXF06Wf909gpWCTVofdXY9JSubAYJ+u5jiv01CGX0coDUC5IjhH+yTplGE6H35trUBiJpgU3
	62cfmpzIyITJak0ozaf3fhL6f9dvQ==
X-Received: by 2002:a05:6102:1589:b0:737:e816:b26f with SMTP id ada2fe7eead31-76f2e099718mr984501137.10.1786699192665;
        Fri, 14 Aug 2026 02:19:52 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97bfbdafba7sm551292241.12.2026.08.14.02.19.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:19:51 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso553470e0c.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2026 02:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpo3+pCDA8NtODEDNPZd1X4CxCKDHOGi/hA/34ugyBzhXnVvo0TR+ZSvzyYkAGqxUQwhcUyPvcUOmiyXQ==@lists.infradead.org
X-Received: by 2002:a05:6122:f89:b0:5bf:9bfa:53a0 with SMTP id
 71dfb90a1353d-5c591c69d80mr1061572e0c.1.1786699191251; Fri, 14 Aug 2026
 02:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
 <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org> <871pcaa2g6.fsf@yellow.woof>
 <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org> <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
In-Reply-To: <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 11:19:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
X-Gm-Features: AcwNN1WF2WhUvwHaIYTdgysoS-hjS27a6FuAyvrqY6CJtnRl1cB5O8FhMeoJOCc
Message-ID: <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
To: Paul Walmsley <pjw@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Rui Qi <qirui.001@bytedance.com>, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
	Jingwei Wang <wangjingwei@iscas.ac.cn>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_021955_581061_96E2A50F 
X-CRM114-Status: GOOD (  25.82  )
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

On Tue, 11 Aug 2026 at 10:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 8 Aug 2026 at 01:30, Paul Walmsley <pjw@kernel.org> wrote:
> > On Fri, 7 Aug 2026, Nam Cao wrote:
> > > Paul Walmsley <pjw@kernel.org> writes:
> > > > Now that we've queued a patch to get rid of the async hwprobe
> > > > infrastructure, is this patch still needed?
> > >
> > > Yes. Removing async probe only ensures probe is finished before the
> > > kernel is done booting.
> > >
> > > But there are usermode helpers which run while the kernel is still booting.
> > > This patch ensures probe is done before that.
> >
> > Okay, thanks for taking a look.
> >
> > Thanks Rui Qi for the patch; queued for v7.2-rc with a cc: to stable.
>
> This commit is now commit 994dad686e755477 in riscv/fixes.
> However, riscv/for-next contains the similar but empty commit
> acf3fcb5e9199cc9.  Presumably this is the result of a bad rebasing of
> for-next on top of fixes?

The empty commit was rebased, and is now commit 4e864f1c3d8d147b.
Please drop it (it breaks my scripting ;-).

Thanks!

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
