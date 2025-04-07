Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D7C3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teHDXyRAP4WPhQds4dI3ecg7k9M23FQxXjMbl0ILbsc=; b=MDVT2M+JyJa6EG
	0IZtBYWg5m4ppY7KSRs89hSwSMvOmcYhA2lOhZn26E+lczjfphtsr6VLqDuQkvdYsB0kGjSgm4XYA
	tXLv1gVoYHOpEbVx+7elMtNcbes7FBnRmcggNHCgRQPsW/5VfTwHgs6JkaVV0vLD7zoky2DvDOSF0
	xVm+LyiVvF57ZsvYrLdTLfjvNAeqUiL8rmM4TPCYiy2WhdvUekDZdWSOvUyxMHRRkbWiJkFWBE1F/
	JMv1q7MO+sVo4f56AKNVT+rVpSza6RWOAxrSk0grJHccf8YaI9iK3WZg7QESPeQ8qerFP1G8IU13D
	bXuwElqFFZUHLWv3+CYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n2u-00000000dmc-3JJR;
	Mon, 07 Apr 2025 14:01:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mnT-00000000aUS-37cu
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 13:45:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso43900035e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744033554; x=1744638354; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmI/GUCyaMoVDShjSc3OzomwLudeRUjOXZtn/UkzEJ0=;
        b=M4cA5jk7VVKGybAW85zTZHq1xmtPv9rEe+PEd1ZCfQJaO+K2O+Uj6vc3Dh21OF3wqK
         ql/gGQFGRCf8p72XyR0EJg0w1jsnOSjQn5o3WnbLKqspvDTvxLz8e18JhZoNveKabfd3
         y5uLujPJNMnXUauofiNeQ5sg5Hj1RDO4Iu/zNeTMdB9glFg6lk2vQO4wTDc14MMxhxtX
         9itPaXLug7WLujNiXiD57JWVBOtyrD6B272uT60gA4sBikrFv280IkjtvoYLqi322ZrQ
         ghYKEWD5u9XatT1NtNltsrF2Is96uRS9joPv9+Osi4htRrWeed3NBxSwhKF1UNt05olm
         VdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033554; x=1744638354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmI/GUCyaMoVDShjSc3OzomwLudeRUjOXZtn/UkzEJ0=;
        b=tFi8f37v8qSd4pH4Hk3bW/BE5pujaYprtX5hVblUawJazpW1uqKSrlZiwaoC8tzEkr
         2Yj1214GvbsHtDW1FJmOy+URzqyJx1qvXmaIqhz96x8mGuU0VQD5TdwpvByjoCiHb0qf
         JU3wu83GC/sHgTj/BmlyG5N7NNOu/1kTwiA7e0iD16Skch2isMtufRof2Rpko7tGwm4t
         XW6ICSfgddgyyPpcwlbMUjV/IuaWk2fzfH/RxHnMhm6V/mB/LdORi6lqpktOK723K/W8
         9n0mNr0Rb+292lVe9YJwVkc01oKDs50mD8qhsQOiJaxYko03p6rlyIGsSKTzQNkIGwdc
         AtFg==
X-Gm-Message-State: AOJu0YxbAV2LD2pCMX0PFSPw6dWgoquK8qw/k6PxLOXx1YTKbaBosGQz
	HYlRevsO9Tbn9RtRjwG1C0sbkTYHlUgT1UCE2jI5KrnKWR90JW4iCS7UT/bB7Hw=
X-Gm-Gg: ASbGncuXrRuTAt/BCtfwZxR44F4VSdMxJqLrek0Nr9YehYyXz4mrhUwnoZ10p194Ert
	dknL4belQemu0FpFsMQf32qwhvj7btQmw4aR9cNHI5soN2bGgqZOKTzvRh6lnXjSyWjOuYoXflz
	565+oK0wURbzLCvArhlRz50zsTkTo63qehGLpeKYXjcx84e08ARuGURb8UEKlbjW/c9cIPGanW8
	WFIK0p/E7XORpQrxSqiXZ3pE1HJQDSMZkF0H6wvQlVVjqXtv6YfWdOvi38eXhyR92K6hSCC8v9f
	E/yw5csTRpVwPMu25fGuJk+XbJlE4/jw
X-Google-Smtp-Source: AGHT+IEHHsM5wqpNmF0qGu29jIMUNH0eRndhQgivRLY4H5xraCW/gKyTvq3ExPsg6IGAXRyht4DQzQ==
X-Received: by 2002:a05:600c:1d16:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43ed0d98e7cmr100660895e9.22.1744033553925;
        Mon, 07 Apr 2025 06:45:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm134131445e9.33.2025.04.07.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:45:53 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:45:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250407-63092ceb505ad536d8f1394e@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_064555_791870_F207D2C9 
X-CRM114-Status: GOOD (  28.85  )
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

Hi Geert,

On Mon, Apr 07, 2025 at 11:49:59AM +0200, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > Allow skipping scalar and vector unaligned access speed tests. This
> > is useful for testing alternative code paths and to skip the tests in
> > environments where they run too slowly. All CPUs must have the same
> > unaligned access speed.
> >
> > The code movement is because we now need the scalar cpu hotplug
> > callback to always run, so we need to bring it and its supporting
> > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks for your patch, which is now commit aecb09e091dc1433
> ("riscv: Add parameter for skipping access speed tests") in
> v6.15-rc1.
> 
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> 
> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> >         int cpu;
> >
> > -       if (!check_unaligned_access_emulated_all_cpus())
> > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > +           !check_unaligned_access_emulated_all_cpus()) {
> >                 check_unaligned_access_speed_all_cpus();
> > -
> > -       if (!has_vector()) {
> > +       } else {
> > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_scalar_speed_param]);
> >                 for_each_online_cpu(cpu)
> > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > +       }
> > +
> > +       if (!has_vector())
> > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > +
> > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > +       } else {
> > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_vector_speed_param]);
> > +               for_each_online_cpu(cpu)
> > +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> >         }
> 
> On RZ/Five:
> 
>     vector unaligned access speed set to 'unsupported' by command line
> 
> However, this is not set on my command line?
> 
> Apparently this can be set using three different methods:
>   1. It is the default value in the declaration of vector_misaligned_access,
>   2. From the handle_vector_misaligned_load() exception handler,
>   3. From the command line.
> Hence the current kernel message is rather confusing...

Thanks for the report.

The three ways above are OK, since (1) sets it to 'unknown' which means
"not yet set" (by command line or otherwise), (2) doesn't actually touch
unaligned_vector_speed_param, just its per-cpu counterpart. And the
message applies to (3). However, there's a (4) which I added without
considering the message and that's the 'if (!has_vector())' part of the
hunk above, which sets 'unsupported', as you're seeing, when vector is
not present.

I'll send a patch that ensures we only get the message for truly command
line set states.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
