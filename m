Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728FC00145
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvbx9jHIT2c5+GMmkgBZQbANZ3xpZKWNxYA8QAJjLAE=; b=YShoqUdyi1NYwL
	W8lgoEierTdcxsuHMMSsjU8b6RhhIHghlgLaphVcpE9X/mmcOWOySoO6Twf5WHaDofBUCyoQaDVB9
	A1n6cecISN6h2MUZHlTgGTIm93w7erihJSSvwenbSoAjw0grkt8W+rXryth2E9aEoDKaohs4CTdma
	5f0UwnBPAUmBxCi44WeRn4Iw0eD82nsbo1Dy3g6cZUcaOz77GnclaL0jmBEDh32pN0Mdffyqzn1vF
	0uGhUUY6udK6DJL0bFisYgp/I9Ge1GMihzSMd3STWDic9wlLHlepanWtzZZuliTnnt3mBYXH2tJtv
	ugcqcJYBvzdrLpF/7prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4twd-008snO-4S; Tue, 13 Dec 2022 01:18:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4twU-008sO2-Nv
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 01:18:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d3so13945695plr.10
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65IDnHecXM4GAPku5HHW6zoqaWMBpSe6UVEVil1rUW8=;
        b=aCbTEC5zVQHMxXGUQTyU3DWgykcdtGQYX+TMVnYfhhivfYDwUdEI2A+rvhEs/NwsaF
         DBS7EUg/X3QUOeZSsBrnvtkOTybUx0UgHQfTJ3hA35ipZDaXqrdLdH18As7YVMN94+FU
         E0ZAjnBtiWq0DWCLJTMY1LLhx6oaO6nTa/LCKJnCfj9cvh92FEO+h9Fh1uCxf/eAl6iw
         7hyDu3aUhJ3UKrfyvsiyjGIexzmF9DmyPzjASetqH/jMJK8TS5INlchOlJfnBagkkznK
         3XYQb4be1caEftz1e2fA0GEffMBeGMtYKiW3GQDIe6ihjILD9JWzVjZUmCWBKLdW3ozR
         bQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65IDnHecXM4GAPku5HHW6zoqaWMBpSe6UVEVil1rUW8=;
        b=68BlidXO6c6ZPKXi5ZUcZlRHLFSP6lmaobODNLfqi/EeyWC06EYGyYzG9LQaqVdVcO
         IHwmeLnm65abQmyTx8VYJWACIeyQWesGN8xExbeCUfACrJUIJkIv0pd8QOGzlFCTtXBL
         FBByYa8RGq6RKkZeHtO2Smlu3+qi8Uyzr/5kec+4zkG7D4lPMknUYz/fbXFlzXTU9Zys
         oHbmoS5LYlmZQPcuEqPSfY5FgICbX7n29ey9Oyd5+c74e3O9YiqKmqEcJQWWqSIijE36
         w28Omt3WSevLRn7I9iWLtJQCjuKSDZsGIfQJvrZ3+I4c+pA/+cf/Cj/+T26C09mE6fxZ
         rFBA==
X-Gm-Message-State: ANoB5plgNVT0LKyNubEQwsb7GmIReIQJXhwJ+yZm60p8cosvLoxLK5C5
	PWxvwg3nhMnXGva+ucWGto7IGQ==
X-Google-Smtp-Source: AA0mqf5INLD3H26KoHZlGz+PIVih+odmnj70wLNIiESaeaUKfnuuF7xa7n6FGQnW8NJxdar9YAD0/g==
X-Received: by 2002:a05:6a20:2d21:b0:a4:9691:6e9 with SMTP id g33-20020a056a202d2100b000a4969106e9mr23637142pzl.1.1670894320396;
        Mon, 12 Dec 2022 17:18:40 -0800 (PST)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id r14-20020a63a54e000000b00460ea630c1bsm5762650pgu.46.2022.12.12.17.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 17:18:40 -0800 (PST)
Date: Mon, 12 Dec 2022 17:18:35 -0800
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Yang, Weijiang" <weijiang.yang@intel.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Amit, Nadav" <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
Message-ID: <Y5fS69mLXlV+cQlg@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
 <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_171846_805678_525F2321 
X-CRM114-Status: GOOD (  18.66  )
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

On Mon, Dec 12, 2022 at 11:50:29PM +0100, Paolo Bonzini wrote:
> On 12/12/22 18:39, Sean Christopherson wrote:
> > > The notion of address spaces is already existing architecture-neutral
> > > concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
> > > virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
> > 
> > Yes, SMM is currently the only use-case.
> 
> It's possible that in the future Hyper-V VTLs will also have per-level
> protections.  It wouldn't use as_id, but it would likely be recorded in the
> upper byte of the role.
> 
> I'm not sure if Microsoft intends to port those to ARM as well.
> 
> > My preference would be to leave .smm in x86's page role
> 
> What about defining a byte of arch_role and a macro to build it?

Both would work. I went with as_id in the common role since that's how
it's encoded in kvm_memory_slot and because, not matter what, the TDP
MMU still has to handle multiple address spaces. i.e. Even if we hide
SMM away in the role, the TDP MMU still has to access it with some
wrapper e.g.  kvm_mmu_page_as_id() (that would just return 0 outside of
x86). From that perspective, just having as_id directly in the common
role seemed like the cleanest option.

The only way to truly shield the TDP MMU from SMM would be to disallow
it. e.g. Disable the TDP MMU if defined(CONFIG_KVM_SMM), or something
similar. But I don't know enough about how KVM SMM support is used to
say if that's even worth entertaining.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
