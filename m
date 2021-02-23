Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DF7C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:32:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B8264E3F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B8264E3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XcIcUaKfMPt+TGxpmf7wqGi924sf/XXXigPJjNcfoac=; b=sizsOaFHFDdYDKPOxLv1Lm8KC
	4f5yLzgNV+CF5AilGu8JuZU1M8ABXpTXLEl5rJDRA4zkeH5yFKDlgGbxNCOTPxgbDaXxJekvgtUCO
	Ec27QytJMEvoA24hY5sYWQJmcQfFhXupb4s/Qibef2+KZ4xC3X5CZoZ6LVpb2+D2WrLXMc/8l8EjT
	rwq0Hiem0+cgvduqglh14l7rPj3UsjX9Bz6veLqa38daFtmkztulA5F2S5Ng8IJSjINTgz2dIiCf6
	2GXVAls2FO1o7/UmFXLlfLA42e60Tvf+2uGHmcbEENSMJd0Xn7/hkkN1uxeN95Rz69IrFkTPBQ+d3
	tMZthgfFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENUM-00068e-N3; Tue, 23 Feb 2021 02:31:50 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENUJ-00067Q-QZ
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 02:31:48 +0000
Received: by mail-io1-xd2a.google.com with SMTP id a7so15518429iok.12
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 18:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JEuYJuQRqJcKGWuFA6L1ex4F1e2C+KcEnHJZhT9FdZA=;
 b=kjYopEl2v1bGXaZ3fcTZl8ehpMYQyp4AdStpVTDecP7qg8SCWEtfp1W+/SIfxaZ5qC
 UO6tj7bkHxdq43Jq8ovn4lZsH8SFez5lGU6KQGLSo3kywx0r0UJw3L8ttr+lzVhqAluK
 fHGTnotTk15c4WiWuQZ/TraPWVR5jL8Iv5Tjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEuYJuQRqJcKGWuFA6L1ex4F1e2C+KcEnHJZhT9FdZA=;
 b=lCUaYQAHr0P7saY6XtCnC3VTnL0MZ6PZV8087Y+fAIhJC2pRRu9ZLRtiK1SWyH2WNj
 F/cCk3DKiw5g25jLyzZxrHe9xLOCh8SSG1LIu4u2/Gk+a05qakBRZWxbfLGQusDnxPO0
 VWxeHkLyAMOalzZYQgaX/JMTZs2C05R9Q9oTDuB04BQf6uoxGy1NC4wsja2BCunVEV/E
 /iT6gNNGmjZV/CDX1Lfl+pIMdzbhCWbPNymOYONPa6O5QNa60aOogw6asOWOW9axjWNK
 ZMRlCRp3iwAlCfxm39FCGCfZvtsIxrhn49E9OidmLA4MTM0amZGl/dS9fmTIJi9U99PV
 IO6g==
X-Gm-Message-State: AOAM530OSo68mjD+yfzbXvl8HPur5L7MWsM40Gfxqcd2qOszb6V4WSoa
 cgnAsJ0Zcr7Q8Ckenx/19+kJzXwrhokDbVn4IxC9
X-Google-Smtp-Source: ABdhPJyoayprEz4sgeCBquS8FzGm/skWsKU0aymux5jNIzi2RHq9wZfOimxpoCB1V3GQgIMVeyJ/zUcpEmstN3I35+g=
X-Received: by 2002:a05:6602:3283:: with SMTP id
 d3mr17836814ioz.53.1614047504319; 
 Mon, 22 Feb 2021 18:31:44 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUJq4Gfd_YvJz5K2yFwmsSiB3LDM6rSQ2d+O+jV8b0z_wg@mail.gmail.com>
 <mhng-96a8d981-5dff-488d-af25-b3c40815b643@palmerdabbelt-glaptop>
In-Reply-To: <mhng-96a8d981-5dff-488d-af25-b3c40815b643@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 22 Feb 2021 18:31:33 -0800
Message-ID: <CAOnJCUJ-gbyz_Oc_S0xMv2ByAMeWhzxH3aJJFzKtMZBT0-u8VQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add a non-void return for sbi v02 functions
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_213148_064453_9895D408 
X-CRM114-Status: GOOD (  20.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 5:52 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 22 Feb 2021 14:38:28 PST (-0800), atishp@atishpatra.org wrote:
> > On Mon, Feb 22, 2021 at 12:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Wed, Feb 03, 2021 at 09:26:43PM -0800, Atish Patra wrote:
> >> > SBI v0.2 functions can return an error code from SBI implementation.
> >> > We are already processing the SBI error code and coverts it to the Linux
> >> > error code.
> >> >
> >> > Propagate to the error code to the caller as well. As of now, kvm is the
> >> > only user of these error codes.
> >> >
> >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> > ---
> >> ...
> >> >  #else /* CONFIG_RISCV_SBI */
> >> > -static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
> >> > +static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
> >>
> >> Error log:
> >> In file included from arch/riscv/kernel/setup.c:29:
> >> arch/riscv/include/asm/sbi.h: In function 'sbi_remote_fence_i':
> >> arch/riscv/include/asm/sbi.h:150:1: error: no return statement in function returning non-void
> >>
> >
> > Sorry for the oversight. The return statement is missing.
> >
> > @Palmer Dabbelt : Can you fix it in for-next or should I send a v2 ?
>
> I just fixed it up.

Thanks!

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
