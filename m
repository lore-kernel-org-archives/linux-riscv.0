Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734ECF5A8C5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ufRIPyxoA7vG22p7zmqNuGEY9QwkCJptmoh4OfTdvts=; b=hshAnxW8iB4wZu70idXgrbxvl+
	DHSIE9eFB/20y3eb8nsmiK1q29RyxKH2RoyvDtH8O1QMdvHO+/w48LH73tKsDrWxscFcR6h1s7Xge
	VzcgvsHjGm/1oCJyLMAcQCminpIiwMJTslyuGvfxL8B6SSVRgASQUjj30jRD0GaGC7Sj9dcCnm6Yy
	+h0iBDp7R10AttBADsO44IdAcgc1avdKUXHq/VNGxEeIGgmDPxcLhpmhW/X/Xs3drc58dB2mQGkXZ
	iLgwNBeq+yvLKeXJEJzlanA2FmzsSLkqKnmBgMdSNrvwcyR5oxMK7igh9HrYxIUm9fFtkxedYdTj9
	fpuETu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvSu-00000007dcD-2MJM;
	Mon, 20 Apr 2026 20:43:32 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvSr-00000007dap-3H9p
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 20:43:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b242b9359aso33970605ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 13:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776717808; x=1777322608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw/xOa4cMDz+3Y150IRREEsvI8FeQ6LscRd2k8rTaIk=;
        b=HGu8nbHdwEH1ht1VIiu5NeqGRskHHXBu4YE2oH1pg0ZyAuKaPKL6y1ZUY6gJ8/58L+
         B2U9vOWiFPiYDNBB8FUcWHb0TuuPUBQLBgmgctj69Sf836fT5WpYm9FP8wwvfyj1Btde
         DsNj8+j2FNKMzfe4ubkCKGvNOC4JowrN5wJugMjQJN/SBIPKuFuiDjpZd4LwGUfkaevW
         yJ+eEqTuWsC5R14hhFHyPefVtaEnSasShodQJVSn7nqTbL52Z3mlBajXavwIEjUjs3WJ
         nl/CdJ0PA0KkDeTY2J5dFX3B1Bqr+aAumg/ID8mrL6QcbJ74ZoCGiI09/1FzyaOyMXQb
         jXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717808; x=1777322608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw/xOa4cMDz+3Y150IRREEsvI8FeQ6LscRd2k8rTaIk=;
        b=lGMQ9Y/uyKUnJtgTi/VidDq4Cuwn0GEPmVsqN87WWg937jry/c2jxFMfG4T5gNnP0B
         3dINvt+X3v/hU1Irv60XcW8+gEAkqtA/sj67wMsOfKAt3EpEJi0DYWIu4o3WLn3BIVeF
         +MNHqLh+FNprg6WG+DRFitsaHWyAjJ0y5PnilG4cDSgSXQPDGzeKZER7z9gaT+RHAwie
         bFwlXKmLnlVOAYmdwv4KYexQ37rbfH64u4AQby3BscvlmMbkEpZ2Xz9IJTHybcdEIzuj
         81FfFO0C5FFJxj27cZaH8rebYdCLkqnRd94wxWnXtuTxHuBiySgt5JlfjFnynSLNKUPs
         5J7A==
X-Forwarded-Encrypted: i=1; AFNElJ80qQAA1HhAbEakLaW89gmY4URQ3lG7STzB7YiUOuFLR6uaj9hCUqvwVIubYPU/fcEQlelR25SiDAjKug==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIRr87k+8NYEApBNdaCkYS+fhZ+nL0xTftT6EbowtE/dMS8RaO
	Q7nOLquFjbJliRZI9z1wHGrA0c+vqt2dnrrxEjqag7ol2GeWssBT5xqGYynpaSaLKZid9X5LXjD
	OMIc3MA==
X-Received: from plai2.prod.google.com ([2002:a17:902:c942:b0:2b3:2649:c9c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d30b:b0:2b0:673a:7c90
 with SMTP id d9443c01a7336-2b5f9f50051mr108270095ad.28.1776717807739; Mon, 20
 Apr 2026 13:43:27 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:43:26 -0700
In-Reply-To: <20260220004223.4168331-5-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
Message-ID: <aeaP7kPPlyBZE-1h@google.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_134329_813146_D3B35656 
X-CRM114-Status: GOOD (  10.82  )
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

On Fri, Feb 20, 2026, David Matlack wrote:
> Use u64 instead of uint64_t to make the KVM selftests code more concise
> and more similar to the kernel (since selftests are primarily developed
> by kernel developers).
> 
> This commit was generated with the following command:
> 
>   git ls-files tools/testing/selftests/kvm | xargs sed -i 's/uint64_t/u64/g'
> 
> Then by manually adjusting whitespace to make checkpatch.pl happy.
> 
> Also include <linux/types.h> in include/test_util.h and
> include/x86/pmu.h to avoid compilation failure.

kvm_util_types.h also needs to include types.h, as it blatantly uses u64 without
any includes.  It obviously works thanks to ordering, but it's a lurking trap for
others.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
