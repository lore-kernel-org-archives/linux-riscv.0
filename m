Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02ADCA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsxcHfCDekViIHeAGFthRL9/XSI63dc4WtLewEPqeog=; b=gmuPq8VLG0F1/6
	g1J5hchRcJsf+SrfEr8ebelB6oi05tSoV2UZfBFAe8YkWecRSnH5wd0mMMqFSaKcV3GYL7zONRviY
	B9yIbbOUTSxwX1T4jI8q4F6FQRqFjRjp4ME3a3Z2seZGwXOZ1CgUceda+ZzM8oSiVzghb6XOWdgSk
	ir/ooi8t0d9mJceP3FYBy/Ck89e0iiaOIiEdABHeCVrQb+KSldxXRQXEYVAkiGRmfhHGVvIcsWSzE
	/X6o7cIyQTspsRga+Dm0ercRqGBXBqtOFhUB8GTl6gihgbY1gAMz1nqdVJpl4CkXfasZtRAIOz+kn
	M5FsDiTNr5S8lV0uUaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5yG-0005WV-0e;
	Fri, 01 Sep 2023 15:22:04 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5yD-0005WB-05
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 15:22:02 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ff8cf11b90so3867807e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693581714; x=1694186514; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7A6PoNg2bWKzcv8thpGHMroeJ8aq0Z0HWATQwNtHOIw=;
        b=UEPE+/6SQADsWHSWbRLOINtLvmLUxD9Qhg5QQGTchmhzDjkTlikCQe4dOhA/1n2oTL
         ZLB4ermiV4GJy7Y9sHzIUhsf9FNXV24AvheItlI53uAx3Rs/LORf0BEh/XhbOfB8xscE
         YTWcQ2qi5DwS4SMDh/ixLkWDgBsPw/l716lCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693581714; x=1694186514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A6PoNg2bWKzcv8thpGHMroeJ8aq0Z0HWATQwNtHOIw=;
        b=juRTj1oUqVq2t1SGAhcJaa+x0rb0Yrldj77AdxOZ44TdfBW5TZPanL3xvN2VXxC88b
         Vhp8xVYcqc7enM0sIrJaQjRhk5HjtMTJhS5IXLa9lfyMIa86ZKIlXJXWxEzagUlnf6st
         LFGnjFLKSsUU7V0h+7yqzjIr5V84jBIeShkiK6sjLhyXScfHTd7rVHfzCJObRj1HQdLH
         Fq/ZMmMsG1QGxxezX26joEJeTm3cUgZUBKsB0btBPQh7zYg1A2bPBHFYkkVpABQ4IMZF
         Gwgfk2vGPQRUKb+vQBx94xxpwN48/bOWzfHee+oXfoi7sJ5LsLADMIhmzUN0rYhAzcYW
         flWA==
X-Gm-Message-State: AOJu0Yza+PXM3DDwk+pvt9Bcan2lQuqZgyPEX3xu44oNH85WrDtYDran
	i983G3UR9i91deYXuT+fXYPgaSBBpKXcbWHKdHlaH64C
X-Google-Smtp-Source: AGHT+IHlTj9h9dRn2mFa88D7+8qkBvLOr2+AlPeV+DvHAQH8BKlRhXSM00p5N4OJToIP6twoDgThIA==
X-Received: by 2002:ac2:482d:0:b0:500:a2d3:3e65 with SMTP id 13-20020ac2482d000000b00500a2d33e65mr1856973lft.23.1693581714584;
        Fri, 01 Sep 2023 08:21:54 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id i21-20020ac25235000000b00500921a0ad6sm669982lfl.98.2023.09.01.08.21.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 08:21:54 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so34838931fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 08:21:53 -0700 (PDT)
X-Received: by 2002:a2e:a162:0:b0:2bc:be3c:9080 with SMTP id
 u2-20020a2ea162000000b002bcbe3c9080mr2078264ljl.27.1693581713434; Fri, 01 Sep
 2023 08:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
In-Reply-To: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 1 Sep 2023 08:21:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3iBTT5mcYvaUH+fX7Y+z=JUbx6O5nvNMkpe2k8Hcokw@mail.gmail.com>
Message-ID: <CAHk-=wj3iBTT5mcYvaUH+fX7Y+z=JUbx6O5nvNMkpe2k8Hcokw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_082201_479096_F6A686E2 
X-CRM114-Status: GOOD (  16.86  )
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

On Fri, 1 Sept 2023 at 07:41, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> for the other the result I ended up with was
>
> extern pgd_t early_pg_dir[PTRS_PER_PGD];
> static pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> static p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
> static pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;

That's wrong, you should have removed the 'early_pg_dir' declaration
that is now in <asm/pgtable.h>, as done by commit d2402048bc8a
("riscv: mm: fix 2 instances of -Wmissing-variable-declarations").

> though that's not showing up in the git diff, so I may have something odd going
> on here.

So what's going on is that you resolved the merge conflict by taking
everything from one side (not correct, as above), and then git no
longer considers it a conflict after-the-fact.

Side n ote in case you care about the actual git logic:

The git rules for merge conflicts are different when doing the merge
and when showing the result after doing a merge.

When doing the merge, git will do the expensive history calculations
to figure out the merge base and do a 3-way merge of the base and the
two sides.

So at merge time, git looks back in the history from the two merge
heads, and does the three-way diff based on the history leading up to
the two points.

But after the merge, "git show" will basically do the reverse: it
won't look back in the history, but look at the *result* of the merge.
You are, after all, asking it to show the merge itself.

So then it will again do a three-way diff, but not of the merge base,
but of the merge _result_ and the two sides.

And if the merge result is the same as one of the sides, there's no
conflict remaining, and so no three-way diff.

So that's how conflicts sometimes "disappear" after the merge.

                       Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
