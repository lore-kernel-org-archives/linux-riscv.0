Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6AAC5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 22:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U4hBDwzZ9cN1ABZIrL/e3rZMfOXvaecBzd2Ib6BMvTc=; b=BAIBkXBCI2fBoQs083cEZ4MZgh
	qCy6h9jW8ZGg2uVXbJW4dflm62YQoHUhI9HFa2hmRbJp47SyY3vQXhA+FazpgktkczVlfPTahX8hz
	F9ntIbk7sZdsxcPLZaK8vfLFfCX+AklaGp0xBG+lF4vkwKXL3qkRBd5/zNmf82LnJbPqJ3sLBf7mi
	rEmH1MSgE9+1REipgcyOY93P6XKmyYZCKFKVewmcdUO0XU/Dg1CpG00hvi2pCRubZwWW2aOkw1cvJ
	Z9e//j4OmbMKZf/N2ZgvKF+gaOE5JrF7iGnEHtBnSoWaERrIk8DJus5nSvzkGv8LYr8C0XW/h1Jpe
	aUjVJt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfSbI-0000000B9X6-2utS;
	Wed, 28 Feb 2024 22:40:32 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfSbE-0000000B9Vr-40n7
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 22:40:30 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6087ffdac8cso4000217b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 14:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709160027; x=1709764827; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l+UTQgqjeTeuB4joWxs/sUGJ8L/gPUO2H1zeCMeGlUc=;
        b=RTKhRdzD/N2UlNuBkoHSqdSCuB3Ih3ShnfvJ00nCvwhRvQ/F9+nc6dAi9hYFSvl0zR
         YTCZKGzTz8fYx1at6SR14xy5A20wBqhZdry5mkT6/+hDWJ8FGNveiTYxdR3P829QIYMr
         8dfhwKJOyLfncsiUX8IkLUr5/rA+xyh9pFDJZSlAXwozsQH3AGwNaBdnipqUsjVAP+0C
         kA4rv1RYHVh4mlAFsLg5yZKrMzZj4GVe4FN4+y7yXwQ7Twdtf+NupdKTneW90rsNy1As
         fB3BswVXolIrf8P9e2+7HddwZIFcjAicZCj1P4gdoQsx2Jvyg08OEEFwgMjS/uZfKLj3
         Bdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160027; x=1709764827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+UTQgqjeTeuB4joWxs/sUGJ8L/gPUO2H1zeCMeGlUc=;
        b=krobklvqSV7RFmPfjq0JVaaVDLQsaJ9469vkbciSeziMOTPikZvJjdt86ZQd4ktsD2
         yu1eH5pSz2vrzO+0JyStmxNGZXjqE8frGNPZvcKX0WGhH8m21JCdSh7gPiwr9PE6UD6P
         LauuEB54eGcULGypoRgfdzijXOd+WBjE3S9g/0jhkRatkQtnQHkaoNSiJOpksVY6a//4
         xeaY9YOKY8acebO7H2pQXEUTx643Munr/k3Wj3FQSZs3+86YCf7MukqLLoD4opNssIv5
         7kcOwPnFn1q5fH1WD0n6l5oTJSvzfEvO8V1UDdhzSEa53OlhD2JoaCgb4na3NZCum3GW
         UxRg==
X-Forwarded-Encrypted: i=1; AJvYcCVmUaLaqYsM/Des4314JBaj2S8CCSgrzbvLVArVyktpa02CdOFbVKf3QWMCJykJ06Q7g+a0rDzm5Bg7fchofZ5HEDheqSkkr30YBKYjf/ai
X-Gm-Message-State: AOJu0Yyi9eQ0zGoL2lAHjJQKApVvZ+SPwDf2AVKvBwlFvtHDDbvL9t2N
	NagxhFDjXJYDLQdXVh+TP+MeTl4h/LML84NAR7Areyw/DQufdH9bOosG7yTmj6VxKRwZJsSF8V0
	o7A==
X-Google-Smtp-Source: AGHT+IFUPZtJnUkx4ZeqCTT90Ca+tWDsq48kFwktE+9CygIbxZw4LB/eimUqGjDzbeY7BpvlpduVfE/E17k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:abc2:0:b0:dc7:48ce:d17f with SMTP id
 v60-20020a25abc2000000b00dc748ced17fmr140494ybi.10.1709160027352; Wed, 28 Feb
 2024 14:40:27 -0800 (PST)
