Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D58C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3qddXGlT4rQOrc062GLOrZPbODz8fnCHj2timei6Yk=; b=CLCbDa+5/M09px
	5JFPDab8cPdteFIkEjsajV5XUAt+R0zWepvBKshBEEsprIyFmUOsovpu/vqt4n1qA+ZTj2kOlScWE
	MuHab2giUj0n1bdN6jjMtprznzIn/15N/606x0re4Wh2b5K6SPbDZF4LrH61JMZ7yKaQmvDShIlo/
	r+MVwZwPnSDy2czYyylmNfatnNIeFLc64Do7wHi5kaUZsFiywU2gYJkx2b3qJ6fC1ccBxAB+jTwUL
	FxsYlXdH6Pzh0S3detxq+hI7dkqgGqMkpIWTGvAruLyWLL5ELBE1auNMfhuZ6f2atWzfFBJMIri8E
	vBStNsLPzch9cxw/kW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8PJy-009640-2w;
	Wed, 29 Nov 2023 18:30:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8PJv-00962v-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 18:30:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so600245e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 10:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701282590; x=1701887390; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PZV2QPewxHMt+nvpSEk026io2gN1RNWhVSG3HcbufI=;
        b=O6SfjUrvfFLsAbH7AdmaquxZ2U+o4Q6QDUeyb3obagkgtsRz8VU3VxvTQjB8Yh4agl
         0Yf3D9cr+P9nMhXnsXihYIeXjA8bD0OQB9sPCUsK/GjCrIWSh6cMo0nm5VxZw35zCEAy
         RyrMqKe3HOGPiNNFD8kL4qSJLhuv1yW6CrU+Xqh6JwFxfQ1TkMKU0bS5s9vlCqXBg+4f
         Q+VXhj5RzjRFSqOkNyiXm2kSdtyAmdkXwa49mjMAKZfxUCUJUiYaBvRiZCwINwC7pgn5
         e5rSux+GVC+VM3YvLsymQi0GT0DOL2ykhAirsrErSP2nvU3xL0RTtqKGePeuNV0g+cAe
         2GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701282590; x=1701887390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PZV2QPewxHMt+nvpSEk026io2gN1RNWhVSG3HcbufI=;
        b=hht7QMgPfoxsEZxVvUdc+2wHVM6BMv659q+F+r0Ok2IOd14WrtPibQdOlBOa1t9+DP
         MX0AJ50QA1X1UEU1xH5P4KacAg26vS/xEAfNx+nZuRdJxILeiRQCqLARB0QYMahNy/aS
         4W7JmcsogMVejPmC0cxLD02wfKio11zx/mZmHCmgpI/tWJvzURZiKXuE0ImewXIDlD7d
         jPjlYVzyfJdADjue5DUgq2dAqcx8HTHItGGHqnP8SyCi5Vg0serxpjlH6Oh9HQGry3KY
         xs2mYtugG7EfSoRzmAoUxoeurEglBxGcc46xVTdHja6KCP62TC+KORIs8C37gnmIgT3y
         CCEA==
X-Gm-Message-State: AOJu0Yxilzz6dnkhfHP/dD6O931CEFBzyR8dKQIotJbrh/9GctxqhXeh
	8AwEiC3iSf2ThbYlUWeClX8=
X-Google-Smtp-Source: AGHT+IHI7Jg7NWdN2dQmGOw5cIlj3MXJKetXHVlNzAuZAziMMd6csd8fyL5P3GvEV7dK0hIoGVOh4g==
X-Received: by 2002:a5d:48c9:0:b0:333:1c69:dd5 with SMTP id p9-20020a5d48c9000000b003331c690dd5mr971955wrs.6.1701282590188;
        Wed, 29 Nov 2023 10:29:50 -0800 (PST)
Received: from andrea ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id 2-20020a5d47a2000000b00332ff137c29sm10453314wrb.79.2023.11.29.10.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:29:49 -0800 (PST)
Date: Wed, 29 Nov 2023 19:29:43 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Message-ID: <ZWeDF0eHyOc/b9UJ@andrea>
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
 <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com>
 <ZWYDtB/otYvTMZWd@andrea>
 <0a84c0e0-2571-4c7f-82ae-a429f467a16b@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a84c0e0-2571-4c7f-82ae-a429f467a16b@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_102959_483363_0D27F93B 
X-CRM114-Status: GOOD (  18.06  )
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

> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 217fd4de61342..f63222513076d 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -323,6 +323,23 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >   	if (unlikely(prev == next))
> >   		return;
> > +#if defined(CONFIG_MEMBARRIER) && defined(CONFIG_SMP)
> > +	/*
> > +	 * The membarrier system call requires a full memory barrier
> > +	 * after storing to rq->curr, before going back to user-space.
> > +	 *
> > +	 * Only need the full barrier when switching between processes:
> > +	 * barrier when switching from kernel to userspace is not
> > +	 * required here, given that it is implied by mmdrop(); barrier
> > +	 * when switching from userspace to kernel is not needed after
> > +	 * store to rq->curr.
> > +	 */
> > +	if (unlikely(atomic_read(&next->membarrier_state) &
> > +		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
> > +		      MEMBARRIER_STATE_GLOBAL_EXPEDITED)) && prev)
> > +		smp_mb();
> > +#endif
> 
> The approach looks good. Please implement it within a separate
> membarrier_arch_switch_mm() as done on powerpc.

Will do.  Thanks.

As regards the Fixes: tag, I guess it boils down to what we want or we
need to take for commit "riscv: Support membarrier private cmd".  :-)
FWIW, a quick git-log search confirmed that MEMBARRIER has been around
for quite some time in the RISC-V world (though I'm not familiar with
any of its mainstream uses): commit 1464d00b27b2 says (at least) since
93917ad50972 ("RISC-V: Add support for restartable sequence").  I am
currently inclined to pick the latter commit (and check it w/ Palmer),
but other suggestions are welcome.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
