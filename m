Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603ACCA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UzsIprbX/Q6B9osEUVkKkLRE58UtXYAZciE9rzs1jnw=; b=ksh8m3YbdKyNcOreqnRrHjFAEN
	W2ZA6/8pHnFLsXNjgYh8IXZ30+VO24rourvDJrZa1t0TU1A23nPN/pMcgdZSy5eqyiqMOe2S/9y5q
	pfZOHGosYY2q5i8i7N35+wjEIeGO4UTgaR2PHuO8MHVG6GOL9e7DJhekLUgqLo8ZP3PXUDZvmGZyx
	vGpW20QhgdwP+JQOMeUv+OI0Iy5H/01lot+uLkj6YgrL+tUL1LkyyWuw37oil6t952XGinAHIDA1D
	erOBk2Fma99yTl0YQ9hK52LBW+RA95jdC61i87QAaMlH3zNhtaofqDLSNeQzDqfJdUkO2voUmexXw
	eI1lpcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6Rw-0007He-1p;
	Fri, 01 Sep 2023 15:52:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6Rt-0007GU-1h
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 15:52:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso1793299b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 08:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693583558; x=1694188358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqD6F9hQEjrLwITu6O6UtLx0oEpIDMvFu3M5X8+XSwI=;
        b=YqqPaLZ+wu0Lqs13S+LIeSK4G6GkLeLei0D+Xs7AXC9JXKILiJTdTbEcCCaktRvpHu
         6QfOYPlK8VfR8lu7U0u+uyzz4p3bJFc7GRDLdjsavZcy/Smt4f+xhptW4o5LKvztTYRA
         6+cD+UGKdCNHK2G3sCOaY/IssBCqVNqoyQz3m6zePMmQ3iygYIsDAEtDI3GLjm4Sn+aX
         g28flEpR1mR3tV+Sj4PbiPR7yh/r22592VdKVPpvpF+BV79PdmXbEUc8nuLZdxKqxS0l
         pmib9O9uw0Y6iKPuWZeBpoaenhRJJ3zs/g4gOUjezCglmfwCJOalaaMs5nYYtKnVBy+B
         LoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693583558; x=1694188358;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqD6F9hQEjrLwITu6O6UtLx0oEpIDMvFu3M5X8+XSwI=;
        b=LzvOgP0jN1julVsX/Nv60ovOPk1SiDQbJ0HAMbllGD2IMhtN+qnDFNa9RrL4RrT7am
         uy+sVUuGcviowrvaIqJhRf1gdBVTBGRR3HLTZvWx1JBJ3h9mUf2zEgZ1Chkb3scCkXQe
         soQVEtZnNW87Z2fLxBOAC+S9cjvnOPfpnmCpGOfqQKBILZyXnbExrFK7Fv9AJmKN6I4i
         H4cxB3JSRHWAJidSDJLcTPr6sbVH473/XrbpmavXIEg64CBEjBZ2I5QjBG0R9hNAgikg
         VtFkPJAlDZ9SHDmlljMHn7c2YKmJcz2DM0oxLxGaRJ4xZxrFBueAZ0HVc3GVFAtmobMV
         SMxQ==
X-Gm-Message-State: AOJu0Ywtpl1BasWpzmeQHZ3hxGkl2QzLGM6X4n0dPCN3VTBB+u5tvEKO
	br4M2rLbOKqMsZ1rsUpG7bduZBM0NoxJj16cBuk=
X-Google-Smtp-Source: AGHT+IEsJwd67wWu6obKIBkuyj8i6oFcNlHwVk6w5MP+PXzFL1qJikZmxVhuHEXPdkkBiS9v+qBf3A==
X-Received: by 2002:a05:6a20:1612:b0:13f:5a05:6038 with SMTP id l18-20020a056a20161200b0013f5a056038mr3331551pzj.58.1693583558012;
        Fri, 01 Sep 2023 08:52:38 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q19-20020a62ae13000000b0068a49aad7d4sm3123612pff.79.2023.09.01.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 08:52:37 -0700 (PDT)
Date: Fri, 01 Sep 2023 08:52:37 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Sep 2023 08:52:35 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 1
In-Reply-To: <CAHk-=wj3iBTT5mcYvaUH+fX7Y+z=JUbx6O5nvNMkpe2k8Hcokw@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-2dd1e80e-1a99-4cf2-82cd-3a880957e16d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_085241_567390_0B2A90A8 
X-CRM114-Status: GOOD (  26.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 01 Sep 2023 08:21:35 PDT (-0700), Linus Torvalds wrote:
> On Fri, 1 Sept 2023 at 07:41, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> for the other the result I ended up with was
>>
>> extern pgd_t early_pg_dir[PTRS_PER_PGD];
>> static pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>> static p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
>> static pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;
>
> That's wrong, you should have removed the 'early_pg_dir' declaration
> that is now in <asm/pgtable.h>, as done by commit d2402048bc8a
> ("riscv: mm: fix 2 instances of -Wmissing-variable-declarations").

Thanks, Nick had pointed that out too but looks like I missed it.

>> though that's not showing up in the git diff, so I may have something odd going
>> on here.
>
> So what's going on is that you resolved the merge conflict by taking
> everything from one side (not correct, as above), and then git no
> longer considers it a conflict after-the-fact.
>
> Side n ote in case you care about the actual git logic:

Ya, I'm always interested to hear -- as I'm sure you can tell it's still 
a bit of a mystery on my end, but I'd rather learn when I get lost than 
just keep being lost ;)

> The git rules for merge conflicts are different when doing the merge
> and when showing the result after doing a merge.
>
> When doing the merge, git will do the expensive history calculations
> to figure out the merge base and do a 3-way merge of the base and the
> two sides.
>
> So at merge time, git looks back in the history from the two merge
> heads, and does the three-way diff based on the history leading up to
> the two points.
>
> But after the merge, "git show" will basically do the reverse: it
> won't look back in the history, but look at the *result* of the merge.
> You are, after all, asking it to show the merge itself.
>
> So then it will again do a three-way diff, but not of the merge base,
> but of the merge _result_ and the two sides.
>
> And if the merge result is the same as one of the sides, there's no
> conflict remaining, and so no three-way diff.
>
> So that's how conflicts sometimes "disappear" after the merge.

OK, that explains why I get such different results between the pre and 
post merge output -- my workflow involves commiting a merge and then 
pushing it up to the test builders, so I guess I should just be 
double-checking the pre-merge rather than trying to figure things out 
after the fact from just looking at the merge.

>                        Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
