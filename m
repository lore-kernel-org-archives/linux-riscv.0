Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143B5FDEE42
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d3eUpema8eDnE9Utqoqw3FdjFp92uTi8pjV6FJj1ttQ=; b=frVNma4dEAHRF4Lw7s/9wrazpi
	LGhtpy+hgv8Vs9mhWZcXZIUmye4gzrHXsd+YMXBZ88QX3TAQvglMrLyoLlAcGofQQ06GN5RNQtn42
	5wKXr6hxdclPrXDTlA9MBawxo6011P9Y4Zwl0GeXnH7AY9n33BLyHf1DyhBS+DdhM2442F70irquL
	lcD2Ro8mUGvVQdTXxy+jq6T9A8brmppd3UhKnvoIsMFHr7pMai8FbNnnx4wvaYAgX/rU1CE/8LbYI
	SKE+Ulm9pX/eYLhnjn0uzTHQHQCYzxjUGgoDkawuP8RxZN24ktf3AtMuVjZ/fraFiBwRyY5WFYZ5G
	biKsNLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFysy-0000000C7fW-0KXW;
	Thu, 23 Apr 2026 18:34:48 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFysu-0000000C7eS-2k8s
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 18:34:46 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c709551ec08so7716613a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776969283; x=1777574083; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NxrUD6qTbjo1W4xW1U0cuK75GKmXClrYS1Ro/7xiFY0=;
        b=M5CbFyisQtaXnqjjhOvDiLLekEt1SBdqIplGDMj/4mvYQecIUMJmQS7dSSrEUgz5C5
         Jh4Bp2XKntTIxrtbDbjLN3FebLKHn3SAKx/Dnk76+B6neAfEPNWKyra02XwCm0zIRgqb
         HeS0szzZr+ia8ZM4QesmMMKqQQq7K+FNLjDnbiilCcmu8LyvzkzbG4LeMIyNeIZiCZja
         HXsRc0BP20vXRdqY56VAsG+0lRpwK+FA5NhbJicKjahqVjZgdLS5ne5RfpbWd5QbLFX1
         Kd12gUMUxAlp5h8YiyUm3DLV3fmYVEKoZOmXnHCOps3LnTBkajDh9tI7NvDu3xoFghoM
         c5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969283; x=1777574083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NxrUD6qTbjo1W4xW1U0cuK75GKmXClrYS1Ro/7xiFY0=;
        b=Oc+5z5ahk03+gtflyiUukSaEGnI9tie0EW4o8kqjMWJxNIih9YOwwpX59mVMi2MNcg
         13cPcskNiitcTigFvuy13sGoCKtBZ4nSoFUOjl1ZLSIj40bhmOEZKIVGM22mfBrCYCQx
         3v2u7BQ798jimuuST3Ey30Kp8+56ce3PsDc2zpwQOg/KzNXXiLn8/GpVQ5ot+cbvFJLj
         n/pmfgpPyaYGk8gWv26TKD0ju99gJCMqbz4myBhKOi3D8s+lzVU1C8vFjq/qE/UetTLG
         NRR9MF2CB5v0TfA1Yev1BWuP2Y5TktuxbhnD/wEWT71HhsKu+goMSb2pOFvmjO+sFCSK
         C3yw==
X-Forwarded-Encrypted: i=1; AFNElJ/rSLOlkAzIps+fv1XQTOlLRpLEAO3alBfjONIx0obbw4Cq8C8bAdOWQZ7YyYn/kcs/qxF18UzA4CZ0Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp201Nv0rl+9dsccDYr/Vymi+bPvIyYapQcpV61nVzrdG8WTih
	hX1dDZBygQ2SyHyYhfoVYBllzGnmCJYFSlVK1K9bUvqBLUQa7MnCn7xXegH/+Vhbf1sk8W57rYh
	G1+nFJg==
X-Received: from pfbif1.prod.google.com ([2002:a05:6a00:8b01:b0:82f:a396:2229])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d16:b0:82a:79b8:2049
 with SMTP id d2e1a72fcca58-82f8c8c2a97mr30979563b3a.25.1776969282975; Thu, 23
 Apr 2026 11:34:42 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:34:39 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <177696924512.540717.6991894985950292004.b4-ty@google.com>
