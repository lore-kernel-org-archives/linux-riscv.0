Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F6EEE4992
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EPjxNyW4bduKlAVNVrsGSTymkUrL5OIKl0FRmz7AAhg=; b=thaiqgpO2jbOBVuJofS2LkG8oS
	cfzobKNOaNW9UD01fLI23k2HmLbpTY/5xhufr0M6K5TQJr6/XsJ8twE3twzkGOc7pPcJnUh0UZS62
	d9QrzHdEbyzLi5LU0UaYXKzDHTLRXPYCRIZKPSEXt3tqy5S+JeA7K30cOx1YQlIlQ1/GWAXcWFPuI
	aDxjaZJOLCQfZDPIlPH/Iu7bfTYkJDCaTyejCmTQ6wDJszF4MeGfXwPwx99WZFNrq+3vsQezWx4HW
	4k2AD+31a3Pp4PA2xNKlFIMvzv+FdvVdHmrJ2xN15nJ78vXs7SB4nRtPWCVwyGhFNLyqAqbBaq3ma
	jgzo1/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX8TJ-00A8Jt-09;
	Fri, 18 Aug 2023 23:01:37 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX8TF-00A8IZ-1f
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 23:01:34 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d67a458ff66so1779899276.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 16:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692399688; x=1693004488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=usNReEG1yhZ2OoI1bkcsHZxi8vJT2uNEbLMV9P1BADc=;
        b=gS9arkhq2BQM5wyG90faWG4pywmMu5sfjHEWd04bKy84agcqatheT6YSVqsnMAhJXs
         7Ey6R/IsFpbuJAgflRTfCsGQSeE7z8aCnsHRbxEkKBK/PAH7FMZgZEavx3BeBXM+3P+2
         Plq9VhZaRy5PbOx8EDNA03ytcClkYRB9Plt+OD+UltS53ZO5IOuVPHa/Yt8AOkDtjpGf
         J0ReekJEPtY7ifZaoOCUWVj24ZOCPfNYabKI/jnVy+VGWVTelTn6BvdxHdiQrBc+k/kc
         BoETN+5H+qyvqSzJ4nWEMxKRREF2ybV9p6gaBfB8lx1V/iAPfjWa3WjZDIbTKQp0bm0Z
         IJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692399688; x=1693004488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usNReEG1yhZ2OoI1bkcsHZxi8vJT2uNEbLMV9P1BADc=;
        b=CiZYVUC5ylx9gx70EVlbOkYE7TqtbjrkQogmGIhMXKeAIgu1hHo8e8OF7jukSv+ixI
         XHPihyXLw8Q0uslTI67UY2IB3xX7S8sm8yXhBENOsirKlzejSc+j74+o0RRI++XZD+Mn
         UNgAAKlRVDOT3mDgueDRO10xvDuJNCBOYwKQ07CuBpXYTlGhMlMarxZ67b7rTSGNvDHM
         TjLo7i2ELS4Pa5zl0YhAQRn2iNuUYAjRhG/OQrpOkm5FoiPhygTV8mCGn7ZA6Pg1rrof
         V3mlS8h1kTN3kLlt+PZswub3apYtcx6qlQ5875GVKPd/I9FmmXpypoK3EOX1VwyxNjsN
         MlvA==
X-Gm-Message-State: AOJu0YzL+HXOJV7FBaTapqsJjccg6fcvUM47iUTTeVu70TRQ0XzAY1YY
	ALA52c2kOYeMyMvUu53927Oyf6AehRA=
X-Google-Smtp-Source: AGHT+IHoaUgHi5iMS/0Xt5cvUarFzMCVBDWHJfa8lAvVIAai8wyXyMLBOgyLMJxxiXlZfzlnoz9PoDeIZVI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:a8a:b0:d74:347:1e3 with SMTP id
 cd10-20020a0569020a8a00b00d74034701e3mr5755ybb.9.1692399688376; Fri, 18 Aug
 2023 16:01:28 -0700 (PDT)
Date: Fri, 18 Aug 2023 16:01:26 -0700
In-Reply-To: <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <20230718234512.1690985-29-seanjc@google.com> <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZN/4RjDsBLf0FB98@google.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	willy@infradead.org, akpm@linux-foundation.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_160133_555843_D5554835 
X-CRM114-Status: GOOD (  21.80  )
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

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Add a selftest to verify the basic functionality of guest_memfd():
> >
> > <snip>
> 
> Here's one more test:

First off, thank you!  I greatly appreciate all the selftests work you (and
others!) have been doing.

For v2, can you please post a standalone patch?  My workflow barfs on unrelated,
inlined patches.  I'm guessing I can get b4 to play nice, but it's easier to just
yell at people :-)

> >From 72dc6836f01bdd613d64d4c6a4f2af8f2b777ba2 Mon Sep 17 00:00:00 2001
> From: Ackerley Tng <ackerleytng@google.com>
> Date: Tue, 1 Aug 2023 18:02:50 +0000
> Subject: [PATCH] KVM: selftests: Add tests - invalid inputs for
>  KVM_CREATE_GUEST_MEMFD
> 
> Test that invalid inputs for KVM_CREATE_GUEST_MEMFD, such as
> non-page-aligned page size and invalid flags, are rejected by the
> KVM_CREATE_GUEST_MEMFD with EINVAL
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  tools/testing/selftests/kvm/guest_memfd_test.c  | 17 +++++++++++++++++
>  .../selftests/kvm/include/kvm_util_base.h       | 11 +++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index eb93c608a7e0..ad20f11b2d2c 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -90,6 +90,21 @@ static void test_fallocate(int fd, size_t page_size, size_t total_size)
>  	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
>  }
>  
> +static void test_create_guest_memfd_invalid(struct kvm_vm *vm, size_t page_size)
> +{
> +	int fd;
> +
> +	/* Non-page-aligned page_size */

Instead of adding a comment, use the message from TEST_ASSERT() to communicate
that information to the reader *and* to anyone that encounters failures.

> +	fd = __vm_create_guest_memfd(vm, 1, 0);

ioctls() are fast.  Rather than hardcode one value, iterate over a range of
values, e.g.

	for (size = 0; size < page_size; size++) {
		r = __vm_create_guest_memfd(vm, size, 0);
		TEST_ASSERT(r && errno == EINVAL,
			    "Informative error message...);
	}
		
> +	ASSERT_EQ(errno, EINVAL);
> +
> +	/* Invalid flags */
> +	fd = __vm_create_guest_memfd(vm, page_size, 99);
> +	ASSERT_EQ(fd, -1);
> +	ASSERT_EQ(errno, EINVAL);

And then same thing here.  Then you can use the legal flags to determine what is
and isn't valid, instead of using a completely arbitrary magic number.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
