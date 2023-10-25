Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD07EC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqScnS6BPSQUADM2600s++sAw1uj/XR/AwGTerE+aio=; b=zXjnYTJNHJfCFh
	V+/JgqfUJQUrIq5ctejeKIv737GSJs+Xhn7aiK901cw6pqskM70c1p/d0Qf1zrhE6shOs33lK06E+
	BAlkMp4BYoKLhEC/aWCS3cSNp4D5orxZLim51PxSy33NSwNXkZ9XO/qaqpX0SZr7zt+kWUM7C3grI
	aXyX9gtZAhiogECWWah6fOuXCcf9S0sYJ0f5q/Yd0kdlCHVBq4UDbFenwDZon14LBy9os48B+Zp1t
	CVZFhldoG93uJOC7ZkfdUkcjMu4JSGpVDswYR28w4CwdwPasox1fHrMPj+7/FfXInqS6yNET/5nJY
	/Atwpi2THjO4c/hiN/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdPG-00CLUM-14;
	Wed, 25 Oct 2023 12:54:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdPE-00CLTL-01
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 12:54:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-27d0a173e61so3988700a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698238479; x=1698843279; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPGldAWJyTZnXByR/bf8zHHVWHLwPdXuNiykPl5PWWs=;
        b=wDYyy2JBK7cm7HOzwOzdGYyFnkFhfscTEXdKFYDHd1fdph43xN8jJ7V8JwDpbdPElT
         HpBOpTmjb1pCEqtb0VTgIeCN6NrjtJqNy3Set4N5Hb91En4TVdILsAFyIXV0pHqBwfNT
         gquScXbS8Q7XofsHfyDIx1X7ArvYDIqQx83nVd7CflXl/t3/+MQWxoJJRrwYzH78zmmR
         X74N1r0IKb+Y88cOG0HqlStPHFwtfzl5jan98x7vMrtCSYJ9y9k5gGgcoix60N9CRdLz
         9F3xppdXqpbvCtJPjArQP0RuDvIX9LADrrzalTILFQ7qyH0wHGWlr/TBQSEMAPgQVHB4
         C0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238479; x=1698843279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPGldAWJyTZnXByR/bf8zHHVWHLwPdXuNiykPl5PWWs=;
        b=fJtbICooYMTmNsCCGifazXmHV0k/FwUlN8YpKJuwtjdniTatN+HQVUWTjI6atDcaSt
         a7LGWhGB/sWLufUBnOSBugtxvt9yOnwzVI9Z62AnAqfbAR6KAi68XSFUXmgaecVVGy5a
         1CtReJQxABYhcCm4wjlsL1Bkc1T+mG6zyv8Rmi9FFBbnSNhoKMO0bAK+Mcm/VdogKEi7
         cHMtSk0TatYoyrPte0v7cWnKFu/xTrlMjmpjJtOaMWpEHhXWixa+2Myo/lt0vrlHv36s
         R84WnAHjZAwombxohfyDZyV5Q4rRtuL7yn2S+HlrMwjFNTsDarlfUagRe+93cay99dwg
         g/Iw==
X-Gm-Message-State: AOJu0YxEOT34VRkv8/z095Ctb6Q0mw2vLYXgLDBhxdQlT2jtuBgtHBKk
	sfojeDbmMvHMrCqqHJmV2h8Epl37j49gZzfSI36tJw==
X-Google-Smtp-Source: AGHT+IGjO9L6iksEY/Hs2jEAkHI+wWRAwbfSvy8P3pgIhR7Ie6EzwW/2mIdUqJoPFBumn0d4ymRUai2wBWHygb7yBUk=
X-Received: by 2002:a17:90a:d44e:b0:27d:9b5:f28d with SMTP id
 cz14-20020a17090ad44e00b0027d09b5f28dmr12291581pjb.8.1698238478933; Wed, 25
 Oct 2023 05:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-5-vincent.guittot@linaro.org> <20231025115456.GD31201@noisy.programming.kicks-ass.net>
In-Reply-To: <20231025115456.GD31201@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Oct 2023 14:54:27 +0200
Message-ID: <CAKfTPtDhRcyHQKGy0aNLXLzGJ6LS+Of7ZjeQGGGv5f5qtNxiBg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] energy_model: use a fixed reference frequency
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com, 
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_055440_047382_AAFB3E8F 
X-CRM114-Status: GOOD (  26.21  )
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

On Wed, 25 Oct 2023 at 13:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 18, 2023 at 06:25:38PM +0200, Vincent Guittot wrote:
> > The last item of a performance domain is not always the performance point
> > that has been used to compute CPU's capacity. This can lead to different
> > target frequency compared with other part of the system like schedutil and
> > would result in wrong energy estimation.
> >
> > A new arch_scale_freq_ref() is available to return a fixed and coherent
> > frequency reference that can be used when computing the CPU's frequency
> > for an level of utilization. Use this function to get this reference
> > frequency.
> >
> > Energy model is never used without defining arch_scale_freq_ref() but
> > can be compiled. Define a default arch_scale_freq_ref() returning 0
> > in such case.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> > Tested-by: Lukasz Luba <lukasz.luba@arm.com>
> >
> > ---
> >  include/linux/energy_model.h | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> > index b9caa01dfac4..1b0c8490d4bd 100644
> > --- a/include/linux/energy_model.h
> > +++ b/include/linux/energy_model.h
> > @@ -204,6 +204,14 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
> >       return ps;
> >  }
> >
> > +#ifndef arch_scale_freq_ref
> > +static __always_inline
> > +unsigned int arch_scale_freq_ref(int cpu)
> > +{
> > +     return 0;
> > +}
> > +#endif
>
> Hmm, did I not see the exact same thing in cpufreq.h two patches ago?

Probably, this has been added because of error returned by some
allyes/randconfig on x86

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
