Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A441C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yXXYZ/hm+XtwXlE1WIO4ox2p0TAJwOqJbMaCGe8lvsM=; b=iGY+2j+Ajv7R7P59UmiZZylKUf
	EMXzs2SoNHW/JyuErIrsQsBopnsXsuQrIBx5d1Z7PX+fnAYbvzIQPZxcVEQ48/nxfSwcroa4vlfHy
	fuhxJgTsH5BAJpxWVwHnT4fhllgaHtYc2x+cPrSkerWuwQ2erij96LqAF9bBtEBFEBvoeQ806CWxh
	diQf7LNBRHB+cl5gw1czonRif/C99R/CGKgPPP0wf/orolkVTxIiqjUUSjKjBZ5RZ4tuNqmgPURsF
	eCwIkPY9Rdae/kejwkLCUfg6fPWIUM6uZbf/+aoG7rm6tprT3BsIFC8TE910+hB4LX2EghSa3RdOY
	pnEyNG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUi8-0000000BTuz-0BHN;
	Thu, 29 Feb 2024 00:55:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUi3-0000000BTs0-3vsK
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 00:55:42 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-29902c06980so242032a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 16:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709168138; x=1709772938; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eliV97qbvjzlWA6WTHOIiPM9PEq5O0yXOeFOONF3xgI=;
        b=SsfKO/GI8qLh//XGG5QqWzxDcxax1R4TMHEMPTvTRszTew0DM7hzL9Z6qofNshALDU
         NCeyi7ZrjQDGYX1JB9g4FZAEewQzGnYy45K2qFD44+dXIUTmb6wpChxli5BbwqkE3/6X
         ASuvLlBV1G8Yxq8iL2gDPEZryN6qdMp+AOebqSngsCq0eN0cqzM6bUE0F2P65dGzoVYb
         ZcvZjZrAVvXolWGZ1qEjkWFkIweNF2HQT/ZsGcFlqHwSEHzg2IlZTBkV74+y+VoxBRit
         Mr2TefscQnXFfNzf9njvyB78jeXXcY0P5rAu3WOQTDCQx1o7uDuwFNrCptf6AXa7VvgS
         A34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168138; x=1709772938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eliV97qbvjzlWA6WTHOIiPM9PEq5O0yXOeFOONF3xgI=;
        b=Iz4tFDJv9IkaV0mfN8O78yDgjVJKj1nwUu99QHe1oVbChlLeuFZJzL3wOV71Yh22+G
         pLEejcFwYitZysB8qGv2qhn+NQQnLcVIcmadwNWdSdUQc6cSq3T0kMCR6GFulMHy2mp4
         hjWwcJEE7eVtNdQkL/msF2Nb5q9VKXwNaztBVYPDCy+eDU2JTuVLHfWJ6g7cQAt9eGc4
         ZmDef3lVhiq1pfX8G3OzGjn6St7nrga4jl1XmOOY59YjkkzV9fSaAxpFbLXVR9404cy+
         FJccEV0Op5bwInWC5TCKAiWwEx1yRAwOXzjvECldxrDZLkOgnB7p4ItvKO8e0XW35Idk
         M7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ya7SeWGCypZO4yOcniysimOed4e5RCiOj9HrvcaL1WuL6B5Kew8lKT1iNqrKTgyISmJNb5gGjtJxDE3C9lya25gGg8288+ZO4gg0HVAI
X-Gm-Message-State: AOJu0Yxt0UE60XAbta/yPM3qQxiUGTtujEged++NUj0FFQeXeWYXI3Pj
	m/yKAt6cszOYMhkE8ZyEjNcWtYv/bC5tRJEqU1jxuOSBLO0wYJr3lpN67eCKf7TzviRrq+frE/6
	oPQ==
