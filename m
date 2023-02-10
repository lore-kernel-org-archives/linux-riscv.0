Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC8EC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 01:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwwgFdV5fjPITM7Zk/C+rDQ7KxQqf8zIpog/unMICDI=; b=RkDfG/qQ33Byv0
	/OuabhYkNKud0134+Iqm14ujw2JRa/vPrAL1DjGODaa51KPp/wXWrChtpwvC+HsJk2yLgtNvw58Rr
	KNBvmboC3vk8ef6XH3Ulnp24RTx9E6rDVNuOU8umK1yis7cRNuMtvzvck43CCsBwa+k9GvcQ5to6+
	u74xV1hni87WIiECSJdyk1rouz8Qvi9cF8YA+ZCmnBu9+R4nxixeFiH0rsEGeR1c8h4luauUvbRPr
	Ycw21VOstfmFvUw5+pUhFnsKDlQ0tzBbOd4DmW6Fcnz1voiWaH+dvXy8z/VQTG8sSV/78lLsASpmC
	6iCa+AmmFv9UQYelHWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQID3-003plB-2z; Fri, 10 Feb 2023 01:28:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQICy-003pj2-Pa
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 01:28:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id z1so4930308plg.6
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 17:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mnobgm7/BRwA5boztD22jzgEkU3wNnOY9D1aetlEf20=;
        b=csIO68IIOhsu6e+pdejTTT2+w48D/sWWLOeOIyNJYGX8uv7NM4VXMJmzIiRrpc2byB
         oNF30v46MfMUr/zM1Y9pIBSYlUDIVF+op3/R/inHFDRjbUPyvEWGmS8g+4aYPNOLXmI1
         k4gFifjP8fAfy+Pj0D/2S3/yl0kgg472XcQ7oejDQhBv7j6e61xvYtTNJxFhtCLHkUR0
         vwFGPM0W1k1+6VAy/nE3sRCRvI1WK//Zg5F92Z7EstjU8c++zH/a/c8dOrVkEQhduubT
         CTG0B3v3Gj7juI3iy68AbH4UWi8S6xjEzA/lWDNstS1PF9tuSuPj4tgHC/qRIAxoM46N
         zJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mnobgm7/BRwA5boztD22jzgEkU3wNnOY9D1aetlEf20=;
        b=Pjo+oR3zjgC8BIG0hYISeTZhE7nIb/2kIIbQFZglhIHjj+8Iuzq43qCwKnA2rlHuUQ
         kWhOIzOneL5HkB6po2E/lQi810cDGAYbWtbdB+Ksp55pRxgUp67WNhKuRmQvZRPbXH6v
         bKO0ymhMu/nuGzsp3ITPWAGaAqQ2u6OgaRyYmEufLcYDEYXu8JSS/wD6u9TX9/REQDJV
         LceZLwFLI4yQVcKpuvLqvfEf/Zn5UISiLrDnyDHiCvqt8gT7eGAvdVgw9uiBuhZTa2wL
         Fmsv82Gh0gWAlxdQwdOW0dcWffhnKECtamaCAyErz9w1tNdljy3Rn7ch91buUXJ+UJ5b
         oEjg==
X-Gm-Message-State: AO0yUKUL7/v2CPBOkbvjTIfEuG70YTDQ7bFkEksn7+nP8AL47KXp7sYt
	36R4jXZPjGgi1g65Z0jZ5uvR3A==
X-Google-Smtp-Source: AK7set9Obj4DfpjGpxNp3bHnBxnNHSIelzzZM7dkpr8wS73Skb7zUOHunDsTlPiKfqLt2v8la2CkZg==
X-Received: by 2002:a17:903:264c:b0:198:af4f:de0c with SMTP id je12-20020a170903264c00b00198af4fde0cmr103011plb.12.1675992483947;
        Thu, 09 Feb 2023 17:28:03 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id jk11-20020a170903330b00b00198da1ce519sm2143807plb.111.2023.02.09.17.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 17:28:02 -0800 (PST)
Date: Fri, 10 Feb 2023 01:27:59 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH v2 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
Message-ID: <Y+Wdn+mYVYhwut5l@google.com>
References: <20230126184025.2294823-1-dmatlack@google.com>
 <20230126184025.2294823-3-dmatlack@google.com>
 <86o7q4zdcp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86o7q4zdcp.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_172812_854201_9A0F2CDD 
X-CRM114-Status: GOOD (  15.38  )
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

On Wed, Feb 08, 2023, Marc Zyngier wrote:
> On Thu, 26 Jan 2023 18:40:20 +0000, David Matlack <dmatlack@google.com> wrote:
> > @@ -368,7 +367,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
> >  		++kvm->stat.generic.remote_tlb_flush;
> >  }
> 
> For context, we currently have this:
> 
> 	if (!kvm_arch_flush_remote_tlb(kvm)
> 	    || kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH))
> 		++kvm->stat.generic.remote_tlb_flush;
> 
> Is there any reason why we shouldn't move the KVM_REQ_TLB_FLUSH call
> into the arch-specific helpers? This is architecture specific, even if
> the majority of the supported architecture cannot do broadcast
> invalidation like arm64 does.

s390 and PPC don't implement kvm_arch_flush_remote_tlb() at all, forcing them to
implement the function just to implement what everyone except ARM does doesn't
seem like the right trade off.

As usual, x86 is the real oddball.  All other architectures either use the purely
generic KVM_REQ_TLB_FLUSH or they don't.  x86 is the only one that sometimes wants
to fallback.  I can't see a clean way around that though, especially since MIPS
apparently needs a notification _and_ a generic flush.

Can the ARM hook be inlined?  That would eliminate the extra call and should allow
the compiler to optimize out the conditional and the request.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
