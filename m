Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB000C88E42
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdGBr+zEuZ+3IMIOH+YSXDz/cFb4Jxs6mA7ZCG/b/yI=; b=dlWeE1fUczo1Fw
	hnHAqPjjYd405SeSH4p3YhVpDXT2ImDhudBdKhRl6C+vHZsmXYOmU3xzbYaUN51RZlCxT7pAuMl8S
	HCQq96uEf5lfhRsYnbu7L419V9WUZBN2DuGp+1z6/TM5qXU/BctFSdAtiBj1Qpo239yQxa74o5Eq6
	fNA0zrYEI19JVVG0j6NYoFyye4CfZJMTzy/jnLcyqtP7BZ6XdzEk05nIdKNoIJAnNlyJZqxc45TC1
	XL5uD91z6KT7rhYnzm00oNbRzfiDx+jvKMZ79itjSaKpqcGw+AXzOr7X+VeYxUVC31brW/WuaKpiB
	e9cO0ENZVgNUcoaRNDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVn-0000000E87l-1BNf;
	Thu, 10 Sep 2026 11:00:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVk-0000000E84k-1MsM
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:00:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso8195049a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038007; x=1789642807; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=U1Aw0CqQvxQGuc8x2nM+IKJ9zkzgfAhvCpwiO2BotjcoFUas+XPnIVzqIo0GS19PA8
         M70e+LRKUEvgiyQJdg+hpYci04UVMmVZ2GhvbfaB6QQZpDvYnEhadl+ElEE6jFelwOD/
         2Pb69B3VolBVHEuRBLzmWyCeAOHuUVL2vcLC782DxbEk31CgcGMSTmpFGDMDQv7UOiN2
         ANloE9Xjh3i7Dh1Cnt4w5gmpfKH1pPRH8ny8IcXGCtrlGqH5cWfoSV0DVHDt/QtKuZwu
         rm4YNqN/NdohxcBqLEusvox1OOHZeo+12liZr+A8TJbyAhQAxQ+1L9BAej2cZvNqTskD
         g24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038007; x=1789642807;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=HUIrHXfwPpcu/CvivwZv+q9BVYUqwLCrEC0TwwFDk+WkwS/nKc8Sd9okjcpMShimgd
         DG9hJW7fIYx8ebRxNpmRw3gyzO8gB+qdiNL/iB96NK5Qc2uPZPdhd6jpzbLsRcAK6/r1
         iLHAWrMF14mbroBVDbThivqiiPBzfxFa80+DtLo7vn3O78lnQ3avL/sJ3I2ULUl3F2fC
         lcEN9c3EZHarpgJos5F+VZQbgfmL/Zzn6q91V3AEft+IRDmIZ/1v2T0afoD6e0l7EP+b
         xc4lYCOlDMJWcrwKb+qs8psXi6SgxLn2VdHf6GJYUZvbE/VT62lYFpPKqsSgyd5iXCso
         RMaw==
X-Forwarded-Encrypted: i=1; AKwUvBxDc8a+/G0tFEchMoNa1HDWkXPaFhKpqj7A+wlmf2Lt2wiooUQ4OkfdaMf9q664aH5HZra6BpLKDAR6pw==@lists.infradead.org
X-Gm-Message-State: AFuF++nvr2jOSfjtTn0ZuBUcVeSza/D+0KYrbG1T0Z0Tw/zRBAXsAwTE
	HOB3VZ9rDwp4PBG8BBran71yE5D2/XNXnavSfsIpp8q2sz00f3MxmcWE
X-Gm-Gg: AYBFou3MXIFc/KaNtj3z5ZtlHoTHgGVxi9ZkuGqbwQtosIE6C6d8eID0K8nDPIKWf0i
	ZJb2YeNwo3MNikKrTvNd2i8XBsrHWJ8292koDeeubvuEe92F7FBPwpRCQ2JotZL6/S+B8a71HyW
	PvqKhGMNC0bAMBb1HEXaICvmFfyBsDw/KAQQrgD17IvRuqzEFlYR5u3vsyi+pldTo0wvy0H+VHn
	rEjwRs/x9XaXF4f0OSjR31uZsAx1+u6RvknEVoEJ00VnIcvPexwdnLIsNWcGol4q8BRdG/o16/v
	HMlXF/DDs8SsteCtRLPB+VQJEn9l+g7fQJQyfU91KxwlJ8QVYvXO2N8DsNAiKH7Fd4ji0K6mJG1
	Ph63HD6x2oFC/4AMZizthLbGqAb2aNw+tMH7AWhfMpyXuDpOKiENnW+qjSsWFu17RELqDDmMXHy
	+zJDD2slM2OJKEINTs0x3gFoNtxK8r8fbW+lHdvwfnsrsKaDERAU6kzJwzlbXWiBWOdY6IzmCvF
	VdKdxX2LJGwab9DIfxrm7v50nnsU46fXLm7B7tmKKnGy5OXDHoFAIk=
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr58529054a91.21.1789038006053;
        Thu, 10 Sep 2026 04:00:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm46703778c88.13.2026.09.10.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:00:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:25:00 +0530
Message-ID: <bja51im3.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040008_562387_EBB65AA5 
X-CRM114-Status: UNSURE (   6.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

Agreed with the reasoning. LGTM.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
