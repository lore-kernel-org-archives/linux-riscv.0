Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84154ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIso5KEj7llv8mWNvws9H24NSw8cMcKbOWo4qr54KxE=; b=QEtkRVX0LAaWoB
	Zr9lA+2ctuxdcZ/BV1wvB4SKH0nJg/dLwkbcW4Sp73MWEIICi73OITHC5XCWsEmGxNjrJnWpAreoV
	87xfyLVJtD+J66v1q8kbnVZIOqFQmD5E1XAuE0naIwAzz61EgGz/nQWsHpVyIXgZi2fN7sqGfN5zy
	l7AWfa5Mcz260XoDLVUzxqjqqBAsKl6JappJ12P7OisZL4qkE3FsC4plLRvNtJhbJG5L5QpDtud9o
	X7RO2LTGzMOuXuRMX91+S3xzQ4uStAH8FmlOjtjBwFx9zVkggxBIkV49aFCISnEU0CxHAPq1s5C7l
	a7njDGIPSanHvBEwPH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShfo-00BliA-G7; Mon, 29 Aug 2022 16:31:40 +0000
Received: from out0.migadu.com ([2001:41d0:2:267::])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShVi-00BhXo-M5; Mon, 29 Aug 2022 16:21:16 +0000
Date: Mon, 29 Aug 2022 18:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661790073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V84lDEZ16EblHvtM8fgyVev0owrVHxHzScy/ND3jaaQ=;
	b=CaPKCCVzoPf4bcbSMTSpQx2lOZ5yESWOlPHBTiOGHy4YQpHkCtql8IPuRRpSByvC5hO8de
	6xl8kO3jvz+Vdxt6cwkLhNUnQ9HU+hkqAyGXbfk+QrVReKpiqR0UixIQTF6rHD9/2AuqXA
	G+ANmKWFLtjqyg/LGkmx1D+5lFNxgSE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v5 6/7] KVM: selftest: Drop now-unnecessary ucall_uninit()
Message-ID: <20220829162111.wl65dxexk5qtrssf@kamzik>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-7-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825232522.3997340-7-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_092114_932654_6BD45518 
X-CRM114-Status: GOOD (  11.58  )
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

On Thu, Aug 25, 2022 at 11:25:21PM +0000, Sean Christopherson wrote:
> Drop ucall_uninit() and ucall_arch_uninit() now that ARM doesn't modify
> the host's copy of ucall_exit_mmio_addr, i.e. now that there's no need to
> reset the pointer before potentially creating a new VM.  The few calls to
> ucall_uninit() are all immediately followed by kvm_vm_free(), and that is
> likely always going to hold true, i.e. it's extremely unlikely a test
> will want to effectively disable ucall in the middle of a test.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/dirty_log_test.c       |  1 -
>  tools/testing/selftests/kvm/include/ucall_common.h |  6 ------
>  tools/testing/selftests/kvm/kvm_page_table_test.c  |  1 -
>  tools/testing/selftests/kvm/lib/aarch64/ucall.c    | 14 ++------------
>  tools/testing/selftests/kvm/lib/perf_test_util.c   |  1 -
>  tools/testing/selftests/kvm/lib/riscv/ucall.c      |  4 ----
>  tools/testing/selftests/kvm/lib/s390x/ucall.c      |  4 ----
>  tools/testing/selftests/kvm/lib/x86_64/ucall.c     |  4 ----
>  8 files changed, 2 insertions(+), 33 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
