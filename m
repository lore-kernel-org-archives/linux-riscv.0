Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0DDC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6zEaYjmEwZWSkrCTsKxuI688IVIaYBpA45hQl7kmKk=; b=WN1oEVvkIHQBgE
	FuhMuxGwuuY+tlix5r7vhXE7mWGyf09JpFLS2HuNLc4Ijs+KRgxs39ukirCmuhdKvm2xNgfD0j2Bj
	z2WFph9w5oqV6aAM5395+IhfDbyHCDtwrpGlCQ8v1Dl4pMrFCEu9cs9+rggKHbHKvolVkDQA3gI6t
	TrjwMUNMz6JCOhEERVCxQ7+biVPvyv0hh/pYdmlA21vTQKtExjvL9SyvkACPoKO06SyCYDDwQEuy+
	2Xkok0xrfBrUaMXYY/11kq2+GA8DIu8BF64gieqtK9kH6Nii3Xas+JaSfFtPflTGZH5ouOqbuqA9h
	zio+o4PeZErYC2sE5HvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1OB-00EgM6-2o;
	Thu, 26 Oct 2023 14:31:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1O8-00EgK4-1g
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:31:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c77449a6daso7886685ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698330665; x=1698935465; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cyPzF6zImIluItqkN237S1HDHY3vs2wBArSwbVc/hzA=;
        b=qKNqcQDAfn0V+VYOvX4YCmFzzMv2ueXEga2GHqQKCqMLxSwBVJ2uRVhMxn+Ui8yNRO
         6ra0oSNg9DVtRhc7X4JKWGJyRe2q45ZV85VI8Jtjr9lASVTY9ujnLvk1MjO5w+P+GXlL
         4HSFt8mgLakxHXSTfTDESX8dz0ygox+3r0+QtjsDUs0TuCgxsqVhQKcQlANXfntKgQGH
         i/8+9UzfWK5Qt6rG0muBjigYmgF27uQjmZAduINDQ2fqwaMp9ctceoNh1DmW16Rdnqtv
         UXvrVxr87b81Edea8n8hnIjFdCrjBtD1c5e8+YMgd/FWtBvmTPuunOHrUaC79/MN/ueq
         x8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330665; x=1698935465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyPzF6zImIluItqkN237S1HDHY3vs2wBArSwbVc/hzA=;
        b=qybAKrD7HLm2ojEiHhSx9RDZxUQF9IZcZaGqfhj2vvx6zLbManQw8WJA79lvR6nsUP
         UdUyLItOSUppTeIEsnO4Qf4/HNwlDnebcLtFESq3I0aAFnlM3rxivXtLWR+b2kL/uASA
         V4W5uRVAjeNvGdv0bvAbCHsmMkQxpTuskY2+f8iNSTGhVP9FQfWUdnpN/hpQ48Brhxpf
         m7UofGtWxYdK4TRRXcF2Et7Ug1VSj68c8y1nWJ9rMcNiy0prXY6fRq+pWdz/ytBXMsuS
         k/gVcvaOt/8rPtoaBVlmgQxuxCSotMx1US6sWjQUEjj2UEY/1iMpqadNhfTlw6raUJQq
         b8Qw==
X-Gm-Message-State: AOJu0YxaRkPTSJM+fAvwpg9vQPW8LsJWnyQsPczFJ8iE84pv47qdF+WI
	8S49o53ODZIGNbbmVtFk5QNByU1m80We+bI6SHUSFQ==
X-Google-Smtp-Source: AGHT+IEPrFg7ph9PvUTjEjTWPycx9rIXgHGj8Pm/PdzOH55g1dDMU1zMVGUh7AImWIiMYHZ2g2wRbWAImZmI9AfkT3Q=
X-Received: by 2002:a17:90a:1c8:b0:27d:6dd:fb7d with SMTP id
 8-20020a17090a01c800b0027d06ddfb7dmr19390459pjd.17.1698330665193; Thu, 26 Oct
 2023 07:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-7-vincent.guittot@linaro.org> <ZTbebQrK3K+JwWxR@arm.com>
 <CAKfTPtA0KBE8TFifOEXddF9d_wqDjb4QUvgK8c0DTtyLrX0atA@mail.gmail.com> <c000f7a3-caeb-4d75-8c88-40ed02950ec1@arm.com>
In-Reply-To: <c000f7a3-caeb-4d75-8c88-40ed02950ec1@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Oct 2023 16:30:53 +0200
Message-ID: <CAKfTPtC7vtCKXG4y+7TwtjRJKkzjhPQ1Wb61OXihTDPaetGeWg@mail.gmail.com>
Subject: Re: [RFC v3 6/6] arm64/amu: use capacity_ref_freq to set AMU ratio
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ionela Voinescu <ionela.voinescu@arm.com>, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, sudeep.holla@arm.com, gregkh@linuxfoundation.org, 
	rafael@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073108_557948_57C94149 
X-CRM114-Status: GOOD (  16.42  )
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

On Thu, 26 Oct 2023 at 13:19, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 24/10/2023 11:58, Vincent Guittot wrote:
> > On Mon, 23 Oct 2023 at 22:58, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
> >>
> >> Hi,
> >>
> >> On Wednesday 18 Oct 2023 at 18:25:40 (+0200), Vincent Guittot wrote:
> >>> Use the new capacity_ref_freq to set the ratio that is used by AMU for
> >>> computing the arch_scale_freq_capacity().
> >>> This helps to keep everything aligned using the same reference for
> >>> computing CPUs capacity.
> >>>
> >>> The default value of the ratio ensures that arch_scale_freq_capacity()
> >>> returns max capacity until it is set to its correct value with the
> >>> cpu capacity and capacity_ref_freq.
>
> Nitpick: Could you mention that arch_max_freq_scale is the default value
> for this ratio? Took me a while to recreate the (not so simple) story
> for this change, i.e. make the connection between ratio and
> arch_max_freq_scale.

something like :
"
The default value of the ratio (saved in per_cpu(arch_max_freq_scale)
ensures that arch_scale_freq_capacity() returns max capacity until it
is set to its correct value with the cpu capacity and
capacity_ref_freq.
"

Or I can rename the variable per_cpu(arch_max_freq_ratio)

>
> init_cpu_capacity_callback()
>
>   freq_inv_set_max_ratio()
>
>     u64 ratio
>     ...
>     per_cpu(arch_max_freq_scale, cpu) = (unsigned long)ratio
>             ^^^^^^^^^^^^^^^^^^^
>
>
> static struct scale_freq_data amu_sfd = {
>         .set_freq_scale = amu_scale_freq_tick,
> }
>
> #define arch_scale_freq_tick topology_scale_freq_tick
>
> topology_scale_freq_tick()
>
>   sfd->set_freq_scale()
>
>
> amu_scale_freq_tick()
>
>   ...
>   scale *= this_cpu_read(arch_max_freq_scale)
>                          ^^^^^^^^^^^^^^^^^^^
>   ...
>   this_cpu_write(arch_freq_scale, (unsigned long)scale);
>
>
> #define arch_scale_freq_capacity topology_get_freq_scale
>
> topology_get_freq_scale(cpu)
>
>   return per_cpu(arch_freq_scale, cpu)
>
> [...]
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
