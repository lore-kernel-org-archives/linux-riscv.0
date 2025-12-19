Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE1D74956
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 05:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ja5Tz+23H2BJbaD3glh7XJbtPxXS1BaTjI9PCi9HQZU=; b=cI/PDem39LDciI
	3EQBV+Q19mbuLCRTTo2sElfvt7E8nipLTPsO5hXliW/9TCjCccbC1N/UvCq4DCxVt9JL4Sks+UF1x
	CNpouPUmriW+DtZ56/29xWL3AOeK0rOi73jsjrdVcxbhrXPzGlxFK+YNhqwUaiJZtfuT2E5D+jAM7
	6pdcKJmEwf+FA6YVao73eRbVgVTPzqfPyQy2aBwtJ9ysYm+Qx4+Cfma3ffPDUwo8ontsJh6jlzPgN
	DtkxH8FDPPmBMHUk+GBXTBdMXVX3EUxL/Ty0Cgs2762X597NhtDeKYRUcjuXULt4HF+7B6RTIh2WF
	Odl5iE+lmzyUQLey+PeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTGC-00000009fMW-0QKc;
	Fri, 19 Dec 2025 05:42:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTG9-00000009fLE-1eVR
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 05:42:38 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1344316b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 21:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122955; x=1766727755; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YZTuXKJS0jJ/FjWVkX1S0/dpihzlaBm67evQ8OxNp4=;
        b=mmFAZqjTddcdUk76MtKYW99UCD5iu5lGwIY5AJH9xwDgrvfw7Ahg07w9lVdIQsTN5j
         FzvS1J27QJRWkihqgquPbgvawm164VKYas4YBn6u1d0nnxkRrjIBuXCodsduPNAJP5eN
         hFmhOHevwx4x05sSDnLqp00MastoHSw+aLMkFA0j3edrOmQsQ5qdWYPMRLiz9f21oLli
         +ty0GsG5SdGqeH7o/ZjgLTE0SIvEdIMt0Jk5BHPPpWlHQtAAFr0geLpbH6UFkAhUHuD0
         f79ubmL4V85CZ8RL6MtPoGQCedUv3aWtV4RhGKNOerCUe8yESPdnVph22JetseYhzSqI
         +4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122955; x=1766727755;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YZTuXKJS0jJ/FjWVkX1S0/dpihzlaBm67evQ8OxNp4=;
        b=Xl8ckcOSVjQk9NOYgyfpZtGaV2FXZP8LL0efta32FWd8zgP0S6DQrLaTk1WJOnp/MG
         /6CUYupKbXW7dd+cZCZbiJfhhpZ5RF5E2lX5UJ+I/OkMrMQ3fe1rXRHDzrjMAPgx1eKu
         lKGzyOzQ6foayE4mZUwLQeCyp9szAgrYY95O5SnGiMnudbPBLzxL/Tqs3L+NbI31L7KL
         KisdmS4atM/LkThNlEYrx/ct0Z0Tl0ZSbeKKep2hfR1VBHVy1RQubX5Qq3UiJgbnKdvL
         u0F0LFuV7XTa/v9gbc+hMKn204vZhnDldw7FCgUzD4CuTDz3HdVos37J7jHR2l4iLDk2
         7+kw==
X-Forwarded-Encrypted: i=1; AJvYcCWoTfEWOUdkyV2Vabj3Ot7BzfSlQ+nrNcY1jP4KJRLeIpO61oaOe1N6kT0bI0/u3BHTB1mJf97ANe6M3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRnFFZYNPEyuhDXyc4ryIKWUwJnXPdrmdfHqGs7hq6AqLQn8+I
	7BSrPZuEKz6/EvSd4lpzs0a4CcsizNIx53Y/7IblZK/V72RiV2tmI954hbeolUWfloI=
X-Gm-Gg: AY/fxX7MLFqGsDY33RR6Zc8w7lLJ0Pz6MX+5bibuSz3BcSzqHdaFE2mKKB/GrI+/PwE
	aRbcNmJ/DdFzj80983rJ3qy5Xo4oeYawGy/+SimJmkhC8IyoxhcPH5GxfyvdZw5xBR2bPmy6l+9
	7XFHS+XFPDxBjfkUViJoZ2rqwW75WraSYK6dvBnZBe81gb9YAMTK7LSFQh6XjvVT05rjWqKZeRX
	2fkcfhQxUYtEYcdYS+iPQlegDInH59EjyQGt0RRA0IEwIEY7Fn/0GXvUty9WbkU11HCkYaFMyvO
	QeK5bo+VnzYvqml0flNHdnx+BlFIrfmdyqjJudle2aKLQf+qIhjh++zUext29ZCMREeBYkOwBeU
	a430EPqOP3FWro0fTP4htLqkqLtC/vGVUgsJi94d/RWTCfZMRpgb+kF78UA1oIbVrsV1XR53ENu
	7bx1u4oQ==
X-Google-Smtp-Source: AGHT+IGI8fuFuucCjImuX4l87nELJyNl9OPjlv6P1lULzof6E2V8PchTbygl/w/ZX4miaVw5gIXTMA==
X-Received: by 2002:a05:6a00:414b:b0:7e8:450c:61b6 with SMTP id d2e1a72fcca58-7ff6607cf9emr1880110b3a.38.1766122955457;
        Thu, 18 Dec 2025 21:42:35 -0800 (PST)
Received: from dw-tp ([203.81.243.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm1067558b3a.40.2025.12.18.21.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:42:34 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, David Hildenbrand <david@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-arm64@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
In-Reply-To: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
Date: Fri, 19 Dec 2025 09:45:06 +0530
Message-ID: <875xa3ksz9.ritesh.list@gmail.com>
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_214237_434379_3BFC39B9 
X-CRM114-Status: GOOD (  18.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
>
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
>
> Currently, normal hugepage allocation is guarded by
> hugepages_supported(), but gigantic hugepages are allocated regardless
> of this check. This causes problems on powerpc for fadump (firmware-
> assisted dump).
>
> In the fadump (firmware-assisted dump) scenario, a production kernel
> crash causes the system to boot into a special kernel whose sole
> purpose is to collect the memory dump and reboot. Features such as
> hugepages are not required in this environment and should be
> disabled.
>
> For example, fadump kernel booting with the kernel arguments
> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
> following logs:
>
> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
> HugeTLB support is disabled!
> HugeTLB: huge pages not supported, ignoring associated command-line parameters
> hugetlbfs: disabling because there are no supported hugepage sizes
>
> Even though the logs say that hugetlb support is disabled, gigantic
> hugepages are still getting allocated, which causes the fadump kernel
> to run out of memory during boot.
>
> To fix this, the gigantic hugepage allocation should come under
> hugepages_supported().
>
> To bring gigantic hugepage allocation under hugepages_supported(), two
> approaches were previously proposed:
> [1] Check hugepages_supported() in the generic code before allocating
> gigantic hugepages.
> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
>
> Approach [2] has two minor issues:
> 1. It prints misleading logs about invalid hugepage sizes
> 2. The kernel still processes hugepage kernel arguments unnecessarily
>

And that every other architecture will have to duplicate this in their
arch_hugetlb_valid_size() whenever they face the same problem.

Instead like at other places, hugepages_supported() should also be
checked in the following cmdlines setup functions.

> To control gigantic hugepage allocation, it is proposed to skip
> processing the hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages_support() returns false.
>

Right. Thanks for taking care of it. I guess after this patch [1] moves
hugetlbpage_init_defaultsize() to mmu_early_init_devtree(), it's good to
bring back these checks in the respective cmdline setup functions which
was removed as part of commit [2]

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464

[2]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
