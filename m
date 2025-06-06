Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F3AC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Arer2DzUG9o5O0pZoKfWOC8ONws/+23s3+g2mqFiaUE=; b=lL5yaTS5xYLeYS
	9o2ONx8wIHqoYbOseL2uT9i9NIiyr6OCRPNty7s75dGB4iMGOA/9oDoNgoJCPiiKLeUnJcyEa3CjX
	4NmTRoJilPfSWcfTb/2Jn5zOz3bdp4K97ECTQBPYbvDFJu0ICiEKYn2GHAiA4tonaUq1sxM+0Kit5
	Nh+aRzQG2cC/fIwbQ3AcaBV+ANKf94dfwXLzKrTa1jaQYLs+sue80er+8bNdk4MEZtvUB/ZFZASzL
	GZFod8h8pWGfDamgXUcSBuB+P9WrPdXSDREiTR2oIM975GR3WqPD+QTWSbFfYcQAiyp0eg4ZPVsES
	Q+KXdDCNgybInaocNQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWIT-00000000Fac-3zh0;
	Fri, 06 Jun 2025 12:35:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNW5r-00000000EMQ-3DDG
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 12:22:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-234c5b57557so19364015ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749212563; x=1749817363; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hodid4w2gmFrJNuhZc9vz1DEXrU13yfXddh2b5aGmtA=;
        b=gNzBwFrroiCbYAO3xKb46RlV4C5MH9FCjLWjOj9PEhsL5fg+BjlKci36S1975DBMJp
         NN/zotzYbsQ/1UcuW8utLkyAKgAqx8YNY/t43CubenrNmVphhHViFFcIJ187G3Sr+LjK
         GLlQ6kRXe4PMeHyKxqF16qFsST0maCfWb5H/7sOJkmoxrFYZc0/2U7OcBD42Pyfg9T2g
         kls7WiR8ZB27VfrsjQ+4zhktE9fdlA1viwCUPVqsrOy+6bpd8oUBrl2EuYEiyJGufZBB
         kaejygWu2KCuGctU+dfWc77XyRtS0evgJCHaNyRY699BK9bHaC5aZuIVSFy+7rKhyUAe
         pjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212563; x=1749817363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hodid4w2gmFrJNuhZc9vz1DEXrU13yfXddh2b5aGmtA=;
        b=kEL6xl6DWwKYp+vBunmaghcVRlP2BB6keklJRLoUgiI82krwLKkku9mRYrLLV/EESM
         c+m3IJ8rKG8U9t6zqkxTT8cWbGb7qmFrbXWrbIC2K+H8lRglx3gmySfluWqfLChg6sxG
         DV7/H20gfRxG6Iq6lNSbY3OEALnyoql5BBKIpB24sUE2Kox+pSt7Ks+yXSESOvCG6kuE
         v8qaNtRW3j4cQF2Tf/DAVIJoS3pvECgM3QOg/72vru3DqdQMBRb7piIKXSjfPQqGiBkm
         wlW+k5y88Y8P6xi0g9pvrcXuPPbZ0S4WbzfniEPXstRL3mtS0+Y07+XDI0o5T98RBIHr
         bGxA==
X-Forwarded-Encrypted: i=1; AJvYcCVfKhXVywBAotn1uWB8qp7xAp0nhp5jfcKrYnLzdegXnIXoQIivwv7siwC6TQmbOHMINJs1s+oySgDXSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxRNhZaZ1245O+EG5bfHs/sluzxGZV/oDDXiZMbimKDScs7N+B
	bD02RypZTI+AJL0T1zJnIwFt0gEjwXsYe3FHN34VQy6YOr/pVu5BkDJve3RgvOdROjhhWLT8sCb
	SxJCNZYL/i10HNGITuTqmVp5a9gQGt8oZWSkK7Y+o
X-Gm-Gg: ASbGnctcYDGfNK9GVpu+dgFD5MSyNU2rbKoaqhik6QNIDucX5ZzZserVB2owIIrR/7s
	CkXi/x7aoZVd2FuE39nlSKkrPaPJAvOHTk7mV4V83F7IojWqSWEi9N69IoH+50NeQPZgDcLn9yR
	W0rM+vYjEab+gUNh1xRA0K/CmaF0whbm8qJ7CrEynmB2OtVEqGvuY6rgyQJyG92oMgFHzsgDtZs
	mo=