Subject: Re: [PATCH v3 00/19] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_113444_693751_89F57CD1 
X-CRM114-Status: GOOD (  13.16  )
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

On Mon, 20 Apr 2026 14:19:45 -0700, Sean Christopherson wrote:
> David's series to renames types across all KVM selftests.  I'm going to apply
> this ~now in order to get it into -next ASAP.  Unless someone screams in the
> next few days, I'm going to send a pull request on Thursday, with the goal of
> getting this into -rc1 so that all architectures (and developers) can use the
> new types straightaway.
> 
> Fully tested on x86, and I verified a handful of tests generate identical
> code.  I tried to do the same for other architectures, but gcc at least doesn't
> seem to provide reproducible builds for other architectures.  E.g. on arm64 and
> LoongArch, a completely benign vaddr_t => gva_t rename would sometimes result
> in different offsets in the generated code.  But based on manual diffs from
> objdump, I'm fairly confident in the result.
> 
> [...]

Applied to kvm-x86 selftests_kernel_types (a few days ago, spaced on sending
"thanks").

[01/19] KVM: selftests: Use gva_t instead of vm_vaddr_t
        https://github.com/kvm-x86/linux/commit/5567fc9dcd7e
[02/19] KVM: selftests: Use gpa_t instead of vm_paddr_t
        https://github.com/kvm-x86/linux/commit/97dcda3fdce5
[03/19] KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
        https://github.com/kvm-x86/linux/commit/6d3494255ac0
[04/19] KVM: selftests: Use u64 instead of uint64_t
        https://github.com/kvm-x86/linux/commit/26f8453288d4
[05/19] KVM: selftests: Use s64 instead of int64_t
        https://github.com/kvm-x86/linux/commit/286e8903aed1
[06/19] KVM: selftests: Use u32 instead of uint32_t
        https://github.com/kvm-x86/linux/commit/0c3a8774692a
[07/19] KVM: selftests: Use s32 instead of int32_t
        https://github.com/kvm-x86/linux/commit/7b609187684d
[08/19] KVM: selftests: Use u16 instead of uint16_t
        https://github.com/kvm-x86/linux/commit/19d091492004
[09/19] KVM: selftests: Use s16 instead of int16_t
        https://github.com/kvm-x86/linux/commit/2540ebd60349
[10/19] KVM: selftests: Use u8 instead of uint8_t
        https://github.com/kvm-x86/linux/commit/6ec982b5a2c7
[11/19] KVM: selftests: Drop "vaddr_" from APIs that allocate memory for a given VM
        https://github.com/kvm-x86/linux/commit/85819fa0e3b9
[12/19] KVM: selftests: Rename vm_vaddr_unused_gap() => vm_unused_gva_gap()
        https://github.com/kvm-x86/linux/commit/48321f609a73
[13/19] KVM: selftests: Rename vm_vaddr_populate_bitmap() => vm_populate_gva_bitmap()
        https://github.com/kvm-x86/linux/commit/3fd995905b71
[14/19] KVM: selftests: Rename translate_to_host_paddr() => translate_hva_to_hpa()
        https://github.com/kvm-x86/linux/commit/4babae4ca10a
[15/19] KVM: selftests: Clarify that arm64's inject_uer() takes a host PA, not a guest PA
        https://github.com/kvm-x86/linux/commit/a662c4e03853
[16/19] KVM: selftests: Replace "vaddr" with "gva" throughout
        https://github.com/kvm-x86/linux/commit/014dfb7b9bf3
[17/19] KVM: selftests: Replace "u64 gpa" with "gpa_t" throughout
        https://github.com/kvm-x86/linux/commit/df079910f981
[18/19] KVM: selftests: Replace "u64 nested_paddr" with "gpa_t l2_gpa"
        https://github.com/kvm-x86/linux/commit/abc374191dc2
[19/19] KVM: selftests: Replace "paddr" with "gpa" throughout
        https://github.com/kvm-x86/linux/commit/dfd2a8b07c6c

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