Date: Wed, 28 Feb 2024 14:40:20 -0800
In-Reply-To: <170900037528.3692126.18029642068469384283.b4-ty@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com> <170900037528.3692126.18029642068469384283.b4-ty@google.com>
Message-ID: <Zd-2VK2kvMr_t1jx@google.com>
Subject: Re: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_144029_054327_4609A138 
X-CRM114-Status: GOOD (  18.45  )
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

On Mon, Feb 26, 2024, Sean Christopherson wrote:
> On Thu, 22 Feb 2024 16:42:47 -0800, Sean Christopherson wrote:
> > Add basic SEV and SEV-ES smoke tests.  Unlike the intra-host migration tests,
> > this one actually runs a small chunk of code in the guest.
> > 
> > Unless anyone strongly objects to the quick and dirty approach I've taken for
> > SEV-ES, I'll get all of this queued for 6.9 soon-ish.
> > 
> > As for _why_ I added the quick-and-dirty SEV-ES testcase, I have a series to
> > cleanup __svm_sev_es_vcpu_run(), and found out that apparently I have a version
> > of OVMF that doesn't quite have to the right <something> for SEV-ES, and so I
> > could even get a "real" VM to reach KVM_RUN.  I assumed (correctly, yay!) that
> > hacking together a selftest would be faster than figuring out what firmware
> > magic I am missing.
> > 
> > [...]
> 
> Applied to kvm-x86 selftests, thanks!
> 
> [01/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
>         https://github.com/kvm-x86/linux/commit/309d1ad7b6ff
> [02/11] KVM: selftests: Make sparsebit structs const where appropriate
>         https://github.com/kvm-x86/linux/commit/6077c3ce4021
> [03/11] KVM: selftests: Add a macro to iterate over a sparsebit range
>         https://github.com/kvm-x86/linux/commit/8811565ff68e
> [04/11] KVM: selftests: Add support for allocating/managing protected guest memory
>         https://github.com/kvm-x86/linux/commit/29e749e8faff
> [05/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
>         https://github.com/kvm-x86/linux/commit/1e3af7cf984a
> [06/11] KVM: selftests: Explicitly ucall pool from shared memory
>         https://github.com/kvm-x86/linux/commit/5ef7196273b6
> [07/11] KVM: selftests: Allow tagging protected memory in guest page tables
>         https://github.com/kvm-x86/linux/commit/a8446cd81de8
> [08/11] KVM: selftests: Add library for creating and interacting with SEV guests
>         https://github.com/kvm-x86/linux/commit/f3ff1e9b2f9c
> [09/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
>         https://github.com/kvm-x86/linux/commit/0837ddb51f9b
> [10/11] KVM: selftests: Add a basic SEV smoke test
>         https://github.com/kvm-x86/linux/commit/5101f1e27683
> [11/11] KVM: selftests: Add a basic SEV-ES smoke test
>         https://github.com/kvm-x86/linux/commit/f3750b0c7f6e

FYI, the hashes changed due to a force push to squash a bug in a different
series.

[1/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
      https://github.com/kvm-x86/linux/commit/126190379c57
[2/11] KVM: selftests: Make sparsebit structs const where appropriate
      https://github.com/kvm-x86/linux/commit/35f50c91c43e
[3/11] KVM: selftests: Add a macro to iterate over a sparsebit range
      https://github.com/kvm-x86/linux/commit/57e19f057758
[4/11] KVM: selftests: Add support for allocating/managing protected guest memory
      https://github.com/kvm-x86/linux/commit/cd8eb2913205
[5/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
      https://github.com/kvm-x86/linux/commit/d210eebb51a2
[6/11] KVM: selftests: Explicitly ucall pool from shared memory
      https://github.com/kvm-x86/linux/commit/31e00dae72fd
[7/11] KVM: selftests: Allow tagging protected memory in guest page tables
      https://github.com/kvm-x86/linux/commit/bf47e87c65be
[8/11] KVM: selftests: Add library for creating and interacting with SEV guests
      https://github.com/kvm-x86/linux/commit/bdceeebcddb8
[9/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
      https://github.com/kvm-x86/linux/commit/8b174eb9d289
[10/11] KVM: selftests: Add a basic SEV smoke test
      https://github.com/kvm-x86/linux/commit/faa0d7027de3
[11/11] KVM: selftests: Add a basic SEV-ES smoke test
      https://github.com/kvm-x86/linux/commit/974ba6f0e595

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
