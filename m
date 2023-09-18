Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808B4CD13D8
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fyqTnSvLrEpRhuIb43o1a32Hfjgp5ItyGWpTPz2zLeE=; b=fLAiuC0R6DBgpunGuBLB3DqAc7
	ro6WOqZ7dYnMfph3BIBADA2auYCAmRHB6H16PAxH6BtYAqk+04WzHlBG5nQPd5t3b4GGlCYU16h8U
	UnHe5+QPve+RKalbC0s27sRk8CrfRvdlmwpcclzBHjWTC3aqwNdlYeUd6phIYhtYU85otKrvQsUrM
	WqhovqGLb2fdLLu35522pHXql/R2EatXlFKubfnMneQoTF3YMtEpuunlC149B3l+b9fgNCfYDNIC/
	nanawHjE3XWz6ZNcZzO2PYzjCdYyFumXbzI6z2Gjz/egxo6s+MiOcZGM143zjTuIM7CyBWBzWHxLU
	uD73KYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiHbd-00FvU1-0i;
	Mon, 18 Sep 2023 17:00:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGdJ-00Fo37-02
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Sep 2023 15:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s17YssV/eLMk3v6BQw21PztJLVQ1uDSUDnGyHA0nJic=; b=IqI8XhH3QP8EptBttPqrWkQRIp
	TEuSCNVBqwtIwGnCTe86hc6W7v4lN4x+cVdy2m7dIvaWjOtwTZZ1wTacmRuPq0676D4u0B8QQNbu7
	7WUz+9ATC5yBM76f3BXjWbYB+v+wVwGDs6w7ogXSdvUJaZvkC9mevXnluY3A8N0Iailgq7hgJAHG4
	buRceTYJnPY/N/X8dsREh2VZTYuM6E/41dXPIj9fuFN5S9ICnl1hnHPb9UnNmZjtbORP08qEQSDC1
	muYKNgQL+Zvrcy2O3gKKQLqDpU0/l+qSy3IbFcpObtmIU3Z/yN1HQYoSxtPce5iICC+fM1aVayLVZ
	d+Mz8NxQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qiGdF-00Bsvo-SH
	for linux-riscv@lists.infradead.org; Mon, 18 Sep 2023 15:57:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59bfccec7f3so49161547b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695052667; x=1695657467; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s17YssV/eLMk3v6BQw21PztJLVQ1uDSUDnGyHA0nJic=;
        b=lIjUnxprdj0PGVr4cRoUj9UNuJZGVJJ76esFBbZaYffI6DRyv3+1tySFasMWeT0A22
         UIltduy2T4z241MGUbXqM1oWEpfGIBGPNVCeatDFFqmQBQoaELah2902DZeWzhI4GagL
         TPl7eMQMd4b57ynrwpWUzttU9CIoJMvMHGXzZBg+g9FusyZUqcny9u34m/yihIdnT55m
         BQsnwqPsmEF4U8e3QdVqckNMlwa/oSKA8T9B4w6g+eHvWUVi7mydXvNvSnHogGPcO2fg
         wEOLHINoQbkueflIu13fkQcloh4pI44z/WcvrW3R9xVDMknJ6plA3Sr8Ih4kpGlUpUJE
         8agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052667; x=1695657467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s17YssV/eLMk3v6BQw21PztJLVQ1uDSUDnGyHA0nJic=;
        b=fruoCfaaQVI/mQMPshf7b39Z7FEUmhj9s2K+SGFsy624Myi3OVbXS2feHEWscoZMHf
         t3+h+9OH7xWx8v8lWbrlGR54/gp+0pLfuMvB5L7ULzBDgQJZKlofaEXb1FuGiobSYM2N
         Vx/XR6KCA2XpVMkh/4VdpMojyMVwhSRgtRTotK1+oa2yOa0APoZ8UHwQkLQDDCn9W3jq
         fpxgVo7boG42ixZT0LjCl6nPcOOunU5A9y5/jbkX5snYYF1joCu6djyLBY6lFv7tp3eC
         gx87cMdoonsdLO1hKfdiihUgFHFZ3SX5D6hRN6UKMJqgdWOzw6Pcxk7IZHAh2Z946m3p
         0s8A==
X-Gm-Message-State: AOJu0YwCY2L9lb/kGpDHSvbyM6PLyvM1bdUCV7NZmc8HcS/QaJLNSDBH
	szLoJEZKqK8klTI84BGGt1zcZzGJPOI=
X-Google-Smtp-Source: AGHT+IFqXVMaW5EWUR3sn7RRHAULv1S9Ax+JzluU+Y462jgw29bgpZAEkbL739S68Hx7QOlYkiFqSLcGAUw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4cf:b0:d7f:f3e:74ab with SMTP id
 v15-20020a05690204cf00b00d7f0f3e74abmr227961ybs.1.1695052667494; Mon, 18 Sep
 2023 08:57:47 -0700 (PDT)
Date: Mon, 18 Sep 2023 08:57:45 -0700
In-Reply-To: <9925e01b-7fa9-95e4-dc21-1d760ef9cde4@linux.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-11-seanjc@google.com>
 <9925e01b-7fa9-95e4-dc21-1d760ef9cde4@linux.intel.com>
Message-ID: <ZQhzeQLbB5zz2yIc@google.com>
Subject: Re: [RFC PATCH v12 10/33] KVM: Set the stage for handling only shared
 mappings in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_165753_919901_C17DCC5F 
X-CRM114-Status: UNSURE (   9.38  )
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

On Mon, Sep 18, 2023, Binbin Wu wrote:
> 
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifier
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> > 
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> 
> How to understand the word "stage" in short log?

Sorry, it's an idiom[*] that essentially means "to prepare for".  I'll rephrase
the shortlog to be more straightforward (I have a bad habit of using idioms).

[*] https://dictionary.cambridge.org/us/dictionary/english/set-the-stage-for

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
