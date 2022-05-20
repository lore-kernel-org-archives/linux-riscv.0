Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40045C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6r2w2seC47cmvmSTkdvRD81asBRHJ76tKsR0+ugdpMA=; b=lavTtJ1aH4ost9
	8rRy7vz4bsuqZ6TA9eKn2U2xs7IZ0hH80kZovoe0xN3LS569IYz/NvD0Blo8noWZBkKe3ktENnEiG
	VvnTCKZvKsZkqSFnZUCX3H8NZupl/MVzwKvP+4r2huZZoWg5eIKMOG+5mFAAGTPb4ZMkQ94kShvsc
	j/cUZ5/48qX8l+K2sAMLBXLy+dfVDhkmnwUQn6ZZuPN1EjfkpM4zaI4aqpBoG6rX/0blj/KPoU6kC
	kgRUyFn61myCC1yKFZQGc3r9w2LOpSaM9eq/sH3L11jJ4W0AvHYKMaETBVDPQRiy2GlFYrxDPk1/U
	tiZfztnVElTERpH6IHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1Eh-00CC4x-56; Fri, 20 May 2022 11:56:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1Ed-00CC3a-9u
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 11:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653047758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4IMlyw01tBNJTvtft3R8NXdy760egTdFl+vS1YSMxUk=;
 b=eWdXzU83V7+O5rl0sVbl5ip09dCLwsHJXlfoi8rqQzOHsi4LMcGlxkg6NTD5twZ1p829MS
 nISoz/13neZ+tHcfBVn6XzMH7sJoX57JnDbbk4HT4zP7cbaR7HeZhQEtS4olb5NIJKqMjy
 BPyeolPHLrKnTUqfg52ItZBgqklrBMM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-ows9N3hjMUGO3eE0iVFQdw-1; Fri, 20 May 2022 07:55:57 -0400
X-MC-Unique: ows9N3hjMUGO3eE0iVFQdw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so5474928edr.9
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 04:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4IMlyw01tBNJTvtft3R8NXdy760egTdFl+vS1YSMxUk=;
 b=PQeNnutGyJHoi0O91aLYh0PVMYKmcn0AH5E7Gx/K6etu1aVCwPnBNg4ro2k2Qh7eZQ
 nBDLfxHlFL4pKGAYO0LF37HjzxpKeBt+vgtaIyuxtnc+n0V9T6bQfZAdViT1zzobQieN
 xrAD3jSdQIFqyFUqwgWm6bL1hIN89M+fCV6V+o4C5ViHrlixVB3x7vzpkrUQg3ThJLPM
 WQ8/EesZzZ8HxaaN1yZ9gdD870H6lGcQuTwOju32WROswaih4S6GeCI83x4itFzT3e8c
 g9pGAxSpUcgFJCiNeUe1feI/x+Q4Q4c6dRmTI4wS1BPll+E41RHWeGTQHKPNI3DDXi9x
 l4bw==
X-Gm-Message-State: AOAM53109gK9aNBDTdeVJRxgyDPgUnJTsgMUnRU+UHSbTSjKQ0q4y+WA
 oruWP9Lqf5+1sxQj5wv+caSn5u9GD1HtnH1riXaskFKwI7JZLisKYz0BOCC4ybrGrT4uPotmXq2
 +HMMC9x8q2da3O7RfPUjIwCs5FsSH
X-Received: by 2002:a05:6402:35d4:b0:427:f36b:66dc with SMTP id
 z20-20020a05640235d400b00427f36b66dcmr10641133edc.77.1653047756284; 
 Fri, 20 May 2022 04:55:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/eJ6Iu3s0UhZEmWO+wTmbI84ilygJn45btvxXA7t1f3uYrHaXgyTQhQFKBHmkDBQgsLw5sg==
X-Received: by 2002:a05:6402:35d4:b0:427:f36b:66dc with SMTP id
 z20-20020a05640235d400b00427f36b66dcmr10641105edc.77.1653047755996; 
 Fri, 20 May 2022 04:55:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 17-20020a170906329100b006f3ef214dd2sm3125275ejw.56.2022.05.20.04.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 04:55:55 -0700 (PDT)