X-Google-Smtp-Source: AGHT+IFi0EKFGTowXt4/DuhvDcQXeSHMVj5m91EhDVzbHGrEwbsisVeaU+wjXDmEMgl3NgMb/jxB5m3Gez5Y5Qh44t4=
X-Received: by 2002:a17:902:ce0f:b0:235:2403:77c7 with SMTP id
 d9443c01a7336-23601d81928mr47556645ad.37.1749212562789; Fri, 06 Jun 2025
 05:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <b223bb35-9d4f-40e7-b1c7-834541c89713@ghiti.fr>
 <CANp29Y5OEhNq_Rbe2cJpM3s99GrSzObzKX=+f7mruehff3rWpw@mail.gmail.com>
 <CAG_fn=VAofHnBWxdFxo_oxD+NJK9uSt1pzbs2Oie7_gMOfx-_Q@mail.gmail.com>
 <fd9f9a4f-a60e-4a72-a709-97d9f66361f4@ghiti.fr> <CANpmjNOSQRPdwW+mP2m0c-Ua4MTv8+j3crNvQji68rsReC7HUQ@mail.gmail.com>
 <740e7a0b-9d0c-4a09-8fd9-fb757dc6fdcc@ghiti.fr>
In-Reply-To: <740e7a0b-9d0c-4a09-8fd9-fb757dc6fdcc@ghiti.fr>
From: Marco Elver <elver@google.com>
Date: Fri, 6 Jun 2025 14:22:05 +0200
X-Gm-Features: AX0GCFuGZrd6Oxo-NsFILtP-F50R2ze5i27FEJTW_k7NtM9IRg-NJOi6h62vZSI
Message-ID: <CANpmjNMY_Ax4o8RD=iNUJPZd0W2oosvPp4rbgPv1BZe8fAnfeA@mail.gmail.com>
Subject: Re: riscv failures
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexander Potapenko <glider@google.com>, syzkaller <syzkaller@googlegroups.com>, 
	Aleksandr Nogikh <nogikh@google.com>, Taras Madan <tarasmadan@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_052243_820814_AB7A2474 
X-CRM114-Status: GOOD (  23.09  )
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

On Fri, 6 Jun 2025 at 13:43, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Marco,
>
> On 6/5/25 10:49, Marco Elver wrote:
> > On Wed, 4 Jun 2025 at 13:03, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >> Hi Alexander,
> >>
> >> On 6/4/25 10:35, Alexander Potapenko wrote:
> >>> Hi Alexandre,
> >>>
> >>> We switched the ci-qemu2-riscv64 instance to
> >>> "git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> >>> for-next", because the "fixes" branch was quite stale and didn't
> >>> contain the latest fixes.
> >>>
> >>> However right now syzkaller is failing to SSH into the instance
> >>> because of some boot-time problems (see below).
> >>> Do you know what could be causing this?
> >>
> >> Yes, we need both commit dd133162c9cf ("ACPI: platform_profile: Avoid
> >> initializing on non-ACPI platforms") merged in 6.16 and commit
> >> 07c9214c790e ("mm/cma: make detection of highmem_start more robust")
> >> merged in late 6.15.
> >>
> >> Can you consider using my fixes branch instead? It will be updated more
> >> frequently. My branch is
> >> https://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux.git/log/?h=alex-fixes.
> > We can only pick one for riscv, and can't keep switching the tree.
> > The canonical subsystem tree per MAINTAINERS is:
> > git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> > We thought that for-next should not be continuously broken because it
> > also receives -next exposure.
>
>
> Sorry about this situation, unfortunately it's out of my control,
> hopefully that will change some time soon, but for now I'm only a "R:"
> in MAINTAINERS...

What's the defacto state of the main RISCV tree? Is it broken,
unmaintained, abandoned?

> > So the main question would be: what is the most useful tree to fuzz
> > for riscv? If you declare that your fixes branch is the latest
> > up-to-date riscv branch that will be maintained and updated
> > indefinitely, we can switch (however, it would have been good to see
> > such a branch in the riscv/linux.git repo). Either way, the choice is
> > yours.
>
>
> I can guarantee that my branch will be uptodate, no worries about that
> so if you can switch, it would be nice.
>
> Sorry about for this mess and thanks,

Understood - but I'd like to understand why it's not possible to
update for-next (which would also benefit -next) with the necessary
patches that would unbreak syzbot RISCV fuzzing. This is the normal
process - is the process broken, or are the patches still under
review?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
