Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA7EC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 23:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pnk5ZJKXNkuBVOgafJ14lhOIhposbo7UFdfiwYoR2hU=; b=sfAUZAIGo1ElBBoWZFqeEr1TkI
	qEUAUI6crKNd0j+sBD0n3ySZ8OPEPBuNliJ7B+KLgTfXASPHFEzQX+R8NcZ0Q/HM3svB/ypoYGXKy
	xubzNB2q/i4aXwNR7yiWPv+/RlG5uR8um7eLzJCCpOCb1O38U7b7LzAd/Oi26+Uj/6kDQSDpEA4Z/
	1P9Ys3jo5kysizjIqyFR2EdEygweJF91VV3vRiJw0K/nqkG8tEquY1E5KKRViitVxHW9+22Z7PZBr
	z9wosx6gSjyWum+FTM6NIq/pIpcYzxviKYrOnHXstSm3YvAFlDD74Y9Tq4zgm+ql2kzZCnii+EXNR
	bITIPg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVJst-00000005s69-2Spg;
	Wed, 31 Jan 2024 23:20:47 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVJsq-00000005s45-1rRi
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 23:20:45 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso510608276.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 15:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706743242; x=1707348042; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LraT2XeL3rEGwAPZd0fqZsj1phEA9uuSczA3YvOZb4=;
        b=aJgc8Yu36eA93NFrhrx6guap94t79dQNMtuS/fsJwcowPJiqrG8E1kjj1fgg5zQOU8
         T88i7Na2M44QEDzuJX7JKwFhERDCY4vUX7lCek8UTG4Y9jYJuKWvVlEbxrncFbznbz44
         Z78pIkbv+HGqwAbO+vcqbOfI3J+DW2lWCGEIFewj9Rlih9z+uhYbppwrEZ0dCdkNlBAm
         tdj8sZneAycOBh50NGpOn4olgUEMGNAMZcBt8bgqxlNQx4RNFbSuMzbWamzBUY6aulNi
         vzmv2a5/2vBSWZAaxtbg4oZSHJWkbDNd404eJA8uG40DP3jBqqXaCDx6cU1SJ4ifVHys
         NPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706743242; x=1707348042;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LraT2XeL3rEGwAPZd0fqZsj1phEA9uuSczA3YvOZb4=;
        b=OXwGr/lOI7k7Mfz2xrMIaE5PKYn8khjm8OsNHLOWu1IQfaX4Qvpkji8B4KDHD03W6y
         dekjSmT187M2hSuZi5K/kF1q4lBmNYJ4YZrs8mQLYnxZO4clMjawKNk9TU9m74Y/ALQ3
         WApdL4aLTF0x5J55qRBRQNGo9399uvtma/QgTO47RKrDpkDJuacybQhmBt8Tswx12MOq
         LMEj+DwgUZcDdHHtIpOCR3ZhKtHCwtOiBwxutl/EzlV+WlsK3myj+audrJdqIMPuemSA
         z8D+DUAR/TDNHozrCVcvvJsYAwYFcWZEa+4kkMxifRtgnwDomt/ztMVUMyzB2tsZ30Lq
         ZBpg==
X-Gm-Message-State: AOJu0YzpjXV5oQkZl/4fZTXFaJdGoWfIkMw3d8S7BSZinR3RufUMoSXP
	MQcdQl3mgKNbDc1phl0yh2brH+6ThLEfJyGir7ORQsLae90TLkSy8Gezjmm6bav6He5AKL/NWfR
	XCg==
X-Google-Smtp-Source: AGHT+IGN/AGCqkdJr6bpKzd1JOQ/JVcPRAqedMYNyR1G7Xg4nBku4fs5oM4yJkJ+BZj9xMDEHO8Wuiy2xjI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:920:b0:dc6:55ac:d08d with SMTP id
 bu32-20020a056902092000b00dc655acd08dmr832536ybb.5.1706743241894; Wed, 31 Jan
 2024 15:20:41 -0800 (PST)
Date: Wed, 31 Jan 2024 15:20:40 -0800
In-Reply-To: <20231102155111.28821-4-guang.zeng@intel.com>
Mime-Version: 1.0
References: <20231102155111.28821-1-guang.zeng@intel.com> <20231102155111.28821-4-guang.zeng@intel.com>
Message-ID: <ZbrVyB1Pj9KrH-Cl@google.com>
Subject: Re: [RFC PATCH v1 3/8] KVM: selftests: Add virt_arch_ucall_prealloc()
 arch specific implementation
From: Sean Christopherson <seanjc@google.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_152044_490569_4000A0AD 
X-CRM114-Status: GOOD (  12.46  )
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

On Thu, Nov 02, 2023, Zeng Guang wrote:
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index a18db6a7b3cf..dbaa2cf83c1c 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -917,6 +917,23 @@ static inline void virt_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
>  	virt_arch_dump(stream, vm, indent);
>  }
>  
> +/*
> + * Virtual UCALL memory pre-processing
> + *
> + * Input Args:
> + *   ucall_gva - Guest virtual address point to memory of ucall pool
> + *
> + * Output Args: None
> + *
> + * Return:
> + *   Processed guest virtual address point to memory of ucall pool
> + */

Please omit the massive comments, they are yet another misguided remnant in
selftests that we are purging.

> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 6f4295a13d00..525b714ee13c 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -388,6 +388,18 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
>  	}
>  }
>  
> +void *virt_arch_ucall_prealloc(uint64_t ucall_gva)
> +{
> +	unsigned short desc_cs;
> +
> +	asm volatile ("mov %%cs,%0" :  "=r" (desc_cs));

Strictly speaking, CS.DPL is not the source of truth for CPL, SS.DPL is.  But
that's probably a moot point, because I again think this is a hack that shows the
overall approach isn't maintainable.

Can you post the actual usage of userspace selftests, i.e. the "full" series?
It's really hard to build a mental model of how this all fits together without
seeing the actual usage.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
