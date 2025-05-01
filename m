Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446A8C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kfvKxWBf0bPuy00B0HvSrtwV+cKHJWMDQ/2AZaRZz88=; b=kSZN4E7XUUsciAETXITLT/vAml
	UeZvFedJz4lt8mKfoN9HepX+nDp2S0mJiBdNsEwqzKsW57Wd8QYTHuHLw5kFXrHXVWkJdG1DceD3f
	O+SOOzXLkKP3dovFiwchqOrTwRCtOoiQ+ndvtwvHoUVaWfFUkoP/tC/CWiRkC4GboLMGiakqSDrj+
	a54B0kJONZoIPBqhBzTMWhkbQulignkM40Ge1oPWqsEgUKDV1Tu5vliwX9FfZedi3PqINsEatHFQk
	W3K3BiIjVZEIWy3z5jX2Z+IA1gwWK+OExsKdna/LLVPXQVtP1jRAoFHJ3bkLbIkAHRpo1tQb03e/F
	J3J2WvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAb4S-0000000GqOO-1Q7H;
	Thu, 01 May 2025 21:03:52 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAb4Q-0000000GqLg-0BV7
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 21:03:51 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so1395639a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746133429; x=1746738229; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3LgD3RsHy0idAPG24WJvE7joJXrg8YFB/6s4D5IWPE=;
        b=uuUhXBgR0QLuqx8NstGWwshhtYlzqt0z9Ugj0S/dyDAyFPbCEpMjk1Xq07XU6hCHO1
         VnvzQ0wsqyj2N2aj37/L+lmswKLyXq2Vw03L4J1/f4fgjpm3R47er2zdEzFj4mehE6Yv
         0tsWd8DXT5WVRnbUUfAn1bxBcK8gBAg7e1IvsvIgHwiu0Pa09LDqTAQAbq0DJVzdqICm
         /cb+mWcxz/k44BanW90WTibYVuvVrVZD6AyRh0jtdSzKmMoOiOHA3+oJVaFQvpSmRUIF
         /45ZYAmrJ2HGMTem0vy4odQZqtifcCxlJ36t/Jwj4T/QaUIJ0fZCjT/I+sKYl71D691G
         GBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746133429; x=1746738229;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3LgD3RsHy0idAPG24WJvE7joJXrg8YFB/6s4D5IWPE=;
        b=e6YTfOY+hnW8R1n3IbSnX3BZGhfkpQXJEVNJruRN/RktiHagiCBM8ybm+zenpjA1u7
         +dslVYfQhpqTwztu2nS6IQ8WhmjH9un5/s0h7wIZv0UJ7v6O/LNhfmlr0AYC/02hvTab
         yHIJ1eOD6DqchR8ky5BmFND4hpfogNFEAPWfMZ2qJoPsxDN6RE/qo9Gvvq5744w6qJBJ
         BRq1P8FPHJMFXVGcQonkf3tBriG2n1fn4QbJcUh/eZ+9lhe9YR5PcsZH2LW3a5Uw5ZuV
         i9nfPslnfk1oesUZ/PdC3ZYWaksM4SWv60E2StwcS7M73SX6+wsqzuYuHSa8NGXrEn5P
         So8A==
X-Forwarded-Encrypted: i=1; AJvYcCXTYvM39ssk5JZa7QrVWbo4QYiuh4UaJOaih8gLON9OFSlujSNOr9xP8+dtzAX22EIurHCssoikME9mzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdSfpAuih8HQPKz8AW9UX/TUJB6uBhHiSQje1ILs+zt7dwHG6u
	eLh/YuY+vRF3iZu/OmYGbEb//VD/q7ru2239U52FOQihR2tV9x1hxgLrdyTMEhqrd+icLNtf3gx
	fMQ==
X-Google-Smtp-Source: AGHT+IFsKbxWNYniktZ+08WA6b0CsvxaU/dos+kZKMRCn6iD7Ks6A9wZ87nfSSI8jfHEMe/wZJjzetRtCUk=
X-Received: from pjbnw14.prod.google.com ([2002:a17:90b:254e:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc2:b0:2ff:4f04:4266
 with SMTP id 98e67ed59e1d1-30a4e6949aemr658697a91.23.1746133428792; Thu, 01
 May 2025 14:03:48 -0700 (PDT)
Date: Thu, 1 May 2025 14:03:47 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
Message-ID: <aBPhs39MJz-rt_Ob@google.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_140350_098275_BC5450DD 
X-CRM114-Status: UNSURE (   8.43  )
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

On Thu, May 01, 2025, David Matlack wrote:
> This series renames types across all KVM selftests to more align with
> types used in the kernel:
> 
>   vm_vaddr_t -> gva_t
>   vm_paddr_t -> gpa_t

10000% on these.

>   uint64_t -> u64
>   uint32_t -> u32
>   uint16_t -> u16
>   uint8_t  -> u8
> 
>   int64_t -> s64
>   int32_t -> s32
>   int16_t -> s16
>   int8_t  -> s8

I'm definitely in favor of these renames.  I thought I was the only one that
tripped over the uintNN_t stuff; at this point, I've probably lost hours of my
life trying to type those things out.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