Message-ID: <d3ceed31-9dd5-ed7b-92e8-fc3a5fd406fa@redhat.com>
Date: Fri, 20 May 2022 13:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [GIT PULL] KVM/riscv changes for 5.19
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1DUJa=5YxbV_u0B=NLaTJrW03PbLxegJ2oCWDeWqy=zw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy1DUJa=5YxbV_u0B=NLaTJrW03PbLxegJ2oCWDeWqy=zw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_045559_497443_999B5358 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/20/22 06:48, Anup Patel wrote:
> Hi Paolo,
> 
> We have following KVM RISC-V changes for 5.19:
> 1) Added Sv57x4 support for G-stage page table
> 2) Added range based local HFENCE functions
> 3) Added remote HFENCE functions based on VCPU requests
> 4) Added ISA extension registers in ONE_REG interface
> 5) Updated KVM RISC-V maintainers entry to cover selftests support
> 
> I don't expect any other KVM RISC-V changes for 5.19.
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:
> 
>    Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.19-1
> 
> for you to fetch changes up to fed9b26b2501ea0ce41ae3a788bcc498440589c6:
> 
>    MAINTAINERS: Update KVM RISC-V entry to cover selftests support
> (2022-05-20 09:09:23 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 5.19
> 
> - Added Sv57x4 support for G-stage page table
> - Added range based local HFENCE functions
> - Added remote HFENCE functions based on VCPU requests
> - Added ISA extension registers in ONE_REG interface
> - Updated KVM RISC-V maintainers entry to cover selftests support
> 
> ----------------------------------------------------------------
> Anup Patel (9):
>        KVM: selftests: riscv: Improve unexpected guest trap handling
>        RISC-V: KVM: Use G-stage name for hypervisor page table
>        RISC-V: KVM: Add Sv57x4 mode support for G-stage
>        RISC-V: KVM: Treat SBI HFENCE calls as NOPs
>        RISC-V: KVM: Introduce range based local HFENCE functions
>        RISC-V: KVM: Reduce KVM_MAX_VCPUS value
>        RISC-V: KVM: Add remote HFENCE functions based on VCPU requests
>        RISC-V: KVM: Cleanup stale TLB entries when host CPU changes
>        MAINTAINERS: Update KVM RISC-V entry to cover selftests support
> 
> Atish Patra (1):
>        RISC-V: KVM: Introduce ISA extension register
> 
> Jiapeng Chong (1):
>        KVM: selftests: riscv: Remove unneeded semicolon
> 
>   MAINTAINERS                                        |   2 +
>   arch/riscv/include/asm/csr.h                       |   1 +
>   arch/riscv/include/asm/kvm_host.h                  | 124 +++++-
>   arch/riscv/include/uapi/asm/kvm.h                  |  20 +
>   arch/riscv/kvm/main.c                              |  11 +-
>   arch/riscv/kvm/mmu.c                               | 264 ++++++------
>   arch/riscv/kvm/tlb.S                               |  74 ----
>   arch/riscv/kvm/tlb.c                               | 461 +++++++++++++++++++++
>   arch/riscv/kvm/vcpu.c                              | 144 ++++++-
>   arch/riscv/kvm/vcpu_exit.c                         |   6 +-
>   arch/riscv/kvm/vcpu_sbi_replace.c                  |  40 +-
>   arch/riscv/kvm/vcpu_sbi_v01.c                      |  35 +-
>   arch/riscv/kvm/vm.c                                |   8 +-
>   arch/riscv/kvm/vmid.c                              |  30 +-
>   .../selftests/kvm/include/riscv/processor.h        |   8 +-
>   tools/testing/selftests/kvm/lib/riscv/processor.c  |  11 +-
>   tools/testing/selftests/kvm/lib/riscv/ucall.c      |  31 +-
>   17 files changed, 965 insertions(+), 305 deletions(-)
>   delete mode 100644 arch/riscv/kvm/tlb.S
>   create mode 100644 arch/riscv/kvm/tlb.c
> 

Pulled, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