X-Google-Smtp-Source: AGHT+IGzoolXH5/Ep5baoVnZ7lanocljLeHRfew+WA071KUPfkGU9QcYsHqkuQzMw7/1VGlx+YyYgvht8/s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1b49:b0:299:dbe9:353b with SMTP id
 nv9-20020a17090b1b4900b00299dbe9353bmr2092pjb.9.1709168138371; Wed, 28 Feb
 2024 16:55:38 -0800 (PST)
Date: Wed, 28 Feb 2024 16:55:36 -0800
In-Reply-To: <Zd-2VK2kvMr_t1jx@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com> <170900037528.3692126.18029642068469384283.b4-ty@google.com>
 <Zd-2VK2kvMr_t1jx@google.com>
Message-ID: <Zd_WCJtlPpJVDcyg@google.com>
Subject: Re: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_165540_001962_8F8D5FC1 
X-CRM114-Status: UNSURE (   9.46  )
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

On Wed, Feb 28, 2024, Sean Christopherson wrote:
> FYI, the hashes changed due to a force push to squash a bug in a different
> series.
> 
> [1/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
>       https://github.com/kvm-x86/linux/commit/126190379c57
> [2/11] KVM: selftests: Make sparsebit structs const where appropriate
>       https://github.com/kvm-x86/linux/commit/35f50c91c43e
> [3/11] KVM: selftests: Add a macro to iterate over a sparsebit range
>       https://github.com/kvm-x86/linux/commit/57e19f057758
> [4/11] KVM: selftests: Add support for allocating/managing protected guest memory
>       https://github.com/kvm-x86/linux/commit/cd8eb2913205
> [5/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
>       https://github.com/kvm-x86/linux/commit/d210eebb51a2
> [6/11] KVM: selftests: Explicitly ucall pool from shared memory
>       https://github.com/kvm-x86/linux/commit/31e00dae72fd
> [7/11] KVM: selftests: Allow tagging protected memory in guest page tables
>       https://github.com/kvm-x86/linux/commit/bf47e87c65be
> [8/11] KVM: selftests: Add library for creating and interacting with SEV guests
>       https://github.com/kvm-x86/linux/commit/bdceeebcddb8
> [9/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
>       https://github.com/kvm-x86/linux/commit/8b174eb9d289
> [10/11] KVM: selftests: Add a basic SEV smoke test
>       https://github.com/kvm-x86/linux/commit/faa0d7027de3
> [11/11] KVM: selftests: Add a basic SEV-ES smoke test
>       https://github.com/kvm-x86/linux/commit/974ba6f0e595

That didn't last long.  I forgot that I needed to change the include guards in
kvm_util_arch.h.  New-new hashes:

[1/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
      https://github.com/kvm-x86/linux/commit/126190379c57
[2/11] KVM: selftests: Make sparsebit structs const where appropriate
      https://github.com/kvm-x86/linux/commit/35f50c91c43e
[3/11] KVM: selftests: Add a macro to iterate over a sparsebit range
      https://github.com/kvm-x86/linux/commit/57e19f057758
[4/11] KVM: selftests: Add support for allocating/managing protected guest memory
      https://github.com/kvm-x86/linux/commit/cd8eb2913205
[5/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
      https://github.com/kvm-x86/linux/commit/d210eebb51a2
[6/11] KVM: selftests: Explicitly ucall pool from shared memory
      https://github.com/kvm-x86/linux/commit/31e00dae72fd
[7/11] KVM: selftests: Allow tagging protected memory in guest page tables
      https://github.com/kvm-x86/linux/commit/be1bd4c5394f
[8/11] KVM: selftests: Add library for creating and interacting with SEV guests
      https://github.com/kvm-x86/linux/commit/ae20eef5323c
[9/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
      https://github.com/kvm-x86/linux/commit/69f8e15ab61f
[10/11] KVM: selftests: Add a basic SEV smoke test
      https://github.com/kvm-x86/linux/commit/be250ff437fa
[11/11] KVM: selftests: Add a basic SEV-ES smoke test
      https://github.com/kvm-x86/linux/commit/40e09b3ccfac

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
