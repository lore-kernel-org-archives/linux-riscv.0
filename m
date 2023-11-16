Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115A8C54E76
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=M4E2n7fQMTMlg4PJ8O2pHNg74iBp6ggTIiWMKnF67Ps=; b=Aro
	ResI672ehGWyeui73PlIQNgxtIk2yI2Ty1jZED6ZD0/wGnngJEEjE2dS9WObbs+AhhMPt5OS81cY7
	HXlwYkIDEYMM/tVfPXRMyFHLZK9i6AsbnrpZM4yhre/XLJDZLkRhqxPKNb4ur4GbesOx9hfXlITrO
	R9O/Prasgal4JhnShwTqvAlrV0J/qdLWqQYh0npD3FL67gPTHWrlDkN7ijgSPn4Ni6p3k7rK3rVIm
	4piWc2H3LWnSacgKiccFFkU7DrpOkiHHvuq3mSRin6T4nKhxSX+jWXj1PQX9VUwvlB1bZ5AlnP7Cr
	MtFmJpuseMQRJtivsXCpbSrDon0Gpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3jTV-004p4H-07;
	Thu, 16 Nov 2023 21:00:33 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3jTR-004p27-0i
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 21:00:30 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a828bdcfbaso19435507b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Nov 2023 13:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700168424; x=1700773224; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcg1jHOi88FLN7hCqkcZwcR8zkGGhGMDTBufXRqyOok=;
        b=SLW1wcmGWqIQdH9U9eCScf56cMvnnofZTIpU28HI+27qWKjqZFuIYQgx/Jg+YLJ9Th
         UH+x8IED2sq98SxyxRAWZs72DKGpTNXJfSA/aIjg9qjXw+KQZw0dnbEeNF0uQgfWOttv
         qAb+mB1Zk4qlkTf1qe4Vedazc0Z0SRlNvJV5YN2YltGuWOzDt5CqQ7O5+f+zuPz3wBqv
         GVbIa6feXid7Mmu7TFzy2WDFyiAQKPUfCPd3qYsHjMmcmiUgoisHo3mAZDNUap6PHFG6
         0Quqmhu0jq/eCVVTQ0Ij2Orf41qcv+BT384LuSSYhIbtkLmdFq9yvmVGbDKocgX23NvD
         cIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700168424; x=1700773224;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcg1jHOi88FLN7hCqkcZwcR8zkGGhGMDTBufXRqyOok=;
        b=BoRZWfoNXg+V4cXUn4Fz+DZH2D8Iuwlfu1hzbTJuWC3GK8kaY1oi7XOZKDdrvOU884
         k49wHSF5f5iZ2Yg+w43cW6i9jmngFe4yUAwpaLRsbIFAfjKLLl9vrfT6lqPwdFoaPNAM
         sS/NnLNMpFIcmB1gu5DT2bsK8vvTjuhIyzNRtjxMwv/ibYtpwiftR41fKQEf3Y9SoMKD
         oX0lLwHiV0BI67foO8XJdkOAVm10TOjDwFYJx+Ij0LhJgAf3DvWab0GZGuaQwETWHWWr
         soLvVIeTT0RjIlCuNybUg4vn7FzlNfvK4VNxUoWD1bXVWarICpdA5GcmIOlhkO1oVYco
         00TQ==
X-Gm-Message-State: AOJu0Yx4UbckBkpFg037nPQQt/cjMRx7aQV6xzNl/YJuyZf7LiJu8Xj7
	xb337M2CPUr0hivyMWDByHMstLJm7M+FG0pDog==
X-Google-Smtp-Source: AGHT+IERExc4D+qrt27go/xYBPrtoAORZdvfQFtSO07pMqMqSuTLQB8wBOPMZT1riqPUGW5/Jxx9EA2kvlBTv30QyA==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:7644:0:b0:da3:a4ae:1525 with SMTP
 id r65-20020a257644000000b00da3a4ae1525mr393167ybc.5.1700168424573; Thu, 16
 Nov 2023 13:00:24 -0800 (PST)
Date: Thu, 16 Nov 2023 21:00:22 +0000
In-Reply-To: <20231105163040.14904-33-pbonzini@redhat.com> (message from Paolo
 Bonzini on Sun,  5 Nov 2023 17:30:35 +0100)
Mime-Version: 1.0
Message-ID: <diqzfs15o1ll.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH 32/34] KVM: selftests: Add basic selftest for guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, yu.c.zhang@linux.intel.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	qperret@google.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_130029_257468_23686F43 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> <snip>
>
> +static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> +{
> +	size_t page_size = getpagesize();
> +	uint64_t flag;
> +	size_t size;
> +	int fd;
> +
> +	for (size = 1; size < page_size; size++) {
> +		fd = __vm_create_guest_memfd(vm, size, 0);
> +		TEST_ASSERT(fd == -1 && errno == EINVAL,
> +			    "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
> +			    size);
> +	}
> +
> +	for (flag = 1; flag; flag <<= 1) {

Since transparent hugepage support is no longer officially part of this
series, 

> +		uint64_t bit;

this declaration of bit can be removed.

> +
> +		fd = __vm_create_guest_memfd(vm, page_size, flag);
> +		TEST_ASSERT(fd == -1 && errno == EINVAL,
> +			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> +			    flag);
> +

This loop can also be removed,

> +		for_each_set_bit(bit, &valid_flags, 64) {
> +			fd = __vm_create_guest_memfd(vm, page_size, flag | BIT_ULL(bit));
> +			TEST_ASSERT(fd == -1 && errno == EINVAL,
> +				    "guest_memfd() with flags '0x%llx' should fail with EINVAL",
> +				    flag | BIT_ULL(bit));
> +		}

otherwise this won't compile because valid_flags is not declared.

These lines will have to be added back when adding transparent hugepage
support.

> +	}
> +}

Tested-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
